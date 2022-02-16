Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 226874B7E87
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 04:47:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273647.468891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKBGm-00017A-Fq; Wed, 16 Feb 2022 03:46:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273647.468891; Wed, 16 Feb 2022 03:46:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKBGm-00014i-Cr; Wed, 16 Feb 2022 03:46:20 +0000
Received: by outflank-mailman (input) for mailman id 273647;
 Wed, 16 Feb 2022 03:46:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7gZM=S7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nKBGk-00014c-HH
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 03:46:18 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe083a30-8eda-11ec-b215-9bbe72dcb22c;
 Wed, 16 Feb 2022 04:46:16 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5550C618DC;
 Wed, 16 Feb 2022 03:46:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5380FC004E1;
 Wed, 16 Feb 2022 03:46:14 +0000 (UTC)
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
X-Inumbo-ID: fe083a30-8eda-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644983174;
	bh=zDCx7Z12JnUoqx4oqbxMm3oeRe3hM8SHBDB4ZWLVdCI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=soeb/S2jkZTzDfoi3yW2Z075mauUG5n9wZU8gRsBjssggs93HNHaY78H8L2Aq3OYC
	 A5JKEpVZ2jibHLjL7QjOD+ct6XMjo+EhppiFEjnsH/5B0tlg+WtcHphWpcAfr4Mlh9
	 5NCfVpi8C08J6Iek/XosyMnYpBKnPlpPQax3UHv5jzbjMTdcp5K6SwWu2GLFrCDgKH
	 V/31vfnJZjamdtNH0GuC9Ds0WD0aM/WL55EA3S219MxqwHOlNDgP2EvBfaafBAZFSK
	 502BofdVxim0ZRy0zld6oopaBpT7hzrVDMzxBEFwGw8DbCYsWP9NBkmGQEWQQHhfM5
	 iNzfHi6pnEXZQ==
Date: Tue, 15 Feb 2022 19:46:14 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <JBeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH v2 02/70] xen/sort: Switch to an extern inline
 implementation
In-Reply-To: <70824a0c-cc48-b064-695c-35c2d06c0ad1@xen.org>
Message-ID: <alpine.DEB.2.22.394.2202151800230.43738@ubuntu-linux-20-04-desktop>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com> <20220214125127.17985-3-andrew.cooper3@citrix.com> <70824a0c-cc48-b064-695c-35c2d06c0ad1@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 14 Feb 2022, Julien Grall wrote:
> On 14/02/2022 12:50, Andrew Cooper wrote:
> > There are exactly 3 callers of sort() in the hypervisor.  Callbacks in a
> > tight
> > loop like this are problematic for performance, especially with Spectre v2
> > protections, which is why extern inline is used commonly by libraries.
> > 
> > Both ARM callers pass in NULL for the swap function, and while this might
> > seem
> > like an attractive option at first, it causes generic_swap() to be used,
> > which
> > forced a byte-wise copy.  Provide real swap functions so the compiler can
> > optimise properly, which is very important for ARM downstreams where
> > milliseconds until the system is up matters.
> 
> Did you actually benchmark it? Both those lists will have < 128 elements in
> them. So I would be extremely surprised if you save more than a few hundreds
> microseconds with this approach.
> 
> So, my opinion on this approach hasn't changed. On v1, we discussed an
> approach that would suit both Stefano and I. Jan seemed to confirm that would
> also suit x86.


This patch series has become 70 patches and for the sake of helping
Andrew move forward in the quickest and most painless way possible, I
append the following using generic_swap as static inline.

Julien, Bertrand, is that acceptable to you?

Andrew, I know this is not your favorite approach but you have quite a
lot of changes to handle -- probably not worth focussing on one detail
which is pretty minor?


---
xen/sort: Switch to an extern inline implementation

There are exactly 3 callers of sort() in the hypervisor.  Callbacks in a tight
loop like this are problematic for performance, especially with Spectre v2
protections, which is why extern inline is used commonly by libraries.

Make generic_swap() a static inline and used it at the two ARM call
sites.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/arm/bootfdt.c |  2 +-
 xen/arch/arm/io.c      |  2 +-
 xen/include/xen/sort.h | 67 ++++++++++++++++++++++++++++++++++-
 xen/lib/sort.c         | 80 ++----------------------------------------
 4 files changed, 70 insertions(+), 81 deletions(-)

diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index afaa0e249b..0d62945d56 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -472,7 +472,7 @@ size_t __init boot_fdt_info(const void *fdt, paddr_t paddr)
      * the banks sorted in ascending order. So sort them through.
      */
     sort(bootinfo.mem.bank, bootinfo.mem.nr_banks, sizeof(struct membank),
-         cmp_memory_node, NULL);
+         cmp_memory_node, generic_swap);
 
     early_print_info();
 
diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
index 729287e37c..1f35aaeea6 100644
--- a/xen/arch/arm/io.c
+++ b/xen/arch/arm/io.c
@@ -170,7 +170,7 @@ void register_mmio_handler(struct domain *d,
 
     /* Sort mmio handlers in ascending order based on base address */
     sort(vmmio->handlers, vmmio->num_entries, sizeof(struct mmio_handler),
-         cmp_mmio_handler, NULL);
+         cmp_mmio_handler, generic_swap);
 
     write_unlock(&vmmio->lock);
 }
diff --git a/xen/include/xen/sort.h b/xen/include/xen/sort.h
index a403652948..f6065eda58 100644
--- a/xen/include/xen/sort.h
+++ b/xen/include/xen/sort.h
@@ -3,8 +3,73 @@
 
 #include <xen/types.h>
 
+extern gnu_inline
+void generic_swap(void *a, void *b, size_t size)
+{
+    char t;
+
+    do {
+        t = *(char *)a;
+        *(char *)a++ = *(char *)b;
+        *(char *)b++ = t;
+    } while ( --size > 0 );
+}
+
+/*
+ * sort - sort an array of elements
+ * @base: pointer to data to sort
+ * @num: number of elements
+ * @size: size of each element
+ * @cmp: pointer to comparison function
+ * @swap: pointer to swap function or NULL
+ *
+ * This function does a heapsort on the given array. You may provide a
+ * swap function optimized to your element type.
+ *
+ * Sorting time is O(n log n) both on average and worst-case. While
+ * qsort is about 20% faster on average, it suffers from exploitable
+ * O(n*n) worst-case behavior and extra memory requirements that make
+ * it less suitable for kernel use.
+ */
+#ifndef SORT_IMPLEMENTATION
+extern gnu_inline
+#endif
 void sort(void *base, size_t num, size_t size,
           int (*cmp)(const void *, const void *),
-          void (*swap)(void *, void *, size_t));
+          void (*swap)(void *, void *, size_t))
+{
+    /* pre-scale counters for performance */
+    size_t i = (num / 2) * size, n = num * size, c, r;
+
+    /* heapify */
+    while ( i > 0 )
+    {
+        for ( r = i -= size; r * 2 + size < n; r = c )
+        {
+            c = r * 2 + size;
+            if ( (c < n - size) && (cmp(base + c, base + c + size) < 0) )
+                c += size;
+            if ( cmp(base + r, base + c) >= 0 )
+                break;
+            swap(base + r, base + c, size);
+        }
+    }
+
+    /* sort */
+    for ( i = n; i > 0; )
+    {
+        i -= size;
+        swap(base, base + i, size);
+        for ( r = 0; r * 2 + size < i; r = c )
+        {
+            c = r * 2 + size;
+            if ( (c < i - size) && (cmp(base + c, base + c + size) < 0) )
+                c += size;
+            if ( cmp(base + r, base + c) >= 0 )
+                break;
+            swap(base + r, base + c, size);
+        }
+    }
+}
 
 #endif /* __XEN_SORT_H__ */
diff --git a/xen/lib/sort.c b/xen/lib/sort.c
index 35ce0d7abd..b7e78cc0e8 100644
--- a/xen/lib/sort.c
+++ b/xen/lib/sort.c
@@ -4,81 +4,5 @@
  * Jan 23 2005  Matt Mackall <mpm@selenic.com>
  */
 
-#include <xen/types.h>
-
-static void u32_swap(void *a, void *b, size_t size)
-{
-    uint32_t t = *(uint32_t *)a;
-
-    *(uint32_t *)a = *(uint32_t *)b;
-    *(uint32_t *)b = t;
-}
-
-static void generic_swap(void *a, void *b, size_t size)
-{
-    char t;
-
-    do {
-        t = *(char *)a;
-        *(char *)a++ = *(char *)b;
-        *(char *)b++ = t;
-    } while ( --size > 0 );
-}
-
-/*
- * sort - sort an array of elements
- * @base: pointer to data to sort
- * @num: number of elements
- * @size: size of each element
- * @cmp: pointer to comparison function
- * @swap: pointer to swap function or NULL
- *
- * This function does a heapsort on the given array. You may provide a
- * swap function optimized to your element type.
- *
- * Sorting time is O(n log n) both on average and worst-case. While
- * qsort is about 20% faster on average, it suffers from exploitable
- * O(n*n) worst-case behavior and extra memory requirements that make
- * it less suitable for kernel use.
- */
-
-void sort(void *base, size_t num, size_t size,
-          int (*cmp)(const void *, const void *),
-          void (*swap)(void *, void *, size_t size))
-{
-    /* pre-scale counters for performance */
-    size_t i = (num / 2) * size, n = num * size, c, r;
-
-    if ( !swap )
-        swap = (size == 4 ? u32_swap : generic_swap);
-
-    /* heapify */
-    while ( i > 0 )
-    {
-        for ( r = i -= size; r * 2 + size < n; r = c )
-        {
-            c = r * 2 + size;
-            if ( (c < n - size) && (cmp(base + c, base + c + size) < 0) )
-                c += size;
-            if ( cmp(base + r, base + c) >= 0 )
-                break;
-            swap(base + r, base + c, size);
-        }
-    }
-
-    /* sort */
-    for ( i = n; i > 0; )
-    {
-        i -= size;
-        swap(base, base + i, size);
-        for ( r = 0; r * 2 + size < i; r = c )
-        {
-            c = r * 2 + size;
-            if ( (c < i - size) && (cmp(base + c, base + c + size) < 0) )
-                c += size;
-            if ( cmp(base + r, base + c) >= 0 )
-                break;
-            swap(base + r, base + c, size);
-        }
-    }
-}
+#define SORT_IMPLEMENTATION
+#include <xen/sort.h>
-- 
2.25.1


