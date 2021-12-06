Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 017B446AD11
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 23:48:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240048.416297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMm2-0001F4-32; Mon, 06 Dec 2021 22:47:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240048.416297; Mon, 06 Dec 2021 22:47:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMm1-0001BN-Sp; Mon, 06 Dec 2021 22:47:53 +0000
Received: by outflank-mailman (input) for mailman id 240048;
 Mon, 06 Dec 2021 22:47:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qlu=QX=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1muMdY-0004dp-Rl
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 22:39:08 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52ed6044-56e5-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 23:39:08 +0100 (CET)
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
X-Inumbo-ID: 52ed6044-56e5-11ec-a5e1-b9374ead2679
Message-ID: <20211206210438.038137622@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638830347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=SYbFcr5c7KUWSHju+5I0IZIliBz6/Q8qUXyaiieHdzI=;
	b=QvCNlsxjJjFZJgdde3bGSosu1Zdk5YzAknkSMOft0kqiy9khbJfX0meWwgcleEXmkDpA6Q
	pG/Gt8h3frgjkaLd3ivOghbKjLxFmVn7ZXBj/mBWPosAprC3e9ZHf2CQd0vU4uQ0IX2bE3
	DIcgOht4L7EcSFUc1y8KcKQOXCGCoLvR8+gBUOfdkCyyDoD2dk/RibJIph/TJLoLZ7f837
	ZaxpD6IoMjaAa3AZwL6mF/gFVnlia7coMdHC/mzGWQ3H+AQZsfBC4WUoKRYdhOXhOCt3so
	5Zuawua4YMWcs7mWRz8XfmGZQAu6rLWJuZkYFq9LaGCnoqpDI0WCTFWoz6TTeA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638830347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=SYbFcr5c7KUWSHju+5I0IZIliBz6/Q8qUXyaiieHdzI=;
	b=PCtebedJJL6H3PzvHb4O9yvA3iLADUQUECYtjroor4l+G6aeGCknrkbTtlePQLRiYJQoK7
	PSwmm0rD4obkidBw==
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
Subject:
 [patch V2 07/36] genirq/msi: Provide msi_device_populate/destroy_sysfs()
References: <20211206210307.625116253@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  6 Dec 2021 23:39:07 +0100 (CET)

Add new allocation functions which can be activated by domain info
flags. They store the groups pointer in struct msi_device_data.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 include/linux/msi.h |    4 ++++
 kernel/irq/msi.c    |   42 ++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 44 insertions(+), 2 deletions(-)

--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -56,6 +56,8 @@ struct irq_data;
 struct msi_desc;
 struct pci_dev;
 struct platform_msi_priv_data;
+struct attribute_group;
+
 void __get_cached_msi_msg(struct msi_desc *entry, struct msi_msg *msg);
 #ifdef CONFIG_GENERIC_MSI_IRQ
 void get_cached_msi_msg(unsigned int irq, struct msi_msg *msg);
@@ -174,9 +176,11 @@ struct msi_desc {
 /**
  * msi_device_data - MSI per device data
  * @properties:		MSI properties which are interesting to drivers
+ * @attrs:		Pointer to the sysfs attribute group
  */
 struct msi_device_data {
 	unsigned long			properties;
+	const struct attribute_group    **attrs;
 };
 
 int msi_setup_device_data(struct device *dev);
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -213,6 +213,20 @@ const struct attribute_group **msi_popul
 }
 
 /**
+ * msi_device_populate_sysfs - Populate msi_irqs sysfs entries for a device
+ * @dev:	The device (PCI, platform etc) which will get sysfs entries
+ */
+int msi_device_populate_sysfs(struct device *dev)
+{
+	const struct attribute_group **group = msi_populate_sysfs(dev);
+
+	if (IS_ERR(group))
+		return PTR_ERR(group);
+	dev->msi.data->attrs = group;
+	return 0;
+}
+
+/**
  * msi_destroy_sysfs - Destroy msi_irqs sysfs entries for devices
  * @dev:		The device(PCI, platform etc) who will remove sysfs entries
  * @msi_irq_groups:	attribute_group for device msi_irqs entries
@@ -238,6 +252,17 @@ void msi_destroy_sysfs(struct device *de
 		kfree(msi_irq_groups);
 	}
 }
+
+/**
+ * msi_device_destroy_sysfs - Destroy msi_irqs sysfs entries for a device
+ * @dev:		The device (PCI, platform etc) for which to remove
+ *			sysfs entries
+ */
+void msi_device_destroy_sysfs(struct device *dev)
+{
+	msi_destroy_sysfs(dev, dev->msi.data->attrs);
+	dev->msi.data->attrs = NULL;
+}
 #endif
 
 #ifdef CONFIG_GENERIC_MSI_IRQ_DOMAIN
@@ -685,8 +710,19 @@ int msi_domain_alloc_irqs(struct irq_dom
 {
 	struct msi_domain_info *info = domain->host_data;
 	struct msi_domain_ops *ops = info->ops;
+	int ret;
 
-	return ops->domain_alloc_irqs(domain, dev, nvec);
+	ret = ops->domain_alloc_irqs(domain, dev, nvec);
+	if (ret)
+		return ret;
+
+	if (!(info->flags & MSI_FLAG_DEV_SYSFS))
+		return 0;
+
+	ret = msi_device_populate_sysfs(dev);
+	if (ret)
+		msi_domain_free_irqs(domain, dev);
+	return ret;
 }
 
 void __msi_domain_free_irqs(struct irq_domain *domain, struct device *dev)
@@ -725,7 +761,9 @@ void msi_domain_free_irqs(struct irq_dom
 	struct msi_domain_info *info = domain->host_data;
 	struct msi_domain_ops *ops = info->ops;
 
-	return ops->domain_free_irqs(domain, dev);
+	if (info->flags & MSI_FLAG_DEV_SYSFS)
+		msi_device_destroy_sysfs(dev);
+	ops->domain_free_irqs(domain, dev);
 }
 
 /**


