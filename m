Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D0D8D2C01
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 07:06:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731397.1136922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCBVX-0006Pc-N4; Wed, 29 May 2024 05:05:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731397.1136922; Wed, 29 May 2024 05:05:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCBVX-0006MO-IP; Wed, 29 May 2024 05:05:51 +0000
Received: by outflank-mailman (input) for mailman id 731397;
 Wed, 29 May 2024 05:05:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r7nM=NA=bombadil.srs.infradead.org=BATV+c55c297d46ee5715703b+7584+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1sCBVV-0002IP-Uf
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 05:05:49 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b823ee0-1d79-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 07:05:47 +0200 (CEST)
Received: from
 2a02-8389-2341-5b80-7775-b725-99f7-3344.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:7775:b725:99f7:3344] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1sCBVM-00000002piI-0kLX; Wed, 29 May 2024 05:05:40 +0000
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
X-Inumbo-ID: 1b823ee0-1d79-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=1TMBumfZQSCLa0EYYGLQXO2sAaRj0OeR2uXq5/vNYqI=; b=4OJ+9uzIel2bBZHKvc7/v0fiNF
	8DWZKq+syaBMlokn+JA3FU2cVK1QNsQXxBzd2kUJNk8evkXYXMw0nzNpxPewABqpvTUVfTZmrfGMF
	XrkCgBOHvXppmKg/AHpBBN2r0goP8PI58Jw3FeKUkYHfR43gmjpUdjtqzA6wbkIMFiEo4HJgJb7qv
	r2PHE8nND+mLmcjyvzv99wmH4ZG3V/+8SyQKtjDvjKEJvFNIgC1H+OaeREzkpuobPkjG8CUOSUeVa
	mZ1wtKRXN7M5JSWshpDhYlk6H+Vi8LJGAVmryoU8+ajrUFG7/Wb5NbUUCv6cb0lreEVd+S69ZWmsA
	oP6yjPjg==;
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Josef Bacik <josef@toxicpanda.com>,
	Ilya Dryomov <idryomov@gmail.com>,
	Dongsheng Yang <dongsheng.yang@easystack.cn>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	linux-um@lists.infradead.org,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	ceph-devel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-scsi@vger.kernel.org
Subject: [PATCH 11/12] block: remove unused queue limits API
Date: Wed, 29 May 2024 07:04:13 +0200
Message-ID: <20240529050507.1392041-12-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240529050507.1392041-1-hch@lst.de>
References: <20240529050507.1392041-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Remove all APIs that are unused now that sd and sr have been converted
to the atomic queue limits API.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-settings.c   | 190 -----------------------------------------
 include/linux/blkdev.h |  12 ---
 2 files changed, 202 deletions(-)

diff --git a/block/blk-settings.c b/block/blk-settings.c
index a49abdb3554834..0b038729608f4b 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -293,24 +293,6 @@ int queue_limits_set(struct request_queue *q, struct queue_limits *lim)
 }
 EXPORT_SYMBOL_GPL(queue_limits_set);
 
-/**
- * blk_queue_chunk_sectors - set size of the chunk for this queue
- * @q:  the request queue for the device
- * @chunk_sectors:  chunk sectors in the usual 512b unit
- *
- * Description:
- *    If a driver doesn't want IOs to cross a given chunk size, it can set
- *    this limit and prevent merging across chunks. Note that the block layer
- *    must accept a page worth of data at any offset. So if the crossing of
- *    chunks is a hard limitation in the driver, it must still be prepared
- *    to split single page bios.
- **/
-void blk_queue_chunk_sectors(struct request_queue *q, unsigned int chunk_sectors)
-{
-	q->limits.chunk_sectors = chunk_sectors;
-}
-EXPORT_SYMBOL(blk_queue_chunk_sectors);
-
 /**
  * blk_queue_max_discard_sectors - set max sectors for a single discard
  * @q:  the request queue for the device
@@ -352,139 +334,6 @@ void blk_queue_max_write_zeroes_sectors(struct request_queue *q,
 }
 EXPORT_SYMBOL(blk_queue_max_write_zeroes_sectors);
 
-/**
- * blk_queue_max_zone_append_sectors - set max sectors for a single zone append
- * @q:  the request queue for the device
- * @max_zone_append_sectors: maximum number of sectors to write per command
- *
- * Sets the maximum number of sectors allowed for zone append commands. If
- * Specifying 0 for @max_zone_append_sectors indicates that the queue does
- * not natively support zone append operations and that the block layer must
- * emulate these operations using regular writes.
- **/
-void blk_queue_max_zone_append_sectors(struct request_queue *q,
-		unsigned int max_zone_append_sectors)
-{
-	unsigned int max_sectors = 0;
-
-	if (WARN_ON(!blk_queue_is_zoned(q)))
-		return;
-
-	if (max_zone_append_sectors) {
-		max_sectors = min(q->limits.max_hw_sectors,
-				  max_zone_append_sectors);
-		max_sectors = min(q->limits.chunk_sectors, max_sectors);
-
-		/*
-		 * Signal eventual driver bugs resulting in the max_zone_append
-		 * sectors limit being 0 due to the chunk_sectors limit (zone
-		 * size) not set or the max_hw_sectors limit not set.
-		 */
-		WARN_ON_ONCE(!max_sectors);
-	}
-
-	q->limits.max_zone_append_sectors = max_sectors;
-}
-EXPORT_SYMBOL_GPL(blk_queue_max_zone_append_sectors);
-
-/**
- * blk_queue_logical_block_size - set logical block size for the queue
- * @q:  the request queue for the device
- * @size:  the logical block size, in bytes
- *
- * Description:
- *   This should be set to the lowest possible block size that the
- *   storage device can address.  The default of 512 covers most
- *   hardware.
- **/
-void blk_queue_logical_block_size(struct request_queue *q, unsigned int size)
-{
-	struct queue_limits *limits = &q->limits;
-
-	limits->logical_block_size = size;
-
-	if (limits->discard_granularity < limits->logical_block_size)
-		limits->discard_granularity = limits->logical_block_size;
-
-	if (limits->physical_block_size < size)
-		limits->physical_block_size = size;
-
-	if (limits->io_min < limits->physical_block_size)
-		limits->io_min = limits->physical_block_size;
-
-	limits->max_hw_sectors =
-		round_down(limits->max_hw_sectors, size >> SECTOR_SHIFT);
-	limits->max_sectors =
-		round_down(limits->max_sectors, size >> SECTOR_SHIFT);
-}
-EXPORT_SYMBOL(blk_queue_logical_block_size);
-
-/**
- * blk_queue_physical_block_size - set physical block size for the queue
- * @q:  the request queue for the device
- * @size:  the physical block size, in bytes
- *
- * Description:
- *   This should be set to the lowest possible sector size that the
- *   hardware can operate on without reverting to read-modify-write
- *   operations.
- */
-void blk_queue_physical_block_size(struct request_queue *q, unsigned int size)
-{
-	q->limits.physical_block_size = size;
-
-	if (q->limits.physical_block_size < q->limits.logical_block_size)
-		q->limits.physical_block_size = q->limits.logical_block_size;
-
-	if (q->limits.discard_granularity < q->limits.physical_block_size)
-		q->limits.discard_granularity = q->limits.physical_block_size;
-
-	if (q->limits.io_min < q->limits.physical_block_size)
-		q->limits.io_min = q->limits.physical_block_size;
-}
-EXPORT_SYMBOL(blk_queue_physical_block_size);
-
-/**
- * blk_queue_zone_write_granularity - set zone write granularity for the queue
- * @q:  the request queue for the zoned device
- * @size:  the zone write granularity size, in bytes
- *
- * Description:
- *   This should be set to the lowest possible size allowing to write in
- *   sequential zones of a zoned block device.
- */
-void blk_queue_zone_write_granularity(struct request_queue *q,
-				      unsigned int size)
-{
-	if (WARN_ON_ONCE(!blk_queue_is_zoned(q)))
-		return;
-
-	q->limits.zone_write_granularity = size;
-
-	if (q->limits.zone_write_granularity < q->limits.logical_block_size)
-		q->limits.zone_write_granularity = q->limits.logical_block_size;
-}
-EXPORT_SYMBOL_GPL(blk_queue_zone_write_granularity);
-
-/**
- * blk_queue_alignment_offset - set physical block alignment offset
- * @q:	the request queue for the device
- * @offset: alignment offset in bytes
- *
- * Description:
- *   Some devices are naturally misaligned to compensate for things like
- *   the legacy DOS partition table 63-sector offset.  Low-level drivers
- *   should call this function for devices whose first sector is not
- *   naturally aligned.
- */
-void blk_queue_alignment_offset(struct request_queue *q, unsigned int offset)
-{
-	q->limits.alignment_offset =
-		offset & (q->limits.physical_block_size - 1);
-	q->limits.misaligned = 0;
-}
-EXPORT_SYMBOL(blk_queue_alignment_offset);
-
 void disk_update_readahead(struct gendisk *disk)
 {
 	blk_apply_bdi_limits(disk->bdi, &disk->queue->limits);
@@ -514,26 +363,6 @@ void blk_limits_io_min(struct queue_limits *limits, unsigned int min)
 }
 EXPORT_SYMBOL(blk_limits_io_min);
 
-/**
- * blk_queue_io_min - set minimum request size for the queue
- * @q:	the request queue for the device
- * @min:  smallest I/O size in bytes
- *
- * Description:
- *   Storage devices may report a granularity or preferred minimum I/O
- *   size which is the smallest request the device can perform without
- *   incurring a performance penalty.  For disk drives this is often the
- *   physical block size.  For RAID arrays it is often the stripe chunk
- *   size.  A properly aligned multiple of minimum_io_size is the
- *   preferred request size for workloads where a high number of I/O
- *   operations is desired.
- */
-void blk_queue_io_min(struct request_queue *q, unsigned int min)
-{
-	blk_limits_io_min(&q->limits, min);
-}
-EXPORT_SYMBOL(blk_queue_io_min);
-
 /**
  * blk_limits_io_opt - set optimal request size for a device
  * @limits: the queue limits
@@ -841,25 +670,6 @@ void blk_queue_write_cache(struct request_queue *q, bool wc, bool fua)
 }
 EXPORT_SYMBOL_GPL(blk_queue_write_cache);
 
-/**
- * disk_set_zoned - inidicate a zoned device
- * @disk:	gendisk to configure
- */
-void disk_set_zoned(struct gendisk *disk)
-{
-	struct request_queue *q = disk->queue;
-
-	WARN_ON_ONCE(!IS_ENABLED(CONFIG_BLK_DEV_ZONED));
-
-	/*
-	 * Set the zone write granularity to the device logical block
-	 * size by default. The driver can change this value if needed.
-	 */
-	q->limits.zoned = true;
-	blk_queue_zone_write_granularity(q, queue_logical_block_size(q));
-}
-EXPORT_SYMBOL_GPL(disk_set_zoned);
-
 int bdev_alignment_offset(struct block_device *bdev)
 {
 	struct request_queue *q = bdev_get_queue(bdev);
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index aefdda9f4ec711..bee71deb8ca066 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -331,8 +331,6 @@ struct queue_limits {
 typedef int (*report_zones_cb)(struct blk_zone *zone, unsigned int idx,
 			       void *data);
 
-void disk_set_zoned(struct gendisk *disk);
-
 #define BLK_ALL_ZONES  ((unsigned int)-1)
 int blkdev_report_zones(struct block_device *bdev, sector_t sector,
 		unsigned int nr_zones, report_zones_cb cb, void *data);
@@ -928,24 +926,14 @@ static inline void queue_limits_cancel_update(struct request_queue *q)
 /*
  * Access functions for manipulating queue properties
  */
-extern void blk_queue_chunk_sectors(struct request_queue *, unsigned int);
 void blk_queue_max_secure_erase_sectors(struct request_queue *q,
 		unsigned int max_sectors);
 extern void blk_queue_max_discard_sectors(struct request_queue *q,
 		unsigned int max_discard_sectors);
 extern void blk_queue_max_write_zeroes_sectors(struct request_queue *q,
 		unsigned int max_write_same_sectors);
-extern void blk_queue_logical_block_size(struct request_queue *, unsigned int);
-extern void blk_queue_max_zone_append_sectors(struct request_queue *q,
-		unsigned int max_zone_append_sectors);
-extern void blk_queue_physical_block_size(struct request_queue *, unsigned int);
-void blk_queue_zone_write_granularity(struct request_queue *q,
-				      unsigned int size);
-extern void blk_queue_alignment_offset(struct request_queue *q,
-				       unsigned int alignment);
 void disk_update_readahead(struct gendisk *disk);
 extern void blk_limits_io_min(struct queue_limits *limits, unsigned int min);
-extern void blk_queue_io_min(struct request_queue *q, unsigned int min);
 extern void blk_limits_io_opt(struct queue_limits *limits, unsigned int opt);
 extern void blk_set_queue_depth(struct request_queue *q, unsigned int depth);
 extern void blk_set_stacking_limits(struct queue_limits *lim);
-- 
2.43.0


