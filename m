Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F11E470D33
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 23:19:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.244370.422783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvoET-0002KB-Jk; Fri, 10 Dec 2021 22:19:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 244370.422783; Fri, 10 Dec 2021 22:19:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvoET-00028Q-0L; Fri, 10 Dec 2021 22:19:13 +0000
Received: by outflank-mailman (input) for mailman id 244370;
 Fri, 10 Dec 2021 22:19:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nm8/=Q3=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mvoEP-0005LK-PR
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 22:19:09 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31cfb521-5a07-11ec-a74f-db008197e53d;
 Fri, 10 Dec 2021 23:19:09 +0100 (CET)
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
X-Inumbo-ID: 31cfb521-5a07-11ec-a74f-db008197e53d
Message-ID: <20211210221814.168362229@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1639174748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=4+eiQosnG7JBR1uN0KlyRVrLtcLvBVvbMU+2SFmyB+o=;
	b=NSzn6eemNJ0eDNqaqfj0J4J5JGz7K56XnV9MyWe+zf1xqWyQujeFifj1x8v1csqVsCT35t
	QLOBO4/H7MoxkENiZW8/nmowd1Ubo+DfNDjfKXhl2o5H7ToEraGOyHrOB7FSOS+TO5BgjI
	biGY2JzKjzM5QxI7ropVsxtR2M+ZThlJOVZeCGTANbL7LC+fDH/Rtit9AAEpwdrpXdRGHR
	Blu5YEQSuMGWdbfsyAdjgnIWrgZEw9bO0+JWoNyUXqpHlcu5oisXl1DmuSUkUxyIqM/4ph
	QKgY3AFIQW1W1o9UcVgJRHzuXgUs4HLehTHcLW+ol5AfhGFocJkGtZD94o1FWw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1639174748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=4+eiQosnG7JBR1uN0KlyRVrLtcLvBVvbMU+2SFmyB+o=;
	b=TTtSvTMz55N3aey6UgmLwPcn+vLffGKKd6RnWhYE43JcPUh8gDb277w95Yidb3WOxXOzkX
	6CrbbZQt5BdYqYDA==
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
Subject: [patch V3 16/35] genirq/msi: Remove the original sysfs interfaces
References: <20211210221642.869015045@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Dec 2021 23:19:08 +0100 (CET)

From: Thomas Gleixner <tglx@linutronix.de>

No more users. Refactor the core code accordingly and move the global
interface under CONFIG_PCI_MSI_ARCH_FALLBACKS.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 include/linux/msi.h |   29 +++++++---------------------
 kernel/irq/msi.c    |   53 +++++++++++++++++++---------------------------------
 2 files changed, 28 insertions(+), 54 deletions(-)

--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -246,26 +246,6 @@ void __pci_write_msi_msg(struct msi_desc
 void pci_msi_mask_irq(struct irq_data *data);
 void pci_msi_unmask_irq(struct irq_data *data);
 
-#ifdef CONFIG_SYSFS
-int msi_device_populate_sysfs(struct device *dev);
-void msi_device_destroy_sysfs(struct device *dev);
-
-const struct attribute_group **msi_populate_sysfs(struct device *dev);
-void msi_destroy_sysfs(struct device *dev,
-		       const struct attribute_group **msi_irq_groups);
-#else
-static inline int msi_device_populate_sysfs(struct device *dev) { return 0; }
-static inline void msi_device_destroy_sysfs(struct device *dev) { }
-
-static inline const struct attribute_group **msi_populate_sysfs(struct device *dev)
-{
-	return NULL;
-}
-static inline void msi_destroy_sysfs(struct device *dev, const struct attribute_group **msi_irq_groups)
-{
-}
-#endif
-
 /*
  * The arch hooks to setup up msi irqs. Default functions are implemented
  * as weak symbols so that they /can/ be overriden by architecture specific
@@ -279,7 +259,14 @@ int arch_setup_msi_irq(struct pci_dev *d
 void arch_teardown_msi_irq(unsigned int irq);
 int arch_setup_msi_irqs(struct pci_dev *dev, int nvec, int type);
 void arch_teardown_msi_irqs(struct pci_dev *dev);
-#endif
+#ifdef CONFIG_SYSFS
+int msi_device_populate_sysfs(struct device *dev);
+void msi_device_destroy_sysfs(struct device *dev);
+#else /* CONFIG_SYSFS */
+static inline int msi_device_populate_sysfs(struct device *dev) { return 0; }
+static inline void msi_device_destroy_sysfs(struct device *dev) { }
+#endif /* !CONFIG_SYSFS */
+#endif /* CONFIG_PCI_MSI_ARCH_FALLBACKS */
 
 /*
  * The restore hook is still available even for fully irq domain based
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -118,12 +118,8 @@ static ssize_t msi_mode_show(struct devi
 /**
  * msi_populate_sysfs - Populate msi_irqs sysfs entries for devices
  * @dev:	The device(PCI, platform etc) who will get sysfs entries
- *
- * Return attribute_group ** so that specific bus MSI can save it to
- * somewhere during initilizing msi irqs. If devices has no MSI irq,
- * return NULL; if it fails to populate sysfs, return ERR_PTR
  */
-const struct attribute_group **msi_populate_sysfs(struct device *dev)
+static const struct attribute_group **msi_populate_sysfs(struct device *dev)
 {
 	const struct attribute_group **msi_irq_groups;
 	struct attribute **msi_attrs, *msi_attr;
@@ -214,41 +210,32 @@ int msi_device_populate_sysfs(struct dev
 }
 
 /**
- * msi_destroy_sysfs - Destroy msi_irqs sysfs entries for devices
- * @dev:		The device(PCI, platform etc) who will remove sysfs entries
- * @msi_irq_groups:	attribute_group for device msi_irqs entries
- */
-void msi_destroy_sysfs(struct device *dev, const struct attribute_group **msi_irq_groups)
-{
-	struct device_attribute *dev_attr;
-	struct attribute **msi_attrs;
-	int count = 0;
-
-	if (msi_irq_groups) {
-		sysfs_remove_groups(&dev->kobj, msi_irq_groups);
-		msi_attrs = msi_irq_groups[0]->attrs;
-		while (msi_attrs[count]) {
-			dev_attr = container_of(msi_attrs[count],
-					struct device_attribute, attr);
-			kfree(dev_attr->attr.name);
-			kfree(dev_attr);
-			++count;
-		}
-		kfree(msi_attrs);
-		kfree(msi_irq_groups[0]);
-		kfree(msi_irq_groups);
-	}
-}
-
-/**
  * msi_device_destroy_sysfs - Destroy msi_irqs sysfs entries for a device
  * @dev:		The device (PCI, platform etc) for which to remove
  *			sysfs entries
  */
 void msi_device_destroy_sysfs(struct device *dev)
 {
-	msi_destroy_sysfs(dev, dev->msi.data->attrs);
+	const struct attribute_group **msi_irq_groups = dev->msi.data->attrs;
+	struct device_attribute *dev_attr;
+	struct attribute **msi_attrs;
+	int count = 0;
+
 	dev->msi.data->attrs = NULL;
+	if (!msi_irq_groups)
+		return;
+
+	sysfs_remove_groups(&dev->kobj, msi_irq_groups);
+	msi_attrs = msi_irq_groups[0]->attrs;
+	while (msi_attrs[count]) {
+		dev_attr = container_of(msi_attrs[count], struct device_attribute, attr);
+		kfree(dev_attr->attr.name);
+		kfree(dev_attr);
+		++count;
+	}
+	kfree(msi_attrs);
+	kfree(msi_irq_groups[0]);
+	kfree(msi_irq_groups);
 }
 #endif
 


