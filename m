Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DAB9030E1
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 07:28:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737720.1144221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGu32-0001yA-7w; Tue, 11 Jun 2024 05:27:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737720.1144221; Tue, 11 Jun 2024 05:27:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGu32-0001rf-1k; Tue, 11 Jun 2024 05:27:56 +0000
Received: by outflank-mailman (input) for mailman id 737720;
 Tue, 11 Jun 2024 05:27:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M7An=NN=bombadil.srs.infradead.org=BATV+2fedbe304aabaf399917+7597+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1sGtw3-0006gk-87
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 05:20:43 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5536dac9-27b2-11ef-b4bb-af5377834399;
 Tue, 11 Jun 2024 07:20:37 +0200 (CEST)
Received: from
 2a02-8389-2341-5b80-cdb4-8e7d-405d-6b77.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:cdb4:8e7d:405d:6b77] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1sGtvf-00000007RHo-0EdF; Tue, 11 Jun 2024 05:20:20 +0000
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
X-Inumbo-ID: 5536dac9-27b2-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=JbMVJ/FXRp2fRg+LG74XYlDu5LD/z/A0OThY3vyxvEY=; b=U+OCOYuQKA7+zHZ8rI+/LEGIbf
	yyzT81mUDdX1g1y0nBhYq/a+EznJGskITZ623q2rthgZDGhP42yUIKsgXE0ezCNhyosXm+RT9FFEY
	A52iyPdbnDIJ5efpmZnKHUpUenY083jIVDC+WPBVWwVEAvPeAn6CciLM4N1Hcpehk9s3Mp9orQCQx
	68Ico/AWJ9UgH34ohFg3R2d02LxxNNUJwlskWjJLiWi8hQSJdujL9ZerI2qqS9YzvjknwcVoZeFU1
	+DCgonENDPhmpHZVeWByIfwrHG/4RyEwbq1nEHWLdTax+87Gv1zqzs9FGYPjA3r3/RjI/XKpixsP7
	sylNMw8A==;
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
	linux-block@vger.kernel.org
Subject: [PATCH 16/26] block: move the io_stat flag setting to queue_limits
Date: Tue, 11 Jun 2024 07:19:16 +0200
Message-ID: <20240611051929.513387-17-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240611051929.513387-1-hch@lst.de>
References: <20240611051929.513387-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Move the io_stat flag into the queue_limits feature field so that it
can be set atomically and all I/O is frozen when changing the flag.

Simplify md and dm to set the flag unconditionally instead of avoiding
setting a simple flag for cases where it already is set by other means,
which is a bit pointless.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-mq-debugfs.c        |  1 -
 block/blk-mq.c                |  6 +++++-
 block/blk-sysfs.c             |  2 +-
 drivers/md/dm-table.c         | 12 +++++++++---
 drivers/md/dm.c               | 13 +++----------
 drivers/md/md.c               |  5 ++---
 drivers/nvme/host/multipath.c |  2 +-
 include/linux/blkdev.h        |  9 +++++----
 8 files changed, 26 insertions(+), 24 deletions(-)

diff --git a/block/blk-mq-debugfs.c b/block/blk-mq-debugfs.c
index 6b7edb50bfd3fa..cbe99444ed1a54 100644
--- a/block/blk-mq-debugfs.c
+++ b/block/blk-mq-debugfs.c
@@ -84,7 +84,6 @@ static const char *const blk_queue_flag_name[] = {
 	QUEUE_FLAG_NAME(NOMERGES),
 	QUEUE_FLAG_NAME(SAME_COMP),
 	QUEUE_FLAG_NAME(FAIL_IO),
-	QUEUE_FLAG_NAME(IO_STAT),
 	QUEUE_FLAG_NAME(NOXMERGES),
 	QUEUE_FLAG_NAME(SYNCHRONOUS),
 	QUEUE_FLAG_NAME(SAME_FORCE),
diff --git a/block/blk-mq.c b/block/blk-mq.c
index 58b0d6c7cc34d6..cf67dc13f7dd4c 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -4116,7 +4116,11 @@ struct request_queue *blk_mq_alloc_queue(struct blk_mq_tag_set *set,
 	struct request_queue *q;
 	int ret;
 
-	q = blk_alloc_queue(lim ? lim : &default_lim, set->numa_node);
+	if (!lim)
+		lim = &default_lim;
+	lim->features |= BLK_FEAT_IO_STAT;
+
+	q = blk_alloc_queue(lim, set->numa_node);
 	if (IS_ERR(q))
 		return q;
 	q->queuedata = queuedata;
diff --git a/block/blk-sysfs.c b/block/blk-sysfs.c
index 9174aca3b85526..6f58530fb3c08e 100644
--- a/block/blk-sysfs.c
+++ b/block/blk-sysfs.c
@@ -324,7 +324,7 @@ queue_##name##_store(struct request_queue *q, const char *page, size_t count) \
 
 QUEUE_SYSFS_FEATURE(rotational, BLK_FEAT_ROTATIONAL)
 QUEUE_SYSFS_FEATURE(add_random, BLK_FEAT_ADD_RANDOM)
-QUEUE_SYSFS_BIT_FNS(iostats, IO_STAT, 0);
+QUEUE_SYSFS_FEATURE(iostats, BLK_FEAT_IO_STAT)
 QUEUE_SYSFS_BIT_FNS(stable_writes, STABLE_WRITES, 0);
 #undef QUEUE_SYSFS_BIT_FNS
 
diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index 7654babc2775c1..3e3b713502f61e 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -579,6 +579,12 @@ int dm_split_args(int *argc, char ***argvp, char *input)
 	return 0;
 }
 
+static void dm_set_stacking_limits(struct queue_limits *limits)
+{
+	blk_set_stacking_limits(limits);
+	limits->features |= BLK_FEAT_IO_STAT;
+}
+
 /*
  * Impose necessary and sufficient conditions on a devices's table such
  * that any incoming bio which respects its logical_block_size can be
@@ -617,7 +623,7 @@ static int validate_hardware_logical_block_alignment(struct dm_table *t,
 	for (i = 0; i < t->num_targets; i++) {
 		ti = dm_table_get_target(t, i);
 
-		blk_set_stacking_limits(&ti_limits);
+		dm_set_stacking_limits(&ti_limits);
 
 		/* combine all target devices' limits */
 		if (ti->type->iterate_devices)
@@ -1591,7 +1597,7 @@ int dm_calculate_queue_limits(struct dm_table *t,
 	unsigned int zone_sectors = 0;
 	bool zoned = false;
 
-	blk_set_stacking_limits(limits);
+	dm_set_stacking_limits(limits);
 
 	t->integrity_supported = true;
 	for (unsigned int i = 0; i < t->num_targets; i++) {
@@ -1604,7 +1610,7 @@ int dm_calculate_queue_limits(struct dm_table *t,
 	for (unsigned int i = 0; i < t->num_targets; i++) {
 		struct dm_target *ti = dm_table_get_target(t, i);
 
-		blk_set_stacking_limits(&ti_limits);
+		dm_set_stacking_limits(&ti_limits);
 
 		if (!ti->type->iterate_devices) {
 			/* Set I/O hints portion of queue limits */
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 13037d6a6f62a2..8a976cee448bed 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -2386,22 +2386,15 @@ int dm_setup_md_queue(struct mapped_device *md, struct dm_table *t)
 	struct table_device *td;
 	int r;
 
-	switch (type) {
-	case DM_TYPE_REQUEST_BASED:
+	WARN_ON_ONCE(type == DM_TYPE_NONE);
+
+	if (type == DM_TYPE_REQUEST_BASED) {
 		md->disk->fops = &dm_rq_blk_dops;
 		r = dm_mq_init_request_queue(md, t);
 		if (r) {
 			DMERR("Cannot initialize queue for request-based dm mapped device");
 			return r;
 		}
-		break;
-	case DM_TYPE_BIO_BASED:
-	case DM_TYPE_DAX_BIO_BASED:
-		blk_queue_flag_set(QUEUE_FLAG_IO_STAT, md->queue);
-		break;
-	case DM_TYPE_NONE:
-		WARN_ON_ONCE(true);
-		break;
 	}
 
 	r = dm_calculate_queue_limits(t, &limits);
diff --git a/drivers/md/md.c b/drivers/md/md.c
index c23423c51fb7c2..8db0db8d5a27ac 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -5787,7 +5787,8 @@ struct mddev *md_alloc(dev_t dev, char *name)
 	int unit;
 	int error;
 	struct queue_limits lim = {
-		.features		= BLK_FEAT_WRITE_CACHE | BLK_FEAT_FUA,
+		.features		= BLK_FEAT_WRITE_CACHE | BLK_FEAT_FUA |
+					  BLK_FEAT_IO_STAT,
 	};
 
 	/*
@@ -6152,8 +6153,6 @@ int md_run(struct mddev *mddev)
 	if (!mddev_is_dm(mddev)) {
 		struct request_queue *q = mddev->gendisk->queue;
 
-		blk_queue_flag_set(QUEUE_FLAG_IO_STAT, q);
-
 		/* Set the NOWAIT flags if all underlying devices support it */
 		if (nowait)
 			blk_queue_flag_set(QUEUE_FLAG_NOWAIT, q);
diff --git a/drivers/nvme/host/multipath.c b/drivers/nvme/host/multipath.c
index 58c13304e558e0..eea727cfa9e67d 100644
--- a/drivers/nvme/host/multipath.c
+++ b/drivers/nvme/host/multipath.c
@@ -538,6 +538,7 @@ int nvme_mpath_alloc_disk(struct nvme_ctrl *ctrl, struct nvme_ns_head *head)
 
 	blk_set_stacking_limits(&lim);
 	lim.dma_alignment = 3;
+	lim.features |= BLK_FEAT_IO_STAT;
 	if (head->ids.csi != NVME_CSI_ZNS)
 		lim.max_zone_append_sectors = 0;
 
@@ -550,7 +551,6 @@ int nvme_mpath_alloc_disk(struct nvme_ctrl *ctrl, struct nvme_ns_head *head)
 			ctrl->subsys->instance, head->instance);
 
 	blk_queue_flag_set(QUEUE_FLAG_NOWAIT, head->disk->queue);
-	blk_queue_flag_set(QUEUE_FLAG_IO_STAT, head->disk->queue);
 	/*
 	 * This assumes all controllers that refer to a namespace either
 	 * support poll queues or not.  That is not a strict guarantee,
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index e6a2382e21c4fe..f8e38f94fd8c9a 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -295,6 +295,9 @@ enum {
 
 	/* contributes to the random number pool */
 	BLK_FEAT_ADD_RANDOM			= (1u << 3),
+
+	/* do disk/partitions IO accounting */
+	BLK_FEAT_IO_STAT			= (1u << 4),
 };
 
 /*
@@ -558,7 +561,6 @@ struct request_queue {
 #define QUEUE_FLAG_NOMERGES     3	/* disable merge attempts */
 #define QUEUE_FLAG_SAME_COMP	4	/* complete on same CPU-group */
 #define QUEUE_FLAG_FAIL_IO	5	/* fake timeout */
-#define QUEUE_FLAG_IO_STAT	7	/* do disk/partitions IO accounting */
 #define QUEUE_FLAG_NOXMERGES	9	/* No extended merges */
 #define QUEUE_FLAG_SYNCHRONOUS	11	/* always completes in submit context */
 #define QUEUE_FLAG_SAME_FORCE	12	/* force complete on same CPU */
@@ -577,8 +579,7 @@ struct request_queue {
 #define QUEUE_FLAG_SQ_SCHED     30	/* single queue style io dispatch */
 #define QUEUE_FLAG_SKIP_TAGSET_QUIESCE	31 /* quiesce_tagset skip the queue*/
 
-#define QUEUE_FLAG_MQ_DEFAULT	((1UL << QUEUE_FLAG_IO_STAT) |		\
-				 (1UL << QUEUE_FLAG_SAME_COMP) |	\
+#define QUEUE_FLAG_MQ_DEFAULT	((1UL << QUEUE_FLAG_SAME_COMP) |	\
 				 (1UL << QUEUE_FLAG_NOWAIT))
 
 void blk_queue_flag_set(unsigned int flag, struct request_queue *q);
@@ -592,7 +593,7 @@ bool blk_queue_flag_test_and_set(unsigned int flag, struct request_queue *q);
 #define blk_queue_noxmerges(q)	\
 	test_bit(QUEUE_FLAG_NOXMERGES, &(q)->queue_flags)
 #define blk_queue_nonrot(q)	((q)->limits.features & BLK_FEAT_ROTATIONAL)
-#define blk_queue_io_stat(q)	test_bit(QUEUE_FLAG_IO_STAT, &(q)->queue_flags)
+#define blk_queue_io_stat(q)	((q)->limits.features & BLK_FEAT_IO_STAT)
 #define blk_queue_zone_resetall(q)	\
 	test_bit(QUEUE_FLAG_ZONE_RESETALL, &(q)->queue_flags)
 #define blk_queue_dax(q)	test_bit(QUEUE_FLAG_DAX, &(q)->queue_flags)
-- 
2.43.0


