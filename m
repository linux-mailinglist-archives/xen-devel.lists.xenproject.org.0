Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 315162B48D0
	for <lists+xen-devel@lfdr.de>; Mon, 16 Nov 2020 16:12:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.28300.57454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kegAk-0007jw-QV; Mon, 16 Nov 2020 15:12:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 28300.57454; Mon, 16 Nov 2020 15:12:02 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kegAi-0007ah-P3; Mon, 16 Nov 2020 15:12:00 +0000
Received: by outflank-mailman (input) for mailman id 28300;
 Mon, 16 Nov 2020 15:11:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DM7u=EW=casper.srs.infradead.org=batv+29a21e8ca386e11a5a78+6294+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1keg2z-0006ni-Ag
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 15:04:01 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c72fc1de-9677-4916-8246-087815331960;
 Mon, 16 Nov 2020 14:59:47 +0000 (UTC)
Received: from [2001:4bb8:180:6600:255b:7def:a93:4a09] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kefyh-00049g-7K; Mon, 16 Nov 2020 14:59:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=DM7u=EW=casper.srs.infradead.org=batv+29a21e8ca386e11a5a78+6294+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1keg2z-0006ni-Ag
	for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 15:04:01 +0000
X-Inumbo-ID: c72fc1de-9677-4916-8246-087815331960
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c72fc1de-9677-4916-8246-087815331960;
	Mon, 16 Nov 2020 14:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=0e+oH+92GlExM9i4SIPWTJvhHTDsEZRU6nAY6yeduas=; b=mMFTZRsVcAqmf+VlCpySbI4/AO
	Lvk1YHPUUx2pLWe6CEfyYTfSvNVAKhdEDtRNYgv0KknubQs4EEfe4Ww43hMMGLiSPbCzUY8fYe5/w
	ImRQodVw+JPRr2LxSfoDq1Ob9sBNVvCDmhGgUHYNdyodB9r7BgLKKuS1T5JHMOpydlwgeRX6CcH24
	Xj6k8bM1XYWX3OFouuNz5g4QXxFiyroDeYHmHTh09EcbYvOCQHjjCyVR/50jwzxvRUfG7haNExoXj
	/C/YqFeSVuEWf5BDvfiyEyGDUrvIYpPAoZpqWlPGo4+IH/9U+ubwIYwcVjNgFnqzPbQcgexYh8oWx
	MBTM2Vjg==;
Received: from [2001:4bb8:180:6600:255b:7def:a93:4a09] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kefyh-00049g-7K; Mon, 16 Nov 2020 14:59:35 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Justin Sanders <justin@coraid.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Ilya Dryomov <idryomov@gmail.com>,
	Jack Wang <jinpu.wang@cloud.ionos.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Minchan Kim <minchan@kernel.org>,
	Mike Snitzer <snitzer@redhat.com>,
	Song Liu <song@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	dm-devel@redhat.com,
	linux-block@vger.kernel.org,
	drbd-dev@lists.linbit.com,
	nbd@other.debian.org,
	ceph-devel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-raid@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 59/78] mtip32xx: remove the call to fsync_bdev on removal
Date: Mon, 16 Nov 2020 15:57:50 +0100
Message-Id: <20201116145809.410558-60-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201116145809.410558-1-hch@lst.de>
References: <20201116145809.410558-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

del_gendisk already calls fsync_bdev for every partition, no need
to do this twice.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/mtip32xx/mtip32xx.c | 15 ---------------
 drivers/block/mtip32xx/mtip32xx.h |  2 --
 2 files changed, 17 deletions(-)

diff --git a/drivers/block/mtip32xx/mtip32xx.c b/drivers/block/mtip32xx/mtip32xx.c
index 153e2cdecb4d40..53ac59d19ae530 100644
--- a/drivers/block/mtip32xx/mtip32xx.c
+++ b/drivers/block/mtip32xx/mtip32xx.c
@@ -3687,7 +3687,6 @@ static int mtip_block_initialize(struct driver_data *dd)
 	/* Enable the block device and add it to /dev */
 	device_add_disk(&dd->pdev->dev, dd->disk, NULL);
 
-	dd->bdev = bdget_disk(dd->disk, 0);
 	/*
 	 * Now that the disk is active, initialize any sysfs attributes
 	 * managed by the protocol layer.
@@ -3721,9 +3720,6 @@ static int mtip_block_initialize(struct driver_data *dd)
 	return rv;
 
 kthread_run_error:
-	bdput(dd->bdev);
-	dd->bdev = NULL;
-
 	/* Delete our gendisk. This also removes the device from /dev */
 	del_gendisk(dd->disk);
 
@@ -3804,14 +3800,6 @@ static int mtip_block_remove(struct driver_data *dd)
 	blk_mq_tagset_busy_iter(&dd->tags, mtip_no_dev_cleanup, dd);
 	blk_mq_unquiesce_queue(dd->queue);
 
-	/*
-	 * Delete our gendisk structure. This also removes the device
-	 * from /dev
-	 */
-	if (dd->bdev) {
-		bdput(dd->bdev);
-		dd->bdev = NULL;
-	}
 	if (dd->disk) {
 		if (test_bit(MTIP_DDF_INIT_DONE_BIT, &dd->dd_flag))
 			del_gendisk(dd->disk);
@@ -4206,9 +4194,6 @@ static void mtip_pci_remove(struct pci_dev *pdev)
 	} while (atomic_read(&dd->irq_workers_active) != 0 &&
 		time_before(jiffies, to));
 
-	if (!dd->sr)
-		fsync_bdev(dd->bdev);
-
 	if (atomic_read(&dd->irq_workers_active) != 0) {
 		dev_warn(&dd->pdev->dev,
 			"Completion workers still active!\n");
diff --git a/drivers/block/mtip32xx/mtip32xx.h b/drivers/block/mtip32xx/mtip32xx.h
index e22a7f0523bf30..88f4206310e4c8 100644
--- a/drivers/block/mtip32xx/mtip32xx.h
+++ b/drivers/block/mtip32xx/mtip32xx.h
@@ -463,8 +463,6 @@ struct driver_data {
 
 	int isr_binding;
 
-	struct block_device *bdev;
-
 	struct list_head online_list; /* linkage for online list */
 
 	struct list_head remove_list; /* linkage for removing list */
-- 
2.29.2


