Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A67D46AC40
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 23:37:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239939.416073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMbt-0005j4-8F; Mon, 06 Dec 2021 22:37:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239939.416073; Mon, 06 Dec 2021 22:37:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMbs-0005cS-VP; Mon, 06 Dec 2021 22:37:24 +0000
Received: by outflank-mailman (input) for mailman id 239939;
 Mon, 06 Dec 2021 22:37:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qlu=QX=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1muMSn-0001Vt-Ea
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 22:28:01 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4b6ae83-56e3-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 23:28:00 +0100 (CET)
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
X-Inumbo-ID: c4b6ae83-56e3-11ec-a5e1-b9374ead2679
Message-ID: <20211206210225.046615302@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638829679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=Llb+UkCn1EdRNyykmbxfFT74AdLeoQ5WEavNgQJIfNI=;
	b=m/otsXxhhIjzQusJ74eE8x4nGdLq11UjKe/1KMkqIM9y+rVLBafAimp/SstBo/tjgZZJjx
	jUOoA7IpkqUEML50sZTNQci0D7KnLV1MzjX0YjVCHj6Zz7zlYmxqGLCMvPnqkP+avoKD3g
	7U5BFVjR9Hzh1o0t0RWyuvuXMyR9dQNDlfD1uB1foGmdMyJFhSAKleZ0J3XOTQuZnzQ4aP
	a9DnRcqa1Nin6HKz/IOBO4KLJ3RiPbywM+Ky2yqslP6pLupCe3J3mzyQtH5FhiTln6zTV8
	KOeT5CnFn5EmRKWSfUdL/BHH823q5Ikmg75a9L5Qaag5v+7qt1RSQspcMYwX2g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638829679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=Llb+UkCn1EdRNyykmbxfFT74AdLeoQ5WEavNgQJIfNI=;
	b=XpUaw5kpy0Mws2HZXd/IbELNsaWgjBLSWCLWagCfUU2JhlssyyFIUBSpX9FsWSY6dhwc6T
	ETc9kRzRw9IdjRCg==
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
 Juergen Gross <jgross@suse.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linuxppc-dev@lists.ozlabs.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org,
 Kalle Valo <kvalo@codeaurora.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 sparclinux@vger.kernel.org,
 x86@kernel.org,
 xen-devel@lists.xenproject.org,
 ath11k@lists.infradead.org,
 Wei Liu <wei.liu@kernel.org>,
 linux-hyperv@vger.kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>
Subject:
 [patch V2 22/23] genirq/msi: Handle PCI/MSI allocation fail in core code
References: <20211206210147.872865823@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  6 Dec 2021 23:27:59 +0100 (CET)

Get rid of yet another irqdomain callback and let the core code return the
already available information of how many descriptors could be allocated.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/pci/msi/irqdomain.c |   13 -------------
 include/linux/msi.h         |    5 +----
 kernel/irq/msi.c            |   29 +++++++++++++++++++++++++----
 3 files changed, 26 insertions(+), 21 deletions(-)

--- a/drivers/pci/msi/irqdomain.c
+++ b/drivers/pci/msi/irqdomain.c
@@ -95,16 +95,6 @@ static int pci_msi_domain_check_cap(stru
 	return 0;
 }
 
-static int pci_msi_domain_handle_error(struct irq_domain *domain,
-				       struct msi_desc *desc, int error)
-{
-	/* Special handling to support __pci_enable_msi_range() */
-	if (pci_msi_desc_is_multi_msi(desc) && error == -ENOSPC)
-		return 1;
-
-	return error;
-}
-
 static void pci_msi_domain_set_desc(msi_alloc_info_t *arg,
 				    struct msi_desc *desc)
 {
@@ -115,7 +105,6 @@ static void pci_msi_domain_set_desc(msi_
 static struct msi_domain_ops pci_msi_domain_ops_default = {
 	.set_desc	= pci_msi_domain_set_desc,
 	.msi_check	= pci_msi_domain_check_cap,
-	.handle_error	= pci_msi_domain_handle_error,
 };
 
 static void pci_msi_domain_update_dom_ops(struct msi_domain_info *info)
@@ -129,8 +118,6 @@ static void pci_msi_domain_update_dom_op
 			ops->set_desc = pci_msi_domain_set_desc;
 		if (ops->msi_check == NULL)
 			ops->msi_check = pci_msi_domain_check_cap;
-		if (ops->handle_error == NULL)
-			ops->handle_error = pci_msi_domain_handle_error;
 	}
 }
 
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -286,7 +286,6 @@ struct msi_domain_info;
  * @msi_check:		Callback for verification of the domain/info/dev data
  * @msi_prepare:	Prepare the allocation of the interrupts in the domain
  * @set_desc:		Set the msi descriptor for an interrupt
- * @handle_error:	Optional error handler if the allocation fails
  * @domain_alloc_irqs:	Optional function to override the default allocation
  *			function.
  * @domain_free_irqs:	Optional function to override the default free
@@ -295,7 +294,7 @@ struct msi_domain_info;
  * @get_hwirq, @msi_init and @msi_free are callbacks used by the underlying
  * irqdomain.
  *
- * @msi_check, @msi_prepare, @handle_error and @set_desc are callbacks used by
+ * @msi_check, @msi_prepare and @set_desc are callbacks used by
  * msi_domain_alloc/free_irqs().
  *
  * @domain_alloc_irqs, @domain_free_irqs can be used to override the
@@ -332,8 +331,6 @@ struct msi_domain_ops {
 				       msi_alloc_info_t *arg);
 	void		(*set_desc)(msi_alloc_info_t *arg,
 				    struct msi_desc *desc);
-	int		(*handle_error)(struct irq_domain *domain,
-					struct msi_desc *desc, int error);
 	int		(*domain_alloc_irqs)(struct irq_domain *domain,
 					     struct device *dev, int nvec);
 	void		(*domain_free_irqs)(struct irq_domain *domain,
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -538,6 +538,27 @@ static bool msi_check_reservation_mode(s
 	return desc->pci.msi_attrib.is_msix || desc->pci.msi_attrib.can_mask;
 }
 
+static int msi_handle_pci_fail(struct irq_domain *domain, struct msi_desc *desc,
+			       int allocated)
+{
+	switch(domain->bus_token) {
+	case DOMAIN_BUS_PCI_MSI:
+	case DOMAIN_BUS_VMD_MSI:
+		if (IS_ENABLED(CONFIG_PCI_MSI))
+			break;
+		fallthrough;
+	default:
+		return -ENOSPC;
+	}
+
+	/* Let a failed PCI multi MSI allocation retry */
+	if (desc->nvec_used > 1)
+		return 1;
+
+	/* If there was a successful allocation let the caller know */
+	return allocated ? allocated : -ENOSPC;
+}
+
 int __msi_domain_alloc_irqs(struct irq_domain *domain, struct device *dev,
 			    int nvec)
 {
@@ -546,6 +567,7 @@ int __msi_domain_alloc_irqs(struct irq_d
 	struct irq_data *irq_data;
 	struct msi_desc *desc;
 	msi_alloc_info_t arg = { };
+	int allocated = 0;
 	int i, ret, virq;
 	bool can_reserve;
 
@@ -560,16 +582,15 @@ int __msi_domain_alloc_irqs(struct irq_d
 					       dev_to_node(dev), &arg, false,
 					       desc->affinity);
 		if (virq < 0) {
-			ret = -ENOSPC;
-			if (ops->handle_error)
-				ret = ops->handle_error(domain, desc, ret);
-			return ret;
+			ret = msi_handle_pci_fail(domain, desc, allocated);
+			goto cleanup;
 		}
 
 		for (i = 0; i < desc->nvec_used; i++) {
 			irq_set_msi_desc_off(virq, i, desc);
 			irq_debugfs_copy_devname(virq + i, dev);
 		}
+		allocated++;
 	}
 
 	can_reserve = msi_check_reservation_mode(domain, info, dev);


