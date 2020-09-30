Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C45727F0F1
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 19:57:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.877.3039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNgLZ-0006hN-5f; Wed, 30 Sep 2020 17:56:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877.3039; Wed, 30 Sep 2020 17:56:57 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNgLZ-0006gy-27; Wed, 30 Sep 2020 17:56:57 +0000
Received: by outflank-mailman (input) for mailman id 877;
 Wed, 30 Sep 2020 17:56:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m0D6=DH=casper.srs.infradead.org=batv+fa6e45c137c1199df5c4+6247+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1kNgHY-0005QF-Q4
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 17:52:48 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ff48d49e-23ae-4a95-8d7b-d03db52e643a;
 Wed, 30 Sep 2020 17:51:59 +0000 (UTC)
Received: from [2001:4bb8:180:7b62:c70:4a89:bc61:4] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNgGc-0001DO-6R; Wed, 30 Sep 2020 17:51:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=m0D6=DH=casper.srs.infradead.org=batv+fa6e45c137c1199df5c4+6247+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1kNgHY-0005QF-Q4
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 17:52:48 +0000
X-Inumbo-ID: ff48d49e-23ae-4a95-8d7b-d03db52e643a
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ff48d49e-23ae-4a95-8d7b-d03db52e643a;
	Wed, 30 Sep 2020 17:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ix+nhROFgS2R/TvryqxFuXEm6pOX6uuPKFVKed32kPg=; b=o71az0TAGIt+o23t9vEEPg9kBX
	49t5J7kjHFOTFFFV1reywEKaB+iF5d6lYqgVAc7lLH43QPfngUbCNFDu6idG354NtO0I20tYUmc/S
	ZNAXVCDrReTupKXsw6F5l3EHk46VQsKDWXEuoaEZwsGrnxoyazLXMES+Zm9kzi1lpuCrDw+OOKSKn
	N9e7DoOAmhqH/Xf3idF4DAirJzTM4dZVdj0+5Xss/2Veo4YkuL/fEADv9DU6/Q4fO8Mv09yhcRXRO
	AJrpiNZlL0BIfp1/UyxfaKevrL7DT2VegvYl4HXyjB6G5Xg6D8J438SNVin3yQs9fbhbLooyU+aY6
	Vr5NdFSA==;
Received: from [2001:4bb8:180:7b62:c70:4a89:bc61:4] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNgGc-0001DO-6R; Wed, 30 Sep 2020 17:51:50 +0000
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
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Minchan Kim <minchan@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Nitin Gupta <ngupta@vflare.org>,
	x86@kernel.org,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Subject: [PATCH 10/10] mm: remove alloc_vm_area
Date: Wed, 30 Sep 2020 19:51:33 +0200
Message-Id: <20200930175133.1252382-11-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200930175133.1252382-1-hch@lst.de>
References: <20200930175133.1252382-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

All users are gone now.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/vmalloc.h |  5 +----
 mm/nommu.c              |  7 ------
 mm/vmalloc.c            | 48 -----------------------------------------
 3 files changed, 1 insertion(+), 59 deletions(-)

diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
index c77efeac242514..938eaf9517e266 100644
--- a/include/linux/vmalloc.h
+++ b/include/linux/vmalloc.h
@@ -169,6 +169,7 @@ extern struct vm_struct *__get_vm_area_caller(unsigned long size,
 					unsigned long flags,
 					unsigned long start, unsigned long end,
 					const void *caller);
+void free_vm_area(struct vm_struct *area);
 extern struct vm_struct *remove_vm_area(const void *addr);
 extern struct vm_struct *find_vm_area(const void *addr);
 
@@ -204,10 +205,6 @@ static inline void set_vm_flush_reset_perms(void *addr)
 }
 #endif
 
-/* Allocate/destroy a 'vmalloc' VM area. */
-extern struct vm_struct *alloc_vm_area(size_t size, pte_t **ptes);
-extern void free_vm_area(struct vm_struct *area);
-
 /* for /dev/kmem */
 extern long vread(char *buf, char *addr, unsigned long count);
 extern long vwrite(char *buf, char *addr, unsigned long count);
diff --git a/mm/nommu.c b/mm/nommu.c
index 75a327149af127..9272f30e4c4726 100644
--- a/mm/nommu.c
+++ b/mm/nommu.c
@@ -354,13 +354,6 @@ void vm_unmap_aliases(void)
 }
 EXPORT_SYMBOL_GPL(vm_unmap_aliases);
 
-struct vm_struct *alloc_vm_area(size_t size, pte_t **ptes)
-{
-	BUG();
-	return NULL;
-}
-EXPORT_SYMBOL_GPL(alloc_vm_area);
-
 void free_vm_area(struct vm_struct *area)
 {
 	BUG();
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index e2a2ded8d93478..3bc5b832451ef2 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3083,54 +3083,6 @@ int remap_vmalloc_range(struct vm_area_struct *vma, void *addr,
 }
 EXPORT_SYMBOL(remap_vmalloc_range);
 
-static int f(pte_t *pte, unsigned long addr, void *data)
-{
-	pte_t ***p = data;
-
-	if (p) {
-		*(*p) = pte;
-		(*p)++;
-	}
-	return 0;
-}
-
-/**
- * alloc_vm_area - allocate a range of kernel address space
- * @size:	   size of the area
- * @ptes:	   returns the PTEs for the address space
- *
- * Returns:	NULL on failure, vm_struct on success
- *
- * This function reserves a range of kernel address space, and
- * allocates pagetables to map that range.  No actual mappings
- * are created.
- *
- * If @ptes is non-NULL, pointers to the PTEs (in init_mm)
- * allocated for the VM area are returned.
- */
-struct vm_struct *alloc_vm_area(size_t size, pte_t **ptes)
-{
-	struct vm_struct *area;
-
-	area = get_vm_area_caller(size, VM_IOREMAP,
-				__builtin_return_address(0));
-	if (area == NULL)
-		return NULL;
-
-	/*
-	 * This ensures that page tables are constructed for this region
-	 * of kernel virtual address space and mapped into init_mm.
-	 */
-	if (apply_to_page_range(&init_mm, (unsigned long)area->addr,
-				size, f, ptes ? &ptes : NULL)) {
-		free_vm_area(area);
-		return NULL;
-	}
-
-	return area;
-}
-EXPORT_SYMBOL_GPL(alloc_vm_area);
-
 void free_vm_area(struct vm_struct *area)
 {
 	struct vm_struct *ret;
-- 
2.28.0


