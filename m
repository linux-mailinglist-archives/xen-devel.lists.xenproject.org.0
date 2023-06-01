Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DE471F50C
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 23:49:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542749.847008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4q9w-0004SJ-8o; Thu, 01 Jun 2023 21:48:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542749.847008; Thu, 01 Jun 2023 21:48:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4q9w-0004OB-2K; Thu, 01 Jun 2023 21:48:40 +0000
Received: by outflank-mailman (input) for mailman id 542749;
 Thu, 01 Jun 2023 21:48:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3NUk=BV=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1q4q9u-0003ze-AG
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 21:48:38 +0000
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0df304e1-00c6-11ee-8611-37d641c3527e;
 Thu, 01 Jun 2023 23:48:34 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 101F55C0196;
 Thu,  1 Jun 2023 17:48:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 01 Jun 2023 17:48:33 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Jun 2023 17:48:32 -0400 (EDT)
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
X-Inumbo-ID: 0df304e1-00c6-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1685656113; x=1685742513; bh=KqvPH9pDDf
	rZerL/j1Q0a8RK2jTSm93zECezjcEfZ7Y=; b=PhGNaxRwheqgbYSVaXU75pFKw2
	6MGTNaRUtrwir0W9wwvwQ0fEbeDSYwccxCit81zpBGFIz1J2MyvsJphlcw3O6cjl
	ETmq9Spmk/VIkE5vAet7+10uyDswVQjcvD0oO1/f/MrvWLljpd1MmKfV0R0N3jQ+
	qEroWWUgVcB09PTiNaFQLnLqqThnpQ7WX9P5KRA/Q6Ki/3IAoP6ROhP0v0vzuebl
	jW+AnQMCg64nuru4QVSBS76ola9YvwzJjpy6TsRgBbg9/qW9f54zasEyDyR8X+gE
	teYfc8Ead4FtC9G/mqPk3RqICvy5hHM0jYnnoNO9KC1u2ohApIASi1XuY5lw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1685656113; x=
	1685742513; bh=KqvPH9pDDfrZerL/j1Q0a8RK2jTSm93zECezjcEfZ7Y=; b=l
	pMBma0YclrB4aMeW+ve6wNTxXVlURGumwBt/LHcnMqY+i50kjHcj5COrD2FOIfh8
	GH25Wnh/bo/6dbhVlZeiU9XdQH0Q/D2u7WkvqUfiEWcVX2uQhKIM/Gtqb6lsi9+n
	H5eUBRs8lyi+EIUOpG8YiFrRERtDsYMZZtyhRfD7HZaEMZQh5Ivbd4pFC4Dc9r91
	HjwdPF26FcVuja/OVmDzO1XLCD0CswZGLmaJY3t0NRLjJDFfKCmLJrqRG7AdlkoJ
	FT3HA0ssnXWLr97XazuqMgkWVLGX1nKJnDDL+cFSEp8P+a6Bd9USjnZCySzhR3pU
	c8nC+NiWw8GH8KlQyjIzg==
X-ME-Sender: <xms:MBJ5ZOor2R8iAMOTOQ3XCHv94OT1J7AJrMyDI0oSxXK99AnBBJ8MKg>
    <xme:MBJ5ZMoKmlwY2-5eJOKQiRp3TS4JrnGb7PPAmRIyYPtFuJvnDAzl_0V6Bg1xpvrLX
    SqHivO9Tq5QDgU>
X-ME-Received: <xmr:MBJ5ZDNs4OjzmUDefkNWnj1ulPhxP3S44E09hDPtLs_HpM2vmDKCnY_J3Avm8OUtgV5UwiedYkg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeelvddgtddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepjeffjefggfeugeduvedvjeekgfeh
    gffhhfffjeetkeelueefffetfffhtdduheetnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:MBJ5ZN5PqwZ8mI7S7Znxh82Q5SkvL0mhyDeK77K6VsOBJsxRzGmLuQ>
    <xmx:MBJ5ZN45niEHBY5oMQMtHJAO8L5voUX34lcMtviKGFscjfSt0igEuA>
    <xmx:MBJ5ZNiz6tXYT9d_H_t9U5PyqIuZhTe-k8wifz-iArlGR4rpSfSkMg>
    <xmx:MRJ5ZA2VCJZVnOECRSPwj6tXnQVk1WeLwDVSqIYM9RzYMJOITLwqCw>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] xen-blkback: Implement diskseq checks
Date: Thu,  1 Jun 2023 17:48:22 -0400
Message-Id: <20230601214823.1701-2-demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230601214823.1701-1-demi@invisiblethingslab.com>
References: <20230601214823.1701-1-demi@invisiblethingslab.com>
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


