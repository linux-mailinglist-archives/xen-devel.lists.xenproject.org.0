Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E24BF90A3F9
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 08:07:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.741654.1148336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ5Wh-0006tM-GG; Mon, 17 Jun 2024 06:07:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 741654.1148336; Mon, 17 Jun 2024 06:07:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ5Wh-0006l6-5O; Mon, 17 Jun 2024 06:07:35 +0000
Received: by outflank-mailman (input) for mailman id 741654;
 Mon, 17 Jun 2024 06:07:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvID=NT=bombadil.srs.infradead.org=BATV+625ba2f6da96caf54eae+7603+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1sJ5WE-0001PY-9n
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 06:07:06 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0f844a7-2c6f-11ef-b4bb-af5377834399;
 Mon, 17 Jun 2024 08:07:04 +0200 (CEST)
Received: from [91.187.204.140] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1sJ5Vs-00000009J7N-36FO; Mon, 17 Jun 2024 06:06:45 +0000
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
X-Inumbo-ID: d0f844a7-2c6f-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=j3/q6++/T0UiysNKT6ebBR3awbgnCQMkBzrPFvHZKQg=; b=NJZCojfZFjIHjdeThEB5UEO5Nk
	QNC7VhBPWkRcqgkZKxl1pMve2IPbjVKHCTiWE0oKqZkGQr382Hsf+pdh3k2aOSBzxX8pT1Od1LR0p
	ULQFxibinwOrILLy4a8KYEfVWq/uqIsJQzmH/PwZ78+6OG82/CKXLijYXDFRpJ8c0KYO0YwHgQ9La
	K6+cfGf+zXrSVcf79qtnNY1fK2RQPhSPeFvB9iVrCfamm6IUC5lHWTbx3xeT4q/cfnpVGmpwMJfhK
	UzcfgZYbTigV2cdi9g61aNGRbJgATnWpjl0PbssfRrhfVySkFp+s2qp339sm8xlTjxogm8On27Zy6
	FTsiRxhA==;
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
Subject: [PATCH 22/26] block: move the zoned flag into the features field
Date: Mon, 17 Jun 2024 08:04:49 +0200
Message-ID: <20240617060532.127975-23-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240617060532.127975-1-hch@lst.de>
References: <20240617060532.127975-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Move the zoned flags into the features field to reclaim a little
bit of space.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
 block/blk-settings.c           |  5 ++---
 drivers/block/null_blk/zoned.c |  2 +-
 drivers/block/ublk_drv.c       |  2 +-
 drivers/block/virtio_blk.c     |  5 +++--
 drivers/md/dm-table.c          | 11 ++++++-----
 drivers/md/dm-zone.c           |  2 +-
 drivers/md/dm-zoned-target.c   |  2 +-
 drivers/nvme/host/zns.c        |  2 +-
 drivers/scsi/sd_zbc.c          |  2 +-
 include/linux/blkdev.h         |  9 ++++++---
 10 files changed, 23 insertions(+), 19 deletions(-)

diff --git a/block/blk-settings.c b/block/blk-settings.c
index 026ba68d829856..96e07f24bd9aa1 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -68,7 +68,7 @@ static void blk_apply_bdi_limits(struct backing_dev_info *bdi,
 
 static int blk_validate_zoned_limits(struct queue_limits *lim)
 {
-	if (!lim->zoned) {
+	if (!(lim->features & BLK_FEAT_ZONED)) {
 		if (WARN_ON_ONCE(lim->max_open_zones) ||
 		    WARN_ON_ONCE(lim->max_active_zones) ||
 		    WARN_ON_ONCE(lim->zone_write_granularity) ||
@@ -602,8 +602,7 @@ int blk_stack_limits(struct queue_limits *t, struct queue_limits *b,
 						   b->max_secure_erase_sectors);
 	t->zone_write_granularity = max(t->zone_write_granularity,
 					b->zone_write_granularity);
-	t->zoned = max(t->zoned, b->zoned);
-	if (!t->zoned) {
+	if (!(t->features & BLK_FEAT_ZONED)) {
 		t->zone_write_granularity = 0;
 		t->max_zone_append_sectors = 0;
 	}
diff --git a/drivers/block/null_blk/zoned.c b/drivers/block/null_blk/zoned.c
index f118d304f31080..ca8e739e76b981 100644
--- a/drivers/block/null_blk/zoned.c
+++ b/drivers/block/null_blk/zoned.c
@@ -158,7 +158,7 @@ int null_init_zoned_dev(struct nullb_device *dev,
 		sector += dev->zone_size_sects;
 	}
 
-	lim->zoned = true;
+	lim->features |= BLK_FEAT_ZONED;
 	lim->chunk_sectors = dev->zone_size_sects;
 	lim->max_zone_append_sectors = dev->zone_append_max_sectors;
 	lim->max_open_zones = dev->zone_max_open;
diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
index 4fcde099935868..69c16018cbb19a 100644
--- a/drivers/block/ublk_drv.c
+++ b/drivers/block/ublk_drv.c
@@ -2196,7 +2196,7 @@ static int ublk_ctrl_start_dev(struct ublk_device *ub, struct io_uring_cmd *cmd)
 		if (!IS_ENABLED(CONFIG_BLK_DEV_ZONED))
 			return -EOPNOTSUPP;
 
-		lim.zoned = true;
+		lim.features |= BLK_FEAT_ZONED;
 		lim.max_active_zones = p->max_active_zones;
 		lim.max_open_zones =  p->max_open_zones;
 		lim.max_zone_append_sectors = p->max_zone_append_sectors;
diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
index 13a2f24f176628..cea45b296f8bec 100644
--- a/drivers/block/virtio_blk.c
+++ b/drivers/block/virtio_blk.c
@@ -728,7 +728,7 @@ static int virtblk_read_zoned_limits(struct virtio_blk *vblk,
 
 	dev_dbg(&vdev->dev, "probing host-managed zoned device\n");
 
-	lim->zoned = true;
+	lim->features |= BLK_FEAT_ZONED;
 
 	virtio_cread(vdev, struct virtio_blk_config,
 		     zoned.max_open_zones, &v);
@@ -1546,7 +1546,8 @@ static int virtblk_probe(struct virtio_device *vdev)
 	 * All steps that follow use the VQs therefore they need to be
 	 * placed after the virtio_device_ready() call above.
 	 */
-	if (IS_ENABLED(CONFIG_BLK_DEV_ZONED) && lim.zoned) {
+	if (IS_ENABLED(CONFIG_BLK_DEV_ZONED) &&
+	    (lim.features & BLK_FEAT_ZONED)) {
 		blk_queue_flag_set(QUEUE_FLAG_ZONE_RESETALL, vblk->disk->queue);
 		err = blk_revalidate_disk_zones(vblk->disk);
 		if (err)
diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index ca1f136575cff4..df6313c3fe6ba4 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -1605,12 +1605,12 @@ int dm_calculate_queue_limits(struct dm_table *t,
 		ti->type->iterate_devices(ti, dm_set_device_limits,
 					  &ti_limits);
 
-		if (!zoned && ti_limits.zoned) {
+		if (!zoned && (ti_limits.features & BLK_FEAT_ZONED)) {
 			/*
 			 * After stacking all limits, validate all devices
 			 * in table support this zoned model and zone sectors.
 			 */
-			zoned = ti_limits.zoned;
+			zoned = (ti_limits.features & BLK_FEAT_ZONED);
 			zone_sectors = ti_limits.chunk_sectors;
 		}
 
@@ -1658,12 +1658,12 @@ int dm_calculate_queue_limits(struct dm_table *t,
 	 *   zoned model on host-managed zoned block devices.
 	 * BUT...
 	 */
-	if (limits->zoned) {
+	if (limits->features & BLK_FEAT_ZONED) {
 		/*
 		 * ...IF the above limits stacking determined a zoned model
 		 * validate that all of the table's devices conform to it.
 		 */
-		zoned = limits->zoned;
+		zoned = limits->features & BLK_FEAT_ZONED;
 		zone_sectors = limits->chunk_sectors;
 	}
 	if (validate_hardware_zoned(t, zoned, zone_sectors))
@@ -1834,7 +1834,8 @@ int dm_table_set_restrictions(struct dm_table *t, struct request_queue *q,
 	 * For a zoned target, setup the zones related queue attributes
 	 * and resources necessary for zone append emulation if necessary.
 	 */
-	if (IS_ENABLED(CONFIG_BLK_DEV_ZONED) && limits->zoned) {
+	if (IS_ENABLED(CONFIG_BLK_DEV_ZONED) &&
+	    (limits->features & limits->features & BLK_FEAT_ZONED)) {
 		r = dm_set_zones_restrictions(t, q, limits);
 		if (r)
 			return r;
diff --git a/drivers/md/dm-zone.c b/drivers/md/dm-zone.c
index 5d66d916730efa..88d313229b43ff 100644
--- a/drivers/md/dm-zone.c
+++ b/drivers/md/dm-zone.c
@@ -263,7 +263,7 @@ int dm_set_zones_restrictions(struct dm_table *t, struct request_queue *q,
 	if (nr_conv_zones >= ret) {
 		lim->max_open_zones = 0;
 		lim->max_active_zones = 0;
-		lim->zoned = false;
+		lim->features &= ~BLK_FEAT_ZONED;
 		clear_bit(DMF_EMULATE_ZONE_APPEND, &md->flags);
 		disk->nr_zones = 0;
 		return 0;
diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
index 12236e6f46f39c..cd0ee144973f9f 100644
--- a/drivers/md/dm-zoned-target.c
+++ b/drivers/md/dm-zoned-target.c
@@ -1009,7 +1009,7 @@ static void dmz_io_hints(struct dm_target *ti, struct queue_limits *limits)
 	limits->max_sectors = chunk_sectors;
 
 	/* We are exposing a drive-managed zoned block device */
-	limits->zoned = false;
+	limits->features &= ~BLK_FEAT_ZONED;
 }
 
 /*
diff --git a/drivers/nvme/host/zns.c b/drivers/nvme/host/zns.c
index 77aa0f440a6d2a..06f2417aa50de7 100644
--- a/drivers/nvme/host/zns.c
+++ b/drivers/nvme/host/zns.c
@@ -108,7 +108,7 @@ int nvme_query_zone_info(struct nvme_ns *ns, unsigned lbaf,
 void nvme_update_zone_info(struct nvme_ns *ns, struct queue_limits *lim,
 		struct nvme_zone_info *zi)
 {
-	lim->zoned = 1;
+	lim->features |= BLK_FEAT_ZONED;
 	lim->max_open_zones = zi->max_open_zones;
 	lim->max_active_zones = zi->max_active_zones;
 	lim->max_zone_append_sectors = ns->ctrl->max_zone_append;
diff --git a/drivers/scsi/sd_zbc.c b/drivers/scsi/sd_zbc.c
index 360ec980499529..d3f84665946ec4 100644
--- a/drivers/scsi/sd_zbc.c
+++ b/drivers/scsi/sd_zbc.c
@@ -601,7 +601,7 @@ int sd_zbc_read_zones(struct scsi_disk *sdkp, struct queue_limits *lim,
 	if (sdkp->device->type != TYPE_ZBC)
 		return 0;
 
-	lim->zoned = true;
+	lim->features |= BLK_FEAT_ZONED;
 
 	/*
 	 * Per ZBC and ZAC specifications, writes in sequential write required
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index cd27b66cbacc00..bdc30c1fb1b57b 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -313,6 +313,9 @@ enum {
 
 	/* supports I/O polling */
 	BLK_FEAT_POLL				= (1u << 9),
+
+	/* is a zoned device */
+	BLK_FEAT_ZONED				= (1u << 10),
 };
 
 /*
@@ -320,7 +323,7 @@ enum {
  */
 #define BLK_FEAT_INHERIT_MASK \
 	(BLK_FEAT_WRITE_CACHE | BLK_FEAT_FUA | BLK_FEAT_ROTATIONAL | \
-	 BLK_FEAT_STABLE_WRITES)
+	 BLK_FEAT_STABLE_WRITES | BLK_FEAT_ZONED)
 
 /* internal flags in queue_limits.flags */
 enum {
@@ -372,7 +375,6 @@ struct queue_limits {
 	unsigned char		misaligned;
 	unsigned char		discard_misaligned;
 	unsigned char		raid_partial_stripes_expensive;
-	bool			zoned;
 	unsigned int		max_open_zones;
 	unsigned int		max_active_zones;
 
@@ -654,7 +656,8 @@ static inline enum rpm_status queue_rpm_status(struct request_queue *q)
 
 static inline bool blk_queue_is_zoned(struct request_queue *q)
 {
-	return IS_ENABLED(CONFIG_BLK_DEV_ZONED) && q->limits.zoned;
+	return IS_ENABLED(CONFIG_BLK_DEV_ZONED) &&
+		(q->limits.features & BLK_FEAT_ZONED);
 }
 
 #ifdef CONFIG_BLK_DEV_ZONED
-- 
2.43.0


