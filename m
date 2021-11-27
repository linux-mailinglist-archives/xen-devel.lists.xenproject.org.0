Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C12D45F998
	for <lists+xen-devel@lfdr.de>; Sat, 27 Nov 2021 02:25:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233615.405555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqmSO-0006mY-6z; Sat, 27 Nov 2021 01:24:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233615.405555; Sat, 27 Nov 2021 01:24:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqmSN-0006ga-T1; Sat, 27 Nov 2021 01:24:47 +0000
Received: by outflank-mailman (input) for mailman id 233615;
 Sat, 27 Nov 2021 01:24:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Erow=QO=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mqmSL-0003uw-JR
 for xen-devel@lists.xenproject.org; Sat, 27 Nov 2021 01:24:45 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd8ccc73-4f20-11ec-9787-a32c541c8605;
 Sat, 27 Nov 2021 02:24:44 +0100 (CET)
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
X-Inumbo-ID: cd8ccc73-4f20-11ec-9787-a32c541c8605
Message-ID: <20211127000919.004572849@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1637976284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=iXWx8ngjVm94paCMjL44qtncyzw3jmQTRYweVvwdUTE=;
	b=twc9E/k5sGMn2fquLHv5+7zfix6uLYi9RH9SGLZSSA3ABcOvbp0/gPOpQlesgzHkbj1UVu
	fxR6AoIcwrtz/nn3bycIRy8P9kAGaK0ECHfhbEqIdbz1o3vq7H1JdPjQaWggom9fcYLCdX
	BOmuzr15HeqHdEIDMKSLq/WavFlqpW/xYMSc3r2wN7DXzv+PNwO5cRgSi7yjS1wpb/86Ru
	gJmjSdRE0skAiQjFeQ3BBC/okRhBX5BOlbe4JLQChHLlOjJiIRqAKAnL9t8GF853DwnxyU
	l0iBSahv+YZe+ToUNkpkfYscK/wzeDb2wgYipZlnYU4lySHkxy2LdxVpk1XRIg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1637976284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=iXWx8ngjVm94paCMjL44qtncyzw3jmQTRYweVvwdUTE=;
	b=Cwze/7Fqot4zxUe/5Tt8x3Rdu1Qo6xyHVQISU76a2p6ptM3z6Ii3pkLaG0Yznt5n2sNBh3
	EqDN2aJVSQRqTdBA==
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
Subject: [patch 09/10] PCI/MSI: Provide pci_msix_expand_vectors[_at]()
References: <20211126233124.618283684@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Sat, 27 Nov 2021 02:24:44 +0100 (CET)

Provide a new interface which allows to expand the MSI-X vector space if
the underlying irq domain implementation supports it.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/pci/msi/msi.c |   41 +++++++++++++++++++++++++++++++++++++++++
 include/linux/pci.h   |   13 +++++++++++++
 2 files changed, 54 insertions(+)

--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -1025,6 +1025,47 @@ int pci_alloc_irq_vectors_affinity(struc
 EXPORT_SYMBOL(pci_alloc_irq_vectors_affinity);
 
 /**
+ * pci_msix_expand_vectors_at - Expand MSI-X interrupts for a device
+ *
+ * @dev:	PCI device to operate on
+ * @at:		Allocate at MSI-X index. If @at == PCI_MSI_EXPAND_AUTO
+ *		the function expands automatically after the last
+ *		active index.
+ * @nvec:	Number of vectors to allocate
+ *
+ * Expand the MSI-X vectors of a device after an initial enablement and
+ * allocation.
+ *
+ * Return: 0 if the allocation was successful, an error code otherwise.
+ */
+int pci_msix_expand_vectors_at(struct pci_dev *dev, unsigned int at, unsigned int nvec)
+{
+	struct msi_device_data *md = dev->dev.msi.data;
+	struct msi_range range = { .ndesc = nvec, };
+	unsigned int max_vecs;
+	int ret;
+
+	if (!pci_msi_enable || !dev || !dev->msix_enabled || !md)
+		return -ENOTSUPP;
+
+	if (!pci_msi_domain_supports_expand(dev))
+		return -ENOTSUPP;
+
+	max_vecs = pci_msix_vec_count(dev);
+	if (!nvec || nvec > max_vecs)
+		return -EINVAL;
+
+	range.first = at == PCI_MSIX_EXPAND_AUTO ? md->num_descs : at;
+
+	if (range.first >= max_vecs || nvec > max_vecs - range.first)
+		return -ENOSPC;
+
+	ret = msix_setup_interrupts(dev, dev->msix_base, &range, NULL, NULL, true);
+	return ret <= 0 ? ret : -ENOSPC;;
+}
+EXPORT_SYMBOL_GPL(pci_msix_expand_vectors_at);
+
+/**
  * pci_free_irq_vectors - free previously allocated IRQs for a device
  * @dev:		PCI device to operate on
  *
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1534,6 +1534,7 @@ static inline int pci_enable_msix_exact(
 int pci_alloc_irq_vectors_affinity(struct pci_dev *dev, unsigned int min_vecs,
 				   unsigned int max_vecs, unsigned int flags,
 				   struct irq_affinity *affd);
+int pci_msix_expand_vectors_at(struct pci_dev *dev, unsigned int at, unsigned int nvec);
 
 void pci_free_irq_vectors(struct pci_dev *dev);
 int pci_irq_vector(struct pci_dev *dev, unsigned int nr);
@@ -1565,6 +1566,11 @@ pci_alloc_irq_vectors_affinity(struct pc
 	return -ENOSPC;
 }
 
+static inline int pci_msix_expand_vectors_at(struct pci_dev *dev, unsigned int at, unsigned int nvec)
+{
+	return -ENOTSUPP;
+}
+
 static inline void pci_free_irq_vectors(struct pci_dev *dev)
 {
 }
@@ -1582,6 +1588,13 @@ static inline const struct cpumask *pci_
 }
 #endif
 
+#define PCI_MSIX_EXPAND_AUTO	(UINT_MAX)
+
+static inline int pci_msix_expand_vectors(struct pci_dev *dev, unsigned int nvec)
+{
+	return pci_msix_expand_vectors_at(dev, PCI_MSIX_EXPAND_AUTO, nvec);
+}
+
 /**
  * pci_irqd_intx_xlate() - Translate PCI INTx value to an IRQ domain hwirq
  * @d: the INTx IRQ domain


