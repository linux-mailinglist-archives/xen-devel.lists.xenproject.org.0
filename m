Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1389785D88A
	for <lists+xen-devel@lfdr.de>; Wed, 21 Feb 2024 13:59:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684017.1063691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcmBo-0000KT-Is; Wed, 21 Feb 2024 12:59:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684017.1063691; Wed, 21 Feb 2024 12:59:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcmBo-0000H9-EM; Wed, 21 Feb 2024 12:59:08 +0000
Received: by outflank-mailman (input) for mailman id 684017;
 Wed, 21 Feb 2024 12:59:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RCxi=J6=bombadil.srs.infradead.org=BATV+bafd7931fd2c4139f05c+7486+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1rcmBm-0007bV-D7
 for xen-devel@lists.xenproject.org; Wed, 21 Feb 2024 12:59:06 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd65de6c-d0b8-11ee-98f5-efadbce2ee36;
 Wed, 21 Feb 2024 13:59:04 +0100 (CET)
Received: from
 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1rcmBi-00000000wH4-0Pli; Wed, 21 Feb 2024 12:59:02 +0000
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
X-Inumbo-ID: fd65de6c-d0b8-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=ClBF4HdQdZoudt8WElKT+rvsm/9JyMAWyPnUsdGhZ5c=; b=ry/NuscqMOGf4bi5P73rmAi3BH
	HPoTpm+PFte7RXlBzNZupzOIuXurSaaiEbm7qy2KuV5KMgJL3CPZuQMX1HLYQyx/jVc+0q+oXo8fo
	Nh2XDSwkDhKLq7tbFoWLG3kjAQH9wMcD73ZcKyntH/or0abk3OAITizpF0SN9pdXfOeWQ54zRv5CQ
	DPgkDcE6AjceQ9WSGqjn65FdYSPyX9yfkdIUQXV0t3IW9gUy9aNDzxLlYjGDsAADdGNpJScdisyXl
	r/WFMicA2TDsJU1Wmk49a8HpuK1aXbcTK24bvDfDQcI1BmbfauN+fS4N4/BSWPNHMjmO/jDL3yAFv
	eJI5G3hA==;
From: Christoph Hellwig <hch@lst.de>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>,
	xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org
Subject: [PATCH 4/4] xen-blkfront: atomically update queue limits
Date: Wed, 21 Feb 2024 13:58:45 +0100
Message-Id: <20240221125845.3610668-5-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240221125845.3610668-1-hch@lst.de>
References: <20240221125845.3610668-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Pass the initial queue limits to blk_mq_alloc_disk and use the
blkif_set_queue_limits API to update the limits on reconnect.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
---
 drivers/block/xen-blkfront.c | 41 ++++++++++++++++++++----------------
 1 file changed, 23 insertions(+), 18 deletions(-)

diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
index 7664638a0abbfa..fd7c0ff2139cee 100644
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -941,37 +941,35 @@ static const struct blk_mq_ops blkfront_mq_ops = {
 	.complete = blkif_complete_rq,
 };
 
-static void blkif_set_queue_limits(struct blkfront_info *info)
+static void blkif_set_queue_limits(const struct blkfront_info *info,
+		struct queue_limits *lim)
 {
-	struct request_queue *rq = info->rq;
 	unsigned int segments = info->max_indirect_segments ? :
 				BLKIF_MAX_SEGMENTS_PER_REQUEST;
 
-	blk_queue_flag_set(QUEUE_FLAG_VIRT, rq);
-
 	if (info->feature_discard) {
-		blk_queue_max_discard_sectors(rq, UINT_MAX);
+		lim->max_hw_discard_sectors = UINT_MAX;
 		if (info->discard_granularity)
-			rq->limits.discard_granularity = info->discard_granularity;
-		rq->limits.discard_alignment = info->discard_alignment;
+			lim->discard_granularity = info->discard_granularity;
+		lim->discard_alignment = info->discard_alignment;
 		if (info->feature_secdiscard)
-			blk_queue_max_secure_erase_sectors(rq, UINT_MAX);
+			lim->max_secure_erase_sectors = UINT_MAX;
 	}
 
 	/* Hard sector size and max sectors impersonate the equiv. hardware. */
-	blk_queue_logical_block_size(rq, info->sector_size);
-	blk_queue_physical_block_size(rq, info->physical_sector_size);
-	blk_queue_max_hw_sectors(rq, (segments * XEN_PAGE_SIZE) / 512);
+	lim->logical_block_size = info->sector_size;
+	lim->physical_block_size = info->physical_sector_size;
+	lim->max_hw_sectors = (segments * XEN_PAGE_SIZE) / 512;
 
 	/* Each segment in a request is up to an aligned page in size. */
-	blk_queue_segment_boundary(rq, PAGE_SIZE - 1);
-	blk_queue_max_segment_size(rq, PAGE_SIZE);
+	lim->seg_boundary_mask = PAGE_SIZE - 1;
+	lim->max_segment_size = PAGE_SIZE;
 
 	/* Ensure a merged request will fit in a single I/O ring slot. */
-	blk_queue_max_segments(rq, segments / GRANTS_PER_PSEG);
+	lim->max_segments = segments / GRANTS_PER_PSEG;
 
 	/* Make sure buffer addresses are sector-aligned. */
-	blk_queue_dma_alignment(rq, 511);
+	lim->dma_alignment = 511;
 }
 
 static const char *flush_info(struct blkfront_info *info)
@@ -1068,6 +1066,7 @@ static int xlvbd_alloc_gendisk(blkif_sector_t capacity,
 		struct blkfront_info *info, u16 sector_size,
 		unsigned int physical_sector_size)
 {
+	struct queue_limits lim = {};
 	struct gendisk *gd;
 	int nr_minors = 1;
 	int err;
@@ -1134,11 +1133,13 @@ static int xlvbd_alloc_gendisk(blkif_sector_t capacity,
 	if (err)
 		goto out_release_minors;
 
-	gd = blk_mq_alloc_disk(&info->tag_set, NULL, info);
+	blkif_set_queue_limits(info, &lim);
+	gd = blk_mq_alloc_disk(&info->tag_set, &lim, info);
 	if (IS_ERR(gd)) {
 		err = PTR_ERR(gd);
 		goto out_free_tag_set;
 	}
+	blk_queue_flag_set(QUEUE_FLAG_VIRT, gd->queue);
 
 	strcpy(gd->disk_name, DEV_NAME);
 	ptr = encode_disk_name(gd->disk_name + sizeof(DEV_NAME) - 1, offset);
@@ -1160,7 +1161,6 @@ static int xlvbd_alloc_gendisk(blkif_sector_t capacity,
 	info->gd = gd;
 	info->sector_size = sector_size;
 	info->physical_sector_size = physical_sector_size;
-	blkif_set_queue_limits(info);
 
 	xlvbd_flush(info);
 
@@ -2004,14 +2004,19 @@ static int blkfront_probe(struct xenbus_device *dev,
 
 static int blkif_recover(struct blkfront_info *info)
 {
+	struct queue_limits lim;
 	unsigned int r_index;
 	struct request *req, *n;
 	int rc;
 	struct bio *bio;
 	struct blkfront_ring_info *rinfo;
 
+	lim = queue_limits_start_update(info->rq);
 	blkfront_gather_backend_features(info);
-	blkif_set_queue_limits(info);
+	blkif_set_queue_limits(info, &lim);
+	rc = queue_limits_commit_update(info->rq, &lim);
+	if (rc)
+		return rc;
 
 	for_each_rinfo(info, rinfo, r_index) {
 		rc = blkfront_setup_indirect(rinfo);
-- 
2.39.2


