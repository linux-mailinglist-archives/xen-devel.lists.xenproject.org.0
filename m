Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEF645FA65
	for <lists+xen-devel@lfdr.de>; Sat, 27 Nov 2021 02:28:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233736.405910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqmVh-00029T-EA; Sat, 27 Nov 2021 01:28:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233736.405910; Sat, 27 Nov 2021 01:28:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqmVh-00025D-90; Sat, 27 Nov 2021 01:28:13 +0000
Received: by outflank-mailman (input) for mailman id 233736;
 Sat, 27 Nov 2021 01:28:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Erow=QO=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mqmSn-0003uw-8S
 for xen-devel@lists.xenproject.org; Sat, 27 Nov 2021 01:25:13 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dafe22fc-4f20-11ec-9787-a32c541c8605;
 Sat, 27 Nov 2021 02:25:07 +0100 (CET)
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
X-Inumbo-ID: dafe22fc-4f20-11ec-9787-a32c541c8605
Message-ID: <20211127000918.836550402@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1637976307;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=QyFkdnL3oY21jCwm7LMhiRAQpgzR7HBWMPckiZs+cZQ=;
	b=pkN1X6p2TWTtkn/ihoW90Rkpmf/iln5bBJqGE7CQ7iT8u+Q1MPlG8IisTG37saRwu6J/rZ
	Nur/vbT+xxagEkyMn09lRfyx98c7PuV5NE8DHMwZ8RBvf03/rQC1+LV4+RYWJZk1mIumEe
	y0j4U+Uvruxeh51+ULSxn0r4bHscs97kyagpxYGZNdEMxUGfOrxn2oFNpF1Pz0X3btaO6M
	c1UOq9uFXcbNsQojOznny93KAehEzQWSQPWUKQGVYhXBTLz5LN0jh337DzrbTLmSohN6iJ
	yUAzohanZEnt3X7QiRURNzN3mFB8FETjFsl9CaVn4RSqj5snAljfejqvk0nNKA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1637976307;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=QyFkdnL3oY21jCwm7LMhiRAQpgzR7HBWMPckiZs+cZQ=;
	b=hVzBu7eqnTF7D/GVx80F/VPW8fhwDlrADT/JkaBpbIsSrFdPztAjIJ0cLJJLjUmePiNopj
	MEXcTDuqU9bhvOAQ==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
 Marc Zygnier <maz@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 Megha Dey <megha.dey@intel.com>,
 Ashok Raj <ashok.raj@intel.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Cooper <amc96@cam.ac.uk>,
 Juergen Gross <jgross@suse.com>,
 linux-pci@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: [patch 06/10] PCI/MSI: Use range in allocation path
References: <20211126233124.618283684@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Sat, 27 Nov 2021 02:25:06 +0100 (CET)

Make the allocation path range based to prepare for runtime expansion of
MSI-X vectors.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/pci/msi/irqdomain.c |    7 +++----
 drivers/pci/msi/msi.c       |   34 +++++++++++++++++++++-------------
 drivers/pci/msi/msi.h       |    2 +-
 3 files changed, 25 insertions(+), 18 deletions(-)

--- a/drivers/pci/msi/irqdomain.c
+++ b/drivers/pci/msi/irqdomain.c
@@ -8,16 +8,15 @@
 
 #include "msi.h"
 
-int pci_msi_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
+int pci_msi_setup_msi_irqs(struct pci_dev *dev, struct msi_range *range, int type)
 {
-	struct msi_range range = { .first = 0, .last = UINT_MAX, .ndesc = nvec};
 	struct irq_domain *domain;
 
 	domain = dev_get_msi_domain(&dev->dev);
 	if (domain && irq_domain_is_hierarchy(domain))
-		return msi_domain_alloc_irqs_descs_locked(domain, &dev->dev, &range);
+		return msi_domain_alloc_irqs_descs_locked(domain, &dev->dev, range);
 
-	return pci_msi_legacy_setup_msi_irqs(dev, nvec, type);
+	return pci_msi_legacy_setup_msi_irqs(dev, range->ndesc, type);
 }
 
 void pci_msi_teardown_msi_irqs(struct pci_dev *dev)
--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -370,14 +370,16 @@ static int msi_setup_msi_desc(struct pci
 	return ret;
 }
 
-static int msi_verify_entries(struct pci_dev *dev)
+static int msi_verify_entries(struct pci_dev *dev, struct msi_range *range)
 {
 	struct msi_desc *entry;
 
 	if (!dev->no_64bit_msi)
 		return 0;
 
-	msi_for_each_desc(entry, &dev->dev, MSI_DESC_ALL) {
+	msi_for_each_desc_from(entry, &dev->dev, MSI_DESC_ALL, range->first) {
+		if (entry->msi_index > range->last)
+			return 0;
 		if (entry->msg.address_hi) {
 			pci_err(dev, "arch assigned 64-bit MSI address %#x%08x but device only supports 32 bits\n",
 				entry->msg.address_hi, entry->msg.address_lo);
@@ -402,6 +404,7 @@ static int msi_verify_entries(struct pci
 static int msi_capability_init(struct pci_dev *dev, int nvec,
 			       struct irq_affinity *affd)
 {
+	struct msi_range range = { .first = 0, .last = 0, .ndesc = nvec, };
 	struct irq_affinity_desc *masks = NULL;
 	struct msi_desc *entry;
 	int ret;
@@ -421,11 +424,11 @@ static int msi_capability_init(struct pc
 	pci_msi_mask(entry, msi_multi_mask(entry));
 
 	/* Configure MSI capability structure */
-	ret = pci_msi_setup_msi_irqs(dev, nvec, PCI_CAP_ID_MSI);
+	ret = pci_msi_setup_msi_irqs(dev, &range, PCI_CAP_ID_MSI);
 	if (ret)
 		goto err;
 
-	ret = msi_verify_entries(dev);
+	ret = msi_verify_entries(dev, &range);
 	if (ret)
 		goto err;
 
@@ -469,7 +472,8 @@ static void __iomem *msix_map_region(str
 }
 
 static int msix_setup_msi_descs(struct pci_dev *dev, void __iomem *base,
-				struct msix_entry *entries, int nvec,
+				struct msi_range *range,
+				struct msix_entry *entries,
 				struct irq_affinity_desc *masks)
 {
 	int ret, i, vec_count = pci_msix_vec_count(dev);
@@ -485,8 +489,8 @@ static int msix_setup_msi_descs(struct p
 	desc.pci.msi_attrib.default_irq	= dev->irq;
 	desc.pci.mask_base		= base;
 
-	for (i = 0, curmsk = masks; i < nvec; i++, curmsk++) {
-		desc.msi_index = entries ? entries[i].entry : i;
+	for (i = 0, curmsk = masks; i < range->ndesc; i++, curmsk++) {
+		desc.msi_index = entries ? entries[i].entry : range->first + i;
 		desc.affinity = masks ? curmsk : NULL;
 		desc.pci.msi_attrib.is_virtual = desc.msi_index >= vec_count;
 		desc.pci.msi_attrib.can_mask = !pci_msi_ignore_mask &&
@@ -500,6 +504,9 @@ static int msix_setup_msi_descs(struct p
 		ret = msi_add_msi_desc(&dev->dev, &desc);
 		if (ret)
 			break;
+
+		if (desc.msi_index > range->last)
+			range->last = desc.msi_index;
 	}
 
 	return ret;
@@ -530,28 +537,28 @@ static void msix_mask_all(void __iomem *
 }
 
 static int msix_setup_interrupts(struct pci_dev *dev, void __iomem *base,
-				 struct msix_entry *entries, int nvec,
+				 struct msi_range *range, struct msix_entry *entries,
 				 struct irq_affinity *affd)
 {
 	struct irq_affinity_desc *masks = NULL;
 	int ret;
 
 	if (affd)
-		masks = irq_create_affinity_masks(nvec, affd);
+		masks = irq_create_affinity_masks(range->ndesc, affd);
 
 	msi_lock_descs(&dev->dev);
-	ret = msix_setup_msi_descs(dev, base, entries, nvec, masks);
+	ret = msix_setup_msi_descs(dev, base, range, entries, masks);
 	if (ret)
 		goto out_free;
 
 	dev->dev.msi.data->properties = MSI_PROP_PCI_MSIX | MSI_PROP_64BIT;
 
-	ret = pci_msi_setup_msi_irqs(dev, nvec, PCI_CAP_ID_MSIX);
+	ret = pci_msi_setup_msi_irqs(dev, range, PCI_CAP_ID_MSIX);
 	if (ret)
 		goto out_free;
 
 	/* Check if all MSI entries honor device restrictions */
-	ret = msi_verify_entries(dev);
+	ret = msi_verify_entries(dev, range);
 	if (ret)
 		goto out_free;
 
@@ -580,6 +587,7 @@ static int msix_setup_interrupts(struct
 static int msix_capability_init(struct pci_dev *dev, struct msix_entry *entries,
 				int nvec, struct irq_affinity *affd)
 {
+	struct msi_range range = { .first = 0, .last = 0, .ndesc = nvec, };
 	void __iomem *base;
 	int ret, tsize;
 	u16 control;
@@ -606,7 +614,7 @@ static int msix_capability_init(struct p
 	/* Ensure that all table entries are masked. */
 	msix_mask_all(base, tsize);
 
-	ret = msix_setup_interrupts(dev, base, entries, nvec, affd);
+	ret = msix_setup_interrupts(dev, base, &range, entries, affd);
 	if (ret)
 		goto out_disable;
 
--- a/drivers/pci/msi/msi.h
+++ b/drivers/pci/msi/msi.h
@@ -5,7 +5,7 @@
 
 #define msix_table_size(flags)	((flags & PCI_MSIX_FLAGS_QSIZE) + 1)
 
-extern int pci_msi_setup_msi_irqs(struct pci_dev *dev, int nvec, int type);
+extern int pci_msi_setup_msi_irqs(struct pci_dev *dev, struct msi_range *range, int type);
 extern void pci_msi_teardown_msi_irqs(struct pci_dev *dev);
 
 #ifdef CONFIG_PCI_MSI_ARCH_FALLBACKS


