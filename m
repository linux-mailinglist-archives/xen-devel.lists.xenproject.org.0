Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 128982AEBED
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 09:30:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24455.51826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kclW8-0005Fj-GI; Wed, 11 Nov 2020 08:30:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24455.51826; Wed, 11 Nov 2020 08:30:12 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kclW8-0005Dm-6M; Wed, 11 Nov 2020 08:30:12 +0000
Received: by outflank-mailman (input) for mailman id 24455;
 Wed, 11 Nov 2020 08:30:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kJD9=ER=casper.srs.infradead.org=batv+33c89f8a75624a8d62ce+6289+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1kclUG-0002dF-IE
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 08:28:16 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ba0bac8c-b5c4-4394-97d4-91a256199013;
 Wed, 11 Nov 2020 08:27:28 +0000 (UTC)
Received: from [2001:4bb8:180:6600:bcde:334f:863c:27b8] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kclTD-0007b7-Eu; Wed, 11 Nov 2020 08:27:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=kJD9=ER=casper.srs.infradead.org=batv+33c89f8a75624a8d62ce+6289+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1kclUG-0002dF-IE
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 08:28:16 +0000
X-Inumbo-ID: ba0bac8c-b5c4-4394-97d4-91a256199013
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ba0bac8c-b5c4-4394-97d4-91a256199013;
	Wed, 11 Nov 2020 08:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=7BWzzM1ONnukKsMJYvFCtkh7Po4ojUIcRAoXEXZQpls=; b=RCXh8hHVKHOdlbTgZudBE0UgxQ
	OdZbQcCl+Yq46gbMhWR8GVkt7ot75syMIyMmRVs70SjQ1O8I3Qml7eCC8UgjmLw+eZKo3Y+wA2Jn3
	swdtiCKDiqLib1ChlnI43270zWz+HESqHy3CFg19CGNjMaZmfyCASYpR/6tWH4C8l/mB79/1BSWgs
	puiFVbzfVm1so5b0mSiZ9Ei1//wgG5uEkaKOW5zYLA6lZYmZLWg1vlPvHI0aYLKiQl40RWCE1w1Is
	2SNvkcNq6XAtQw8IczEREzWr5hvM924WJzBVkrt1lqmXha4587UsPlSaCJVXmHuHTxzWvnOewG4Qb
	h8NmpJFw==;
Received: from [2001:4bb8:180:6600:bcde:334f:863c:27b8] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kclTD-0007b7-Eu; Wed, 11 Nov 2020 08:27:11 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Justin Sanders <justin@coraid.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Ilya Dryomov <idryomov@gmail.com>,
	Jack Wang <jinpu.wang@cloud.ionos.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Minchan Kim <minchan@kernel.org>,
	Mike Snitzer <snitzer@redhat.com>,
	Song Liu <song@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	dm-devel@redhat.com,
	linux-block@vger.kernel.org,
	drbd-dev@lists.linbit.com,
	nbd@other.debian.org,
	ceph-devel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-raid@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 10/24] nbd: validate the block size in nbd_set_size
Date: Wed, 11 Nov 2020 09:26:44 +0100
Message-Id: <20201111082658.3401686-11-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201111082658.3401686-1-hch@lst.de>
References: <20201111082658.3401686-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Move the validation of the block from the callers into nbd_set_size.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Josef Bacik <josef@toxicpanda.com>
---
 drivers/block/nbd.c | 47 +++++++++++++++------------------------------
 1 file changed, 15 insertions(+), 32 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index eb8a5da48ad75a..327060e01ad58e 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -296,16 +296,21 @@ static void nbd_size_clear(struct nbd_device *nbd)
 	}
 }
 
-static void nbd_set_size(struct nbd_device *nbd, loff_t bytesize,
+static int nbd_set_size(struct nbd_device *nbd, loff_t bytesize,
 		loff_t blksize)
 {
 	struct block_device *bdev;
 
+	if (!blksize)
+		blksize = NBD_DEF_BLKSIZE;
+	if (blksize < 512 || blksize > PAGE_SIZE || !is_power_of_2(blksize))
+		return -EINVAL;
+
 	nbd->config->bytesize = bytesize;
 	nbd->config->blksize = blksize;
 
 	if (!nbd->task_recv)
-		return;
+		return 0;
 
 	if (nbd->config->flags & NBD_FLAG_SEND_TRIM) {
 		nbd->disk->queue->limits.discard_granularity = blksize;
@@ -325,6 +330,7 @@ static void nbd_set_size(struct nbd_device *nbd, loff_t bytesize,
 		bdput(bdev);
 	}
 	kobject_uevent(&nbd_to_dev(nbd)->kobj, KOBJ_CHANGE);
+	return 0;
 }
 
 static void nbd_complete_rq(struct request *req)
@@ -1304,8 +1310,7 @@ static int nbd_start_device(struct nbd_device *nbd)
 		args->index = i;
 		queue_work(nbd->recv_workq, &args->work);
 	}
-	nbd_set_size(nbd, config->bytesize, config->blksize);
-	return error;
+	return nbd_set_size(nbd, config->bytesize, config->blksize);
 }
 
 static int nbd_start_device_ioctl(struct nbd_device *nbd, struct block_device *bdev)
@@ -1347,14 +1352,6 @@ static void nbd_clear_sock_ioctl(struct nbd_device *nbd,
 		nbd_config_put(nbd);
 }
 
-static bool nbd_is_valid_blksize(unsigned long blksize)
-{
-	if (!blksize || !is_power_of_2(blksize) || blksize < 512 ||
-	    blksize > PAGE_SIZE)
-		return false;
-	return true;
-}
-
 static void nbd_set_cmd_timeout(struct nbd_device *nbd, u64 timeout)
 {
 	nbd->tag_set.timeout = timeout * HZ;
@@ -1379,19 +1376,12 @@ static int __nbd_ioctl(struct block_device *bdev, struct nbd_device *nbd,
 	case NBD_SET_SOCK:
 		return nbd_add_socket(nbd, arg, false);
 	case NBD_SET_BLKSIZE:
-		if (!arg)
-			arg = NBD_DEF_BLKSIZE;
-		if (!nbd_is_valid_blksize(arg))
-			return -EINVAL;
-		nbd_set_size(nbd, config->bytesize, arg);
-		return 0;
+		return nbd_set_size(nbd, config->bytesize, arg);
 	case NBD_SET_SIZE:
-		nbd_set_size(nbd, arg, config->blksize);
-		return 0;
+		return nbd_set_size(nbd, arg, config->blksize);
 	case NBD_SET_SIZE_BLOCKS:
-		nbd_set_size(nbd, arg * config->blksize,
-			     config->blksize);
-		return 0;
+		return nbd_set_size(nbd, arg * config->blksize,
+				    config->blksize);
 	case NBD_SET_TIMEOUT:
 		nbd_set_cmd_timeout(nbd, arg);
 		return 0;
@@ -1808,18 +1798,11 @@ static int nbd_genl_size_set(struct genl_info *info, struct nbd_device *nbd)
 	if (info->attrs[NBD_ATTR_SIZE_BYTES])
 		bytes = nla_get_u64(info->attrs[NBD_ATTR_SIZE_BYTES]);
 
-	if (info->attrs[NBD_ATTR_BLOCK_SIZE_BYTES]) {
+	if (info->attrs[NBD_ATTR_BLOCK_SIZE_BYTES])
 		bsize = nla_get_u64(info->attrs[NBD_ATTR_BLOCK_SIZE_BYTES]);
-		if (!bsize)
-			bsize = NBD_DEF_BLKSIZE;
-		if (!nbd_is_valid_blksize(bsize)) {
-			printk(KERN_ERR "Invalid block size %llu\n", bsize);
-			return -EINVAL;
-		}
-	}
 
 	if (bytes != config->bytesize || bsize != config->blksize)
-		nbd_set_size(nbd, bytes, bsize);
+		return nbd_set_size(nbd, bytes, bsize);
 	return 0;
 }
 
-- 
2.28.0


