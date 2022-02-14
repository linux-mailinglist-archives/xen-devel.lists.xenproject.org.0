Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8D24B50A7
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 13:52:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271500.465952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJapc-0003m4-50; Mon, 14 Feb 2022 12:51:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271500.465952; Mon, 14 Feb 2022 12:51:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJapc-0003jq-1x; Mon, 14 Feb 2022 12:51:52 +0000
Received: by outflank-mailman (input) for mailman id 271500;
 Mon, 14 Feb 2022 12:51:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJapa-0003jd-Dm
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 12:51:50 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd86c4bb-8d94-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 13:51:47 +0100 (CET)
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
X-Inumbo-ID: dd86c4bb-8d94-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843108;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aXXIf+NNN0QNk4zfqFs4eP6IyzxPbQMRw4LdRyX5iLE=;
  b=DLn+ya2af5u4QtUc1x13c/XqDhf1fGdxxiGJLYCSVLlpICWC9mY+NXz0
   Mk7wcVXLuwbteeOLN11tIq18UWYPnWwz6+CPiMgy4zV63LBpKFnzGjvsn
   SMXKeAc2PzvtztRjVkjOO+PQD6OyDvfyji6WmcmkR4PcFLqIlUPTn2VDT
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: JUo4Vd3pfWa8T/jVOep+89YwoUs2d7+ivu7Rcedm30U9L93QAmJj3deGVoZiN3Fe8jL8JI5s3u
 4/puwCUfVqCWZSy/P3twSEYNjYwy9njJhXFAeG0lQRXpTuovLJCb04Th2Oh0eCFmzyokEO359f
 SDQrj1MO4Cs1CdWigft0Bnjq7kPZgNV5E+hqLoMqAzfSfnPHnRUtgk8z0oLbVJayvGqcZhC6J7
 5sqCCY2kVV0v8THKKOGgIFXXTyrPUCSjgHBimhX1rUPeW0RP49WwsAtDgOlh5oraD5EilFIWQy
 8EftccNWIhriLpMoDfdvkJBn
X-SBRS: 5.1
X-MesageID: 64148059
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:rOj1sKsrj3R06oxB0P+t65vbz+fnVMtZMUV32f8akzHdYApBsoF/q
 tZmKWiOPq7YY2r0L90lO462/RsDvMLVn943TQdlryBkFSwV+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYy2IThWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Nplioa9WRoTOIT2qv03VzhjCxlleqJL0eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6AO
 5NFOWIyPXwsZTVvKBQPEZAbwdyLh3zjXSF/knnNv5c4tj27IAtZj+G2bYu9lsaxbcdImkeVo
 ErW8mK/BQsVXPShzj6C/mOpl/X4tyrxU4IPF5W17vdvxlaUwwQ7AhAMSUGyp/X/j0ekQs9eM
 GQd4C9opq83nGS0SvHtUhv+p2SL1jYMVtwVH+Ak5QWlzqvP/x3fFmUCViRGatEtqIkxXzNC/
 n2jks7tBDdvmKaIUn/b/bCRxRupIjQcJ2IGYS4CTCMG7sPlrYV1iQjAJuuPC4bs0IezQ2uph
 WnX8m5u3N3/kPLnyY2E513Xngiqj6L7VyQxxz7PZnni4Q5QMdvNi5OT1XDX6vNJLYC8R1aHv
 WQZl8X20N3iHa1hhwTWHrxTQejBC+KtdWSF3AUxR8VJGyGFpib7Fb289g2SM6uA3iwsXTbyK
 HHetgpKjHO4FCv7NPQnC25d5ilD8EQBKTgHfq2OBjatSsIoHONiwM2JTRTOt10BaGB2zckC1
 W6zKK5A90oyB6V91yaRTOwAy7ItzS1W7TqNGcykn0T6jOLHPyT9pVI53LymNL5R0U95iF+Nr
 4Y32zWil32zr9ESkgGIqNVOfDjm3FAwBIzsqtw/SwJwClEOJY3VMNeImelJU9U8x8x9z76Ul
 lngCh4w4Aeu3hXvdFTVAk2PnZuyBP6TW1pgZndyVbtpslB+CbuSAFA3KcdmI+l/rLY7pRO2J
 tFcE/i97j10Ymyv01wggVPV9uSOrTyn2lCDOTSLej86c8IyTgDF4Ia8LADu6DMPHmy8ss5n+
 ++s0QbSQJwiQQV+DZmJNKLzng3p5XVNyvhvW0boI8VIfBm++oZdNCGs3OQ8JNsBKEufy2LCh
 RqWGxoRucLEv5QxrIvSnamBoorwS7l+E0NWEnP197GzMSWGrGOvzZUZCLSDfCzHVXOy86KnP
 L0Hw/b5OfwBvVBLr4sjTOo7kfNgv4Pi/uYIwB5lEXPHa0WQJolhenTWj9NSsqBtx6NCvVfkU
 Ey45dQHa66CP9noEQBNKVN9PPiDz/wdhhLb8e8xfBfh/CZy8beKDRdSMh2LhHAPJbd5Ktp4k
 +IoucpQ4A2jkBs6dN2Bi3kMpWiLK3UBVYQht40bX9C32lZ6lAkabMyOEDLy7bGOd85IYxsjL
 TKjjabfg6hRmxjZeH0pGHmRhedQiPziYvyRIIPu87hRpuf4uw==
IronPort-HdrOrdr: A9a23:l6iu4qsnagOUOA9OLGPnExlv7skDTtV00zEX/kB9WHVpmszxra
 6TdZMgpGbJYVcqKRcdcL+7WJVoLUmxyXcx2/h1AV7AZniAhILLFvAA0WKK+VSJcEeSygce79
 YFT0EXMqyJMbEQt6fHCWeDfOrIuOP3kpyVuQ==
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64148059"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH v2 02/70] xen/sort: Switch to an extern inline implementation
Date: Mon, 14 Feb 2022 12:50:19 +0000
Message-ID: <20220214125127.17985-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
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

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
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
index a403652948e7..01479ea44606 100644
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


