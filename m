Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 303DA470D27
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 23:19:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.244358.422710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvoEE-0007O5-4h; Fri, 10 Dec 2021 22:18:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 244358.422710; Fri, 10 Dec 2021 22:18:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvoED-0007Ji-Rc; Fri, 10 Dec 2021 22:18:57 +0000
Received: by outflank-mailman (input) for mailman id 244358;
 Fri, 10 Dec 2021 22:18:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nm8/=Q3=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mvoEB-0005LR-SC
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 22:18:56 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2980cb44-5a07-11ec-ad7a-b7ef48004f0a;
 Fri, 10 Dec 2021 23:18:55 +0100 (CET)
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
X-Inumbo-ID: 2980cb44-5a07-11ec-ad7a-b7ef48004f0a
Message-ID: <20211210221813.617178827@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1639174734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=c/XqPp4te0pGFEO121hhae+RVpBGIyhacVujKOuJMfc=;
	b=c9kLrkEE4SZLzTdO73+YczGJvawG4Gf3p3TUiTiMwo54SU/QEOeY2nx7mZLN9uN6JdMrva
	rjs/bftb9qpy6W5cncJBSTQQzH57vMtE2RJs/pOQte/5cAgqpv801V+Tk5+ZKjxDBWSPka
	aU966ak4VZQfVbIHcgDfWLfkiY5iiJno0fGYqzsPNazKyDctL82sOMpo79N6Hsn4CZByDM
	EC8LIrUHzK2NzKTpO7du4uU4vQTrEuwaK3AAC5Acp1jCxge80UiPnPbkSGjXnORjX63pGO
	DJMHiZOr3/B6zDq6uxlq0XYpf6ESjVsWEEvFs1wQ6cty7jHTVWuos4fJy1e1Qg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1639174734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=c/XqPp4te0pGFEO121hhae+RVpBGIyhacVujKOuJMfc=;
	b=r0mvGgHyMEnHD4S+QN87CZIaHBk1HZRFCOJ4fgFQslfgfSFuxSwl3fgnaESHLdEse+PmeN
	wm9h29SwPoz5xODg==
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org,
 Arnd Bergmann <arnd@arndb.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linuxppc-dev@lists.ozlabs.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 Stuart Yoder <stuyoder@gmail.com>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Nishanth Menon <nm@ti.com>,
 Tero Kristo <kristo@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Vinod Koul <vkoul@kernel.org>,
 dmaengine@vger.kernel.org,
 Mark Rutland <mark.rutland@arm.com>,
 Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>,
 iommu@lists.linux-foundation.org,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Sinan Kaya <okaya@kernel.org>
Subject: [patch V3 07/35] device: Move MSI related data into a struct
References: <20211210221642.869015045@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Dec 2021 23:18:54 +0100 (CET)

From: Thomas Gleixner <tglx@linutronix.de>

The only unconditional part of MSI data in struct device is the irqdomain
pointer. Everything else can be allocated on demand. Create a data
structure and move the irqdomain pointer into it. The other MSI specific
parts are going to be removed from struct device in later steps.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

---
 drivers/base/platform-msi.c                 |   12 ++++++------
 drivers/dma/ti/k3-udma.c                    |    4 ++--
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |    2 +-
 drivers/irqchip/irq-mvebu-icu.c             |    6 +++---
 drivers/soc/ti/k3-ringacc.c                 |    4 ++--
 drivers/soc/ti/ti_sci_inta_msi.c            |    2 +-
 include/linux/device.h                      |   20 ++++++++++++++------
 7 files changed, 29 insertions(+), 21 deletions(-)

--- a/drivers/base/platform-msi.c
+++ b/drivers/base/platform-msi.c
@@ -210,10 +210,10 @@ platform_msi_alloc_priv_data(struct devi
 	 * accordingly (which would impact the max number of MSI
 	 * capable devices).
 	 */
-	if (!dev->msi_domain || !write_msi_msg || !nvec || nvec > MAX_DEV_MSIS)
+	if (!dev->msi.domain || !write_msi_msg || !nvec || nvec > MAX_DEV_MSIS)
 		return ERR_PTR(-EINVAL);
 
-	if (dev->msi_domain->bus_token != DOMAIN_BUS_PLATFORM_MSI) {
+	if (dev->msi.domain->bus_token != DOMAIN_BUS_PLATFORM_MSI) {
 		dev_err(dev, "Incompatible msi_domain, giving up\n");
 		return ERR_PTR(-EINVAL);
 	}
@@ -269,7 +269,7 @@ int platform_msi_domain_alloc_irqs(struc
 	if (err)
 		goto out_free_priv_data;
 
-	err = msi_domain_alloc_irqs(dev->msi_domain, dev, nvec);
+	err = msi_domain_alloc_irqs(dev->msi.domain, dev, nvec);
 	if (err)
 		goto out_free_desc;
 
@@ -282,7 +282,7 @@ int platform_msi_domain_alloc_irqs(struc
 	return 0;
 
 out_free_irqs:
-	msi_domain_free_irqs(dev->msi_domain, dev);
+	msi_domain_free_irqs(dev->msi.domain, dev);
 out_free_desc:
 	platform_msi_free_descs(dev, 0, nvec);
 out_free_priv_data:
@@ -306,7 +306,7 @@ void platform_msi_domain_free_irqs(struc
 		platform_msi_free_priv_data(desc->platform.msi_priv_data);
 	}
 
-	msi_domain_free_irqs(dev->msi_domain, dev);
+	msi_domain_free_irqs(dev->msi.domain, dev);
 	platform_msi_free_descs(dev, 0, MAX_DEV_MSIS);
 }
 EXPORT_SYMBOL_GPL(platform_msi_domain_free_irqs);
@@ -354,7 +354,7 @@ struct irq_domain *
 		return NULL;
 
 	data->host_data = host_data;
-	domain = irq_domain_create_hierarchy(dev->msi_domain, 0,
+	domain = irq_domain_create_hierarchy(dev->msi.domain, 0,
 					     is_tree ? 0 : nvec,
 					     dev->fwnode, ops, data);
 	if (!domain)
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -5279,9 +5279,9 @@ static int udma_probe(struct platform_de
 	if (IS_ERR(ud->ringacc))
 		return PTR_ERR(ud->ringacc);
 
-	dev->msi_domain = of_msi_get_domain(dev, dev->of_node,
+	dev->msi.domain = of_msi_get_domain(dev, dev->of_node,
 					    DOMAIN_BUS_TI_SCI_INTA_MSI);
-	if (!dev->msi_domain) {
+	if (!dev->msi.domain) {
 		dev_err(dev, "Failed to get MSI domain\n");
 		return -EPROBE_DEFER;
 	}
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -3170,7 +3170,7 @@ static void arm_smmu_setup_msis(struct a
 	if (!(smmu->features & ARM_SMMU_FEAT_MSI))
 		return;
 
-	if (!dev->msi_domain) {
+	if (!dev->msi.domain) {
 		dev_info(smmu->dev, "msi_domain absent - falling back to wired irqs\n");
 		return;
 	}
--- a/drivers/irqchip/irq-mvebu-icu.c
+++ b/drivers/irqchip/irq-mvebu-icu.c
@@ -314,12 +314,12 @@ static int mvebu_icu_subset_probe(struct
 		msi_data->subset_data = of_device_get_match_data(dev);
 	}
 
-	dev->msi_domain = of_msi_get_domain(dev, dev->of_node,
+	dev->msi.domain = of_msi_get_domain(dev, dev->of_node,
 					    DOMAIN_BUS_PLATFORM_MSI);
-	if (!dev->msi_domain)
+	if (!dev->msi.domain)
 		return -EPROBE_DEFER;
 
-	msi_parent_dn = irq_domain_get_of_node(dev->msi_domain);
+	msi_parent_dn = irq_domain_get_of_node(dev->msi.domain);
 	if (!msi_parent_dn)
 		return -ENODEV;
 
--- a/drivers/soc/ti/k3-ringacc.c
+++ b/drivers/soc/ti/k3-ringacc.c
@@ -1356,9 +1356,9 @@ static int k3_ringacc_init(struct platfo
 	struct resource *res;
 	int ret, i;
 
-	dev->msi_domain = of_msi_get_domain(dev, dev->of_node,
+	dev->msi.domain = of_msi_get_domain(dev, dev->of_node,
 					    DOMAIN_BUS_TI_SCI_INTA_MSI);
-	if (!dev->msi_domain) {
+	if (!dev->msi.domain) {
 		dev_err(dev, "Failed to get MSI domain\n");
 		return -EPROBE_DEFER;
 	}
--- a/drivers/soc/ti/ti_sci_inta_msi.c
+++ b/drivers/soc/ti/ti_sci_inta_msi.c
@@ -140,7 +140,7 @@ EXPORT_SYMBOL_GPL(ti_sci_inta_msi_domain
 
 void ti_sci_inta_msi_domain_free_irqs(struct device *dev)
 {
-	msi_domain_free_irqs(dev->msi_domain, dev);
+	msi_domain_free_irqs(dev->msi.domain, dev);
 	ti_sci_inta_msi_free_descs(dev);
 }
 EXPORT_SYMBOL_GPL(ti_sci_inta_msi_domain_free_irqs);
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -372,6 +372,16 @@ struct dev_links_info {
 };
 
 /**
+ * struct dev_msi_info - Device data related to MSI
+ * @domain:	The MSI interrupt domain associated to the device
+ */
+struct dev_msi_info {
+#ifdef CONFIG_GENERIC_MSI_IRQ_DOMAIN
+	struct irq_domain	*domain;
+#endif
+};
+
+/**
  * struct device - The basic device structure
  * @parent:	The device's "parent" device, the device to which it is attached.
  * 		In most cases, a parent device is some sort of bus or host
@@ -407,8 +417,8 @@ struct dev_links_info {
  * @em_pd:	device's energy model performance domain
  * @pins:	For device pin management.
  *		See Documentation/driver-api/pin-control.rst for details.
+ * @msi:	MSI related data
  * @msi_list:	Hosts MSI descriptors
- * @msi_domain: The generic MSI domain this device is using.
  * @numa_node:	NUMA node this device is close to.
  * @dma_ops:    DMA mapping operations for this device.
  * @dma_mask:	Dma mask (if dma'ble device).
@@ -500,12 +510,10 @@ struct device {
 	struct em_perf_domain	*em_pd;
 #endif
 
-#ifdef CONFIG_GENERIC_MSI_IRQ_DOMAIN
-	struct irq_domain	*msi_domain;
-#endif
 #ifdef CONFIG_PINCTRL
 	struct dev_pin_info	*pins;
 #endif
+	struct dev_msi_info	msi;
 #ifdef CONFIG_GENERIC_MSI_IRQ
 	struct list_head	msi_list;
 #endif
@@ -666,7 +674,7 @@ static inline void set_dev_node(struct d
 static inline struct irq_domain *dev_get_msi_domain(const struct device *dev)
 {
 #ifdef CONFIG_GENERIC_MSI_IRQ_DOMAIN
-	return dev->msi_domain;
+	return dev->msi.domain;
 #else
 	return NULL;
 #endif
@@ -675,7 +683,7 @@ static inline struct irq_domain *dev_get
 static inline void dev_set_msi_domain(struct device *dev, struct irq_domain *d)
 {
 #ifdef CONFIG_GENERIC_MSI_IRQ_DOMAIN
-	dev->msi_domain = d;
+	dev->msi.domain = d;
 #endif
 }
 


