Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B1D45FA11
	for <lists+xen-devel@lfdr.de>; Sat, 27 Nov 2021 02:27:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233668.405706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqmUm-0006i2-6K; Sat, 27 Nov 2021 01:27:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233668.405706; Sat, 27 Nov 2021 01:27:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqmUl-0006Ua-Df; Sat, 27 Nov 2021 01:27:15 +0000
Received: by outflank-mailman (input) for mailman id 233668;
 Sat, 27 Nov 2021 01:27:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Erow=QO=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mqmMt-00020H-Vk
 for xen-devel@lists.xenproject.org; Sat, 27 Nov 2021 01:19:07 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01874d72-4f20-11ec-9787-a32c541c8605;
 Sat, 27 Nov 2021 02:19:02 +0100 (CET)
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
X-Inumbo-ID: 01874d72-4f20-11ec-9787-a32c541c8605
Message-ID: <20211126223825.093887718@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1637975941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=Fm5t3j//2ZJWIAwQC/lUTYq1h7igaXJ6yKKmISA8BnE=;
	b=YXrvDdjinCV1yBjHyHLHh4kbucu2LHURHR+t0zVJv5Iwe67q0LFuruaQh3vkwbzQtPwio7
	pprtMrfRvledbc2Kp38dfn11v4y5Inu453zNnn62UbDXbEMDnzTVB2lG+F7/o751ne62V0
	wuLwIsQnEtadtEUUBTR+POd7nVjDpAaMG5nsqWghfqGryom7R0YB/K06iimvmxsJ5KiFpB
	JPV3B+r8CqqTRE3oo30uaAVzGJqzMsu2Bz/vPrVyNZToyYv3yqNeZE81QSacrNZkpZTNFS
	XGAAgWOht7wVhoHHI0patyvWHbhFxyJn+zFlcFj6JBZ8L2lsCdtihTsPXR9eTg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1637975941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=Fm5t3j//2ZJWIAwQC/lUTYq1h7igaXJ6yKKmISA8BnE=;
	b=RvZm8oUXbruNEue8m0QI5IgMFXDCNY3ru8yRX0pyG3paqWiHR2a2l+sKosxSZ9wf0ryS/Q
	OiKV6WwXAMjbYnDg==
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
 Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linuxppc-dev@lists.ozlabs.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 sparclinux@vger.kernel.org,
 x86@kernel.org,
 xen-devel@lists.xenproject.org,
 ath11k@lists.infradead.org,
 Wei Liu <wei.liu@kernel.org>,
 linux-hyperv@vger.kernel.org,
 Juergen Gross <jgross@suse.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>
Subject: [patch 17/22] PCI/MSI: Split out !IRQDOMAIN code
References: <20211126222700.862407977@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Sat, 27 Nov 2021 02:19:01 +0100 (CET)

Split out the non irqdomain code into its own file.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/pci/msi/Makefile |    5 ++--
 drivers/pci/msi/legacy.c |   51 +++++++++++++++++++++++++++++++++++++++++++++++
 drivers/pci/msi/msi.c    |   46 ------------------------------------------
 3 files changed, 54 insertions(+), 48 deletions(-)

--- a/drivers/pci/msi/Makefile
+++ b/drivers/pci/msi/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 # Makefile for the PCI/MSI
-obj-$(CONFIG_PCI)		+= pcidev_msi.o
-obj-$(CONFIG_PCI_MSI)		+= msi.o
+obj-$(CONFIG_PCI)			+= pcidev_msi.o
+obj-$(CONFIG_PCI_MSI)			+= msi.o
+obj-$(CONFIG_PCI_MSI_ARCH_FALLBACKS)	+= legacy.o
--- /dev/null
+++ b/drivers/pci/msi/legacy.c
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PCI Message Signaled Interrupt (MSI).
+ *
+ * Legacy architecture specific setup and teardown mechanism.
+ */
+#include "msi.h"
+
+/* Arch hooks */
+int __weak arch_setup_msi_irq(struct pci_dev *dev, struct msi_desc *desc)
+{
+	return -EINVAL;
+}
+
+void __weak arch_teardown_msi_irq(unsigned int irq)
+{
+}
+
+int __weak arch_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
+{
+	struct msi_desc *desc;
+	int ret;
+
+	/*
+	 * If an architecture wants to support multiple MSI, it needs to
+	 * override arch_setup_msi_irqs()
+	 */
+	if (type == PCI_CAP_ID_MSI && nvec > 1)
+		return 1;
+
+	for_each_pci_msi_entry(desc, dev) {
+		ret = arch_setup_msi_irq(dev, desc);
+		if (ret)
+			return ret < 0 ? ret : -ENOSPC;
+	}
+
+	return 0;
+}
+
+void __weak arch_teardown_msi_irqs(struct pci_dev *dev)
+{
+	struct msi_desc *desc;
+	int i;
+
+	for_each_pci_msi_entry(desc, dev) {
+		if (desc->irq) {
+			for (i = 0; i < entry->nvec_used; i++)
+				arch_teardown_msi_irq(desc->irq + i);
+		}
+	}
+}
--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -50,52 +50,6 @@ static void pci_msi_teardown_msi_irqs(st
 #define pci_msi_teardown_msi_irqs	arch_teardown_msi_irqs
 #endif
 
-#ifdef CONFIG_PCI_MSI_ARCH_FALLBACKS
-/* Arch hooks */
-int __weak arch_setup_msi_irq(struct pci_dev *dev, struct msi_desc *desc)
-{
-	return -EINVAL;
-}
-
-void __weak arch_teardown_msi_irq(unsigned int irq)
-{
-}
-
-int __weak arch_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
-{
-	struct msi_desc *entry;
-	int ret;
-
-	/*
-	 * If an architecture wants to support multiple MSI, it needs to
-	 * override arch_setup_msi_irqs()
-	 */
-	if (type == PCI_CAP_ID_MSI && nvec > 1)
-		return 1;
-
-	for_each_pci_msi_entry(entry, dev) {
-		ret = arch_setup_msi_irq(dev, entry);
-		if (ret < 0)
-			return ret;
-		if (ret > 0)
-			return -ENOSPC;
-	}
-
-	return 0;
-}
-
-void __weak arch_teardown_msi_irqs(struct pci_dev *dev)
-{
-	int i;
-	struct msi_desc *entry;
-
-	for_each_pci_msi_entry(entry, dev)
-		if (entry->irq)
-			for (i = 0; i < entry->nvec_used; i++)
-				arch_teardown_msi_irq(entry->irq + i);
-}
-#endif /* CONFIG_PCI_MSI_ARCH_FALLBACKS */
-
 /*
  * PCI 2.3 does not specify mask bits for each MSI interrupt.  Attempting to
  * mask all MSI interrupts by clearing the MSI enable bit does not work


