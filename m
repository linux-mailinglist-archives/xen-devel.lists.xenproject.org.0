Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BC88D5BE2
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 09:49:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733345.1139561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCx0Z-0005nA-M8; Fri, 31 May 2024 07:49:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733345.1139561; Fri, 31 May 2024 07:49:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCx0Z-0005lK-In; Fri, 31 May 2024 07:49:03 +0000
Received: by outflank-mailman (input) for mailman id 733345;
 Fri, 31 May 2024 07:49:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rv5j=NC=bombadil.srs.infradead.org=BATV+4872a67a45e6d46d0c49+7586+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1sCx0Y-0004o6-7G
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 07:49:02 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e4dbefc-1f22-11ef-90a1-e314d9c70b13;
 Fri, 31 May 2024 09:49:01 +0200 (CEST)
Received: from
 2a02-8389-2341-5b80-5ba9-f4da-76fa-44a9.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:5ba9:f4da:76fa:44a9] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1sCx0P-00000009XZp-47jk; Fri, 31 May 2024 07:48:54 +0000
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
X-Inumbo-ID: 3e4dbefc-1f22-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=Hmvd8CugAGeadU1twTfeSXY4eccQybGsIHGkHL/IkB0=; b=my2INQcFxeQCNvgjmcsLc6Fb75
	+EFy+S+L2zWGIt2g4BBPXT+zKxxSbEKSxb3tBRS+43v7OGTOfpAaW1jjrvVXj8p6heokqg/3QgPvL
	cgEBbCQix9cOwyUKFuYg+h5o9MEKJotPtCESJKIwP3xUkAsfSsX/y9a+v4vJDSw3AsL5pT6hLH7Lu
	GuIXPs5ZW+9cBS0QF0sROYtRVuRTwsPOFFLgXpIrSa2T3CEX1IdFPbiV5seheDqGCLuYFDc6Yd5EF
	vffvu0LIjnfyd9A6B8PL+fYm3X9czzdyrgWKqx6Sa5+9qR0j+vzU7k6HmdEMljdnNzNPqRFDODR5A
	UiRrYXYA==;
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Josef Bacik <josef@toxicpanda.com>,
	Ilya Dryomov <idryomov@gmail.com>,
	Dongsheng Yang <dongsheng.yang@easystack.cn>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	linux-um@lists.infradead.org,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	ceph-devel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-scsi@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>,
	Damien Le Moal <dlemoal@kernel.org>
Subject: [PATCH 04/14] block: take io_opt and io_min into account for max_sectors
Date: Fri, 31 May 2024 09:47:59 +0200
Message-ID: <20240531074837.1648501-5-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240531074837.1648501-1-hch@lst.de>
References: <20240531074837.1648501-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

The soft max_sectors limit is normally capped by the hardware limits and
an arbitrary upper limit enforced by the kernel, but can be modified by
the user.  A few drivers want to increase this limit (nbd, rbd) or
adjust it up or down based on hardware capabilities (sd).

Change blk_validate_limits to default max_sectors to the optimal I/O
size, or upgrade it to the preferred minimal I/O size if that is
larger than the kernel default if no optimal I/O size is provided based
on the logic in the SD driver.

This keeps the existing kernel default for drivers that do not provide
an io_opt or very big io_min value, but picks a much more useful
default for those who provide these hints, and allows to remove the
hacks to set the user max_sectors limit in nbd, rbd and sd.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
 block/blk-settings.c |  7 +++++++
 drivers/block/nbd.c  |  2 +-
 drivers/block/rbd.c  |  1 -
 drivers/scsi/sd.c    | 29 +++++------------------------
 4 files changed, 13 insertions(+), 26 deletions(-)

diff --git a/block/blk-settings.c b/block/blk-settings.c
index effeb9a639bb45..a49abdb3554834 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -153,6 +153,13 @@ static int blk_validate_limits(struct queue_limits *lim)
 		if (lim->max_user_sectors < PAGE_SIZE / SECTOR_SIZE)
 			return -EINVAL;
 		lim->max_sectors = min(max_hw_sectors, lim->max_user_sectors);
+	} else if (lim->io_opt) {
+		lim->max_sectors =
+			min(max_hw_sectors, lim->io_opt >> SECTOR_SHIFT);
+	} else if (lim->io_min &&
+		   lim->io_min > (BLK_DEF_MAX_SECTORS_CAP << SECTOR_SHIFT)) {
+		lim->max_sectors =
+			min(max_hw_sectors, lim->io_min >> SECTOR_SHIFT);
 	} else {
 		lim->max_sectors = min(max_hw_sectors, BLK_DEF_MAX_SECTORS_CAP);
 	}
diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 22a79a62cc4eab..ad887d614d5b3f 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1808,7 +1808,7 @@ static struct nbd_device *nbd_dev_add(int index, unsigned int refs)
 {
 	struct queue_limits lim = {
 		.max_hw_sectors		= 65536,
-		.max_user_sectors	= 256,
+		.io_opt			= 256 << SECTOR_SHIFT,
 		.max_segments		= USHRT_MAX,
 		.max_segment_size	= UINT_MAX,
 	};
diff --git a/drivers/block/rbd.c b/drivers/block/rbd.c
index 46dc487ccc17eb..22ad704f81d8b9 100644
--- a/drivers/block/rbd.c
+++ b/drivers/block/rbd.c
@@ -4954,7 +4954,6 @@ static int rbd_init_disk(struct rbd_device *rbd_dev)
 	    rbd_dev->layout.object_size * rbd_dev->layout.stripe_count;
 	struct queue_limits lim = {
 		.max_hw_sectors		= objset_bytes >> SECTOR_SHIFT,
-		.max_user_sectors	= objset_bytes >> SECTOR_SHIFT,
 		.io_opt			= objset_bytes,
 		.io_min			= rbd_dev->opts->alloc_size,
 		.max_segments		= USHRT_MAX,
diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index f6c822c9cbd2d3..3dff9150ce11e2 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -3593,7 +3593,7 @@ static int sd_revalidate_disk(struct gendisk *disk)
 	struct request_queue *q = sdkp->disk->queue;
 	sector_t old_capacity = sdkp->capacity;
 	unsigned char *buffer;
-	unsigned int dev_max, rw_max;
+	unsigned int dev_max;
 
 	SCSI_LOG_HLQUEUE(3, sd_printk(KERN_INFO, sdkp,
 				      "sd_revalidate_disk\n"));
@@ -3675,34 +3675,15 @@ static int sd_revalidate_disk(struct gendisk *disk)
 	else
 		blk_queue_io_min(sdkp->disk->queue, 0);
 
-	if (sd_validate_opt_xfer_size(sdkp, dev_max)) {
-		q->limits.io_opt = logical_to_bytes(sdp, sdkp->opt_xfer_blocks);
-		rw_max = logical_to_sectors(sdp, sdkp->opt_xfer_blocks);
-	} else {
-		q->limits.io_opt = 0;
-		rw_max = min_not_zero(logical_to_sectors(sdp, dev_max),
-				      (sector_t)BLK_DEF_MAX_SECTORS_CAP);
-	}
-
 	/*
 	 * Limit default to SCSI host optimal sector limit if set. There may be
 	 * an impact on performance for when the size of a request exceeds this
 	 * host limit.
 	 */
-	rw_max = min_not_zero(rw_max, sdp->host->opt_sectors);
-
-	/* Do not exceed controller limit */
-	rw_max = min(rw_max, queue_max_hw_sectors(q));
-
-	/*
-	 * Only update max_sectors if previously unset or if the current value
-	 * exceeds the capabilities of the hardware.
-	 */
-	if (sdkp->first_scan ||
-	    q->limits.max_sectors > q->limits.max_dev_sectors ||
-	    q->limits.max_sectors > q->limits.max_hw_sectors) {
-		q->limits.max_sectors = rw_max;
-		q->limits.max_user_sectors = rw_max;
+	q->limits.io_opt = sdp->host->opt_sectors << SECTOR_SHIFT;
+	if (sd_validate_opt_xfer_size(sdkp, dev_max)) {
+		q->limits.io_opt = min_not_zero(q->limits.io_opt,
+				logical_to_bytes(sdp, sdkp->opt_xfer_blocks));
 	}
 
 	sdkp->first_scan = 0;
-- 
2.43.0


