Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 748C446AE23
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 00:01:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240314.416826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMzH-00007y-Rm; Mon, 06 Dec 2021 23:01:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240314.416826; Mon, 06 Dec 2021 23:01:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMzH-0008Vo-Nb; Mon, 06 Dec 2021 23:01:35 +0000
Received: by outflank-mailman (input) for mailman id 240314;
 Mon, 06 Dec 2021 23:01:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qlu=QX=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1muMpu-0008NM-VZ
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 22:51:55 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ada4390-56e7-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 23:51:53 +0100 (CET)
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
X-Inumbo-ID: 1ada4390-56e7-11ec-a5e1-b9374ead2679
Message-ID: <20211206210749.280627070@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638831112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=MQ7ozWUaiArEmhCoyQn/2rQh7u+RDFLg8h0eBaFBoeM=;
	b=FqX6BU6Xy15N6yO4LSxbc3iOP7XCf2RIJ2CRdfOu6uS0PHmqzfPdLWPEtIbIzLJcixi2NL
	B1lgJmc6cvhd9FQ8awdw4jeTSZ6C34mhtT8In1y7VekoI41jhl48NcUi1TIy4EZ01CjmW7
	/1xCbfIrZkKNBO7t6p/9tuIktb1OGL2N98wb7wzAO8KZZ6KcpV0AwPEYGJ5JoFJFG8cLVB
	eRqZWLWZcMz5fUfvC8GY8XmeHMkfl8NiUixocbVsn3c4HtgCMNMifkHePz7eJd4RPYtClB
	Fj5G3pfg8dF7fC7W6XR5gQRSqOJlnrORs2e9qEDjLDcSlZH2jFJvf0n85A5EZA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638831112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=MQ7ozWUaiArEmhCoyQn/2rQh7u+RDFLg8h0eBaFBoeM=;
	b=l0xw52VdcKzS/pAv9jpd5Zux7erpTrz+FD2gAE/Rd/29hrVoaqt4Eqxop605j/5U68rrAw
	xmr2FK8Kqr8ewsCA==
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
Subject: [patch V2 31/31] genirq/msi: Convert storage to xarray
References: <20211206210600.123171746@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  6 Dec 2021 23:51:52 +0100 (CET)

The current linked list storage for MSI descriptors is suboptimal in
several ways:

  1) Looking up a MSI desciptor requires a O(n) list walk in the worst case

  2) The upcoming support of runtime expansion of MSI-X vectors would need
     to do a full list walk to figure out whether a particular index is
     already associated.

  3) Runtime expansion of sparse allocations is even more complex as the
     current implementation assumes an ordered list (increasing MSI index).

Use an xarray which solves all of the above problems nicely.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 include/linux/msi.h |   13 +---
 kernel/irq/msi.c    |  169 +++++++++++++++++++++++-----------------------------
 2 files changed, 83 insertions(+), 99 deletions(-)

--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -17,6 +17,7 @@
  */
 
 #include <linux/cpumask.h>
+#include <linux/xarray.h>
 #include <linux/mutex.h>
 #include <linux/list.h>
 #include <linux/bits.h>
@@ -124,7 +125,6 @@ struct pci_msi_desc {
 
 /**
  * struct msi_desc - Descriptor structure for MSI based interrupts
- * @list:	List head for management
  * @irq:	The base interrupt number
  * @nvec_used:	The number of vectors used
  * @dev:	Pointer to the device which uses this descriptor
@@ -141,7 +141,6 @@ struct pci_msi_desc {
  */
 struct msi_desc {
 	/* Shared device/bus type independent data */
-	struct list_head		list;
 	unsigned int			irq;
 	unsigned int			nvec_used;
 	struct device			*dev;
@@ -177,16 +176,16 @@ enum msi_desc_filter {
  * msi_device_data - MSI per device data
  * @properties:		MSI properties which are interesting to drivers
  * @platform_data:	Platform-MSI specific data
- * @list:		List of MSI descriptors associated to the device
- * @mutex:		Mutex protecting the MSI list
- * @__next:		Cached pointer to the next entry for iterators
+ * @mutex:		Mutex protecting the MSI descriptor store
+ * @__store:		Xarray for storing MSI descriptor pointers
+ * @__iter_idx:		Index to search the next entry for iterators
  */
 struct msi_device_data {
 	unsigned long			properties;
 	struct platform_msi_priv_data	*platform_data;
-	struct list_head		list;
 	struct mutex			mutex;
-	struct msi_desc			*__next;
+	struct xarray			__store;
+	unsigned long			__iter_idx;
 };
 
 int msi_setup_device_data(struct device *dev);
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -20,7 +20,6 @@
 #include "internals.h"
 
 static inline int msi_sysfs_create_group(struct device *dev);
-#define dev_to_msi_list(dev)	(&(dev)->msi.data->list)
 
 /**
  * msi_alloc_desc - Allocate an initialized msi_desc
@@ -41,7 +40,6 @@ static struct msi_desc *msi_alloc_desc(s
 	if (!desc)
 		return NULL;
 
-	INIT_LIST_HEAD(&desc->list);
 	desc->dev = dev;
 	desc->nvec_used = nvec;
 	if (affinity) {
@@ -60,6 +58,17 @@ static void msi_free_desc(struct msi_des
 	kfree(desc);
 }
 
+static int msi_insert_desc(struct msi_device_data *md, struct msi_desc *desc, unsigned int index)
+{
+	int ret;
+
+	desc->msi_index = index;
+	ret = xa_insert(&md->__store, index, desc, GFP_KERNEL);
+	if (ret)
+		msi_free_desc(desc);
+	return ret;
+}
+
 /**
  * msi_add_msi_desc - Allocate and initialize a MSI descriptor
  * @dev:	Pointer to the device for which the descriptor is allocated
@@ -77,12 +86,9 @@ int msi_add_msi_desc(struct device *dev,
 	if (!desc)
 		return -ENOMEM;
 
-	/* Copy the MSI index and type specific data to the new descriptor. */
-	desc->msi_index = init_desc->msi_index;
+	/* Copy type specific data to the new descriptor. */
 	desc->pci = init_desc->pci;
-
-	list_add_tail(&desc->list, &dev->msi.data->list);
-	return 0;
+	return msi_insert_desc(dev->msi.data, desc, init_desc->msi_index);
 }
 
 /**
@@ -95,28 +101,41 @@ int msi_add_msi_desc(struct device *dev,
  */
 static int msi_add_simple_msi_descs(struct device *dev, unsigned int index, unsigned int ndesc)
 {
-	struct msi_desc *desc, *tmp;
-	LIST_HEAD(list);
-	unsigned int i;
+	unsigned int idx, last = index + ndesc - 1;
+	struct msi_desc *desc;
+	int ret;
 
 	lockdep_assert_held(&dev->msi.data->mutex);
 
-	for (i = 0; i < ndesc; i++) {
+	for (idx = index; idx <= last; idx++) {
 		desc = msi_alloc_desc(dev, 1, NULL);
 		if (!desc)
+			goto fail_mem;
+		ret = msi_insert_desc(dev->msi.data, desc, idx);
+		if (ret)
 			goto fail;
-		desc->msi_index = index + i;
-		list_add_tail(&desc->list, &list);
 	}
-	list_splice_tail(&list, &dev->msi.data->list);
 	return 0;
 
+fail_mem:
+	ret = -ENOMEM;
 fail:
-	list_for_each_entry_safe(desc, tmp, &list, list) {
-		list_del(&desc->list);
-		msi_free_desc(desc);
+	msi_free_msi_descs_range(dev, MSI_DESC_NOTASSOCIATED, index, last);
+	return ret;
+}
+
+static bool msi_desc_match(struct msi_desc *desc, enum msi_desc_filter filter)
+{
+	switch (filter) {
+	case MSI_DESC_ALL:
+		return true;
+	case MSI_DESC_NOTASSOCIATED:
+		return !desc->irq;
+	case MSI_DESC_ASSOCIATED:
+		return !!desc->irq;
 	}
-	return -ENOMEM;
+	WARN_ON_ONCE(1);
+	return false;
 }
 
 /**
@@ -141,19 +160,17 @@ void msi_device_set_properties(struct de
 void msi_free_msi_descs_range(struct device *dev, enum msi_desc_filter filter,
 			      unsigned int first_index, unsigned int last_index)
 {
+	struct xarray *xa = &dev->msi.data->__store;
 	struct msi_desc *desc;
+	unsigned long idx;
 
 	lockdep_assert_held(&dev->msi.data->mutex);
 
-	msi_for_each_desc(desc, dev, filter) {
-		/*
-		 * Stupid for now to handle MSI device domain until the
-		 * storage is switched over to an xarray.
-		 */
-		if (desc->msi_index < first_index || desc->msi_index > last_index)
-			continue;
-		list_del(&desc->list);
-		msi_free_desc(desc);
+	xa_for_each_range(xa, idx, desc, first_index, last_index) {
+		if (msi_desc_match(desc, filter)) {
+			xa_erase(xa, idx);
+			msi_free_desc(desc);
+		}
 	}
 }
 
@@ -186,7 +203,8 @@ static void msi_device_data_release(stru
 {
 	struct msi_device_data *md = res;
 
-	WARN_ON_ONCE(!list_empty(&md->list));
+	WARN_ON_ONCE(!xa_empty(&md->__store));
+	xa_destroy(&md->__store);
 	dev->msi.data = NULL;
 }
 
@@ -218,7 +236,7 @@ int msi_setup_device_data(struct device
 		return ret;
 	}
 
-	INIT_LIST_HEAD(&md->list);
+	xa_init(&md->__store);
 	mutex_init(&md->mutex);
 	dev->msi.data = md;
 	devres_add(dev, md);
@@ -245,34 +263,21 @@ void msi_unlock_descs(struct device *dev
 {
 	if (WARN_ON_ONCE(!dev->msi.data))
 		return;
-	/* Clear the next pointer which was cached by the iterator */
-	dev->msi.data->__next = NULL;
+	/* Invalidate the index wich was cached by the iterator */
+	dev->msi.data->__iter_idx = MSI_MAX_INDEX;
 	mutex_unlock(&dev->msi.data->mutex);
 }
 EXPORT_SYMBOL_GPL(msi_unlock_descs);
 
-static bool msi_desc_match(struct msi_desc *desc, enum msi_desc_filter filter)
-{
-	switch (filter) {
-	case MSI_DESC_ALL:
-		return true;
-	case MSI_DESC_NOTASSOCIATED:
-		return !desc->irq;
-	case MSI_DESC_ASSOCIATED:
-		return !!desc->irq;
-	}
-	WARN_ON_ONCE(1);
-	return false;
-}
-
-static struct msi_desc *msi_find_first_desc(struct device *dev, enum msi_desc_filter filter)
+static struct msi_desc *msi_find_desc(struct msi_device_data *md, enum msi_desc_filter filter)
 {
 	struct msi_desc *desc;
 
-	list_for_each_entry(desc, dev_to_msi_list(dev), list) {
+	xa_for_each_start(&md->__store, md->__iter_idx, desc, md->__iter_idx) {
 		if (msi_desc_match(desc, filter))
 			return desc;
 	}
+	md->__iter_idx = MSI_MAX_INDEX;
 	return NULL;
 }
 
@@ -289,37 +294,24 @@ static struct msi_desc *msi_find_first_d
  */
 struct msi_desc *msi_first_desc(struct device *dev, enum msi_desc_filter filter)
 {
-	struct msi_desc *desc;
+	struct msi_device_data *md = dev->msi.data;
 
-	if (WARN_ON_ONCE(!dev->msi.data))
+	if (WARN_ON_ONCE(!md))
 		return NULL;
 
-	lockdep_assert_held(&dev->msi.data->mutex);
+	lockdep_assert_held(&md->mutex);
 
-	desc = msi_find_first_desc(dev, filter);
-	dev->msi.data->__next = desc ? list_next_entry(desc, list) : NULL;
-	return desc;
+	md->__iter_idx = 0;
+	return msi_find_desc(md, filter);
 }
 EXPORT_SYMBOL_GPL(msi_first_desc);
 
-static struct msi_desc *__msi_next_desc(struct device *dev, enum msi_desc_filter filter,
-					struct msi_desc *from)
-{
-	struct msi_desc *desc = from;
-
-	list_for_each_entry_from(desc, dev_to_msi_list(dev), list) {
-		if (msi_desc_match(desc, filter))
-			return desc;
-	}
-	return NULL;
-}
-
 /**
  * msi_next_desc - Get the next MSI descriptor of a device
  * @dev:	Device to operate on
  *
  * The first invocation of msi_next_desc() has to be preceeded by a
- * successful incovation of __msi_first_desc(). Consecutive invocations are
+ * successful invocation of __msi_first_desc(). Consecutive invocations are
  * only valid if the previous one was successful. All these operations have
  * to be done within the same MSI mutex held region.
  *
@@ -328,20 +320,18 @@ static struct msi_desc *__msi_next_desc(
  */
 struct msi_desc *msi_next_desc(struct device *dev, enum msi_desc_filter filter)
 {
-	struct msi_device_data *data = dev->msi.data;
-	struct msi_desc *desc;
+	struct msi_device_data *md = dev->msi.data;
 
-	if (WARN_ON_ONCE(!data))
+	if (WARN_ON_ONCE(!md))
 		return NULL;
 
-	lockdep_assert_held(&data->mutex);
+	lockdep_assert_held(&md->mutex);
 
-	if (!data->__next)
+	if (md->__iter_idx >= (unsigned long)MSI_MAX_INDEX)
 		return NULL;
 
-	desc = __msi_next_desc(dev, filter, data->__next);
-	dev->msi.data->__next = desc ? list_next_entry(desc, list) : NULL;
-	return desc;
+	md->__iter_idx++;
+	return msi_find_desc(md, filter);
 }
 EXPORT_SYMBOL_GPL(msi_next_desc);
 
@@ -364,21 +354,18 @@ unsigned int msi_get_virq(struct device
 	pcimsi = msi_device_has_property(dev, MSI_PROP_PCI_MSI);
 
 	msi_lock_descs(dev);
-	msi_for_each_desc(desc, dev, MSI_DESC_ASSOCIATED) {
-		/* PCI-MSI has only one descriptor for multiple interrupts. */
-		if (pcimsi) {
-			if (index < desc->nvec_used)
-				ret = desc->irq + index;
-			break;
-		}
-
+	desc = xa_load(&dev->msi.data->__store, pcimsi ? 0 : index);
+	if (desc && desc->irq) {
 		/*
+		 * PCI-MSI has only one descriptor for multiple interrupts.
 		 * PCI-MSIX and platform MSI use a descriptor per
 		 * interrupt.
 		 */
-		if (desc->msi_index == index) {
+		if (pcimsi) {
+			if (index < desc->nvec_used)
+				ret = desc->irq + index;
+		} else {
 			ret = desc->irq;
-			break;
 		}
 	}
 	msi_unlock_descs(dev);
@@ -759,16 +746,13 @@ int msi_domain_populate_irqs(struct irq_
 	int ret, virq;
 
 	msi_lock_descs(dev);
-	for (virq = virq_base; virq < virq_base + nvec; virq++) {
-		desc = msi_alloc_desc(dev, 1, NULL);
-		if (!desc) {
-			ret = -ENOMEM;
-			goto fail;
-		}
+	ret = msi_add_simple_msi_descs(dev, virq_base, nvec);
+	if (ret)
+		goto unlock;
 
-		desc->msi_index = virq;
+	for (virq = virq_base; virq < virq_base + nvec; virq++) {
+		desc = xa_load(&dev->msi.data->__store, virq);
 		desc->irq = virq;
-		list_add_tail(&desc->list, &dev->msi.data->list);
 
 		ops->set_desc(arg, desc);
 		ret = irq_domain_alloc_irqs_hierarchy(domain, virq, 1, arg);
@@ -784,6 +768,7 @@ int msi_domain_populate_irqs(struct irq_
 	for (--virq; virq >= virq_base; virq--)
 		irq_domain_free_irqs_common(domain, virq, 1);
 	msi_free_msi_descs_range(dev, MSI_DESC_ALL, virq_base, virq_base + nvec - 1);
+unlock:
 	msi_unlock_descs(dev);
 	return ret;
 }


