Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C15D9030CE
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 07:27:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737642.1144110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGu2g-0005CX-Fo; Tue, 11 Jun 2024 05:27:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737642.1144110; Tue, 11 Jun 2024 05:27:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGu2g-0005Ab-B6; Tue, 11 Jun 2024 05:27:34 +0000
Received: by outflank-mailman (input) for mailman id 737642;
 Tue, 11 Jun 2024 05:27:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M7An=NN=bombadil.srs.infradead.org=BATV+2fedbe304aabaf399917+7597+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1sGtw1-0006gk-89
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 05:20:41 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 550115b2-27b2-11ef-b4bb-af5377834399;
 Tue, 11 Jun 2024 07:20:37 +0200 (CEST)
Received: from
 2a02-8389-2341-5b80-cdb4-8e7d-405d-6b77.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:cdb4:8e7d:405d:6b77] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1sGtvc-00000007RFZ-1Iu6; Tue, 11 Jun 2024 05:20:17 +0000
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
X-Inumbo-ID: 550115b2-27b2-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=WGv6hqDdXniN9xi+a0/kjXE1W6HmXn1u2/8L3CscUq8=; b=qK5xGOTWJ4lyFVCf3JTHyru2av
	cFRouC9fjjmHKE2CB+9AVYtjJDoOLnohkj4yc4r541cJW5dAd5UJaXYbHI3E/7qhQuTj7GLDdfaXH
	lTanTUcNIgbnsGSHMI0vN729Mu5vuNzSyWgo9BcoxokSVt3LAleYun3Rg5q3gTBnJpm4qusohVRIK
	IXe0lk81L74nL/zArBR+rLmOhEbwgG4AvjIhjKhAmAhkMV5+TbnCgJoSUV4rK9zuGqclI+IVpJ013
	9zyFQkQF4OHMuGL+301mX8NXlt4IGKa1tCEiwyJWxWGD+cpIdKjkHd5XqgvVAPb7H1VQfekwCSShh
	8skxxz8A==;
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
Subject: [PATCH 15/26] block: move the add_random flag to queue_limits
Date: Tue, 11 Jun 2024 07:19:15 +0200
Message-ID: <20240611051929.513387-16-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240611051929.513387-1-hch@lst.de>
References: <20240611051929.513387-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Move the add_random flag into the queue_limits feature field so that it
can be set atomically and all I/O is frozen when changing the flag.

Note that this also removes code from dm to clear the flag based on
the underlying devices, which can't be reached as dm devices will
always start out without the flag set.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-mq-debugfs.c            |  1 -
 block/blk-sysfs.c                 |  6 +++---
 drivers/block/mtip32xx/mtip32xx.c |  1 -
 drivers/md/dm-table.c             | 18 ------------------
 drivers/mmc/core/queue.c          |  2 --
 drivers/mtd/mtd_blkdevs.c         |  3 ---
 drivers/s390/block/scm_blk.c      |  4 ----
 drivers/scsi/scsi_lib.c           |  3 +--
 drivers/scsi/sd.c                 | 11 +++--------
 include/linux/blkdev.h            |  5 +++--
 10 files changed, 10 insertions(+), 44 deletions(-)

diff --git a/block/blk-mq-debugfs.c b/block/blk-mq-debugfs.c
index 4d0e62ec88f033..6b7edb50bfd3fa 100644
--- a/block/blk-mq-debugfs.c
+++ b/block/blk-mq-debugfs.c
@@ -86,7 +86,6 @@ static const char *const blk_queue_flag_name[] = {
 	QUEUE_FLAG_NAME(FAIL_IO),
 	QUEUE_FLAG_NAME(IO_STAT),
 	QUEUE_FLAG_NAME(NOXMERGES),
-	QUEUE_FLAG_NAME(ADD_RANDOM),
 	QUEUE_FLAG_NAME(SYNCHRONOUS),
 	QUEUE_FLAG_NAME(SAME_FORCE),
 	QUEUE_FLAG_NAME(INIT_DONE),
diff --git a/block/blk-sysfs.c b/block/blk-sysfs.c
index 637ed3bbbfb46f..9174aca3b85526 100644
--- a/block/blk-sysfs.c
+++ b/block/blk-sysfs.c
@@ -323,7 +323,7 @@ queue_##name##_store(struct request_queue *q, const char *page, size_t count) \
 }
 
 QUEUE_SYSFS_FEATURE(rotational, BLK_FEAT_ROTATIONAL)
-QUEUE_SYSFS_BIT_FNS(random, ADD_RANDOM, 0);
+QUEUE_SYSFS_FEATURE(add_random, BLK_FEAT_ADD_RANDOM)
 QUEUE_SYSFS_BIT_FNS(iostats, IO_STAT, 0);
 QUEUE_SYSFS_BIT_FNS(stable_writes, STABLE_WRITES, 0);
 #undef QUEUE_SYSFS_BIT_FNS
@@ -561,7 +561,7 @@ static struct queue_sysfs_entry queue_hw_sector_size_entry = {
 
 QUEUE_RW_ENTRY(queue_rotational, "rotational");
 QUEUE_RW_ENTRY(queue_iostats, "iostats");
-QUEUE_RW_ENTRY(queue_random, "add_random");
+QUEUE_RW_ENTRY(queue_add_random, "add_random");
 QUEUE_RW_ENTRY(queue_stable_writes, "stable_writes");
 
 #ifdef CONFIG_BLK_WBT
@@ -665,7 +665,7 @@ static struct attribute *queue_attrs[] = {
 	&queue_nomerges_entry.attr,
 	&queue_iostats_entry.attr,
 	&queue_stable_writes_entry.attr,
-	&queue_random_entry.attr,
+	&queue_add_random_entry.attr,
 	&queue_poll_entry.attr,
 	&queue_wc_entry.attr,
 	&queue_fua_entry.attr,
diff --git a/drivers/block/mtip32xx/mtip32xx.c b/drivers/block/mtip32xx/mtip32xx.c
index 1dbbf72659d549..c6ef0546ffc9d2 100644
--- a/drivers/block/mtip32xx/mtip32xx.c
+++ b/drivers/block/mtip32xx/mtip32xx.c
@@ -3485,7 +3485,6 @@ static int mtip_block_initialize(struct driver_data *dd)
 		goto start_service_thread;
 
 	/* Set device limits. */
-	blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, dd->queue);
 	dma_set_max_seg_size(&dd->pdev->dev, 0x400000);
 
 	/* Set the capacity of the device in 512 byte sectors. */
diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index 3514a57c2df5d2..7654babc2775c1 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -1716,14 +1716,6 @@ static int device_dax_write_cache_enabled(struct dm_target *ti,
 	return false;
 }
 
-static int device_is_not_random(struct dm_target *ti, struct dm_dev *dev,
-			     sector_t start, sector_t len, void *data)
-{
-	struct request_queue *q = bdev_get_queue(dev->bdev);
-
-	return !blk_queue_add_random(q);
-}
-
 static int device_not_write_zeroes_capable(struct dm_target *ti, struct dm_dev *dev,
 					   sector_t start, sector_t len, void *data)
 {
@@ -1876,16 +1868,6 @@ int dm_table_set_restrictions(struct dm_table *t, struct request_queue *q,
 	else
 		blk_queue_flag_clear(QUEUE_FLAG_STABLE_WRITES, q);
 
-	/*
-	 * Determine whether or not this queue's I/O timings contribute
-	 * to the entropy pool, Only request-based targets use this.
-	 * Clear QUEUE_FLAG_ADD_RANDOM if any underlying device does not
-	 * have it set.
-	 */
-	if (blk_queue_add_random(q) &&
-	    dm_table_any_dev_attr(t, device_is_not_random, NULL))
-		blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, q);
-
 	/*
 	 * For a zoned target, setup the zones related queue attributes
 	 * and resources necessary for zone append emulation if necessary.
diff --git a/drivers/mmc/core/queue.c b/drivers/mmc/core/queue.c
index b4f62fa845864c..da00904d4a3c7e 100644
--- a/drivers/mmc/core/queue.c
+++ b/drivers/mmc/core/queue.c
@@ -387,8 +387,6 @@ static struct gendisk *mmc_alloc_disk(struct mmc_queue *mq,
 		blk_queue_flag_set(QUEUE_FLAG_STABLE_WRITES, mq->queue);
 	blk_queue_rq_timeout(mq->queue, 60 * HZ);
 
-	blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, mq->queue);
-
 	dma_set_max_seg_size(mmc_dev(host), queue_max_segment_size(mq->queue));
 
 	INIT_WORK(&mq->recovery_work, mmc_mq_recovery_handler);
diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index bf8369ce7ddf1d..47ead84407cdcf 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -374,9 +374,6 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 	/* Create the request queue */
 	spin_lock_init(&new->queue_lock);
 	INIT_LIST_HEAD(&new->rq_list);
-
-	blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, new->rq);
-
 	gd->queue = new->rq;
 
 	if (new->readonly)
diff --git a/drivers/s390/block/scm_blk.c b/drivers/s390/block/scm_blk.c
index 2e2309fa9a0b34..3fcfe029db1b3a 100644
--- a/drivers/s390/block/scm_blk.c
+++ b/drivers/s390/block/scm_blk.c
@@ -439,7 +439,6 @@ int scm_blk_dev_setup(struct scm_blk_dev *bdev, struct scm_device *scmdev)
 		.logical_block_size	= 1 << 12,
 	};
 	unsigned int devindex;
-	struct request_queue *rq;
 	int len, ret;
 
 	lim.max_segments = min(scmdev->nr_max_block,
@@ -474,9 +473,6 @@ int scm_blk_dev_setup(struct scm_blk_dev *bdev, struct scm_device *scmdev)
 		ret = PTR_ERR(bdev->gendisk);
 		goto out_tag;
 	}
-	rq = bdev->rq = bdev->gendisk->queue;
-	blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, rq);
-
 	bdev->gendisk->private_data = scmdev;
 	bdev->gendisk->fops = &scm_blk_devops;
 	bdev->gendisk->major = scm_major;
diff --git a/drivers/scsi/scsi_lib.c b/drivers/scsi/scsi_lib.c
index ec39acc986d6ec..54f771ec8cfb5e 100644
--- a/drivers/scsi/scsi_lib.c
+++ b/drivers/scsi/scsi_lib.c
@@ -631,8 +631,7 @@ static bool scsi_end_request(struct request *req, blk_status_t error,
 	if (blk_update_request(req, error, bytes))
 		return true;
 
-	// XXX:
-	if (blk_queue_add_random(q))
+	if (q->limits.features & BLK_FEAT_ADD_RANDOM)
 		add_disk_randomness(req->q->disk);
 
 	WARN_ON_ONCE(!blk_rq_is_passthrough(req) &&
diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index 254b00f896dbb4..6b645bec6c4a56 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -3297,7 +3297,6 @@ static void sd_read_block_limits_ext(struct scsi_disk *sdkp)
 static void sd_read_block_characteristics(struct scsi_disk *sdkp,
 		struct queue_limits *lim)
 {
-	struct request_queue *q = sdkp->disk->queue;
 	struct scsi_vpd *vpd;
 	u16 rot;
 
@@ -3313,10 +3312,8 @@ static void sd_read_block_characteristics(struct scsi_disk *sdkp,
 	sdkp->zoned = (vpd->data[8] >> 4) & 3;
 	rcu_read_unlock();
 
-	if (rot == 1) {
-		lim->features &= ~BLK_FEAT_ROTATIONAL;
-		blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, q);
-	}
+	if (rot == 1)
+		lim->features &= ~(BLK_FEAT_ROTATIONAL | BLK_FEAT_ADD_RANDOM);
 
 	if (!sdkp->first_scan)
 		return;
@@ -3595,7 +3592,6 @@ static int sd_revalidate_disk(struct gendisk *disk)
 {
 	struct scsi_disk *sdkp = scsi_disk(disk);
 	struct scsi_device *sdp = sdkp->device;
-	struct request_queue *q = sdkp->disk->queue;
 	sector_t old_capacity = sdkp->capacity;
 	struct queue_limits lim;
 	unsigned char *buffer;
@@ -3642,8 +3638,7 @@ static int sd_revalidate_disk(struct gendisk *disk)
 		 * cause this to be updated correctly and any device which
 		 * doesn't support it should be treated as rotational.
 		 */
-		lim.features |= BLK_FEAT_ROTATIONAL;
-		blk_queue_flag_set(QUEUE_FLAG_ADD_RANDOM, q);
+		lim.features |= (BLK_FEAT_ROTATIONAL | BLK_FEAT_ADD_RANDOM);
 
 		if (scsi_device_supports_vpd(sdp)) {
 			sd_read_block_provisioning(sdkp);
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index c103f5adc17d84..e6a2382e21c4fe 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -292,6 +292,9 @@ enum {
 
 	/* rotational device (hard drive or floppy) */
 	BLK_FEAT_ROTATIONAL			= (1u << 2),
+
+	/* contributes to the random number pool */
+	BLK_FEAT_ADD_RANDOM			= (1u << 3),
 };
 
 /*
@@ -557,7 +560,6 @@ struct request_queue {
 #define QUEUE_FLAG_FAIL_IO	5	/* fake timeout */
 #define QUEUE_FLAG_IO_STAT	7	/* do disk/partitions IO accounting */
 #define QUEUE_FLAG_NOXMERGES	9	/* No extended merges */
-#define QUEUE_FLAG_ADD_RANDOM	10	/* Contributes to random pool */
 #define QUEUE_FLAG_SYNCHRONOUS	11	/* always completes in submit context */
 #define QUEUE_FLAG_SAME_FORCE	12	/* force complete on same CPU */
 #define QUEUE_FLAG_INIT_DONE	14	/* queue is initialized */
@@ -591,7 +593,6 @@ bool blk_queue_flag_test_and_set(unsigned int flag, struct request_queue *q);
 	test_bit(QUEUE_FLAG_NOXMERGES, &(q)->queue_flags)
 #define blk_queue_nonrot(q)	((q)->limits.features & BLK_FEAT_ROTATIONAL)
 #define blk_queue_io_stat(q)	test_bit(QUEUE_FLAG_IO_STAT, &(q)->queue_flags)
-#define blk_queue_add_random(q)	test_bit(QUEUE_FLAG_ADD_RANDOM, &(q)->queue_flags)
 #define blk_queue_zone_resetall(q)	\
 	test_bit(QUEUE_FLAG_ZONE_RESETALL, &(q)->queue_flags)
 #define blk_queue_dax(q)	test_bit(QUEUE_FLAG_DAX, &(q)->queue_flags)
-- 
2.43.0


