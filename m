Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A15946AD4E
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 23:51:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240130.416595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMpH-0001p2-Md; Mon, 06 Dec 2021 22:51:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240130.416595; Mon, 06 Dec 2021 22:51:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMpH-0001l5-Eh; Mon, 06 Dec 2021 22:51:15 +0000
Received: by outflank-mailman (input) for mailman id 240130;
 Mon, 06 Dec 2021 22:51:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qlu=QX=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1muMpF-0008NM-MZ
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 22:51:13 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02ec089b-56e7-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 23:51:12 +0100 (CET)
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
X-Inumbo-ID: 02ec089b-56e7-11ec-a5e1-b9374ead2679
Message-ID: <20211206210747.928198636@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638831072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=lgiDOOjzWmT9ulLacAOoXHFBFpehQOVNbM8oPjh7uJI=;
	b=TdIBsdwXNmxGvZsdE8IynD3HOB8U7Wrb/UqdQ+GvNDOSd08I3MwwcxNPRPClJ01SkDLP1L
	4hK2i/TwZ5/TPke1DfKNP39c75ekhkt572Oy0eWKxoVGBuTpUERaxhkHQajcmMVwPs4F2j
	KgEry89MKRr9uKXqx6swFdFfRuqizECUYlM71NvXJ53kvbKlEKVqmRacB2t/laaDP4AAzl
	ZQ92fReSVYLZZZ3S6rHYp5BaiAKtOhbuTGaTD7bxy+pDrJLbMtyjzLkdC7x486yPoBcBKi
	SOAUZGPFM/i3WYqQAzx/+0sGwX1a5aavl5DOdgWeDRyNHHGNYq5kEfn/DblFLA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638831072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=lgiDOOjzWmT9ulLacAOoXHFBFpehQOVNbM8oPjh7uJI=;
	b=nPmjD1oaeFKvFHQ37D0qKxrMyp5wDKHJQxlK4+cduK178oaAZhecaFAxOfijNZSiQncBDU
	WRkLdzaLUJZa5pCw==
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
Subject: [patch V2 06/31] genirq/msi: Provide domain flags to allocate/free
 MSI descriptors automatically
References: <20211206210600.123171746@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  6 Dec 2021 23:51:12 +0100 (CET)

Provide domain info flags which tell the core to allocate simple
descriptors or to free descriptors when the interrupts are freed and
implement the required functionality.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 include/linux/msi.h |   17 +++++++++++++++++
 kernel/irq/msi.c    |   48 ++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 65 insertions(+)

--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -106,6 +106,8 @@ struct pci_msi_desc {
 	};
 };
 
+#define MSI_MAX_INDEX		((unsigned int)USHRT_MAX)
+
 /**
  * struct msi_desc - Descriptor structure for MSI based interrupts
  * @list:	List head for management
@@ -264,6 +266,17 @@ static inline void pci_write_msi_msg(uns
 #endif /* CONFIG_PCI_MSI */
 
 int msi_add_msi_desc(struct device *dev, struct msi_desc *init_desc);
+void msi_free_msi_descs_range(struct device *dev, enum msi_desc_filter filter,
+			      unsigned int first_index, unsigned int last_index);
+
+/**
+ * msi_free_msi_descs - Free MSI descriptors of a device
+ * @dev:	Device to free the descriptors
+ */
+static inline void msi_free_msi_descs(struct device *dev)
+{
+	msi_free_msi_descs_range(dev, MSI_DESC_ALL, 0, MSI_MAX_INDEX);
+}
 
 struct msi_desc *alloc_msi_entry(struct device *dev, int nvec,
 				 const struct irq_affinity_desc *affinity);
@@ -424,6 +437,10 @@ enum {
 	MSI_FLAG_DEV_SYSFS		= (1 << 7),
 	/* MSI-X entries must be contiguous */
 	MSI_FLAG_MSIX_CONTIGUOUS	= (1 << 8),
+	/* Allocate simple MSI descriptors */
+	MSI_FLAG_ALLOC_SIMPLE_MSI_DESCS	= (1 << 9),
+	/* Free MSI descriptors */
+	MSI_FLAG_FREE_MSI_DESCS		= (1 << 10),
 };
 
 int msi_domain_set_affinity(struct irq_data *data, const struct cpumask *mask,
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -120,6 +120,32 @@ static int msi_add_simple_msi_descs(stru
 }
 
 /**
+ * msi_free_msi_descs_range - Free MSI descriptors of a device
+ * @dev:		Device to free the descriptors
+ * @filter:		Descriptor state filter
+ * @first_index:	Index to start freeing from
+ * @last_index:		Last index to be freed
+ */
+void msi_free_msi_descs_range(struct device *dev, enum msi_desc_filter filter,
+			      unsigned int first_index, unsigned int last_index)
+{
+	struct msi_desc *desc;
+
+	lockdep_assert_held(&dev->msi.data->mutex);
+
+	msi_for_each_desc(desc, dev, filter) {
+		/*
+		 * Stupid for now to handle MSI device domain until the
+		 * storage is switched over to an xarray.
+		 */
+		if (desc->msi_index < first_index || desc->msi_index > last_index)
+			continue;
+		list_del(&desc->list);
+		free_msi_entry(desc);
+	}
+}
+
+/**
  * msi_device_has_property - Check whether a device has a specific MSI property
  * @dev:	Pointer to the device which is queried
  * @prop:	Property to check for
@@ -896,6 +922,16 @@ int __msi_domain_alloc_irqs(struct irq_d
 	return 0;
 }
 
+static int msi_domain_add_simple_msi_descs(struct msi_domain_info *info,
+					   struct device *dev,
+					   unsigned int num_descs)
+{
+	if (!(info->flags & MSI_FLAG_ALLOC_SIMPLE_MSI_DESCS))
+		return 0;
+
+	return msi_add_simple_msi_descs(dev, 0, num_descs);
+}
+
 /**
  * msi_domain_alloc_irqs_descs_locked - Allocate interrupts from a MSI interrupt domain
  * @domain:	The domain to allocate from
@@ -918,6 +954,10 @@ int msi_domain_alloc_irqs_descs_locked(s
 
 	lockdep_assert_held(&dev->msi.data->mutex);
 
+	ret = msi_domain_add_simple_msi_descs(info, dev, nvec);
+	if (ret)
+		return ret;
+
 	ret = ops->domain_alloc_irqs(domain, dev, nvec);
 	if (ret)
 		goto cleanup;
@@ -979,6 +1019,13 @@ void __msi_domain_free_irqs(struct irq_d
 	}
 }
 
+static void msi_domain_free_msi_descs(struct msi_domain_info *info,
+				      struct device *dev)
+{
+	if (info->flags & MSI_FLAG_FREE_MSI_DESCS)
+		msi_free_msi_descs(dev);
+}
+
 /**
  * msi_domain_free_irqs_descs_locked - Free interrupts from a MSI interrupt @domain associated to @dev
  * @domain:	The domain to managing the interrupts
@@ -999,6 +1046,7 @@ void msi_domain_free_irqs_descs_locked(s
 	if (info->flags & MSI_FLAG_DEV_SYSFS)
 		msi_device_destroy_sysfs(dev);
 	ops->domain_free_irqs(domain, dev);
+	msi_domain_free_msi_descs(info, dev);
 }
 
 /**


