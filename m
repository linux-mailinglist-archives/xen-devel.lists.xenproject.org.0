Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC856502356
	for <lists+xen-devel@lfdr.de>; Fri, 15 Apr 2022 07:02:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.305255.520250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfE5v-0004dE-JH; Fri, 15 Apr 2022 05:02:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 305255.520250; Fri, 15 Apr 2022 05:02:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfE5v-0004bk-BS; Fri, 15 Apr 2022 05:02:07 +0000
Received: by outflank-mailman (input) for mailman id 305255;
 Fri, 15 Apr 2022 05:02:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5UAI=UZ=bombadil.srs.infradead.org=BATV+2d633663de0085320ac7+6809+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1nfDyT-0004TJ-QW
 for xen-devel@lists.xenproject.org; Fri, 15 Apr 2022 04:54:25 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e6024c9-bc78-11ec-8fbe-03012f2f19d4;
 Fri, 15 Apr 2022 06:54:24 +0200 (CEST)
Received: from [2a02:1205:504b:4280:f5dd:42a4:896c:d877] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfDyD-008Pdc-VZ; Fri, 15 Apr 2022 04:54:10 +0000
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
X-Inumbo-ID: 1e6024c9-bc78-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=GLA2nAe/cQO5WqFsrtbqfq8T3xUan5SkfUOusFqqAns=; b=VsGSXhUuIEFuRZtndYvZ6/P8Oc
	BDcT4E1kdUm0zMpQr8vfARZ9SBXzHbIzUwD1GYcduf3i506YLp6g548TDVxAtbp8KULMmrxF/ukva
	fgeigpWf0NIDRQPagvS6VzFyZpJ3xcSZOqt1eMagBiZEETs+p7tuGOEblnRA/Ubh/DSR79GR69y6j
	FXiQ7FqkrDKHIdBeDoZ8IY+N1d7emzC5iIlTdFynPRNmDVt0LMc9eg28VMj13kA7fa+HCrkwQXu48
	dUI7fDaAt8ItsFFi9XzyzHuoHEFOt6Vg27L4pMYHOgWMn9i+eAuB2cLGlEi8YHAGqnLzqjEoo43U0
	EggVK9WA==;
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: dm-devel@redhat.com,
	linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-block@vger.kernel.org,
	drbd-dev@lists.linbit.com,
	nbd@other.debian.org,
	ceph-devel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-nvme@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	cluster-devel@redhat.com,
	jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org,
	ntfs3@lists.linux.dev,
	ocfs2-devel@oss.oracle.com,
	linux-mm@kvack.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Coly Li <colyli@suse.de>
Subject: [PATCH 22/27] block: refactor discard bio size limiting
Date: Fri, 15 Apr 2022 06:52:53 +0200
Message-Id: <20220415045258.199825-23-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220415045258.199825-1-hch@lst.de>
References: <20220415045258.199825-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Move all the logic to limit the discard bio size into a common helper
so that it is better documented.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
Acked-by: Coly Li <colyli@suse.de>
---
 block/blk-lib.c | 59 ++++++++++++++++++++++++-------------------------
 block/blk.h     | 14 ------------
 2 files changed, 29 insertions(+), 44 deletions(-)

diff --git a/block/blk-lib.c b/block/blk-lib.c
index 237d60d8b5857..2ae32a722851c 100644
--- a/block/blk-lib.c
+++ b/block/blk-lib.c
@@ -10,6 +10,32 @@
 
 #include "blk.h"
 
+static sector_t bio_discard_limit(struct block_device *bdev, sector_t sector)
+{
+	unsigned int discard_granularity =
+		bdev_get_queue(bdev)->limits.discard_granularity;
+	sector_t granularity_aligned_sector;
+
+	if (bdev_is_partition(bdev))
+		sector += bdev->bd_start_sect;
+
+	granularity_aligned_sector =
+		round_up(sector, discard_granularity >> SECTOR_SHIFT);
+
+	/*
+	 * Make sure subsequent bios start aligned to the discard granularity if
+	 * it needs to be split.
+	 */
+	if (granularity_aligned_sector != sector)
+		return granularity_aligned_sector - sector;
+
+	/*
+	 * Align the bio size to the discard granularity to make splitting the bio
+	 * at discard granularity boundaries easier in the driver if needed.
+	 */
+	return round_down(UINT_MAX, discard_granularity) >> SECTOR_SHIFT;
+}
+
 int __blkdev_issue_discard(struct block_device *bdev, sector_t sector,
 		sector_t nr_sects, gfp_t gfp_mask, int flags,
 		struct bio **biop)
@@ -17,7 +43,7 @@ int __blkdev_issue_discard(struct block_device *bdev, sector_t sector,
 	struct request_queue *q = bdev_get_queue(bdev);
 	struct bio *bio = *biop;
 	unsigned int op;
-	sector_t bs_mask, part_offset = 0;
+	sector_t bs_mask;
 
 	if (bdev_read_only(bdev))
 		return -EPERM;
@@ -48,36 +74,9 @@ int __blkdev_issue_discard(struct block_device *bdev, sector_t sector,
 	if (!nr_sects)
 		return -EINVAL;
 
-	/* In case the discard request is in a partition */
-	if (bdev_is_partition(bdev))
-		part_offset = bdev->bd_start_sect;
-
 	while (nr_sects) {
-		sector_t granularity_aligned_lba, req_sects;
-		sector_t sector_mapped = sector + part_offset;
-
-		granularity_aligned_lba = round_up(sector_mapped,
-				q->limits.discard_granularity >> SECTOR_SHIFT);
-
-		/*
-		 * Check whether the discard bio starts at a discard_granularity
-		 * aligned LBA,
-		 * - If no: set (granularity_aligned_lba - sector_mapped) to
-		 *   bi_size of the first split bio, then the second bio will
-		 *   start at a discard_granularity aligned LBA on the device.
-		 * - If yes: use bio_aligned_discard_max_sectors() as the max
-		 *   possible bi_size of the first split bio. Then when this bio
-		 *   is split in device drive, the split ones are very probably
-		 *   to be aligned to discard_granularity of the device's queue.
-		 */
-		if (granularity_aligned_lba == sector_mapped)
-			req_sects = min_t(sector_t, nr_sects,
-					  bio_aligned_discard_max_sectors(q));
-		else
-			req_sects = min_t(sector_t, nr_sects,
-					  granularity_aligned_lba - sector_mapped);
-
-		WARN_ON_ONCE((req_sects << 9) > UINT_MAX);
+		sector_t req_sects =
+			min(nr_sects, bio_discard_limit(bdev, sector));
 
 		bio = blk_next_bio(bio, bdev, 0, op, gfp_mask);
 		bio->bi_iter.bi_sector = sector;
diff --git a/block/blk.h b/block/blk.h
index 4ea5167dc3392..434017701403f 100644
--- a/block/blk.h
+++ b/block/blk.h
@@ -346,20 +346,6 @@ static inline unsigned int bio_allowed_max_sectors(struct request_queue *q)
 	return round_down(UINT_MAX, queue_logical_block_size(q)) >> 9;
 }
 
-/*
- * The max bio size which is aligned to q->limits.discard_granularity. This
- * is a hint to split large discard bio in generic block layer, then if device
- * driver needs to split the discard bio into smaller ones, their bi_size can
- * be very probably and easily aligned to discard_granularity of the device's
- * queue.
- */
-static inline unsigned int bio_aligned_discard_max_sectors(
-					struct request_queue *q)
-{
-	return round_down(UINT_MAX, q->limits.discard_granularity) >>
-			SECTOR_SHIFT;
-}
-
 /*
  * Internal io_context interface
  */
-- 
2.30.2


