Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8674B4F55BA
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 08:08:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299550.510477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbypZ-0006do-Ds; Wed, 06 Apr 2022 06:07:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299550.510477; Wed, 06 Apr 2022 06:07:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbypZ-0006ba-A0; Wed, 06 Apr 2022 06:07:49 +0000
Received: by outflank-mailman (input) for mailman id 299550;
 Wed, 06 Apr 2022 06:07:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=huFP=UQ=bombadil.srs.infradead.org=BATV+4210fbe0094d03a681f9+6800+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1nbyon-0000i6-3u
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 06:07:01 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2b8a2ea-b56f-11ec-8fbc-03012f2f19d4;
 Wed, 06 Apr 2022 08:06:56 +0200 (CEST)
Received: from 213-225-3-188.nat.highway.a1.net ([213.225.3.188]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbyoX-003vn4-0d; Wed, 06 Apr 2022 06:06:45 +0000
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
X-Inumbo-ID: c2b8a2ea-b56f-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=QrovNweyJZRj1GFp6iCnhs45fbus+PzPDKXpCmbtDwo=; b=z5LFDFUbPWb3WO37mO8MwjoQU9
	uS3ZTdwAnf66Lx+zcAQQUC3qALjNiBk8vq/QdAnBrT+kiIx7+bGfq0K3/JsrX94g6GOI1PxnGLDP0
	TpbSMnVMCM12vlH2ieULysyOQ8eqGhAM7WSZgubyaijH46PkBLtZHwMl/DJ+SL/fL62RhXRHRBZ07
	gPidH4d0GBhOycIbS6/qs679s/JDzVaH5pxN2YMNY1qvOfu3TMWQ9LeQbRMDybW1HFyANyEbyeoY8
	bjiiLGRwO/33fN9Ma7LaMPzza6Yu9DF6RQqn94ZGs2knBiL0yIxk5iak06Qk6gWjflRAaNPj9+l6R
	kccMsInA==;
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
	linux-mm@kvack.org
Subject: [PATCH 22/27] block: refactor discard bio size limiting
Date: Wed,  6 Apr 2022 08:05:11 +0200
Message-Id: <20220406060516.409838-23-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220406060516.409838-1-hch@lst.de>
References: <20220406060516.409838-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Move all the logic to limit the discard bio size into a common helper
so that it is better documented.

Signed-off-by: Christoph Hellwig <hch@lst.de>
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
index 8ccbc6e076369..1fdc1d28e6d60 100644
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


