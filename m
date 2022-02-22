Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A7D4BFC86
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 16:27:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276861.473249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMX4b-0007yr-F0; Tue, 22 Feb 2022 15:27:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276861.473249; Tue, 22 Feb 2022 15:27:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMX4a-0007kE-HR; Tue, 22 Feb 2022 15:27:28 +0000
Received: by outflank-mailman (input) for mailman id 276861;
 Tue, 22 Feb 2022 15:27:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Woib=TF=citrix.com=prvs=045a4fa17=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nMX4W-0006Cs-Tr
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 15:27:25 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee7f66ff-93f3-11ec-8539-5f4723681683;
 Tue, 22 Feb 2022 16:27:23 +0100 (CET)
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
X-Inumbo-ID: ee7f66ff-93f3-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645543643;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YvugFJaL6MOaaDvMEXxrAztfnWSnB+eJNt0lMJu1ZCI=;
  b=HsS/xpwXxSKHWjOATKlQ38wtnxiOvuzhN+xbbNEUqupr84YGyJ/bz++/
   nLf38GXGKHJp0BnFM1b13FBSAJgv8zPW/XNm+FismwEkGMUzs7M/v2UV0
   oJs2s71Gr+26ZPmw3PE9RjUXPTi/Cp7UxABzSEuv/Ia/KKfV+UgfcpJh6
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 64732554
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:qmf2V688elTIP6AU6HKiDrUDW36TJUtcMsCJ2f8bNWPcYEJGY0x3n
 WMXWzyDa/qPNmKmc91zOonn90NS7cSEnNVnSlNt+X88E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2NQw24LjW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnZWLe0QmJPH2pLgAYSF7AxAhJa0a9YaSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFKoZtmtt0nfyCvE+TIqYa67L+cVZzHE7gcUm8fP2O
 ZZGMmAyMUiojxtnZHcOT5AnktqSgFL1SSZV+HGsj7c97D2GpOB2+Oe0a4eEEjCQfu1Xg0KZq
 2Tu72n/RBYAO7S39z2B9X69g/7VqgnyUokSCb6Q++ZjhRuYwWl7IBcbT0ehqP+1zEu3QctCK
 lc88zAr66M18SSDUd3VTxC+5nmesXY0S9dWVuE39gyJ4q7V+BqCQHgJSCZbb94rv9NwQiYlv
 nertd70AT1ksJWOVGmQsLyTqFuaIjMJJGUPYSsFSwot4NT5pow3yBXVQb5e/LWd14OvX2uqm
 nbT8XZ41+57YdM3O7uT9Gv1wD22+qL1EhMH3ibHbz297l90XdvwD2C30mTz4fFFJYefa1COu
 nkYhsSThNwz4YGxeD+lG7tUQuzwjxqRGHiF2AM0QcF9n9i40yP7JehtDCdCyFCF2yruURvge
 wfttAxY//e/11P6PPYsM+pd5ynHpJUM9OgJtNiJNrKigbArLWdrGR2Cg2bKhAgBd2B2zMkC1
 W+zK5rEMJrjIf0PIMCKb+kcy6Q34Ss12HneQ5v2pzz+j+bDOCDEFOpfbALWBgzc0E9iiF+Om
 zq4H5HXoyizrcWkOnWHmWLtBQpiwYcH6WDe9JUMK7/rzvtOE2A9Ef7BqY7NiKQ+95m5Ytzgp
 ynnMmcBkQKXrSSedW2iNyAyAJuyDM0XhS9qYkQR0aOAhiFLjXCHt/xEKfPavNAPqYRe8BKDZ
 6NbI57ZWqwXEFwqOV01NPHAkWCrTzzz7SrmAsZvSGJXk0JIL+ARxuLZQw==
IronPort-HdrOrdr: A9a23:XxPKoaw0wSuYcDlr499UKrPwFL1zdoMgy1knxilNoRw8SKKlfq
 eV7Y0mPH7P+VAssR4b+exoVJPtfZqYz+8R3WBzB8bEYOCFghrKEGgK1+KLqFeMJ8S9zJ846U
 4JSdkHNDSaNzlHZKjBjzVQa+xQouW6zA==
X-IronPort-AV: E=Sophos;i="5.88,387,1635220800"; 
   d="scan'208";a="64732554"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH v3 01/70] xen/sort: Switch to an extern inline implementation
Date: Tue, 22 Feb 2022 15:26:31 +0000
Message-ID: <20220222152645.8844-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220222152645.8844-1-andrew.cooper3@citrix.com>
References: <20220222152645.8844-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

There are exactly 3 callers of sort() in the hypervisor.  Callbacks in a tight
loop like this are problematic for performance, especially with Spectre v2
protections, which is why extern inline is used commonly by libraries.

Both ARM callers pass in NULL for the swap function, and while this might seem
like an attractive option at first, it causes generic_swap() to be used, which
forced a byte-wise copy.  Provide real swap functions so the compiler can
optimise properly, which is very important for ARM downstreams where
milliseconds until the system is up matters.

This is also important for Control Flow Integrity schemes (e.g. x86 CET-IBT,
ARM BTI), because tagged function(s) performing an arbitrary length swap of
two arbitrary pointers is a very valuable gadget for an attacker.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>

v2:
 * Adjust commit message
v3:
 * Adjust comment
 * Adjust commit message again
---
 xen/arch/arm/bootfdt.c |  9 +++++-
 xen/arch/arm/io.c      |  9 +++++-
 xen/include/xen/sort.h | 55 +++++++++++++++++++++++++++++++++-
 xen/lib/sort.c         | 80 ++------------------------------------------------
 4 files changed, 72 insertions(+), 81 deletions(-)

diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index afaa0e249b71..e318ef960386 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -448,6 +448,13 @@ static int __init cmp_memory_node(const void *key, const void *elem)
     return 0;
 }
 
+static void __init swap_memory_node(void *_a, void *_b, size_t size)
+{
+    struct membank *a = _a, *b = _b;
+
+    SWAP(*a, *b);
+}
+
 /**
  * boot_fdt_info - initialize bootinfo from a DTB
  * @fdt: flattened device tree binary
@@ -472,7 +479,7 @@ size_t __init boot_fdt_info(const void *fdt, paddr_t paddr)
      * the banks sorted in ascending order. So sort them through.
      */
     sort(bootinfo.mem.bank, bootinfo.mem.nr_banks, sizeof(struct membank),
-         cmp_memory_node, NULL);
+         cmp_memory_node, swap_memory_node);
 
     early_print_info();
 
diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
index 729287e37c59..1a066f9ae502 100644
--- a/xen/arch/arm/io.c
+++ b/xen/arch/arm/io.c
@@ -80,6 +80,13 @@ static int cmp_mmio_handler(const void *key, const void *elem)
     return 0;
 }
 
+static void swap_mmio_handler(void *_a, void *_b, size_t size)
+{
+    struct mmio_handler *a = _a, *b = _b;
+
+    SWAP(*a, *b);
+}
+
 static const struct mmio_handler *find_mmio_handler(struct domain *d,
                                                     paddr_t gpa)
 {
@@ -170,7 +177,7 @@ void register_mmio_handler(struct domain *d,
 
     /* Sort mmio handlers in ascending order based on base address */
     sort(vmmio->handlers, vmmio->num_entries, sizeof(struct mmio_handler),
-         cmp_mmio_handler, NULL);
+         cmp_mmio_handler, swap_mmio_handler);
 
     write_unlock(&vmmio->lock);
 }
diff --git a/xen/include/xen/sort.h b/xen/include/xen/sort.h
index a403652948e7..2f52ff85b9e4 100644
--- a/xen/include/xen/sort.h
+++ b/xen/include/xen/sort.h
@@ -3,8 +3,61 @@
 
 #include <xen/types.h>
 
+/*
+ * sort - sort an array of elements
+ * @base: pointer to data to sort
+ * @num: number of elements
+ * @size: size of each element
+ * @cmp: pointer to comparison function
+ * @swap: pointer to swap function
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
index 35ce0d7abdec..b7e78cc0e8d2 100644
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
2.11.0


