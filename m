Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E0C398284
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jun 2021 09:03:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135558.251897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loKug-0002iW-3F; Wed, 02 Jun 2021 07:03:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135558.251897; Wed, 02 Jun 2021 07:03:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loKuf-0002Pv-D9; Wed, 02 Jun 2021 07:03:37 +0000
Received: by outflank-mailman (input) for mailman id 135558;
 Wed, 02 Jun 2021 07:03:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PwRf=K4=bombadil.srs.infradead.org=batv+e38fb55258da4e18a096+6492+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1loKpj-0007A2-Az
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 06:58:31 +0000
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7b141df7-66ac-474d-b20d-54e51929abcb;
 Wed, 02 Jun 2021 06:56:17 +0000 (UTC)
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loKnA-0026PT-6J; Wed, 02 Jun 2021 06:55:53 +0000
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
X-Inumbo-ID: 7b141df7-66ac-474d-b20d-54e51929abcb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=3eCT5ADUsi1wXGQC5ROk8G/iPsdy5HF5nCZ/CzuEH9g=; b=CHpdvSdDQx2S7VBfw36yFJIOKW
	u3raTq1dP6Gu10/PJ+IzNfdJsTGDfodiKpWnXSrAPsiiXAil4FixRR4LHQx/r2/2WajLehYqseurF
	+SXOVenwMIEvShMpPI3TV0igiPSTDc1jus2MS134mkHJE4fSKWXJgTMpWUETOWUQR+sQvpcZNrvGr
	ImONWbqeM3vG4waS2LyqljTVK2xihrO+4vFy94tUR5AZHm4zAb5VJXdTbeKyJ5b1ZyVapnUITJgc0
	rAK1o1WbLZZ2lIkx0tqU86DqYL3xaSap2ZyjXquU1Hz/pJyGXKGtlKYDaGKwU57VNJwF/m1NojREe
	Jk3wMbUQ==;
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Justin Sanders <justin@coraid.com>,
	Denis Efremov <efremov@linux.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Tim Waugh <tim@cyberelk.net>,
	Geoff Levand <geoff@infradead.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Jack Wang <jinpu.wang@ionos.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Mike Snitzer <snitzer@redhat.com>,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Alex Dubov <oakad@yahoo.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	dm-devel@redhat.com,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linuxppc-dev@lists.ozlabs.org,
	ceph-devel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org,
	linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-s390@vger.kernel.org
Subject: [PATCH 26/30] ubi: use blk_mq_alloc_disk and blk_cleanup_disk
Date: Wed,  2 Jun 2021 09:53:41 +0300
Message-Id: <20210602065345.355274-27-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210602065345.355274-1-hch@lst.de>
References: <20210602065345.355274-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Use blk_mq_alloc_disk and blk_cleanup_disk to simplify the gendisk and
request_queue allocation.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/mtd/ubi/block.c | 68 ++++++++++++++++++-----------------------
 1 file changed, 29 insertions(+), 39 deletions(-)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index e1a2ae21dfd3..e003b4b44ffa 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -394,53 +394,46 @@ int ubiblock_create(struct ubi_volume_info *vi)
 	dev->vol_id = vi->vol_id;
 	dev->leb_size = vi->usable_leb_size;
 
+	dev->tag_set.ops = &ubiblock_mq_ops;
+	dev->tag_set.queue_depth = 64;
+	dev->tag_set.numa_node = NUMA_NO_NODE;
+	dev->tag_set.flags = BLK_MQ_F_SHOULD_MERGE;
+	dev->tag_set.cmd_size = sizeof(struct ubiblock_pdu);
+	dev->tag_set.driver_data = dev;
+	dev->tag_set.nr_hw_queues = 1;
+
+	ret = blk_mq_alloc_tag_set(&dev->tag_set);
+	if (ret) {
+		dev_err(disk_to_dev(dev->gd), "blk_mq_alloc_tag_set failed");
+		goto out_free_dev;;
+	}
+
+
 	/* Initialize the gendisk of this ubiblock device */
-	gd = alloc_disk(1);
-	if (!gd) {
-		pr_err("UBI: block: alloc_disk failed\n");
-		ret = -ENODEV;
-		goto out_free_dev;
+	gd = blk_mq_alloc_disk(&dev->tag_set, dev);
+	if (IS_ERR(gd)) {
+		ret = PTR_ERR(gd);
+		goto out_free_tags;
 	}
 
 	gd->fops = &ubiblock_ops;
 	gd->major = ubiblock_major;
+	gd->minors = 1;
 	gd->first_minor = idr_alloc(&ubiblock_minor_idr, dev, 0, 0, GFP_KERNEL);
 	if (gd->first_minor < 0) {
 		dev_err(disk_to_dev(gd),
 			"block: dynamic minor allocation failed");
 		ret = -ENODEV;
-		goto out_put_disk;
+		goto out_cleanup_disk;
 	}
 	gd->private_data = dev;
 	sprintf(gd->disk_name, "ubiblock%d_%d", dev->ubi_num, dev->vol_id);
 	set_capacity(gd, disk_capacity);
 	dev->gd = gd;
 
-	dev->tag_set.ops = &ubiblock_mq_ops;
-	dev->tag_set.queue_depth = 64;
-	dev->tag_set.numa_node = NUMA_NO_NODE;
-	dev->tag_set.flags = BLK_MQ_F_SHOULD_MERGE;
-	dev->tag_set.cmd_size = sizeof(struct ubiblock_pdu);
-	dev->tag_set.driver_data = dev;
-	dev->tag_set.nr_hw_queues = 1;
-
-	ret = blk_mq_alloc_tag_set(&dev->tag_set);
-	if (ret) {
-		dev_err(disk_to_dev(dev->gd), "blk_mq_alloc_tag_set failed");
-		goto out_remove_minor;
-	}
-
-	dev->rq = blk_mq_init_queue(&dev->tag_set);
-	if (IS_ERR(dev->rq)) {
-		dev_err(disk_to_dev(gd), "blk_mq_init_queue failed");
-		ret = PTR_ERR(dev->rq);
-		goto out_free_tags;
-	}
+	dev->rq = gd->queue;
 	blk_queue_max_segments(dev->rq, UBI_MAX_SG_COUNT);
 
-	dev->rq->queuedata = dev;
-	dev->gd->queue = dev->rq;
-
 	/*
 	 * Create one workqueue per volume (per registered block device).
 	 * Rembember workqueues are cheap, they're not threads.
@@ -448,7 +441,7 @@ int ubiblock_create(struct ubi_volume_info *vi)
 	dev->wq = alloc_workqueue("%s", 0, 0, gd->disk_name);
 	if (!dev->wq) {
 		ret = -ENOMEM;
-		goto out_free_queue;
+		goto out_remove_minor;
 	}
 
 	list_add_tail(&dev->list, &ubiblock_devices);
@@ -460,14 +453,12 @@ int ubiblock_create(struct ubi_volume_info *vi)
 	mutex_unlock(&devices_mutex);
 	return 0;
 
-out_free_queue:
-	blk_cleanup_queue(dev->rq);
-out_free_tags:
-	blk_mq_free_tag_set(&dev->tag_set);
 out_remove_minor:
 	idr_remove(&ubiblock_minor_idr, gd->first_minor);
-out_put_disk:
-	put_disk(dev->gd);
+out_cleanup_disk:
+	blk_cleanup_disk(dev->gd);
+out_free_tags:
+	blk_mq_free_tag_set(&dev->tag_set);
 out_free_dev:
 	kfree(dev);
 out_unlock:
@@ -483,11 +474,10 @@ static void ubiblock_cleanup(struct ubiblock *dev)
 	/* Flush pending work */
 	destroy_workqueue(dev->wq);
 	/* Finally destroy the blk queue */
-	blk_cleanup_queue(dev->rq);
-	blk_mq_free_tag_set(&dev->tag_set);
 	dev_info(disk_to_dev(dev->gd), "released");
+	blk_cleanup_disk(dev->gd);
+	blk_mq_free_tag_set(&dev->tag_set);
 	idr_remove(&ubiblock_minor_idr, dev->gd->first_minor);
-	put_disk(dev->gd);
 }
 
 int ubiblock_remove(struct ubi_volume_info *vi)
-- 
2.30.2


