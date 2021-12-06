Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C527846AD49
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 23:51:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240128.416572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMpE-00018p-Mq; Mon, 06 Dec 2021 22:51:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240128.416572; Mon, 06 Dec 2021 22:51:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMpE-00015o-HA; Mon, 06 Dec 2021 22:51:12 +0000
Received: by outflank-mailman (input) for mailman id 240128;
 Mon, 06 Dec 2021 22:51:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qlu=QX=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1muMpC-0000Tb-CR
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 22:51:10 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00fb6e63-56e7-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 23:51:09 +0100 (CET)
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
X-Inumbo-ID: 00fb6e63-56e7-11ec-8a4d-196798b21f7b
Message-ID: <20211206210747.818635078@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638831069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=UjZZfvKoc2kPhNBVngaTWsrbW8D3zdRcer4hfxKTjzc=;
	b=rS/EO8twB21iAAUVFAIpH4nGQPEdNtwYlw6G9MjkYhHuxtKNmbK5ZMJX9TRttcLwrXj7z1
	gFEEBwAvXwGUVxq990vVhV7201ZUV1+2BC2R072OqkPznC2WyQVV0xgDlo38VOw7MfpLKm
	Oz2XNssURig/w/DV52O8Lcsd7JbIGQQss/zKlbMePJ3ICfY2gjYXlaeRrh2dTOvZL/UqSQ
	KZ4RDgRcQDGoIuJ8VQpufBpK+eeaPdHAUgmyMkmHOuZU/yDj1/rl9QvTrw+vTipYPCZp3J
	QmAkei2UAmR7iJSCHTcjv3zfu0x2l2brukh3G3nUpOrYg+0ErvUAJEIdjErJYA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638831069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=UjZZfvKoc2kPhNBVngaTWsrbW8D3zdRcer4hfxKTjzc=;
	b=wArRHQ+4In2wjoh0ByMPAoexjt0dXwgKpf3J9EL8KthNeOwtDUqYFIdIZPG+AfcP91w7v6
	kNNdIG6InADKKFBQ==
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
Subject: [patch V2 04/31] genirq/msi: Provide a set of advanced MSI accessors
 and iterators
References: <20211206210600.123171746@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  6 Dec 2021 23:51:08 +0100 (CET)

In preparation for dynamic handling of MSI-X interrupts provide a new set
of MSI descriptor accessor functions and iterators. They are benefitial per
se as they allow to cleanup quite some code in various MSI domain
implementations.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 include/linux/msi.h |   33 +++++++++++++++++
 kernel/irq/msi.c    |   96 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 129 insertions(+)

--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -141,6 +141,18 @@ struct msi_desc {
 	struct pci_msi_desc		pci;
 };
 
+/*
+ * Filter values for the MSI descriptor iterators and accessor functions.
+ */
+enum msi_desc_filter {
+	/* All descriptors */
+	MSI_DESC_ALL,
+	/* Descriptors which have no interrupt associated */
+	MSI_DESC_NOTASSOCIATED,
+	/* Descriptors which have an interrupt associated */
+	MSI_DESC_ASSOCIATED,
+};
+
 /**
  * msi_device_data - MSI per device data
  * @properties:		MSI properties which are interesting to drivers
@@ -148,6 +160,7 @@ struct msi_desc {
  * @platform_data:	Platform-MSI specific data
  * @list:		List of MSI descriptors associated to the device
  * @mutex:		Mutex protecting the MSI list
+ * @__next:		Cached pointer to the next entry for iterators
  */
 struct msi_device_data {
 	unsigned long			properties;
@@ -155,6 +168,7 @@ struct msi_device_data {
 	struct platform_msi_priv_data	*platform_data;
 	struct list_head		list;
 	struct mutex			mutex;
+	struct msi_desc			*__next;
 };
 
 int msi_setup_device_data(struct device *dev);
@@ -177,6 +191,25 @@ unsigned int msi_get_virq(struct device
 void msi_lock_descs(struct device *dev);
 void msi_unlock_descs(struct device *dev);
 
+struct msi_desc *msi_first_desc(struct device *dev, enum msi_desc_filter filter);
+struct msi_desc *msi_next_desc(struct device *dev, enum msi_desc_filter filter);
+
+/**
+ * msi_for_each_desc - Iterate the MSI descriptors
+ *
+ * @desc:	struct msi_desc pointer used as iterator
+ * @dev:	struct device pointer - device to iterate
+ * @filter:	Filter for descriptor selection
+ *
+ * Notes:
+ *  - The loop must be protected with a msi_lock_descs()/msi_unlock_descs()
+ *    pair.
+ *  - It is safe to remove a retrieved MSI descriptor in the loop.
+ */
+#define msi_for_each_desc(desc, dev, filter)			\
+	for ((desc) = msi_first_desc((dev), (filter)); (desc);	\
+	     (desc) = msi_next_desc((dev), (filter)))
+
 /* Helpers to hide struct msi_desc implementation details */
 #define msi_desc_to_dev(desc)		((desc)->dev)
 #define dev_to_msi_list(dev)		(&(dev)->msi.data->list)
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -142,10 +142,106 @@ void msi_unlock_descs(struct device *dev
 {
 	if (WARN_ON_ONCE(!dev->msi.data))
 		return;
+	/* Clear the next pointer which was cached by the iterator */
+	dev->msi.data->__next = NULL;
 	mutex_unlock(&dev->msi.data->mutex);
 }
 EXPORT_SYMBOL_GPL(msi_unlock_descs);
 
+static bool msi_desc_match(struct msi_desc *desc, enum msi_desc_filter filter)
+{
+	switch (filter) {
+	case MSI_DESC_ALL:
+		return true;
+	case MSI_DESC_NOTASSOCIATED:
+		return !desc->irq;
+	case MSI_DESC_ASSOCIATED:
+		return !!desc->irq;
+	}
+	WARN_ON_ONCE(1);
+	return false;
+}
+
+static struct msi_desc *msi_find_first_desc(struct device *dev, enum msi_desc_filter filter)
+{
+	struct msi_desc *desc;
+
+	list_for_each_entry(desc, dev_to_msi_list(dev), list) {
+		if (msi_desc_match(desc, filter))
+			return desc;
+	}
+	return NULL;
+}
+
+/**
+ * msi_first_desc - Get the first MSI descriptor of a device
+ * @dev:	Device to operate on
+ * @filter:	Descriptor state filter
+ *
+ * Must be called with the MSI descriptor mutex held, i.e. msi_lock_descs()
+ * must be invoked before the call.
+ *
+ * Return: Pointer to the first MSI descriptor matching the search
+ *	   criteria, NULL if none found.
+ */
+struct msi_desc *msi_first_desc(struct device *dev, enum msi_desc_filter filter)
+{
+	struct msi_desc *desc;
+
+	if (WARN_ON_ONCE(!dev->msi.data))
+		return NULL;
+
+	lockdep_assert_held(&dev->msi.data->mutex);
+
+	desc = msi_find_first_desc(dev, filter);
+	dev->msi.data->__next = desc ? list_next_entry(desc, list) : NULL;
+	return desc;
+}
+EXPORT_SYMBOL_GPL(msi_first_desc);
+
+static struct msi_desc *__msi_next_desc(struct device *dev, enum msi_desc_filter filter,
+					struct msi_desc *from)
+{
+	struct msi_desc *desc = from;
+
+	list_for_each_entry_from(desc, dev_to_msi_list(dev), list) {
+		if (msi_desc_match(desc, filter))
+			return desc;
+	}
+	return NULL;
+}
+
+/**
+ * msi_next_desc - Get the next MSI descriptor of a device
+ * @dev:	Device to operate on
+ *
+ * The first invocation of msi_next_desc() has to be preceeded by a
+ * successful incovation of __msi_first_desc(). Consecutive invocations are
+ * only valid if the previous one was successful. All these operations have
+ * to be done within the same MSI mutex held region.
+ *
+ * Return: Pointer to the next MSI descriptor matching the search
+ *	   criteria, NULL if none found.
+ */
+struct msi_desc *msi_next_desc(struct device *dev, enum msi_desc_filter filter)
+{
+	struct msi_device_data *data = dev->msi.data;
+	struct msi_desc *desc;
+
+	if (WARN_ON_ONCE(!data))
+		return NULL;
+
+	lockdep_assert_held(&data->mutex);
+
+	if (!data->__next)
+		return NULL;
+
+	desc = __msi_next_desc(dev, filter, data->__next);
+	dev->msi.data->__next = desc ? list_next_entry(desc, list) : NULL;
+	return desc;
+}
+EXPORT_SYMBOL_GPL(msi_next_desc);
+
 /**
  * msi_get_virq - Return Linux interrupt number of a MSI interrupt
  * @dev:	Device to operate on


