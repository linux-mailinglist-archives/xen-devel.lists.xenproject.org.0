Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 344FD392E09
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 14:33:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133111.248197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmFBv-00059G-KW; Thu, 27 May 2021 12:32:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133111.248197; Thu, 27 May 2021 12:32:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmFBv-00057H-Gl; Thu, 27 May 2021 12:32:47 +0000
Received: by outflank-mailman (input) for mailman id 133111;
 Thu, 27 May 2021 12:32:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HjtO=KW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lmFBu-000573-8W
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 12:32:46 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cf02cc0e-f7ce-432b-8bba-6a8fe52d17c5;
 Thu, 27 May 2021 12:32:45 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A0E4A1FD2E;
 Thu, 27 May 2021 12:32:44 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 6CF1011A98;
 Thu, 27 May 2021 12:32:44 +0000 (UTC)
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
X-Inumbo-ID: cf02cc0e-f7ce-432b-8bba-6a8fe52d17c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622118764; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TZmIcIJiPml4pYGzZ8PXew8/Uidlmz9UaHgSxe2VY6k=;
	b=BFs8RLNJEVICqaTsdEvhcEPVbK+oospJS0U72GU1SqP5Gb+ztJ048ziABRVXRsl4GbWOqn
	yRGbmCmQtyNNrsrjxMWiKQTVHlMe0K8KiaGia8I5JfoMmNszbu+qnEQe7KJfZQes19jXDp
	8vVcOkfp7kUlHg5hP+ohkjgwFDl/PQI=
Subject: [PATCH v2 06/12] page-alloc: make scrub_on_page() static
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <8f56a8f4-0482-932f-96a9-c791bebb4610@suse.com>
Message-ID: <6f24db03-8c96-3a81-a073-657743e8faee@suse.com>
Date: Thu, 27 May 2021 14:32:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <8f56a8f4-0482-932f-96a9-c791bebb4610@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Before starting to alter its properties, restrict the function's
visibility. The only external user is mem-paging, which we can
accommodate by different means.

Also move the function up in its source file, so we won't need to
forward-declare it. Constify its parameter at the same time.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/mm/mem_paging.c
+++ b/xen/arch/x86/mm/mem_paging.c
@@ -316,9 +316,6 @@ static int evict(struct domain *d, gfn_t
     ret = p2m_set_entry(p2m, gfn, INVALID_MFN, PAGE_ORDER_4K,
                         p2m_ram_paged, a);
 
-    /* Clear content before returning the page to Xen */
-    scrub_one_page(page);
-
     /* Track number of paged gfns */
     atomic_inc(&d->paged_pages);
 
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -136,6 +136,7 @@
 #include <xen/numa.h>
 #include <xen/nodemask.h>
 #include <xen/event.h>
+#include <xen/vm_event.h>
 #include <public/sysctl.h>
 #include <public/sched.h>
 #include <asm/page.h>
@@ -757,6 +758,21 @@ static void page_list_add_scrub(struct p
 #endif
 #define SCRUB_BYTE_PATTERN   (SCRUB_PATTERN & 0xff)
 
+static void scrub_one_page(const struct page_info *pg)
+{
+    if ( unlikely(pg->count_info & PGC_broken) )
+        return;
+
+#ifndef NDEBUG
+    /* Avoid callers relying on allocations returning zeroed pages. */
+    unmap_domain_page(memset(__map_domain_page(pg),
+                             SCRUB_BYTE_PATTERN, PAGE_SIZE));
+#else
+    /* For a production build, clear_page() is the fastest way to scrub. */
+    clear_domain_page(_mfn(page_to_mfn(pg)));
+#endif
+}
+
 static void poison_one_page(struct page_info *pg)
 {
 #ifdef CONFIG_SCRUB_DEBUG
@@ -2431,10 +2447,12 @@ void free_domheap_pages(struct page_info
             /*
              * Normally we expect a domain to clear pages before freeing them,
              * if it cares about the secrecy of their contents. However, after
-             * a domain has died we assume responsibility for erasure. We do
-             * scrub regardless if option scrub_domheap is set.
+             * a domain has died or if it has mem-paging enabled we assume
+             * responsibility for erasure. We do scrub regardless if option
+             * scrub_domheap is set.
              */
-            scrub = d->is_dying || scrub_debug || opt_scrub_domheap;
+            scrub = d->is_dying || mem_paging_enabled(d) ||
+                    scrub_debug || opt_scrub_domheap;
         }
         else
         {
@@ -2519,21 +2537,6 @@ static __init int pagealloc_keyhandler_i
 __initcall(pagealloc_keyhandler_init);
 
 
-void scrub_one_page(struct page_info *pg)
-{
-    if ( unlikely(pg->count_info & PGC_broken) )
-        return;
-
-#ifndef NDEBUG
-    /* Avoid callers relying on allocations returning zeroed pages. */
-    unmap_domain_page(memset(__map_domain_page(pg),
-                             SCRUB_BYTE_PATTERN, PAGE_SIZE));
-#else
-    /* For a production build, clear_page() is the fastest way to scrub. */
-    clear_domain_page(_mfn(page_to_mfn(pg)));
-#endif
-}
-
 static void dump_heap(unsigned char key)
 {
     s_time_t      now = NOW();
--- a/xen/include/asm-x86/mem_paging.h
+++ b/xen/include/asm-x86/mem_paging.h
@@ -24,12 +24,6 @@
 
 int mem_paging_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_paging_op_t) arg);
 
-#ifdef CONFIG_MEM_PAGING
-# define mem_paging_enabled(d) vm_event_check_ring((d)->vm_event_paging)
-#else
-# define mem_paging_enabled(d) false
-#endif
-
 #endif /*__ASM_X86_MEM_PAGING_H__ */
 
 /*
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -498,8 +498,6 @@ static inline unsigned int get_order_fro
     return order;
 }
 
-void scrub_one_page(struct page_info *);
-
 #ifndef arch_free_heap_page
 #define arch_free_heap_page(d, pg) \
     page_list_del(pg, page_to_list(d, pg))
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -1117,6 +1117,12 @@ static always_inline bool is_iommu_enabl
     return evaluate_nospec(d->options & XEN_DOMCTL_CDF_iommu);
 }
 
+#ifdef CONFIG_MEM_PAGING
+# define mem_paging_enabled(d) vm_event_check_ring((d)->vm_event_paging)
+#else
+# define mem_paging_enabled(d) false
+#endif
+
 extern bool sched_smt_power_savings;
 extern bool sched_disable_smt_switching;
 


