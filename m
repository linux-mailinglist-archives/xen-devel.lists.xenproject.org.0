Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B960845FA14
	for <lists+xen-devel@lfdr.de>; Sat, 27 Nov 2021 02:27:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233674.405720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqmUo-0007RJ-UG; Sat, 27 Nov 2021 01:27:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233674.405720; Sat, 27 Nov 2021 01:27:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqmUo-0007L0-Dj; Sat, 27 Nov 2021 01:27:18 +0000
Received: by outflank-mailman (input) for mailman id 233674;
 Sat, 27 Nov 2021 01:27:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Erow=QO=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mqmSf-0004gG-O5
 for xen-devel@lists.xenproject.org; Sat, 27 Nov 2021 01:25:05 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d84567e6-4f20-11ec-b941-1df2895da90e;
 Sat, 27 Nov 2021 02:25:02 +0100 (CET)
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
X-Inumbo-ID: d84567e6-4f20-11ec-b941-1df2895da90e
Message-ID: <20211127000918.664542907@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1637976302;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=rrdNHJUyUgKyNz6Pbn0ws4hWiMPwwbNMnZ1F31AYBD0=;
	b=rk8tLqrH/jwlZPWTi5ZYoJtV8IerLp8c1pN+oY2nqoQ75mRhq9dXTfvsQHLDkrZZap9/pk
	jjc0JTIlL54D/GYfllh6yrnQBNwJLwvHcvBQihZlvTJGCvKojQxfy7q6iehck4kLQgWCIL
	COCB4MxLmzhjwQH7VrDvt8TVObtKFVG8/E48BhCvg8jQUlIWL451I1FRIi1WhOAwkJHXfb
	J3aYDkXnel/Geaa8cij+IP+JMldsWgKE1HsrSoWb8Cbf0x8sY2k5BCGVREuzIwO3pNATCZ
	kyIApnD73sro4h+FSbg4A3GwGkjBLYmfN7iOaxzm+jT7nSncj2KRccMfaSJx5w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1637976302;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=rrdNHJUyUgKyNz6Pbn0ws4hWiMPwwbNMnZ1F31AYBD0=;
	b=Ui/C++sWuyQrA07lP+61EhKbtD5roY4pyOnAVFQ1cNzvOD/A43y3dx3h5sUDRRnJd/OmmF
	mVhzTLHOb3zddqAw==
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
Subject: [patch 03/10] genirq/msi: Make MSI descriptor alloc/free ready for
 range allocations
References: <20211126233124.618283684@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Sat, 27 Nov 2021 02:25:01 +0100 (CET)

Convert the MSI descriptor related functions to ranges and fixup the call
sites.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/base/platform-msi.c |    3 ++-
 include/linux/msi.h         |    7 ++++---
 kernel/irq/msi.c            |   38 +++++++++++++++++++-------------------
 3 files changed, 25 insertions(+), 23 deletions(-)

--- a/drivers/base/platform-msi.c
+++ b/drivers/base/platform-msi.c
@@ -320,11 +320,12 @@ struct irq_domain *
 void platform_msi_device_domain_free(struct irq_domain *domain, unsigned int virq,
 				     unsigned int nr_irqs)
 {
+	struct msi_range range = { .first = virq, .last = virq + nr_irqs - 1, };
 	struct platform_msi_priv_data *data = domain->host_data;
 
 	msi_lock_descs(data->dev);
 	irq_domain_free_irqs_common(domain, virq, nr_irqs);
-	msi_free_msi_descs_range(data->dev, MSI_DESC_ALL, virq, nr_irqs);
+	msi_free_msi_descs_range(data->dev, MSI_DESC_ALL, &range);
 	msi_unlock_descs(data->dev);
 }
 
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -321,8 +321,7 @@ static inline void pci_write_msi_msg(uns
 #endif /* CONFIG_PCI_MSI */
 
 int msi_add_msi_desc(struct device *dev, struct msi_desc *init_desc);
-void msi_free_msi_descs_range(struct device *dev, enum msi_desc_filter filter,
-			      unsigned int base_index, unsigned int ndesc);
+void msi_free_msi_descs_range(struct device *dev, enum msi_desc_filter filter, struct msi_range *range);
 
 /**
  * msi_free_msi_descs - Free MSI descriptors of a device
@@ -330,7 +329,9 @@ void msi_free_msi_descs_range(struct dev
  */
 static inline void msi_free_msi_descs(struct device *dev)
 {
-	msi_free_msi_descs_range(dev, MSI_DESC_ALL, 0, UINT_MAX);
+	struct msi_range range = { .first = 0, .last = UINT_MAX, };
+
+	msi_free_msi_descs_range(dev, MSI_DESC_ALL, &range);
 }
 
 void __pci_read_msi_msg(struct msi_desc *entry, struct msi_msg *msg);
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -101,19 +101,19 @@ int msi_add_msi_desc(struct device *dev,
  *
  * Return: 0 on success or an appropriate failure code.
  */
-static int msi_add_simple_msi_descs(struct device *dev, unsigned int index, unsigned int ndesc)
+static int msi_add_simple_msi_descs(struct device *dev, struct msi_range *range)
 {
 	struct msi_desc *desc;
-	unsigned long i;
+	unsigned long idx;
 	int ret;
 
 	lockdep_assert_held(&dev->msi.data->mutex);
 
-	for (i = 0; i < ndesc; i++) {
+	for (idx = range->first; idx <= range->last; idx++) {
 		desc = msi_alloc_desc(dev, 1, NULL);
 		if (!desc)
 			goto fail_mem;
-		ret = msi_insert_desc(dev->msi.data, desc, index + i);
+		ret = msi_insert_desc(dev->msi.data, desc, idx);
 		if (ret)
 			goto fail;
 	}
@@ -122,7 +122,7 @@ static int msi_add_simple_msi_descs(stru
 fail_mem:
 	ret = -ENOMEM;
 fail:
-	msi_free_msi_descs_range(dev, MSI_DESC_NOTASSOCIATED, index, ndesc);
+	msi_free_msi_descs_range(dev, MSI_DESC_NOTASSOCIATED, range);
 	return ret;
 }
 
@@ -148,14 +148,14 @@ static bool msi_desc_match(struct msi_de
  * @ndesc:	Number of descriptors to free
  */
 void msi_free_msi_descs_range(struct device *dev, enum msi_desc_filter filter,
-			      unsigned int base_index, unsigned int ndesc)
+			      struct msi_range *range)
 {
 	struct msi_desc *desc;
 	unsigned long idx;
 
 	lockdep_assert_held(&dev->msi.data->mutex);
 
-	xa_for_each_range(&dev->msi.data->store, idx, desc, base_index, base_index + ndesc - 1) {
+	xa_for_each_range(&dev->msi.data->store, idx, desc, range->first, range->last) {
 		if (msi_desc_match(desc, filter)) {
 			xa_erase(&dev->msi.data->store, idx);
 			msi_free_desc(desc);
@@ -746,17 +746,18 @@ int msi_domain_prepare_irqs(struct irq_d
 int msi_domain_populate_irqs(struct irq_domain *domain, struct device *dev,
 			     int virq_base, int nvec, msi_alloc_info_t *arg)
 {
+	struct msi_range range = { .first = virq_base, .last = virq_base + nvec - 1 };
 	struct msi_domain_info *info = domain->host_data;
 	struct msi_domain_ops *ops = info->ops;
 	struct msi_desc *desc;
 	int ret, virq;
 
 	msi_lock_descs(dev);
-	ret = msi_add_simple_msi_descs(dev, virq_base, nvec);
+	ret = msi_add_simple_msi_descs(dev, &range);
 	if (ret)
 		goto unlock;
 
-	for (virq = virq_base; virq < virq_base + nvec; virq++) {
+	for (virq = range.first; virq <= range.last; virq++) {
 		desc = xa_load(&dev->msi.data->store, virq);
 		desc->irq = virq;
 
@@ -773,7 +774,7 @@ int msi_domain_populate_irqs(struct irq_
 fail:
 	for (--virq; virq >= virq_base; virq--)
 		irq_domain_free_irqs_common(domain, virq, 1);
-	msi_free_msi_descs_range(dev, MSI_DESC_ALL, virq_base, nvec);
+	msi_free_msi_descs_range(dev, MSI_DESC_ALL, &range);
 unlock:
 	msi_unlock_descs(dev);
 	return ret;
@@ -932,14 +933,13 @@ int __msi_domain_alloc_irqs(struct irq_d
 	return 0;
 }
 
-static int msi_domain_add_simple_msi_descs(struct msi_domain_info *info,
-					   struct device *dev,
-					   unsigned int num_descs)
+static int msi_domain_add_simple_msi_descs(struct msi_domain_info *info, struct device *dev,
+					   struct msi_range *range)
 {
 	if (!(info->flags & MSI_FLAG_ALLOC_SIMPLE_MSI_DESCS))
 		return 0;
 
-	return msi_add_simple_msi_descs(dev, 0, num_descs);
+	return msi_add_simple_msi_descs(dev, range);
 }
 
 /**
@@ -964,7 +964,7 @@ int msi_domain_alloc_irqs_descs_locked(s
 
 	lockdep_assert_held(&dev->msi.data->mutex);
 
-	ret = msi_domain_add_simple_msi_descs(info, dev, range->ndesc);
+	ret = msi_domain_add_simple_msi_descs(info, dev, range);
 	if (ret)
 		return ret;
 
@@ -1017,11 +1017,11 @@ void __msi_domain_free_irqs(struct irq_d
 	}
 }
 
-static void msi_domain_free_msi_descs(struct msi_domain_info *info,
-				      struct device *dev)
+static void msi_domain_free_msi_descs(struct msi_domain_info *info, struct device *dev,
+				      struct msi_range *range)
 {
 	if (info->flags & MSI_FLAG_FREE_MSI_DESCS)
-		msi_free_msi_descs(dev);
+		msi_free_msi_descs_range(dev, MSI_DESC_ALL, range);
 }
 
 /**
@@ -1043,7 +1043,7 @@ void msi_domain_free_irqs_descs_locked(s
 	lockdep_assert_held(&dev->msi.data->mutex);
 
 	ops->domain_free_irqs(domain, dev, range);
-	msi_domain_free_msi_descs(info, dev);
+	msi_domain_free_msi_descs(info, dev, range);
 }
 
 /**


