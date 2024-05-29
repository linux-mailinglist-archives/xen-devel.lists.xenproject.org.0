Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D80678D2C02
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 07:06:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731400.1136926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCBVY-0006Wk-83; Wed, 29 May 2024 05:05:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731400.1136926; Wed, 29 May 2024 05:05:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCBVY-0006Rw-0t; Wed, 29 May 2024 05:05:52 +0000
Received: by outflank-mailman (input) for mailman id 731400;
 Wed, 29 May 2024 05:05:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r7nM=NA=bombadil.srs.infradead.org=BATV+c55c297d46ee5715703b+7584+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1sCBVW-0002IP-Ui
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 05:05:50 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c77ef8d-1d79-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 07:05:48 +0200 (CEST)
Received: from
 2a02-8389-2341-5b80-7775-b725-99f7-3344.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:7775:b725:99f7:3344] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1sCBVO-00000002pk9-3paf; Wed, 29 May 2024 05:05:43 +0000
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
X-Inumbo-ID: 1c77ef8d-1d79-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=8d6ngVwHNTNauOwhnmSKDDZurLIjQvxFhyRamCIijqE=; b=ReWXkSxrT/T0XfXFgzP7fcQh8P
	LoBLaZcev4afPR23+iF5PXS7kCs2z2TUVpoIyd/78ykilQnjG3jxnGKaz2qygkpvtbwzRtjvrCAYl
	kRalvqMO0n637ZnM+ujlbGRx9Uu7J/K8mx82XsU4sJ6adxwSBGxzWOrKd2C7hHkoCEYhQW7+4GHs4
	8eb0wh5wj73qBWmxsrBOfDOpKI6TsU3lSvJljEqqgtLUrlfbSgX2/FMMZqnCGSthgaaxRI+ADIMzo
	LhS0RyV7JdhFep0OEvQhfZB6LNhKVpnMk+2X11OFk5auX0QSxcd9e8fvmb2iVW/2tkg3CnDFmOfdP
	YoUBvdAw==;
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
	linux-scsi@vger.kernel.org
Subject: [PATCH 12/12] block: add special APIs for run-time disabling of discard and friends
Date: Wed, 29 May 2024 07:04:14 +0200
Message-ID: <20240529050507.1392041-13-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240529050507.1392041-1-hch@lst.de>
References: <20240529050507.1392041-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

A few drivers optimistically try to support discard, write zeroes and
secure erase and disable the features from the I/O completion handler
if the hardware can't support them.  This disable can't be done using
the atomic queue limits API because the I/O completion handlers can't
take sleeping locks or freezer the queue.  Keep the existing clearing
of the relevant field to zero, but replace the old blk_queue_max_*
APIs with new disable APIs that force the value to 0.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/um/drivers/ubd_kern.c   |  5 ++---
 block/blk-settings.c         | 41 ------------------------------------
 drivers/block/xen-blkfront.c |  4 ++--
 drivers/scsi/sd.c            |  4 ++--
 include/linux/blkdev.h       | 28 ++++++++++++++++++------
 5 files changed, 28 insertions(+), 54 deletions(-)

diff --git a/arch/um/drivers/ubd_kern.c b/arch/um/drivers/ubd_kern.c
index a79a3b7c33a647..7eae1519300fbd 100644
--- a/arch/um/drivers/ubd_kern.c
+++ b/arch/um/drivers/ubd_kern.c
@@ -475,10 +475,9 @@ static void ubd_handler(void)
 				struct request_queue *q = io_req->req->q;
 
 				if (req_op(io_req->req) == REQ_OP_DISCARD)
-					blk_queue_max_discard_sectors(q, 0);
+					blk_queue_disable_discard(q);
 				if (req_op(io_req->req) == REQ_OP_WRITE_ZEROES)
-					blk_queue_max_write_zeroes_sectors(q,
-							0);
+					blk_queue_disable_write_zeroes(q);
 			}
 			blk_mq_end_request(io_req->req, io_req->error);
 			kfree(io_req);
diff --git a/block/blk-settings.c b/block/blk-settings.c
index 0b038729608f4b..996f247fc98e80 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -293,47 +293,6 @@ int queue_limits_set(struct request_queue *q, struct queue_limits *lim)
 }
 EXPORT_SYMBOL_GPL(queue_limits_set);
 
-/**
- * blk_queue_max_discard_sectors - set max sectors for a single discard
- * @q:  the request queue for the device
- * @max_discard_sectors: maximum number of sectors to discard
- **/
-void blk_queue_max_discard_sectors(struct request_queue *q,
-		unsigned int max_discard_sectors)
-{
-	struct queue_limits *lim = &q->limits;
-
-	lim->max_hw_discard_sectors = max_discard_sectors;
-	lim->max_discard_sectors =
-		min(max_discard_sectors, lim->max_user_discard_sectors);
-}
-EXPORT_SYMBOL(blk_queue_max_discard_sectors);
-
-/**
- * blk_queue_max_secure_erase_sectors - set max sectors for a secure erase
- * @q:  the request queue for the device
- * @max_sectors: maximum number of sectors to secure_erase
- **/
-void blk_queue_max_secure_erase_sectors(struct request_queue *q,
-		unsigned int max_sectors)
-{
-	q->limits.max_secure_erase_sectors = max_sectors;
-}
-EXPORT_SYMBOL(blk_queue_max_secure_erase_sectors);
-
-/**
- * blk_queue_max_write_zeroes_sectors - set max sectors for a single
- *                                      write zeroes
- * @q:  the request queue for the device
- * @max_write_zeroes_sectors: maximum number of sectors to write per command
- **/
-void blk_queue_max_write_zeroes_sectors(struct request_queue *q,
-		unsigned int max_write_zeroes_sectors)
-{
-	q->limits.max_write_zeroes_sectors = max_write_zeroes_sectors;
-}
-EXPORT_SYMBOL(blk_queue_max_write_zeroes_sectors);
-
 void disk_update_readahead(struct gendisk *disk)
 {
 	blk_apply_bdi_limits(disk->bdi, &disk->queue->limits);
diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
index fd7c0ff2139cee..9b4ec3e4908cce 100644
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -1605,8 +1605,8 @@ static irqreturn_t blkif_interrupt(int irq, void *dev_id)
 				blkif_req(req)->error = BLK_STS_NOTSUPP;
 				info->feature_discard = 0;
 				info->feature_secdiscard = 0;
-				blk_queue_max_discard_sectors(rq, 0);
-				blk_queue_max_secure_erase_sectors(rq, 0);
+				blk_queue_disable_discard(rq);
+				blk_queue_disable_secure_erase(rq);
 			}
 			break;
 		case BLKIF_OP_FLUSH_DISKCACHE:
diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index 03e67936b27928..56fd523b3987a5 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -837,7 +837,7 @@ static unsigned char sd_setup_protect_cmnd(struct scsi_cmnd *scmd,
 static void sd_disable_discard(struct scsi_disk *sdkp)
 {
 	sdkp->provisioning_mode = SD_LBP_DISABLE;
-	blk_queue_max_discard_sectors(sdkp->disk->queue, 0);
+	blk_queue_disable_discard(sdkp->disk->queue);
 }
 
 static void sd_config_discard(struct scsi_disk *sdkp, struct queue_limits *lim,
@@ -1019,7 +1019,7 @@ static void sd_disable_write_same(struct scsi_disk *sdkp)
 {
 	sdkp->device->no_write_same = 1;
 	sdkp->max_ws_blocks = 0;
-	blk_queue_max_write_zeroes_sectors(sdkp->disk->queue, 0);
+	blk_queue_disable_write_zeroes(sdkp->disk->queue);
 }
 
 static void sd_config_write_same(struct scsi_disk *sdkp,
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index bee71deb8ca066..b83441da12456a 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -923,15 +923,31 @@ static inline void queue_limits_cancel_update(struct request_queue *q)
 	mutex_unlock(&q->limits_lock);
 }
 
+/*
+ * These helpers are for drivers that have sloppy feature negotiation and might
+ * have to disable DISCARD, WRITE_ZEROES or SECURE_DISCARD from the I/O
+ * completion handler when the device returned an indicator that the respective
+ * feature is not actually supported.  They are racy and the driver needs to
+ * cope with that.  Try to avoid this scheme if you can.
+ */
+static inline void blk_queue_disable_discard(struct request_queue *q)
+{
+	q->limits.max_discard_sectors = 0;
+}
+
+static inline void blk_queue_disable_secure_erase(struct request_queue *q)
+{
+	q->limits.max_secure_erase_sectors = 0;
+}
+
+static inline void blk_queue_disable_write_zeroes(struct request_queue *q)
+{
+	q->limits.max_write_zeroes_sectors = 0;
+}
+
 /*
  * Access functions for manipulating queue properties
  */
-void blk_queue_max_secure_erase_sectors(struct request_queue *q,
-		unsigned int max_sectors);
-extern void blk_queue_max_discard_sectors(struct request_queue *q,
-		unsigned int max_discard_sectors);
-extern void blk_queue_max_write_zeroes_sectors(struct request_queue *q,
-		unsigned int max_write_same_sectors);
 void disk_update_readahead(struct gendisk *disk);
 extern void blk_limits_io_min(struct queue_limits *limits, unsigned int min);
 extern void blk_limits_io_opt(struct queue_limits *limits, unsigned int opt);
-- 
2.43.0


