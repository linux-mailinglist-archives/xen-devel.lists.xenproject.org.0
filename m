Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36746470D18
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 23:19:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.244353.422650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvoE6-0005fS-Iq; Fri, 10 Dec 2021 22:18:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 244353.422650; Fri, 10 Dec 2021 22:18:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvoE6-0005Yi-9t; Fri, 10 Dec 2021 22:18:50 +0000
Received: by outflank-mailman (input) for mailman id 244353;
 Fri, 10 Dec 2021 22:18:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nm8/=Q3=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mvoE4-0005LR-Ot
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 22:18:48 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24d8bf03-5a07-11ec-ad7a-b7ef48004f0a;
 Fri, 10 Dec 2021 23:18:47 +0100 (CET)
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
X-Inumbo-ID: 24d8bf03-5a07-11ec-ad7a-b7ef48004f0a
Message-ID: <20211210221813.311410967@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1639174727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=4+wAkdppI+0FsjiVOjRoboRfUoEGu3PdDBK/1dnuCFY=;
	b=ijWPKjClq9DRfiqDCauUOqeI5yYXU3tP5wg1MsLiKOCZqSOsagFln3c4OzFUS8Elgn46kT
	qZIz6lyQXHxfolX96i5XU3cIY+D4MK65b0BisdPtXRaGLKyN22HIG9WMFc+a+Pb5r7Yt/N
	eix//MgfLCsvJT9BqyxVTdFM2ahx+ztKJ8+enXpo3Chemrr7l8l5NLYSQHADKus4XYZZnO
	QmX2SU6sGHvlTDt+nKERO7dywK6hGk9HZOEQsczXKbt2T6kRuRb78llE48vY+tc3PmAP5s
	m+ydYZQD/Zwgx9B4Nu5/uGrHlQvSDdMfqU4QRjzINF5B0nfUQ1l0aHNZvqeKkQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1639174727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=4+wAkdppI+0FsjiVOjRoboRfUoEGu3PdDBK/1dnuCFY=;
	b=GMWdydzWOH0ZCkNPtZwjkukJHdiZ5ohuNFeG5sc5tFhBJYzUGlpxrb3zsKf8GNmvxEolyK
	fEg7ZZ5yE3oPqGCg==
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
 Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org,
 Arnd Bergmann <arnd@arndb.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linuxppc-dev@lists.ozlabs.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Stuart Yoder <stuyoder@gmail.com>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Nishanth Menon <nm@ti.com>,
 Tero Kristo <kristo@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Vinod Koul <vkoul@kernel.org>,
 dmaengine@vger.kernel.org,
 Mark Rutland <mark.rutland@arm.com>,
 Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>,
 iommu@lists.linux-foundation.org,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Sinan Kaya <okaya@kernel.org>
Subject: [patch V3 02/35] x86/pci/XEN: Use PCI device property
References: <20211210221642.869015045@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Dec 2021 23:18:46 +0100 (CET)

From: Thomas Gleixner <tglx@linutronix.de>

instead of fiddling with MSI descriptors.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
---
V3: Use pci_dev->msix_enabled.
---
 arch/x86/pci/xen.c |    9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

--- a/arch/x86/pci/xen.c
+++ b/arch/x86/pci/xen.c
@@ -399,9 +399,7 @@ static void xen_teardown_msi_irqs(struct
 
 static void xen_pv_teardown_msi_irqs(struct pci_dev *dev)
 {
-	struct msi_desc *msidesc = first_pci_msi_entry(dev);
-
-	if (msidesc->pci.msi_attrib.is_msix)
+	if (dev->msix_enabled)
 		xen_pci_frontend_disable_msix(dev);
 	else
 		xen_pci_frontend_disable_msi(dev);
@@ -417,10 +415,7 @@ static int xen_msi_domain_alloc_irqs(str
 	if (WARN_ON_ONCE(!dev_is_pci(dev)))
 		return -EINVAL;
 
-	if (first_msi_entry(dev)->pci.msi_attrib.is_msix)
-		type = PCI_CAP_ID_MSIX;
-	else
-		type = PCI_CAP_ID_MSI;
+	type = to_pci_dev(dev)->msix_enabled ? PCI_CAP_ID_MSIX : PCI_CAP_ID_MSI;
 
 	return xen_msi_ops.setup_msi_irqs(to_pci_dev(dev), nvec, type);
 }


