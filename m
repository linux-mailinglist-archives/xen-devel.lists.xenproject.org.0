Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BEE8D5C2D
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 10:03:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733417.1139661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCxE5-00077R-PV; Fri, 31 May 2024 08:03:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733417.1139661; Fri, 31 May 2024 08:03:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCxE5-000753-Mk; Fri, 31 May 2024 08:03:01 +0000
Received: by outflank-mailman (input) for mailman id 733417;
 Fri, 31 May 2024 08:03:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rv5j=NC=bombadil.srs.infradead.org=BATV+4872a67a45e6d46d0c49+7586+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1sCx0u-0004oC-43
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 07:49:24 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ad0f821-1f22-11ef-b4bb-af5377834399;
 Fri, 31 May 2024 09:49:22 +0200 (CEST)
Received: from
 2a02-8389-2341-5b80-5ba9-f4da-76fa-44a9.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:5ba9:f4da:76fa:44a9] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1sCx0l-00000009XmW-2kNJ; Fri, 31 May 2024 07:49:16 +0000
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
X-Inumbo-ID: 4ad0f821-1f22-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=iMhM+qb16rWeYhTsrEp/EIKofeiSWWDmAm8PBvcX+R4=; b=WCl9PeXI0Uir7+ImFplX/mJBQW
	PadlppOJVLv1H1hcpEXK7QPq3XeF2IRiVoWUgG06Bh9FnczQtyVExyMIqaOnNpTw7P9Qo5r7UQf7k
	x5VPZ3bxf0mISNX3yuCLpzW2M7W83yLsnfawyqzrxdNRxcGrvghcagqikIplPccHgDyHAPvaOPDsT
	DoqTeon8mAhFTfO+PnoCohD4y2G9mYvaOBqH16GvMM9OIcnCL2KYbiEGUYtjFOolTa87gmoiBMDX5
	/Rynbgk2G8Gy/kQrHMItE34V5vqmXOweozZLBXWJGVWctwcegjzZ3GIsVcGs9nKQcYFWw/jkzPHqw
	NCqH0Xxg==;
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
	Damien Le Moal <dlemoal@kernel.org>
Subject: [PATCH 12/14] sr: convert to the atomic queue limits API
Date: Fri, 31 May 2024 09:48:07 +0200
Message-ID: <20240531074837.1648501-13-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240531074837.1648501-1-hch@lst.de>
References: <20240531074837.1648501-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Assign all queue limits through a local queue_limits variable and
queue_limits_commit_update so that we can't race updating them from
multiple places, and free the queue when updating them so that
in-progress I/O submissions don't see half-updated limits.

Also use the chance to clean up variable names to standard ones.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
 drivers/scsi/sr.c | 42 +++++++++++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 17 deletions(-)

diff --git a/drivers/scsi/sr.c b/drivers/scsi/sr.c
index 7ab000942b97fc..3f491019103e0c 100644
--- a/drivers/scsi/sr.c
+++ b/drivers/scsi/sr.c
@@ -111,7 +111,7 @@ static struct lock_class_key sr_bio_compl_lkclass;
 static int sr_open(struct cdrom_device_info *, int);
 static void sr_release(struct cdrom_device_info *);
 
-static void get_sectorsize(struct scsi_cd *);
+static int get_sectorsize(struct scsi_cd *);
 static int get_capabilities(struct scsi_cd *);
 
 static unsigned int sr_check_events(struct cdrom_device_info *cdi,
@@ -473,15 +473,15 @@ static blk_status_t sr_init_command(struct scsi_cmnd *SCpnt)
 	return BLK_STS_IOERR;
 }
 
-static void sr_revalidate_disk(struct scsi_cd *cd)
+static int sr_revalidate_disk(struct scsi_cd *cd)
 {
 	struct scsi_sense_hdr sshdr;
 
 	/* if the unit is not ready, nothing more to do */
 	if (scsi_test_unit_ready(cd->device, SR_TIMEOUT, MAX_RETRIES, &sshdr))
-		return;
+		return 0;
 	sr_cd_check(&cd->cdi);
-	get_sectorsize(cd);
+	return get_sectorsize(cd);
 }
 
 static int sr_block_open(struct gendisk *disk, blk_mode_t mode)
@@ -494,13 +494,16 @@ static int sr_block_open(struct gendisk *disk, blk_mode_t mode)
 		return -ENXIO;
 
 	scsi_autopm_get_device(sdev);
-	if (disk_check_media_change(disk))
-		sr_revalidate_disk(cd);
+	if (disk_check_media_change(disk)) {
+		ret = sr_revalidate_disk(cd);
+		if (ret)
+			goto out;
+	}
 
 	mutex_lock(&cd->lock);
 	ret = cdrom_open(&cd->cdi, mode);
 	mutex_unlock(&cd->lock);
-
+out:
 	scsi_autopm_put_device(sdev);
 	if (ret)
 		scsi_device_put(cd->device);
@@ -685,7 +688,9 @@ static int sr_probe(struct device *dev)
 	blk_pm_runtime_init(sdev->request_queue, dev);
 
 	dev_set_drvdata(dev, cd);
-	sr_revalidate_disk(cd);
+	error = sr_revalidate_disk(cd);
+	if (error)
+		goto unregister_cdrom;
 
 	error = device_add_disk(&sdev->sdev_gendev, disk, NULL);
 	if (error)
@@ -714,13 +719,14 @@ static int sr_probe(struct device *dev)
 }
 
 
-static void get_sectorsize(struct scsi_cd *cd)
+static int get_sectorsize(struct scsi_cd *cd)
 {
+	struct request_queue *q = cd->device->request_queue;
 	static const u8 cmd[10] = { READ_CAPACITY };
 	unsigned char buffer[8] = { };
-	int the_result;
+	struct queue_limits lim;
+	int err;
 	int sector_size;
-	struct request_queue *queue;
 	struct scsi_failure failure_defs[] = {
 		{
 			.result = SCMD_FAILURE_RESULT_ANY,
@@ -736,10 +742,10 @@ static void get_sectorsize(struct scsi_cd *cd)
 	};
 
 	/* Do the command and wait.. */
-	the_result = scsi_execute_cmd(cd->device, cmd, REQ_OP_DRV_IN, buffer,
+	err = scsi_execute_cmd(cd->device, cmd, REQ_OP_DRV_IN, buffer,
 				      sizeof(buffer), SR_TIMEOUT, MAX_RETRIES,
 				      &exec_args);
-	if (the_result) {
+	if (err) {
 		cd->capacity = 0x1fffff;
 		sector_size = 2048;	/* A guess, just in case */
 	} else {
@@ -789,10 +795,12 @@ static void get_sectorsize(struct scsi_cd *cd)
 		set_capacity(cd->disk, cd->capacity);
 	}
 
-	queue = cd->device->request_queue;
-	blk_queue_logical_block_size(queue, sector_size);
-
-	return;
+	lim = queue_limits_start_update(q);
+	lim.logical_block_size = sector_size;
+	blk_mq_freeze_queue(q);
+	err = queue_limits_commit_update(q, &lim);
+	blk_mq_unfreeze_queue(q);
+	return err;
 }
 
 static int get_capabilities(struct scsi_cd *cd)
-- 
2.43.0


