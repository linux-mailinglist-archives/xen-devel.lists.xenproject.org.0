Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9258364F251
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 21:18:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.465019.723585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6H9g-0001O5-5p; Fri, 16 Dec 2022 20:18:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 465019.723585; Fri, 16 Dec 2022 20:18:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6H9g-0001LT-2r; Fri, 16 Dec 2022 20:18:04 +0000
Received: by outflank-mailman (input) for mailman id 465019;
 Fri, 16 Dec 2022 20:18:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Zr/=4O=citrix.com=prvs=342bb51ac=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p6H9f-0001LH-7S
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 20:18:03 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb6ffae7-7d7e-11ed-91b6-6bf2151ebd3b;
 Fri, 16 Dec 2022 21:18:00 +0100 (CET)
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
X-Inumbo-ID: bb6ffae7-7d7e-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671221880;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S6FzN93gtSC3Nd88id0fqMKXDA+tulWU9iDOGYxt1H0=;
  b=fJzwQsc1Guy47cm009bY5Z1jmqFqYdLuo2ZvQb3tdVnnXsFSKg2pYIhX
   Zw36XloXzY08xXLZHAp+QWthyfHCKqgd2l9anYJ9GdifEZ/g+LV+uxmVV
   raD8DhWeY+O69p8cAKDcAXGxX0vIsqhkGhcZX0utocPTG+zCKNlZTFrpG
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 87781711
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:N5LK3qrtzBluVgcG6+RXu5PhPCheBmINZRIvgKrLsJaIsI4StFCzt
 garIBmFPfiPMDH8ftokYYm0oUgG7J/WyodiTAc5qSA1Qn4W+JuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06W1wUmAWP6gR5gaEzidNV/rzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXACkJQRCbnLqw+bOia8BWt8ICBpnSGoxK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFHU/rSn8/x7pX7WxRepEiYuuwc5G/LwRYq+LPsLMDUapqBQsA9ckOw9
 j2Zrz2mW0hy2Nq3lwbf41n0gP7zjAyiBrgfBZe59sFwjwjGroAUIEJPDgbqyRWjsWahX/pPJ
 kpS/TAhxYAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxLkouQyNFadcmnNQrXjFs3
 ViM9+4FHhQ27ufTEyjEsO7J83XiYkD5MFPuewcdSSQF+8K7prgylzPmdOdlMYTlt/v6TGSYL
 y+xkAAygLAajMgu3qq9/Ezajz/EmqUlXjLZ9S2MADv7s1oRiJqNItXxtAOFtaoowJOxFAHpg
 ZQSpySJAAni57mpnTfFfugCFarBCx2tYGyF2g4H83XMGl2QF5+fkWJ4umkWyKRBaJxsldrVj
 Kj752tsCGd7ZifCUEOOS9vZ5z4W5abhD8/5cfvfc8BDZJN8HCfeon43PxfNgTm3yxlz+U3aB
 Xt8WZ/8ZUv29Iw9lGbmLwvj+eFDKt8CKZP7GsmgkkXPPUu2b3+JU7YVWGZinchghJ5oVD79q
 o4FX+PTkkU3bQELSnWPmWLlBQxQfCdT6FGfg5A/S9Nv1SI9QDB4UqaJm+l5E2Gn9owM/tr1E
 riGchcw4DLCabfvc21mtlgLhGvTYKtC
IronPort-HdrOrdr: A9a23:x9Vmm6glD4YQcH+bJ5Yqb+jXLHBQXh4ji2hC6mlwRA09TyX5ra
 2TdZUgpHrJYVMqMk3I9uruBEDtex3hHP1OkOss1NWZPDUO0VHARO1fBOPZqAEIcBeOldK1u5
 0AT0B/YueAd2STj6zBkXSF+wBL+qj6zEiq792usEuEVWtRGsVdB58SMHfiLqVxLjM2YqYRJd
 6nyedsgSGvQngTZtTTPAh/YwCSz+e78q4PeHQ9dmca1DU=
X-IronPort-AV: E=Sophos;i="5.96,251,1665460800"; 
   d="scan'208";a="87781711"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2-ish] x86/boot: Factor move_xen() out of __start_xen()
Date: Fri, 16 Dec 2022 20:17:49 +0000
Message-ID: <20221216201749.32164-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211207105339.28440-1-andrew.cooper3@citrix.com>
References: <20211207105339.28440-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Partly for clarity because there is a lot of subtle magic at work here.
Expand the commentary of what's going on.

Also, because there is no need to double copy the stack (32kB) to retrieve
local values spilled to the stack under the old alias, when all of the
aforementioned local variables are going out of scope anyway.

There is also a logic change when walking l2_xenmap[].  The old logic would
skip recursing into 4k mappings; this would corrupt Xen if it were used.
There are no 4k mappings in l2_xenmap[] this early on boot, so assert the
property instead of leaving a latent breakage.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

We probably want to drop PGE from XEN_MINIMAL_CR4.  It will simplify several
boot paths which don't need to care about global pages, and PGE is conditional
anyway now with the PCID support.

v2-ish:
 * Split out previous series.  Was previously "x86/boot: Don't double-copy the
   stack during physical relocation" reworked to remove the risk of losing
   local stack updated we might care about.

Note that putting a printk() in the critical region wouldn't have worked even
with the old logic, and is not a reduction in functionality caused by this
patch avoiding the second stack copy.
---
 xen/arch/x86/setup.c | 178 +++++++++++++++++++++++++++++++--------------------
 1 file changed, 108 insertions(+), 70 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 4102aae76dde..830502f2d0d9 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -467,6 +467,113 @@ static void __init move_memory(
     }
 }
 
+static void __init noinline move_xen(void)
+{
+    l4_pgentry_t *pl4e;
+    l3_pgentry_t *pl3e;
+    l2_pgentry_t *pl2e;
+    unsigned long tmp;
+    int i, j, k;
+
+    /*
+     * The caller has selected xen_phys_start, ensuring that the old and new
+     * locations do not overlap.  Make it so.
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
+     * We are now in a critical region.  Any write (modifying a global,
+     * spilling a local to the stack, etc) via the current alias will get lost
+     * when we switch to the new pagetables.  This even means no printk()'s
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
+     * Walk the soon-to-be-used l2_xenmap[], relocating all the leaf mappings
+     * so text/data/bss etc refer to the new location in memory.
+     */
+    pl2e = __va(__pa(l2_xenmap));
+    for ( i = 0; i < L2_PAGETABLE_ENTRIES; i++, pl2e++ )
+    {
+        if ( !(l2e_get_flags(*pl2e) & _PAGE_PRESENT) )
+            continue;
+
+        /*
+         * We don't have 4k mappings in l2_xenmap[] at this point in boot, nor
+         * is this anticipated to change.  Simply assert the fact, rather than
+         * introducing dead logic to decend into l1 tables.
+         */
+        ASSERT(l2e_get_flags(*pl2e) & _PAGE_PSE);
+
+        *pl2e = l2e_from_intpte(l2e_get_intpte(*pl2e) + xen_phys_start);
+    }
+
+    /*
+     * Switch to relocated pagetables, shooting down global mappings as we go.
+     */
+    asm volatile (
+        "mov    %%cr4, %[cr4]\n\t"
+        "andb   $~%c[pge], %b[cr4]\n\t"
+        "mov    %[cr4], %%cr4\n\t"     /* CR4.PGE = 0 */
+        "mov    %[cr3], %%cr3\n\t"     /* CR3 = new pagetables */
+        "orb    $%c[pge], %b[cr4]\n\t"
+        "mov    %[cr4], %%cr4\n\t"     /* CR4.PGE = 1 */
+        : [cr4] "=&a" (tmp) /* Could be "r", but "a" makes better asm */
+        : [cr3] "r" (__pa(idle_pg_table)),
+          [pge] "i" (X86_CR4_PGE)
+        : "memory" );
+
+    /*
+     * End of the critical region.  Updates to locals and globals now work as
+     * expected.
+     *
+     * Updates to local variables which have been spilled to the stack since
+     * the memcpy() have been lost.  But we don't care, because they're all
+     * going out of scope imminently.
+     */
+
+    printk("New Xen image base address: %#lx\n", xen_phys_start);
+}
+
 #undef BOOTSTRAP_MAP_LIMIT
 
 static uint64_t __init consider_modules(
@@ -1255,81 +1362,12 @@ void __init noreturn __start_xen(unsigned long mbi_p)
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
2.11.0


