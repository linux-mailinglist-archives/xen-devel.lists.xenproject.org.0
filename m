Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F97470D22
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 23:19:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.244351.422633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvoE5-0005Nf-K2; Fri, 10 Dec 2021 22:18:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 244351.422633; Fri, 10 Dec 2021 22:18:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvoE5-0005Lb-Ez; Fri, 10 Dec 2021 22:18:49 +0000
Received: by outflank-mailman (input) for mailman id 244351;
 Fri, 10 Dec 2021 22:18:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nm8/=Q3=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mvoE3-0005LK-Dd
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 22:18:47 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2401c406-5a07-11ec-a74f-db008197e53d;
 Fri, 10 Dec 2021 23:18:46 +0100 (CET)
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
X-Inumbo-ID: 2401c406-5a07-11ec-a74f-db008197e53d
Message-ID: <20211210221813.250049810@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1639174725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=LAPO48TeSRvyraOCUaLnLGoqr3cykpYVLg5Q2NPw+tk=;
	b=RVFQBQqAHeoiRwlZ3riRsRVnIL91ZjHAfRJRIp58J8GUnDjLQx7L9kWYIIUbdLwuKR/jwL
	JcJBPfohipM62TDgI++91yG93z8S9yOtP19oQQE8Q8k13Dz0zt5IP/hM5mMrevOXLmlklN
	kWOoGd3So5Fe6OgP0QbWV76D4psb9hl5USqdOyh+D6Aqhblm4cpa5e5Vf78Qu6ZYHkQHTi
	bgYvnB6aYzx+LTLoj46c14I2SP51PPz15FBrvc8JBpekzRO6sF7T8vtiJHTJFweb24goaW
	joW6zxk5fBYith6L0SW2dhYjEXttIyscMDGJDovBvIbb2eL2uBhx9UWrfH/KNw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1639174725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=LAPO48TeSRvyraOCUaLnLGoqr3cykpYVLg5Q2NPw+tk=;
	b=W5z8GHgzI4pNn8BJLekDX4e1pfDaOzUgMdqste1q3KO/3rlD+JtPo0I0BMrvt2m3/1G3Vk
	MFABiwOkTOMR3XAQ==
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
Subject: [patch V3 01/35] PCI/MSI: Set pci_dev::msi[x]_enabled early
References: <20211210221642.869015045@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Dec 2021 23:18:44 +0100 (CET)

There are quite some places which retrieve the first MSI descriptor to
evaluate whether the setup is for MSI or MSI-X. That's required because
pci_dev::msi[x]_enabled is only set when the setup completed successfully.

There is no real reason why msi[x]_enabled can't be set at the beginning of
the setup sequence and cleared in case of a failure.

Implement that so the MSI descriptor evaluations can be converted to simple
property queries.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
V3: New patch
---
 drivers/pci/msi/msi.c |   23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -421,11 +421,18 @@ static int msi_capability_init(struct pc
 	struct msi_desc *entry;
 	int ret;
 
-	pci_msi_set_enable(dev, 0);	/* Disable MSI during set up */
+	/*
+	 * Disable MSI during setup in the hardware, but mark it enabled
+	 * so that setup code can evaluate it.
+	 */
+	pci_msi_set_enable(dev, 0);
+	dev->msi_enabled = 1;
 
 	entry = msi_setup_entry(dev, nvec, affd);
-	if (!entry)
-		return -ENOMEM;
+	if (!entry) {
+		ret = -ENOMEM;
+		goto fail;
+	}
 
 	/* All MSIs are unmasked by default; mask them all */
 	pci_msi_mask(entry, msi_multi_mask(entry));
@@ -452,7 +459,6 @@ static int msi_capability_init(struct pc
 	/* Set MSI enabled bits	*/
 	pci_intx_for_msi(dev, 0);
 	pci_msi_set_enable(dev, 1);
-	dev->msi_enabled = 1;
 
 	pcibios_free_irq(dev);
 	dev->irq = entry->irq;
@@ -461,6 +467,8 @@ static int msi_capability_init(struct pc
 err:
 	pci_msi_unmask(entry, msi_multi_mask(entry));
 	free_msi_irqs(dev);
+fail:
+	dev->msi_enabled = 0;
 	return ret;
 }
 
@@ -589,6 +597,9 @@ static int msix_capability_init(struct p
 	pci_msix_clear_and_set_ctrl(dev, 0, PCI_MSIX_FLAGS_MASKALL |
 				    PCI_MSIX_FLAGS_ENABLE);
 
+	/* Mark it enabled so setup functions can query it */
+	dev->msix_enabled = 1;
+
 	pci_read_config_word(dev, dev->msix_cap + PCI_MSIX_FLAGS, &control);
 	/* Request & Map MSI-X table region */
 	tsize = msix_table_size(control);
@@ -626,9 +637,8 @@ static int msix_capability_init(struct p
 
 	dev->msi_irq_groups = groups;
 
-	/* Set MSI-X enabled bits and unmask the function */
+	/* Disable INTX and unmask MSI-X */
 	pci_intx_for_msi(dev, 0);
-	dev->msix_enabled = 1;
 	pci_msix_clear_and_set_ctrl(dev, PCI_MSIX_FLAGS_MASKALL, 0);
 
 	pcibios_free_irq(dev);
@@ -638,6 +648,7 @@ static int msix_capability_init(struct p
 	free_msi_irqs(dev);
 
 out_disable:
+	dev->msix_enabled = 0;
 	pci_msix_clear_and_set_ctrl(dev, PCI_MSIX_FLAGS_ENABLE, 0);
 
 	return ret;


