Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D644090A407
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 08:07:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.741670.1148424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ5Wt-0001BU-7Q; Mon, 17 Jun 2024 06:07:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 741670.1148424; Mon, 17 Jun 2024 06:07:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ5Ws-0000xi-2k; Mon, 17 Jun 2024 06:07:46 +0000
Received: by outflank-mailman (input) for mailman id 741670;
 Mon, 17 Jun 2024 06:07:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvID=NT=bombadil.srs.infradead.org=BATV+625ba2f6da96caf54eae+7603+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1sJ5W0-0001Pt-C2
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 06:06:52 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c90eff1c-2c6f-11ef-90a3-e314d9c70b13;
 Mon, 17 Jun 2024 08:06:51 +0200 (CEST)
Received: from [91.187.204.140] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1sJ5Vf-00000009IvN-27mo; Mon, 17 Jun 2024 06:06:32 +0000
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
X-Inumbo-ID: c90eff1c-2c6f-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=SK8RArAP4avqHje0rxA9RB84wXcITze6EgEVeCJ1QVg=; b=m2S75Z6VqYUv9e3AmIV+VpIIju
	9x+ecVjQtPCYeC14SeVPXe758QJJrRrxuC1E0edGmHIp5l8bDg0A9K4szx4dnpYDZeCqhRHqFrGy/
	U8OTlUIak8J0hW+1Ye+ZNpSRUmCHBc6sAzrnIApyPEvryh9UesnysmyYL4L7g6E6L/CoihwNSCtOS
	sjJRfMZTU4nKJRCzb91EvdK/zSEVeI+ybWZPpy2rdejb2886pIbCBATAcW5Ptlyamg5X3ckHSZLdN
	t5aiwmkK8giGNJjeoF/uCW65SttZ0F9QLwXZjq81nlQgVO9Fwf3ZFbgnszfFWbjmxCSn4SSydGqkZ
	Hr7/oFPg==;
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
Subject: [PATCH 18/26] block: move the synchronous flag to queue_limits
Date: Mon, 17 Jun 2024 08:04:45 +0200
Message-ID: <20240617060532.127975-19-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240617060532.127975-1-hch@lst.de>
References: <20240617060532.127975-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Move the synchronous flag into the queue_limits feature field so that it
can be set atomically with the queue frozen.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
 block/blk-mq-debugfs.c        | 1 -
 drivers/block/brd.c           | 2 +-
 drivers/block/zram/zram_drv.c | 4 ++--
 drivers/nvdimm/btt.c          | 3 +--
 drivers/nvdimm/pmem.c         | 4 ++--
 include/linux/blkdev.h        | 7 ++++---
 6 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/block/blk-mq-debugfs.c b/block/blk-mq-debugfs.c
index eb73f1d348e5a9..957774e40b1d0c 100644
--- a/block/blk-mq-debugfs.c
+++ b/block/blk-mq-debugfs.c
@@ -85,7 +85,6 @@ static const char *const blk_queue_flag_name[] = {
 	QUEUE_FLAG_NAME(SAME_COMP),
 	QUEUE_FLAG_NAME(FAIL_IO),
 	QUEUE_FLAG_NAME(NOXMERGES),
-	QUEUE_FLAG_NAME(SYNCHRONOUS),
 	QUEUE_FLAG_NAME(SAME_FORCE),
 	QUEUE_FLAG_NAME(INIT_DONE),
 	QUEUE_FLAG_NAME(POLL),
diff --git a/drivers/block/brd.c b/drivers/block/brd.c
index b25dc463b5e3a6..d77deb571dbd06 100644
--- a/drivers/block/brd.c
+++ b/drivers/block/brd.c
@@ -335,6 +335,7 @@ static int brd_alloc(int i)
 		.max_hw_discard_sectors	= UINT_MAX,
 		.max_discard_segments	= 1,
 		.discard_granularity	= PAGE_SIZE,
+		.features		= BLK_FEAT_SYNCHRONOUS,
 	};
 
 	list_for_each_entry(brd, &brd_devices, brd_list)
@@ -366,7 +367,6 @@ static int brd_alloc(int i)
 	strscpy(disk->disk_name, buf, DISK_NAME_LEN);
 	set_capacity(disk, rd_size * 2);
 	
-	blk_queue_flag_set(QUEUE_FLAG_SYNCHRONOUS, disk->queue);
 	blk_queue_flag_set(QUEUE_FLAG_NOWAIT, disk->queue);
 	err = add_disk(disk);
 	if (err)
diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index f8f1b5b54795ac..efcb8d9d274c31 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -2208,7 +2208,8 @@ static int zram_add(void)
 #if ZRAM_LOGICAL_BLOCK_SIZE == PAGE_SIZE
 		.max_write_zeroes_sectors	= UINT_MAX,
 #endif
-		.features			= BLK_FEAT_STABLE_WRITES,
+		.features			= BLK_FEAT_STABLE_WRITES |
+						  BLK_FEAT_SYNCHRONOUS,
 	};
 	struct zram *zram;
 	int ret, device_id;
@@ -2246,7 +2247,6 @@ static int zram_add(void)
 
 	/* Actual capacity set using sysfs (/sys/block/zram<id>/disksize */
 	set_capacity(zram->disk, 0);
-	blk_queue_flag_set(QUEUE_FLAG_SYNCHRONOUS, zram->disk->queue);
 	ret = device_add_disk(NULL, zram->disk, zram_disk_groups);
 	if (ret)
 		goto out_cleanup_disk;
diff --git a/drivers/nvdimm/btt.c b/drivers/nvdimm/btt.c
index e474afa8e9f68d..e79c06d65bb77b 100644
--- a/drivers/nvdimm/btt.c
+++ b/drivers/nvdimm/btt.c
@@ -1501,6 +1501,7 @@ static int btt_blk_init(struct btt *btt)
 		.logical_block_size	= btt->sector_size,
 		.max_hw_sectors		= UINT_MAX,
 		.max_integrity_segments	= 1,
+		.features		= BLK_FEAT_SYNCHRONOUS,
 	};
 	int rc;
 
@@ -1518,8 +1519,6 @@ static int btt_blk_init(struct btt *btt)
 	btt->btt_disk->fops = &btt_fops;
 	btt->btt_disk->private_data = btt;
 
-	blk_queue_flag_set(QUEUE_FLAG_SYNCHRONOUS, btt->btt_disk->queue);
-
 	set_capacity(btt->btt_disk, btt->nlba * btt->sector_size >> 9);
 	rc = device_add_disk(&btt->nd_btt->dev, btt->btt_disk, NULL);
 	if (rc)
diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
index 501cf226df0187..b821dcf018f6ae 100644
--- a/drivers/nvdimm/pmem.c
+++ b/drivers/nvdimm/pmem.c
@@ -455,7 +455,8 @@ static int pmem_attach_disk(struct device *dev,
 		.logical_block_size	= pmem_sector_size(ndns),
 		.physical_block_size	= PAGE_SIZE,
 		.max_hw_sectors		= UINT_MAX,
-		.features		= BLK_FEAT_WRITE_CACHE,
+		.features		= BLK_FEAT_WRITE_CACHE |
+					  BLK_FEAT_SYNCHRONOUS,
 	};
 	int nid = dev_to_node(dev), fua;
 	struct resource *res = &nsio->res;
@@ -546,7 +547,6 @@ static int pmem_attach_disk(struct device *dev,
 	}
 	pmem->virt_addr = addr;
 
-	blk_queue_flag_set(QUEUE_FLAG_SYNCHRONOUS, q);
 	if (pmem->pfn_flags & PFN_MAP)
 		blk_queue_flag_set(QUEUE_FLAG_DAX, q);
 
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 8936eb6ba60956..cee7b44a142513 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -301,6 +301,9 @@ enum {
 
 	/* don't modify data until writeback is done */
 	BLK_FEAT_STABLE_WRITES			= (1u << 5),
+
+	/* always completes in submit context */
+	BLK_FEAT_SYNCHRONOUS			= (1u << 6),
 };
 
 /*
@@ -566,7 +569,6 @@ struct request_queue {
 #define QUEUE_FLAG_SAME_COMP	4	/* complete on same CPU-group */
 #define QUEUE_FLAG_FAIL_IO	5	/* fake timeout */
 #define QUEUE_FLAG_NOXMERGES	9	/* No extended merges */
-#define QUEUE_FLAG_SYNCHRONOUS	11	/* always completes in submit context */
 #define QUEUE_FLAG_SAME_FORCE	12	/* force complete on same CPU */
 #define QUEUE_FLAG_INIT_DONE	14	/* queue is initialized */
 #define QUEUE_FLAG_POLL		16	/* IO polling enabled if set */
@@ -1315,8 +1317,7 @@ static inline bool bdev_nonrot(struct block_device *bdev)
 
 static inline bool bdev_synchronous(struct block_device *bdev)
 {
-	return test_bit(QUEUE_FLAG_SYNCHRONOUS,
-			&bdev_get_queue(bdev)->queue_flags);
+	return bdev->bd_disk->queue->limits.features & BLK_FEAT_SYNCHRONOUS;
 }
 
 static inline bool bdev_stable_writes(struct block_device *bdev)
-- 
2.43.0


