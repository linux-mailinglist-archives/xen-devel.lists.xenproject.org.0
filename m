Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0D2508BA9
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 17:10:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309360.525614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhByA-0007AR-Tk; Wed, 20 Apr 2022 15:10:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309360.525614; Wed, 20 Apr 2022 15:10:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhBy9-0006mv-RQ; Wed, 20 Apr 2022 15:10:13 +0000
Received: by outflank-mailman (input) for mailman id 309360;
 Wed, 20 Apr 2022 15:10:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aTZJ=U6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nhBy2-0003l9-7O
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 15:10:06 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f37b7617-c0bb-11ec-8fbf-03012f2f19d4;
 Wed, 20 Apr 2022 17:10:02 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B143321600;
 Wed, 20 Apr 2022 15:10:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7A52A13AD5;
 Wed, 20 Apr 2022 15:10:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mMS4HEkiYGJILQAAMHmgww
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
X-Inumbo-ID: f37b7617-c0bb-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1650467401; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4w7uCrVXVTwZfPuB483vIPp5pLFfFRyBD4Y2IYXR2Yk=;
	b=fz0rlO1XMdB4BddZo8c4Teth0+zAy8QaParWZU14wrqXGD6EySljVo6Vq6kBi9HXKi0Rga
	xuTZhtvj50WWZimNnLTKwBftHtnnForaUNyo7J+NGQQPcb/KSOCH4nn4iVfeQ4OCTkaQVZ
	j32mZDbE44Ahb1h++ngv8o4nT0tLPzw=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 14/18] xen/pcifront: use xenbus_setup_ring() and xenbus_teardown_ring()
Date: Wed, 20 Apr 2022 17:09:38 +0200
Message-Id: <20220420150942.31235-15-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420150942.31235-1-jgross@suse.com>
References: <20220420150942.31235-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify pcifront's shared page creation and removal via
xenbus_setup_ring() and xenbus_teardown_ring().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/pci/xen-pcifront.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/pci/xen-pcifront.c b/drivers/pci/xen-pcifront.c
index 3edc1565a27c..689271c4245c 100644
--- a/drivers/pci/xen-pcifront.c
+++ b/drivers/pci/xen-pcifront.c
@@ -709,9 +709,8 @@ static struct pcifront_device *alloc_pdev(struct xenbus_device *xdev)
 	if (pdev == NULL)
 		goto out;
 
-	pdev->sh_info =
-	    (struct xen_pci_sharedinfo *)__get_free_page(GFP_KERNEL);
-	if (pdev->sh_info == NULL) {
+	if (xenbus_setup_ring(xdev, GFP_KERNEL, (void **)&pdev->sh_info, 1,
+			      &pdev->gnt_ref)) {
 		kfree(pdev);
 		pdev = NULL;
 		goto out;
@@ -729,7 +728,6 @@ static struct pcifront_device *alloc_pdev(struct xenbus_device *xdev)
 	spin_lock_init(&pdev->sh_info_lock);
 
 	pdev->evtchn = INVALID_EVTCHN;
-	pdev->gnt_ref = INVALID_GRANT_REF;
 	pdev->irq = -1;
 
 	INIT_WORK(&pdev->op_work, pcifront_do_aer);
@@ -754,11 +752,7 @@ static void free_pdev(struct pcifront_device *pdev)
 	if (pdev->evtchn != INVALID_EVTCHN)
 		xenbus_free_evtchn(pdev->xdev, pdev->evtchn);
 
-	if (pdev->gnt_ref != INVALID_GRANT_REF)
-		gnttab_end_foreign_access(pdev->gnt_ref,
-					  (unsigned long)pdev->sh_info);
-	else
-		free_page((unsigned long)pdev->sh_info);
+	xenbus_teardown_ring((void **)&pdev->sh_info, 1, &pdev->gnt_ref);
 
 	dev_set_drvdata(&pdev->xdev->dev, NULL);
 
@@ -769,13 +763,6 @@ static int pcifront_publish_info(struct pcifront_device *pdev)
 {
 	int err = 0;
 	struct xenbus_transaction trans;
-	grant_ref_t gref;
-
-	err = xenbus_grant_ring(pdev->xdev, pdev->sh_info, 1, &gref);
-	if (err < 0)
-		goto out;
-
-	pdev->gnt_ref = gref;
 
 	err = xenbus_alloc_evtchn(pdev->xdev, &pdev->evtchn);
 	if (err)
-- 
2.34.1


