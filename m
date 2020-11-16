Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAD42B48CF
	for <lists+xen-devel@lfdr.de>; Mon, 16 Nov 2020 16:12:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.28293.57441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kegAh-0007b7-Ew; Mon, 16 Nov 2020 15:11:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 28293.57441; Mon, 16 Nov 2020 15:11:58 +0000
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
	id 1kegAg-0007V7-0T; Mon, 16 Nov 2020 15:11:58 +0000
Received: by outflank-mailman (input) for mailman id 28293;
 Mon, 16 Nov 2020 15:11:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DM7u=EW=casper.srs.infradead.org=batv+29a21e8ca386e11a5a78+6294+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1keg2B-0006ni-8n
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 15:03:11 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 05399526-000e-43e5-a4d1-f85a6c61ce3f;
 Mon, 16 Nov 2020 14:59:36 +0000 (UTC)
Received: from [2001:4bb8:180:6600:255b:7def:a93:4a09] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kefyU-00043H-JC; Mon, 16 Nov 2020 14:59:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=DM7u=EW=casper.srs.infradead.org=batv+29a21e8ca386e11a5a78+6294+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1keg2B-0006ni-8n
	for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 15:03:11 +0000
X-Inumbo-ID: 05399526-000e-43e5-a4d1-f85a6c61ce3f
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 05399526-000e-43e5-a4d1-f85a6c61ce3f;
	Mon, 16 Nov 2020 14:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=G/1St6AKcpua/c8qIsi4IENao5SAFeNTsicWvdwJGKA=; b=cAGojbspvBWLkhCqOD3ExDenEy
	hsbkbexTXugOliCWH3wwCYbwxpTnVtQvHgLrTwVXI7TrPcURLYokj4yyAxwxnnG9BNHdwGnWa8IJp
	dYa+F3Gfpccic7jbe1Y8gwBkRHM+oEunUjIG3WI5m5UONDYn9V9VBRbIHSxNQhGM/1JRKjD49Xkx0
	0pBHsNUFU/UPntTwF6P/GQ0sJw5J/q2+RSCrhYYdXSuMK/KdhdMuk9LCQiscZHIVOefv7v6KYkI86
	OblDiO3zLuOm232EWEv9/powerW9w8u+EGbE5WQyTuk7Cg+xA59dLIs/S/NWj2DLWnBN8UoHAueaN
	ZQN++kOA==;
Received: from [2001:4bb8:180:6600:255b:7def:a93:4a09] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kefyU-00043H-JC; Mon, 16 Nov 2020 14:59:23 +0000
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
	linux-fsdevel@vger.kernel.org,
	Hannes Reinecke <hare@suse.de>
Subject: [PATCH 51/78] z2ram: use separate gendisk for the different modes
Date: Mon, 16 Nov 2020 15:57:42 +0100
Message-Id: <20201116145809.410558-52-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201116145809.410558-1-hch@lst.de>
References: <20201116145809.410558-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Use separate gendisks (which share a tag_set) for the different operating
modes instead of redirecting the gendisk lookup using a probe callback.
This avoids potential problems with aliased block_device instances and
will eventually allow for removing the blk_register_region framework.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Hannes Reinecke <hare@suse.de>
---
 drivers/block/z2ram.c | 100 ++++++++++++++++++++++++------------------
 1 file changed, 58 insertions(+), 42 deletions(-)

diff --git a/drivers/block/z2ram.c b/drivers/block/z2ram.c
index eafecc9a72b38d..c1d20818e64920 100644
--- a/drivers/block/z2ram.c
+++ b/drivers/block/z2ram.c
@@ -63,7 +63,7 @@ static int current_device = -1;
 
 static DEFINE_SPINLOCK(z2ram_lock);
 
-static struct gendisk *z2ram_gendisk;
+static struct gendisk *z2ram_gendisk[Z2MINOR_COUNT];
 
 static blk_status_t z2_queue_rq(struct blk_mq_hw_ctx *hctx,
 				const struct blk_mq_queue_data *bd)
@@ -283,7 +283,7 @@ static int z2_open(struct block_device *bdev, fmode_t mode)
 
 		current_device = device;
 		z2ram_size <<= Z2RAM_CHUNKSHIFT;
-		set_capacity(z2ram_gendisk, z2ram_size >> 9);
+		set_capacity(z2ram_gendisk[device], z2ram_size >> 9);
 	}
 
 	mutex_unlock(&z2ram_mutex);
@@ -315,71 +315,87 @@ static const struct block_device_operations z2_fops = {
 	.release = z2_release,
 };
 
-static struct kobject *z2_find(dev_t dev, int *part, void *data)
-{
-	*part = 0;
-	return get_disk_and_module(z2ram_gendisk);
-}
-
-static struct request_queue *z2_queue;
 static struct blk_mq_tag_set tag_set;
 
 static const struct blk_mq_ops z2_mq_ops = {
 	.queue_rq = z2_queue_rq,
 };
 
+static int z2ram_register_disk(int minor)
+{
+	struct request_queue *q;
+	struct gendisk *disk;
+
+	disk = alloc_disk(1);
+	if (!disk)
+		return -ENOMEM;
+
+	q = blk_mq_init_queue(&tag_set);
+	if (IS_ERR(q)) {
+		put_disk(disk);
+		return PTR_ERR(q);
+	}
+
+	disk->major = Z2RAM_MAJOR;
+	disk->first_minor = minor;
+	disk->fops = &z2_fops;
+	if (minor)
+		sprintf(disk->disk_name, "z2ram%d", minor);
+	else
+		sprintf(disk->disk_name, "z2ram");
+	disk->queue = q;
+
+	z2ram_gendisk[minor] = disk;
+	add_disk(disk);
+	return 0;
+}
+
 static int __init z2_init(void)
 {
-	int ret;
+	int ret, i;
 
 	if (!MACH_IS_AMIGA)
 		return -ENODEV;
 
-	ret = -EBUSY;
 	if (register_blkdev(Z2RAM_MAJOR, DEVICE_NAME))
-		goto err;
-
-	ret = -ENOMEM;
-	z2ram_gendisk = alloc_disk(1);
-	if (!z2ram_gendisk)
-		goto out_disk;
-
-	z2_queue = blk_mq_init_sq_queue(&tag_set, &z2_mq_ops, 16,
-					BLK_MQ_F_SHOULD_MERGE);
-	if (IS_ERR(z2_queue)) {
-		ret = PTR_ERR(z2_queue);
-		z2_queue = NULL;
-		goto out_queue;
+		return -EBUSY;
+
+	tag_set.ops = &z2_mq_ops;
+	tag_set.nr_hw_queues = 1;
+	tag_set.nr_maps = 1;
+	tag_set.queue_depth = 16;
+	tag_set.numa_node = NUMA_NO_NODE;
+	tag_set.flags = BLK_MQ_F_SHOULD_MERGE;
+	ret = blk_mq_alloc_tag_set(&tag_set);
+	if (ret)
+		goto out_unregister_blkdev;
+
+	for (i = 0; i < Z2MINOR_COUNT; i++) {
+		ret = z2ram_register_disk(i);
+		if (ret && i == 0)
+			goto out_free_tagset;
 	}
 
-	z2ram_gendisk->major = Z2RAM_MAJOR;
-	z2ram_gendisk->first_minor = 0;
-	z2ram_gendisk->fops = &z2_fops;
-	sprintf(z2ram_gendisk->disk_name, "z2ram");
-
-	z2ram_gendisk->queue = z2_queue;
-	add_disk(z2ram_gendisk);
-	blk_register_region(MKDEV(Z2RAM_MAJOR, 0), Z2MINOR_COUNT, THIS_MODULE,
-			    z2_find, NULL, NULL);
-
 	return 0;
 
-out_queue:
-	put_disk(z2ram_gendisk);
-out_disk:
+out_free_tagset:
+	blk_mq_free_tag_set(&tag_set);
+out_unregister_blkdev:
 	unregister_blkdev(Z2RAM_MAJOR, DEVICE_NAME);
-err:
 	return ret;
 }
 
 static void __exit z2_exit(void)
 {
 	int i, j;
-	blk_unregister_region(MKDEV(Z2RAM_MAJOR, 0), Z2MINOR_COUNT);
+
 	unregister_blkdev(Z2RAM_MAJOR, DEVICE_NAME);
-	del_gendisk(z2ram_gendisk);
-	put_disk(z2ram_gendisk);
-	blk_cleanup_queue(z2_queue);
+
+	for (i = 0; i < Z2MINOR_COUNT; i++) {
+		del_gendisk(z2ram_gendisk[i]);
+		blk_cleanup_queue(z2ram_gendisk[i]->queue);
+		put_disk(z2ram_gendisk[i]);
+	}
 	blk_mq_free_tag_set(&tag_set);
 
 	if (current_device != -1) {
-- 
2.29.2


