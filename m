Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 888192C0D28
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 15:23:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34434.65488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khCkp-0006x9-Jh; Mon, 23 Nov 2020 14:23:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34434.65488; Mon, 23 Nov 2020 14:23:43 +0000
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
	id 1khCkp-0006wk-GF; Mon, 23 Nov 2020 14:23:43 +0000
Received: by outflank-mailman (input) for mailman id 34434;
 Mon, 23 Nov 2020 14:23:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khCko-0006we-PV
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 14:23:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7a41489f-005d-4e85-af81-b52ce8d1ccbb;
 Mon, 23 Nov 2020 14:23:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7797DAFC6;
 Mon, 23 Nov 2020 14:23:40 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khCko-0006we-PV
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 14:23:42 +0000
X-Inumbo-ID: 7a41489f-005d-4e85-af81-b52ce8d1ccbb
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 7a41489f-005d-4e85-af81-b52ce8d1ccbb;
	Mon, 23 Nov 2020 14:23:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606141420; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=npXvc83H7VL7EyMc4+byhWI4gtJoq7f1VRBIByZhCIc=;
	b=aXiQO0b53zHtBPUt4MZqazy/x+S1ffiv8ja8MUl3UGecbfKgMFH4Rpmw+cJQXW+cx09Wz+
	TytS+zpoQNZ5Xzf1x2bsB5KB2+Wb3kxhyrEmF+686o8CeoeP3errPRzPyW4XoXQRbVSKz7
	bbia4KD9iD8X5DdQpp1yNoixEjM5Qwg=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 7797DAFC6;
	Mon, 23 Nov 2020 14:23:40 +0000 (UTC)
Subject: [PATCH v2 02/17] mm: introduce xvmalloc() et al and use for grant
 table allocations
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <255f466c-3c95-88c5-3e55-0f04c9ae1b12@suse.com>
Message-ID: <23acd443-348c-5ef9-0fb5-880e06cc9a2d@suse.com>
Date: Mon, 23 Nov 2020 15:23:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <255f466c-3c95-88c5-3e55-0f04c9ae1b12@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

All of the array allocations in grant_table_init() can exceed a page's
worth of memory, which xmalloc()-based interfaces aren't really suitable
for after boot. We also don't need any of these allocations to be
physically contiguous.. Introduce interfaces dynamically switching
between xmalloc() et al and vmalloc() et al, based on requested size,
and use them instead.

All the wrappers in the new header get cloned mostly verbatim from
xmalloc.h, with the sole adjustment to switch unsigned long to size_t
for sizes and to unsigned int for alignments.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Actually edit a copy-and-pasted comment in xvmalloc.h which was
    meant to be edited from the beginning.
---
I'm unconvinced of the mentioning of "physically contiguous" in the
comment at the top of the new header: I don't think xmalloc() provides
such a guarantee. Any use assuming so would look (latently) broken to
me.

--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -37,7 +37,7 @@
 #include <xen/iommu.h>
 #include <xen/paging.h>
 #include <xen/keyhandler.h>
-#include <xen/vmap.h>
+#include <xen/xvmalloc.h>
 #include <xen/nospec.h>
 #include <xsm/xsm.h>
 #include <asm/flushtlb.h>
@@ -1925,27 +1925,28 @@ int grant_table_init(struct domain *d, i
     d->grant_table = gt;
 
     /* Active grant table. */
-    gt->active = xzalloc_array(struct active_grant_entry *,
-                               max_nr_active_grant_frames(gt));
+    gt->active = xvzalloc_array(struct active_grant_entry *,
+                                max_nr_active_grant_frames(gt));
     if ( gt->active == NULL )
         goto out;
 
     /* Tracking of mapped foreign frames table */
     if ( gt->max_maptrack_frames )
     {
-        gt->maptrack = vzalloc(gt->max_maptrack_frames * sizeof(*gt->maptrack));
+        gt->maptrack = xvzalloc_array(struct grant_mapping *,
+                                      gt->max_maptrack_frames);
         if ( gt->maptrack == NULL )
             goto out;
     }
 
     /* Shared grant table. */
-    gt->shared_raw = xzalloc_array(void *, gt->max_grant_frames);
+    gt->shared_raw = xvzalloc_array(void *, gt->max_grant_frames);
     if ( gt->shared_raw == NULL )
         goto out;
 
     /* Status pages for grant table - for version 2 */
-    gt->status = xzalloc_array(grant_status_t *,
-                               grant_to_status_frames(gt->max_grant_frames));
+    gt->status = xvzalloc_array(grant_status_t *,
+                                grant_to_status_frames(gt->max_grant_frames));
     if ( gt->status == NULL )
         goto out;
 
@@ -3870,19 +3871,19 @@ grant_table_destroy(
 
     for ( i = 0; i < nr_grant_frames(t); i++ )
         free_xenheap_page(t->shared_raw[i]);
-    xfree(t->shared_raw);
+    xvfree(t->shared_raw);
 
     for ( i = 0; i < nr_maptrack_frames(t); i++ )
         free_xenheap_page(t->maptrack[i]);
-    vfree(t->maptrack);
+    xvfree(t->maptrack);
 
     for ( i = 0; i < nr_active_grant_frames(t); i++ )
         free_xenheap_page(t->active[i]);
-    xfree(t->active);
+    xvfree(t->active);
 
     for ( i = 0; i < nr_status_frames(t); i++ )
         free_xenheap_page(t->status[i]);
-    xfree(t->status);
+    xvfree(t->status);
 
     xfree(t);
     d->grant_table = NULL;
--- a/xen/common/vmap.c
+++ b/xen/common/vmap.c
@@ -7,6 +7,7 @@
 #include <xen/spinlock.h>
 #include <xen/types.h>
 #include <xen/vmap.h>
+#include <xen/xvmalloc.h>
 #include <asm/page.h>
 
 static DEFINE_SPINLOCK(vm_lock);
@@ -301,11 +302,29 @@ void *vzalloc(size_t size)
     return p;
 }
 
-void vfree(void *va)
+static void _vfree(const void *va, unsigned int pages, enum vmap_region type)
 {
-    unsigned int i, pages;
+    unsigned int i;
     struct page_info *pg;
     PAGE_LIST_HEAD(pg_list);
+
+    ASSERT(pages);
+
+    for ( i = 0; i < pages; i++ )
+    {
+        pg = vmap_to_page(va + i * PAGE_SIZE);
+        ASSERT(pg);
+        page_list_add(pg, &pg_list);
+    }
+    vunmap(va);
+
+    while ( (pg = page_list_remove_head(&pg_list)) != NULL )
+        free_domheap_page(pg);
+}
+
+void vfree(void *va)
+{
+    unsigned int pages;
     enum vmap_region type = VMAP_DEFAULT;
 
     if ( !va )
@@ -317,18 +336,71 @@ void vfree(void *va)
         type = VMAP_XEN;
         pages = vm_size(va, type);
     }
-    ASSERT(pages);
 
-    for ( i = 0; i < pages; i++ )
+    _vfree(va, pages, type);
+}
+
+void xvfree(void *va)
+{
+    unsigned int pages = vm_size(va, VMAP_DEFAULT);
+
+    if ( pages )
+        _vfree(va, pages, VMAP_DEFAULT);
+    else
+        xfree(va);
+}
+
+void *_xvmalloc(size_t size, unsigned int align)
+{
+    ASSERT(align <= PAGE_SIZE);
+    return size <= PAGE_SIZE ? _xmalloc(size, align) : vmalloc(size);
+}
+
+void *_xvzalloc(size_t size, unsigned int align)
+{
+    ASSERT(align <= PAGE_SIZE);
+    return size <= PAGE_SIZE ? _xzalloc(size, align) : vzalloc(size);
+}
+
+void *_xvrealloc(void *va, size_t size, unsigned int align)
+{
+    size_t pages = vm_size(va, VMAP_DEFAULT);
+    void *ptr;
+
+    ASSERT(align <= PAGE_SIZE);
+
+    if ( !pages )
     {
-        struct page_info *page = vmap_to_page(va + i * PAGE_SIZE);
+        if ( size <= PAGE_SIZE )
+            return _xrealloc(va, size, align);
 
-        ASSERT(page);
-        page_list_add(page, &pg_list);
+        ptr = vmalloc(size);
+        if ( ptr && va && va != ZERO_BLOCK_PTR )
+        {
+            /*
+             * xmalloc-based allocations up to PAGE_SIZE don't cross page
+             * boundaries. Therefore, without needing to know the exact
+             * prior allocation size, simply copy the entire tail of the
+             * page containing the earlier allocation.
+             */
+            memcpy(ptr, va, PAGE_SIZE - PAGE_OFFSET(va));
+            xfree(va);
+        }
+    }
+    else if ( pages == PFN_UP(size) )
+        ptr = va;
+    else
+    {
+        ptr = _xvmalloc(size, align);
+        if ( ptr )
+        {
+            memcpy(ptr, va, min(size, pages << PAGE_SHIFT));
+            vfree(va);
+        }
+        else if ( pages > PFN_UP(size) )
+            ptr = va;
     }
-    vunmap(va);
 
-    while ( (pg = page_list_remove_head(&pg_list)) != NULL )
-        free_domheap_page(pg);
+    return ptr;
 }
 #endif
--- /dev/null
+++ b/xen/include/xen/xvmalloc.h
@@ -0,0 +1,73 @@
+
+#ifndef __XVMALLOC_H__
+#define __XVMALLOC_H__
+
+#include <xen/cache.h>
+#include <xen/types.h>
+
+/*
+ * Xen malloc/free-style interface for allocations possibly exceeding a page's
+ * worth of memory, as long as there's no need to have physically contiguous
+ * memory allocated.  These should be used in preference to xmalloc() et al
+ * whenever the size is not known to be constrained to at most a single page.
+ */
+
+/* Allocate space for typed object. */
+#define xvmalloc(_type) ((_type *)_xvmalloc(sizeof(_type), __alignof__(_type)))
+#define xvzalloc(_type) ((_type *)_xvzalloc(sizeof(_type), __alignof__(_type)))
+
+/* Allocate space for array of typed objects. */
+#define xvmalloc_array(_type, _num) \
+    ((_type *)_xvmalloc_array(sizeof(_type), __alignof__(_type), _num))
+#define xvzalloc_array(_type, _num) \
+    ((_type *)_xvzalloc_array(sizeof(_type), __alignof__(_type), _num))
+
+/* Allocate space for a structure with a flexible array of typed objects. */
+#define xvzalloc_flex_struct(type, field, nr) \
+    ((type *)_xvzalloc(offsetof(type, field[nr]), __alignof__(type)))
+
+#define xvmalloc_flex_struct(type, field, nr) \
+    ((type *)_xvmalloc(offsetof(type, field[nr]), __alignof__(type)))
+
+/* Re-allocate space for a structure with a flexible array of typed objects. */
+#define xvrealloc_flex_struct(ptr, field, nr)                          \
+    ((typeof(ptr))_xvrealloc(ptr, offsetof(typeof(*(ptr)), field[nr]), \
+                             __alignof__(typeof(*(ptr)))))
+
+/* Allocate untyped storage. */
+#define xvmalloc_bytes(_bytes) _xvmalloc(_bytes, SMP_CACHE_BYTES)
+#define xvzalloc_bytes(_bytes) _xvzalloc(_bytes, SMP_CACHE_BYTES)
+
+/* Free any of the above. */
+extern void xvfree(void *);
+
+/* Free an allocation, and zero the pointer to it. */
+#define XVFREE(p) do { \
+    xvfree(p);         \
+    (p) = NULL;        \
+} while ( false )
+
+/* Underlying functions */
+extern void *_xvmalloc(size_t size, unsigned int align);
+extern void *_xvzalloc(size_t size, unsigned int align);
+extern void *_xvrealloc(void *ptr, size_t size, unsigned int align);
+
+static inline void *_xvmalloc_array(
+    size_t size, unsigned int align, unsigned long num)
+{
+    /* Check for overflow. */
+    if ( size && num > UINT_MAX / size )
+        return NULL;
+    return _xvmalloc(size * num, align);
+}
+
+static inline void *_xvzalloc_array(
+    size_t size, unsigned int align, unsigned long num)
+{
+    /* Check for overflow. */
+    if ( size && num > UINT_MAX / size )
+        return NULL;
+    return _xvzalloc(size * num, align);
+}
+
+#endif /* __XVMALLOC_H__ */


