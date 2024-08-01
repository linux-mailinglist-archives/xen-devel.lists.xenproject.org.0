Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1847C94447E
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2024 08:31:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769331.1180199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZPKj-00031D-Ur; Thu, 01 Aug 2024 06:30:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769331.1180199; Thu, 01 Aug 2024 06:30:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZPKj-0002zB-R6; Thu, 01 Aug 2024 06:30:41 +0000
Received: by outflank-mailman (input) for mailman id 769331;
 Thu, 01 Aug 2024 06:30:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/4YK=PA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZPKi-0002z5-4t
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2024 06:30:40 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90e8b2da-4fcf-11ef-8776-851b0ebba9a2;
 Thu, 01 Aug 2024 08:30:38 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5af6a1afa63so7202065a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2024 23:30:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad9068esm849347066b.153.2024.07.31.23.30.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jul 2024 23:30:37 -0700 (PDT)
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
X-Inumbo-ID: 90e8b2da-4fcf-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722493837; x=1723098637; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y8PLSN17dNTu2v/AhOJNpOiMDIjtTKM6n2a/vLiKui0=;
        b=D5i+7aAkTCv8TYNT60JrJIQIRmCkFKNP1qxvrSEgTI0kKqUDRT2qFhDCluAg4thl6W
         CXUkrnkFe/urchmdr2hXe3jqTiUxTROTaUl0fWQpKNSjo539uKKbIhP025z1HY2/6jkU
         kL+y6PEjodJ3Eaa//gew0QkDrvngFSMzBlwMhsOG4ZUy1R1TYlS5uDunCXXLPwNN+I60
         LRGmsIcQxyfM0NsDzjblSyPLK0vxAtgYf4QXlynpQBNc9L0zYIZWDj4xQmPYC3aDFXU+
         i7tdByIEnhN0QPirgPKCmVrwNuQoouLGB8nV4T8a+9eQs/3iP9SDHIuqBTNrC6q5bvTJ
         c7Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722493837; x=1723098637;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y8PLSN17dNTu2v/AhOJNpOiMDIjtTKM6n2a/vLiKui0=;
        b=UadTYAk3wgb7STOLcqnNZ/eVV++vi6ptY1lxRJAHGeSY1vE9A41OZXzygChPqOdYlB
         52r0mqS9jHox0vCyaE4f5GN6IIdorh4QfzmAknemfhr/WNWFXuYIaCdQpdthSHbBT73C
         ogvhQNEKnolJLI0PJ6VJT6r6SKV5SSDE27GmjxA89CZWcah9th9dvxlpP7WpbK5M1+E9
         C91M6sJg4dv9Daqhv0iLIok40WH0KSakFI/PoaRK+SFm9zsWGmQj0FQLaBm0+GVE8Ru7
         tYUO+CUfHjPGoFQH8O525sUNUNI72TEaospkEtY2bzhf5tQrTUm6bNH/S+v96WZXiAI/
         e2tg==
X-Gm-Message-State: AOJu0YwiUGNlBvvHcwjvZENZp6Kc75sEhHHjHYjqiZtpIiDz45ooxvB+
	LeEp3efXsPPLYDW6dd8mrJiT982r34jWREy/marsdPQqmRUKH2n0l1KlfK4Qao/1rFtOlrhzUPg
	=
X-Google-Smtp-Source: AGHT+IHzISJOmgEw1mU9HHDIs+MegPj3f0EGytFAej0JqlX5q3DDKGtOO74Xbp7Vz47Q1whfJcqbVw==
X-Received: by 2002:a17:907:980d:b0:a6f:6126:18aa with SMTP id a640c23a62f3a-a7daf64d740mr91562966b.67.1722493837319;
        Wed, 31 Jul 2024 23:30:37 -0700 (PDT)
Message-ID: <300f7bb3-3ab6-44ec-9663-b9934c3e123c@suse.com>
Date: Thu, 1 Aug 2024 08:30:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4] mm: introduce xvmalloc() et al and use for grant table
 allocations
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

All of the array allocations in grant_table_init() can exceed a page's
worth of memory, which xmalloc()-based interfaces aren't really suitable
for after boot. We also don't need any of these allocations to be
physically contiguous. Introduce interfaces dynamically switching
between xmalloc() et al and vmalloc() et al, based on requested size,
and use them instead.

All the wrappers in the new header are cloned mostly verbatim from
xmalloc.h, with the sole adjustment to switch unsigned long to size_t
for sizes and to unsigned int for alignments, and with the cloning of
x[mz]alloc_bytes() avoided. The exception is xvmemdup(), where the
const related comment on xmemdup() is actually addressed and hence
dropped.

While adjusting grant_table_destroy() also move ahead the clearing of
the struct domain field.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v4: Add note to xmalloc.h and update the corresponding comment in
    xvmalloc.h. Add xvmemdup(). Drop "extern". Drop xv[mz]alloc_bytes().
    Adjust header guard name. Fully switch over grant_table.c. Re-base.
v2: Actually edit a copy-and-pasted comment in xvmalloc.h which was
    meant to be edited from the beginning.

--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -39,7 +39,7 @@
 #include <xen/paging.h>
 #include <xen/keyhandler.h>
 #include <xen/radix-tree.h>
-#include <xen/vmap.h>
+#include <xen/xvmalloc.h>
 #include <xen/nospec.h>
 #include <xsm/xsm.h>
 #include <asm/flushtlb.h>
@@ -1995,7 +1995,7 @@ int grant_table_init(struct domain *d, i
         return -EINVAL;
     }
 
-    if ( (gt = xzalloc(struct grant_table)) == NULL )
+    if ( (gt = xvzalloc(struct grant_table)) == NULL )
         return -ENOMEM;
 
     /* Simple stuff. */
@@ -2012,15 +2012,16 @@ int grant_table_init(struct domain *d, i
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
 
@@ -2028,13 +2029,13 @@ int grant_table_init(struct domain *d, i
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
 
@@ -4010,23 +4011,24 @@ grant_table_destroy(
     if ( t == NULL )
         return;
 
+    d->grant_table = NULL;
+
     for ( i = 0; i < nr_grant_frames(t); i++ )
         free_xenheap_page(t->shared_raw[i]);
-    xfree(t->shared_raw);
+    xvfree(t->shared_raw);
 
     ASSERT(!t->maptrack_limit);
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
 
-    xfree(t);
-    d->grant_table = NULL;
+    xvfree(t);
 }
 
 void grant_table_init_vcpu(struct vcpu *v)
--- a/xen/common/vmap.c
+++ b/xen/common/vmap.c
@@ -7,6 +7,7 @@
 #include <xen/spinlock.h>
 #include <xen/types.h>
 #include <xen/vmap.h>
+#include <xen/xvmalloc.h>
 #include <asm/page.h>
 
 static DEFINE_SPINLOCK(vm_lock);
@@ -335,28 +336,95 @@ void *vzalloc(size_t size)
     return p;
 }
 
-void vfree(void *va)
+static void _vfree(const void *va, unsigned int pages)
 {
-    unsigned int i, pages;
+    unsigned int i;
     struct page_info *pg;
     PAGE_LIST_HEAD(pg_list);
 
-    if ( !va )
-        return;
-
-    pages = vmap_size(va);
     ASSERT(pages);
 
     for ( i = 0; i < pages; i++ )
     {
-        struct page_info *page = vmap_to_page(va + i * PAGE_SIZE);
-
-        ASSERT(page);
-        page_list_add(page, &pg_list);
+        pg = vmap_to_page(va + i * PAGE_SIZE);
+        ASSERT(pg);
+        page_list_add(pg, &pg_list);
     }
     vunmap(va);
 
     while ( (pg = page_list_remove_head(&pg_list)) != NULL )
         free_domheap_page(pg);
 }
+
+void vfree(void *va)
+{
+    if ( !va )
+        return;
+
+    _vfree(va, vmap_size(va));
+}
+
+void xvfree(void *va)
+{
+    unsigned int pages = vm_size(va, VMAP_DEFAULT);
+
+    if ( pages )
+        _vfree(va, pages);
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
+    {
+        if ( size <= PAGE_SIZE )
+            return _xrealloc(va, size, align);
+
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
+    }
+
+    return ptr;
+}
 #endif
--- a/xen/include/xen/xmalloc.h
+++ b/xen/include/xen/xmalloc.h
@@ -7,6 +7,9 @@
 
 /*
  * Xen malloc/free-style interface.
+ *
+ * NOTE: Unless physically contiguous memory space is required, the interfaces
+ *       in xvmalloc.h are to be used in preference to the ones here.
  */
 
 /* Allocate space for typed object. */
--- /dev/null
+++ b/xen/include/xen/xvmalloc.h
@@ -0,0 +1,75 @@
+#ifndef XEN__XVMALLOC_H
+#define XEN__XVMALLOC_H
+
+#include <xen/types.h>
+
+/*
+ * Xen malloc/free-style interface, as long as there's no need to have
+ * physically contiguous memory allocated.  These should be used in preference
+ * to xmalloc() et al.
+ */
+
+/* Allocate space for typed object. */
+#define xvmalloc(_type) ((_type *)_xvmalloc(sizeof(_type), __alignof__(_type)))
+#define xvzalloc(_type) ((_type *)_xvzalloc(sizeof(_type), __alignof__(_type)))
+
+/* Allocate space for a typed object and copy an existing instance. */
+#define xvmemdup(ptr)                                          \
+({                                                             \
+    void *p_ = _xvmalloc(sizeof(*(ptr)), __alignof__(*(ptr))); \
+    if ( p_ )                                                  \
+        memcpy(p_, ptr, sizeof(*(ptr)));                       \
+    (typeof(*(ptr)) *)p_;                                      \
+})
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
+/* Free any of the above. */
+void xvfree(void *);
+
+/* Free an allocation, and zero the pointer to it. */
+#define XVFREE(p) do { \
+    xvfree(p);         \
+    (p) = NULL;        \
+} while ( false )
+
+/* Underlying functions */
+void *_xvmalloc(size_t size, unsigned int align);
+void *_xvzalloc(size_t size, unsigned int align);
+void *_xvrealloc(void *ptr, size_t size, unsigned int align);
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
+#endif /* XEN__XVMALLOC_H */

