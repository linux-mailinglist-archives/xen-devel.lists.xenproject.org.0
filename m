Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEFC6C72B5
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 23:02:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514092.796040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfT04-0000Xv-AV; Thu, 23 Mar 2023 22:01:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514092.796040; Thu, 23 Mar 2023 22:01:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfT04-0000WB-7Y; Thu, 23 Mar 2023 22:01:36 +0000
Received: by outflank-mailman (input) for mailman id 514092;
 Thu, 23 Mar 2023 22:01:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k1NO=7P=citrix.com=prvs=439d27799=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pfT03-0000W5-Kg
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 22:01:35 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43dd07fd-c9c6-11ed-b464-930f4c7d94ae;
 Thu, 23 Mar 2023 23:01:32 +0100 (CET)
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
X-Inumbo-ID: 43dd07fd-c9c6-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679608891;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KAtgOwS/P2wrgB5h4mPIFKyRQHmiQm30GVJXeDtRYjA=;
  b=Ghw126+E6BBWiE08p3lvY6HifUhRjpKAtSEXphBEqmgmnRp/3CtOnCb+
   CDDFCP+QrLYU+/3zeekqovsRcpdJmLD9ITR33uZWk1InLJDNRy+9FX3TE
   N3H2Oo7fGPN2pIs40BaHXdMAxxj6UxpjbmfC1lhQSIW2JKkEEsleXOnsn
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 101460951
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:Mh7PrqhU68JVgmzgUdRIo1skX161HBAKZh0ujC45NGQN5FlHY01je
 htvDDjUPP2NajTyctp1PIu/80sP6pDVx4ViTFZqpSpmRS8b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWi0N8klgZmP6sT5wWFzyJ94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQgERUWQR+RotuY65aBFfcri8UPEenkadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XWjtUsl+K44Ew5HDe1ldZ27nxKtvFPNeNQK25m27B/
 juaoTyoX0hy2Nq30Typ70OihKj0uTKmX7tOMoaqzcIyqQjGroAUIEJPDgbqyRWjsWauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O88Q5RyJy6HUyx2EHWVCRTlEAPQ5sOcmSDps0
 UWG9+4FHhQ27ufTEyjEsO7J83XrY3N9wXI+iTEsdTIg+PbssqQKoDnrdIl9V6O0ouDVFmSlq
 9yVlxTSl4n/nOZSifrqpg6a02v3znTaZlVrv1uKBwpJ+is8Pdf4PNLwtDA3+N4adO6kok+9U
 G/ociR0xMQHFtmzmSOEW43h95n5tq/eYFUwbbOCdqTNFghBGFb5J+i8GBkkeC9U3j8sIFcFm
 nP7twJL/4N0N3C3d6JxaI/ZI510kvm9RIq4DqmKMIYmjn1NmOivoklTibO4hTixwCDAb4lmU
 XtkTSpcJSlDUvk2pNZHb+wczaUq1kgD+I8nfriil07P+ePHNBaopUItbAPmghYRsPnV/204M
 r93a6O39vmoeLSgM3mJrNRCfQBiwLpSLcmelvG7v9WremJOcFzNwdeLqV/9U+SJR5hoq9o=
IronPort-HdrOrdr: A9a23:6d/uTq/6oARufhk2mW9uk+DzI+orL9Y04lQ7vn2ZKCYlF/Bw8v
 rF8cjzuiWZtN98Yh4dcKm7SdC9qBDnhPxICOsqXYtKNTOO0FdASrsN0WKI+UyCJ8SRzI9gPJ
 BbAsxD4Y3LZmSSVfyKmzVQyexQpuVvLZrY4ts2E00dNT2CtZsQlTtENg==
X-IronPort-AV: E=Sophos;i="5.98,286,1673931600"; 
   d="scan'208";a="101460951"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v3] x86/boot: Factor move_xen() out of __start_xen()
Date: Thu, 23 Mar 2023 22:01:17 +0000
Message-ID: <20230323220117.2406981-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Partly for clarity because there is a lot of subtle magic at work here.
Expand the commentary of what's going on.

Also because there is no need to double copy the stack (32kB).  Spilled
content does need accounting for, but this be sorted by only copying only a
handful of words.

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v3:
 * Don't change the l2_xenmap[] logic.  X_FIXMAP uses 4k mappings in this
   range.
 * Resync the local stack frame, just in case the compiler spills something
   important there.  This is is a 3-word copy in release builds, which is far
   more reasonable than 32k.
---
 xen/arch/x86/setup.c | 189 +++++++++++++++++++++++++++----------------
 1 file changed, 119 insertions(+), 70 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 38bf18b087af..a890e203831f 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -464,6 +464,124 @@ static void __init move_memory(
     }
 }
 
+static void __init noinline move_xen(void)
+{
+    l4_pgentry_t *pl4e;
+    l3_pgentry_t *pl3e;
+    l2_pgentry_t *pl2e;
+    unsigned long tmp;
+    unsigned int i, j, k;
+
+    /*
+     * The caller has selected xen_phys_start, ensuring that the old and new
+     * locations do not overlap, and mapped the new location into the
+     * directmap.
+     *
+     * Prevent the compiler from reordering anything across this point.  Such
+     * things will end badly.
+     */
+    barrier();
+
+    /*
+     * Copy out of the current alias, into the directmap at the new location.
+     * This includes a snapshot of the current stack.
+     */
+    memcpy(__va(__pa(_start)), _start, _end - _start);
+
+    /*
+     * We are now in a critical region.  Any write modifying global state
+     * inside the main Xen image via the current alias will get lost when we
+     * switch to the new pagetables.
+     *
+     * This puts printk()'s in a weird position.  Xen's record of the printk()
+     * will get lost (e.g. from the console ring), but messages which properly
+     * escape the system (e.g. through the UART) may be of some use for
+     * debugging purposes.
+     *
+     * Walk the soon-to-be-used pagetables in the new location, relocating all
+     * intermediate (non-leaf) entries to point to their new-location
+     * equivalents.  All writes are via the directmap alias.
+     */
+    pl4e = __va(__pa(idle_pg_table));
+    for ( i = 0 ; i < L4_PAGETABLE_ENTRIES; i++, pl4e++ )
+    {
+        if ( !(l4e_get_flags(*pl4e) & _PAGE_PRESENT) )
+            continue;
+
+        *pl4e = l4e_from_intpte(l4e_get_intpte(*pl4e) + xen_phys_start);
+        pl3e = __va(l4e_get_paddr(*pl4e));
+        for ( j = 0; j < L3_PAGETABLE_ENTRIES; j++, pl3e++ )
+        {
+            if ( !(l3e_get_flags(*pl3e) & _PAGE_PRESENT) ||
+                 (l3e_get_flags(*pl3e) & _PAGE_PSE) )
+                continue;
+
+            *pl3e = l3e_from_intpte(l3e_get_intpte(*pl3e) + xen_phys_start);
+            pl2e = __va(l3e_get_paddr(*pl3e));
+            for ( k = 0; k < L2_PAGETABLE_ENTRIES; k++, pl2e++ )
+            {
+                if ( !(l2e_get_flags(*pl2e) & _PAGE_PRESENT) ||
+                     (l2e_get_flags(*pl2e) & _PAGE_PSE) )
+                    continue;
+
+                *pl2e = l2e_from_intpte(l2e_get_intpte(*pl2e) + xen_phys_start);
+            }
+        }
+    }
+
+    /*
+     * Walk the soon-to-be-used l2_xenmap[], relocating all the leaf superpage
+     * mappings so text/data/bss etc refer to the new location in memory.
+     * Non-leaf mappings, e.g. X_FIXMAP, were relocated above.
+     */
+    pl2e = __va(__pa(l2_xenmap));
+    for ( i = 0; i < L2_PAGETABLE_ENTRIES; i++, pl2e++ )
+    {
+        if ( !(l2e_get_flags(*pl2e) & _PAGE_PRESENT) ||
+             !(l2e_get_flags(*pl2e) & _PAGE_PSE) )
+            continue;
+
+        *pl2e = l2e_from_intpte(l2e_get_intpte(*pl2e) + xen_phys_start);
+    }
+
+    asm volatile (
+        /*
+         * Resync the local stack frame.  The compiler expects any spilled
+         * expression to retain its value.  This is usually only a few words.
+         */
+        "mov    %%rsp, %%rsi\n\t"       /* SRC = %rsp */
+        "mov    %%esp, %k[tmp]\n\t"
+        "and    %[mask], %k[tmp]\n\t"
+        "add    %[tmp], %%rdi\n\t"      /* DST = cpu0_stack + (%rsp & 0x7fff) */
+        "sub    %%esp, %%ecx\n\t"       /* NR  = frame - %rsp */
+        "rep movsb\n\t"
+
+        /*
+         * Switch to the relocated pagetables, shooting down global mappings.
+         */
+        "mov    %%cr4, %[tmp]\n\t"
+        "andb   $~%c[pge], %b[tmp]\n\t"
+        "mov    %[tmp], %%cr4\n\t"     /* CR4.PGE = 0 */
+        "mov    %[cr3], %%cr3\n\t"     /* CR3 = new pagetables */
+        "orb    %[pge], %b[tmp]\n\t"
+        "mov    %[tmp], %%cr4\n\t"     /* CR4.PGE = 1 */
+        : [tmp]     "=&a" (tmp), /* Could be "r", but "a" makes better asm */
+          [dst]     "=&D" (tmp),
+          [frame]   "=&c" (tmp),
+                    "=&S" (tmp)
+        : [cr3]     "r"   (__pa(idle_pg_table)),
+          [pge]     "i"   (X86_CR4_PGE),
+          [mask]    "i"   (STACK_SIZE - 1),
+          "[dst]"         (__va(__pa(cpu0_stack))),
+          "[frame]"       (__builtin_frame_address(0))
+        : "memory" );
+
+    /*
+     * End of the critical region.  Updates to globals now work as expected.
+     */
+    printk("New Xen image base address: %#lx\n", xen_phys_start);
+}
+
 #undef BOOTSTRAP_MAP_LIMIT
 
 static uint64_t __init consider_modules(
@@ -1292,81 +1410,12 @@ void __init noreturn __start_xen(unsigned long mbi_p)
          */
         if ( (end > s) && (end - reloc_size + XEN_IMG_OFFSET >= __pa(_end)) )
         {
-            l4_pgentry_t *pl4e;
-            l3_pgentry_t *pl3e;
-            l2_pgentry_t *pl2e;
-            int i, j, k;
-
             /* Select relocation address. */
             xen_phys_start = end - reloc_size;
             e = xen_phys_start + XEN_IMG_OFFSET;
             bootsym(trampoline_xen_phys_start) = xen_phys_start;
 
-            /*
-             * Perform relocation to new physical address.
-             * Before doing so we must sync static/global data with main memory
-             * with a barrier(). After this we must *not* modify static/global
-             * data until after we have switched to the relocated pagetables!
-             */
-            barrier();
-            memcpy(__va(__pa(_start)), _start, _end - _start);
-
-            /* Walk idle_pg_table, relocating non-leaf entries. */
-            pl4e = __va(__pa(idle_pg_table));
-            for ( i = 0 ; i < L4_PAGETABLE_ENTRIES; i++, pl4e++ )
-            {
-                if ( !(l4e_get_flags(*pl4e) & _PAGE_PRESENT) )
-                    continue;
-                *pl4e = l4e_from_intpte(l4e_get_intpte(*pl4e) +
-                                        xen_phys_start);
-                pl3e = __va(l4e_get_paddr(*pl4e));
-                for ( j = 0; j < L3_PAGETABLE_ENTRIES; j++, pl3e++ )
-                {
-                    /* Not present, 1GB mapping, or already relocated? */
-                    if ( !(l3e_get_flags(*pl3e) & _PAGE_PRESENT) ||
-                         (l3e_get_flags(*pl3e) & _PAGE_PSE) )
-                        continue;
-                    *pl3e = l3e_from_intpte(l3e_get_intpte(*pl3e) +
-                                            xen_phys_start);
-                    pl2e = __va(l3e_get_paddr(*pl3e));
-                    for ( k = 0; k < L2_PAGETABLE_ENTRIES; k++, pl2e++ )
-                    {
-                        /* Not present, PSE, or already relocated? */
-                        if ( !(l2e_get_flags(*pl2e) & _PAGE_PRESENT) ||
-                             (l2e_get_flags(*pl2e) & _PAGE_PSE) )
-                            continue;
-                        *pl2e = l2e_from_intpte(l2e_get_intpte(*pl2e) +
-                                                xen_phys_start);
-                    }
-                }
-            }
-
-            /* Walk l2_xenmap[], relocating 2M superpage leaves. */
-            pl2e = __va(__pa(l2_xenmap));
-            for ( i = 0; i < L2_PAGETABLE_ENTRIES; i++, pl2e++ )
-            {
-                if ( !(l2e_get_flags(*pl2e) & _PAGE_PRESENT) ||
-                     !(l2e_get_flags(*pl2e) & _PAGE_PSE) )
-                    continue;
-
-                *pl2e = l2e_from_intpte(l2e_get_intpte(*pl2e) + xen_phys_start);
-            }
-
-            /* Re-sync the stack and then switch to relocated pagetables. */
-            asm volatile (
-                "rep movsq        ; " /* re-sync the stack */
-                "movq %%cr4,%%rsi ; "
-                "andb $0x7f,%%sil ; "
-                "movq %%rsi,%%cr4 ; " /* CR4.PGE == 0 */
-                "movq %[pg],%%cr3 ; " /* CR3 == new pagetables */
-                "orb $0x80,%%sil  ; "
-                "movq %%rsi,%%cr4   " /* CR4.PGE == 1 */
-                : "=&S" (i), "=&D" (i), "=&c" (i) /* All outputs discarded. */
-                :  [pg] "r" (__pa(idle_pg_table)), "0" (cpu0_stack),
-                   "1" (__va(__pa(cpu0_stack))), "2" (STACK_SIZE / 8)
-                : "memory" );
-
-            printk("New Xen image base address: %#lx\n", xen_phys_start);
+            move_xen();
         }
 
         /* Is the region suitable for relocating the multiboot modules? */
-- 
2.30.2


