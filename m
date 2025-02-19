Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1CAA3B842
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 10:22:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892527.1301506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkgI3-0000tb-8l; Wed, 19 Feb 2025 09:22:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892527.1301506; Wed, 19 Feb 2025 09:22:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkgI3-0000rs-5v; Wed, 19 Feb 2025 09:22:47 +0000
Received: by outflank-mailman (input) for mailman id 892527;
 Wed, 19 Feb 2025 09:22:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bQLC=VK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tkgI2-00082q-4z
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 09:22:46 +0000
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [2607:f8b0:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 136f6605-eea3-11ef-9aa8-95dc52dad729;
 Wed, 19 Feb 2025 10:22:45 +0100 (CET)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-220dc3831e3so10514835ad.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 01:22:45 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7325b1afd0esm9030926b3a.137.2025.02.19.01.22.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 01:22:43 -0800 (PST)
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
X-Inumbo-ID: 136f6605-eea3-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739956964; x=1740561764; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YnGtO5JguyJMDAVVd/amsK5Mk4hYl7NsHvQivQkdUR8=;
        b=rA808aXj0q9HVaUg8QNyKkgwAj2VmOcrbTBiRwUo/l8eoT2vcBUeBmc7Jb6lJQczhI
         3UBkGnMAGOkmdNLThZpdzV0C8iCe1ulE+awY0lBZIc9fFmtRYyUGNx3pIHAovapdIAmd
         Tw+2g5cnHaWA4BaTt9ng6194Cqp2Jqt8DW458=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739956964; x=1740561764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YnGtO5JguyJMDAVVd/amsK5Mk4hYl7NsHvQivQkdUR8=;
        b=GuHaNtqUkKS/ieumZ22kn6nUsnbCAOOxxFJ6bZQhrm0Bi4pBWtdHLHClveA7WG+nV2
         loq34iEiXVsX3PA9Kht2qoGoNT7rqh8hPznznrnav2547859IYNg2bUcQPESJ84td0Yh
         ByZwK9Q27cOHXHSiNLmF/ZlvGfJ+u9Xa4Ml0nbxtJYDBZzIPVtfBo84y0pThRLkScNMB
         AQwj5YJnfCOSFLzSsodmXDueISxVoVcuCJcm1O+LIhPQD6YA80ZCOe/2hRpesWHsVezl
         W6PNBRjYZykmIsB+UvwE+irnUyHhniv/IKyVp+G/hxEeQGvm3HiuStN+UYGk36LLxBWV
         biMw==
X-Forwarded-Encrypted: i=1; AJvYcCUPk0Q/YMgEqZ9oAlc/QfxP5+rXiG992WC2zLQXDKd97trTIzLQGDYeN56u31KiPA3GNyxfZ5xiDIg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw7BKfA3B9sDs+6DZ9qnj8rv0xDi3Z6PxBz83j43VpVl9z/9WFb
	QLJl5MoZwDQCPnoyQsqVh22dr7u9IJmyHI0JI7uJ2Rc7BgVAlP/QhbcBJJ7SRQY=
X-Gm-Gg: ASbGncu9KhMB7jBm3vcHI4TbTmGDsgf64GX6/ZeacV6yFSwxCLFd3k1va1N4hrgi9Zx
	1XenXfbxEYqvoJf+M3XynwCVjiDT/M8nPPKli+sRfw2dXl7m1721vCZFCPW1TvR8o1k/3O9+6gC
	9KSWv2eMQP7rPUxup1DNVukyBhWwqbadTAOhU6LQfKOQ5s6PZu2Ih618Du0f6YbH1Vxh028v9jf
	zlIL6AeaCvE5mtq+1AXHpOWC/locSqzfMs9Wils75O7KUyws7fFyZPByD0c9xWQ+YeMPH8/06TY
	Og5otsTpm7LMN6Qx2Mif
X-Google-Smtp-Source: AGHT+IEyC15TnZIAvUKjVtLm/x4/Lo6Nn8PENAHDVB3FMrtCAy7HQuzopUgCjPn21zM5n19hoHeGqw==
X-Received: by 2002:a05:6a00:9297:b0:727:39a4:30cc with SMTP id d2e1a72fcca58-7329cd75fe4mr5153986b3a.1.1739956963747;
        Wed, 19 Feb 2025 01:22:43 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-pci@vger.kernel.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Juergen Gross <jgross@suse.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v3 3/3] PCI/MSI: Convert pci_msi_ignore_mask to per MSI domain flag
Date: Wed, 19 Feb 2025 10:20:57 +0100
Message-ID: <20250219092059.90850-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250219092059.90850-1-roger.pau@citrix.com>
References: <20250219092059.90850-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Setting pci_msi_ignore_mask inhibits the toggling of the mask bit for both
MSI and MSI-X entries globally, regardless of the IRQ chip they are using.
Only Xen sets the pci_msi_ignore_mask when routing physical interrupts over
event channels, to prevent PCI code from attempting to toggle the maskbit,
as it's Xen that controls the bit.

However, the pci_msi_ignore_mask being global will affect devices that use
MSI interrupts but are not routing those interrupts over event channels
(not using the Xen pIRQ chip).  One example is devices behind a VMD PCI
bridge.  In that scenario the VMD bridge configures MSI(-X) using the
normal IRQ chip (the pIRQ one in the Xen case), and devices behind the
bridge configure the MSI entries using indexes into the VMD bridge MSI
table.  The VMD bridge then demultiplexes such interrupts and delivers to
the destination device(s).  Having pci_msi_ignore_mask set in that scenario
prevents (un)masking of MSI entries for devices behind the VMD bridge.

Move the signaling of no entry masking into the MSI domain flags, as that
allows setting it on a per-domain basis.  Set it for the Xen MSI domain
that uses the pIRQ chip, while leaving it unset for the rest of the
cases.

Remove pci_msi_ignore_mask at once, since it was only used by Xen code, and
with Xen dropping usage the variable is unneeded.

This fixes using devices behind a VMD bridge on Xen PV hardware domains.

Albeit Devices behind a VMD bridge are not known to Xen, that doesn't mean
Linux cannot use them.  By inhibiting the usage of
VMD_FEAT_CAN_BYPASS_MSI_REMAP and the removal of the pci_msi_ignore_mask
bodge devices behind a VMD bridge do work fine when use from a Linux Xen
hardware domain.  That's the whole point of the series.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Juergen Gross <jgross@suse.com>
---
Changes since v2:
 - Fix subject line.

Changes since v1:
 - Fix build.
 - Expand commit message.
---
 arch/x86/pci/xen.c    |  8 ++------
 drivers/pci/msi/msi.c | 37 +++++++++++++++++++++----------------
 include/linux/msi.h   |  3 ++-
 kernel/irq/msi.c      |  2 +-
 4 files changed, 26 insertions(+), 24 deletions(-)

diff --git a/arch/x86/pci/xen.c b/arch/x86/pci/xen.c
index 0f2fe524f60d..b8755cde2419 100644
--- a/arch/x86/pci/xen.c
+++ b/arch/x86/pci/xen.c
@@ -436,7 +436,8 @@ static struct msi_domain_ops xen_pci_msi_domain_ops = {
 };
 
 static struct msi_domain_info xen_pci_msi_domain_info = {
-	.flags			= MSI_FLAG_PCI_MSIX | MSI_FLAG_FREE_MSI_DESCS | MSI_FLAG_DEV_SYSFS,
+	.flags			= MSI_FLAG_PCI_MSIX | MSI_FLAG_FREE_MSI_DESCS |
+				  MSI_FLAG_DEV_SYSFS | MSI_FLAG_NO_MASK,
 	.ops			= &xen_pci_msi_domain_ops,
 };
 
@@ -484,11 +485,6 @@ static __init void xen_setup_pci_msi(void)
 	 * in allocating the native domain and never use it.
 	 */
 	x86_init.irqs.create_pci_msi_domain = xen_create_pci_msi_domain;
-	/*
-	 * With XEN PIRQ/Eventchannels in use PCI/MSI[-X] masking is solely
-	 * controlled by the hypervisor.
-	 */
-	pci_msi_ignore_mask = 1;
 }
 
 #else /* CONFIG_PCI_MSI */
diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
index 2f647cac4cae..4c8c2b57b5f6 100644
--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -10,12 +10,12 @@
 #include <linux/err.h>
 #include <linux/export.h>
 #include <linux/irq.h>
+#include <linux/irqdomain.h>
 
 #include "../pci.h"
 #include "msi.h"
 
 int pci_msi_enable = 1;
-int pci_msi_ignore_mask;
 
 /**
  * pci_msi_supported - check whether MSI may be enabled on a device
@@ -285,6 +285,8 @@ static void pci_msi_set_enable(struct pci_dev *dev, int enable)
 static int msi_setup_msi_desc(struct pci_dev *dev, int nvec,
 			      struct irq_affinity_desc *masks)
 {
+	const struct irq_domain *d = dev_get_msi_domain(&dev->dev);
+	const struct msi_domain_info *info = d->host_data;
 	struct msi_desc desc;
 	u16 control;
 
@@ -295,8 +297,7 @@ static int msi_setup_msi_desc(struct pci_dev *dev, int nvec,
 	/* Lies, damned lies, and MSIs */
 	if (dev->dev_flags & PCI_DEV_FLAGS_HAS_MSI_MASKING)
 		control |= PCI_MSI_FLAGS_MASKBIT;
-	/* Respect XEN's mask disabling */
-	if (pci_msi_ignore_mask)
+	if (info->flags & MSI_FLAG_NO_MASK)
 		control &= ~PCI_MSI_FLAGS_MASKBIT;
 
 	desc.nvec_used			= nvec;
@@ -604,12 +605,15 @@ static void __iomem *msix_map_region(struct pci_dev *dev,
  */
 void msix_prepare_msi_desc(struct pci_dev *dev, struct msi_desc *desc)
 {
+	const struct irq_domain *d = dev_get_msi_domain(&dev->dev);
+	const struct msi_domain_info *info = d->host_data;
+
 	desc->nvec_used				= 1;
 	desc->pci.msi_attrib.is_msix		= 1;
 	desc->pci.msi_attrib.is_64		= 1;
 	desc->pci.msi_attrib.default_irq	= dev->irq;
 	desc->pci.mask_base			= dev->msix_base;
-	desc->pci.msi_attrib.can_mask		= !pci_msi_ignore_mask &&
+	desc->pci.msi_attrib.can_mask		= !(info->flags & MSI_FLAG_NO_MASK) &&
 						  !desc->pci.msi_attrib.is_virtual;
 
 	if (desc->pci.msi_attrib.can_mask) {
@@ -659,9 +663,6 @@ static void msix_mask_all(void __iomem *base, int tsize)
 	u32 ctrl = PCI_MSIX_ENTRY_CTRL_MASKBIT;
 	int i;
 
-	if (pci_msi_ignore_mask)
-		return;
-
 	for (i = 0; i < tsize; i++, base += PCI_MSIX_ENTRY_SIZE)
 		writel(ctrl, base + PCI_MSIX_ENTRY_VECTOR_CTRL);
 }
@@ -714,6 +715,8 @@ static int msix_setup_interrupts(struct pci_dev *dev, struct msix_entry *entries
 static int msix_capability_init(struct pci_dev *dev, struct msix_entry *entries,
 				int nvec, struct irq_affinity *affd)
 {
+	const struct irq_domain *d = dev_get_msi_domain(&dev->dev);
+	const struct msi_domain_info *info = d->host_data;
 	int ret, tsize;
 	u16 control;
 
@@ -744,15 +747,17 @@ static int msix_capability_init(struct pci_dev *dev, struct msix_entry *entries,
 	/* Disable INTX */
 	pci_intx_for_msi(dev, 0);
 
-	/*
-	 * Ensure that all table entries are masked to prevent
-	 * stale entries from firing in a crash kernel.
-	 *
-	 * Done late to deal with a broken Marvell NVME device
-	 * which takes the MSI-X mask bits into account even
-	 * when MSI-X is disabled, which prevents MSI delivery.
-	 */
-	msix_mask_all(dev->msix_base, tsize);
+	if (!(info->flags & MSI_FLAG_NO_MASK)) {
+		/*
+		 * Ensure that all table entries are masked to prevent
+		 * stale entries from firing in a crash kernel.
+		 *
+		 * Done late to deal with a broken Marvell NVME device
+		 * which takes the MSI-X mask bits into account even
+		 * when MSI-X is disabled, which prevents MSI delivery.
+		 */
+		msix_mask_all(dev->msix_base, tsize);
+	}
 	pci_msix_clear_and_set_ctrl(dev, PCI_MSIX_FLAGS_MASKALL, 0);
 
 	pcibios_free_irq(dev);
diff --git a/include/linux/msi.h b/include/linux/msi.h
index b10093c4d00e..59a421fc42bf 100644
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -73,7 +73,6 @@ struct msi_msg {
 	};
 };
 
-extern int pci_msi_ignore_mask;
 /* Helper functions */
 struct msi_desc;
 struct pci_dev;
@@ -556,6 +555,8 @@ enum {
 	MSI_FLAG_PCI_MSIX_ALLOC_DYN	= (1 << 20),
 	/* PCI MSIs cannot be steered separately to CPU cores */
 	MSI_FLAG_NO_AFFINITY		= (1 << 21),
+	/* Inhibit usage of entry masking */
+	MSI_FLAG_NO_MASK		= (1 << 22),
 };
 
 /**
diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
index 396a067a8a56..7682c36cbccc 100644
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -1143,7 +1143,7 @@ static bool msi_check_reservation_mode(struct irq_domain *domain,
 	if (!(info->flags & MSI_FLAG_MUST_REACTIVATE))
 		return false;
 
-	if (IS_ENABLED(CONFIG_PCI_MSI) && pci_msi_ignore_mask)
+	if (info->flags & MSI_FLAG_NO_MASK)
 		return false;
 
 	/*
-- 
2.46.0


