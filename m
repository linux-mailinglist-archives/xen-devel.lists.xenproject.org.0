Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D88367AEC
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 09:20:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115023.219333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZTdH-0003nf-Kk; Thu, 22 Apr 2021 07:20:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115023.219333; Thu, 22 Apr 2021 07:20:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZTdH-0003mv-Gf; Thu, 22 Apr 2021 07:20:15 +0000
Received: by outflank-mailman (input) for mailman id 115023;
 Thu, 22 Apr 2021 07:20:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Z8K=JT=bombadil.srs.infradead.org=batv+ccca8c562e79e8576e72+6451+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1lZTdG-0002oJ-Cr
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 07:20:14 +0000
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f3bc7bf0-6909-49a8-bc35-1797e59b31e3;
 Thu, 22 Apr 2021 07:19:48 +0000 (UTC)
Received: from [2001:4bb8:19b:f845:15fc:cef6:715a:fb03] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lZTcV-00DRkP-5I; Thu, 22 Apr 2021 07:19:27 +0000
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
X-Inumbo-ID: f3bc7bf0-6909-49a8-bc35-1797e59b31e3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=9e6nRv3+wLjzlc72bubCu1Xi6ervkRsefEBahSWTc/0=; b=zOoYX8jUOo1h/3vuutMUzvW6dA
	ZDt/haqkxtsVhv+y49bYkAHuzihtfHTSLXmkH54HT45XdIirfXz/KA9+81tRVALy4BqRUaeZ6UVFS
	thFNeLLbDdJoO1uvDKXeBjJ7flnlT8R/2cANDYZpKVuHgq5iXbiyTcaiI17eeegb86Zndo02fMOgM
	wanJlXmIKnHeFmhGV4kAkHunvH8Qqyvjo1wQeq9Tgjdwmg802+7/ndgUnSmpLe960PfgL1yXsBmPO
	IC6M+tscEAqKN99bJ3pxEM5gpDrdaTUgeWmzLwy6xFLs3xVNmJMi0JNlfqxnNQq/KkvxFweBr3GXT
	w3XNj2bA==;
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	xen-devel@lists.xenproject.org,
	iommu@lists.linux-foundation.org
Subject: [PATCH 1/7] swiotlb: pass bytes instead of nslabs to swiotlb_init_with_tbl
Date: Thu, 22 Apr 2021 09:19:15 +0200
Message-Id: <20210422071921.1428607-2-hch@lst.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210422071921.1428607-1-hch@lst.de>
References: <20210422071921.1428607-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Pass the actual allocation size to swiotlb_init_with_tbl, which
simplifies things quite a bit.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/mips/cavium-octeon/dma-octeon.c |  2 +-
 arch/powerpc/platforms/pseries/svm.c |  3 +--
 drivers/xen/swiotlb-xen.c            |  2 +-
 include/linux/swiotlb.h              |  2 +-
 kernel/dma/swiotlb.c                 | 10 +++++-----
 5 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/arch/mips/cavium-octeon/dma-octeon.c b/arch/mips/cavium-octeon/dma-octeon.c
index df70308db0e697..020b8ce5b8ff7c 100644
--- a/arch/mips/cavium-octeon/dma-octeon.c
+++ b/arch/mips/cavium-octeon/dma-octeon.c
@@ -245,6 +245,6 @@ void __init plat_swiotlb_setup(void)
 		panic("%s: Failed to allocate %zu bytes align=%lx\n",
 		      __func__, swiotlbsize, PAGE_SIZE);
 
-	if (swiotlb_init_with_tbl(octeon_swiotlb, swiotlb_nslabs, 1) == -ENOMEM)
+	if (swiotlb_init_with_tbl(octeon_swiotlb, swiotlbsize, 1) == -ENOMEM)
 		panic("Cannot allocate SWIOTLB buffer");
 }
diff --git a/arch/powerpc/platforms/pseries/svm.c b/arch/powerpc/platforms/pseries/svm.c
index 1d829e257996fb..4d281ff56ce96f 100644
--- a/arch/powerpc/platforms/pseries/svm.c
+++ b/arch/powerpc/platforms/pseries/svm.c
@@ -52,10 +52,9 @@ void __init svm_swiotlb_init(void)
 	bytes = io_tlb_nslabs << IO_TLB_SHIFT;
 
 	vstart = memblock_alloc(PAGE_ALIGN(bytes), PAGE_SIZE);
-	if (vstart && !swiotlb_init_with_tbl(vstart, io_tlb_nslabs, false))
+	if (vstart && !swiotlb_init_with_tbl(vstart, bytes, false))
 		return;
 
-
 	memblock_free_early(__pa(vstart),
 			    PAGE_ALIGN(io_tlb_nslabs << IO_TLB_SHIFT));
 	panic("SVM: Cannot allocate SWIOTLB buffer");
diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 4c89afc0df6289..18d79f07b507ce 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -249,7 +249,7 @@ void __init xen_swiotlb_init_early(void)
 		panic("%s (rc:%d)", xen_swiotlb_error(XEN_SWIOTLB_EFIXUP), rc);
 	}
 
-	if (swiotlb_init_with_tbl(start, nslabs, false))
+	if (swiotlb_init_with_tbl(start, bytes, false))
 		panic("Cannot allocate SWIOTLB buffer");
 	swiotlb_set_max_segment(PAGE_SIZE);
 }
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 216854a5e5134b..d1d40ca5014b54 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -36,7 +36,7 @@ enum swiotlb_force {
 #define IO_TLB_DEFAULT_SIZE (64UL<<20)
 
 extern void swiotlb_init(int verbose);
-int swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose);
+int swiotlb_init_with_tbl(char *tlb, size_t bytes, int verbose);
 unsigned long swiotlb_size_or_default(void);
 extern int swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs);
 extern int swiotlb_late_init_with_default_size(size_t default_size);
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 0a5b6f7e75bce6..c7b3dd86db7f56 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -166,9 +166,9 @@ void __init swiotlb_update_mem_attributes(void)
 	memset(vaddr, 0, bytes);
 }
 
-int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose)
+int __init swiotlb_init_with_tbl(char *tlb, size_t bytes, int verbose)
 {
-	unsigned long bytes = nslabs << IO_TLB_SHIFT, i;
+	unsigned long nslabs = bytes >> IO_TLB_SHIFT, i;
 	struct io_tlb_mem *mem;
 	size_t alloc_size;
 
@@ -209,17 +209,17 @@ int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose)
 void  __init
 swiotlb_init(int verbose)
 {
-	size_t bytes = PAGE_ALIGN(default_nslabs << IO_TLB_SHIFT);
+	size_t bytes = default_nslabs << IO_TLB_SHIFT;
 	void *tlb;
 
 	if (swiotlb_force == SWIOTLB_NO_FORCE)
 		return;
 
 	/* Get IO TLB memory from the low pages */
-	tlb = memblock_alloc_low(bytes, PAGE_SIZE);
+	tlb = memblock_alloc_low(PAGE_ALIGN(bytes), PAGE_SIZE);
 	if (!tlb)
 		goto fail;
-	if (swiotlb_init_with_tbl(tlb, default_nslabs, verbose))
+	if (swiotlb_init_with_tbl(tlb, bytes, verbose))
 		goto fail_free_mem;
 	return;
 
-- 
2.30.1


