Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA72444DB5F
	for <lists+xen-devel@lfdr.de>; Thu, 11 Nov 2021 18:58:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224830.388354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlEKw-000648-Qk; Thu, 11 Nov 2021 17:58:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224830.388354; Thu, 11 Nov 2021 17:58:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlEKw-00061S-MX; Thu, 11 Nov 2021 17:58:10 +0000
Received: by outflank-mailman (input) for mailman id 224830;
 Thu, 11 Nov 2021 17:58:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GOKj=P6=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mlEKv-0005kR-6q
 for xen-devel@lists.xenproject.org; Thu, 11 Nov 2021 17:58:09 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ecce4348-4318-11ec-9787-a32c541c8605;
 Thu, 11 Nov 2021 18:58:07 +0100 (CET)
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
X-Inumbo-ID: ecce4348-4318-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636653487;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wZjOooR7h3617EbhfqFJc1ylcvpSG2QwEC0bQQSIklo=;
  b=H184UounUCpDqJbBWjVnZhwg7Cvd38MeHcehF4gQ+47ZLLD6VjGUK3Sj
   D0AHlE3HdzGRMQkPClVTugIMJpx+MEmx6JNC2sezIwwQD0Ylu4WRQLQe4
   gAXAowJg32tscjROYZCPwlm0spjevpmdpl1Qrz/Hrx77E1KNedrF0DL3S
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: DJMeo/F80T5kkf/alFsTsShab5w4ojag5j96fmWJRUuoVF0nOYRG6bTFv4REPTw7nzPOjDXJiG
 yo7lOH9d8DMQKSC1S2swjdAqYyGN+1cquh91CSrXsHqqPeJD/IBAy2VFMxznZXwsKeSfBee/Gx
 97L+CpZS3oPCDaoBiYteVp1W5hJ8/162HQyOW/qWGv9yBicwosirfnX+tyRtUC3z+P/rZFgpFL
 nr+BTBW6OgTjFxpaKndUUAvArOIO3uugmo9D2z/yLV0XRpwpIbKV4QvLqcQmscoExA7kzottqF
 DzZ8F8VwbrxKU67Iyw6JpB5r
X-SBRS: 5.1
X-MesageID: 57653926
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:C4ryNqKjPLpZJsZwFE+RcpIlxSXFcZb7ZxGr2PjKsXjdYENS12MEy
 jcdXz2GPKuCamqhKI92PNvk90wCvZfTnNVnGwBlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZUideSc+EH140Es6wrZg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2Cz/Iq4
 /pQv6erTAd1b4ucmboUVydHRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFFgMg5IdatF4QYonx6lhnSDOo8QICFSKLPjTNd9Gpv2J0VTKyAD
 yYfQWs1cxLGXRIfAHIeVLt92/qzj0LvKiIN/Tp5ooJoujOOnWSdyoPFMsfRe9GMbdVYmACfv
 G2u11r+BhYWJdmO0w2v+3inhvLMtS7jUYdUH7q9ntZgjUeP3GUVBFsTXEGivPiiokekXpRUL
 El80jUqhbg/8gqsVNaVdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QOluU7WDgr3
 V+hhM7yCHpkt7j9YWmG6r6eoDe2OC4UBWwPfykJSU0C+daLnW0opkuRFJA5Svfz14CrX2Grq
 9yXkMQgr75Dr5Ug+LixxkvCg279gMjIEAcx2BqCCwpJ8ThFTIKiYoWp733S4vBBMJuVQzG9g
 ZQUpySNxLtQVM/QzURhVM1IRej0vKjdbFUwlHY2R8F5nwlB7UJPamy5DNtWAE5yevgJdjbyC
 KM4kVMAvcQDVJdGgEIeXm5QNyjI5fS/fTgGfqqNBjarXnSXXFbWlM2JTRTAt10BaGB2zckC1
 W6zKK5A90oyB6V91yaRTOwAy7ItzS1W7TqNHs6mkUX4gefBOyH9pVI53L2mN7FRAESs+lW9z
 jqiH5HSl0U3vBPWPkE7DrL/3XhVdCNmVPgaWuRcd/KZIxoOJY3SI6S5/F/VQKQ8x/49vr6Rp
 hmVAxYEoHKi1SyvAVjbMRhLNeKwNauTWFpmZETAy37zgCN9CWtuhY9CH6YKkU4PqLY+kKUqF
 qZdIK1twJ1nE1z6xtjUVrGlxKQKSfhhrVjm0/ONbGdtcph+aRbO/9O4LALj+DNXVni8tNcko
 q3m3QTeGMJRSwNnBcfQSfSu01Lu4iRNxLMsBxPFcotJZUHh0Il2MCit3PU5FN4BdEfYzTyA2
 gfIXRpB/bvRo5U4+cXijLyfq9v7CPN3G0dXRjGJ7bu/OSTA0HCkxItMDLSBcTzHDTum86S+f
 +RFifr7NaRfzlpNtoN9FZdtzL4/uISz9+MLkFw8ESySPVqxC75mLn2X5uV1t/VAlu1DpA+7e
 kOT4d0Ga7+HD9zoTQwKLw0/Y+XdifxNwmvO7e44KVnR7TNs+ObVSl1bOhSBhXAPLLZxN495k
 +4ttNRPtl66gxsudN2HkjpV5yKHKXlZC/crsZQTAYnKjAs3yw4dPcyAW3GuuJzfOc9RNkQKI
 yOPgPuQjrtR8UPObn4vGCWfxuFan5kP5EhHwVJqy45lQTYZaivbBCFszAk=
IronPort-HdrOrdr: A9a23:m1QOnau0xHHIRx4Mt+A+cgtu7skDTtV00zEX/kB9WHVpmszxra
 6TdZMgpGbJYVcqKRcdcL+7WJVoLUmxyXcx2/h1AV7AZniAhILLFvAA0WKK+VSJcEeSygce79
 YFT0EXMqyJMbEQt6fHCWeDfOrIuOP3kpyVuQ==
X-IronPort-AV: E=Sophos;i="5.87,226,1631592000"; 
   d="scan'208";a="57653926"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH 3/5] xen/sort: Switch to an extern inline implementation
Date: Thu, 11 Nov 2021 17:57:38 +0000
Message-ID: <20211111175740.23480-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211111175740.23480-1-andrew.cooper3@citrix.com>
References: <20211111175740.23480-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

There are exactly 3 callers of sort() in the hypervisor.

Both arm callers pass in NULL for the swap function.  While this might seem
like an attractive option at first, it causes generic_swap() to be used which
forced a byte-wise copy.  Provide real swap functions which the compiler can
optimise sensibly.

Furthermore, use of function pointers in tight loops like that can be very bad
for performance.  Implement sort() as extern inline, so the optimiser can
judge whether to inline things or not.

On x86, the diffstat shows how much of a better job the compiler can do when
it is able to see the cmp/swap implementations.

  $ ../scripts/bloat-o-meter xen-syms-before xen-syms-after
  add/remove: 0/5 grow/shrink: 1/1 up/down: 505/-735 (-230)
  Function                                     old     new   delta
  sort_exception_table                          31     536    +505
  u32_swap                                       9       -      -9
  generic_swap                                  34       -     -34
  cmp_ex                                        36       -     -36
  swap_ex                                       41       -     -41
  sort_exception_tables                         90      38     -52
  sort                                         563       -    -563

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
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


