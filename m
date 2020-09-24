Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1B327734B
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 15:59:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLRmL-0000sT-77; Thu, 24 Sep 2020 13:59:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dG6m=DB=casper.srs.infradead.org=batv+004c9619e75dbad284dd+6241+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1kLRmK-0000ri-6O
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 13:59:20 +0000
X-Inumbo-ID: b7966b0e-5d19-4072-bef8-eafe6a01dd5d
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b7966b0e-5d19-4072-bef8-eafe6a01dd5d;
 Thu, 24 Sep 2020 13:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=cxDf+nMgR/LOq5Vlf/2efNcelt6NT7vAwUR//5r7v5s=; b=SbZP2/46nbLHz2NhZXBd8yw6tG
 ku7Nd+ECOIE3IIrVDkg8WlGJcls/wlGLJaMPtntqmHB9uEsRekeQLQxbgbfQCceXFMzyIGFbpKrjV
 a9s8K4XWj8+cXzGCXUhJ0nujJNX1EJqd3DlvVZbdF+R0Xolc35NKsbVCJF0miiaMcNPuQ3IKiNQJf
 rKzlRqNsYxU0+CnZmDbZuwW0mnoXEE2ulUdTX2I1ox71c7x7u8lEdPguj9hgOMlpFiXCj+9dkEpR9
 r9nJEtzgjnxHY4QxipugU0L634YOJBELr0rU0AHOK/FMGwRsW6poMusrlgYEOYiv5Z+6BYOO1iRLv
 1S7C43pw==;
Received: from p4fdb0c34.dip0.t-ipconnect.de ([79.219.12.52] helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLRlx-0003v8-Jq; Thu, 24 Sep 2020 13:58:57 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Minchan Kim <minchan@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Nitin Gupta <ngupta@vflare.org>,
 x86@kernel.org, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org
Subject: [PATCH 03/11] mm: add a vmap_pfn function
Date: Thu, 24 Sep 2020 15:58:45 +0200
Message-Id: <20200924135853.875294-4-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200924135853.875294-1-hch@lst.de>
References: <20200924135853.875294-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Add a proper helper to remap PFNs into kernel virtual space so that
drivers don't have to abuse alloc_vm_area and open coded PTE
manipulation for it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/vmalloc.h |  1 +
 mm/Kconfig              |  3 +++
 mm/vmalloc.c            | 45 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 49 insertions(+)

diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
index b899681e3ff9f0..c77efeac242514 100644
--- a/include/linux/vmalloc.h
+++ b/include/linux/vmalloc.h
@@ -122,6 +122,7 @@ extern void vfree_atomic(const void *addr);
 
 extern void *vmap(struct page **pages, unsigned int count,
 			unsigned long flags, pgprot_t prot);
+void *vmap_pfn(unsigned long *pfns, unsigned int count, pgprot_t prot);
 extern void vunmap(const void *addr);
 
 extern int remap_vmalloc_range_partial(struct vm_area_struct *vma,
diff --git a/mm/Kconfig b/mm/Kconfig
index 6c974888f86f97..6fa7ba1199eb1e 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -815,6 +815,9 @@ config DEVICE_PRIVATE
 	  memory; i.e., memory that is only accessible from the device (or
 	  group of devices). You likely also want to select HMM_MIRROR.
 
+config VMAP_PFN
+	bool
+
 config FRAME_VECTOR
 	bool
 
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index ffad65f052c3f9..e2a2ded8d93478 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -2413,6 +2413,51 @@ void *vmap(struct page **pages, unsigned int count,
 }
 EXPORT_SYMBOL(vmap);
 
+#ifdef CONFIG_VMAP_PFN
+struct vmap_pfn_data {
+	unsigned long	*pfns;
+	pgprot_t	prot;
+	unsigned int	idx;
+};
+
+static int vmap_pfn_apply(pte_t *pte, unsigned long addr, void *private)
+{
+	struct vmap_pfn_data *data = private;
+
+	if (WARN_ON_ONCE(pfn_valid(data->pfns[data->idx])))
+		return -EINVAL;
+	*pte = pte_mkspecial(pfn_pte(data->pfns[data->idx++], data->prot));
+	return 0;
+}
+
+/**
+ * vmap_pfn - map an array of PFNs into virtually contiguous space
+ * @pfns: array of PFNs
+ * @count: number of pages to map
+ * @prot: page protection for the mapping
+ *
+ * Maps @count PFNs from @pfns into contiguous kernel virtual space and returns
+ * the start address of the mapping.
+ */
+void *vmap_pfn(unsigned long *pfns, unsigned int count, pgprot_t prot)
+{
+	struct vmap_pfn_data data = { .pfns = pfns, .prot = pgprot_nx(prot) };
+	struct vm_struct *area;
+
+	area = get_vm_area_caller(count * PAGE_SIZE, VM_IOREMAP,
+			__builtin_return_address(0));
+	if (!area)
+		return NULL;
+	if (apply_to_page_range(&init_mm, (unsigned long)area->addr,
+			count * PAGE_SIZE, vmap_pfn_apply, &data)) {
+		free_vm_area(area);
+		return NULL;
+	}
+	return area->addr;
+}
+EXPORT_SYMBOL_GPL(vmap_pfn);
+#endif /* CONFIG_VMAP_PFN */
+
 static void *__vmalloc_area_node(struct vm_struct *area, gfp_t gfp_mask,
 				 pgprot_t prot, int node)
 {
-- 
2.28.0


