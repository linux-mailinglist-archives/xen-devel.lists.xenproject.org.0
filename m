Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF72364EB44
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 13:17:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464569.723041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p69eo-0008GX-IE; Fri, 16 Dec 2022 12:17:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464569.723041; Fri, 16 Dec 2022 12:17:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p69eo-000816-4i; Fri, 16 Dec 2022 12:17:42 +0000
Received: by outflank-mailman (input) for mailman id 464569;
 Fri, 16 Dec 2022 12:17:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p69ej-0007Lc-Vo
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 12:17:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p69ej-00034Y-Sl; Fri, 16 Dec 2022 12:17:37 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p69DJ-0004sN-Dg; Fri, 16 Dec 2022 11:49:17 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=UCQfX8iMvnpIt+Q9gV/nKjf8GUqEBVsJAQhHBiS7Ykk=; b=jEszd2vIHifnpJMEMVuX8p5kmR
	qYfa3fiRP+5C70UMHtfog9ySnwE3LVN9RbTWolgSzo4ZPz+gbwXBqNA7frqhrYsXSLHZnHU11Cp75
	4cZAuMWYr3CNX/4btJCn1A7sBfNu0PBSJNDACFYRzlX3m3Ph8bF90N91n3El1tYg4L5E=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Hongyan Xia <hongyxia@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH 15/22] xen/page_alloc: add a path for xenheap when there is no direct map
Date: Fri, 16 Dec 2022 11:48:46 +0000
Message-Id: <20221216114853.8227-16-julien@xen.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216114853.8227-1-julien@xen.org>
References: <20221216114853.8227-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hongyan Xia <hongyxia@amazon.com>

When there is not an always-mapped direct map, xenheap allocations need
to be mapped and unmapped on-demand.

Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>

----

    I have left the call to map_pages_to_xen() and destroy_xen_mappings()
    in the split heap for now. I am not entirely convinced this is necessary
    because in that setup only the xenheap would be always mapped and
    this doesn't contain any guest memory (aside the grant-table).
    So map/unmapping for every allocation seems unnecessary.

    Changes since Hongyan's version:
        * Rebase
        * Fix indentation in alloc_xenheap_pages()
        * Fix build for arm32
---
 xen/common/page_alloc.c | 41 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 0a950288e241..0c4af5a71407 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2222,6 +2222,7 @@ void init_xenheap_pages(paddr_t ps, paddr_t pe)
 void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
 {
     struct page_info *pg;
+    void *ret;
 
     ASSERT_ALLOC_CONTEXT();
 
@@ -2230,17 +2231,36 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
     if ( unlikely(pg == NULL) )
         return NULL;
 
+    ret = page_to_virt(pg);
+
+    if ( !arch_has_directmap() &&
+         map_pages_to_xen((unsigned long)ret, page_to_mfn(pg), 1UL << order,
+                          PAGE_HYPERVISOR) )
+        {
+            /* Failed to map xenheap pages. */
+            free_heap_pages(pg, order, false);
+            return NULL;
+        }
+
     return page_to_virt(pg);
 }
 
 
 void free_xenheap_pages(void *v, unsigned int order)
 {
+    unsigned long va = (unsigned long)v & PAGE_MASK;
+
     ASSERT_ALLOC_CONTEXT();
 
     if ( v == NULL )
         return;
 
+    if ( !arch_has_directmap() &&
+         destroy_xen_mappings(va, va + (1UL << (order + PAGE_SHIFT))) )
+        dprintk(XENLOG_WARNING,
+                "Error while destroying xenheap mappings at %p, order %u\n",
+                v, order);
+
     free_heap_pages(virt_to_page(v), order, false);
 }
 
@@ -2264,6 +2284,7 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
 {
     struct page_info *pg;
     unsigned int i;
+    void *ret;
 
     ASSERT_ALLOC_CONTEXT();
 
@@ -2276,16 +2297,28 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
     if ( unlikely(pg == NULL) )
         return NULL;
 
+    ret = page_to_virt(pg);
+
+    if ( !arch_has_directmap() &&
+         map_pages_to_xen((unsigned long)ret, page_to_mfn(pg), 1UL << order,
+                          PAGE_HYPERVISOR) )
+    {
+        /* Failed to map xenheap pages. */
+        free_domheap_pages(pg, order);
+        return NULL;
+    }
+
     for ( i = 0; i < (1u << order); i++ )
         pg[i].count_info |= PGC_xen_heap;
 
-    return page_to_virt(pg);
+    return ret;
 }
 
 void free_xenheap_pages(void *v, unsigned int order)
 {
     struct page_info *pg;
     unsigned int i;
+    unsigned long va = (unsigned long)v & PAGE_MASK;
 
     ASSERT_ALLOC_CONTEXT();
 
@@ -2297,6 +2330,12 @@ void free_xenheap_pages(void *v, unsigned int order)
     for ( i = 0; i < (1u << order); i++ )
         pg[i].count_info &= ~PGC_xen_heap;
 
+    if ( !arch_has_directmap() &&
+         destroy_xen_mappings(va, va + (1UL << (order + PAGE_SHIFT))) )
+        dprintk(XENLOG_WARNING,
+                "Error while destroying xenheap mappings at %p, order %u\n",
+                v, order);
+
     free_heap_pages(pg, order, true);
 }
 
-- 
2.38.1


