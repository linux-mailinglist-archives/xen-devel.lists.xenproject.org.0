Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B0B512E69
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 10:28:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316183.535075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njzVP-0000Wq-Am; Thu, 28 Apr 2022 08:28:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316183.535075; Thu, 28 Apr 2022 08:28:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njzVN-0000Ee-RJ; Thu, 28 Apr 2022 08:28:05 +0000
Received: by outflank-mailman (input) for mailman id 316183;
 Thu, 28 Apr 2022 08:27:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KUQd=VG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1njzVE-0005SL-BP
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 08:27:56 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 184ea9a1-c6cd-11ec-a405-831a346695d4;
 Thu, 28 Apr 2022 10:27:52 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E750D21871;
 Thu, 28 Apr 2022 08:27:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ADCC013491;
 Thu, 28 Apr 2022 08:27:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2D3fKAdQamIBLgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 28 Apr 2022 08:27:51 +0000
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
X-Inumbo-ID: 184ea9a1-c6cd-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1651134471; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4w7uCrVXVTwZfPuB483vIPp5pLFfFRyBD4Y2IYXR2Yk=;
	b=evJ5rg5sEto2aWIIjrjOQPgkeyr3Gle8wcN4/Jb29iscyKgXZmT4ie3JH0XrGFhJrMf8Lo
	Niu40LYPTvOu9bDwFznYsNaBdusaLXqoJQPPx7jd7ZSbB7j+czJkZkmZVN05Zs+VwpwZmz
	17Hj+h0lQQ7whUEHoJmdDH9U/WePsPM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v2 15/19] xen/pcifront: use xenbus_setup_ring() and xenbus_teardown_ring()
Date: Thu, 28 Apr 2022 10:27:39 +0200
Message-Id: <20220428082743.16593-16-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220428082743.16593-1-jgross@suse.com>
References: <20220428082743.16593-1-jgross@suse.com>
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


