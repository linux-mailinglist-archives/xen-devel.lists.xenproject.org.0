Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE28444BA4
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 00:27:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221179.382760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miPfI-0002yz-Rj; Wed, 03 Nov 2021 23:27:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221179.382760; Wed, 03 Nov 2021 23:27:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miPfI-0002xD-Oc; Wed, 03 Nov 2021 23:27:32 +0000
Received: by outflank-mailman (input) for mailman id 221179;
 Wed, 03 Nov 2021 23:27:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1PY5=PW=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1miPfH-0002tz-BR
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 23:27:31 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d434dac-3cfd-11ec-a9d2-d9f7a1cc8784;
 Thu, 04 Nov 2021 00:27:30 +0100 (CET)
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
X-Inumbo-ID: 9d434dac-3cfd-11ec-a9d2-d9f7a1cc8784
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1635982049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lDDnoosuRNvWD7CuXVCdoj1xtKBkTouC/FU6yWiMyvg=;
	b=C8z1BxAI8GIJsZSkGLCWSa4YFoPmD7xTlPVkYBZTYYIZG4c1pPFHj3t6Nq7wV35gw+9dsq
	OFRyAu/N9A812oznFmUt0yQwc2gQyRRPq468JA8hvUuEYpq7OktBk3C4AC8wx7NIfkrOLr
	kU0YfD41pe/OR+X1fkXpFaJwbJ2ruNW/RY2qYpXmh6dTsHf0MLXX7qsC6K2mqHLtBq/LYw
	GitT70+krEvEKoGMk9WrpC7ZszZ2DZC6N+Ia/U5PDzoO04Ng6aOQkbuBZvRePTgN5ArM8s
	5WyH7jHd8yozYMV7PT+KBLWm5EmoPBGlL0ECNXdQDdltW+P62HtY6NFZSt3rvg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1635982049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lDDnoosuRNvWD7CuXVCdoj1xtKBkTouC/FU6yWiMyvg=;
	b=rgygKXmt4QIddOW8QA8i4kBWYDuEaKN+W9sz0tFpDFLoEhKK1rkQ5Mzap6yObEqz1g7ihm
	UhBa5+NWxEhG9FDA==
To: Josef Johansson <josef@oderland.se>
Cc: boris.ostrovsky@oracle.com, helgaas@kernel.org, jgross@suse.com,
 linux-pci@vger.kernel.org, maz@kernel.org, xen-devel@lists.xenproject.org,
 Jason Andryuk <jandryuk@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH v2] PCI/MSI: Move non-mask check back into low level accessors
In-Reply-To: <87k0ho6ctu.ffs@tglx>
References: <90277228-cf14-0cfa-c95e-d42e7d533353@oderland.se>
 <20211025012503.33172-1-jandryuk@gmail.com> <87fssmg8k4.ffs@tglx>
 <87cznqg5k8.ffs@tglx> <d1cc20aa-5c5c-6c7b-2e5d-bc31362ad891@oderland.se>
 <89d6c2f4-4d00-972f-e434-cb1839e78598@oderland.se>
 <5b3d4653-0cdf-e098-0a4a-3c5c3ae3977b@oderland.se> <87k0ho6ctu.ffs@tglx>
Date: Thu, 04 Nov 2021 00:27:29 +0100
Message-ID: <87h7cs6cri.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

From: Thomas Gleixner <tglx@linutronix.de>

The recent rework of PCI/MSI[X] masking moved the non-mask checks from the
low level accessors into the higher level mask/unmask functions.

This missed the fact that these accessors can be invoked from other places
as well. The missing checks break XEN-PV which sets pci_msi_ignore_mask and
also violates the virtual MSIX and the msi_attrib.maskbit protections.

Instead of sprinkling checks all over the place, lift them back into the
low level accessor functions. To avoid checking three different conditions
combine them into one property of msi_desc::msi_attrib.

[ josef: Fixed the missed conversion in the core code ]

Fixes: fcacdfbef5a1 ("PCI/MSI: Provide a new set of mask and unmask functions")
Reported-by: Josef Johansson <josef@oderland.se>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Josef Johansson <josef@oderland.se>
Cc: stable@vger.kernel.org
---
V2: Added the missing conversion in the core code - Josef
---
 drivers/pci/msi.c   |   26 ++++++++++++++------------
 include/linux/msi.h |    2 +-
 kernel/irq/msi.c    |    4 ++--
 3 files changed, 17 insertions(+), 15 deletions(-)

--- a/drivers/pci/msi.c
+++ b/drivers/pci/msi.c
@@ -148,6 +148,9 @@ static noinline void pci_msi_update_mask
 	raw_spinlock_t *lock = &desc->dev->msi_lock;
 	unsigned long flags;
 
+	if (!desc->msi_attrib.can_mask)
+		return;
+
 	raw_spin_lock_irqsave(lock, flags);
 	desc->msi_mask &= ~clear;
 	desc->msi_mask |= set;
@@ -181,7 +184,8 @@ static void pci_msix_write_vector_ctrl(s
 {
 	void __iomem *desc_addr = pci_msix_desc_addr(desc);
 
-	writel(ctrl, desc_addr + PCI_MSIX_ENTRY_VECTOR_CTRL);
+	if (desc->msi_attrib.can_mask)
+		writel(ctrl, desc_addr + PCI_MSIX_ENTRY_VECTOR_CTRL);
 }
 
 static inline void pci_msix_mask(struct msi_desc *desc)
@@ -200,23 +204,17 @@ static inline void pci_msix_unmask(struc
 
 static void __pci_msi_mask_desc(struct msi_desc *desc, u32 mask)
 {
-	if (pci_msi_ignore_mask || desc->msi_attrib.is_virtual)
-		return;
-
 	if (desc->msi_attrib.is_msix)
 		pci_msix_mask(desc);
-	else if (desc->msi_attrib.maskbit)
+	else
 		pci_msi_mask(desc, mask);
 }
 
 static void __pci_msi_unmask_desc(struct msi_desc *desc, u32 mask)
 {
-	if (pci_msi_ignore_mask || desc->msi_attrib.is_virtual)
-		return;
-
 	if (desc->msi_attrib.is_msix)
 		pci_msix_unmask(desc);
-	else if (desc->msi_attrib.maskbit)
+	else
 		pci_msi_unmask(desc, mask);
 }
 
@@ -484,7 +482,8 @@ msi_setup_entry(struct pci_dev *dev, int
 	entry->msi_attrib.is_64		= !!(control & PCI_MSI_FLAGS_64BIT);
 	entry->msi_attrib.is_virtual    = 0;
 	entry->msi_attrib.entry_nr	= 0;
-	entry->msi_attrib.maskbit	= !!(control & PCI_MSI_FLAGS_MASKBIT);
+	entry->msi_attrib.can_mask	= !pci_msi_ignore_mask &&
+					  !!(control & PCI_MSI_FLAGS_MASKBIT);
 	entry->msi_attrib.default_irq	= dev->irq;	/* Save IOAPIC IRQ */
 	entry->msi_attrib.multi_cap	= (control & PCI_MSI_FLAGS_QMASK) >> 1;
 	entry->msi_attrib.multiple	= ilog2(__roundup_pow_of_two(nvec));
@@ -495,7 +494,7 @@ msi_setup_entry(struct pci_dev *dev, int
 		entry->mask_pos = dev->msi_cap + PCI_MSI_MASK_32;
 
 	/* Save the initial mask status */
-	if (entry->msi_attrib.maskbit)
+	if (entry->msi_attrib.can_mask)
 		pci_read_config_dword(dev, entry->mask_pos, &entry->msi_mask);
 
 out:
@@ -638,10 +637,13 @@ static int msix_setup_entries(struct pci
 		entry->msi_attrib.is_virtual =
 			entry->msi_attrib.entry_nr >= vec_count;
 
+		entry->msi_attrib.can_mask	= !pci_msi_ignore_mask &&
+						  !entry->msi_attrib.is_virtual;
+
 		entry->msi_attrib.default_irq	= dev->irq;
 		entry->mask_base		= base;
 
-		if (!entry->msi_attrib.is_virtual) {
+		if (!entry->msi_attrib.can_mask) {
 			addr = pci_msix_desc_addr(entry);
 			entry->msix_ctrl = readl(addr + PCI_MSIX_ENTRY_VECTOR_CTRL);
 		}
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -148,7 +148,7 @@ struct msi_desc {
 				u8	is_msix		: 1;
 				u8	multiple	: 3;
 				u8	multi_cap	: 3;
-				u8	maskbit		: 1;
+				u8	can_mask	: 1;
 				u8	is_64		: 1;
 				u8	is_virtual	: 1;
 				u16	entry_nr;
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -529,10 +529,10 @@ static bool msi_check_reservation_mode(s
 
 	/*
 	 * Checking the first MSI descriptor is sufficient. MSIX supports
-	 * masking and MSI does so when the maskbit is set.
+	 * masking and MSI does so when the can_mask attribute is set.
 	 */
 	desc = first_msi_entry(dev);
-	return desc->msi_attrib.is_msix || desc->msi_attrib.maskbit;
+	return desc->msi_attrib.is_msix || desc->msi_attrib.can_mask;
 }
 
 int __msi_domain_alloc_irqs(struct irq_domain *domain, struct device *dev,

