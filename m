Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C83D716EF2
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 22:38:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541432.844249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4663-0000HY-NM; Tue, 30 May 2023 20:37:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541432.844249; Tue, 30 May 2023 20:37:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4663-0000DD-Ic; Tue, 30 May 2023 20:37:35 +0000
Received: by outflank-mailman (input) for mailman id 541432;
 Tue, 30 May 2023 20:37:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8QB4=BT=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1q460r-0001iX-Br
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 20:32:13 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0da02579-ff29-11ed-8611-37d641c3527e;
 Tue, 30 May 2023 22:32:11 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 723F63200943;
 Tue, 30 May 2023 16:32:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 30 May 2023 16:32:10 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 30 May 2023 16:32:08 -0400 (EDT)
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
X-Inumbo-ID: 0da02579-ff29-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1685478729; x=1685565129; bh=irr2EYlMc/
	ep40A7KRI/xWi2gREEnIhu2G5hCeO8CLU=; b=hURAEgyL29RZKJ+OYcTsErbDM/
	S1Ul5/NUJUPSUYPM5HMp20PXXk0gLiNmvxjoP1CB2io9qAj/T4B/cqHiaSjgGmi8
	0OUe8kLmaoL/YVBAxDpvilMIDBf/Y2qDnpqjA2O6Z1bm6pdtSzAuU8pbwRpb/64E
	t3nTRGtgH4YjIZNDyv9MRjk+yomLwVCQZeoxQogkrfQEBvmCXu28G+w8CDjq/W3w
	Mx9lG3fpLwdz3h+U33/HWIfxkCWVZsJU414cVmYbYoJ0vUv3StWVENMkJBzowoLX
	64xRWpZtQ+yZbqGZ94lNuiuB4ECWPLAOLRd5LUD0psVSjobpmBc7joc+izig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1685478729; x=
	1685565129; bh=irr2EYlMc/ep40A7KRI/xWi2gREEnIhu2G5hCeO8CLU=; b=T
	fCfk4e0EN396eUbVOrH0ULWVryoukeqNEcqlz5QS2HXpBrwM99heFQhEMM352iV6
	XAioIqwlM6bC2bcJ15QZDtZssrnTAGcrNi3nu0JQPPTg/gHaMcm2YXhbjbcvIdQQ
	4+3ZjJ25Umxss9+sYsD2GfoZvAZN93/LREI/kYsX68VNvJdeBwv4W88M+K8GvrLk
	GhCudBNacqw+ctxx40im2bofmCkHltz0hoFc6VCGvIwgHePd+PRtAT6qflQL54sH
	rbfRPUaLSDzs1SnGq04bsIi17Eg2y8geLVB1gOhZF3+sb+8P2bG2PY/EzAnSWset
	u/evqcp9ruAl8Jc+bKtNg==
X-ME-Sender: <xms:SF12ZBfctJ2d2A3-iQ6vuwFvKc-UzF9BWiLn3tPIBEP1uqJV2EZD2Q>
    <xme:SF12ZPN76MIg5Z3ePhg_4ZPlgtRhapc1-gsYCO9FC46owA3180B5iHdYrNAPo62vN
    oWvwplncvHil8w>
X-ME-Received: <xmr:SF12ZKhwvdGkK2LUyW4IwEmdeVTIPWynVGVi5FIQTnBHOzVXFjkt47FA_H9DtJrKuR6TbZ-by4g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeekjedgudeglecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefg
    hefghffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhg
    shhlrggsrdgtohhm
X-ME-Proxy: <xmx:SF12ZK9To1BBIlpSkbrdLxqawBipD57OWmcgw7ISpIx8hEI3IQzMnw>
    <xmx:SF12ZNufUTatZ7nDNjzUx7u7Yl5dj5WRNOF-DD4z9BYxoBkagB6b1w>
    <xmx:SF12ZJFuKj8OnPlsEzvYl9HNQDX1s7aNCelS_9YCw0_fh0PGW-LdEQ>
    <xmx:SV12ZO_ohIr6Yj_olom9PICipQajdyzC4FPnRS3TPpiafB-36ZwAww>
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
Subject: [PATCH v2 12/16] device-mapper: inform caller about already-existing device
Date: Tue, 30 May 2023 16:31:12 -0400
Message-Id: <20230530203116.2008-13-demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530203116.2008-1-demi@invisiblethingslab.com>
References: <20230530203116.2008-1-demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Not only is this helpful for debugging, it also saves the caller an
ioctl in the case where a device should be used if it exists or created
otherwise.  To ensure existing userspace is not broken, this feature is
only enabled in strict mode.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 drivers/md/dm-ioctl.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/md/dm-ioctl.c b/drivers/md/dm-ioctl.c
index 17ece816d490b6c40d019da131ade44c9a201dab..44425093d3b908abf80e05e1fc99a26b17e18a42 100644
--- a/drivers/md/dm-ioctl.c
+++ b/drivers/md/dm-ioctl.c
@@ -256,11 +256,13 @@ static void free_cell(struct hash_cell *hc)
 	}
 }
 
+static void __dev_status(struct mapped_device *md, struct dm_ioctl *param);
+
 /*
  * The kdev_t and uuid of a device can never change once it is
  * initially inserted.
  */
-static int dm_hash_insert(const char *name, const char *uuid, struct mapped_device *md)
+static int dm_hash_insert(const char *name, const char *uuid, struct mapped_device *md, struct dm_ioctl *param)
 {
 	struct hash_cell *cell, *hc;
 
@@ -277,6 +279,8 @@ static int dm_hash_insert(const char *name, const char *uuid, struct mapped_devi
 	down_write(&_hash_lock);
 	hc = __get_name_cell(name);
 	if (hc) {
+		if (param)
+			__dev_status(hc->md, param);
 		dm_put(hc->md);
 		goto bad;
 	}
@@ -287,6 +291,8 @@ static int dm_hash_insert(const char *name, const char *uuid, struct mapped_devi
 		hc = __get_uuid_cell(uuid);
 		if (hc) {
 			__unlink_name(cell);
+			if (param)
+				__dev_status(hc->md, param);
 			dm_put(hc->md);
 			goto bad;
 		}
@@ -901,12 +907,14 @@ static int dev_create(struct file *filp, struct dm_ioctl *param, size_t param_si
 		m = MINOR(huge_decode_dev(param->dev));
 
 	r = dm_create(m, &md, param->flags & DM_DISABLE_UEVENTS_FLAG);
-	if (r)
+	if (r) {
+		DMERR("Could not create device-mapper device");
 		return r;
+	}
 
 	param->flags &= ~DM_INACTIVE_PRESENT_FLAG;
 
-	r = dm_hash_insert(param->name, *param->uuid ? param->uuid : NULL, md);
+	r = dm_hash_insert(param->name, *param->uuid ? param->uuid : NULL, md, param);
 	if (r) {
 		dm_put(md);
 		dm_destroy(md);
@@ -2269,7 +2277,6 @@ static int ctl_ioctl(struct file *file, uint command, struct dm_ioctl __user *us
 		goto out;
 	/* This XOR keeps only the flags validate_params has changed. */
 	old_flags ^= param->flags;
-
 	param->data_size = sloppy_checks(param) ? offsetof(struct dm_ioctl, data) : sizeof(struct dm_ioctl);
 	r = fn(file, param, input_param_size);
 
@@ -2284,9 +2291,14 @@ static int ctl_ioctl(struct file *file, uint command, struct dm_ioctl __user *us
 	param->flags |= old_flags;
 
 	/*
-	 * Copy the results back to userland.
+	 * Copy the results back to userland if either:
+	 *
+	 * - The ioctl succeeded.
+	 * - The ioctl is DM_DEV_CREATE, the return value is -EBUSY,
+	 *   and strict parameter checking is enabled.
 	 */
-	if (!r && copy_to_user(user, param, param->data_size))
+	if ((!r || (!sloppy_checks(param) && cmd == DM_DEV_CREATE_CMD && r == -EBUSY)) &&
+	    copy_to_user(user, param, param->data_size))
 		r = -EFAULT;
 
 out:
@@ -2465,7 +2477,7 @@ int __init dm_early_create(struct dm_ioctl *dmi,
 		return r;
 
 	/* hash insert */
-	r = dm_hash_insert(dmi->name, *dmi->uuid ? dmi->uuid : NULL, md);
+	r = dm_hash_insert(dmi->name, *dmi->uuid ? dmi->uuid : NULL, md, NULL);
 	if (r)
 		goto err_destroy_dm;
 
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


