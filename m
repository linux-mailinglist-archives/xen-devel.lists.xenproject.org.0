Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E738716EF4
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 22:38:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541448.844262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q466F-0000rL-U5; Tue, 30 May 2023 20:37:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541448.844262; Tue, 30 May 2023 20:37:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q466F-0000q7-Qm; Tue, 30 May 2023 20:37:47 +0000
Received: by outflank-mailman (input) for mailman id 541448;
 Tue, 30 May 2023 20:37:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8QB4=BT=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1q460t-0001yj-Gh
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 20:32:15 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f3a81e8-ff29-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 22:32:14 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 6EF803200934;
 Tue, 30 May 2023 16:32:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 30 May 2023 16:32:13 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 30 May 2023 16:32:11 -0400 (EDT)
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
X-Inumbo-ID: 0f3a81e8-ff29-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1685478732; x=1685565132; bh=KqvPH9pDDf
	rZerL/j1Q0a8RK2jTSm93zECezjcEfZ7Y=; b=CeUdXfyO67/whbrhgac9/avXLW
	eru7QHUZqMx94QYfPMlVXU+ui+tRFdwVPN9xlP9gICmNJdQalLaUVoS7Zc943wjC
	sJFZiHqqQBqawmzSq2uS5sj0kejzU2ucPIFyOcLtjPgoyrOKSyZ8v6CejqHwIIVf
	QhSSQhpepZN1qfTatTXNiFRN45qghiX/endy/GoXyAo4OF5DvAqSC+R4tvUZql/g
	Twf7nZVK/OZ+O5hzh/GEO/K+xp6lZGqfRa1L4ridR6SwKojehZihM4jei6a9/TkB
	0NXGvH2/Oo567MZ7sqO1hRGDy2T5AnJVIsGfHDdoKrXfptumV12qVDqo43kA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1685478732; x=
	1685565132; bh=KqvPH9pDDfrZerL/j1Q0a8RK2jTSm93zECezjcEfZ7Y=; b=x
	1E+gfj51gX0i5a8eh20dla4FZptdVnV/3RIPZB3nB5jAIbu455IAdaMdcicMgN6O
	4SBqvYe9KR4Kej10pm88BwhRbA3HJRbxH//tVjialFMNZJrovhqgY1UDyRu1wJcw
	QHLv45kgxPU7huWf9ipWhx6WsGloc+WqNO4rAhShCMykuP4wA6usnjDEyY/0gRna
	EhIOGzw6Zx9L9zjSbhcDkSFqBm1jjKHdeYRfdE5UB3scu3hnpjdt5yJterqlZrbv
	J5cY6BQYk5xcpeviB3QRy1CADT22E0N/XTiASKCzbXfOkz55iiiWUGOl+t2QGjsf
	0fnwF/t6q5vZO+QP/5VMg==
X-ME-Sender: <xms:S112ZFgm3IeHFi6lKr5FpH5jvpfxwO-emQ2czS7Pq9uDlsy9Fog8-Q>
    <xme:S112ZKB_RZTgfN8gOc3Qt1yLL0BLazY40yQ4kW6JyaHmpwYd6le27kfuoY0HNPe8q
    Bg1QVfpKaNzuu4>
X-ME-Received: <xmr:S112ZFFvIfFBGsSNVsyzjW3e8trWKGolRY9j-x5oH_a7oB_rpZIly3L0KUdHGO_X5tEjIbl3Z-4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeekjedgudeglecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefg
    hefghffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedvne
    curfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhg
    shhlrggsrdgtohhm
X-ME-Proxy: <xmx:S112ZKSXztYWhNh1MQVCl3fCY8DiKab0iHLF3aayTdVK2LoubaYlsA>
    <xmx:S112ZCytp1E3O_qW43L1mXgjApcSM6g_XRGwrav4Xg9SVmX7n86Qkw>
    <xmx:S112ZA7gcLfxJIeXwgaFf_QMQGleyKUVRN_r2UoxT_a0-RDhxoexxg>
    <xmx:TF12ZNwxjvc_-0yaKFm8hnvtR3BECga_Ld9X_kRH4r-5lLJDCs-ZAw>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jens Axboe <axboe@kernel.dk>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	dm-devel@redhat.com
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 13/16] xen-blkback: Implement diskseq checks
Date: Tue, 30 May 2023 16:31:13 -0400
Message-Id: <20230530203116.2008-14-demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530203116.2008-1-demi@invisiblethingslab.com>
References: <20230530203116.2008-1-demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows specifying a disk sequence number in XenStore.  If it does
not match the disk sequence number of the underlying device, the device
will not be exported and a warning will be logged.  Userspace can use
this to eliminate race conditions due to major/minor number reuse.
Old kernels do not support the new syntax, but a later patch will allow
userspace to discover that the new syntax is supported.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 drivers/block/xen-blkback/xenbus.c | 112 +++++++++++++++++++++++------
 1 file changed, 89 insertions(+), 23 deletions(-)

diff --git a/drivers/block/xen-blkback/xenbus.c b/drivers/block/xen-blkback/xenbus.c
index 4807af1d58059394d7a992335dabaf2bc3901721..9c3eb148fbd802c74e626c3d7bcd69dcb09bd921 100644
--- a/drivers/block/xen-blkback/xenbus.c
+++ b/drivers/block/xen-blkback/xenbus.c
@@ -24,6 +24,7 @@ struct backend_info {
 	struct xenbus_watch	backend_watch;
 	unsigned		major;
 	unsigned		minor;
+	unsigned long long	diskseq;
 	char			*mode;
 };
 
@@ -479,7 +480,7 @@ static void xen_vbd_free(struct xen_vbd *vbd)
 
 static int xen_vbd_create(struct xen_blkif *blkif, blkif_vdev_t handle,
 			  unsigned major, unsigned minor, int readonly,
-			  int cdrom)
+			  bool cdrom, u64 diskseq)
 {
 	struct xen_vbd *vbd;
 	struct block_device *bdev;
@@ -507,6 +508,26 @@ static int xen_vbd_create(struct xen_blkif *blkif, blkif_vdev_t handle,
 		xen_vbd_free(vbd);
 		return -ENOENT;
 	}
+
+	if (diskseq) {
+		struct gendisk *disk = bdev->bd_disk;
+
+		if (unlikely(disk == NULL)) {
+			pr_err("%s: device %08x has no gendisk\n",
+			       __func__, vbd->pdevice);
+			xen_vbd_free(vbd);
+			return -EFAULT;
+		}
+
+		if (unlikely(disk->diskseq != diskseq)) {
+			pr_warn("%s: device %08x has incorrect sequence "
+				"number 0x%llx (expected 0x%llx)\n",
+				__func__, vbd->pdevice, disk->diskseq, diskseq);
+			xen_vbd_free(vbd);
+			return -ENODEV;
+		}
+	}
+
 	vbd->size = vbd_sz(vbd);
 
 	if (cdrom || disk_to_cdi(vbd->bdev->bd_disk))
@@ -707,6 +728,9 @@ static void backend_changed(struct xenbus_watch *watch,
 	int cdrom = 0;
 	unsigned long handle;
 	char *device_type;
+	char *diskseq_str = NULL;
+	int diskseq_len;
+	unsigned long long diskseq;
 
 	pr_debug("%s %p %d\n", __func__, dev, dev->otherend_id);
 
@@ -725,10 +749,46 @@ static void backend_changed(struct xenbus_watch *watch,
 		return;
 	}
 
-	if (be->major | be->minor) {
-		if (be->major != major || be->minor != minor)
-			pr_warn("changing physical device (from %x:%x to %x:%x) not supported.\n",
-				be->major, be->minor, major, minor);
+	diskseq_str = xenbus_read(XBT_NIL, dev->nodename, "diskseq", &diskseq_len);
+	if (IS_ERR(diskseq_str)) {
+		int err = PTR_ERR(diskseq_str);
+		diskseq_str = NULL;
+
+		/*
+		 * If this does not exist, it means legacy userspace that does not
+		 * support diskseq.
+		 */
+		if (unlikely(!XENBUS_EXIST_ERR(err))) {
+			xenbus_dev_fatal(dev, err, "reading diskseq");
+			return;
+		}
+		diskseq = 0;
+	} else if (diskseq_len <= 0) {
+		xenbus_dev_fatal(dev, -EFAULT, "diskseq must not be empty");
+		goto fail;
+	} else if (diskseq_len > 16) {
+		xenbus_dev_fatal(dev, -ERANGE, "diskseq too long: got %d but limit is 16",
+				 diskseq_len);
+		goto fail;
+	} else if (diskseq_str[0] == '0') {
+		xenbus_dev_fatal(dev, -ERANGE, "diskseq must not start with '0'");
+		goto fail;
+	} else {
+		char *diskseq_end;
+		diskseq = simple_strtoull(diskseq_str, &diskseq_end, 16);
+		if (diskseq_end != diskseq_str + diskseq_len) {
+			xenbus_dev_fatal(dev, -EINVAL, "invalid diskseq");
+			goto fail;
+		}
+		kfree(diskseq_str);
+		diskseq_str = NULL;
+	}
+
+	if (be->major | be->minor | be->diskseq) {
+		if (be->major != major || be->minor != minor || be->diskseq != diskseq)
+			pr_warn("changing physical device (from %x:%x:%llx to %x:%x:%llx)"
+				" not supported.\n",
+				be->major, be->minor, be->diskseq, major, minor, diskseq);
 		return;
 	}
 
@@ -756,29 +816,35 @@ static void backend_changed(struct xenbus_watch *watch,
 
 	be->major = major;
 	be->minor = minor;
+	be->diskseq = diskseq;
 
 	err = xen_vbd_create(be->blkif, handle, major, minor,
-			     !strchr(be->mode, 'w'), cdrom);
-
-	if (err)
-		xenbus_dev_fatal(dev, err, "creating vbd structure");
-	else {
-		err = xenvbd_sysfs_addif(dev);
-		if (err) {
-			xen_vbd_free(&be->blkif->vbd);
-			xenbus_dev_fatal(dev, err, "creating sysfs entries");
-		}
-	}
+			     !strchr(be->mode, 'w'), cdrom, diskseq);
 
 	if (err) {
-		kfree(be->mode);
-		be->mode = NULL;
-		be->major = 0;
-		be->minor = 0;
-	} else {
-		/* We're potentially connected now */
-		xen_update_blkif_status(be->blkif);
+		xenbus_dev_fatal(dev, err, "creating vbd structure");
+		goto fail;
 	}
+
+	err = xenvbd_sysfs_addif(dev);
+	if (err) {
+		xenbus_dev_fatal(dev, err, "creating sysfs entries");
+		goto free_vbd;
+	}
+
+	/* We're potentially connected now */
+	xen_update_blkif_status(be->blkif);
+	return;
+
+free_vbd:
+	xen_vbd_free(&be->blkif->vbd);
+fail:
+	kfree(diskseq_str);
+	kfree(be->mode);
+	be->mode = NULL;
+	be->major = 0;
+	be->minor = 0;
+	be->diskseq = 0;
 }
 
 /*
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


