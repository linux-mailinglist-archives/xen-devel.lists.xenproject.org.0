Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB7E90A3F7
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 08:07:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.741653.1148326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ5Wg-0006aG-Hw; Mon, 17 Jun 2024 06:07:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 741653.1148326; Mon, 17 Jun 2024 06:07:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ5Wg-0006T7-6C; Mon, 17 Jun 2024 06:07:34 +0000
Received: by outflank-mailman (input) for mailman id 741653;
 Mon, 17 Jun 2024 06:07:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvID=NT=bombadil.srs.infradead.org=BATV+625ba2f6da96caf54eae+7603+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1sJ5WE-0001Pt-AZ
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 06:07:06 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1bb2b65-2c6f-11ef-90a3-e314d9c70b13;
 Mon, 17 Jun 2024 08:07:05 +0200 (CEST)
Received: from [91.187.204.140] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1sJ5Vv-00000009JAE-3Sf5; Mon, 17 Jun 2024 06:06:49 +0000
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
X-Inumbo-ID: d1bb2b65-2c6f-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=vn3qKVXlb3dlpaG1FcP/uUTFvMHCHs0BCPN12d+72uQ=; b=18/16Uiu0l0OVFyCZgOUXI2UsQ
	7OOWoO5104rZ5Q2N8+ViZ3o5DjJxOFVBX+DeTfk5Fu9T9peg/YzVw5MYKf75BMff7Rn2YsPuZRF7y
	Qn3+12Mn+XP5Kc+BUIHvcaOICBzIdGaC/GndpZkR9W1BpcHpbEK3suPTPv+DvSo1wSPu4trKeehaU
	Guot6zH5s3ev2zWqGmquOst4ebK8LrA0s+OXaU5AWBWdnA8RKnDPMViBpuBdYwmfTGtHxnwM1bpVU
	OdPBxcnm4lfgYfk5G1R4T5Kunio2RCvH36OEuh70hsWl738wSVw6ey0RVXhYgcn7dlGrjbNNKbC3U
	9ZIBPwag==;
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
Subject: [PATCH 23/26] block: move the zone_resetall flag to queue_limits
Date: Mon, 17 Jun 2024 08:04:50 +0200
Message-ID: <20240617060532.127975-24-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240617060532.127975-1-hch@lst.de>
References: <20240617060532.127975-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Move the zone_resetall flag into the queue_limits feature field so that
it can be set atomically with the queue frozen.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
 block/blk-mq-debugfs.c         | 1 -
 drivers/block/null_blk/zoned.c | 3 +--
 drivers/block/ublk_drv.c       | 4 +---
 drivers/block/virtio_blk.c     | 3 +--
 drivers/nvme/host/zns.c        | 3 +--
 drivers/scsi/sd_zbc.c          | 5 +----
 include/linux/blkdev.h         | 6 ++++--
 7 files changed, 9 insertions(+), 16 deletions(-)

diff --git a/block/blk-mq-debugfs.c b/block/blk-mq-debugfs.c
index 3a21527913840d..f2fd72f4414ae8 100644
--- a/block/blk-mq-debugfs.c
+++ b/block/blk-mq-debugfs.c
@@ -91,7 +91,6 @@ static const char *const blk_queue_flag_name[] = {
 	QUEUE_FLAG_NAME(REGISTERED),
 	QUEUE_FLAG_NAME(QUIESCED),
 	QUEUE_FLAG_NAME(PCI_P2PDMA),
-	QUEUE_FLAG_NAME(ZONE_RESETALL),
 	QUEUE_FLAG_NAME(RQ_ALLOC_TIME),
 	QUEUE_FLAG_NAME(HCTX_ACTIVE),
 	QUEUE_FLAG_NAME(SQ_SCHED),
diff --git a/drivers/block/null_blk/zoned.c b/drivers/block/null_blk/zoned.c
index ca8e739e76b981..b42c00f1313254 100644
--- a/drivers/block/null_blk/zoned.c
+++ b/drivers/block/null_blk/zoned.c
@@ -158,7 +158,7 @@ int null_init_zoned_dev(struct nullb_device *dev,
 		sector += dev->zone_size_sects;
 	}
 
-	lim->features |= BLK_FEAT_ZONED;
+	lim->features |= BLK_FEAT_ZONED | BLK_FEAT_ZONE_RESETALL;
 	lim->chunk_sectors = dev->zone_size_sects;
 	lim->max_zone_append_sectors = dev->zone_append_max_sectors;
 	lim->max_open_zones = dev->zone_max_open;
@@ -171,7 +171,6 @@ int null_register_zoned_dev(struct nullb *nullb)
 	struct request_queue *q = nullb->q;
 	struct gendisk *disk = nullb->disk;
 
-	blk_queue_flag_set(QUEUE_FLAG_ZONE_RESETALL, q);
 	disk->nr_zones = bdev_nr_zones(disk->part0);
 
 	pr_info("%s: using %s zone append\n",
diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
index 69c16018cbb19a..4fdff13fc23b8a 100644
--- a/drivers/block/ublk_drv.c
+++ b/drivers/block/ublk_drv.c
@@ -248,8 +248,6 @@ static int ublk_dev_param_zoned_validate(const struct ublk_device *ub)
 
 static void ublk_dev_param_zoned_apply(struct ublk_device *ub)
 {
-	blk_queue_flag_set(QUEUE_FLAG_ZONE_RESETALL, ub->ub_disk->queue);
-
 	ub->ub_disk->nr_zones = ublk_get_nr_zones(ub);
 }
 
@@ -2196,7 +2194,7 @@ static int ublk_ctrl_start_dev(struct ublk_device *ub, struct io_uring_cmd *cmd)
 		if (!IS_ENABLED(CONFIG_BLK_DEV_ZONED))
 			return -EOPNOTSUPP;
 
-		lim.features |= BLK_FEAT_ZONED;
+		lim.features |= BLK_FEAT_ZONED | BLK_FEAT_ZONE_RESETALL;
 		lim.max_active_zones = p->max_active_zones;
 		lim.max_open_zones =  p->max_open_zones;
 		lim.max_zone_append_sectors = p->max_zone_append_sectors;
diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
index cea45b296f8bec..6c64a67ab9c901 100644
--- a/drivers/block/virtio_blk.c
+++ b/drivers/block/virtio_blk.c
@@ -728,7 +728,7 @@ static int virtblk_read_zoned_limits(struct virtio_blk *vblk,
 
 	dev_dbg(&vdev->dev, "probing host-managed zoned device\n");
 
-	lim->features |= BLK_FEAT_ZONED;
+	lim->features |= BLK_FEAT_ZONED | BLK_FEAT_ZONE_RESETALL;
 
 	virtio_cread(vdev, struct virtio_blk_config,
 		     zoned.max_open_zones, &v);
@@ -1548,7 +1548,6 @@ static int virtblk_probe(struct virtio_device *vdev)
 	 */
 	if (IS_ENABLED(CONFIG_BLK_DEV_ZONED) &&
 	    (lim.features & BLK_FEAT_ZONED)) {
-		blk_queue_flag_set(QUEUE_FLAG_ZONE_RESETALL, vblk->disk->queue);
 		err = blk_revalidate_disk_zones(vblk->disk);
 		if (err)
 			goto out_cleanup_disk;
diff --git a/drivers/nvme/host/zns.c b/drivers/nvme/host/zns.c
index 06f2417aa50de7..99bb89c2495ae3 100644
--- a/drivers/nvme/host/zns.c
+++ b/drivers/nvme/host/zns.c
@@ -108,13 +108,12 @@ int nvme_query_zone_info(struct nvme_ns *ns, unsigned lbaf,
 void nvme_update_zone_info(struct nvme_ns *ns, struct queue_limits *lim,
 		struct nvme_zone_info *zi)
 {
-	lim->features |= BLK_FEAT_ZONED;
+	lim->features |= BLK_FEAT_ZONED | BLK_FEAT_ZONE_RESETALL;
 	lim->max_open_zones = zi->max_open_zones;
 	lim->max_active_zones = zi->max_active_zones;
 	lim->max_zone_append_sectors = ns->ctrl->max_zone_append;
 	lim->chunk_sectors = ns->head->zsze =
 		nvme_lba_to_sect(ns->head, zi->zone_size);
-	blk_queue_flag_set(QUEUE_FLAG_ZONE_RESETALL, ns->queue);
 }
 
 static void *nvme_zns_alloc_report_buffer(struct nvme_ns *ns,
diff --git a/drivers/scsi/sd_zbc.c b/drivers/scsi/sd_zbc.c
index d3f84665946ec4..f7067afac79c14 100644
--- a/drivers/scsi/sd_zbc.c
+++ b/drivers/scsi/sd_zbc.c
@@ -592,8 +592,6 @@ int sd_zbc_revalidate_zones(struct scsi_disk *sdkp)
 int sd_zbc_read_zones(struct scsi_disk *sdkp, struct queue_limits *lim,
 		u8 buf[SD_BUF_SIZE])
 {
-	struct gendisk *disk = sdkp->disk;
-	struct request_queue *q = disk->queue;
 	unsigned int nr_zones;
 	u32 zone_blocks = 0;
 	int ret;
@@ -601,7 +599,7 @@ int sd_zbc_read_zones(struct scsi_disk *sdkp, struct queue_limits *lim,
 	if (sdkp->device->type != TYPE_ZBC)
 		return 0;
 
-	lim->features |= BLK_FEAT_ZONED;
+	lim->features |= BLK_FEAT_ZONED | BLK_FEAT_ZONE_RESETALL;
 
 	/*
 	 * Per ZBC and ZAC specifications, writes in sequential write required
@@ -630,7 +628,6 @@ int sd_zbc_read_zones(struct scsi_disk *sdkp, struct queue_limits *lim,
 	sdkp->early_zone_info.zone_blocks = zone_blocks;
 
 	/* The drive satisfies the kernel restrictions: set it up */
-	blk_queue_flag_set(QUEUE_FLAG_ZONE_RESETALL, q);
 	if (sdkp->zones_max_open == U32_MAX)
 		lim->max_open_zones = 0;
 	else
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index bdc30c1fb1b57b..1077cb8d8fd808 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -316,6 +316,9 @@ enum {
 
 	/* is a zoned device */
 	BLK_FEAT_ZONED				= (1u << 10),
+
+	/* supports Zone Reset All */
+	BLK_FEAT_ZONE_RESETALL			= (1u << 11),
 };
 
 /*
@@ -586,7 +589,6 @@ struct request_queue {
 #define QUEUE_FLAG_REGISTERED	22	/* queue has been registered to a disk */
 #define QUEUE_FLAG_QUIESCED	24	/* queue has been quiesced */
 #define QUEUE_FLAG_PCI_P2PDMA	25	/* device supports PCI p2p requests */
-#define QUEUE_FLAG_ZONE_RESETALL 26	/* supports Zone Reset All */
 #define QUEUE_FLAG_RQ_ALLOC_TIME 27	/* record rq->alloc_time_ns */
 #define QUEUE_FLAG_HCTX_ACTIVE	28	/* at least one blk-mq hctx is active */
 #define QUEUE_FLAG_SQ_SCHED     30	/* single queue style io dispatch */
@@ -607,7 +609,7 @@ bool blk_queue_flag_test_and_set(unsigned int flag, struct request_queue *q);
 #define blk_queue_nonrot(q)	((q)->limits.features & BLK_FEAT_ROTATIONAL)
 #define blk_queue_io_stat(q)	((q)->limits.features & BLK_FEAT_IO_STAT)
 #define blk_queue_zone_resetall(q)	\
-	test_bit(QUEUE_FLAG_ZONE_RESETALL, &(q)->queue_flags)
+	((q)->limits.features & BLK_FEAT_ZONE_RESETALL)
 #define blk_queue_dax(q)	((q)->limits.features & BLK_FEAT_DAX)
 #define blk_queue_pci_p2pdma(q)	\
 	test_bit(QUEUE_FLAG_PCI_P2PDMA, &(q)->queue_flags)
-- 
2.43.0


