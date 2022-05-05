Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C21451B9F9
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 10:17:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.321676.542834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmWfX-0005AC-0b; Thu, 05 May 2022 08:17:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 321676.542834; Thu, 05 May 2022 08:17:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmWfV-0004xu-Bm; Thu, 05 May 2022 08:17:01 +0000
Received: by outflank-mailman (input) for mailman id 321676;
 Thu, 05 May 2022 08:16:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YMz1=VN=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nmWfN-0001o5-BB
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 08:16:53 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5a69cf7-cc4b-11ec-a406-831a346695d4;
 Thu, 05 May 2022 10:16:48 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 527911F896;
 Thu,  5 May 2022 08:16:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1BA3413B11;
 Thu,  5 May 2022 08:16:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SE5QBfCHc2K1BwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 05 May 2022 08:16:48 +0000
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
X-Inumbo-ID: b5a69cf7-cc4b-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1651738608; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KZPJLwAsgzNCCroRjeE9JafH9BIwjuth4vqOa5N14pw=;
	b=L9AkWL0xVkfyaETjQQnwkqUS5khHtDMf+yhkFrQWWVGL/FhZgqSqJiD6oFcqjNRK/K9rtz
	6R8uVePLGLABT2Xwd4pNjgXpVO+mNjheueg8SMDJ1wu3KzgWpc+QQ1S9WmzuZ1sM5HFo3U
	g/h5qKh9aDov7yLDD/Pzd+iMPkafJ5k=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v3 17/21] xen/pcifront: use xenbus_setup_ring() and xenbus_teardown_ring()
Date: Thu,  5 May 2022 10:16:36 +0200
Message-Id: <20220505081640.17425-18-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220505081640.17425-1-jgross@suse.com>
References: <20220505081640.17425-1-jgross@suse.com>
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
2.35.3


