Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C7590A400
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 08:07:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.741665.1148386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ5Wm-0008Kz-QY; Mon, 17 Jun 2024 06:07:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 741665.1148386; Mon, 17 Jun 2024 06:07:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ5Wm-00084B-7T; Mon, 17 Jun 2024 06:07:40 +0000
Received: by outflank-mailman (input) for mailman id 741665;
 Mon, 17 Jun 2024 06:07:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvID=NT=bombadil.srs.infradead.org=BATV+625ba2f6da96caf54eae+7603+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1sJ5W0-0001PY-CS
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 06:06:52 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8d20ade-2c6f-11ef-b4bb-af5377834399;
 Mon, 17 Jun 2024 08:06:50 +0200 (CEST)
Received: from [91.187.204.140] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1sJ5Vj-00000009Iyb-0AOH; Mon, 17 Jun 2024 06:06:35 +0000
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
X-Inumbo-ID: c8d20ade-2c6f-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=0+0kfVN+poIOW7TyJ8IvGWts9ay/jCSMmWoFEtfaqiY=; b=Oj54QgNypOFvWLQYtpWWZ3K7Hv
	KgPgK4WxEoascCvZcw9c+tBv6JmauG/P7miwUJZx8LBvJCegwhU9q7k+3k1w0iXy4SRvv2Tg4xB51
	7vuQL68zzMzWtOyhf/u+r5WP9Ym8bv9d3V2MWiIYDKd4VfDKTC2n/uo12lFVpLpdYCu8I1D1y3Wtr
	tXpk97mEvfifvogKN2+UehfnLHSyV+hF6LXFm6AV/ITy88LzszK4+hqzZRtbUUVXl6sup5+O6tdzU
	8ohmOhTkk9eBOJYsHheov19MtZGMAQNzgEXX0DPteBjiV/h0VVbcxkNsl2tyw0+1Y0rMVrTjx3qJX
	Fb9W59iA==;
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
Subject: [PATCH 19/26] block: move the nowait flag to queue_limits
Date: Mon, 17 Jun 2024 08:04:46 +0200
Message-ID: <20240617060532.127975-20-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240617060532.127975-1-hch@lst.de>
References: <20240617060532.127975-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Move the nowait flag into the queue_limits feature field so that it can
be set atomically with the queue frozen.

Stacking drivers are simplified in that they now can simply set the
flag, and blk_stack_limits will clear it when the features is not
supported by any of the underlying devices.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-mq-debugfs.c        |  1 -
 block/blk-mq.c                |  2 +-
 block/blk-settings.c          |  9 +++++++++
 drivers/block/brd.c           |  4 ++--
 drivers/md/dm-table.c         | 18 +++---------------
 drivers/md/md.c               | 18 +-----------------
 drivers/nvme/host/multipath.c |  3 +--
 include/linux/blkdev.h        |  9 +++++----
 8 files changed, 22 insertions(+), 42 deletions(-)

diff --git a/block/blk-mq-debugfs.c b/block/blk-mq-debugfs.c
index 957774e40b1d0c..62b132e9a9ce3b 100644
--- a/block/blk-mq-debugfs.c
+++ b/block/blk-mq-debugfs.c
@@ -96,7 +96,6 @@ static const char *const blk_queue_flag_name[] = {
 	QUEUE_FLAG_NAME(ZONE_RESETALL),
 	QUEUE_FLAG_NAME(RQ_ALLOC_TIME),
 	QUEUE_FLAG_NAME(HCTX_ACTIVE),
-	QUEUE_FLAG_NAME(NOWAIT),
 	QUEUE_FLAG_NAME(SQ_SCHED),
 	QUEUE_FLAG_NAME(SKIP_TAGSET_QUIESCE),
 };
diff --git a/block/blk-mq.c b/block/blk-mq.c
index cf67dc13f7dd4c..43235acc87505f 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -4118,7 +4118,7 @@ struct request_queue *blk_mq_alloc_queue(struct blk_mq_tag_set *set,
 
 	if (!lim)
 		lim = &default_lim;
-	lim->features |= BLK_FEAT_IO_STAT;
+	lim->features |= BLK_FEAT_IO_STAT | BLK_FEAT_NOWAIT;
 
 	q = blk_alloc_queue(lim, set->numa_node);
 	if (IS_ERR(q))
diff --git a/block/blk-settings.c b/block/blk-settings.c
index 536ee202fcdccb..bf4622c19b5c09 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -459,6 +459,15 @@ int blk_stack_limits(struct queue_limits *t, struct queue_limits *b,
 
 	t->features |= (b->features & BLK_FEAT_INHERIT_MASK);
 
+	/*
+	 * BLK_FEAT_NOWAIT needs to be supported both by the stacking driver
+	 * and all underlying devices.  The stacking driver sets the flag
+	 * before stacking the limits, and this will clear the flag if any
+	 * of the underlying devices does not support it.
+	 */
+	if (!(b->features & BLK_FEAT_NOWAIT))
+		t->features &= ~BLK_FEAT_NOWAIT;
+
 	t->max_sectors = min_not_zero(t->max_sectors, b->max_sectors);
 	t->max_user_sectors = min_not_zero(t->max_user_sectors,
 			b->max_user_sectors);
diff --git a/drivers/block/brd.c b/drivers/block/brd.c
index d77deb571dbd06..a300645cd9d4a5 100644
--- a/drivers/block/brd.c
+++ b/drivers/block/brd.c
@@ -335,7 +335,8 @@ static int brd_alloc(int i)
 		.max_hw_discard_sectors	= UINT_MAX,
 		.max_discard_segments	= 1,
 		.discard_granularity	= PAGE_SIZE,
-		.features		= BLK_FEAT_SYNCHRONOUS,
+		.features		= BLK_FEAT_SYNCHRONOUS |
+					  BLK_FEAT_NOWAIT,
 	};
 
 	list_for_each_entry(brd, &brd_devices, brd_list)
@@ -367,7 +368,6 @@ static int brd_alloc(int i)
 	strscpy(disk->disk_name, buf, DISK_NAME_LEN);
 	set_capacity(disk, rd_size * 2);
 	
-	blk_queue_flag_set(QUEUE_FLAG_NOWAIT, disk->queue);
 	err = add_disk(disk);
 	if (err)
 		goto out_cleanup_disk;
diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index aaf379cb15d91f..84d636712c7284 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -582,7 +582,7 @@ int dm_split_args(int *argc, char ***argvp, char *input)
 static void dm_set_stacking_limits(struct queue_limits *limits)
 {
 	blk_set_stacking_limits(limits);
-	limits->features |= BLK_FEAT_IO_STAT;
+	limits->features |= BLK_FEAT_IO_STAT | BLK_FEAT_NOWAIT;
 }
 
 /*
@@ -1746,12 +1746,6 @@ static bool dm_table_supports_write_zeroes(struct dm_table *t)
 	return true;
 }
 
-static int device_not_nowait_capable(struct dm_target *ti, struct dm_dev *dev,
-				     sector_t start, sector_t len, void *data)
-{
-	return !bdev_nowait(dev->bdev);
-}
-
 static bool dm_table_supports_nowait(struct dm_table *t)
 {
 	for (unsigned int i = 0; i < t->num_targets; i++) {
@@ -1759,10 +1753,6 @@ static bool dm_table_supports_nowait(struct dm_table *t)
 
 		if (!dm_target_supports_nowait(ti->type))
 			return false;
-
-		if (!ti->type->iterate_devices ||
-		    ti->type->iterate_devices(ti, device_not_nowait_capable, NULL))
-			return false;
 	}
 
 	return true;
@@ -1824,10 +1814,8 @@ int dm_table_set_restrictions(struct dm_table *t, struct request_queue *q,
 {
 	int r;
 
-	if (dm_table_supports_nowait(t))
-		blk_queue_flag_set(QUEUE_FLAG_NOWAIT, q);
-	else
-		blk_queue_flag_clear(QUEUE_FLAG_NOWAIT, q);
+	if (!dm_table_supports_nowait(t))
+		limits->features &= ~BLK_FEAT_NOWAIT;
 
 	if (!dm_table_supports_discards(t)) {
 		limits->max_hw_discard_sectors = 0;
diff --git a/drivers/md/md.c b/drivers/md/md.c
index 8db0db8d5a27ac..f1c7d4f281c521 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -5788,7 +5788,7 @@ struct mddev *md_alloc(dev_t dev, char *name)
 	int error;
 	struct queue_limits lim = {
 		.features		= BLK_FEAT_WRITE_CACHE | BLK_FEAT_FUA |
-					  BLK_FEAT_IO_STAT,
+					  BLK_FEAT_IO_STAT | BLK_FEAT_NOWAIT,
 	};
 
 	/*
@@ -6150,13 +6150,6 @@ int md_run(struct mddev *mddev)
 		}
 	}
 
-	if (!mddev_is_dm(mddev)) {
-		struct request_queue *q = mddev->gendisk->queue;
-
-		/* Set the NOWAIT flags if all underlying devices support it */
-		if (nowait)
-			blk_queue_flag_set(QUEUE_FLAG_NOWAIT, q);
-	}
 	if (pers->sync_request) {
 		if (mddev->kobj.sd &&
 		    sysfs_create_group(&mddev->kobj, &md_redundancy_group))
@@ -7115,15 +7108,6 @@ static int hot_add_disk(struct mddev *mddev, dev_t dev)
 	set_bit(MD_SB_CHANGE_DEVS, &mddev->sb_flags);
 	if (!mddev->thread)
 		md_update_sb(mddev, 1);
-	/*
-	 * If the new disk does not support REQ_NOWAIT,
-	 * disable on the whole MD.
-	 */
-	if (!bdev_nowait(rdev->bdev)) {
-		pr_info("%s: Disabling nowait because %pg does not support nowait\n",
-			mdname(mddev), rdev->bdev);
-		blk_queue_flag_clear(QUEUE_FLAG_NOWAIT, mddev->gendisk->queue);
-	}
 	/*
 	 * Kick recovery, maybe this spare has to be added to the
 	 * array immediately.
diff --git a/drivers/nvme/host/multipath.c b/drivers/nvme/host/multipath.c
index 173796f2ddea9f..61a162c9cf4e6c 100644
--- a/drivers/nvme/host/multipath.c
+++ b/drivers/nvme/host/multipath.c
@@ -538,7 +538,7 @@ int nvme_mpath_alloc_disk(struct nvme_ctrl *ctrl, struct nvme_ns_head *head)
 
 	blk_set_stacking_limits(&lim);
 	lim.dma_alignment = 3;
-	lim.features |= BLK_FEAT_IO_STAT;
+	lim.features |= BLK_FEAT_IO_STAT | BLK_FEAT_NOWAIT;
 	if (head->ids.csi != NVME_CSI_ZNS)
 		lim.max_zone_append_sectors = 0;
 
@@ -550,7 +550,6 @@ int nvme_mpath_alloc_disk(struct nvme_ctrl *ctrl, struct nvme_ns_head *head)
 	sprintf(head->disk->disk_name, "nvme%dn%d",
 			ctrl->subsys->instance, head->instance);
 
-	blk_queue_flag_set(QUEUE_FLAG_NOWAIT, head->disk->queue);
 	/*
 	 * This assumes all controllers that refer to a namespace either
 	 * support poll queues or not.  That is not a strict guarantee,
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index cee7b44a142513..f3d4519d609d95 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -304,6 +304,9 @@ enum {
 
 	/* always completes in submit context */
 	BLK_FEAT_SYNCHRONOUS			= (1u << 6),
+
+	/* supports REQ_NOWAIT */
+	BLK_FEAT_NOWAIT				= (1u << 7),
 };
 
 /*
@@ -580,12 +583,10 @@ struct request_queue {
 #define QUEUE_FLAG_ZONE_RESETALL 26	/* supports Zone Reset All */
 #define QUEUE_FLAG_RQ_ALLOC_TIME 27	/* record rq->alloc_time_ns */
 #define QUEUE_FLAG_HCTX_ACTIVE	28	/* at least one blk-mq hctx is active */
-#define QUEUE_FLAG_NOWAIT       29	/* device supports NOWAIT */
 #define QUEUE_FLAG_SQ_SCHED     30	/* single queue style io dispatch */
 #define QUEUE_FLAG_SKIP_TAGSET_QUIESCE	31 /* quiesce_tagset skip the queue*/
 
-#define QUEUE_FLAG_MQ_DEFAULT	((1UL << QUEUE_FLAG_SAME_COMP) |	\
-				 (1UL << QUEUE_FLAG_NOWAIT))
+#define QUEUE_FLAG_MQ_DEFAULT	(1UL << QUEUE_FLAG_SAME_COMP)
 
 void blk_queue_flag_set(unsigned int flag, struct request_queue *q);
 void blk_queue_flag_clear(unsigned int flag, struct request_queue *q);
@@ -1348,7 +1349,7 @@ static inline bool bdev_fua(struct block_device *bdev)
 
 static inline bool bdev_nowait(struct block_device *bdev)
 {
-	return test_bit(QUEUE_FLAG_NOWAIT, &bdev_get_queue(bdev)->queue_flags);
+	return bdev->bd_disk->queue->limits.features & BLK_FEAT_NOWAIT;
 }
 
 static inline bool bdev_is_zoned(struct block_device *bdev)
-- 
2.43.0


