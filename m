Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B53846AE19
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 00:00:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240280.416760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMyG-0005az-0d; Mon, 06 Dec 2021 23:00:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240280.416760; Mon, 06 Dec 2021 23:00:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMyF-0005XT-Tp; Mon, 06 Dec 2021 23:00:31 +0000
Received: by outflank-mailman (input) for mailman id 240280;
 Mon, 06 Dec 2021 23:00:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qlu=QX=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1muMpU-0000Tb-0G
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 22:51:28 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b985621-56e7-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 23:51:27 +0100 (CET)
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
X-Inumbo-ID: 0b985621-56e7-11ec-8a4d-196798b21f7b
Message-ID: <20211206210748.414712173@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638831087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=doaEN4PngPF6b3Ms4+nCLub9WRL+cYqg2iUonunceVg=;
	b=mDVbOZFMq2r0fFSal6nGytKiR9N0dKq5PqwK3juP1cFnlgmQUuw4LpkD1Hpm/hkbKZm+u7
	Yea4cNfID7VRix/TmSW0sPFLvyDtgOlkMm7w8ymCcbMXlPLtwak2/32g8dpHmlOP3O/F6G
	jdU4NlHvekujXArGpsBa5yUjWwJ1eEzk2cniYcCq3kZdS9WskWSkWr65L4WuQjer6xqU1f
	Ul5hlmIH9G0tFTvOrZ6TNqwpU2DDuWudK+A/4sOQoKvCebsyPKW3/F+OiN3j2Uvb53neJ1
	tJE6RPkzzdtCxeELmNPrSmNWxRMUlB41D5TaNxMfPsoV84Jl5DW5WZfsZ5VwLQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638831087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=doaEN4PngPF6b3Ms4+nCLub9WRL+cYqg2iUonunceVg=;
	b=edZkzp0cQopCCOVDx2I8Wc5M/D97TZhEVVbeeZnpase12JmLW+w6pTojHaCFf7vSYnKATQ
	gAtXqukltBF2IkBw==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
 Marc Zygnier <maz@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 Megha Dey <megha.dey@intel.com>,
 Ashok Raj <ashok.raj@intel.com>,
 linux-pci@vger.kernel.org,
 Cedric Le Goater <clg@kaod.org>,
 xen-devel@lists.xenproject.org,
 Juergen Gross <jgross@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Niklas Schnelle <schnelle@linux.ibm.com>,
 linux-s390@vger.kernel.org,
 Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Logan Gunthorpe <logang@deltatee.com>,
 Jon Mason <jdmason@kudzu.us>,
 Dave Jiang <dave.jiang@intel.com>,
 Allen Hubbe <allenbh@gmail.com>,
 linux-ntb@googlegroups.com
Subject: [patch V2 15/31] powerpc/cell/axon_msi: Convert to msi_on_each_desc()
References: <20211206210600.123171746@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  6 Dec 2021 23:51:26 +0100 (CET)

Replace the about to vanish iterators and make use of the filtering.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/powerpc/platforms/cell/axon_msi.c |    7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

--- a/arch/powerpc/platforms/cell/axon_msi.c
+++ b/arch/powerpc/platforms/cell/axon_msi.c
@@ -265,7 +265,7 @@ static int axon_msi_setup_msi_irqs(struc
 	if (rc)
 		return rc;
 
-	for_each_pci_msi_entry(entry, dev) {
+	msi_for_each_desc(entry, &dev->dev, MSI_DESC_NOTASSOCIATED) {
 		virq = irq_create_direct_mapping(msic->irq_domain);
 		if (!virq) {
 			dev_warn(&dev->dev,
@@ -288,10 +288,7 @@ static void axon_msi_teardown_msi_irqs(s
 
 	dev_dbg(&dev->dev, "axon_msi: tearing down msi irqs\n");
 
-	for_each_pci_msi_entry(entry, dev) {
-		if (!entry->irq)
-			continue;
-
+	msi_for_each_desc(entry, &dev->dev, MSI_DESC_ASSOCIATED) {
 		irq_set_msi_desc(entry->irq, NULL);
 		irq_dispose_mapping(entry->irq);
 	}


