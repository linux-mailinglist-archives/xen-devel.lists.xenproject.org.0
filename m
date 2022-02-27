Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E15B34C5C2E
	for <lists+xen-devel@lfdr.de>; Sun, 27 Feb 2022 15:32:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279969.477823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOKab-0006A9-PU; Sun, 27 Feb 2022 14:31:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279969.477823; Sun, 27 Feb 2022 14:31:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOKab-00067B-KI; Sun, 27 Feb 2022 14:31:57 +0000
Received: by outflank-mailman (input) for mailman id 279969;
 Sun, 27 Feb 2022 14:31:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jKox=TK=bombadil.srs.infradead.org=BATV+9eb748f383daf30c13ac+6762+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1nOKaZ-0002ik-AI
 for xen-devel@lists.xenproject.org; Sun, 27 Feb 2022 14:31:55 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0218b33c-97da-11ec-8eba-a37418f5ba1a;
 Sun, 27 Feb 2022 15:31:54 +0100 (CET)
Received: from [213.208.157.39] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOKaJ-009ODX-I5; Sun, 27 Feb 2022 14:31:39 +0000
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
X-Inumbo-ID: 0218b33c-97da-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=e5WrycmUWO29UJfUDorb7NMshMB8lzYVa/Mc+LVTrQY=; b=M6zu15mMoPH+9m8brqTPBHG/MC
	A1xLxoqDKLMvUNkNY0qpBK3uCp9lzGbLcGsqRUtjocz8fFQc+1Futvsr0HDC5pQub0V5q/IW3X5DM
	XxT5xEwpQjzqXMlvqCLscqKv2vSze/CFvVJlqhNLpKFBHw+q/Ttav1/C/auhHll/1QYCggzmQ6G3g
	T8DM1uznPKhTcSGXsvggUq1ncptnYaXLXKrgoWT4BKmLcAnZxTCKsRFwCtON9/siNdio+Iut29G9K
	TuuFBRx65ncACOSJM/GWPdJq+7cv8bsg3M9Q6EqQhIa2RVRROr1HXP+p2mSW9tbbJ0hY2MOkl60xF
	OWiusQpw==;
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Cc: x86@kernel.org,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Joerg Roedel <joro@8bytes.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org,
	linux-ia64@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	tboot-devel@lists.sourceforge.net,
	linux-pci@vger.kernel.org
Subject: [PATCH 09/11] swiotlb: add a SWIOTLB_ANY flag to lift the low memory restriction
Date: Sun, 27 Feb 2022 15:30:53 +0100
Message-Id: <20220227143055.335596-10-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220227143055.335596-1-hch@lst.de>
References: <20220227143055.335596-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Power SVM wants to allocate a swiotlb buffer that is not restricted to
low memory for the trusted hypervisor scheme.  Consolidate the support
for this into the swiotlb_init interface by adding a new flag.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/powerpc/include/asm/svm.h       |  4 ----
 arch/powerpc/mm/mem.c                |  5 +----
 arch/powerpc/platforms/pseries/svm.c | 26 +-------------------------
 include/linux/swiotlb.h              |  1 +
 kernel/dma/swiotlb.c                 |  9 +++++++--
 5 files changed, 10 insertions(+), 35 deletions(-)

diff --git a/arch/powerpc/include/asm/svm.h b/arch/powerpc/include/asm/svm.h
index 7546402d796af..85580b30aba48 100644
--- a/arch/powerpc/include/asm/svm.h
+++ b/arch/powerpc/include/asm/svm.h
@@ -15,8 +15,6 @@ static inline bool is_secure_guest(void)
 	return mfmsr() & MSR_S;
 }
 
-void __init svm_swiotlb_init(void);
-
 void dtl_cache_ctor(void *addr);
 #define get_dtl_cache_ctor()	(is_secure_guest() ? dtl_cache_ctor : NULL)
 
@@ -27,8 +25,6 @@ static inline bool is_secure_guest(void)
 	return false;
 }
 
-static inline void svm_swiotlb_init(void) {}
-
 #define get_dtl_cache_ctor() NULL
 
 #endif /* CONFIG_PPC_SVM */
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index d99b8b5b40ca6..a4d65418c30a9 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -249,10 +249,7 @@ void __init mem_init(void)
 	 * back to to-down.
 	 */
 	memblock_set_bottom_up(true);
-	if (is_secure_guest())
-		svm_swiotlb_init();
-	else
-		swiotlb_init(ppc_swiotlb_enable, ppc_swiotlb_flags);
+	swiotlb_init(ppc_swiotlb_enable, ppc_swiotlb_flags);
 #endif
 
 	high_memory = (void *) __va(max_low_pfn * PAGE_SIZE);
diff --git a/arch/powerpc/platforms/pseries/svm.c b/arch/powerpc/platforms/pseries/svm.c
index c5228f4969eb2..3b4045d508ec8 100644
--- a/arch/powerpc/platforms/pseries/svm.c
+++ b/arch/powerpc/platforms/pseries/svm.c
@@ -28,7 +28,7 @@ static int __init init_svm(void)
 	 * need to use the SWIOTLB buffer for DMA even if dma_capable() says
 	 * otherwise.
 	 */
-	swiotlb_force = SWIOTLB_FORCE;
+	ppc_swiotlb_flags |= SWIOTLB_ANY | SWIOTLB_FORCE;
 
 	/* Share the SWIOTLB buffer with the host. */
 	swiotlb_update_mem_attributes();
@@ -37,30 +37,6 @@ static int __init init_svm(void)
 }
 machine_early_initcall(pseries, init_svm);
 
-/*
- * Initialize SWIOTLB. Essentially the same as swiotlb_init(), except that it
- * can allocate the buffer anywhere in memory. Since the hypervisor doesn't have
- * any addressing limitation, we don't need to allocate it in low addresses.
- */
-void __init svm_swiotlb_init(void)
-{
-	unsigned char *vstart;
-	unsigned long bytes, io_tlb_nslabs;
-
-	io_tlb_nslabs = (swiotlb_size_or_default() >> IO_TLB_SHIFT);
-	io_tlb_nslabs = ALIGN(io_tlb_nslabs, IO_TLB_SEGSIZE);
-
-	bytes = io_tlb_nslabs << IO_TLB_SHIFT;
-
-	vstart = memblock_alloc(PAGE_ALIGN(bytes), PAGE_SIZE);
-	if (vstart && !swiotlb_init_with_tbl(vstart, io_tlb_nslabs, false))
-		return;
-
-
-	memblock_free(vstart, PAGE_ALIGN(io_tlb_nslabs << IO_TLB_SHIFT));
-	panic("SVM: Cannot allocate SWIOTLB buffer");
-}
-
 int set_memory_encrypted(unsigned long addr, int numpages)
 {
 	if (!cc_platform_has(CC_ATTR_MEM_ENCRYPT))
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index dcecf953f7997..ee655f2e4d28b 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -15,6 +15,7 @@ struct scatterlist;
 
 #define SWIOTLB_VERBOSE	(1 << 0) /* verbose initialization */
 #define SWIOTLB_FORCE	(1 << 1) /* force bounce buffering */
+#define SWIOTLB_ANY	(1 << 2) /* allow any memory for the buffer */
 
 /*
  * Maximum allowable number of contiguous slabs to map,
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index ad604e5a0983d..ec200e40fc397 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -275,8 +275,13 @@ void __init swiotlb_init(bool addressing_limit, unsigned int flags)
 	if (swiotlb_force_disable)
 		return;
 
-	/* Get IO TLB memory from the low pages */
-	tlb = memblock_alloc_low(bytes, PAGE_SIZE);
+	/*
+	 * By default allocate the bonuce buffer memory from low memory.
+	 */
+	if (flags & SWIOTLB_ANY)
+		tlb = memblock_alloc(bytes, PAGE_SIZE);
+	else
+		tlb = memblock_alloc_low(bytes, PAGE_SIZE);
 	if (!tlb)
 		goto fail;
 	if (swiotlb_init_with_tbl(tlb, default_nslabs, flags))
-- 
2.30.2


