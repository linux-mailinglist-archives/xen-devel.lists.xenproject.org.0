Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85951A092D4
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 15:02:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869665.1281126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWFau-0000yY-Nn; Fri, 10 Jan 2025 14:02:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869665.1281126; Fri, 10 Jan 2025 14:02:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWFau-0000wV-Jl; Fri, 10 Jan 2025 14:02:36 +0000
Received: by outflank-mailman (input) for mailman id 869665;
 Fri, 10 Jan 2025 14:02:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J0bo=UC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tWFat-0000qj-84
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 14:02:35 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8944a9ad-cf5b-11ef-99a4-01e77a169b0f;
 Fri, 10 Jan 2025 15:02:32 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-aaf3c3c104fso350026766b.1
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jan 2025 06:02:32 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c95b09a6sm168510666b.145.2025.01.10.06.02.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 06:02:01 -0800 (PST)
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
X-Inumbo-ID: 8944a9ad-cf5b-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736517752; x=1737122552; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bXUrrXc7otEMLuPDik4Ot8RLIKG6b+qL1a+y6J/W2hw=;
        b=ZE+h3xjGAwiJ3R84uq9/m644x6SgMeYV7lj0yToJEQxX7r9SyQhVaXR0RZgnsKvabT
         zby3pVpoeXQsddclVE1LK8zc56r9Ndb18Hut/pSbjMAP66fnAp3MtjmpnGXzxWuCD7ti
         nBS047weNMoY2AfdsnPFDcPrY6ctiP1MxNoqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736517752; x=1737122552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bXUrrXc7otEMLuPDik4Ot8RLIKG6b+qL1a+y6J/W2hw=;
        b=s9joM2dHgDMZy5430WrymUdTcYU2bOJv89j8lbmFlQspZgUVEQDS89GzYNq7K1T6RP
         R8HKOrtsBdX0YOkAjCzvm5jq5CuGPdB1eMWZqrr+4X5fKYQK3B2WGmHL3WbKZRdxa2Er
         AAZlsyuJhhT3Q9SmMwaUf2mNpKbNy25YWUicAocN/84i+7CEiBCqTo5CVjXNKWRpTWLo
         EdcyOoHUDWjCtCP4g/d9hhpghlKvZlb33eiirR/n88Z26yzUyHdTILQo/m3fmhDNKzYZ
         wRmeH+LD7pv3iI/AZ6urpsU9su61JoKgR7JoayWqC/HxKkyPX3vtOhYo2f2sgFfKcLWd
         ZFFw==
X-Forwarded-Encrypted: i=1; AJvYcCVCo9Kmb5CUA1meC0gg7Da72G+YX819ZpJjtyz3sjCnwd+nI9iwCsa3oATUrKjieLViaN/mctfsx9s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyVLfxRUr+m4IYV3AwxH5O6PvhWuMqjLWvz4OIqoDlN57PT0T6U
	MN0lcuYZL7CDd9rPOtQHbXINxcI2+AvhsrRKVQNURIRUt8HYLaHpQmP39rOKmt8=
X-Gm-Gg: ASbGnctWGH8U035zXDbgcZXis3IhvNJVBo5qVCO8LZpmOMtneUDp46r8F6hWuluQlTo
	237ZsJG5lsjdMOHShO/LxAoUOyZtl6LI52/Xf5rm3ZrUuPHp1fJYulXdiUHT5lV4PumsUVLhAkr
	+C4U53Cl0YRB4XATWWJgkkib5QA29x49uYR1/O+UGLRgACpaiIHbehtzrAY/TD5mLV+L2fg2LZL
	I1B6x8UAgFpKHiA1xc2tk/tLHpVZO5iE3kuqDWmfm8ONvJvsHbF+qegiq+IgOUQE3E=
X-Google-Smtp-Source: AGHT+IGy+s65n1QI7kpn2XGnPHW44cwj7nn4OvI00oi9CML5cFM7+b0vWH7nmPweruWMP0Y17IUp2g==
X-Received: by 2002:a17:906:7311:b0:a9a:bbcc:5092 with SMTP id a640c23a62f3a-ab2ab6bfb7amr910685366b.39.1736517721914;
        Fri, 10 Jan 2025 06:02:01 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-pci@vger.kernel.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH 3/3] pci/msi: remove pci_msi_ignore_mask
Date: Fri, 10 Jan 2025 15:01:50 +0100
Message-ID: <20250110140152.27624-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250110140152.27624-1-roger.pau@citrix.com>
References: <20250110140152.27624-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Setting pci_msi_ignore_mask inhibits the toggling of the mask bit for both MSI
and MSI-X entries globally, regardless of the IRQ chip they are using.  Only
Xen sets the pci_msi_ignore_mask when routing physical interrupts over event
channels, to prevent PCI code from attempting to toggle the maskbit, as it's
Xen that controls the bit.

However, the pci_msi_ignore_mask being global will affect devices that use MSI
interrupts but are not routing those interrupts over event channels (not using
the Xen pIRQ chip).  One example is devices behind a VMD PCI bridge.  In that
scenario the VMD bridge configures MSI(-X) using the normal IRQ chip (the pIRQ
one in the Xen case), and devices behind the bridge configure the MSI entries
using indexes into the VMD bridge MSI table.  The VMD bridge then demultiplexes
such interrupts and delivers to the destination device(s).  Having
pci_msi_ignore_mask set in that scenario prevents (un)masking of MSI entries
for devices behind the VMD bridge.

Move the signaling of no entry masking into the MSI domain flags, as that
allows setting it on a per-domain basis.  Set it for the Xen MSI domain that
uses the pIRQ chip, while leaving it unset for the rest of the cases.

Remove pci_msi_ignore_mask at once, since it was only used by Xen code, and
with Xen dropping usage the variable is unneeded.

This fixes using devices behind a VMD bridge on Xen PV hardware domains.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 arch/x86/pci/xen.c    |  8 ++------
 drivers/pci/msi/msi.c | 36 ++++++++++++++++++++----------------
 include/linux/msi.h   |  3 ++-
 kernel/irq/msi.c      |  2 +-
 4 files changed, 25 insertions(+), 24 deletions(-)

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
index 3a45879d85db..cb42298f6a97 100644
--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -15,7 +15,6 @@
 #include "msi.h"
 
 int pci_msi_enable = 1;
-int pci_msi_ignore_mask;
 
 /**
  * pci_msi_supported - check whether MSI may be enabled on a device
@@ -285,6 +284,8 @@ static void pci_msi_set_enable(struct pci_dev *dev, int enable)
 static int msi_setup_msi_desc(struct pci_dev *dev, int nvec,
 			      struct irq_affinity_desc *masks)
 {
+	const struct irq_domain *d = dev_get_msi_domain(&dev->dev);
+	const struct msi_domain_info *info = d->host_data;
 	struct msi_desc desc;
 	u16 control;
 
@@ -295,8 +296,7 @@ static int msi_setup_msi_desc(struct pci_dev *dev, int nvec,
 	/* Lies, damned lies, and MSIs */
 	if (dev->dev_flags & PCI_DEV_FLAGS_HAS_MSI_MASKING)
 		control |= PCI_MSI_FLAGS_MASKBIT;
-	/* Respect XEN's mask disabling */
-	if (pci_msi_ignore_mask)
+	if (info->flags & MSI_FLAG_NO_MASK)
 		control &= ~PCI_MSI_FLAGS_MASKBIT;
 
 	desc.nvec_used			= nvec;
@@ -600,12 +600,15 @@ static void __iomem *msix_map_region(struct pci_dev *dev,
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
@@ -655,9 +658,6 @@ static void msix_mask_all(void __iomem *base, int tsize)
 	u32 ctrl = PCI_MSIX_ENTRY_CTRL_MASKBIT;
 	int i;
 
-	if (pci_msi_ignore_mask)
-		return;
-
 	for (i = 0; i < tsize; i++, base += PCI_MSIX_ENTRY_SIZE)
 		writel(ctrl, base + PCI_MSIX_ENTRY_VECTOR_CTRL);
 }
@@ -710,6 +710,8 @@ static int msix_setup_interrupts(struct pci_dev *dev, struct msix_entry *entries
 static int msix_capability_init(struct pci_dev *dev, struct msix_entry *entries,
 				int nvec, struct irq_affinity *affd)
 {
+	const struct irq_domain *d = dev_get_msi_domain(&dev->dev);
+	const struct msi_domain_info *info = d->host_data;
 	int ret, tsize;
 	u16 control;
 
@@ -740,15 +742,17 @@ static int msix_capability_init(struct pci_dev *dev, struct msix_entry *entries,
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


