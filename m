Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDC03125DB
	for <lists+xen-devel@lfdr.de>; Sun,  7 Feb 2021 17:10:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82435.152304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l8mdh-0005DN-P3; Sun, 07 Feb 2021 16:10:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82435.152304; Sun, 07 Feb 2021 16:10:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l8mdh-0005Cg-Ku; Sun, 07 Feb 2021 16:10:21 +0000
Received: by outflank-mailman (input) for mailman id 82435;
 Sun, 07 Feb 2021 16:10:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QIBx=HJ=casper.srs.infradead.org=batv+661ee30cee4f8a507613+6377+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1l8mdg-00042X-J4
 for xen-devel@lists.xenproject.org; Sun, 07 Feb 2021 16:10:20 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d2647eb6-c94a-4370-8790-ccad487df9e6;
 Sun, 07 Feb 2021 16:09:55 +0000 (UTC)
Received: from [2001:4bb8:184:7d04:4590:5583:6cb7:77c7] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1l8mdB-004tnV-CW; Sun, 07 Feb 2021 16:09:50 +0000
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
X-Inumbo-ID: d2647eb6-c94a-4370-8790-ccad487df9e6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=dDMIGfzIheGO5qFy1hXSQ2rWGLVI0aCG/glNZ/fxGYA=; b=guK83sRp0sI706y5mxJR7c8Pyy
	I0k15MXABcCNb5NEG69YACE/elWwduL8+TB2gYY4qqDRJT7Ow5ehxVFKS98rlqb7410fT5kiZVPVs
	XWmf3PL6WA1YDRPc0JnAY7nt2dm5+tymJmEKsHBLCs/niiW+rjs6JlCMuIgAjalYzE7hv9szyDn8v
	4UAan3aXO6d3UJ2YEi879p1eGENwljDVNpNPZcGlN/Z2PgtdbU5lU1kiBj5+CJ4x+JUzIT56pToKx
	uSTNK1JWZPJb9mVrp+d+ESHhLpdpPP63KMEfrMlqOTUJA7NT2GDEmdcJimjaR7z938DAJ3KSjqGDN
	ChpXeE8Q==;
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Dongli Zhang <dongli.zhang@oracle.com>,
	Claire Chang <tientzu@chromium.org>,
	xen-devel@lists.xenproject.org,
	linuxppc-dev@lists.ozlabs.org,
	iommu@lists.linux-foundation.org
Subject: [PATCH 7/8] xen-swiotlb: split xen_swiotlb_init
Date: Sun,  7 Feb 2021 17:09:33 +0100
Message-Id: <20210207160934.2955931-8-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210207160934.2955931-1-hch@lst.de>
References: <20210207160934.2955931-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Split xen_swiotlb_init into a normal an an early case.  That makes both
much simpler and more readable, and also allows marking the early
code as __init and x86-only.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/arm/xen/mm.c              |   2 +-
 arch/x86/xen/pci-swiotlb-xen.c |   4 +-
 drivers/xen/swiotlb-xen.c      | 124 +++++++++++++++++++--------------
 include/xen/swiotlb-xen.h      |   3 +-
 4 files changed, 75 insertions(+), 58 deletions(-)

diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
index 467fa225c3d0ed..aae950cd053fea 100644
--- a/arch/arm/xen/mm.c
+++ b/arch/arm/xen/mm.c
@@ -140,7 +140,7 @@ static int __init xen_mm_init(void)
 	struct gnttab_cache_flush cflush;
 	if (!xen_initial_domain())
 		return 0;
-	xen_swiotlb_init(1, false);
+	xen_swiotlb_init();
 
 	cflush.op = 0;
 	cflush.a.dev_bus_addr = 0;
diff --git a/arch/x86/xen/pci-swiotlb-xen.c b/arch/x86/xen/pci-swiotlb-xen.c
index 19ae3e4fe4e98e..54f9aa7e845739 100644
--- a/arch/x86/xen/pci-swiotlb-xen.c
+++ b/arch/x86/xen/pci-swiotlb-xen.c
@@ -59,7 +59,7 @@ int __init pci_xen_swiotlb_detect(void)
 void __init pci_xen_swiotlb_init(void)
 {
 	if (xen_swiotlb) {
-		xen_swiotlb_init(1, true /* early */);
+		xen_swiotlb_init_early();
 		dma_ops = &xen_swiotlb_dma_ops;
 
 #ifdef CONFIG_PCI
@@ -76,7 +76,7 @@ int pci_xen_swiotlb_init_late(void)
 	if (xen_swiotlb)
 		return 0;
 
-	rc = xen_swiotlb_init(1, false /* late */);
+	rc = xen_swiotlb_init();
 	if (rc)
 		return rc;
 
diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index e6c8556e879ee6..b2d9e77059bf5a 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -156,96 +156,112 @@ static const char *xen_swiotlb_error(enum xen_swiotlb_err err)
 
 #define DEFAULT_NSLABS		ALIGN(SZ_64M >> IO_TLB_SHIFT, IO_TLB_SEGSIZE)
 
-int __ref xen_swiotlb_init(int verbose, bool early)
+int __ref xen_swiotlb_init(void)
 {
-	unsigned long bytes, order;
-	int rc = -ENOMEM;
 	enum xen_swiotlb_err m_ret = XEN_SWIOTLB_UNKNOWN;
+	unsigned long nslabs, bytes, order;
 	unsigned int repeat = 3;
+	int rc = -ENOMEM;
 	char *start;
-	unsigned long nslabs;
 
 	nslabs = swiotlb_nr_tbl();
-retry:
 	if (!nslabs)
 		nslabs = DEFAULT_NSLABS;
+retry:
+	m_ret = XEN_SWIOTLB_ENOMEM;
 	bytes = nslabs << IO_TLB_SHIFT;
 	order = get_order(bytes);
 
 	/*
 	 * Get IO TLB memory from any location.
 	 */
-	if (early) {
-		start = memblock_alloc(PAGE_ALIGN(bytes),
-						  PAGE_SIZE);
-		if (!start)
-			panic("%s: Failed to allocate %lu bytes align=0x%lx\n",
-			      __func__, PAGE_ALIGN(bytes), PAGE_SIZE);
-	} else {
 #define SLABS_PER_PAGE (1 << (PAGE_SHIFT - IO_TLB_SHIFT))
 #define IO_TLB_MIN_SLABS ((1<<20) >> IO_TLB_SHIFT)
-		while ((SLABS_PER_PAGE << order) > IO_TLB_MIN_SLABS) {
-			start = (void *)xen_get_swiotlb_free_pages(order);
-			if (start)
-				break;
-			order--;
-		}
-		if (order != get_order(bytes)) {
-			pr_warn("Warning: only able to allocate %ld MB for software IO TLB\n",
-				(PAGE_SIZE << order) >> 20);
-			nslabs = SLABS_PER_PAGE << order;
-			bytes = nslabs << IO_TLB_SHIFT;
-		}
+	while ((SLABS_PER_PAGE << order) > IO_TLB_MIN_SLABS) {
+		start = (void *)xen_get_swiotlb_free_pages(order);
+		if (start)
+			break;
+		order--;
 	}
-	if (!start) {
-		m_ret = XEN_SWIOTLB_ENOMEM;
+	if (!start)
 		goto error;
+	if (order != get_order(bytes)) {
+		pr_warn("Warning: only able to allocate %ld MB for software IO TLB\n",
+			(PAGE_SIZE << order) >> 20);
+		nslabs = SLABS_PER_PAGE << order;
+		bytes = nslabs << IO_TLB_SHIFT;
 	}
+
 	/*
 	 * And replace that memory with pages under 4GB.
 	 */
-	rc = xen_swiotlb_fixup(start,
-			       bytes,
-			       nslabs);
+	rc = xen_swiotlb_fixup(start, bytes, nslabs);
 	if (rc) {
-		if (early)
-			memblock_free(__pa(start),
-				      PAGE_ALIGN(bytes));
-		else {
-			free_pages((unsigned long)start, order);
-			start = NULL;
-		}
+		free_pages((unsigned long)start, order);
 		m_ret = XEN_SWIOTLB_EFIXUP;
 		goto error;
 	}
-	if (early) {
-		if (swiotlb_init_with_tbl(start, nslabs,
-			 verbose))
-			panic("Cannot allocate SWIOTLB buffer");
-		rc = 0;
-	} else
-		rc = swiotlb_late_init_with_tbl(start, nslabs);
-
-	if (!rc)
-		swiotlb_set_max_segment(PAGE_SIZE);
-
-	return rc;
+	rc = swiotlb_late_init_with_tbl(start, nslabs);
+	if (rc)
+		return rc;
+	swiotlb_set_max_segment(PAGE_SIZE);
+	return 0;
 error:
 	if (repeat--) {
-		nslabs = max(1024UL, /* Min is 2MB */
-					(nslabs >> 1));
+		/* Min is 2MB */
+		nslabs = max(1024UL, (nslabs >> 1));
 		pr_info("Lowering to %luMB\n",
 			(nslabs << IO_TLB_SHIFT) >> 20);
 		goto retry;
 	}
 	pr_err("%s (rc:%d)\n", xen_swiotlb_error(m_ret), rc);
-	if (early)
-		panic("%s (rc:%d)", xen_swiotlb_error(m_ret), rc);
-	else
-		free_pages((unsigned long)start, order);
+	free_pages((unsigned long)start, order);
 	return rc;
 }
 
+#ifdef CONFIG_X86
+void __init xen_swiotlb_init_early(void)
+{
+	unsigned long nslabs, bytes;
+	unsigned int repeat = 3;
+	char *start;
+	int rc;
+
+	nslabs = swiotlb_nr_tbl();
+	if (!nslabs)
+		nslabs = DEFAULT_NSLABS;
+retry:
+	/*
+	 * Get IO TLB memory from any location.
+	 */
+	bytes = nslabs << IO_TLB_SHIFT;
+	start = memblock_alloc(PAGE_ALIGN(bytes), PAGE_SIZE);
+	if (!start)
+		panic("%s: Failed to allocate %lu bytes align=0x%lx\n",
+		      __func__, PAGE_ALIGN(bytes), PAGE_SIZE);
+
+	/*
+	 * And replace that memory with pages under 4GB.
+	 */
+	rc = xen_swiotlb_fixup(start, bytes, nslabs);
+	if (rc) {
+		memblock_free(__pa(start), PAGE_ALIGN(bytes));
+		if (repeat--) {
+			/* Min is 2MB */
+			nslabs = max(1024UL, (nslabs >> 1));
+			pr_info("Lowering to %luMB\n",
+				(nslabs << IO_TLB_SHIFT) >> 20);
+			goto retry;
+		}
+		panic("%s (rc:%d)", xen_swiotlb_error(XEN_SWIOTLB_EFIXUP), rc);
+	}
+
+	if (swiotlb_init_with_tbl(start, nslabs, false))
+		panic("Cannot allocate SWIOTLB buffer");
+	swiotlb_set_max_segment(PAGE_SIZE);
+}
+#endif /* CONFIG_X86 */
+
 static void *
 xen_swiotlb_alloc_coherent(struct device *hwdev, size_t size,
 			   dma_addr_t *dma_handle, gfp_t flags,
diff --git a/include/xen/swiotlb-xen.h b/include/xen/swiotlb-xen.h
index d5eaf9d682b804..6206b1ec99168a 100644
--- a/include/xen/swiotlb-xen.h
+++ b/include/xen/swiotlb-xen.h
@@ -9,7 +9,8 @@ void xen_dma_sync_for_cpu(struct device *dev, dma_addr_t handle,
 void xen_dma_sync_for_device(struct device *dev, dma_addr_t handle,
 			     size_t size, enum dma_data_direction dir);
 
-extern int xen_swiotlb_init(int verbose, bool early);
+int xen_swiotlb_init(void);
+void __init xen_swiotlb_init_early(void);
 extern const struct dma_map_ops xen_swiotlb_dma_ops;
 
 #endif /* __LINUX_SWIOTLB_XEN_H */
-- 
2.29.2


