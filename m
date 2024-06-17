Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C1F90A3BF
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 08:06:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.741596.1148233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ5V9-0001wc-Hg; Mon, 17 Jun 2024 06:05:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 741596.1148233; Mon, 17 Jun 2024 06:05:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ5V9-0001t3-CG; Mon, 17 Jun 2024 06:05:59 +0000
Received: by outflank-mailman (input) for mailman id 741596;
 Mon, 17 Jun 2024 06:05:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvID=NT=bombadil.srs.infradead.org=BATV+625ba2f6da96caf54eae+7603+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1sJ5V8-0001Pt-1Z
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 06:05:58 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a75ff241-2c6f-11ef-90a3-e314d9c70b13;
 Mon, 17 Jun 2024 08:05:56 +0200 (CEST)
Received: from [91.187.204.140] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1sJ5Uq-00000009ICC-1LaY; Mon, 17 Jun 2024 06:05:40 +0000
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
X-Inumbo-ID: a75ff241-2c6f-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=ycWXVfvI3dK1V2c7ItJhOtlEZyidcuD5U4kmQV06Zcw=; b=heSiK92MA+vKxOlE6EXLUE6On9
	7Zsrfed6mixhHUmpt2lI2hu+R9PUTTsRGr+PRYFt5uXNG0UIYBrn9VmJfN6V1jYlw7asNk6CVoOBU
	YMQZ5v5qc/XznfcoioTiECosf4MFH5HDIv7Cj5h+JFJSKwpa7i2h51gd5s+Y9Ij5OY2EZKJPkol2z
	GZKkuFfNKqqcAFsjjROAuUPyXjCegaRrQ/oIDlzuNmaO4lmNXJZ7btXZ9PiHz0mAQpUHcVdZKbRVM
	mbYcXnOsz6UsPwLxDp90icMVaOUjBPKmLSWISWsqvPA4jGbHvkH6Dob+66AoF0vVMDfse4q8/+/o9
	YheA9vxQ==;
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
	Bart Van Assche <bvanassche@acm.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Hannes Reinecke <hare@suse.de>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>
Subject: [PATCH 02/26] sd: remove sd_is_zoned
Date: Mon, 17 Jun 2024 08:04:29 +0200
Message-ID: <20240617060532.127975-3-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240617060532.127975-1-hch@lst.de>
References: <20240617060532.127975-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Since commit 7437bb73f087 ("block: remove support for the host aware zone
model"), only ZBC devices expose a zoned access model.  sd_is_zoned is
used to check for that and thus return false for host aware devices.

Replace the helper with the simple open coded TYPE_ZBC check to fix this.

Fixes: 7437bb73f087 ("block: remove support for the host aware zone model")
Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
---
 drivers/scsi/sd.c     |  6 +-----
 drivers/scsi/sd.h     |  5 -----
 drivers/scsi/sd_zbc.c | 13 ++++---------
 3 files changed, 5 insertions(+), 19 deletions(-)

diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index e01393ed42076b..664523048ce819 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -466,10 +466,6 @@ provisioning_mode_store(struct device *dev, struct device_attribute *attr,
 	if (sdp->type != TYPE_DISK)
 		return -EINVAL;
 
-	/* ignore the provisioning mode for ZBC devices */
-	if (sd_is_zoned(sdkp))
-		return count;
-
 	mode = sysfs_match_string(lbp_mode, buf);
 	if (mode < 0)
 		return -EINVAL;
@@ -2288,7 +2284,7 @@ static int sd_done(struct scsi_cmnd *SCpnt)
 	}
 
  out:
-	if (sd_is_zoned(sdkp))
+	if (sdkp->device->type == TYPE_ZBC)
 		good_bytes = sd_zbc_complete(SCpnt, good_bytes, &sshdr);
 
 	SCSI_LOG_HLCOMPLETE(1, scmd_printk(KERN_INFO, SCpnt,
diff --git a/drivers/scsi/sd.h b/drivers/scsi/sd.h
index 726f1613f6cb56..7603b3c67b233f 100644
--- a/drivers/scsi/sd.h
+++ b/drivers/scsi/sd.h
@@ -222,11 +222,6 @@ static inline sector_t sectors_to_logical(struct scsi_device *sdev, sector_t sec
 
 void sd_dif_config_host(struct scsi_disk *sdkp, struct queue_limits *lim);
 
-static inline int sd_is_zoned(struct scsi_disk *sdkp)
-{
-	return sdkp->zoned == 1 || sdkp->device->type == TYPE_ZBC;
-}
-
 #ifdef CONFIG_BLK_DEV_ZONED
 
 int sd_zbc_read_zones(struct scsi_disk *sdkp, struct queue_limits *lim,
diff --git a/drivers/scsi/sd_zbc.c b/drivers/scsi/sd_zbc.c
index f685838d9ed214..8cc9c025017961 100644
--- a/drivers/scsi/sd_zbc.c
+++ b/drivers/scsi/sd_zbc.c
@@ -232,7 +232,7 @@ int sd_zbc_report_zones(struct gendisk *disk, sector_t sector,
 	int zone_idx = 0;
 	int ret;
 
-	if (!sd_is_zoned(sdkp))
+	if (sdkp->device->type != TYPE_ZBC)
 		/* Not a zoned device */
 		return -EOPNOTSUPP;
 
@@ -300,7 +300,7 @@ static blk_status_t sd_zbc_cmnd_checks(struct scsi_cmnd *cmd)
 	struct scsi_disk *sdkp = scsi_disk(rq->q->disk);
 	sector_t sector = blk_rq_pos(rq);
 
-	if (!sd_is_zoned(sdkp))
+	if (sdkp->device->type != TYPE_ZBC)
 		/* Not a zoned device */
 		return BLK_STS_IOERR;
 
@@ -521,7 +521,7 @@ static int sd_zbc_check_capacity(struct scsi_disk *sdkp, unsigned char *buf,
 
 static void sd_zbc_print_zones(struct scsi_disk *sdkp)
 {
-	if (!sd_is_zoned(sdkp) || !sdkp->capacity)
+	if (sdkp->device->type != TYPE_ZBC || !sdkp->capacity)
 		return;
 
 	if (sdkp->capacity & (sdkp->zone_info.zone_blocks - 1))
@@ -598,13 +598,8 @@ int sd_zbc_read_zones(struct scsi_disk *sdkp, struct queue_limits *lim,
 	u32 zone_blocks = 0;
 	int ret;
 
-	if (!sd_is_zoned(sdkp)) {
-		/*
-		 * Device managed or normal SCSI disk, no special handling
-		 * required.
-		 */
+	if (sdkp->device->type != TYPE_ZBC)
 		return 0;
-	}
 
 	/* READ16/WRITE16/SYNC16 is mandatory for ZBC devices */
 	sdkp->device->use_16_for_rw = 1;
-- 
2.43.0


