Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDF423D89E
	for <lists+xen-devel@lfdr.de>; Thu,  6 Aug 2020 11:28:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3cCT-0002cQ-Q1; Thu, 06 Aug 2020 09:28:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gxiU=BQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k3cCS-0002cA-0K
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 09:28:36 +0000
X-Inumbo-ID: 3c2c9161-dde8-40ea-813b-7b148645b323
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3c2c9161-dde8-40ea-813b-7b148645b323;
 Thu, 06 Aug 2020 09:28:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1D97AAE41;
 Thu,  6 Aug 2020 09:28:51 +0000 (UTC)
Subject: [PATCH 2/3] x86: don't maintain compat M2P when !PV32
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a2b8f0e9-77ea-6127-a25e-d8fd3dcbb866@suse.com>
Message-ID: <4575f42b-a347-b34e-0032-e04668106a9b@suse.com>
Date: Thu, 6 Aug 2020 11:28:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <a2b8f0e9-77ea-6127-a25e-d8fd3dcbb866@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Note that opt_pv32's declaration / #define need to be moved due to other
header dependencies; in particular can asm-x86/mm.h not include
asm-x86/pv/domain.h.

While touching their definitions anyway, also adjust section placement
of m2p_compat_vstart and compat_idle_pg_table_l2. Similarly, while
putting init_xen_pae_l2_slots() inside #ifdef, also move it to a PV-only
source file.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
An alternative place for opt_pv32.h would seem to be asm-x86/config.h.

--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -597,8 +597,10 @@ int arch_domain_create(struct domain *d,
     }
     d->arch.emulation_flags = emflags;
 
+#ifdef CONFIG_PV32
     HYPERVISOR_COMPAT_VIRT_START(d) =
         is_pv_domain(d) ? __HYPERVISOR_COMPAT_VIRT_START : ~0u;
+#endif
 
     if ( (rc = paging_domain_init(d)) != 0 )
         goto fail;
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -1427,13 +1427,6 @@ static bool pae_xen_mappings_check(const
     return true;
 }
 
-void init_xen_pae_l2_slots(l2_pgentry_t *l2t, const struct domain *d)
-{
-    memcpy(&l2t[COMPAT_L2_PAGETABLE_FIRST_XEN_SLOT(d)],
-           compat_idle_pg_table_l2,
-           COMPAT_L2_PAGETABLE_XEN_SLOTS(d) * sizeof(*l2t));
-}
-
 static int promote_l2_table(struct page_info *page, unsigned long type)
 {
     struct domain *d = page_get_owner(page);
--- a/xen/arch/x86/pv/mm.c
+++ b/xen/arch/x86/pv/mm.c
@@ -128,6 +128,15 @@ bool pv_map_ldt_shadow_page(unsigned int
     return true;
 }
 
+#ifdef CONFIG_PV32
+void init_xen_pae_l2_slots(l2_pgentry_t *l2t, const struct domain *d)
+{
+    memcpy(&l2t[COMPAT_L2_PAGETABLE_FIRST_XEN_SLOT(d)],
+           compat_idle_pg_table_l2,
+           COMPAT_L2_PAGETABLE_XEN_SLOTS(d) * sizeof(*l2t));
+}
+#endif
+
 /*
  * Local variables:
  * mode: C
--- a/xen/arch/x86/x86_64/compat/mm.c
+++ b/xen/arch/x86/x86_64/compat/mm.c
@@ -103,6 +103,9 @@ int compat_arch_memory_op(unsigned long
             .max_mfn = MACH2PHYS_COMPAT_NR_ENTRIES(d) - 1
         };
 
+        if ( !opt_pv32 )
+            return -EOPNOTSUPP;
+
         if ( copy_to_guest(arg, &mapping, 1) )
             rc = -EFAULT;
 
@@ -115,6 +118,9 @@ int compat_arch_memory_op(unsigned long
         unsigned long limit;
         compat_pfn_t last_mfn;
 
+        if ( !opt_pv32 )
+            return -EOPNOTSUPP;
+
         if ( copy_from_guest(&xmml, arg, 1) )
             return -EFAULT;
 
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -40,9 +40,11 @@ EMIT_FILE;
 #include <asm/mem_sharing.h>
 #include <public/memory.h>
 
-unsigned int __read_mostly m2p_compat_vstart = __HYPERVISOR_COMPAT_VIRT_START;
+#ifdef CONFIG_PV32
+unsigned int __initdata m2p_compat_vstart = __HYPERVISOR_COMPAT_VIRT_START;
 
-l2_pgentry_t *compat_idle_pg_table_l2;
+l2_pgentry_t *__read_mostly compat_idle_pg_table_l2;
+#endif
 
 void *do_page_walk(struct vcpu *v, unsigned long addr)
 {
@@ -218,7 +220,8 @@ static void destroy_compat_m2p_mapping(s
 {
     unsigned long i, smap = info->spfn, emap = info->spfn;
 
-    if ( smap > ((RDWR_COMPAT_MPT_VIRT_END - RDWR_COMPAT_MPT_VIRT_START) >> 2) )
+    if ( !opt_pv32 ||
+         smap > ((RDWR_COMPAT_MPT_VIRT_END - RDWR_COMPAT_MPT_VIRT_START) >> 2) )
         return;
 
     if ( emap > ((RDWR_COMPAT_MPT_VIRT_END - RDWR_COMPAT_MPT_VIRT_START) >> 2) )
@@ -315,10 +318,10 @@ static void destroy_m2p_mapping(struct m
  */
 static int setup_compat_m2p_table(struct mem_hotadd_info *info)
 {
+    int err = 0;
     unsigned long i, smap, emap, epfn = info->epfn;
     mfn_t mfn;
     unsigned int n;
-    int err = 0;
 
     smap = info->spfn & (~((1UL << (L2_PAGETABLE_SHIFT - 2)) -1));
 
@@ -326,7 +329,8 @@ static int setup_compat_m2p_table(struct
      * Notice: For hot-added memory, only range below m2p_compat_vstart
      * will be filled up (assuming memory is discontinous when booting).
      */
-    if   ((smap > ((RDWR_COMPAT_MPT_VIRT_END - RDWR_COMPAT_MPT_VIRT_START) >> 2)) )
+    if ( !opt_pv32 ||
+         (smap > ((RDWR_COMPAT_MPT_VIRT_END - RDWR_COMPAT_MPT_VIRT_START) >> 2)) )
         return 0;
 
     if ( epfn > ((RDWR_COMPAT_MPT_VIRT_END - RDWR_COMPAT_MPT_VIRT_START) >> 2) )
@@ -368,6 +372,7 @@ static int setup_compat_m2p_table(struct
     }
 #undef CNT
 #undef MFN
+
     return err;
 }
 
@@ -609,17 +614,24 @@ void __init paging_init(void)
 #undef MFN
 
     /* Create user-accessible L2 directory to map the MPT for compat guests. */
-    if ( (l2_ro_mpt = alloc_xen_pagetable()) == NULL )
-        goto nomem;
-    compat_idle_pg_table_l2 = l2_ro_mpt;
-    clear_page(l2_ro_mpt);
-    /* Allocate and map the compatibility mode machine-to-phys table. */
-    mpt_size = (mpt_size >> 1) + (1UL << (L2_PAGETABLE_SHIFT - 1));
-    if ( mpt_size > RDWR_COMPAT_MPT_VIRT_END - RDWR_COMPAT_MPT_VIRT_START )
-        mpt_size = RDWR_COMPAT_MPT_VIRT_END - RDWR_COMPAT_MPT_VIRT_START;
-    mpt_size &= ~((1UL << L2_PAGETABLE_SHIFT) - 1UL);
-    if ( (m2p_compat_vstart + mpt_size) < MACH2PHYS_COMPAT_VIRT_END )
-        m2p_compat_vstart = MACH2PHYS_COMPAT_VIRT_END - mpt_size;
+    if ( opt_pv32 )
+    {
+        if ( (l2_ro_mpt = alloc_xen_pagetable()) == NULL )
+            goto nomem;
+        compat_idle_pg_table_l2 = l2_ro_mpt;
+        clear_page(l2_ro_mpt);
+
+        /* Allocate and map the compatibility mode machine-to-phys table. */
+        mpt_size = (mpt_size >> 1) + (1UL << (L2_PAGETABLE_SHIFT - 1));
+        if ( mpt_size > RDWR_COMPAT_MPT_VIRT_END - RDWR_COMPAT_MPT_VIRT_START )
+            mpt_size = RDWR_COMPAT_MPT_VIRT_END - RDWR_COMPAT_MPT_VIRT_START;
+        mpt_size &= ~((1UL << L2_PAGETABLE_SHIFT) - 1UL);
+        if ( (m2p_compat_vstart + mpt_size) < MACH2PHYS_COMPAT_VIRT_END )
+            m2p_compat_vstart = MACH2PHYS_COMPAT_VIRT_END - mpt_size;
+    }
+    else
+        mpt_size = 0;
+
 #define MFN(x) (((x) << L2_PAGETABLE_SHIFT) / sizeof(unsigned int))
 #define CNT ((sizeof(*frame_table) & -sizeof(*frame_table)) / \
              sizeof(*compat_machine_to_phys_mapping))
@@ -845,23 +857,24 @@ void __init subarch_init_memory(void)
                 mfn_to_page(_mfn(m2p_start_mfn + i)), SHARE_ro);
     }
 
-    for ( v  = RDWR_COMPAT_MPT_VIRT_START;
-          v != RDWR_COMPAT_MPT_VIRT_END;
-          v += 1 << L2_PAGETABLE_SHIFT )
-    {
-        l3e = l3e_from_l4e(idle_pg_table[l4_table_offset(v)],
-                           l3_table_offset(v));
-        if ( !(l3e_get_flags(l3e) & _PAGE_PRESENT) )
-            continue;
-        l2e = l2e_from_l3e(l3e, l2_table_offset(v));
-        if ( !(l2e_get_flags(l2e) & _PAGE_PRESENT) )
-            continue;
-        m2p_start_mfn = l2e_get_pfn(l2e);
+    if ( opt_pv32 )
+        for ( v  = RDWR_COMPAT_MPT_VIRT_START;
+              v != RDWR_COMPAT_MPT_VIRT_END;
+              v += 1 << L2_PAGETABLE_SHIFT )
+        {
+            l3e = l3e_from_l4e(idle_pg_table[l4_table_offset(v)],
+                               l3_table_offset(v));
+            if ( !(l3e_get_flags(l3e) & _PAGE_PRESENT) )
+                continue;
+            l2e = l2e_from_l3e(l3e, l2_table_offset(v));
+            if ( !(l2e_get_flags(l2e) & _PAGE_PRESENT) )
+                continue;
+            m2p_start_mfn = l2e_get_pfn(l2e);
 
-        for ( i = 0; i < L1_PAGETABLE_ENTRIES; i++ )
-            share_xen_page_with_privileged_guests(
-                mfn_to_page(_mfn(m2p_start_mfn + i)), SHARE_ro);
-    }
+            for ( i = 0; i < L1_PAGETABLE_ENTRIES; i++ )
+                share_xen_page_with_privileged_guests(
+                    mfn_to_page(_mfn(m2p_start_mfn + i)), SHARE_ro);
+        }
 
     /* Mark all of direct map NX if hardware supports it. */
     if ( !cpu_has_nx )
@@ -933,6 +946,9 @@ long subarch_memory_op(unsigned long cmd
         break;
 
     case XENMEM_machphys_compat_mfn_list:
+        if ( !opt_pv32 )
+            return -EOPNOTSUPP;
+
         if ( copy_from_guest(&xmml, arg, 1) )
             return -EFAULT;
 
--- a/xen/include/asm-x86/config.h
+++ b/xen/include/asm-x86/config.h
@@ -142,7 +142,7 @@ extern unsigned char boot_edid_info[128]
  *  0xffff82c000000000 - 0xffff82cfffffffff [64GB,  2^36 bytes, PML4:261]
  *    vmap()/ioremap()/fixmap area.
  *  0xffff82d000000000 - 0xffff82d03fffffff [1GB,   2^30 bytes, PML4:261]
- *    Compatibility machine-to-phys translation table.
+ *    Compatibility machine-to-phys translation table (CONFIG_PV32).
  *  0xffff82d040000000 - 0xffff82d07fffffff [1GB,   2^30 bytes, PML4:261]
  *    Xen text, static data, bss.
 #ifndef CONFIG_BIGMEM
@@ -246,9 +246,18 @@ extern unsigned char boot_edid_info[128]
 
 #ifndef __ASSEMBLY__
 
+#ifdef CONFIG_PV32
+
 /* This is not a fixed value, just a lower limit. */
 #define __HYPERVISOR_COMPAT_VIRT_START 0xF5800000
 #define HYPERVISOR_COMPAT_VIRT_START(d) ((d)->arch.hv_compat_vstart)
+
+#else
+
+#define HYPERVISOR_COMPAT_VIRT_START(d) ((void)(d), 0)
+
+#endif
+
 #define MACH2PHYS_COMPAT_VIRT_START    HYPERVISOR_COMPAT_VIRT_START
 #define MACH2PHYS_COMPAT_VIRT_END      0xFFE00000
 #define MACH2PHYS_COMPAT_NR_ENTRIES(d) \
--- a/xen/include/asm-x86/domain.h
+++ b/xen/include/asm-x86/domain.h
@@ -307,7 +307,9 @@ struct arch_domain
 {
     struct page_info *perdomain_l3_pg;
 
+#ifdef CONFIG_PV32
     unsigned int hv_compat_vstart;
+#endif
 
     /* Maximum physical-address bitwidth supported by this guest. */
     unsigned int physaddr_bitsize;
--- a/xen/include/asm-x86/mm.h
+++ b/xen/include/asm-x86/mm.h
@@ -42,8 +42,12 @@
 #define _PGT_validated    PG_shift(6)
 #define PGT_validated     PG_mask(1, 6)
  /* PAE only: is this an L2 page directory containing Xen-private mappings? */
+#ifdef CONFIG_PV32
 #define _PGT_pae_xen_l2   PG_shift(7)
 #define PGT_pae_xen_l2    PG_mask(1, 7)
+#else
+#define PGT_pae_xen_l2    0
+#endif
 /* Has this page been *partially* validated for use as its current type? */
 #define _PGT_partial      PG_shift(8)
 #define PGT_partial       PG_mask(1, 8)
@@ -494,15 +498,39 @@ extern paddr_t mem_hotplug;
 #define SHARED_M2P_ENTRY         (~0UL - 1UL)
 #define SHARED_M2P(_e)           ((_e) == SHARED_M2P_ENTRY)
 
-#define compat_machine_to_phys_mapping ((unsigned int *)RDWR_COMPAT_MPT_VIRT_START)
+#ifdef CONFIG_PV32
+
+extern int8_t opt_pv32;
+
+# define compat_machine_to_phys_mapping ((unsigned int *)RDWR_COMPAT_MPT_VIRT_START)
+
+# define set_compat_m2p(mfn, entry) \
+    ((void)(!opt_pv32 || \
+            (mfn) >= (RDWR_COMPAT_MPT_VIRT_END - RDWR_COMPAT_MPT_VIRT_START) / 4 || \
+            (compat_machine_to_phys_mapping[mfn] = (entry))))
+
+#else /* !CONFIG_PV32 */
+
+# define opt_pv32 false
+
+/*
+ * Declare the symbol such that (dead) code referencing it can be built
+ * without a lot of #ifdef-ary, but mark it fully const and don't define
+ * this symbol anywhere (relying on DCE by the compiler).
+ */
+extern const unsigned int *const compat_machine_to_phys_mapping;
+
+# define set_compat_m2p(mfn, entry)
+
+#endif /* CONFIG_PV32 */
+
 #define _set_gpfn_from_mfn(mfn, pfn) ({                        \
     struct domain *d = page_get_owner(mfn_to_page(_mfn(mfn))); \
     unsigned long entry = (d && (d == dom_cow)) ?              \
         SHARED_M2P_ENTRY : (pfn);                              \
-    ((void)((mfn) >= (RDWR_COMPAT_MPT_VIRT_END - RDWR_COMPAT_MPT_VIRT_START) / 4 || \
-            (compat_machine_to_phys_mapping[(mfn)] = (unsigned int)(entry))), \
-     machine_to_phys_mapping[(mfn)] = (entry));                \
-    })
+    set_compat_m2p(mfn, (unsigned int)(entry));                \
+    machine_to_phys_mapping[mfn] = (entry);                    \
+})
 
 /*
  * Disable some users of set_gpfn_from_mfn() (e.g., free_heap_pages()) until
--- a/xen/include/asm-x86/pv/domain.h
+++ b/xen/include/asm-x86/pv/domain.h
@@ -23,12 +23,6 @@
 
 #include <xen/sched.h>
 
-#ifdef CONFIG_PV32
-extern int8_t opt_pv32;
-#else
-# define opt_pv32 false
-#endif
-
 /*
  * PCID values for the address spaces of 64-bit pv domains:
  *


