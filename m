Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69729475E68
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 18:17:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247472.426736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxXta-0003Go-HZ; Wed, 15 Dec 2021 17:16:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247472.426736; Wed, 15 Dec 2021 17:16:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxXta-0003Dv-Cu; Wed, 15 Dec 2021 17:16:50 +0000
Received: by outflank-mailman (input) for mailman id 247472;
 Wed, 15 Dec 2021 17:16:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EjzN=RA=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mxXtY-0003Dp-Cl
 for xen-devel@lists.xenproject.org; Wed, 15 Dec 2021 17:16:48 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c80da237-5dca-11ec-85d3-df6b77346a89;
 Wed, 15 Dec 2021 18:16:46 +0100 (CET)
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
X-Inumbo-ID: c80da237-5dca-11ec-85d3-df6b77346a89
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1639588605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hTXOQ1FMkJ0+Ve5/rvFPORGJ7hh35Px6k1s7EMBqwmo=;
	b=i6Ikjou/b+Yv6lqIV32A3e7GrIvLIXj3odnZe3TCIDVaZVz2iBNvzwVInSKTb//rUts3UC
	JXIUPspxUbLjL9vLFCxTqkEmsPcQqa0jlRZz9J/ERXHS6IU+v5Pv+VEwjaIZfQH59cCNVG
	TqlToMkGDTbisox0dOJ/N64NarNbO3ICfcEhoFvRBVMDwbMb41vhNRSUHGUzt3KciwFYd7
	KRvqTPgAkbaRf2bOiXIaKgM/dYKSqDiHD48+e3p3RQ+gRngvixMUmQX9dMSiQcMx2hbtZI
	cHrIArstu1gEQ3/ZZ5d7srqdLoqOVYjoPAeWdZ3az2kYFP70K+iy5VdJAoq5Kg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1639588605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hTXOQ1FMkJ0+Ve5/rvFPORGJ7hh35Px6k1s7EMBqwmo=;
	b=uXGey63VsKcnveGMEu+kEJG3x08mVaUqgXZXmEYNmGM1D3z+MIXuzL71XeYcsBJuZs9Whq
	rytYH1rq8fa5TmBg==
To: LKML <linux-kernel@vger.kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Marc Zygnier <maz@kernel.org>, Alex
 Williamson <alex.williamson@redhat.com>, Kevin Tian
 <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>, Megha Dey
 <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 linux-pci@vger.kernel.org, Cedric Le Goater <clg@kaod.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org, Arnd Bergmann <arnd@arndb.de>, Michael
 Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org, Stuart Yoder
 <stuyoder@gmail.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>, Nishanth
 Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, Santosh Shilimkar
 <ssantosh@kernel.org>, linux-arm-kernel@lists.infradead.org, Vinod Koul
 <vkoul@kernel.org>, dmaengine@vger.kernel.org, Mark Rutland
 <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 iommu@lists.linux-foundation.org, Jassi Brar <jassisinghbrar@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, Sinan Kaya <okaya@kernel.org>
Subject: [patch V4 09-01/35] PCI/MSI: Decouple MSI[-X] disable from
 pcim_release()
In-Reply-To: <20211210221813.740644351@linutronix.de>
References: <20211210221642.869015045@linutronix.de>
 <20211210221813.740644351@linutronix.de>
Date: Wed, 15 Dec 2021 18:16:44 +0100
Message-ID: <87tuf9rdoj.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

The MSI core will introduce runtime allocation of MSI related data. This
data will be devres managed and has to be set up before enabling
PCI/MSI[-X]. This would introduce an ordering issue vs. pcim_release().

The setup order is:

   pcim_enable_device()
	devres_alloc(pcim_release...);
	...
	pci_irq_alloc()
	  msi_setup_device_data()
	     devres_alloc(msi_device_data_release, ...)

and once the device is released these release functions are invoked in the
opposite order:

    msi_device_data_release()
    ...
    pcim_release()
       pci_disable_msi[x]()

which is obviously wrong, because pci_disable_msi[x]() requires the MSI
data to be available to tear down the MSI[-X] interrupts.

Remove the MSI[-X] teardown from pcim_release() and add an explicit action
to be installed on the attempt of enabling PCI/MSI[-X].

This allows the MSI core data allocation to be ordered correctly in a
subsequent step.

Reported-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
V4: New patch
---
 drivers/pci/msi/msi.c |   33 +++++++++++++++++++++++++++++++++
 drivers/pci/pci.c     |    5 -----
 include/linux/pci.h   |    3 ++-
 3 files changed, 35 insertions(+), 6 deletions(-)

--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -341,6 +341,31 @@ void pci_restore_msi_state(struct pci_de
 }
 EXPORT_SYMBOL_GPL(pci_restore_msi_state);
 
+static void pcim_msi_release(void *pcidev)
+{
+	struct pci_dev *dev = pcidev;
+
+	dev->is_msi_managed = false;
+	pci_free_irq_vectors(dev);
+}
+
+/*
+ * Needs to be separate from pcim_release to prevent an ordering problem
+ * vs. msi_device_data_release() in the MSI core code.
+ */
+static int pcim_setup_msi_release(struct pci_dev *dev)
+{
+	int ret;
+
+	if (!pci_is_managed(dev) || dev->is_msi_managed)
+		return 0;
+
+	ret = devm_add_action(&dev->dev, pcim_msi_release, dev);
+	if (!ret)
+		dev->is_msi_managed = true;
+	return ret;
+}
+
 static struct msi_desc *
 msi_setup_entry(struct pci_dev *dev, int nvec, struct irq_affinity *affd)
 {
@@ -884,6 +909,10 @@ static int __pci_enable_msi_range(struct
 	if (nvec > maxvec)
 		nvec = maxvec;
 
+	rc = pcim_setup_msi_release(dev);
+	if (rc)
+		return rc;
+
 	for (;;) {
 		if (affd) {
 			nvec = irq_calc_affinity_vectors(minvec, nvec, affd);
@@ -927,6 +956,10 @@ static int __pci_enable_msix_range(struc
 	if (WARN_ON_ONCE(dev->msix_enabled))
 		return -EINVAL;
 
+	rc = pcim_setup_msi_release(dev);
+	if (rc)
+		return rc;
+
 	for (;;) {
 		if (affd) {
 			nvec = irq_calc_affinity_vectors(minvec, nvec, affd);
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -2024,11 +2024,6 @@ static void pcim_release(struct device *
 	struct pci_devres *this = res;
 	int i;
 
-	if (dev->msi_enabled)
-		pci_disable_msi(dev);
-	if (dev->msix_enabled)
-		pci_disable_msix(dev);
-
 	for (i = 0; i < DEVICE_COUNT_RESOURCE; i++)
 		if (this->region_mask & (1 << i))
 			pci_release_region(dev, i);
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -425,7 +425,8 @@ struct pci_dev {
 	unsigned int	ats_enabled:1;		/* Address Translation Svc */
 	unsigned int	pasid_enabled:1;	/* Process Address Space ID */
 	unsigned int	pri_enabled:1;		/* Page Request Interface */
-	unsigned int	is_managed:1;
+	unsigned int	is_managed:1;		/* Managed via devres */
+	unsigned int	is_msi_managed:1;	/* MSI release via devres installed */
 	unsigned int	needs_freset:1;		/* Requires fundamental reset */
 	unsigned int	state_saved:1;
 	unsigned int	is_physfn:1;

