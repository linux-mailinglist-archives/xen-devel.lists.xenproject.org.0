Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F2B2A9009
	for <lists+xen-devel@lfdr.de>; Fri,  6 Nov 2020 08:12:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20416.46322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kavuc-0003YS-J2; Fri, 06 Nov 2020 07:11:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20416.46322; Fri, 06 Nov 2020 07:11:54 +0000
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
	id 1kavuc-0003Y5-Fn; Fri, 06 Nov 2020 07:11:54 +0000
Received: by outflank-mailman (input) for mailman id 20416;
 Fri, 06 Nov 2020 07:11:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DqEO=EM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kavua-0003Xx-HW
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 07:11:52 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ee6b1276-9ff9-433a-adc1-172ddbc26809;
 Fri, 06 Nov 2020 07:11:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 28DBEADE8;
 Fri,  6 Nov 2020 07:11:50 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=DqEO=EM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kavua-0003Xx-HW
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 07:11:52 +0000
X-Inumbo-ID: ee6b1276-9ff9-433a-adc1-172ddbc26809
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ee6b1276-9ff9-433a-adc1-172ddbc26809;
	Fri, 06 Nov 2020 07:11:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604646710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pX4ONVtHGJzi69SDx/yzKFYwcoXyNjHMUa/NNVNyz5U=;
	b=BEt4VvtQfLMRQ32JK8W8lRujrMvuiAHsOc/ivGLIv5FYuGYEBnM98ZkZGEzTL8r3iE6vLK
	y2dawlrH0c9/Exjq4UWFsKGzoIahZDCcMexC19nIYGHXb2nqZBW1qDFs5mSK0t3bdORYDs
	ROGQweOWmN6ETZFjIvcDkiIxwTieJQA=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 28DBEADE8;
	Fri,  6 Nov 2020 07:11:50 +0000 (UTC)
Subject: [PATCH 1/3] mm: introduce xvmalloc() et al and use for grant table
 allocations
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <e0364274-f123-82bd-ec85-bea519a34049@suse.com>
Message-ID: <d98aabe4-6c1b-0970-2e42-eb991e9075a2@suse.com>
Date: Fri, 6 Nov 2020 08:11:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <e0364274-f123-82bd-ec85-bea519a34049@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

All of the array allocations in grant_table_init() can exceed a page's
worth of memory, which xmalloc()-based interfaces aren't really suitable
for after boot. Introduce interfaces dynamically switching between
xmalloc() et al and vmalloc() et al, based on requested size, and use
them instead.

All the wrappers in the new header get cloned mostly verbatim from
xmalloc.h, with the sole adjustment to switch unsigned long to size_t
for sizes and to unsigned int for alignments.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

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
@@ -299,11 +300,29 @@ void *vzalloc(size_t size)
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
@@ -315,18 +334,71 @@ void vfree(void *va)
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
@@ -0,0 +1,70 @@
+
+#ifndef __XVMALLOC_H__
+#define __XVMALLOC_H__
+
+#include <xen/cache.h>
+#include <xen/types.h>
+
+/*
+ * Xen malloc/free-style interface.
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


