Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D6172C85B
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 16:26:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547175.854444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8iUn-0001UT-FE; Mon, 12 Jun 2023 14:26:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547175.854444; Mon, 12 Jun 2023 14:26:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8iUn-0001SN-Aj; Mon, 12 Jun 2023 14:26:13 +0000
Received: by outflank-mailman (input) for mailman id 547175;
 Mon, 12 Jun 2023 14:26:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AcHT=CA=bombadil.srs.infradead.org=BATV+33f57c12507318cbaa86+7232+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1q8iUl-0001S2-HT
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 14:26:11 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11a9d0f2-092d-11ee-b232-6b7b168915f2;
 Mon, 12 Jun 2023 16:26:08 +0200 (CEST)
Received: from
 2a02-8389-2341-5b80-8c8c-28f8-1274-e038.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:8c8c:28f8:1274:e038] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1q8iUS-004I8p-2v; Mon, 12 Jun 2023 14:25:53 +0000
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
X-Inumbo-ID: 11a9d0f2-092d-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=Do07+ZJ8mt79MyKnagn3FmtuEPVS6qLM8Uvv604VtrU=; b=ft+LfENSbzDpGdR/jPu3Jnufmf
	IHfMnVhVYCDVxL4lsWCBWJNprt6qecPh6iVJH/jyJVtFumN4qbS/yfXinn70dOukq6yXFXA2M+RRH
	FxQpGw2Lk57s0+ygZfS5ucxKr9EfjhLyg81/6pzAN4HAsl67+sCPnuCdCkiJ2UUERt+DcZl7kUxYX
	1xyscFp19lM8RLbNmZhw1hpPskXnts+EK7+TobUzf3g8hRDwewyJipGeaMsQ0LGSpUwlEpT2Hp4jq
	ab/k68N1uDss72tLrlMmwIJaDI+iWY9G36Z1jHRVNlO48LAHDdfPieKLQl3MLtJDhnZggvllYttAA
	3vrSr1ng==;
From: Christoph Hellwig <hch@lst.de>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Cc: xen-devel@lists.xenproject.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] x86: always initialize xen-swiotlb when xen-pcifront is enabling
Date: Mon, 12 Jun 2023 16:25:41 +0200
Message-Id: <20230612142542.111581-3-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612142542.111581-1-hch@lst.de>
References: <20230612142542.111581-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Remove the dangerous late initialization of xen-swiotlb in
pci_xen_swiotlb_init_late and instead just always initialize
xen-swiotlb in the boot code if CONFIG_XEN_PCIDEV_FRONTEND is
enabled and Xen PV PCI is possible.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/x86/include/asm/xen/swiotlb-xen.h |  6 ------
 arch/x86/kernel/pci-dma.c              | 29 +++++++-------------------
 drivers/pci/xen-pcifront.c             |  6 ------
 3 files changed, 7 insertions(+), 34 deletions(-)

diff --git a/arch/x86/include/asm/xen/swiotlb-xen.h b/arch/x86/include/asm/xen/swiotlb-xen.h
index 77a2d19cc9909e..abde0f44df57dc 100644
--- a/arch/x86/include/asm/xen/swiotlb-xen.h
+++ b/arch/x86/include/asm/xen/swiotlb-xen.h
@@ -2,12 +2,6 @@
 #ifndef _ASM_X86_SWIOTLB_XEN_H
 #define _ASM_X86_SWIOTLB_XEN_H
 
-#ifdef CONFIG_SWIOTLB_XEN
-extern int pci_xen_swiotlb_init_late(void);
-#else
-static inline int pci_xen_swiotlb_init_late(void) { return -ENXIO; }
-#endif
-
 int xen_swiotlb_fixup(void *buf, unsigned long nslabs);
 int xen_create_contiguous_region(phys_addr_t pstart, unsigned int order,
 				unsigned int address_bits,
diff --git a/arch/x86/kernel/pci-dma.c b/arch/x86/kernel/pci-dma.c
index de6be0a3965ee4..f323d83e40a70b 100644
--- a/arch/x86/kernel/pci-dma.c
+++ b/arch/x86/kernel/pci-dma.c
@@ -72,9 +72,15 @@ static inline void __init pci_swiotlb_detect(void)
 #endif /* CONFIG_SWIOTLB */
 
 #ifdef CONFIG_SWIOTLB_XEN
+static bool xen_swiotlb_enabled(void)
+{
+	return xen_initial_domain() || x86_swiotlb_enable ||
+		(IS_ENABLED(CONFIG_XEN_PCIDEV_FRONTEND) && xen_pv_pci_possible);
+}
+
 static void __init pci_xen_swiotlb_init(void)
 {
-	if (!xen_initial_domain() && !x86_swiotlb_enable)
+	if (!xen_swiotlb_enabled())
 		return;
 	x86_swiotlb_enable = true;
 	x86_swiotlb_flags |= SWIOTLB_ANY;
@@ -83,27 +89,6 @@ static void __init pci_xen_swiotlb_init(void)
 	if (IS_ENABLED(CONFIG_PCI))
 		pci_request_acs();
 }
-
-int pci_xen_swiotlb_init_late(void)
-{
-	if (dma_ops == &xen_swiotlb_dma_ops)
-		return 0;
-
-	/* we can work with the default swiotlb */
-	if (!io_tlb_default_mem.nslabs) {
-		int rc = swiotlb_init_late(swiotlb_size_or_default(),
-					   GFP_KERNEL, xen_swiotlb_fixup);
-		if (rc < 0)
-			return rc;
-	}
-
-	/* XXX: this switches the dma ops under live devices! */
-	dma_ops = &xen_swiotlb_dma_ops;
-	if (IS_ENABLED(CONFIG_PCI))
-		pci_request_acs();
-	return 0;
-}
-EXPORT_SYMBOL_GPL(pci_xen_swiotlb_init_late);
 #else
 static inline void __init pci_xen_swiotlb_init(void)
 {
diff --git a/drivers/pci/xen-pcifront.c b/drivers/pci/xen-pcifront.c
index 83c0ab50676dff..11636634ae512f 100644
--- a/drivers/pci/xen-pcifront.c
+++ b/drivers/pci/xen-pcifront.c
@@ -22,7 +22,6 @@
 #include <linux/bitops.h>
 #include <linux/time.h>
 #include <linux/ktime.h>
-#include <linux/swiotlb.h>
 #include <xen/platform_pci.h>
 
 #include <asm/xen/swiotlb-xen.h>
@@ -669,11 +668,6 @@ static int pcifront_connect_and_init_dma(struct pcifront_device *pdev)
 
 	spin_unlock(&pcifront_dev_lock);
 
-	if (!err && !is_swiotlb_active(&pdev->xdev->dev)) {
-		err = pci_xen_swiotlb_init_late();
-		if (err)
-			dev_err(&pdev->xdev->dev, "Could not setup SWIOTLB!\n");
-	}
 	return err;
 }
 
-- 
2.39.2


