API_DASHBOARD=../api-dashboard
API_ADMIN=../api-admin
GRPC_AUTH=../grpc-auth
GRPC_INVENTORY=../grpc-inventory
GRPC_NOTIFICATIONS=../grpc-notifications
GRPC_OFFERINGS=../grpc-offerings
GRPC_ORDERS=../grpc-orders
GRPC_PAYMENTS=../grpc-payments
GRPC_USERS=../grpc-users

.PHONY: install
install:
	rm -rf ${API_DASHBOARD}/node_modules && rm ${API_DASHBOARD}/package-lock.json && npm install --prefix ${API_DASHBOARD}
	rm -rf ${API_ADMIN}/node_modules && rm ${API_ADMIN}/package-lock.json && npm install --prefix ${API_ADMIN}
	rm -rf ${GRPC_AUTH}/node_modules && rm ${GRPC_AUTH}/package-lock.json && npm install --prefix ${GRPC_AUTH}
	rm -rf ${GRPC_INVENTORY}/node_modules && rm ${GRPC_INVENTORY}/package-lock.json && npm install --prefix ${GRPC_INVENTORY}
	rm -rf ${GRPC_NOTIFICATIONS}/node_modules && rm ${GRPC_NOTIFICATIONS}/package-lock.json && npm install --prefix ${GRPC_NOTIFICATIONS}
	rm -rf ${GRPC_OFFERINGS}/node_modules && rm ${GRPC_OFFERINGS}/package-lock.json && npm install --prefix ${GRPC_OFFERINGS}
	rm -rf ${GRPC_ORDERS}/node_modules && rm ${GRPC_ORDERS}/package-lock.json && npm install --prefix ${GRPC_ORDERS}
	rm -rf ${GRPC_PAYMENTS}/node_modules && rm ${GRPC_PAYMENTS}/package-lock.json && npm install --prefix ${GRPC_PAYMENTS}

.PHONY: build
build:
	docker-compose -f compose/docker-compose.api-dashboard.yml \
	-f compose/docker-compose.api-admin.yml \
	-f compose/docker-compose.grpc-auth.yml \
	-f compose/docker-compose.grpc-inventory.yml \
	-f compose/docker-compose.grpc-notifications.yml \
	-f compose/docker-compose.grpc-offerings.yml \
	-f compose/docker-compose.grpc-orders.yml \
	-f compose/docker-compose.grpc-payments.yml \
	-f compose/docker-compose.grpc-users.yml \
	up --build --remove-orphans

.PHONY: down
down:
	-docker stop compose_kimby-api-dashboard_1
	-docker rm compose_kimby-api-dashboard_1
	-docker stop compose_kimby-api-admin_1
	-docker rm compose_kimby-api-admin_1
	-docker stop compose_kimby-grpc-auth_1
	-docker rm compose_kimby-grpc-auth_1
	-docker stop compose_kimby-grpc-inventory_1
	-docker rm compose_kimby-grpc-inventory_1
	-docker stop compose_kimby-grpc-notifications_1
	-docker rm compose_kimby-grpc-notifications_1
	-docker stop compose_kimby-grpc-offerings_1
	-docker rm compose_kimby-grpc-offerings_1
	-docker stop compose_kimby-grpc-orders_1
	-docker rm compose_kimby-grpc-orders_1
	-docker stop compose_kimby-grpc-payments_1
	-docker rm compose_kimby-grpc-payments_1
	-docker stop compose_kimby-grpc-users_1
	-docker rm compose_kimby-grpc-users_1
	-docker stop compose_kimby-mongo_1
	-docker rm compose_kimby-mongo_1
	-docker stop compose_kimby-mongo-express_1
	-docker rm compose_kimby-mongo-express_1
	-docker stop compose_kimby-mongo-redis_1
	-docker rm compose_kimby-mongo-redis_1