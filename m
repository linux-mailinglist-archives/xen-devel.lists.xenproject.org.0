Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9424F90A3F2
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 08:07:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.741650.1148312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ5Wf-0006I0-Dj; Mon, 17 Jun 2024 06:07:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 741650.1148312; Mon, 17 Jun 2024 06:07:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ5Wf-0006DJ-5S; Mon, 17 Jun 2024 06:07:33 +0000
Received: by outflank-mailman (input) for mailman id 741650;
 Mon, 17 Jun 2024 06:07:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvID=NT=bombadil.srs.infradead.org=BATV+625ba2f6da96caf54eae+7603+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1sJ5WN-0001PY-0k
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 06:07:15 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d68f050f-2c6f-11ef-b4bb-af5377834399;
 Mon, 17 Jun 2024 08:07:13 +0200 (CEST)
Received: from [91.187.204.140] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1sJ5W6-00000009JIp-3zn2; Mon, 17 Jun 2024 06:06:59 +0000
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
X-Inumbo-ID: d68f050f-2c6f-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=PjgmwXiuV7FK2oQNFsskA59bpZQJKHy+bIXVC2fbd1Q=; b=HmokhAbNsUwq3jroNUoAcMYSzq
	1cRhouiA75QpEX4Y0Dohtt+ivS+0KLmBEm4FmWj9AfwENORhjsIGXQ6hlJgQhEWyjOok5tgvx/tX1
	EURIY70h6RrJf+AWaj16GxivXHK/cjqhTaVfyngD0w8g58/BZ+hLOqf3H1HL10dnJNN+V7kLntlgl
	yC1dVGPbGVOx7q7y2xwIwq8WuH46RFqrMZFZFx2+uHSL+X46iOqfjxlB6RH/oqzEqYr354u18u/w2
	XDF2ZMyCP3VNUY7KheadJdNP5wJfg1ZIP+A4py4zEiAweFI6VH+k0GIge/QIa/enI9VYvltd84q17
	H414Zy+w==;
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Richard Weinberger <richard@nod.at>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Ming Lei <ming.lei@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Song Liu <song@kernel.org>,
	Yu Kuai <yukuai3@huawei.com>,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-m68k@lists.linux-m68k.org,
	linux-um@lists.infradead.org,
	drbd-dev@lists.linbit.com,
	nbd@other.debian.org,
	linuxppc-dev@lists.ozlabs.org,
	ceph-devel@vger.kernel.org,
	virtualization@lists.linux.dev,
	xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org,
	dm-devel@lists.linux.dev,
	linux-raid@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	nvdimm@lists.linux.dev,
	linux-nvme@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-block@vger.kernel.org,
	Damien Le Moal <dlemoal@kernel.org>
Subject: [PATCH 26/26] block: move the bounce flag into the features field
Date: Mon, 17 Jun 2024 08:04:53 +0200
Message-ID: <20240617060532.127975-27-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240617060532.127975-1-hch@lst.de>
References: <20240617060532.127975-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Move the bounce flag into the features field to reclaim a little bit of
space.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
 block/blk-settings.c    | 1 -
 block/blk.h             | 2 +-
 drivers/scsi/scsi_lib.c | 2 +-
 include/linux/blkdev.h  | 6 ++++--
 4 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/block/blk-settings.c b/block/blk-settings.c
index 96e07f24bd9aa1..d0e9096f93ca8a 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -479,7 +479,6 @@ int blk_stack_limits(struct queue_limits *t, struct queue_limits *b,
 					b->max_write_zeroes_sectors);
 	t->max_zone_append_sectors = min(queue_limits_max_zone_append_sectors(t),
 					 queue_limits_max_zone_append_sectors(b));
-	t->bounce = max(t->bounce, b->bounce);
 
 	t->seg_boundary_mask = min_not_zero(t->seg_boundary_mask,
 					    b->seg_boundary_mask);
diff --git a/block/blk.h b/block/blk.h
index 79e8d5d4fe0caf..fa32f7fad5d7e6 100644
--- a/block/blk.h
+++ b/block/blk.h
@@ -394,7 +394,7 @@ struct bio *__blk_queue_bounce(struct bio *bio, struct request_queue *q);
 static inline bool blk_queue_may_bounce(struct request_queue *q)
 {
 	return IS_ENABLED(CONFIG_BOUNCE) &&
-		q->limits.bounce == BLK_BOUNCE_HIGH &&
+		(q->limits.features & BLK_FEAT_BOUNCE_HIGH) &&
 		max_low_pfn >= max_pfn;
 }
 
diff --git a/drivers/scsi/scsi_lib.c b/drivers/scsi/scsi_lib.c
index 54f771ec8cfb5e..e2f7bfb2b9e450 100644
--- a/drivers/scsi/scsi_lib.c
+++ b/drivers/scsi/scsi_lib.c
@@ -1986,7 +1986,7 @@ void scsi_init_limits(struct Scsi_Host *shost, struct queue_limits *lim)
 		shost->dma_alignment, dma_get_cache_alignment() - 1);
 
 	if (shost->no_highmem)
-		lim->bounce = BLK_BOUNCE_HIGH;
+		lim->features |= BLK_FEAT_BOUNCE_HIGH;
 
 	dma_set_seg_boundary(dev, shost->dma_boundary);
 	dma_set_max_seg_size(dev, shost->max_segment_size);
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 2c433ebf6f2030..e96ba7b97288d2 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -325,6 +325,9 @@ enum {
 
 	/* skip this queue in blk_mq_(un)quiesce_tagset */
 	BLK_FEAT_SKIP_TAGSET_QUIESCE		= (1u << 13),
+
+	/* bounce all highmem pages */
+	BLK_FEAT_BOUNCE_HIGH			= (1u << 14),
 };
 
 /*
@@ -332,7 +335,7 @@ enum {
  */
 #define BLK_FEAT_INHERIT_MASK \
 	(BLK_FEAT_WRITE_CACHE | BLK_FEAT_FUA | BLK_FEAT_ROTATIONAL | \
-	 BLK_FEAT_STABLE_WRITES | BLK_FEAT_ZONED)
+	 BLK_FEAT_STABLE_WRITES | BLK_FEAT_ZONED | BLK_FEAT_BOUNCE_HIGH)
 
 /* internal flags in queue_limits.flags */
 enum {
@@ -352,7 +355,6 @@ enum blk_bounce {
 struct queue_limits {
 	unsigned int		features;
 	unsigned int		flags;
-	enum blk_bounce		bounce;
 	unsigned long		seg_boundary_mask;
 	unsigned long		virt_boundary_mask;
 
-- 
2.43.0


