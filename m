Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F77716EF1
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 22:38:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541457.844273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q466H-0001Ao-Fp; Tue, 30 May 2023 20:37:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541457.844273; Tue, 30 May 2023 20:37:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q466H-00017n-AP; Tue, 30 May 2023 20:37:49 +0000
Received: by outflank-mailman (input) for mailman id 541457;
 Tue, 30 May 2023 20:37:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8QB4=BT=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1q4612-0001iX-U5
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 20:32:24 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1486eb29-ff29-11ed-8611-37d641c3527e;
 Tue, 30 May 2023 22:32:23 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 0D022320096E;
 Tue, 30 May 2023 16:32:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 30 May 2023 16:32:21 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 30 May 2023 16:32:19 -0400 (EDT)
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
X-Inumbo-ID: 1486eb29-ff29-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1685478740; x=1685565140; bh=gJtXKfjMb5
	k3PryJlBFsKsS3ZINd0EksqBFZ4ekKEDw=; b=iSW8ttt26dngYvxurKxiOI2vd1
	WHoQ92v7hwye8qiWm/sMzD3pqp5ya8c2OA22dKJKDKSCyzxijZP+Dp144KoNmvpt
	K8OI+kD4ismX23LXNvkYBIS8haogcvQd7EEZ19u32N/1GOR8sh6VaGOBsVQxw9Bq
	zrT17xw8paAPsuaett1MoyqWDe6uGCPznnCFymKvWzjN2rUubwy9Ob0uFq6jMg76
	gqlN1m7Mc8Mkxu+yjAxvH0vX7/PlJqdVVec52wcaqJpFToYt9AxPY3yOgBt+RjEI
	aG4fzuzWpC22NKMBxr6O/RMjHdv28qKWfTHlwgkpaOz+BcWrwFwxRmGMeaMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1685478740; x=
	1685565140; bh=gJtXKfjMb5k3PryJlBFsKsS3ZINd0EksqBFZ4ekKEDw=; b=o
	QbHhAjdGI/824Nl01Pip/x1ESJBxXGnNCUCk4Arc6BskEm0MTh9UC6MZYaR2q79S
	k1Uqb9Vj1z9f6r5u3H1HVCqm/h4f+Vs2C2I55ZxnoCF18+ZrNegBzgUSduwuENN3
	ZelAmC1BB6EziOQZ1m0S4cDcLpBIGrjkaMEsTbam0kd7jHN3XymXk0VF7iAEn4+L
	g585WZp+QBIJWRDnqGJWJT85ZYmZick+DsS7QTOGtDLjDvulDczBAEFMf2pxjFDZ
	z70/jIsQbBWGVBj2a0QhQ3776f+UlGOsyvyOBXKD9nxTQaFTHfPjpO3nn2UqnNoO
	C4Idzu7QZyx3OsqotLhew==
X-ME-Sender: <xms:VF12ZCx6LBtGDgihYZ-NBi1TQbMnT10K4M83ELm3G3ATfM8R279sSA>
    <xme:VF12ZOSoOZisX8Dh7PgaI1Br2VXmS17_-QQHdNrd8ODedLEjRJsiupF-ePxfF5-CL
    VIu0ou0rSk2fvk>
X-ME-Received: <xmr:VF12ZEUZ2v-22K9HABN8joZIwupVm2l2OuN_SbATb71V0ubBkGLMjmuY97GOgzqwv3poc01Y0NU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeekjedgudeglecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefg
    hefghffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhg
    shhlrggsrdgtohhm
X-ME-Proxy: <xmx:VF12ZIgsEEnwHKmC43Kv9GxV7bH-i7tiH_PkAz1p_2nBYwSEAf6YrA>
    <xmx:VF12ZEDqiN37KhUgZoqxnScnVqOaHAYoy7GmY53oxQjsejR59koZOQ>
    <xmx:VF12ZJLZp0lEBhXhDlI94ziBRaLfrp4UJrXDlteRIEm9FlDD8PS34w>
    <xmx:VF12ZCA0rxPCrK0M9295LprgFjyNUobhbd0Xa629Rogk5JO32xfXOA>
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
Subject: [PATCH v2 16/16] xen-blkback: Inform userspace that device has been opened
Date: Tue, 30 May 2023 16:31:16 -0400
Message-Id: <20230530203116.2008-17-demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530203116.2008-1-demi@invisiblethingslab.com>
References: <20230530203116.2008-1-demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set "opened" to "0" before the hotplug script is called.  Once the
device node has been opened, set "opened" to "1".

"opened" is used exclusively by userspace.  It serves two purposes:

1. It tells userspace that the diskseq Xenstore entry is supported.

2. It tells userspace that it can wait for "opened" to be set to 1.
   Once "opened" is 1, blkback has a reference to the device, so
   userspace doesn't need to keep one.

Together, these changes allow userspace to use block devices with
delete-on-close behavior, such as loop devices with the autoclear flag
set or device-mapper devices with the deferred-remove flag set.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 drivers/block/xen-blkback/xenbus.c | 35 ++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/block/xen-blkback/xenbus.c b/drivers/block/xen-blkback/xenbus.c
index 9c3eb148fbd802c74e626c3d7bcd69dcb09bd921..519a78aa9073d1faa1dce5c1b36e95ae58da534b 100644
--- a/drivers/block/xen-blkback/xenbus.c
+++ b/drivers/block/xen-blkback/xenbus.c
@@ -3,6 +3,20 @@
     Copyright (C) 2005 Rusty Russell <rusty@rustcorp.com.au>
     Copyright (C) 2005 XenSource Ltd
 
+In addition to the Xenstore nodes required by the Xen block device
+specification, this implementation of blkback uses a new Xenstore
+node: "opened".  blkback sets "opened" to "0" before the hotplug script
+is called.  Once the device node has been opened, blkback sets "opened"
+to "1".
+
+"opened" is read exclusively by userspace.  It serves two purposes:
+
+1. It tells userspace that diskseq@major:minor syntax for "physical-device" is
+   supported.
+
+2. It tells userspace that it can wait for "opened" to be set to 1 after writing
+   "physical-device".  Once "opened" is 1, blkback has a reference to the
+   device, so userspace doesn't need to keep one.
 
 */
 
@@ -699,6 +713,14 @@ static int xen_blkbk_probe(struct xenbus_device *dev,
 	if (err)
 		pr_warn("%s write out 'max-ring-page-order' failed\n", __func__);
 
+	/*
+	 * This informs userspace that the "opened" node will be set to "1" when
+	 * the device has been opened successfully.
+	 */
+	err = xenbus_write(XBT_NIL, dev->nodename, "opened", "0");
+	if (err)
+		goto fail;
+
 	err = xenbus_switch_state(dev, XenbusStateInitWait);
 	if (err)
 		goto fail;
@@ -826,6 +848,19 @@ static void backend_changed(struct xenbus_watch *watch,
 		goto fail;
 	}
 
+	/*
+	 * Tell userspace that the device has been opened and that blkback has a
+	 * reference to it.  Userspace can then close the device or mark it as
+	 * delete-on-close, knowing that blkback will keep the device open as
+	 * long as necessary.
+	 */
+	err = xenbus_write(XBT_NIL, dev->nodename, "opened", "1");
+	if (err) {
+		xenbus_dev_fatal(dev, err, "%s: notifying userspace device has been opened",
+				 dev->nodename);
+		goto free_vbd;
+	}
+
 	err = xenvbd_sysfs_addif(dev);
 	if (err) {
 		xenbus_dev_fatal(dev, err, "creating sysfs entries");
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


