CURDIR=$(pwd)
[[ $1 == \/* ]] && DISTDIR=$1 || DISTDIR=$CURDIR/$1
docker rm s3ish  > /dev/null
echo "Starting server on port 9001"
docker run \
  --name s3ish \
  -v $CURDIR/nginx.conf:/etc/nginx/nginx.conf:ro \
  -v $DISTDIR:/usr/share/nginx/html:ro \
  -p 9001:80 nginx

