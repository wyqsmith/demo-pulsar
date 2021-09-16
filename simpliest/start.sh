docker-compose up -d

sleep 30

docker exec -t simpliest_pulsar_1 bin/pulsar-admin clusters update standalone --url http://172.16.1.220:8080

CSRF_TOKEN=$(curl http://172.16.1.220:7750/pulsar-manager/csrf-token)
curl \
   -H 'X-XSRF-TOKEN: $CSRF_TOKEN' \
   -H 'Cookie: XSRF-TOKEN=$CSRF_TOKEN;' \
   -H "Content-Type: application/json" \
   -X PUT http://172.16.1.220:7750/pulsar-manager/users/superuser \
   -d '{"name": "admin", "password": "apachepulsar", "description": "test", "email": "username@test.org"}'
