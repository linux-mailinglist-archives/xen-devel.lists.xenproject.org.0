Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A6B9030CC
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 07:27:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737634.1144072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGu2d-0004Cv-0m; Tue, 11 Jun 2024 05:27:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737634.1144072; Tue, 11 Jun 2024 05:27:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGu2c-0004BK-Rj; Tue, 11 Jun 2024 05:27:30 +0000
Received: by outflank-mailman (input) for mailman id 737634;
 Tue, 11 Jun 2024 05:27:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M7An=NN=bombadil.srs.infradead.org=BATV+2fedbe304aabaf399917+7597+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1sGtwK-0006Mb-Q7
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 05:21:00 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62a76c16-27b2-11ef-90a3-e314d9c70b13;
 Tue, 11 Jun 2024 07:21:00 +0200 (CEST)
Received: from
 2a02-8389-2341-5b80-cdb4-8e7d-405d-6b77.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:cdb4:8e7d:405d:6b77] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1sGtvs-00000007RUV-3WAY; Tue, 11 Jun 2024 05:20:33 +0000
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
X-Inumbo-ID: 62a76c16-27b2-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=ZOX70G3pF40EpuFFjfhAf0Owh5pRXHCD6/58K2Ao0Eg=; b=aID6+0uheHH/EPlHuMos9YrI82
	Svu7qFrDLDOo4EHoAbaWREcr9JJG8DrxnncOI+EwSzgsR0Einz2cIZJ8ElJVHMzt35A/SYECI64bF
	4qfLxH0VSZ68DegO45KwBlm+6Gjhg/N+JsquVedMaxS8a67GHzehvoiPt5nXfE567FuPI3t9wfybG
	4IawUezNERiarVEfyYmkFa7JO75Y11QhDeAZmaHpe6b8ZUbC1++FMs6TEFuqjDb4D/YonWbaxEljj
	iIhBWn3lPe4wmwc+GJwhEF+wJ3+s5D2ozh7tp4WNHTI+8QVb2dkyCHPDFcW3TNQltFsiD/o7VNOoT
	JSGMNkWg==;
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
Subject: [PATCH 20/26] block: move the dax flag to queue_limits
Date: Tue, 11 Jun 2024 07:19:20 +0200
Message-ID: <20240611051929.513387-21-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240611051929.513387-1-hch@lst.de>
References: <20240611051929.513387-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Move the dax flag into the queue_limits feature field so that it
can be set atomically and all I/O is frozen when changing the flag.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-mq-debugfs.c       | 1 -
 drivers/md/dm-table.c        | 4 ++--
 drivers/nvdimm/pmem.c        | 7 ++-----
 drivers/s390/block/dcssblk.c | 2 +-
 include/linux/blkdev.h       | 6 ++++--
 5 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/block/blk-mq-debugfs.c b/block/blk-mq-debugfs.c
index 62b132e9a9ce3b..f4fa820251ce83 100644
--- a/block/blk-mq-debugfs.c
+++ b/block/blk-mq-debugfs.c
@@ -88,7 +88,6 @@ static const char *const blk_queue_flag_name[] = {
 	QUEUE_FLAG_NAME(SAME_FORCE),
 	QUEUE_FLAG_NAME(INIT_DONE),
 	QUEUE_FLAG_NAME(POLL),
-	QUEUE_FLAG_NAME(DAX),
 	QUEUE_FLAG_NAME(STATS),
 	QUEUE_FLAG_NAME(REGISTERED),
 	QUEUE_FLAG_NAME(QUIESCED),
diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index eee43d27733f9a..d3a960aee03c6a 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -1834,11 +1834,11 @@ int dm_table_set_restrictions(struct dm_table *t, struct request_queue *q,
 		limits->features |= BLK_FEAT_WRITE_CACHE | BLK_FEAT_FUA;
 
 	if (dm_table_supports_dax(t, device_not_dax_capable)) {
-		blk_queue_flag_set(QUEUE_FLAG_DAX, q);
+		limits->features |= BLK_FEAT_DAX;
 		if (dm_table_supports_dax(t, device_not_dax_synchronous_capable))
 			set_dax_synchronous(t->md->dax_dev);
 	} else
-		blk_queue_flag_clear(QUEUE_FLAG_DAX, q);
+		limits->features &= ~BLK_FEAT_DAX;
 
 	if (dm_table_any_dev_attr(t, device_dax_write_cache_enabled, NULL))
 		dax_write_cache(t->md->dax_dev, true);
diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
index b821dcf018f6ae..1dd74c969d5a09 100644
--- a/drivers/nvdimm/pmem.c
+++ b/drivers/nvdimm/pmem.c
@@ -465,7 +465,6 @@ static int pmem_attach_disk(struct device *dev,
 	struct dax_device *dax_dev;
 	struct nd_pfn_sb *pfn_sb;
 	struct pmem_device *pmem;
-	struct request_queue *q;
 	struct gendisk *disk;
 	void *addr;
 	int rc;
@@ -499,6 +498,8 @@ static int pmem_attach_disk(struct device *dev,
 	}
 	if (fua)
 		lim.features |= BLK_FEAT_FUA;
+	if (is_nd_pfn(dev))
+		lim.features |= BLK_FEAT_DAX;
 
 	if (!devm_request_mem_region(dev, res->start, resource_size(res),
 				dev_name(&ndns->dev))) {
@@ -509,7 +510,6 @@ static int pmem_attach_disk(struct device *dev,
 	disk = blk_alloc_disk(&lim, nid);
 	if (IS_ERR(disk))
 		return PTR_ERR(disk);
-	q = disk->queue;
 
 	pmem->disk = disk;
 	pmem->pgmap.owner = pmem;
@@ -547,9 +547,6 @@ static int pmem_attach_disk(struct device *dev,
 	}
 	pmem->virt_addr = addr;
 
-	if (pmem->pfn_flags & PFN_MAP)
-		blk_queue_flag_set(QUEUE_FLAG_DAX, q);
-
 	disk->fops		= &pmem_fops;
 	disk->private_data	= pmem;
 	nvdimm_namespace_disk_name(ndns, disk->disk_name);
diff --git a/drivers/s390/block/dcssblk.c b/drivers/s390/block/dcssblk.c
index 6d1689a2717e5f..d5a5d11ae0dcdf 100644
--- a/drivers/s390/block/dcssblk.c
+++ b/drivers/s390/block/dcssblk.c
@@ -548,6 +548,7 @@ dcssblk_add_store(struct device *dev, struct device_attribute *attr, const char
 {
 	struct queue_limits lim = {
 		.logical_block_size	= 4096,
+		.features		= BLK_FEAT_DAX,
 	};
 	int rc, i, j, num_of_segments;
 	struct dcssblk_dev_info *dev_info;
@@ -643,7 +644,6 @@ dcssblk_add_store(struct device *dev, struct device_attribute *attr, const char
 	dev_info->gd->fops = &dcssblk_devops;
 	dev_info->gd->private_data = dev_info;
 	dev_info->gd->flags |= GENHD_FL_NO_PART;
-	blk_queue_flag_set(QUEUE_FLAG_DAX, dev_info->gd->queue);
 
 	seg_byte_size = (dev_info->end - dev_info->start + 1);
 	set_capacity(dev_info->gd, seg_byte_size >> 9); // size in sectors
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 59c2327692589b..c2545580c5b134 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -307,6 +307,9 @@ enum {
 
 	/* supports REQ_NOWAIT */
 	BLK_FEAT_NOWAIT				= (1u << 7),
+
+	/* supports DAX */
+	BLK_FEAT_DAX				= (1u << 8),
 };
 
 /*
@@ -575,7 +578,6 @@ struct request_queue {
 #define QUEUE_FLAG_SAME_FORCE	12	/* force complete on same CPU */
 #define QUEUE_FLAG_INIT_DONE	14	/* queue is initialized */
 #define QUEUE_FLAG_POLL		16	/* IO polling enabled if set */
-#define QUEUE_FLAG_DAX		19	/* device supports DAX */
 #define QUEUE_FLAG_STATS	20	/* track IO start and completion times */
 #define QUEUE_FLAG_REGISTERED	22	/* queue has been registered to a disk */
 #define QUEUE_FLAG_QUIESCED	24	/* queue has been quiesced */
@@ -602,7 +604,7 @@ bool blk_queue_flag_test_and_set(unsigned int flag, struct request_queue *q);
 #define blk_queue_io_stat(q)	((q)->limits.features & BLK_FEAT_IO_STAT)
 #define blk_queue_zone_resetall(q)	\
 	test_bit(QUEUE_FLAG_ZONE_RESETALL, &(q)->queue_flags)
-#define blk_queue_dax(q)	test_bit(QUEUE_FLAG_DAX, &(q)->queue_flags)
+#define blk_queue_dax(q)	((q)->limits.features & BLK_FEAT_DAX)
 #define blk_queue_pci_p2pdma(q)	\
 	test_bit(QUEUE_FLAG_PCI_P2PDMA, &(q)->queue_flags)
 #ifdef CONFIG_BLK_RQ_ALLOC_TIME
-- 
2.43.0


