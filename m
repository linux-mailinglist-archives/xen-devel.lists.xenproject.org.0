Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFB9502364
	for <lists+xen-devel@lfdr.de>; Fri, 15 Apr 2022 07:03:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.305326.520405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfE6l-0004EJ-5R; Fri, 15 Apr 2022 05:02:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 305326.520405; Fri, 15 Apr 2022 05:02:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfE6k-0004Ay-VI; Fri, 15 Apr 2022 05:02:58 +0000
Received: by outflank-mailman (input) for mailman id 305326;
 Fri, 15 Apr 2022 05:02:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5UAI=UZ=bombadil.srs.infradead.org=BATV+2d633663de0085320ac7+6809+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1nfDyU-0004b8-U6
 for xen-devel@lists.xenproject.org; Fri, 15 Apr 2022 04:54:27 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ef67c11-bc78-11ec-a405-831a346695d4;
 Fri, 15 Apr 2022 06:54:25 +0200 (CEST)
Received: from [2a02:1205:504b:4280:f5dd:42a4:896c:d877] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfDyG-008PgP-Ki; Fri, 15 Apr 2022 04:54:13 +0000
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
X-Inumbo-ID: 1ef67c11-bc78-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=CzPLS+Gjxb/zoXdxVG3wb1X+zPEYuY3a71fFFzUQsIo=; b=PxTC6KnciQw0TSk9vI+K+AMZhB
	u9e+Rsg6/gEELi9/+U/v63dpyvw0hUtfHyPU16IZS1Eodmr5X+cu2FRmZWSzJpe+KZhaB8WPX73iy
	c6TK87vBkvMsokVjnVkLP6p7ua2/nu4iRHseV7k8Otwf/q7lwy6z7apWU+n+IP1iUvyEzbauM7lCp
	dkSj+aQUOppSdadfxst8W0LcrS+Mm/D+yrRNvKalP/J5Dfogq3zfiOEumpJYUHKnW8QvLxDGWbnNa
	GemfPfulsMzUnykcCOMbb7hTYIQIE4W/va/oe9dQyCoWo0AOAT691zcccidiP4Ae970vBl8VgjIPB
	+dTJ1dFw==;
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
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Coly Li <colyli@suse.de>,
	David Sterba <dsterba@suse.com>
Subject: [PATCH 23/27] block: add a bdev_max_discard_sectors helper
Date: Fri, 15 Apr 2022 06:52:54 +0200
Message-Id: <20220415045258.199825-24-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220415045258.199825-1-hch@lst.de>
References: <20220415045258.199825-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Add a helper to query the number of sectors support per each discard bio
based on the block device and use this helper to stop various places from
poking into the request_queue to see if discard is supported and if so how
much.  This mirrors what is done e.g. for write zeroes as well.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
Acked-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com> [drbd]
Acked-by: Coly Li <colyli@suse.de> [bcache]
Acked-by: David Sterba <dsterba@suse.com> [btrfs]
---
 drivers/block/drbd/drbd_nl.c        | 8 +++++---
 drivers/block/drbd/drbd_receiver.c  | 2 +-
 drivers/block/rnbd/rnbd-srv-dev.h   | 3 +--
 drivers/md/dm-io.c                  | 2 +-
 drivers/target/target_core_device.c | 7 +++----
 fs/f2fs/segment.c                   | 6 ++----
 include/linux/blkdev.h              | 5 +++++
 7 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
index 4d00986d6f588..a0a06e238e917 100644
--- a/drivers/block/drbd/drbd_nl.c
+++ b/drivers/block/drbd/drbd_nl.c
@@ -1439,7 +1439,8 @@ static bool write_ordering_changed(struct disk_conf *a, struct disk_conf *b)
 static void sanitize_disk_conf(struct drbd_device *device, struct disk_conf *disk_conf,
 			       struct drbd_backing_dev *nbc)
 {
-	struct request_queue * const q = nbc->backing_bdev->bd_disk->queue;
+	struct block_device *bdev = nbc->backing_bdev;
+	struct request_queue *q = bdev->bd_disk->queue;
 
 	if (disk_conf->al_extents < DRBD_AL_EXTENTS_MIN)
 		disk_conf->al_extents = DRBD_AL_EXTENTS_MIN;
@@ -1455,6 +1456,7 @@ static void sanitize_disk_conf(struct drbd_device *device, struct disk_conf *dis
 
 	if (disk_conf->rs_discard_granularity) {
 		int orig_value = disk_conf->rs_discard_granularity;
+		sector_t discard_size = bdev_max_discard_sectors(bdev) << 9;
 		int remainder;
 
 		if (q->limits.discard_granularity > disk_conf->rs_discard_granularity)
@@ -1463,8 +1465,8 @@ static void sanitize_disk_conf(struct drbd_device *device, struct disk_conf *dis
 		remainder = disk_conf->rs_discard_granularity % q->limits.discard_granularity;
 		disk_conf->rs_discard_granularity += remainder;
 
-		if (disk_conf->rs_discard_granularity > q->limits.max_discard_sectors << 9)
-			disk_conf->rs_discard_granularity = q->limits.max_discard_sectors << 9;
+		if (disk_conf->rs_discard_granularity > discard_size)
+			disk_conf->rs_discard_granularity = discard_size;
 
 		if (disk_conf->rs_discard_granularity != orig_value)
 			drbd_info(device, "rs_discard_granularity changed to %d\n",
diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index 08da922f81d1d..0b4c7de463989 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -1524,7 +1524,7 @@ int drbd_issue_discard_or_zero_out(struct drbd_device *device, sector_t start, u
 	granularity = max(q->limits.discard_granularity >> 9, 1U);
 	alignment = (bdev_discard_alignment(bdev) >> 9) % granularity;
 
-	max_discard_sectors = min(q->limits.max_discard_sectors, (1U << 22));
+	max_discard_sectors = min(bdev_max_discard_sectors(bdev), (1U << 22));
 	max_discard_sectors -= max_discard_sectors % granularity;
 	if (unlikely(!max_discard_sectors))
 		goto zero_out;
diff --git a/drivers/block/rnbd/rnbd-srv-dev.h b/drivers/block/rnbd/rnbd-srv-dev.h
index 2c3df02b5e8ec..f82fbb4bbda8e 100644
--- a/drivers/block/rnbd/rnbd-srv-dev.h
+++ b/drivers/block/rnbd/rnbd-srv-dev.h
@@ -52,8 +52,7 @@ static inline int rnbd_dev_get_max_discard_sects(const struct rnbd_dev *dev)
 	if (!blk_queue_discard(bdev_get_queue(dev->bdev)))
 		return 0;
 
-	return blk_queue_get_max_sectors(bdev_get_queue(dev->bdev),
-					 REQ_OP_DISCARD);
+	return bdev_max_discard_sectors(dev->bdev);
 }
 
 static inline int rnbd_dev_get_discard_granularity(const struct rnbd_dev *dev)
diff --git a/drivers/md/dm-io.c b/drivers/md/dm-io.c
index 5762366333a27..e4b95eaeec8c7 100644
--- a/drivers/md/dm-io.c
+++ b/drivers/md/dm-io.c
@@ -311,7 +311,7 @@ static void do_region(int op, int op_flags, unsigned region,
 	 * Reject unsupported discard and write same requests.
 	 */
 	if (op == REQ_OP_DISCARD)
-		special_cmd_max_sectors = q->limits.max_discard_sectors;
+		special_cmd_max_sectors = bdev_max_discard_sectors(where->bdev);
 	else if (op == REQ_OP_WRITE_ZEROES)
 		special_cmd_max_sectors = q->limits.max_write_zeroes_sectors;
 	if ((op == REQ_OP_DISCARD || op == REQ_OP_WRITE_ZEROES) &&
diff --git a/drivers/target/target_core_device.c b/drivers/target/target_core_device.c
index 16e775bcf4a7c..c3e25bac90d59 100644
--- a/drivers/target/target_core_device.c
+++ b/drivers/target/target_core_device.c
@@ -829,9 +829,8 @@ struct se_device *target_alloc_device(struct se_hba *hba, const char *name)
 }
 
 /*
- * Check if the underlying struct block_device request_queue supports
- * the QUEUE_FLAG_DISCARD bit for UNMAP/WRITE_SAME in SCSI + TRIM
- * in ATA and we need to set TPE=1
+ * Check if the underlying struct block_device supports discard and if yes
+ * configure the UNMAP parameters.
  */
 bool target_configure_unmap_from_queue(struct se_dev_attrib *attrib,
 				       struct block_device *bdev)
@@ -843,7 +842,7 @@ bool target_configure_unmap_from_queue(struct se_dev_attrib *attrib,
 		return false;
 
 	attrib->max_unmap_lba_count =
-		q->limits.max_discard_sectors >> (ilog2(block_size) - 9);
+		bdev_max_discard_sectors(bdev) >> (ilog2(block_size) - 9);
 	/*
 	 * Currently hardcoded to 1 in Linux/SCSI code..
 	 */
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 22dfeb9915290..71f09adbcba86 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1196,9 +1196,8 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
 						unsigned int *issued)
 {
 	struct block_device *bdev = dc->bdev;
-	struct request_queue *q = bdev_get_queue(bdev);
 	unsigned int max_discard_blocks =
-			SECTOR_TO_BLOCK(q->limits.max_discard_sectors);
+			SECTOR_TO_BLOCK(bdev_max_discard_sectors(bdev));
 	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
 	struct list_head *wait_list = (dpolicy->type == DPOLICY_FSTRIM) ?
 					&(dcc->fstrim_list) : &(dcc->wait_list);
@@ -1375,9 +1374,8 @@ static void __update_discard_tree_range(struct f2fs_sb_info *sbi,
 	struct discard_cmd *dc;
 	struct discard_info di = {0};
 	struct rb_node **insert_p = NULL, *insert_parent = NULL;
-	struct request_queue *q = bdev_get_queue(bdev);
 	unsigned int max_discard_blocks =
-			SECTOR_TO_BLOCK(q->limits.max_discard_sectors);
+			SECTOR_TO_BLOCK(bdev_max_discard_sectors(bdev));
 	block_t end = lstart + len;
 
 	dc = (struct discard_cmd *)f2fs_lookup_rb_tree_ret(&dcc->root,
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 34b1cfd067421..ce16247d3afab 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1254,6 +1254,11 @@ bdev_zone_write_granularity(struct block_device *bdev)
 int bdev_alignment_offset(struct block_device *bdev);
 unsigned int bdev_discard_alignment(struct block_device *bdev);
 
+static inline unsigned int bdev_max_discard_sectors(struct block_device *bdev)
+{
+	return bdev_get_queue(bdev)->limits.max_discard_sectors;
+}
+
 static inline unsigned int bdev_write_zeroes_sectors(struct block_device *bdev)
 {
 	struct request_queue *q = bdev_get_queue(bdev);
-- 
2.30.2


