Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2125C7B0086
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 11:35:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608774.947479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlQwS-0001aF-Jn; Wed, 27 Sep 2023 09:34:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608774.947479; Wed, 27 Sep 2023 09:34:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlQwS-0001Xe-FW; Wed, 27 Sep 2023 09:34:48 +0000
Received: by outflank-mailman (input) for mailman id 608774;
 Wed, 27 Sep 2023 09:34:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yPii=FL=suse.cz=jack@srs-se1.protection.inumbo.net>)
 id 1qlQwQ-0001XS-Bm
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 09:34:46 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17770de1-5d19-11ee-878a-cb3800f73035;
 Wed, 27 Sep 2023 11:34:44 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 307D91FD61;
 Wed, 27 Sep 2023 09:34:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1C91813A74;
 Wed, 27 Sep 2023 09:34:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id rZ71BjT3E2UWEwAAMHmgww
 (envelope-from <jack@suse.cz>); Wed, 27 Sep 2023 09:34:44 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 19095A07D6; Wed, 27 Sep 2023 11:34:43 +0200 (CEST)
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
X-Inumbo-ID: 17770de1-5d19-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1695807284; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yUF1w/Fu5CgpkWZuk6MnW2aWHnUEG6OO2sOqetnT5qI=;
	b=o5vh8m0+hJeisOFrPvzZxxF622daywm37qK+dLjHaFld77YpoYo7/dxUjf6q6qXPJaihZ5
	2CKqNnAps1DKfJknBnUGTXxZceogXf2VXxFRUcGH2CJyiATi+l/Cjiq76EsqwNQidmm31Y
	4z6806tNCi8nX8ACA0HyIGuwhdS3qjA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1695807284;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yUF1w/Fu5CgpkWZuk6MnW2aWHnUEG6OO2sOqetnT5qI=;
	b=Dn2GDcmVot4rTpFtMFG61g/qGoqGrtmFDDhCAyPlFJio0XGHbCWu2PqXZnmTGoatlOI5Ci
	upwogbtFiOx7pgCg==
From: Jan Kara <jack@suse.cz>
To: Christian Brauner <brauner@kernel.org>
Cc: <linux-fsdevel@vger.kernel.org>,
	<linux-block@vger.kernel.org>,
	Christoph Hellwig <hch@infradead.org>,
	Jan Kara <jack@suse.cz>,
	xen-devel@lists.xenproject.org,
	Christoph Hellwig <hch@lst.de>
Subject: [PATCH 07/29] xen/blkback: Convert to bdev_open_by_dev()
Date: Wed, 27 Sep 2023 11:34:13 +0200
Message-Id: <20230927093442.25915-7-jack@suse.cz>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230818123232.2269-1-jack@suse.cz>
References: <20230818123232.2269-1-jack@suse.cz>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6244; i=jack@suse.cz; h=from:subject; bh=TaZiZckOSGj4kkgk+WRmyzrudx2mpauq7xTcSHOyXPE=; b=owEBbQGS/pANAwAIAZydqgc/ZEDZAcsmYgBlE/cXNUOZ2xrLsHPosRGhi4bPdCFE0jlagzsJ3AOG pU2bThWJATMEAAEIAB0WIQSrWdEr1p4yirVVKBycnaoHP2RA2QUCZRP3FwAKCRCcnaoHP2RA2TQdB/ 9OablWl7HEtMGjuylNbIwBggmVd2s+LncfqcYu4Iag0U3e6fudWGn/SGfuATLOzvzrsnx65VB1/bcJ Q5MEEfVsaE7EPYiet3Y9U9PiOjW6H8VbyWlanTx3JVUtgruDbkumYuxg4GK/O5f4piOri8drH8cXBG nX6v5DTf9/xyhSudDPpc/J8zj92ZIDDn4D2iGZZAR00OZ0057fIwokjXkfcV60XZa3zWPIFgU7xFx9 gX3HU03OMY9rnZalZsvxccbcF0nti4v+CFf6UQluud3FE+nqPecm1JzXZ/mh1NPj9GbVnzunOaK3tD HqoYWRXL8fZmCG0wDIgxpoAR95E88i
X-Developer-Key: i=jack@suse.cz; a=openpgp; fpr=93C6099A142276A28BBE35D815BC833443038D8C
Content-Transfer-Encoding: 8bit

Convert xen/blkback to use bdev_open_by_dev() and pass the
handle around.

CC: xen-devel@lists.xenproject.org
Acked-by: Christoph Hellwig <hch@lst.de>
Acked-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Jan Kara <jack@suse.cz>
---
 drivers/block/xen-blkback/blkback.c |  4 +--
 drivers/block/xen-blkback/common.h  |  4 +--
 drivers/block/xen-blkback/xenbus.c  | 40 +++++++++++++++--------------
 3 files changed, 25 insertions(+), 23 deletions(-)

diff --git a/drivers/block/xen-blkback/blkback.c b/drivers/block/xen-blkback/blkback.c
index c362f4ad80ab..4defd7f387c7 100644
--- a/drivers/block/xen-blkback/blkback.c
+++ b/drivers/block/xen-blkback/blkback.c
@@ -465,7 +465,7 @@ static int xen_vbd_translate(struct phys_req *req, struct xen_blkif *blkif,
 	}
 
 	req->dev  = vbd->pdevice;
-	req->bdev = vbd->bdev;
+	req->bdev = vbd->bdev_handle->bdev;
 	rc = 0;
 
  out:
@@ -969,7 +969,7 @@ static int dispatch_discard_io(struct xen_blkif_ring *ring,
 	int err = 0;
 	int status = BLKIF_RSP_OKAY;
 	struct xen_blkif *blkif = ring->blkif;
-	struct block_device *bdev = blkif->vbd.bdev;
+	struct block_device *bdev = blkif->vbd.bdev_handle->bdev;
 	struct phys_req preq;
 
 	xen_blkif_get(blkif);
diff --git a/drivers/block/xen-blkback/common.h b/drivers/block/xen-blkback/common.h
index 40f67bfc052d..5ff50e76cee5 100644
--- a/drivers/block/xen-blkback/common.h
+++ b/drivers/block/xen-blkback/common.h
@@ -221,7 +221,7 @@ struct xen_vbd {
 	unsigned char		type;
 	/* phys device that this vbd maps to. */
 	u32			pdevice;
-	struct block_device	*bdev;
+	struct bdev_handle	*bdev_handle;
 	/* Cached size parameter. */
 	sector_t		size;
 	unsigned int		flush_support:1;
@@ -360,7 +360,7 @@ struct pending_req {
 };
 
 
-#define vbd_sz(_v)	bdev_nr_sectors((_v)->bdev)
+#define vbd_sz(_v)	bdev_nr_sectors((_v)->bdev_handle->bdev)
 
 #define xen_blkif_get(_b) (atomic_inc(&(_b)->refcnt))
 #define xen_blkif_put(_b)				\
diff --git a/drivers/block/xen-blkback/xenbus.c b/drivers/block/xen-blkback/xenbus.c
index bb66178c432b..e34219ea2b05 100644
--- a/drivers/block/xen-blkback/xenbus.c
+++ b/drivers/block/xen-blkback/xenbus.c
@@ -81,7 +81,7 @@ static void xen_update_blkif_status(struct xen_blkif *blkif)
 	int i;
 
 	/* Not ready to connect? */
-	if (!blkif->rings || !blkif->rings[0].irq || !blkif->vbd.bdev)
+	if (!blkif->rings || !blkif->rings[0].irq || !blkif->vbd.bdev_handle)
 		return;
 
 	/* Already connected? */
@@ -99,12 +99,13 @@ static void xen_update_blkif_status(struct xen_blkif *blkif)
 		return;
 	}
 
-	err = sync_blockdev(blkif->vbd.bdev);
+	err = sync_blockdev(blkif->vbd.bdev_handle->bdev);
 	if (err) {
 		xenbus_dev_error(blkif->be->dev, err, "block flush");
 		return;
 	}
-	invalidate_inode_pages2(blkif->vbd.bdev->bd_inode->i_mapping);
+	invalidate_inode_pages2(
+			blkif->vbd.bdev_handle->bdev->bd_inode->i_mapping);
 
 	for (i = 0; i < blkif->nr_rings; i++) {
 		ring = &blkif->rings[i];
@@ -472,9 +473,9 @@ static void xenvbd_sysfs_delif(struct xenbus_device *dev)
 
 static void xen_vbd_free(struct xen_vbd *vbd)
 {
-	if (vbd->bdev)
-		blkdev_put(vbd->bdev, NULL);
-	vbd->bdev = NULL;
+	if (vbd->bdev_handle)
+		bdev_release(vbd->bdev_handle);
+	vbd->bdev_handle = NULL;
 }
 
 static int xen_vbd_create(struct xen_blkif *blkif, blkif_vdev_t handle,
@@ -482,7 +483,7 @@ static int xen_vbd_create(struct xen_blkif *blkif, blkif_vdev_t handle,
 			  int cdrom)
 {
 	struct xen_vbd *vbd;
-	struct block_device *bdev;
+	struct bdev_handle *bdev_handle;
 
 	vbd = &blkif->vbd;
 	vbd->handle   = handle;
@@ -491,17 +492,17 @@ static int xen_vbd_create(struct xen_blkif *blkif, blkif_vdev_t handle,
 
 	vbd->pdevice  = MKDEV(major, minor);
 
-	bdev = blkdev_get_by_dev(vbd->pdevice, vbd->readonly ?
+	bdev_handle = bdev_open_by_dev(vbd->pdevice, vbd->readonly ?
 				 BLK_OPEN_READ : BLK_OPEN_WRITE, NULL, NULL);
 
-	if (IS_ERR(bdev)) {
+	if (IS_ERR(bdev_handle)) {
 		pr_warn("xen_vbd_create: device %08x could not be opened\n",
 			vbd->pdevice);
 		return -ENOENT;
 	}
 
-	vbd->bdev = bdev;
-	if (vbd->bdev->bd_disk == NULL) {
+	vbd->bdev_handle = bdev_handle;
+	if (vbd->bdev_handle->bdev->bd_disk == NULL) {
 		pr_warn("xen_vbd_create: device %08x doesn't exist\n",
 			vbd->pdevice);
 		xen_vbd_free(vbd);
@@ -509,14 +510,14 @@ static int xen_vbd_create(struct xen_blkif *blkif, blkif_vdev_t handle,
 	}
 	vbd->size = vbd_sz(vbd);
 
-	if (cdrom || disk_to_cdi(vbd->bdev->bd_disk))
+	if (cdrom || disk_to_cdi(vbd->bdev_handle->bdev->bd_disk))
 		vbd->type |= VDISK_CDROM;
-	if (vbd->bdev->bd_disk->flags & GENHD_FL_REMOVABLE)
+	if (vbd->bdev_handle->bdev->bd_disk->flags & GENHD_FL_REMOVABLE)
 		vbd->type |= VDISK_REMOVABLE;
 
-	if (bdev_write_cache(bdev))
+	if (bdev_write_cache(bdev_handle->bdev))
 		vbd->flush_support = true;
-	if (bdev_max_secure_erase_sectors(bdev))
+	if (bdev_max_secure_erase_sectors(bdev_handle->bdev))
 		vbd->discard_secure = true;
 
 	pr_debug("Successful creation of handle=%04x (dom=%u)\n",
@@ -569,7 +570,7 @@ static void xen_blkbk_discard(struct xenbus_transaction xbt, struct backend_info
 	struct xen_blkif *blkif = be->blkif;
 	int err;
 	int state = 0;
-	struct block_device *bdev = be->blkif->vbd.bdev;
+	struct block_device *bdev = be->blkif->vbd.bdev_handle->bdev;
 
 	if (!xenbus_read_unsigned(dev->nodename, "discard-enable", 1))
 		return;
@@ -930,15 +931,16 @@ static void connect(struct backend_info *be)
 		goto abort;
 	}
 	err = xenbus_printf(xbt, dev->nodename, "sector-size", "%lu",
-			    (unsigned long)
-			    bdev_logical_block_size(be->blkif->vbd.bdev));
+			    (unsigned long)bdev_logical_block_size(
+					be->blkif->vbd.bdev_handle->bdev));
 	if (err) {
 		xenbus_dev_fatal(dev, err, "writing %s/sector-size",
 				 dev->nodename);
 		goto abort;
 	}
 	err = xenbus_printf(xbt, dev->nodename, "physical-sector-size", "%u",
-			    bdev_physical_block_size(be->blkif->vbd.bdev));
+			    bdev_physical_block_size(
+					be->blkif->vbd.bdev_handle->bdev));
 	if (err)
 		xenbus_dev_error(dev, err, "writing %s/physical-sector-size",
 				 dev->nodename);
-- 
2.35.3


