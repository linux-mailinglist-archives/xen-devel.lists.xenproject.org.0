Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3588E46AD25
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 23:48:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240081.416487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMmk-0002hv-Bq; Mon, 06 Dec 2021 22:48:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240081.416487; Mon, 06 Dec 2021 22:48:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMmj-0002Tv-OV; Mon, 06 Dec 2021 22:48:37 +0000
Received: by outflank-mailman (input) for mailman id 240081;
 Mon, 06 Dec 2021 22:48:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qlu=QX=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1muMdQ-0004dp-VY
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 22:39:01 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e2cee9c-56e5-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 23:39:00 +0100 (CET)
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
X-Inumbo-ID: 4e2cee9c-56e5-11ec-a5e1-b9374ead2679
Message-ID: <20211206210437.765721147@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638830339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=wQM5iW4MNKpcdi9dGdVnTMQsdSGeyjM7jnIl18Q8ELs=;
	b=UyCbp6UB8oXaLK1RpwkVXT8ignzJqMLX47UjA1Lfes7KwgNfg+vBG3hpQHtS74w8ELPXbk
	UyeG8hxvDJ/f3+AO1t6UYwxv7Gk8O9yOdwJxGJQ40toKRBw9TxEHDC74wwYusmv3hTWiKk
	+ujOkTtZ8uGb3kPPG0DTmedqN3fESHCcPH4wpvA3aKYfsQg5CLAwsVegGAdUaEYmESj6vU
	zmIsPANomUZIbG/iQ6Y+WwFH4rLBiw/xSgGwr2LxrXv8//HUMRa9boqvEycJPLlf2LA5b0
	VCWJY24GkXX+llVlrAawTWrsWXyg0E4JiKWcuoJPPGzv0k7ho/YmbLbNsn+v+w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638830339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=wQM5iW4MNKpcdi9dGdVnTMQsdSGeyjM7jnIl18Q8ELs=;
	b=SgwMm+AAzv73GwvSCy8dOHq2xqGDdfd7jI4bHt9FqnigZ/sIF5cc2ZL7LhattCMhARnVVz
	zt1FZBKmhbpsoqCw==
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
 Will Deacon <will@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 iommu@lists.linux-foundation.org,
 dmaengine@vger.kernel.org,
 Stuart Yoder <stuyoder@gmail.com>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Nishanth Menon <nm@ti.com>,
 Tero Kristo <kristo@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Vinod Koul <vkoul@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Sinan Kaya <okaya@kernel.org>
Subject: [patch V2 02/36] device: Add device::msi_data pointer and struct
 msi_device_data
References: <20211206210307.625116253@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  6 Dec 2021 23:38:59 +0100 (CET)

Create struct msi_device_data and add a pointer of that type to struct
dev_msi_info, which is part of struct device. Provide an allocator function
which can be invoked from the MSI interrupt allocation code pathes.

Add a properties field to the data structure as a first member so the
allocation size is not zero bytes. The field will be uses later on.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 include/linux/device.h |    5 +++++
 include/linux/msi.h    |   18 ++++++++++++++++++
 kernel/irq/msi.c       |   32 ++++++++++++++++++++++++++++++++
 3 files changed, 55 insertions(+)

--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -45,6 +45,7 @@ struct iommu_ops;
 struct iommu_group;
 struct dev_pin_info;
 struct dev_iommu;
+struct msi_device_data;
 
 /**
  * struct subsys_interface - interfaces to device functions
@@ -374,11 +375,15 @@ struct dev_links_info {
 /**
  * struct dev_msi_info - Device data related to MSI
  * @domain:	The MSI interrupt domain associated to the device
+ * @data:	Pointer to MSI device data
  */
 struct dev_msi_info {
 #ifdef CONFIG_GENERIC_MSI_IRQ_DOMAIN
 	struct irq_domain	*domain;
 #endif
+#ifdef CONFIG_GENERIC_MSI_IRQ
+	struct msi_device_data	*data;
+#endif
 };
 
 /**
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -171,6 +171,16 @@ struct msi_desc {
 	};
 };
 
+/**
+ * msi_device_data - MSI per device data
+ * @properties:		MSI properties which are interesting to drivers
+ */
+struct msi_device_data {
+	unsigned long			properties;
+};
+
+int msi_setup_device_data(struct device *dev);
+
 /* Helpers to hide struct msi_desc implementation details */
 #define msi_desc_to_dev(desc)		((desc)->dev)
 #define dev_to_msi_list(dev)		(&(dev)->msi_list)
@@ -233,10 +243,16 @@ void pci_msi_mask_irq(struct irq_data *d
 void pci_msi_unmask_irq(struct irq_data *data);
 
 #ifdef CONFIG_SYSFS
+int msi_device_populate_sysfs(struct device *dev);
+void msi_device_destroy_sysfs(struct device *dev);
+
 const struct attribute_group **msi_populate_sysfs(struct device *dev);
 void msi_destroy_sysfs(struct device *dev,
 		       const struct attribute_group **msi_irq_groups);
 #else
+static inline int msi_device_populate_sysfs(struct device *dev) { return 0; }
+static inline void msi_device_destroy_sysfs(struct device *dev) { }
+
 static inline const struct attribute_group **msi_populate_sysfs(struct device *dev)
 {
 	return NULL;
@@ -384,6 +400,8 @@ enum {
 	MSI_FLAG_MUST_REACTIVATE	= (1 << 5),
 	/* Is level-triggered capable, using two messages */
 	MSI_FLAG_LEVEL_CAPABLE		= (1 << 6),
+	/* Populate sysfs on alloc() and destroy it on free() */
+	MSI_FLAG_DEV_SYSFS		= (1 << 7),
 };
 
 int msi_domain_set_affinity(struct irq_data *data, const struct cpumask *mask,
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -73,6 +73,38 @@ void get_cached_msi_msg(unsigned int irq
 }
 EXPORT_SYMBOL_GPL(get_cached_msi_msg);
 
+static void msi_device_data_release(struct device *dev, void *res)
+{
+	WARN_ON_ONCE(!list_empty(&dev->msi_list));
+	dev->msi.data = NULL;
+}
+
+/**
+ * msi_setup_device_data - Setup MSI device data
+ * @dev:	Device for which MSI device data should be set up
+ *
+ * Return: 0 on success, appropriate error code otherwise
+ *
+ * This can be called more than once for @dev. If the MSI device data is
+ * already allocated the call succeeds. The allocated memory is
+ * automatically released when the device is destroyed.
+ */
+int msi_setup_device_data(struct device *dev)
+{
+	struct msi_device_data *md;
+
+	if (dev->msi.data)
+		return 0;
+
+	md = devres_alloc(msi_device_data_release, sizeof(*md), GFP_KERNEL);
+	if (!md)
+		return -ENOMEM;
+
+	dev->msi.data = md;
+	devres_add(dev, md);
+	return 0;
+}
+
 #ifdef CONFIG_SYSFS
 static ssize_t msi_mode_show(struct device *dev, struct device_attribute *attr,
 			     char *buf)


