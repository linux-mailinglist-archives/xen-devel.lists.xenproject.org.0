Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4633945FA0B
	for <lists+xen-devel@lfdr.de>; Sat, 27 Nov 2021 02:27:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233646.405645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqmUb-0004Mv-MA; Sat, 27 Nov 2021 01:27:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233646.405645; Sat, 27 Nov 2021 01:27:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqmUb-0004IU-Gc; Sat, 27 Nov 2021 01:27:05 +0000
Received: by outflank-mailman (input) for mailman id 233646;
 Sat, 27 Nov 2021 01:27:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Erow=QO=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mqmSl-0004gG-87
 for xen-devel@lists.xenproject.org; Sat, 27 Nov 2021 01:25:11 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dcdb26e4-4f20-11ec-b941-1df2895da90e;
 Sat, 27 Nov 2021 02:25:10 +0100 (CET)
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
X-Inumbo-ID: dcdb26e4-4f20-11ec-b941-1df2895da90e
Message-ID: <20211127000918.948090130@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1637976310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=0A61IAyhwI6GY5iuZYdA+ROlAbbN0w/XOIQw6hDb9NM=;
	b=a3iGOUSTx4AN3Q+pI7OaLd8XxRJez4TVI0yS8OwSrBLHpMdd43pK6NS2i9A78zct8mMk9N
	KkCBGxJmthiU+adM0JABQFd1JpzvyWEDZYkDTb6KmwkCcIlJvYwRrVtecKgwiWt149QTKy
	kXNw9ozrprUifZWGRJ3ozGMEgFx7xSIRi4PKYhplfZ2luJnSotKEvPT5jrmonGKUd48KP4
	l+CgfvLLEiDNlvnHaEw1Cta1aegPtCzTvkIfKuY21nSEgRwMKfcO4iuilA54iG4h/Lw0VE
	OOcQ/VEF5J9CngnBfWKhbVR9UJEUOHQQedT9R8W+9iFsK//l3/Je1Nou98oMNw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1637976310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=0A61IAyhwI6GY5iuZYdA+ROlAbbN0w/XOIQw6hDb9NM=;
	b=bg4/hHFjPj1TJiW6AfVYBKxndqevN1BSCZqejV8miPfCEJVhBd+nd4HllZp/pRBVSGwDQb
	VCXYClThCFvP92AQ==
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
Subject: [patch 08/10] PCI/MSI: Provide pci_msi_domain_supports_expand()
References: <20211126233124.618283684@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Sat, 27 Nov 2021 02:25:09 +0100 (CET)

Not all irq domain implementations can support runtime MSI-X vector
expansion as they assume zero based allocations or have other
restrictions.

The legacy PCI allocation functions are not suited for runtime vector
expansion either.

Add a function which allows to query whether runtime MSI-X vector expansion
is supported or not.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/pci/msi/irqdomain.c |   29 +++++++++++++++++++++++------
 include/linux/msi.h         |    2 ++
 2 files changed, 25 insertions(+), 6 deletions(-)

--- a/drivers/pci/msi/irqdomain.c
+++ b/drivers/pci/msi/irqdomain.c
@@ -8,12 +8,18 @@
 
 #include "msi.h"
 
+static struct irq_domain *pci_get_msi_domain(struct pci_dev *dev)
+{
+	struct irq_domain *domain = dev_get_msi_domain(&dev->dev);
+
+	return domain && irq_domain_is_hierarchy(domain) ? domain : NULL;
+}
+
 int pci_msi_setup_msi_irqs(struct pci_dev *dev, struct msi_range *range, int type)
 {
-	struct irq_domain *domain;
+	struct irq_domain *domain = pci_get_msi_domain(dev);
 
-	domain = dev_get_msi_domain(&dev->dev);
-	if (domain && irq_domain_is_hierarchy(domain))
+	if (domain)
 		return msi_domain_alloc_irqs_descs_locked(domain, &dev->dev, range);
 
 	return pci_msi_legacy_setup_msi_irqs(dev, range->ndesc, type);
@@ -21,15 +27,26 @@ int pci_msi_setup_msi_irqs(struct pci_de
 
 void pci_msi_teardown_msi_irqs(struct pci_dev *dev, struct msi_range *range)
 {
-	struct irq_domain *domain;
+	struct irq_domain *domain = pci_get_msi_domain(dev);
 
-	domain = dev_get_msi_domain(&dev->dev);
-	if (domain && irq_domain_is_hierarchy(domain))
+	if (domain)
 		msi_domain_free_irqs_descs_locked(domain, &dev->dev, range);
 	else
 		pci_msi_legacy_teardown_msi_irqs(dev);
 }
 
+bool pci_msi_domain_supports_expand(struct pci_dev *dev)
+{
+	struct irq_domain *domain = pci_get_msi_domain(dev);
+	struct msi_domain_info *info;
+
+	if (!domain)
+		return false;
+
+	info = domain->host_data;
+	return info->flags & MSI_FLAG_CAN_EXPAND;
+}
+
 /**
  * pci_msi_domain_write_msg - Helper to write MSI message to PCI config space
  * @irq_data:	Pointer to interrupt data of the MSI interrupt
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -552,11 +552,13 @@ struct irq_domain *pci_msi_create_irq_do
 u32 pci_msi_domain_get_msi_rid(struct irq_domain *domain, struct pci_dev *pdev);
 struct irq_domain *pci_msi_get_device_domain(struct pci_dev *pdev);
 bool pci_dev_has_special_msi_domain(struct pci_dev *pdev);
+bool pci_msi_domain_supports_expand(struct pci_dev *dev);
 #else
 static inline struct irq_domain *pci_msi_get_device_domain(struct pci_dev *pdev)
 {
 	return NULL;
 }
+static inline bool pci_msi_domain_supports_expand(struct pci_dev *dev) { return false; }
 #endif /* CONFIG_PCI_MSI_IRQ_DOMAIN */
 
 #endif /* LINUX_MSI_H */


