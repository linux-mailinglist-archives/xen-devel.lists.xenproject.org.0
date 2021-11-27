Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB4545F7EA
	for <lists+xen-devel@lfdr.de>; Sat, 27 Nov 2021 02:19:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233593.405399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqmMk-0005fm-E5; Sat, 27 Nov 2021 01:18:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233593.405399; Sat, 27 Nov 2021 01:18:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqmMj-0005Tn-Et; Sat, 27 Nov 2021 01:18:57 +0000
Received: by outflank-mailman (input) for mailman id 233593;
 Sat, 27 Nov 2021 01:18:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Erow=QO=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mqmMg-0002cc-3K
 for xen-devel@lists.xenproject.org; Sat, 27 Nov 2021 01:18:54 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fbc47146-4f1f-11ec-b941-1df2895da90e;
 Sat, 27 Nov 2021 02:18:52 +0100 (CET)
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
X-Inumbo-ID: fbc47146-4f1f-11ec-b941-1df2895da90e
Message-ID: <20211126223824.737214551@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1637975932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=aZOv1txgfOaOUbPFrZO+dbMPb9SLUMuv6lc2RMuyFjg=;
	b=nxj8kvRG0udwnyf6qeanYo6Y4W8sZG5eqxablsikiqcCTA7VdivSUMTsYQKJzLxw6OH8wK
	URC4Potp5y1ag0slj7KxMuRCI+jgKS8c+FDtIXu+GjNrGKyWdq8mzVdDAtQeYZAPF8QeJp
	mEC2VvlU+WC1dQQyvctPXd9CKM/Bper6bdkyneDsU7gSI4Syz1McOMndl4JO4LO314Hzl9
	xZjk7yCqKwmQqLZS7YQRflq9kqQj/mgdAtXrFAh2sIRdgapxhlCo1uAjoVZ1WQcMdpXITj
	jEf/N1becZCL3GaG7EAAq2c+wY32vqs051c+pgYRG4wAeO0HTTX8Oi7yRxcUlg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1637975932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=aZOv1txgfOaOUbPFrZO+dbMPb9SLUMuv6lc2RMuyFjg=;
	b=QQP1VVw6WuTJXvvOWqLKDexxgcwgpEeBUNVJEa0ULD4SwafNzfa75ksMJErjOcHpZVno3B
	Gmeyg67Xv64c4RAw==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
 Marc Zygnier <maz@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 Megha Dey <megha.dey@intel.com>,
 Ashok Raj <ashok.raj@intel.com>,
 Wei Liu <wei.liu@kernel.org>,
 x86@kernel.org,
 linux-hyperv@vger.kernel.org,
 linux-pci@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linuxppc-dev@lists.ozlabs.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org,
 ath11k@lists.infradead.org,
 Juergen Gross <jgross@suse.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>
Subject: [patch 11/22] x86/hyperv: Refactor hv_msi_domain_free_irqs()
References: <20211126222700.862407977@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Sat, 27 Nov 2021 02:18:51 +0100 (CET)

No point in looking up things over and over. Just look up the associated
irq data and work from there.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Wei Liu <wei.liu@kernel.org>
Cc: x86@kernel.org
Cc: linux-hyperv@vger.kernel.org
---
 arch/x86/hyperv/irqdomain.c |   55 +++++++++++++-------------------------------
 1 file changed, 17 insertions(+), 38 deletions(-)

--- a/arch/x86/hyperv/irqdomain.c
+++ b/arch/x86/hyperv/irqdomain.c
@@ -253,64 +253,43 @@ static int hv_unmap_msi_interrupt(struct
 	return hv_unmap_interrupt(hv_build_pci_dev_id(dev).as_uint64, old_entry);
 }
 
-static void hv_teardown_msi_irq_common(struct pci_dev *dev, struct msi_desc *msidesc, int irq)
+static void hv_teardown_msi_irq(struct pci_dev *dev, struct irq_data *irqd)
 {
-	u64 status;
 	struct hv_interrupt_entry old_entry;
-	struct irq_desc *desc;
-	struct irq_data *data;
 	struct msi_msg msg;
+	u64 status;
 
-	desc = irq_to_desc(irq);
-	if (!desc) {
-		pr_debug("%s: no irq desc\n", __func__);
-		return;
-	}
-
-	data = &desc->irq_data;
-	if (!data) {
-		pr_debug("%s: no irq data\n", __func__);
-		return;
-	}
-
-	if (!data->chip_data) {
+	if (!irqd->chip_data) {
 		pr_debug("%s: no chip data\n!", __func__);
 		return;
 	}
 
-	old_entry = *(struct hv_interrupt_entry *)data->chip_data;
+	old_entry = *(struct hv_interrupt_entry *)irqd->chip_data;
 	entry_to_msi_msg(&old_entry, &msg);
 
-	kfree(data->chip_data);
-	data->chip_data = NULL;
+	kfree(irqd->chip_data);
+	irqd->chip_data = NULL;
 
 	status = hv_unmap_msi_interrupt(dev, &old_entry);
 
-	if (status != HV_STATUS_SUCCESS) {
+	if (status != HV_STATUS_SUCCESS)
 		pr_err("%s: hypercall failed, status %lld\n", __func__, status);
-		return;
-	}
 }
 
-static void hv_msi_domain_free_irqs(struct irq_domain *domain, struct device *dev)
+static void hv_msi_free_irq(struct irq_domain *domain,
+			    struct msi_domain_info *info, unsigned int virq)
 {
-	int i;
-	struct msi_desc *entry;
-	struct pci_dev *pdev;
+	struct irq_data *irqd = irq_get_irq_data(virq);
+	struct msi_desc *desc;
 
-	if (WARN_ON_ONCE(!dev_is_pci(dev)))
+	if (!irqd)
 		return;
 
-	pdev = to_pci_dev(dev);
+	desc = irq_data_get_msi_desc(irqd);
+	if (!desc || !desc->irq || WARN_ON_ONCE(!dev_is_pci(desc->dev)))
+		return;
 
-	for_each_pci_msi_entry(entry, pdev) {
-		if (entry->irq) {
-			for (i = 0; i < entry->nvec_used; i++) {
-				hv_teardown_msi_irq_common(pdev, entry, entry->irq + i);
-				irq_domain_free_irqs(entry->irq + i, 1);
-			}
-		}
-	}
+	hv_teardown_msi_irq(to_pci_dev(desc->dev), irqd);
 }
 
 /*
@@ -329,7 +308,7 @@ static struct irq_chip hv_pci_msi_contro
 };
 
 static struct msi_domain_ops pci_msi_domain_ops = {
-	.domain_free_irqs	= hv_msi_domain_free_irqs,
+	.msi_free		= hv_msi_free_irq,
 	.msi_prepare		= pci_msi_prepare,
 };
 


