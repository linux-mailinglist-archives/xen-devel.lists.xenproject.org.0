Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE4545F996
	for <lists+xen-devel@lfdr.de>; Sat, 27 Nov 2021 02:24:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233613.405532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqmSK-0005sD-2d; Sat, 27 Nov 2021 01:24:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233613.405532; Sat, 27 Nov 2021 01:24:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqmSJ-0005iG-QL; Sat, 27 Nov 2021 01:24:43 +0000
Received: by outflank-mailman (input) for mailman id 233613;
 Sat, 27 Nov 2021 01:24:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Erow=QO=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mqmSI-0004gG-HU
 for xen-devel@lists.xenproject.org; Sat, 27 Nov 2021 01:24:42 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cbb420a3-4f20-11ec-b941-1df2895da90e;
 Sat, 27 Nov 2021 02:24:41 +0100 (CET)
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
X-Inumbo-ID: cbb420a3-4f20-11ec-b941-1df2895da90e
Message-ID: <20211127000918.892733246@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1637976281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=1qj+ON8bFgIPks8keDU/08NOHxNWcizsMPwkJuRGMrI=;
	b=TpryTAQxxx6RWppxDWnQp1sseu+ucPeEfW+EupZx2rCOEvok5NQEvK3qjscAvEXPnKHmSQ
	sI/urKNHo3gJgriNBWDb0QhvqSsY81joc5q1w9Se24pZmghuMFkTDjBC6QojPQnDdhfCXq
	Jnd9Cm1icNq2eo2JCoo4o5VuhYLt2S83AR83F1zOnMJdSgsUEQtcJ28VJMsqNX4AyeQMUs
	NMXJEnyUqSkE6kh7Jqf3FPdhM9yK0G+ORqpoJrzhgEA7oNSRg2YUTW5kCj5vZAEmp2zAI/
	6MSH6J30iS6UDk/IGKjB4QnhlPXmiW/MpzU/gzDQ3NNKK/qzN9ApaYBom2X9+g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1637976281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=1qj+ON8bFgIPks8keDU/08NOHxNWcizsMPwkJuRGMrI=;
	b=a8sBRzgNgK5ykgWV3lttGcyQfCDrllQes3dDaXtlLCK/MalZhwpdvKqazKfXM2oQvBMoIk
	0ArxoCNQu0M2rQDA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
 Marc Zygnier <maz@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 Megha Dey <megha.dey@intel.com>,
 Ashok Raj <ashok.raj@intel.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Cooper <amc96@cam.ac.uk>,
 Juergen Gross <jgross@suse.com>,
 linux-pci@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: [patch 07/10] PCI/MSI: Make free related functions range based
References: <20211126233124.618283684@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Sat, 27 Nov 2021 02:24:41 +0100 (CET)

In preparation of runtime expandable PCI/MSI-X vectors convert the related
free functions to take ranges instead of assuming a zero based vector
space.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/pci/msi/irqdomain.c |    5 ++---
 drivers/pci/msi/msi.c       |   24 ++++++++++++++++--------
 drivers/pci/msi/msi.h       |    2 +-
 3 files changed, 19 insertions(+), 12 deletions(-)

--- a/drivers/pci/msi/irqdomain.c
+++ b/drivers/pci/msi/irqdomain.c
@@ -19,14 +19,13 @@ int pci_msi_setup_msi_irqs(struct pci_de
 	return pci_msi_legacy_setup_msi_irqs(dev, range->ndesc, type);
 }
 
-void pci_msi_teardown_msi_irqs(struct pci_dev *dev)
+void pci_msi_teardown_msi_irqs(struct pci_dev *dev, struct msi_range *range)
 {
-	struct msi_range range = { .first = 0, .last = UINT_MAX, };
 	struct irq_domain *domain;
 
 	domain = dev_get_msi_domain(&dev->dev);
 	if (domain && irq_domain_is_hierarchy(domain))
-		msi_domain_free_irqs_descs_locked(domain, &dev->dev, &range);
+		msi_domain_free_irqs_descs_locked(domain, &dev->dev, range);
 	else
 		pci_msi_legacy_teardown_msi_irqs(dev);
 }
--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -222,9 +222,12 @@ void pci_write_msi_msg(unsigned int irq,
 }
 EXPORT_SYMBOL_GPL(pci_write_msi_msg);
 
-static void free_msi_irqs(struct pci_dev *dev)
+static void free_msi_irqs(struct pci_dev *dev, struct msi_range *range, bool shutdown)
 {
-	pci_msi_teardown_msi_irqs(dev);
+	pci_msi_teardown_msi_irqs(dev, range);
+
+	if (!shutdown)
+		return;
 
 	if (dev->msix_base) {
 		iounmap(dev->msix_base);
@@ -443,7 +446,7 @@ static int msi_capability_init(struct pc
 
 err:
 	pci_msi_unmask(entry, msi_multi_mask(entry));
-	free_msi_irqs(dev);
+	free_msi_irqs(dev, &range, true);
 unlock:
 	msi_unlock_descs(&dev->dev);
 	kfree(masks);
@@ -538,7 +541,7 @@ static void msix_mask_all(void __iomem *
 
 static int msix_setup_interrupts(struct pci_dev *dev, void __iomem *base,
 				 struct msi_range *range, struct msix_entry *entries,
-				 struct irq_affinity *affd)
+				 struct irq_affinity *affd, bool expand)
 {
 	struct irq_affinity_desc *masks = NULL;
 	int ret;
@@ -566,7 +569,8 @@ static int msix_setup_interrupts(struct
 	goto out_unlock;
 
 out_free:
-	free_msi_irqs(dev);
+	free_msi_irqs(dev, range, !expand);
+
 out_unlock:
 	msi_unlock_descs(&dev->dev);
 	kfree(masks);
@@ -614,7 +618,7 @@ static int msix_capability_init(struct p
 	/* Ensure that all table entries are masked. */
 	msix_mask_all(base, tsize);
 
-	ret = msix_setup_interrupts(dev, base, &range, entries, affd);
+	ret = msix_setup_interrupts(dev, base, &range, entries, affd, false);
 	if (ret)
 		goto out_disable;
 
@@ -728,12 +732,14 @@ static void pci_msi_shutdown(struct pci_
 
 void pci_disable_msi(struct pci_dev *dev)
 {
+	struct msi_range range = { .first = 0, .last = 0, };
+
 	if (!pci_msi_enable || !dev || !dev->msi_enabled)
 		return;
 
 	msi_lock_descs(&dev->dev);
 	pci_msi_shutdown(dev);
-	free_msi_irqs(dev);
+	free_msi_irqs(dev, &range, true);
 	msi_unlock_descs(&dev->dev);
 }
 EXPORT_SYMBOL(pci_disable_msi);
@@ -817,12 +823,14 @@ static void pci_msix_shutdown(struct pci
 
 void pci_disable_msix(struct pci_dev *dev)
 {
+	struct msi_range range = { .first = 0, .last = UINT_MAX, };
+
 	if (!pci_msi_enable || !dev || !dev->msix_enabled)
 		return;
 
 	msi_lock_descs(&dev->dev);
 	pci_msix_shutdown(dev);
-	free_msi_irqs(dev);
+	free_msi_irqs(dev, &range, true);
 	msi_unlock_descs(&dev->dev);
 }
 EXPORT_SYMBOL(pci_disable_msix);
--- a/drivers/pci/msi/msi.h
+++ b/drivers/pci/msi/msi.h
@@ -6,7 +6,7 @@
 #define msix_table_size(flags)	((flags & PCI_MSIX_FLAGS_QSIZE) + 1)
 
 extern int pci_msi_setup_msi_irqs(struct pci_dev *dev, struct msi_range *range, int type);
-extern void pci_msi_teardown_msi_irqs(struct pci_dev *dev);
+extern void pci_msi_teardown_msi_irqs(struct pci_dev *dev, struct msi_range *range);
 
 #ifdef CONFIG_PCI_MSI_ARCH_FALLBACKS
 extern int pci_msi_legacy_setup_msi_irqs(struct pci_dev *dev, int nvec, int type);


