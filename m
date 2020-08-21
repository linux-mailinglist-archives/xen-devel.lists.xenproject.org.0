Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD4524CA44
	for <lists+xen-devel@lfdr.de>; Fri, 21 Aug 2020 04:17:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8wcX-0002qp-1t; Fri, 21 Aug 2020 02:17:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z7lF=B7=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1k8wcV-0002Bb-5X
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2020 02:17:31 +0000
X-Inumbo-ID: 428452d8-4d24-4011-9203-76a10aae9adc
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 428452d8-4d24-4011-9203-76a10aae9adc;
 Fri, 21 Aug 2020 02:17:16 +0000 (UTC)
Message-Id: <20200821002948.285988229@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1597976235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=d5usA7gDCS+QKjQgidurX7gwz02tPHrPNFlTsx8P5CI=;
 b=RVJ7jdg6yqLy3EH2woulQ/AnGnunH5RkP7bQGtS5XdVI4K+27I8sW5KQ4bwKh7oxBPDPSq
 PUAD2IdzXQ1/gMpjYAGgnWRBlD1ug/Nr7V4kDQsNmxx72PzHQqt0VRrzXGsgMHEHo/aEqw
 +5fPifkdsVz8w6lRpGdG5PB9Fql0LO1o1vs8GcIV1+SDwG+UmYqCCRUcsk40XG7tyVb416
 TjQv0KlmwkyZO0egvzwn9A695hiD80Gh8xwRU56V/Fv+L0ugIMvBKuG/bfvsYr6kKvaGy0
 XSylhJX9fuJ9fV7CIc03ykAgm+YWeklO8G4yCLGBhLNRjd5a6/SJVV5GeynM3w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1597976235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=d5usA7gDCS+QKjQgidurX7gwz02tPHrPNFlTsx8P5CI=;
 b=N5lZvRWFmQopSinQmJpoCZ2W17bx8ilN26GTqyVqlLtYE8S2UtjUuGKTBPXITNNvSpH5Qz
 0bEjgomf8T1Os3BA==
Date: Fri, 21 Aug 2020 02:24:54 +0200
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 linux-pci@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 iommu@lists.linux-foundation.org, linux-hyperv@vger.kernel.org,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Jon Derrick <jonathan.derrick@intel.com>,
 Lu Baolu <baolu.lu@linux.intel.com>, Wei Liu <wei.liu@kernel.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Steve Wahl <steve.wahl@hpe.com>, Dimitri Sivanich <sivanich@hpe.com>,
 Russ Anderson <rja@hpe.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Jonathan Derrick <jonathan.derrick@intel.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Megha Dey <megha.dey@intel.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Dave Jiang <dave.jiang@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jacob Pan <jacob.jun.pan@intel.com>, Baolu Lu <baolu.lu@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Dan Williams <dan.j.williams@intel.com>
Subject: [patch RFC 30/38] PCI/MSI: Allow to disable arch fallbacks
References: <20200821002424.119492231@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline;
 filename="PCI-MSI--Allow-to-disable-arch-fallbacks.patch"
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

If an architecture does not require the MSI setup/teardown fallback
functions, then allow them to be replaced by stub functions which emit a
warning.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org
---
 drivers/pci/Kconfig |    3 +++
 drivers/pci/msi.c   |    3 ++-
 include/linux/msi.h |   31 ++++++++++++++++++++++++++-----
 3 files changed, 31 insertions(+), 6 deletions(-)

--- a/drivers/pci/Kconfig
+++ b/drivers/pci/Kconfig
@@ -56,6 +56,9 @@ config PCI_MSI_IRQ_DOMAIN
 	depends on PCI_MSI
 	select GENERIC_MSI_IRQ_DOMAIN
 
+config PCI_MSI_DISABLE_ARCH_FALLBACKS
+	bool
+
 config PCI_QUIRKS
 	default y
 	bool "Enable PCI quirk workarounds" if EXPERT
--- a/drivers/pci/msi.c
+++ b/drivers/pci/msi.c
@@ -58,8 +58,8 @@ static void pci_msi_teardown_msi_irqs(st
 #define pci_msi_teardown_msi_irqs	arch_teardown_msi_irqs
 #endif
 
+#ifndef CONFIG_PCI_MSI_DISABLE_ARCH_FALLBACKS
 /* Arch hooks */
-
 int __weak arch_setup_msi_irq(struct pci_dev *dev, struct msi_desc *desc)
 {
 	struct msi_controller *chip = dev->bus->msi;
@@ -132,6 +132,7 @@ void __weak arch_teardown_msi_irqs(struc
 {
 	return default_teardown_msi_irqs(dev);
 }
+#endif /* !CONFIG_PCI_MSI_DISABLE_ARCH_FALLBACKS */
 
 static void default_restore_msi_irq(struct pci_dev *dev, int irq)
 {
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -193,17 +193,38 @@ void pci_msi_mask_irq(struct irq_data *d
 void pci_msi_unmask_irq(struct irq_data *data);
 
 /*
- * The arch hooks to setup up msi irqs. Those functions are
- * implemented as weak symbols so that they /can/ be overriden by
- * architecture specific code if needed.
+ * The arch hooks to setup up msi irqs. Default functions are implemented
+ * as weak symbols so that they /can/ be overriden by architecture specific
+ * code if needed.
+ *
+ * They can be replaced by stubs with warnings via
+ * CONFIG_PCI_MSI_DISABLE_ARCH_FALLBACKS when the architecture fully
+ * utilizes direct irqdomain based setup.
  */
+#ifndef CONFIG_PCI_MSI_DISABLE_ARCH_FALLBACKS
 int arch_setup_msi_irq(struct pci_dev *dev, struct msi_desc *desc);
 void arch_teardown_msi_irq(unsigned int irq);
 int arch_setup_msi_irqs(struct pci_dev *dev, int nvec, int type);
 void arch_teardown_msi_irqs(struct pci_dev *dev);
-void arch_restore_msi_irqs(struct pci_dev *dev);
-
 void default_teardown_msi_irqs(struct pci_dev *dev);
+#else
+static inline int arch_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
+{
+	WARN_ON_ONCE(1);
+	return -ENODEV;
+}
+
+static inline void arch_teardown_msi_irqs(struct pci_dev *dev)
+{
+	WARN_ON_ONCE(1);
+}
+#endif
+
+/*
+ * The restore hooks are still available as they are useful even
+ * for fully irq domain based setups. Courtesy to XEN/X86.
+ */
+void arch_restore_msi_irqs(struct pci_dev *dev);
 void default_restore_msi_irqs(struct pci_dev *dev);
 
 struct msi_controller {


