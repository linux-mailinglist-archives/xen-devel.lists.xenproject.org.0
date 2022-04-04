Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB064F0EA6
	for <lists+xen-devel@lfdr.de>; Mon,  4 Apr 2022 07:07:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298130.507827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbEvc-00061t-F4; Mon, 04 Apr 2022 05:07:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298130.507827; Mon, 04 Apr 2022 05:07:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbEvc-0005wD-Ai; Mon, 04 Apr 2022 05:07:00 +0000
Received: by outflank-mailman (input) for mailman id 298130;
 Mon, 04 Apr 2022 05:06:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yBc+=UO=bombadil.srs.infradead.org=BATV+8f3f264ef3f87e17849e+6798+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1nbEvb-000216-6g
 for xen-devel@lists.xenproject.org; Mon, 04 Apr 2022 05:06:59 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d45ac54-b3d5-11ec-a405-831a346695d4;
 Mon, 04 Apr 2022 07:06:58 +0200 (CEST)
Received: from 089144211060.atnat0020.highway.a1.net ([89.144.211.60]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbEvO-00D9D7-LO; Mon, 04 Apr 2022 05:06:47 +0000
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
X-Inumbo-ID: 0d45ac54-b3d5-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=cglDQ544TZBR8iIX+lAj25Nh7/wZoWF1SIJV8fBYJSc=; b=wskLiSoDsVLKEGZ1Sdhe2vLHxA
	/LFmu+C4Ch41odlEGfE4k/6biHOMWLMavXZg1/FJ/PTrBuOvNRcttQrXGPQnQX2ejO7VQl+P5h4vJ
	jjyTmth+NW0RQQNORsIdANiYQbpSIbwzbho7ETCWH+JQ1Eant6nnSsoOakf4a4SiDmtHa4gIQ2ewj
	1yuavxAdLwimQnkOJ+SrmcUXPc/FEsqsVhilArD7VqVLLg0TjTvuTMhiWfExtg0d+132+oAu/FSc+
	NdnMGNgT/WfGxUS28PWBLTMrBmwyxygrBQmBlUWTFICH/VEeaVF9jSvk+mMKaW31WvbccHzGgWs+H
	b2tNFv4A==;
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Cc: x86@kernel.org,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
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
Subject: [PATCH 10/15] swiotlb: add a SWIOTLB_ANY flag to lift the low memory restriction
Date: Mon,  4 Apr 2022 07:05:54 +0200
Message-Id: <20220404050559.132378-11-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220404050559.132378-1-hch@lst.de>
References: <20220404050559.132378-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Power SVM wants to allocate a swiotlb buffer that is not restricted to
low memory for the trusted hypervisor scheme.  Consolidate the support
for this into the swiotlb_init interface by adding a new flag.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/powerpc/include/asm/svm.h       |  4 ----
 arch/powerpc/include/asm/swiotlb.h   |  1 +
 arch/powerpc/kernel/dma-swiotlb.c    |  1 +
 arch/powerpc/mm/mem.c                |  5 +----
 arch/powerpc/platforms/pseries/svm.c | 26 +-------------------------
 include/linux/swiotlb.h              |  1 +
 kernel/dma/swiotlb.c                 | 11 +++++++++--
 7 files changed, 14 insertions(+), 35 deletions(-)

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
diff --git a/arch/powerpc/include/asm/swiotlb.h b/arch/powerpc/include/asm/swiotlb.h
index 3c1a1cd161286..4203b5e0a88ed 100644
--- a/arch/powerpc/include/asm/swiotlb.h
+++ b/arch/powerpc/include/asm/swiotlb.h
@@ -9,6 +9,7 @@
 #include <linux/swiotlb.h>
 
 extern unsigned int ppc_swiotlb_enable;
+extern unsigned int ppc_swiotlb_flags;
 
 #ifdef CONFIG_SWIOTLB
 void swiotlb_detect_4g(void);
diff --git a/arch/powerpc/kernel/dma-swiotlb.c b/arch/powerpc/kernel/dma-swiotlb.c
index fc7816126a401..ba256c37bcc0f 100644
--- a/arch/powerpc/kernel/dma-swiotlb.c
+++ b/arch/powerpc/kernel/dma-swiotlb.c
@@ -10,6 +10,7 @@
 #include <asm/swiotlb.h>
 
 unsigned int ppc_swiotlb_enable;
+unsigned int ppc_swiotlb_flags;
 
 void __init swiotlb_detect_4g(void)
 {
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index e1519e2edc656..a4d65418c30a9 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -249,10 +249,7 @@ void __init mem_init(void)
 	 * back to to-down.
 	 */
 	memblock_set_bottom_up(true);
-	if (is_secure_guest())
-		svm_swiotlb_init();
-	else
-		swiotlb_init(ppc_swiotlb_enable, 0);
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
index ae0407173e845..eabdd89987027 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -15,6 +15,7 @@ struct scatterlist;
 
 #define SWIOTLB_VERBOSE	(1 << 0) /* verbose initialization */
 #define SWIOTLB_FORCE	(1 << 1) /* force bounce buffering */
+#define SWIOTLB_ANY	(1 << 2) /* allow any memory for the buffer */
 
 /*
  * Maximum allowable number of contiguous slabs to map,
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 86e877a96b828..f6e091424af3d 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -266,8 +266,15 @@ void __init swiotlb_init(bool addressing_limit, unsigned int flags)
 	if (swiotlb_force_disable)
 		return;
 
-	/* Get IO TLB memory from the low pages */
-	tlb = memblock_alloc_low(bytes, PAGE_SIZE);
+	/*
+	 * By default allocate the bounce buffer memory from low memory, but
+	 * allow to pick a location everywhere for hypervisors with guest
+	 * memory encryption.
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


