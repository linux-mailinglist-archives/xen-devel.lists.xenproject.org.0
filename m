Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA76A5F63A3
	for <lists+xen-devel@lfdr.de>; Thu,  6 Oct 2022 11:29:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416787.661473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogNCA-0002DI-Aw; Thu, 06 Oct 2022 09:29:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416787.661473; Thu, 06 Oct 2022 09:29:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogNCA-0002AU-7k; Thu, 06 Oct 2022 09:29:34 +0000
Received: by outflank-mailman (input) for mailman id 416787;
 Thu, 06 Oct 2022 09:29:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q1hL=2H=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ogNC9-0002AO-Gh
 for xen-devel@lists.xenproject.org; Thu, 06 Oct 2022 09:29:33 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62165700-4559-11ed-964a-05401a9f4f97;
 Thu, 06 Oct 2022 11:29:32 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 772132197F;
 Thu,  6 Oct 2022 09:29:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3D0A51376E;
 Thu,  6 Oct 2022 09:29:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Plt5DfufPmNIVAAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 06 Oct 2022 09:29:31 +0000
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
X-Inumbo-ID: 62165700-4559-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1665048571; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=L7RZFM5d4dnIi1GRTKhMwES2/uyXuvfgoPRuTe96ogM=;
	b=Ci/J0VnfozSfW1tn8VrgOAeBJ0GslTmfAaoB/QDoi2AQB8js+3KZ7nxA6MxMpRSmow6xVi
	j2hmf+j+RbkQkmXnOztnb/pndUnWf44vQX6nrfx02GbaRGavkRcfPmN3RY6FOYJjL0o+cN
	1YtXQlXJfn1PeYjiWilheBlS/EyqdzM=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH] xen/pcifront: move xenstore config scanning into sub-function
Date: Thu,  6 Oct 2022 11:29:29 +0200
Message-Id: <20221006092929.30041-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pcifront_try_connect() and pcifront_attach_devices() share a large
chunk of duplicated code for reading the config information from
Xenstore, which only differs regarding a function call.

Put that code into a new sub-function. While at it fix the error
reporting in case the root-xx node had the wrong format.

As the return value of pcifront_try_connect() and
pcifront_attach_devices() are not used anywhere make those functions
return void. As an additional bonus this removes the dubious return
of -EFAULT in case of an unexpected driver state.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/pci/xen-pcifront.c | 133 +++++++++++--------------------------
 1 file changed, 40 insertions(+), 93 deletions(-)

diff --git a/drivers/pci/xen-pcifront.c b/drivers/pci/xen-pcifront.c
index 689271c4245c..a68e47dcdd7e 100644
--- a/drivers/pci/xen-pcifront.c
+++ b/drivers/pci/xen-pcifront.c
@@ -819,76 +819,79 @@ static int pcifront_publish_info(struct pcifront_device *pdev)
 	return err;
 }
 
-static int pcifront_try_connect(struct pcifront_device *pdev)
+static void pcifront_connect(struct pcifront_device *pdev, bool rescan)
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
+		if (rescan)
+			err = pcifront_rescan_root(pdev, 0, 0);
+		else
+			err = pcifront_scan_root(pdev, 0, 0);
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
+		if (rescan)
+			err = pcifront_rescan_root(pdev, domain, bus);
+		else
+			err = pcifront_scan_root(pdev, domain, bus);
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
+	pcifront_connect(pdev, false);
 }
 
 static int pcifront_try_disconnect(struct pcifront_device *pdev)
@@ -914,67 +917,11 @@ static int pcifront_try_disconnect(struct pcifront_device *pdev)
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
+		pcifront_connect(pdev, true);
 }
 
 static int pcifront_detach_devices(struct pcifront_device *pdev)
-- 
2.35.3


