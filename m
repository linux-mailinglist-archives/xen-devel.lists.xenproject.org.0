Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0925F6AB3
	for <lists+xen-devel@lfdr.de>; Thu,  6 Oct 2022 17:35:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.417110.661749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogStZ-0001Sw-4I; Thu, 06 Oct 2022 15:34:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 417110.661749; Thu, 06 Oct 2022 15:34:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogStZ-0001QM-1Q; Thu, 06 Oct 2022 15:34:45 +0000
Received: by outflank-mailman (input) for mailman id 417110;
 Thu, 06 Oct 2022 15:34:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q1hL=2H=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ogStX-0001QG-Fq
 for xen-devel@lists.xenproject.org; Thu, 06 Oct 2022 15:34:43 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 614f726c-458c-11ed-9377-c1cf23e5d27e;
 Thu, 06 Oct 2022 17:34:35 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BB72821A16;
 Thu,  6 Oct 2022 15:34:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 724B41376E;
 Thu,  6 Oct 2022 15:34:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7nQUGZH1PmNGCwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 06 Oct 2022 15:34:41 +0000
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
X-Inumbo-ID: 614f726c-458c-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1665070481; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=jPrMuJyteEIaUOmAxhKdlol+IAYiy0Vmj2454XJWMy8=;
	b=ufgn8i3nxA5/MEDL7VtUUswRfhdGfm6Au6MkuPeCGpldPf1wdEsKPw4y0C1xnal641rKAl
	4EnXbxIjU/HKfnwYcMycaVulG0IOgPD5v0Am7GH7SD4E+T57Bt9mwiNLRVM+xeA3C69+pE
	TFbMS5xFYhnczjE+pagxg/8fpMVioWg=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2] xen/pcifront: move xenstore config scanning into sub-function
Date: Thu,  6 Oct 2022 17:34:40 +0200
Message-Id: <20221006153440.18049-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pcifront_try_connect() and pcifront_attach_devices() share a large
chunk of duplicated code for reading the config information from
Xenstore, which only differs regarding calling pcifront_rescan_root()
or pcifront_scan_root().

Put that code into a new sub-function. It is fine to always call
pcifront_rescan_root() from that common function, as it will fallback
to pcifront_scan_root() if the domain/bus combination isn't known
yet (and pcifront_scan_root() should never be called for an already
kneon domain/bus combination anyway). In order to avoid duplicate
messages for the fallback case move the check for domain/bus not knwon
to the beginning of pcifront_rescan_root().

While at it fix the error reporting in case the root-xx node had the
wrong format.

As the return value of pcifront_try_connect() and
pcifront_attach_devices() are not used anywhere make those functions
return void. As an additional bonus this removes the dubious return
of -EFAULT in case of an unexpected driver state.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- always call pcifront_rescan_root() (Jason Andryuk)
---
 drivers/pci/xen-pcifront.c | 143 ++++++++++---------------------------
 1 file changed, 37 insertions(+), 106 deletions(-)

diff --git a/drivers/pci/xen-pcifront.c b/drivers/pci/xen-pcifront.c
index 689271c4245c..601efdceae63 100644
--- a/drivers/pci/xen-pcifront.c
+++ b/drivers/pci/xen-pcifront.c
@@ -521,24 +521,14 @@ static int pcifront_rescan_root(struct pcifront_device *pdev,
 	int err;
 	struct pci_bus *b;
 
-#ifndef CONFIG_PCI_DOMAINS
-	if (domain != 0) {
-		dev_err(&pdev->xdev->dev,
-			"PCI Root in non-zero PCI Domain! domain=%d\n", domain);
-		dev_err(&pdev->xdev->dev,
-			"Please compile with CONFIG_PCI_DOMAINS\n");
-		return -EINVAL;
-	}
-#endif
-
-	dev_info(&pdev->xdev->dev, "Rescanning PCI Frontend Bus %04x:%02x\n",
-		 domain, bus);
-
 	b = pci_find_bus(domain, bus);
 	if (!b)
 		/* If the bus is unknown, create it. */
 		return pcifront_scan_root(pdev, domain, bus);
 
+	dev_info(&pdev->xdev->dev, "Rescanning PCI Frontend Bus %04x:%02x\n",
+		 domain, bus);
+
 	err = pcifront_scan_bus(pdev, domain, bus, b);
 
 	/* Claim resources before going "live" with our devices */
@@ -819,76 +809,73 @@ static int pcifront_publish_info(struct pcifront_device *pdev)
 	return err;
 }
 
-static int pcifront_try_connect(struct pcifront_device *pdev)
+static void pcifront_connect(struct pcifront_device *pdev)
 {
-	int err = -EFAULT;
+	int err;
 	int i, num_roots, len;
 	char str[64];
 	unsigned int domain, bus;
 
-
-	/* Only connect once */
-	if (xenbus_read_driver_state(pdev->xdev->nodename) !=
-	    XenbusStateInitialised)
-		goto out;
-
-	err = pcifront_connect_and_init_dma(pdev);
-	if (err && err != -EEXIST) {
-		xenbus_dev_fatal(pdev->xdev, err,
-				 "Error setting up PCI Frontend");
-		goto out;
-	}
-
 	err = xenbus_scanf(XBT_NIL, pdev->xdev->otherend,
 			   "root_num", "%d", &num_roots);
 	if (err == -ENOENT) {
 		xenbus_dev_error(pdev->xdev, err,
 				 "No PCI Roots found, trying 0000:00");
-		err = pcifront_scan_root(pdev, 0, 0);
+		err = pcifront_rescan_root(pdev, 0, 0);
 		if (err) {
 			xenbus_dev_fatal(pdev->xdev, err,
 					 "Error scanning PCI root 0000:00");
-			goto out;
+			return;
 		}
 		num_roots = 0;
 	} else if (err != 1) {
-		if (err == 0)
-			err = -EINVAL;
-		xenbus_dev_fatal(pdev->xdev, err,
+		xenbus_dev_fatal(pdev->xdev, err >= 0 ? -EINVAL : err,
 				 "Error reading number of PCI roots");
-		goto out;
+		return;
 	}
 
 	for (i = 0; i < num_roots; i++) {
 		len = snprintf(str, sizeof(str), "root-%d", i);
-		if (unlikely(len >= (sizeof(str) - 1))) {
-			err = -ENOMEM;
-			goto out;
-		}
+		if (unlikely(len >= (sizeof(str) - 1)))
+			return;
 
 		err = xenbus_scanf(XBT_NIL, pdev->xdev->otherend, str,
 				   "%x:%x", &domain, &bus);
 		if (err != 2) {
-			if (err >= 0)
-				err = -EINVAL;
-			xenbus_dev_fatal(pdev->xdev, err,
+			xenbus_dev_fatal(pdev->xdev, err >= 0 ? -EINVAL : err,
 					 "Error reading PCI root %d", i);
-			goto out;
+			return;
 		}
 
-		err = pcifront_scan_root(pdev, domain, bus);
+		err = pcifront_rescan_root(pdev, domain, bus);
 		if (err) {
 			xenbus_dev_fatal(pdev->xdev, err,
 					 "Error scanning PCI root %04x:%02x",
 					 domain, bus);
-			goto out;
+			return;
 		}
 	}
 
-	err = xenbus_switch_state(pdev->xdev, XenbusStateConnected);
+	xenbus_switch_state(pdev->xdev, XenbusStateConnected);
+}
 
-out:
-	return err;
+static void pcifront_try_connect(struct pcifront_device *pdev)
+{
+	int err;
+
+	/* Only connect once */
+	if (xenbus_read_driver_state(pdev->xdev->nodename) !=
+	    XenbusStateInitialised)
+		return;
+
+	err = pcifront_connect_and_init_dma(pdev);
+	if (err && err != -EEXIST) {
+		xenbus_dev_fatal(pdev->xdev, err,
+				 "Error setting up PCI Frontend");
+		return;
+	}
+
+	pcifront_connect(pdev);
 }
 
 static int pcifront_try_disconnect(struct pcifront_device *pdev)
@@ -914,67 +901,11 @@ static int pcifront_try_disconnect(struct pcifront_device *pdev)
 	return err;
 }
 
-static int pcifront_attach_devices(struct pcifront_device *pdev)
+static void pcifront_attach_devices(struct pcifront_device *pdev)
 {
-	int err = -EFAULT;
-	int i, num_roots, len;
-	unsigned int domain, bus;
-	char str[64];
-
-	if (xenbus_read_driver_state(pdev->xdev->nodename) !=
+	if (xenbus_read_driver_state(pdev->xdev->nodename) ==
 	    XenbusStateReconfiguring)
-		goto out;
-
-	err = xenbus_scanf(XBT_NIL, pdev->xdev->otherend,
-			   "root_num", "%d", &num_roots);
-	if (err == -ENOENT) {
-		xenbus_dev_error(pdev->xdev, err,
-				 "No PCI Roots found, trying 0000:00");
-		err = pcifront_rescan_root(pdev, 0, 0);
-		if (err) {
-			xenbus_dev_fatal(pdev->xdev, err,
-					 "Error scanning PCI root 0000:00");
-			goto out;
-		}
-		num_roots = 0;
-	} else if (err != 1) {
-		if (err == 0)
-			err = -EINVAL;
-		xenbus_dev_fatal(pdev->xdev, err,
-				 "Error reading number of PCI roots");
-		goto out;
-	}
-
-	for (i = 0; i < num_roots; i++) {
-		len = snprintf(str, sizeof(str), "root-%d", i);
-		if (unlikely(len >= (sizeof(str) - 1))) {
-			err = -ENOMEM;
-			goto out;
-		}
-
-		err = xenbus_scanf(XBT_NIL, pdev->xdev->otherend, str,
-				   "%x:%x", &domain, &bus);
-		if (err != 2) {
-			if (err >= 0)
-				err = -EINVAL;
-			xenbus_dev_fatal(pdev->xdev, err,
-					 "Error reading PCI root %d", i);
-			goto out;
-		}
-
-		err = pcifront_rescan_root(pdev, domain, bus);
-		if (err) {
-			xenbus_dev_fatal(pdev->xdev, err,
-					 "Error scanning PCI root %04x:%02x",
-					 domain, bus);
-			goto out;
-		}
-	}
-
-	xenbus_switch_state(pdev->xdev, XenbusStateConnected);
-
-out:
-	return err;
+		pcifront_connect(pdev);
 }
 
 static int pcifront_detach_devices(struct pcifront_device *pdev)
-- 
2.35.3


