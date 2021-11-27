Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B38D45F98E
	for <lists+xen-devel@lfdr.de>; Sat, 27 Nov 2021 02:24:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233608.405480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqmSC-0004To-Tp; Sat, 27 Nov 2021 01:24:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233608.405480; Sat, 27 Nov 2021 01:24:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqmSC-0004Rq-QA; Sat, 27 Nov 2021 01:24:36 +0000
Received: by outflank-mailman (input) for mailman id 233608;
 Sat, 27 Nov 2021 01:24:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Erow=QO=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mqmSA-0003uw-Tl
 for xen-devel@lists.xenproject.org; Sat, 27 Nov 2021 01:24:35 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c71c6c94-4f20-11ec-9787-a32c541c8605;
 Sat, 27 Nov 2021 02:24:34 +0100 (CET)
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
X-Inumbo-ID: c71c6c94-4f20-11ec-9787-a32c541c8605
Message-ID: <20211127000918.594818541@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1637976273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=EW+Gm4C9srsYC5SImaDJkppoIX48hbwPcUobStKFJEM=;
	b=ba0qGeiB41JUVA/nbXIZqI/ZzR+lBVMsJEDx5NRNT/VAMjLuu4gdSY/IW2XqyTiCDLdfWK
	AQojkSzf0utkC0bMvnh29aBEv80K2O2wGaYj6Aba7BmI3wxtr19BQARnAuvbb1iEcFmo6I
	hlDD4BF/OfoIMuJ2s540besiWNAKWIpBGrHUFqoqUKXdsLvTElmNbz3nO/aZYfFyRcip8+
	EyAKNeFCcDrle450/Hx6NPInjM4wsqaFaUZ62JFjd2yxuWSRw0kkEbA6kTiDYHUWYhGPEY
	M30MNH/ErWNFGfXjykXzp8rnRca9Xg4qCwqGov4eS+2PP6X9zLCe0KqcivXq9A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1637976273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=EW+Gm4C9srsYC5SImaDJkppoIX48hbwPcUobStKFJEM=;
	b=HOol/oYi7k4NJTRqZmozHsVnqCuHGZv01jWHIiq8+jdIzZ0IwgPtzldd7npF1ZckQ/Ku5Z
	mXV0fPjO/GkB7DCA==
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
Subject: [patch 02/10] genirq/msi: Add range argument to
 msi_domain_alloc/free_descs_locked()
References: <20211126233124.618283684@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Sat, 27 Nov 2021 02:24:33 +0100 (CET)

In preparation for supporting range allocations for MSI-X, add a range
argument to the msi_domain_alloc/free_descs_locked() functions and fixup
all affected places.

Hand in ranges which are covering the current use case. They will be
refined in later steps.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/pci/msi/irqdomain.c |    6 ++++--
 include/linux/msi.h         |    5 ++---
 kernel/irq/msi.c            |   21 ++++++++++++---------
 3 files changed, 18 insertions(+), 14 deletions(-)

--- a/drivers/pci/msi/irqdomain.c
+++ b/drivers/pci/msi/irqdomain.c
@@ -10,22 +10,24 @@
 
 int pci_msi_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
 {
+	struct msi_range range = { .first = 0, .last = UINT_MAX, .ndesc = nvec};
 	struct irq_domain *domain;
 
 	domain = dev_get_msi_domain(&dev->dev);
 	if (domain && irq_domain_is_hierarchy(domain))
-		return msi_domain_alloc_irqs_descs_locked(domain, &dev->dev, nvec);
+		return msi_domain_alloc_irqs_descs_locked(domain, &dev->dev, &range);
 
 	return pci_msi_legacy_setup_msi_irqs(dev, nvec, type);
 }
 
 void pci_msi_teardown_msi_irqs(struct pci_dev *dev)
 {
+	struct msi_range range = { .first = 0, .last = UINT_MAX, };
 	struct irq_domain *domain;
 
 	domain = dev_get_msi_domain(&dev->dev);
 	if (domain && irq_domain_is_hierarchy(domain))
-		msi_domain_free_irqs_descs_locked(domain, &dev->dev);
+		msi_domain_free_irqs_descs_locked(domain, &dev->dev, &range);
 	else
 		pci_msi_legacy_teardown_msi_irqs(dev);
 }
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -502,12 +502,11 @@ struct irq_domain *msi_create_irq_domain
 					 struct msi_domain_info *info,
 					 struct irq_domain *parent);
 int __msi_domain_alloc_irqs(struct irq_domain *domain, struct device *dev, struct msi_range *range);
-int msi_domain_alloc_irqs_descs_locked(struct irq_domain *domain, struct device *dev,
-				       int nvec);
+int msi_domain_alloc_irqs_descs_locked(struct irq_domain *domain, struct device *dev,  struct msi_range *range);
 int msi_domain_alloc_irqs(struct irq_domain *domain, struct device *dev,
 			  int nvec);
 void __msi_domain_free_irqs(struct irq_domain *domain, struct device *dev, struct msi_range *range);
-void msi_domain_free_irqs_descs_locked(struct irq_domain *domain, struct device *dev);
+void msi_domain_free_irqs_descs_locked(struct irq_domain *domain, struct device *dev, struct msi_range *range);
 void msi_domain_free_irqs(struct irq_domain *domain, struct device *dev);
 struct msi_domain_info *msi_get_domain_info(struct irq_domain *domain);
 
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -956,22 +956,21 @@ static int msi_domain_add_simple_msi_des
  * Return: %0 on success or an error code.
  */
 int msi_domain_alloc_irqs_descs_locked(struct irq_domain *domain, struct device *dev,
-				       int nvec)
+				       struct msi_range *range)
 {
 	struct msi_domain_info *info = domain->host_data;
-	struct msi_range range = { .ndesc = nvec };
 	struct msi_domain_ops *ops = info->ops;
 	int ret;
 
 	lockdep_assert_held(&dev->msi.data->mutex);
 
-	ret = msi_domain_add_simple_msi_descs(info, dev, nvec);
+	ret = msi_domain_add_simple_msi_descs(info, dev, range->ndesc);
 	if (ret)
 		return ret;
 
-	ret = ops->domain_alloc_irqs(domain, dev, &range);
+	ret = ops->domain_alloc_irqs(domain, dev, range);
 	if (ret)
-		msi_domain_free_irqs_descs_locked(domain, dev);
+		msi_domain_free_irqs_descs_locked(domain, dev, range);
 	return ret;
 }
 
@@ -986,10 +985,11 @@ int msi_domain_alloc_irqs_descs_locked(s
  */
 int msi_domain_alloc_irqs(struct irq_domain *domain, struct device *dev, int nvec)
 {
+	struct msi_range range = { .first = 0, .last = UINT_MAX, .ndesc = nvec, };
 	int ret;
 
 	msi_lock_descs(dev);
-	ret = msi_domain_alloc_irqs_descs_locked(domain, dev, nvec);
+	ret = msi_domain_alloc_irqs_descs_locked(domain, dev, &range);
 	msi_unlock_descs(dev);
 	return ret;
 }
@@ -1034,14 +1034,15 @@ static void msi_domain_free_msi_descs(st
  * pair. Use this for MSI irqdomains which implement their own vector
  * allocation.
  */
-void msi_domain_free_irqs_descs_locked(struct irq_domain *domain, struct device *dev)
+void msi_domain_free_irqs_descs_locked(struct irq_domain *domain, struct device *dev,
+				       struct msi_range *range)
 {
 	struct msi_domain_info *info = domain->host_data;
 	struct msi_domain_ops *ops = info->ops;
 
 	lockdep_assert_held(&dev->msi.data->mutex);
 
-	ops->domain_free_irqs(domain, dev, NULL);
+	ops->domain_free_irqs(domain, dev, range);
 	msi_domain_free_msi_descs(info, dev);
 }
 
@@ -1053,8 +1054,10 @@ void msi_domain_free_irqs_descs_locked(s
  */
 void msi_domain_free_irqs(struct irq_domain *domain, struct device *dev)
 {
+	struct msi_range range = { .first = 0, .last = UINT_MAX, };
+
 	msi_lock_descs(dev);
-	msi_domain_free_irqs_descs_locked(domain, dev);
+	msi_domain_free_irqs_descs_locked(domain, dev, &range);
 	msi_unlock_descs(dev);
 }
 


