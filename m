Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E66F46AD28
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 23:48:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240094.416517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMmw-000581-VJ; Mon, 06 Dec 2021 22:48:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240094.416517; Mon, 06 Dec 2021 22:48:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMmw-00053n-Pl; Mon, 06 Dec 2021 22:48:50 +0000
Received: by outflank-mailman (input) for mailman id 240094;
 Mon, 06 Dec 2021 22:48:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qlu=QX=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1muMdf-0004ul-Db
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 22:39:15 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56c96027-56e5-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 23:39:14 +0100 (CET)
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
X-Inumbo-ID: 56c96027-56e5-11ec-8a4d-196798b21f7b
Message-ID: <20211206210438.256361987@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638830354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=8HVYS8zfOFoFasYqyhj4ReqJ6AOUBtsErT7gsuMSP4E=;
	b=nUS2bp6KPZUGO4190qFZaxxBE5h7oZyCRZ4EdGJrg/SlwMsYkbIVKQQ1P11gWr0HhFDNpU
	HnkqhrRf9ECCYnDNr+vAbf/2HQV5S66+yuQb2VvbMfZl2Bd5w10mV5TyXakoeuHqnLeecG
	+7FG4hZbMKYGST9TTrwWoXGDs0Sc6fLixnABW8FDUy0vi61WLgVNPaASOJyVU5vRjgmo4H
	RuiRfz3cXnDQ4n2/3ssR2nnjOpKQ19EDQ7c8fef96PzaE3356/HFx9Nryn9dfHj/zrec5v
	fqLEhe8hxmxCj6qn9esYjwvQzQNrKeIbNxU7Nyo9s34Tp4DLcRDgEsSY3NtEiA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638830354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=8HVYS8zfOFoFasYqyhj4ReqJ6AOUBtsErT7gsuMSP4E=;
	b=U4Ngne/RH8HTWfWVsWRrbmtfbEDTspGYTScOjm8Th7IzSHbUcSKQCiJJRlEv7zwqKgGBuQ
	jpRr3FP2K0fJJSAA==
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
Subject: [patch V2 11/36] platform-msi: Rename functions and clarify comments
References: <20211206210307.625116253@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  6 Dec 2021 23:39:13 +0100 (CET)

It's hard to distinguish what platform_msi_domain_alloc() and
platform_msi_domain_alloc_irqs() are about. Make the distinction more
explicit and add comments which explain the use cases properly.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/base/platform-msi.c     |   36 +++++++++++++++++++++---------------
 drivers/irqchip/irq-mbigen.c    |    4 ++--
 drivers/irqchip/irq-mvebu-icu.c |    6 +++---
 include/linux/msi.h             |    8 ++++----
 4 files changed, 30 insertions(+), 24 deletions(-)

--- a/drivers/base/platform-msi.c
+++ b/drivers/base/platform-msi.c
@@ -313,17 +313,18 @@ EXPORT_SYMBOL_GPL(platform_msi_domain_fr
  *                              a platform-msi domain
  * @domain:	The platform-msi domain
  *
- * Returns the private data provided when calling
- * platform_msi_create_device_domain.
+ * Return: The private data provided when calling
+ * platform_msi_create_device_domain().
  */
 void *platform_msi_get_host_data(struct irq_domain *domain)
 {
 	struct platform_msi_priv_data *data = domain->host_data;
+
 	return data->host_data;
 }
 
 /**
- * __platform_msi_create_device_domain - Create a platform-msi domain
+ * __platform_msi_create_device_domain - Create a platform-msi device domain
  *
  * @dev:		The device generating the MSIs
  * @nvec:		The number of MSIs that need to be allocated
@@ -332,7 +333,11 @@ void *platform_msi_get_host_data(struct
  * @ops:		The hierarchy domain operations to use
  * @host_data:		Private data associated to this domain
  *
- * Returns an irqdomain for @nvec interrupts
+ * Return: An irqdomain for @nvec interrupts on success, NULL in case of error.
+ *
+ * This is for interrupt domains which stack on a platform-msi domain
+ * created by platform_msi_create_irq_domain(). @dev->msi.domain points to
+ * that platform-msi domain which is the parent for the new domain.
  */
 struct irq_domain *
 __platform_msi_create_device_domain(struct device *dev,
@@ -372,18 +377,19 @@ struct irq_domain *
 }
 
 /**
- * platform_msi_domain_free - Free interrupts associated with a platform-msi
- *                            domain
+ * platform_msi_device_domain_free - Free interrupts associated with a platform-msi
+ *				     device domain
  *
- * @domain:	The platform-msi domain
+ * @domain:	The platform-msi device domain
  * @virq:	The base irq from which to perform the free operation
  * @nvec:	How many interrupts to free from @virq
  */
-void platform_msi_domain_free(struct irq_domain *domain, unsigned int virq,
-			      unsigned int nvec)
+void platform_msi_device_domain_free(struct irq_domain *domain, unsigned int virq,
+				     unsigned int nvec)
 {
 	struct platform_msi_priv_data *data = domain->host_data;
 	struct msi_desc *desc, *tmp;
+
 	for_each_msi_entry_safe(desc, tmp, data->dev) {
 		if (WARN_ON(!desc->irq || desc->nvec_used != 1))
 			return;
@@ -397,10 +403,10 @@ void platform_msi_domain_free(struct irq
 }
 
 /**
- * platform_msi_domain_alloc - Allocate interrupts associated with
- *			       a platform-msi domain
+ * platform_msi_device_domain_alloc - Allocate interrupts associated with
+ *				      a platform-msi device domain
  *
- * @domain:	The platform-msi domain
+ * @domain:	The platform-msi device domain
  * @virq:	The base irq from which to perform the allocate operation
  * @nr_irqs:	How many interrupts to free from @virq
  *
@@ -408,8 +414,8 @@ void platform_msi_domain_free(struct irq
  * with irq_domain_mutex held (which can only be done as part of a
  * top-level interrupt allocation).
  */
-int platform_msi_domain_alloc(struct irq_domain *domain, unsigned int virq,
-			      unsigned int nr_irqs)
+int platform_msi_device_domain_alloc(struct irq_domain *domain, unsigned int virq,
+				     unsigned int nr_irqs)
 {
 	struct platform_msi_priv_data *data = domain->host_data;
 	int err;
@@ -421,7 +427,7 @@ int platform_msi_domain_alloc(struct irq
 	err = msi_domain_populate_irqs(domain->parent, data->dev,
 				       virq, nr_irqs, &data->arg);
 	if (err)
-		platform_msi_domain_free(domain, virq, nr_irqs);
+		platform_msi_device_domain_free(domain, virq, nr_irqs);
 
 	return err;
 }
--- a/drivers/irqchip/irq-mbigen.c
+++ b/drivers/irqchip/irq-mbigen.c
@@ -207,7 +207,7 @@ static int mbigen_irq_domain_alloc(struc
 	if (err)
 		return err;
 
-	err = platform_msi_domain_alloc(domain, virq, nr_irqs);
+	err = platform_msi_device_domain_alloc(domain, virq, nr_irqs);
 	if (err)
 		return err;
 
@@ -223,7 +223,7 @@ static int mbigen_irq_domain_alloc(struc
 static void mbigen_irq_domain_free(struct irq_domain *domain, unsigned int virq,
 				   unsigned int nr_irqs)
 {
-	platform_msi_domain_free(domain, virq, nr_irqs);
+	platform_msi_device_domain_free(domain, virq, nr_irqs);
 }
 
 static const struct irq_domain_ops mbigen_domain_ops = {
--- a/drivers/irqchip/irq-mvebu-icu.c
+++ b/drivers/irqchip/irq-mvebu-icu.c
@@ -221,7 +221,7 @@ mvebu_icu_irq_domain_alloc(struct irq_do
 		icu_irqd->icu_group = msi_data->subset_data->icu_group;
 	icu_irqd->icu = icu;
 
-	err = platform_msi_domain_alloc(domain, virq, nr_irqs);
+	err = platform_msi_device_domain_alloc(domain, virq, nr_irqs);
 	if (err) {
 		dev_err(icu->dev, "failed to allocate ICU interrupt in parent domain\n");
 		goto free_irqd;
@@ -245,7 +245,7 @@ mvebu_icu_irq_domain_alloc(struct irq_do
 	return 0;
 
 free_msi:
-	platform_msi_domain_free(domain, virq, nr_irqs);
+	platform_msi_device_domain_free(domain, virq, nr_irqs);
 free_irqd:
 	kfree(icu_irqd);
 	return err;
@@ -260,7 +260,7 @@ mvebu_icu_irq_domain_free(struct irq_dom
 
 	kfree(icu_irqd);
 
-	platform_msi_domain_free(domain, virq, nr_irqs);
+	platform_msi_device_domain_free(domain, virq, nr_irqs);
 }
 
 static const struct irq_domain_ops mvebu_icu_domain_ops = {
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -434,10 +434,10 @@ struct irq_domain *
 #define platform_msi_create_device_tree_domain(dev, nvec, write, ops, data) \
 	__platform_msi_create_device_domain(dev, nvec, true, write, ops, data)
 
-int platform_msi_domain_alloc(struct irq_domain *domain, unsigned int virq,
-			      unsigned int nr_irqs);
-void platform_msi_domain_free(struct irq_domain *domain, unsigned int virq,
-			      unsigned int nvec);
+int platform_msi_device_domain_alloc(struct irq_domain *domain, unsigned int virq,
+				     unsigned int nr_irqs);
+void platform_msi_device_domain_free(struct irq_domain *domain, unsigned int virq,
+				     unsigned int nvec);
 void *platform_msi_get_host_data(struct irq_domain *domain);
 #endif /* CONFIG_GENERIC_MSI_IRQ_DOMAIN */
 


