Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E06AA508BAA
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 17:10:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309362.525635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhByE-0007wW-CA; Wed, 20 Apr 2022 15:10:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309362.525635; Wed, 20 Apr 2022 15:10:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhByD-0007X3-9s; Wed, 20 Apr 2022 15:10:17 +0000
Received: by outflank-mailman (input) for mailman id 309362;
 Wed, 20 Apr 2022 15:10:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aTZJ=U6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nhBy3-0003l9-7V
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 15:10:07 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3a0aa29-c0bb-11ec-8fbf-03012f2f19d4;
 Wed, 20 Apr 2022 17:10:02 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EC45B2112B;
 Wed, 20 Apr 2022 15:10:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B940913AD5;
 Wed, 20 Apr 2022 15:10:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GL8QLEkiYGJILQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 20 Apr 2022 15:10:01 +0000
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
X-Inumbo-ID: f3a0aa29-c0bb-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1650467401; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zIVRYJfuKT5Cc8Eh8lkT4S5YymR5yO4CxthS7o0vErk=;
	b=dqosmBbYFka6Cq4Fx3XDgQHYlD1l+kwlMIm2CKI8qmUk88Qls9O2u9OhjZfgqQVVyXEHAl
	F5AYRXlkgASQKbFoZaaEmJYPy7bQ0yV3XDjBRjOVGpr8R+cUhgWmk84/IMZM/K9yZKlQHC
	oSvKC/4crEhSlduV6M0b2pJQU17VPOU=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Subject: [PATCH 15/18] xen/scsifront: use xenbus_setup_ring() and xenbus_teardown_ring()
Date: Wed, 20 Apr 2022 17:09:39 +0200
Message-Id: <20220420150942.31235-16-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420150942.31235-1-jgross@suse.com>
References: <20220420150942.31235-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify scsifront's ring creation and removal via xenbus_setup_ring()
and xenbus_teardown_ring().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/scsi/xen-scsifront.c | 27 +++++++--------------------
 1 file changed, 7 insertions(+), 20 deletions(-)

diff --git a/drivers/scsi/xen-scsifront.c b/drivers/scsi/xen-scsifront.c
index 9db2366fa2d4..f15a35750040 100644
--- a/drivers/scsi/xen-scsifront.c
+++ b/drivers/scsi/xen-scsifront.c
@@ -798,28 +798,17 @@ static int scsifront_alloc_ring(struct vscsifrnt_info *info)
 {
 	struct xenbus_device *dev = info->dev;
 	struct vscsiif_sring *sring;
-	grant_ref_t gref;
-	int err = -ENOMEM;
+	int err;
 
 	/***** Frontend to Backend ring start *****/
-	sring = (struct vscsiif_sring *)__get_free_page(GFP_KERNEL);
-	if (!sring) {
-		xenbus_dev_fatal(dev, err,
-			"fail to allocate shared ring (Front to Back)");
+	err = xenbus_setup_ring(dev, GFP_KERNEL, (void **)&sring, 1,
+				&info->ring_ref);
+	if (err)
 		return err;
-	}
+
 	SHARED_RING_INIT(sring);
 	FRONT_RING_INIT(&info->ring, sring, PAGE_SIZE);
 
-	err = xenbus_grant_ring(dev, sring, 1, &gref);
-	if (err < 0) {
-		free_page((unsigned long)sring);
-		xenbus_dev_fatal(dev, err,
-			"fail to grant shared ring (Front to Back)");
-		return err;
-	}
-	info->ring_ref = gref;
-
 	err = xenbus_alloc_evtchn(dev, &info->evtchn);
 	if (err) {
 		xenbus_dev_fatal(dev, err, "xenbus_alloc_evtchn");
@@ -847,8 +836,7 @@ static int scsifront_alloc_ring(struct vscsifrnt_info *info)
 free_irq:
 	unbind_from_irqhandler(info->irq, info);
 free_gnttab:
-	gnttab_end_foreign_access(info->ring_ref,
-				  (unsigned long)info->ring.sring);
+	xenbus_teardown_ring((void **)&sring, 1, &info->ring_ref);
 
 	return err;
 }
@@ -856,8 +844,7 @@ static int scsifront_alloc_ring(struct vscsifrnt_info *info)
 static void scsifront_free_ring(struct vscsifrnt_info *info)
 {
 	unbind_from_irqhandler(info->irq, info);
-	gnttab_end_foreign_access(info->ring_ref,
-				  (unsigned long)info->ring.sring);
+	xenbus_teardown_ring((void **)&info->ring.sring, 1, &info->ring_ref);
 }
 
 static int scsifront_init_ring(struct vscsifrnt_info *info)
-- 
2.34.1


