Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D9224CACE
	for <lists+xen-devel@lfdr.de>; Fri, 21 Aug 2020 04:26:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8wlN-0005AV-Dh; Fri, 21 Aug 2020 02:26:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z7lF=B7=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1k8wde-0002BQ-0z
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2020 02:18:42 +0000
X-Inumbo-ID: cfc1d478-b59b-4e5d-8d0c-1f66146c0bde
Received: from galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cfc1d478-b59b-4e5d-8d0c-1f66146c0bde;
 Fri, 21 Aug 2020 02:17:24 +0000 (UTC)
Message-Id: <20200821002948.864315814@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1597976243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=t2NP7pVQXQ51g4UiBc17WkLPgfxzXUgtml1iOCs60Co=;
 b=hfuhL/7fph6qJyz7le4PFdDuEV6MgavC4eL9tY98pIvs0YVze1YpWy0KRD91j37VO5xh00
 tTfHk67g95+hQUTKU8KKSJA9eo2nfkCdUr6TNnpfLcGvt2wuEY9nmzSH6VO99xeXV0+A4+
 3UjDpnDV9ZJztKDU7K04c6z+Rh36p1B0DxMcS/s4gAC3meHhAazcpz19IpHsV1rKXTUXlh
 F48/seVKLFST8w9pwF9LxUe+fNZV2bhNMA1EJOOHcS0s4CTtWwFjNzrfnnkfJhn0NvlpGT
 seVvAX6gLDDs+OR8IS0+3pMgXtOebMT5uXucoYewe42TFsA9VJ16SSbZ+2wV0g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1597976243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=t2NP7pVQXQ51g4UiBc17WkLPgfxzXUgtml1iOCs60Co=;
 b=vm7OTzxc+ZgBvpRZzpZI8vCsQAhHhTud1cF5+49Ul2OutYT4sEg30INjxq8N+0un9/anLJ
 iwhMU1saq0+BRDAw==
Date: Fri, 21 Aug 2020 02:25:00 +0200
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Marc Zyngier <maz@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
 linux-hyperv@vger.kernel.org, Haiyang Zhang <haiyangz@microsoft.com>,
 Jon Derrick <jonathan.derrick@intel.com>,
 Lu Baolu <baolu.lu@linux.intel.com>, Wei Liu <wei.liu@kernel.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Steve Wahl <steve.wahl@hpe.com>, Dimitri Sivanich <sivanich@hpe.com>,
 Russ Anderson <rja@hpe.com>, linux-pci@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Jonathan Derrick <jonathan.derrick@intel.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Megha Dey <megha.dey@intel.com>, Jason Gunthorpe <jgg@mellanox.com>,
 Dave Jiang <dave.jiang@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jacob Pan <jacob.jun.pan@intel.com>, Baolu Lu <baolu.lu@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Dan Williams <dan.j.williams@intel.com>
Subject: [patch RFC 36/38] platform-msi: Add device MSI infrastructure
References: <20200821002424.119492231@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline;
 filename="platform-msi--Add-device-MSI-infrastructure.patch"
Content-transfer-encoding: 8-bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Add device specific MSI domain infrastructure for devices which have their
own resource management and interrupt chip. These devices are not related
to PCI and contrary to platform MSI they do not share a common resource and
interrupt chip. They provide their own domain specific resource management
and interrupt chip.

This utilizes the new alloc/free override in a non evil way which avoids
having yet another set of specialized alloc/free functions. Just using
msi_domain_alloc/free_irqs() is sufficient

While initially it was suggested and tried to piggyback device MSI on
platform MSI, the better variant is to reimplement platform MSI on top of
device MSI.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
---
 drivers/base/platform-msi.c |  129 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/irqdomain.h   |    1 
 include/linux/msi.h         |   24 ++++++++
 kernel/irq/Kconfig          |    4 +
 4 files changed, 158 insertions(+)

--- a/drivers/base/platform-msi.c
+++ b/drivers/base/platform-msi.c
@@ -412,3 +412,132 @@ int platform_msi_domain_alloc(struct irq
 
 	return err;
 }
+
+#ifdef CONFIG_DEVICE_MSI
+/*
+ * Device specific MSI domain infrastructure for devices which have their
+ * own resource management and interrupt chip. These devices are not
+ * related to PCI and contrary to platform MSI they do not share a common
+ * resource and interrupt chip. They provide their own domain specific
+ * resource management and interrupt chip.
+ */
+
+static void device_msi_free_msi_entries(struct device *dev)
+{
+	struct list_head *msi_list = dev_to_msi_list(dev);
+	struct msi_desc *entry, *tmp;
+
+	list_for_each_entry_safe(entry, tmp, msi_list, list) {
+		list_del(&entry->list);
+		free_msi_entry(entry);
+	}
+}
+
+/**
+ * device_msi_free_irqs - Free MSI interrupts assigned to  a device
+ * @dev:	Pointer to the device
+ *
+ * Frees the interrupt and the MSI descriptors.
+ */
+static void device_msi_free_irqs(struct irq_domain *domain, struct device *dev)
+{
+	__msi_domain_free_irqs(domain, dev);
+	device_msi_free_msi_entries(dev);
+}
+
+/**
+ * device_msi_alloc_irqs - Allocate MSI interrupts for a device
+ * @dev:	Pointer to the device
+ * @nvec:	Number of vectors
+ *
+ * Allocates the required number of MSI descriptors and the corresponding
+ * interrupt descriptors.
+ */
+static int device_msi_alloc_irqs(struct irq_domain *domain, struct device *dev, int nvec)
+{
+	int i, ret = -ENOMEM;
+
+	for (i = 0; i < nvec; i++) {
+		struct msi_desc *entry = alloc_msi_entry(dev, 1, NULL);
+
+		if (!entry)
+			goto fail;
+		list_add_tail(&entry->list, dev_to_msi_list(dev));
+	}
+
+	ret = __msi_domain_alloc_irqs(domain, dev, nvec);
+	if (!ret)
+		return 0;
+fail:
+	device_msi_free_msi_entries(dev);
+	return ret;
+}
+
+static void device_msi_update_dom_ops(struct msi_domain_info *info)
+{
+	if (!info->ops->domain_alloc_irqs)
+		info->ops->domain_alloc_irqs = device_msi_alloc_irqs;
+	if (!info->ops->domain_free_irqs)
+		info->ops->domain_free_irqs = device_msi_free_irqs;
+	if (!info->ops->msi_prepare)
+		info->ops->msi_prepare = arch_msi_prepare;
+}
+
+/**
+ * device_msi_create_msi_irq_domain - Create an irq domain for devices
+ * @fwnode:	Firmware node of the interrupt controller
+ * @info:	MSI domain info to configure the new domain
+ * @parent:	Parent domain
+ */
+struct irq_domain *device_msi_create_irq_domain(struct fwnode_handle *fn,
+						struct msi_domain_info *info,
+						struct irq_domain *parent)
+{
+	struct irq_domain *domain;
+
+	if (info->flags & MSI_FLAG_USE_DEF_CHIP_OPS)
+		platform_msi_update_chip_ops(info);
+
+	if (info->flags & MSI_FLAG_USE_DEF_DOM_OPS)
+		device_msi_update_dom_ops(info);
+
+	domain = msi_create_irq_domain(fn, info, parent);
+	if (domain)
+		irq_domain_update_bus_token(domain, DOMAIN_BUS_DEVICE_MSI);
+	return domain;
+}
+
+#ifdef CONFIG_PCI
+#include <linux/pci.h>
+
+/**
+ * pci_subdevice_msi_create_irq_domain - Create an irq domain for subdevices
+ * @pdev:	Pointer to PCI device for which the subdevice domain is created
+ * @info:	MSI domain info to configure the new domain
+ */
+struct irq_domain *pci_subdevice_msi_create_irq_domain(struct pci_dev *pdev,
+						       struct msi_domain_info *info)
+{
+	struct irq_domain *domain, *pdev_msi;
+	struct fwnode_handle *fn;
+
+	/*
+	 * Retrieve the parent domain of the underlying PCI device's MSI
+	 * domain. This is going to be the parent of the new subdevice
+	 * domain as well.
+	 */
+	pdev_msi = dev_get_msi_domain(&pdev->dev);
+	if (!pdev_msi)
+		return NULL;
+
+	fn = irq_domain_alloc_named_fwnode(dev_name(&pdev->dev));
+	if (!fn)
+		return NULL;
+	domain = device_msi_create_irq_domain(fn, info, pdev_msi->parent);
+	if (!domain)
+		irq_domain_free_fwnode(fn);
+	return domain;
+}
+EXPORT_SYMBOL_GPL(pci_subdevice_msi_create_irq_domain);
+#endif /* CONFIG_PCI */
+#endif /* CONFIG_DEVICE_MSI */
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -85,6 +85,7 @@ enum irq_domain_bus_token {
 	DOMAIN_BUS_TI_SCI_INTA_MSI,
 	DOMAIN_BUS_WAKEUP,
 	DOMAIN_BUS_VMD_MSI,
+	DOMAIN_BUS_DEVICE_MSI,
 };
 
 /**
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -56,6 +56,18 @@ struct ti_sci_inta_msi_desc {
 };
 
 /**
+ * device_msi_desc - Device MSI specific MSI descriptor data
+ * @priv:		Pointer to device specific private data
+ * @priv_iomem:		Pointer to device specific private io memory
+ * @hwirq:		The hardware irq number in the device domain
+ */
+struct device_msi_desc {
+	void		*priv;
+	void __iomem	*priv_iomem;
+	u16		hwirq;
+};
+
+/**
  * struct msi_desc - Descriptor structure for MSI based interrupts
  * @list:	List head for management
  * @irq:	The base interrupt number
@@ -127,6 +139,7 @@ struct msi_desc {
 		struct platform_msi_desc platform;
 		struct fsl_mc_msi_desc fsl_mc;
 		struct ti_sci_inta_msi_desc inta;
+		struct device_msi_desc device_msi;
 	};
 };
 
@@ -412,6 +425,17 @@ void platform_msi_domain_free(struct irq
 void *platform_msi_get_host_data(struct irq_domain *domain);
 #endif /* CONFIG_GENERIC_MSI_IRQ_DOMAIN */
 
+#ifdef CONFIG_DEVICE_MSI
+struct irq_domain *device_msi_create_irq_domain(struct fwnode_handle *fn,
+						struct msi_domain_info *info,
+						struct irq_domain *parent);
+
+# ifdef CONFIG_PCI
+struct irq_domain *pci_subdevice_msi_create_irq_domain(struct pci_dev *pdev,
+						       struct msi_domain_info *info);
+# endif
+#endif /* CONFIG_DEVICE_MSI */
+
 #ifdef CONFIG_PCI_MSI_IRQ_DOMAIN
 void pci_msi_domain_write_msg(struct irq_data *irq_data, struct msi_msg *msg);
 struct irq_domain *pci_msi_create_irq_domain(struct fwnode_handle *fwnode,
--- a/kernel/irq/Kconfig
+++ b/kernel/irq/Kconfig
@@ -93,6 +93,10 @@ config GENERIC_MSI_IRQ_DOMAIN
 	select IRQ_DOMAIN_HIERARCHY
 	select GENERIC_MSI_IRQ
 
+config DEVICE_MSI
+	bool
+	select GENERIC_MSI_IRQ_DOMAIN
+
 config IRQ_MSI_IOMMU
 	bool
 


