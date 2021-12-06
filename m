Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3596246ADF0
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 23:59:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240230.416727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMwd-0002bf-Us; Mon, 06 Dec 2021 22:58:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240230.416727; Mon, 06 Dec 2021 22:58:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMwd-0002YY-Ql; Mon, 06 Dec 2021 22:58:51 +0000
Received: by outflank-mailman (input) for mailman id 240230;
 Mon, 06 Dec 2021 22:58:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qlu=QX=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1muMpp-0008NM-5b
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 22:51:49 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 180a1712-56e7-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 23:51:48 +0100 (CET)
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
X-Inumbo-ID: 180a1712-56e7-11ec-a5e1-b9374ead2679
Message-ID: <20211206210749.117395027@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638831108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=UQMeiJXeYiF947FjCPAG7vmRPuGlZ4RmWN1aFBAPWbY=;
	b=j8YDzfjTOVUtw2G4OjF5y06/jFdlYtyKLnuhNrK/bpkLkaTnn4AGZv/jRnvqge83ewT9EZ
	Nwz09wQ3vuJDAxrxrxHq97EhX5xlkbEy8l7ZqB2CE52Smd2nR5hauYUPb70AJfEYW+2m28
	/Ri3ke8al8TQjGRnjGB/dm2AsxUZ9EfKd2HMejOjmKccTj9QrHC9peKnbe8+CVti8ouwJ3
	C1AwktksJnEpHS9BCJsw0vfnuwSS4osKJV69d2y3ByoF2epRfOLHWZBcaL6uLbdG70krcL
	T7hUqEEbHU38REpT8x5KxoTUwUAdy96NvUeCCHoSiy01OTTa4eKEcs4uOXnqKQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638831108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=UQMeiJXeYiF947FjCPAG7vmRPuGlZ4RmWN1aFBAPWbY=;
	b=D+mlv+y+61yJoVZdD/rMHCJo6H0xkNc8ovcUZeqWP8Mth8m+KK95tAht+2fHEV6BMo8mIr
	+btOYd7SZwaNFAAA==
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
Subject: [patch V2 28/31] genirq/msi: Mop up old interfaces
References: <20211206210600.123171746@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  6 Dec 2021 23:51:47 +0100 (CET)

Get rid of the old iterators, alloc/free functions and adjust the core code
accordingly.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 include/linux/msi.h |   15 ---------------
 kernel/irq/msi.c    |   31 +++++++++++++++----------------
 2 files changed, 15 insertions(+), 31 deletions(-)

--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -214,15 +214,7 @@ struct msi_desc *msi_next_desc(struct de
 	for ((desc) = msi_first_desc((dev), (filter)); (desc);	\
 	     (desc) = msi_next_desc((dev), (filter)))
 
-/* Helpers to hide struct msi_desc implementation details */
 #define msi_desc_to_dev(desc)		((desc)->dev)
-#define dev_to_msi_list(dev)		(&(dev)->msi.data->list)
-#define first_msi_entry(dev)		\
-	list_first_entry(dev_to_msi_list((dev)), struct msi_desc, list)
-#define for_each_msi_entry(desc, dev)	\
-	list_for_each_entry((desc), dev_to_msi_list((dev)), list)
-#define for_each_msi_entry_safe(desc, tmp, dev)	\
-	list_for_each_entry_safe((desc), (tmp), dev_to_msi_list((dev)), list)
 
 #ifdef CONFIG_IRQ_MSI_IOMMU
 static inline const void *msi_desc_get_iommu_cookie(struct msi_desc *desc)
@@ -248,10 +240,6 @@ static inline void msi_desc_set_iommu_co
 #endif
 
 #ifdef CONFIG_PCI_MSI
-#define first_pci_msi_entry(pdev)	first_msi_entry(&(pdev)->dev)
-#define for_each_pci_msi_entry(desc, pdev)	\
-	for_each_msi_entry((desc), &(pdev)->dev)
-
 struct pci_dev *msi_desc_to_pci_dev(struct msi_desc *desc);
 void pci_write_msi_msg(unsigned int irq, struct msi_msg *msg);
 #else /* CONFIG_PCI_MSI */
@@ -273,9 +261,6 @@ static inline void msi_free_msi_descs(st
 	msi_free_msi_descs_range(dev, MSI_DESC_ALL, 0, MSI_MAX_INDEX);
 }
 
-struct msi_desc *alloc_msi_entry(struct device *dev, int nvec,
-				 const struct irq_affinity_desc *affinity);
-void free_msi_entry(struct msi_desc *entry);
 void __pci_read_msi_msg(struct msi_desc *entry, struct msi_msg *msg);
 void __pci_write_msi_msg(struct msi_desc *entry, struct msi_msg *msg);
 
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -19,8 +19,10 @@
 
 #include "internals.h"
 
+#define dev_to_msi_list(dev)	(&(dev)->msi.data->list)
+
 /**
- * alloc_msi_entry - Allocate an initialized msi_desc
+ * msi_alloc_desc - Allocate an initialized msi_desc
  * @dev:	Pointer to the device for which this is allocated
  * @nvec:	The number of vectors used in this entry
  * @affinity:	Optional pointer to an affinity mask array size of @nvec
@@ -30,12 +32,11 @@
  *
  * Return: pointer to allocated &msi_desc on success or %NULL on failure
  */
-struct msi_desc *alloc_msi_entry(struct device *dev, int nvec,
-				 const struct irq_affinity_desc *affinity)
+static struct msi_desc *msi_alloc_desc(struct device *dev, int nvec,
+					const struct irq_affinity_desc *affinity)
 {
-	struct msi_desc *desc;
+	struct msi_desc *desc = kzalloc(sizeof(*desc), GFP_KERNEL);
 
-	desc = kzalloc(sizeof(*desc), GFP_KERNEL);
 	if (!desc)
 		return NULL;
 
@@ -43,21 +44,19 @@ struct msi_desc *alloc_msi_entry(struct
 	desc->dev = dev;
 	desc->nvec_used = nvec;
 	if (affinity) {
-		desc->affinity = kmemdup(affinity,
-			nvec * sizeof(*desc->affinity), GFP_KERNEL);
+		desc->affinity = kmemdup(affinity, nvec * sizeof(*desc->affinity), GFP_KERNEL);
 		if (!desc->affinity) {
 			kfree(desc);
 			return NULL;
 		}
 	}
-
 	return desc;
 }
 
-void free_msi_entry(struct msi_desc *entry)
+static void msi_free_desc(struct msi_desc *desc)
 {
-	kfree(entry->affinity);
-	kfree(entry);
+	kfree(desc->affinity);
+	kfree(desc);
 }
 
 /**
@@ -73,7 +72,7 @@ int msi_add_msi_desc(struct device *dev,
 
 	lockdep_assert_held(&dev->msi.data->mutex);
 
-	desc = alloc_msi_entry(dev, init_desc->nvec_used, init_desc->affinity);
+	desc = msi_alloc_desc(dev, init_desc->nvec_used, init_desc->affinity);
 	if (!desc)
 		return -ENOMEM;
 
@@ -102,7 +101,7 @@ static int msi_add_simple_msi_descs(stru
 	lockdep_assert_held(&dev->msi.data->mutex);
 
 	for (i = 0; i < ndesc; i++) {
-		desc = alloc_msi_entry(dev, 1, NULL);
+		desc = msi_alloc_desc(dev, 1, NULL);
 		if (!desc)
 			goto fail;
 		desc->msi_index = index + i;
@@ -114,7 +113,7 @@ static int msi_add_simple_msi_descs(stru
 fail:
 	list_for_each_entry_safe(desc, tmp, &list, list) {
 		list_del(&desc->list);
-		free_msi_entry(desc);
+		msi_free_desc(desc);
 	}
 	return -ENOMEM;
 }
@@ -141,7 +140,7 @@ void msi_free_msi_descs_range(struct dev
 		if (desc->msi_index < first_index || desc->msi_index > last_index)
 			continue;
 		list_del(&desc->list);
-		free_msi_entry(desc);
+		msi_free_desc(desc);
 	}
 }
 
@@ -762,7 +761,7 @@ int msi_domain_populate_irqs(struct irq_
 
 	msi_lock_descs(dev);
 	for (virq = virq_base; virq < virq_base + nvec; virq++) {
-		desc = alloc_msi_entry(dev, 1, NULL);
+		desc = msi_alloc_desc(dev, 1, NULL);
 		if (!desc) {
 			ret = -ENOMEM;
 			goto fail;


