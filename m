Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D283746AD5A
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 23:51:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240137.416636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMpQ-0003Zo-Cb; Mon, 06 Dec 2021 22:51:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240137.416636; Mon, 06 Dec 2021 22:51:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMpP-0003Rc-RZ; Mon, 06 Dec 2021 22:51:23 +0000
Received: by outflank-mailman (input) for mailman id 240137;
 Mon, 06 Dec 2021 22:51:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qlu=QX=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1muMpM-0000Tb-QW
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 22:51:20 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06d2d33a-56e7-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 23:51:19 +0100 (CET)
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
X-Inumbo-ID: 06d2d33a-56e7-11ec-8a4d-196798b21f7b
Message-ID: <20211206210748.142603657@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638831079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=9yLJ7MKNr/rEir7S3uoWAbXOrCi2s6fUNKy3QjsOHtE=;
	b=eyFASZgRpw8lE0o1fXQsvjQ2CQdIBsFa3cJZ9/Rc6YHGp7MvmPWlsUHBY4y0y7gY6+P9IW
	RxwHCHFpYYMGKEXum4d/429b/NB7pme2LIvEp3mq7OK3Lb1ZHaKcfH9fUx/dQVTiHmqxg+
	w8LHLHoAVat8DH/9FeSrU5qmLTMTjHpdSGbrpZzoKpy1CbrcftQoIupy4gdqV0+x1SozfM
	h+3oZIpmhDivzgJ4OTmIXj7NkNkfmX8DK68eLNQ2/Rm/FTvFuhqPtmUkPjIIaHrZjyAj0o
	Hiqj6drNNQ3nzm4s8B9gjFltzpg04+tQhVQtbVctm+ZpuzMgL7B/8XwMhgeT3Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638831079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=9yLJ7MKNr/rEir7S3uoWAbXOrCi2s6fUNKy3QjsOHtE=;
	b=2Id8mqkqv590PcMEfC/XpIBMacxq4FMY45fq0oEDL24TfJdAo5LOGN8tNZw+dAJtBgyL8q
	iy0bBRqNUEy6HEBw==
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
Subject: [patch V2 10/31] PCI/MSI: Use msi_on_each_desc()
References: <20211206210600.123171746@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  6 Dec 2021 23:51:18 +0100 (CET)

Use the new iterator functions which pave the way for dynamically extending
MSI-X vectors.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/pci/msi/irqdomain.c |    4 ++--
 drivers/pci/msi/legacy.c    |   19 ++++++++-----------
 drivers/pci/msi/msi.c       |   30 ++++++++++++++----------------
 3 files changed, 24 insertions(+), 29 deletions(-)

--- a/drivers/pci/msi/irqdomain.c
+++ b/drivers/pci/msi/irqdomain.c
@@ -83,7 +83,7 @@ static int pci_msi_domain_check_cap(stru
 				    struct msi_domain_info *info,
 				    struct device *dev)
 {
-	struct msi_desc *desc = first_pci_msi_entry(to_pci_dev(dev));
+	struct msi_desc *desc = msi_first_desc(dev, MSI_DESC_ALL);
 
 	/* Special handling to support __pci_enable_msi_range() */
 	if (pci_msi_desc_is_multi_msi(desc) &&
@@ -98,7 +98,7 @@ static int pci_msi_domain_check_cap(stru
 			unsigned int idx = 0;
 
 			/* Check for gaps in the entry indices */
-			for_each_msi_entry(desc, dev) {
+			msi_for_each_desc(desc, dev, MSI_DESC_ALL) {
 				if (desc->msi_index != idx++)
 					return -ENOTSUPP;
 			}
--- a/drivers/pci/msi/legacy.c
+++ b/drivers/pci/msi/legacy.c
@@ -28,7 +28,7 @@ int __weak arch_setup_msi_irqs(struct pc
 	if (type == PCI_CAP_ID_MSI && nvec > 1)
 		return 1;
 
-	for_each_pci_msi_entry(desc, dev) {
+	msi_for_each_desc(desc, &dev->dev, MSI_DESC_NOTASSOCIATED) {
 		ret = arch_setup_msi_irq(dev, desc);
 		if (ret)
 			return ret < 0 ? ret : -ENOSPC;
@@ -42,27 +42,24 @@ void __weak arch_teardown_msi_irqs(struc
 	struct msi_desc *desc;
 	int i;
 
-	for_each_pci_msi_entry(desc, dev) {
-		if (desc->irq) {
-			for (i = 0; i < desc->nvec_used; i++)
-				arch_teardown_msi_irq(desc->irq + i);
-		}
+	msi_for_each_desc(desc, &dev->dev, MSI_DESC_ASSOCIATED) {
+		for (i = 0; i < desc->nvec_used; i++)
+			arch_teardown_msi_irq(desc->irq + i);
 	}
 }
 
 static int pci_msi_setup_check_result(struct pci_dev *dev, int type, int ret)
 {
-	struct msi_desc *entry;
+	struct msi_desc *desc;
 	int avail = 0;
 
 	if (type != PCI_CAP_ID_MSIX || ret >= 0)
 		return ret;
 
 	/* Scan the MSI descriptors for successfully allocated ones. */
-	for_each_pci_msi_entry(entry, dev) {
-		if (entry->irq != 0)
-			avail++;
-	}
+	msi_for_each_desc(desc, &dev->dev, MSI_DESC_ASSOCIATED)
+		avail++;
+
 	return avail ? avail : ret;
 }
 
--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -299,7 +299,6 @@ static void __pci_restore_msix_state(str
 
 	if (!dev->msix_enabled)
 		return;
-	BUG_ON(list_empty(dev_to_msi_list(&dev->dev)));
 
 	/* route the table */
 	pci_intx_for_msi(dev, 0);
@@ -309,7 +308,7 @@ static void __pci_restore_msix_state(str
 	write_msg = arch_restore_msi_irqs(dev);
 
 	msi_lock_descs(&dev->dev);
-	for_each_pci_msi_entry(entry, dev) {
+	msi_for_each_desc(entry, &dev->dev, MSI_DESC_ALL) {
 		if (write_msg)
 			__pci_write_msi_msg(entry, &entry->msg);
 		pci_msix_write_vector_ctrl(entry, entry->pci.msix_ctrl);
@@ -378,14 +377,14 @@ static int msi_verify_entries(struct pci
 	if (!dev->no_64bit_msi)
 		return 0;
 
-	for_each_pci_msi_entry(entry, dev) {
+	msi_for_each_desc(entry, &dev->dev, MSI_DESC_ALL) {
 		if (entry->msg.address_hi) {
 			pci_err(dev, "arch assigned 64-bit MSI address %#x%08x but device only supports 32 bits\n",
 				entry->msg.address_hi, entry->msg.address_lo);
-			return -EIO;
+			break;
 		}
 	}
-	return 0;
+	return !entry ? 0 : -EIO;
 }
 
 /**
@@ -418,7 +417,7 @@ static int msi_capability_init(struct pc
 		goto unlock;
 
 	/* All MSIs are unmasked by default; mask them all */
-	entry = first_pci_msi_entry(dev);
+	entry = msi_first_desc(&dev->dev, MSI_DESC_ALL);
 	pci_msi_mask(entry, msi_multi_mask(entry));
 
 	/* Configure MSI capability structure */
@@ -508,11 +507,11 @@ static int msix_setup_msi_descs(struct p
 
 static void msix_update_entries(struct pci_dev *dev, struct msix_entry *entries)
 {
-	struct msi_desc *entry;
+	struct msi_desc *desc;
 
 	if (entries) {
-		for_each_pci_msi_entry(entry, dev) {
-			entries->vector = entry->irq;
+		msi_for_each_desc(desc, &dev->dev, MSI_DESC_ALL) {
+			entries->vector = desc->irq;
 			entries++;
 		}
 	}
@@ -705,15 +704,14 @@ static void pci_msi_shutdown(struct pci_
 	if (!pci_msi_enable || !dev || !dev->msi_enabled)
 		return;
 
-	BUG_ON(list_empty(dev_to_msi_list(&dev->dev)));
-	desc = first_pci_msi_entry(dev);
-
 	pci_msi_set_enable(dev, 0);
 	pci_intx_for_msi(dev, 1);
 	dev->msi_enabled = 0;
 
 	/* Return the device with MSI unmasked as initial states */
-	pci_msi_unmask(desc, msi_multi_mask(desc));
+	desc = msi_first_desc(&dev->dev, MSI_DESC_ALL);
+	if (!WARN_ON_ONCE(!desc))
+		pci_msi_unmask(desc, msi_multi_mask(desc));
 
 	/* Restore dev->irq to its default pin-assertion IRQ */
 	dev->irq = desc->pci.msi_attrib.default_irq;
@@ -789,7 +787,7 @@ static int __pci_enable_msix(struct pci_
 
 static void pci_msix_shutdown(struct pci_dev *dev)
 {
-	struct msi_desc *entry;
+	struct msi_desc *desc;
 
 	if (!pci_msi_enable || !dev || !dev->msix_enabled)
 		return;
@@ -800,8 +798,8 @@ static void pci_msix_shutdown(struct pci
 	}
 
 	/* Return the device with MSI-X masked as initial states */
-	for_each_pci_msi_entry(entry, dev)
-		pci_msix_mask(entry);
+	msi_for_each_desc(desc, &dev->dev, MSI_DESC_ALL)
+		pci_msix_mask(desc);
 
 	pci_msix_clear_and_set_ctrl(dev, PCI_MSIX_FLAGS_ENABLE, 0);
 	pci_intx_for_msi(dev, 1);


