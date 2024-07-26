Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9637593D65E
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 17:42:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765662.1176326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXN4c-0004xv-5p; Fri, 26 Jul 2024 15:41:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765662.1176326; Fri, 26 Jul 2024 15:41:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXN4c-0004rZ-1a; Fri, 26 Jul 2024 15:41:38 +0000
Received: by outflank-mailman (input) for mailman id 765662;
 Fri, 26 Jul 2024 15:41:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bxzg=O2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sXMvZ-00084Z-Lz
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2024 15:32:17 +0000
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [2607:f8b0:4864:20::733])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3baeadbc-4b64-11ef-bbff-fd08da9f4363;
 Fri, 26 Jul 2024 17:32:14 +0200 (CEST)
Received: by mail-qk1-x733.google.com with SMTP id
 af79cd13be357-7a1df0a93eeso54357785a.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2024 08:32:14 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a1d73ed33bsm186293085a.58.2024.07.26.08.32.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jul 2024 08:32:12 -0700 (PDT)
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
X-Inumbo-ID: 3baeadbc-4b64-11ef-bbff-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722007933; x=1722612733; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+bQ+ii7M1KJhsihYtAn+LMm9W2OsmDXTDtNb1K2Kk+8=;
        b=ULjq/Fq8AEzNonKiqnzDW2K4UctU1Jls2eXHeGiyKUtMbUZ1fup+OMvxdw69kxqRDG
         bCMe/pFZwI4HvSBRwtfaOF7JekIf5n1R2unNXmCNwGqinsTniSiOC2TA4Xco+ugIfLAM
         u5or8g1UmGciX16GTqlgQzD4Fo/YzT4aGXeh4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722007933; x=1722612733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+bQ+ii7M1KJhsihYtAn+LMm9W2OsmDXTDtNb1K2Kk+8=;
        b=XTjbhbKK7gMAVEajiqbuSMrkNWsYY+/q+NRzGjuu6L1kZfruMFba8YEKKSQRpmLG6s
         FLV0dGsAA9UDttxrigvUXktyBjcKoYbUsLBhhx1H7bgXUMy1q7i97SXDEyQMM7I+wGQg
         LRup8Nr2feEDEhm6MnvwPgVeWCllxLB3hZh8mX8faIj08syDoM3Lv6hrIpm9HBuK0CMG
         JkVonKdyFAAaRQYotYNRcQ01crPOX/xwEYriGh8tZNtOsXiK8RypHLfR/jlF1Z+wsLsH
         xeyFum5eVkyYmTb3nKjufn8jeKA4S2ISL+tHP8j/H9Lf4lbDBsMQT17UxIdpEBf1Oib8
         5sEQ==
X-Gm-Message-State: AOJu0Yy7/FtcEumP2xkLgioa0Va7WzY0j4PckaIZFWekavioZO5SCYij
	ZjVUQy2FSKbZ7SnQtcv63lCISF2z0JHgNobxN84iJdcPkactxJzsendIQEIHBK69grEVz963CHk
	+
X-Google-Smtp-Source: AGHT+IFEl+l6gfhV/oaxuOmcOHpAbe9haRO9XmK8X2xunfJzUIgKMhf39uziKga6rh7b4MNPD63eCg==
X-Received: by 2002:a05:620a:4152:b0:79f:fe8:5fce with SMTP id af79cd13be357-7a1e522fb05mr11382285a.3.1722007932948;
        Fri, 26 Jul 2024 08:32:12 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: alejandro.vallejo@cloud.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH 21/22] x86/mm: switch to a per-CPU mapped stack when using ASI
Date: Fri, 26 Jul 2024 17:22:05 +0200
Message-ID: <20240726152206.28411-22-roger.pau@citrix.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240726152206.28411-1-roger.pau@citrix.com>
References: <20240726152206.28411-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When using ASI the CPU stack is mapped using a range of fixmap entries in the
per-CPU region.  This ensures the stack is only accessible by the current CPU.

Note however there's further work required in order to allocate the stack from
domheap instead of xenheap, and ensure the stack is not part of the direct
map.

For domains not running with ASI enabled all the CPU stacks are mapped in the
per-domain L3, so that the stack is always at the same linear address,
regardless of whether ASI is enabled or not for the domain.

When calling UEFI runtime methods the current per-domain slot needs to be added
to the EFI L4, so that the stack is available in UEFI.

Finally, some users of callfunc IPIs pass parameters from the stack, so when
handling a callfunc IPI the stack of the caller CPU is mapped into the address
space of the CPU handling the IPI.  This needs further work to use a bounce
buffer in order to avoid having to map remote CPU stacks.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
There's also further work required in order to avoid mapping remote stack when
handling callfunc IPIs.
---
 xen/arch/x86/domain.c              |  12 +++
 xen/arch/x86/include/asm/current.h |   5 ++
 xen/arch/x86/include/asm/fixmap.h  |   5 ++
 xen/arch/x86/include/asm/mm.h      |   6 +-
 xen/arch/x86/include/asm/smp.h     |  12 +++
 xen/arch/x86/mm.c                  | 125 +++++++++++++++++++++++++++--
 xen/arch/x86/setup.c               |  27 +++++--
 xen/arch/x86/smp.c                 |  29 +++++++
 xen/arch/x86/smpboot.c             |  47 ++++++++++-
 xen/arch/x86/traps.c               |   6 +-
 xen/common/efi/runtime.c           |  12 +++
 xen/common/smp.c                   |  10 +++
 xen/include/xen/smp.h              |   5 ++
 13 files changed, 281 insertions(+), 20 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 94a42ef29cd1..d00ba415877f 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -929,6 +929,18 @@ int arch_domain_create(struct domain *d,
 
     d->arch.msr_relaxed = config->arch.misc_flags & XEN_X86_MSR_RELAXED;
 
+    if ( !d->arch.asi && (opt_asi_hvm || opt_asi_pv ) )
+    {
+        /*
+         * This domain is not using ASI, but other domains on the system
+         * possibly are, hence the CPU stacks are on the per-CPU page-table
+         * region.  Add an L3 entry that has all the stacks mapped.
+         */
+        rc = map_all_stacks(d);
+        if ( rc )
+            goto fail;
+    }
+
     return 0;
 
  fail:
diff --git a/xen/arch/x86/include/asm/current.h b/xen/arch/x86/include/asm/current.h
index 6a021607a1a9..75b9a341f814 100644
--- a/xen/arch/x86/include/asm/current.h
+++ b/xen/arch/x86/include/asm/current.h
@@ -24,6 +24,11 @@
  * 0 - IST Shadow Stacks (4x 1k, read-only)
  */
 
+static inline bool is_shstk_slot(unsigned int i)
+{
+    return (i == 0 || i == PRIMARY_SHSTK_SLOT);
+}
+
 /*
  * Identify which stack page the stack pointer is on.  Returns an index
  * as per the comment above.
diff --git a/xen/arch/x86/include/asm/fixmap.h b/xen/arch/x86/include/asm/fixmap.h
index bc68a98568ae..d52c1886fcdd 100644
--- a/xen/arch/x86/include/asm/fixmap.h
+++ b/xen/arch/x86/include/asm/fixmap.h
@@ -120,6 +120,11 @@ extern void __set_fixmap_x(
 
 /* per-CPU fixmap area. */
 enum percpu_fixed_addresses {
+    /* For alignment reasons the per-CPU stacks must come first. */
+    PCPU_STACK_START,
+    PCPU_STACK_END = PCPU_STACK_START + NR_CPUS * (1U << STACK_ORDER) - 1,
+#define PERCPU_STACK_IDX(c) (PCPU_STACK_START + (c) * (1U << STACK_ORDER))
+#define PERCPU_STACK_ADDR(c) percpu_fix_to_virt(PERCPU_STACK_IDX(c))
     PCPU_FIX_PV_L4SHADOW,
     __end_of_percpu_fixed_addresses
 };
diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index f883468b1a7c..b4f1e0399275 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -521,7 +521,7 @@ extern struct rangeset *mmio_ro_ranges;
 #define compat_pfn_to_cr3(pfn) (((unsigned)(pfn) << 12) | ((unsigned)(pfn) >> 20))
 #define compat_cr3_to_pfn(cr3) (((unsigned)(cr3) >> 12) | ((unsigned)(cr3) << 20))
 
-void memguard_guard_stack(void *p);
+void memguard_guard_stack(void *p, unsigned int cpu);
 void memguard_unguard_stack(void *p);
 
 struct mmio_ro_emulate_ctxt {
@@ -652,4 +652,8 @@ static inline int destroy_xen_mappings_cpu(unsigned long s, unsigned long e,
     return modify_xen_mappings_cpu(s, e, _PAGE_NONE, cpu);
 }
 
+/* Setup a per-domain slot that maps all pCPU stacks. */
+int map_all_stacks(struct domain *d);
+int add_stack(const void *stack, unsigned int cpu);
+
 #endif /* __ASM_X86_MM_H__ */
diff --git a/xen/arch/x86/include/asm/smp.h b/xen/arch/x86/include/asm/smp.h
index c8c79601343d..a17c609da4b6 100644
--- a/xen/arch/x86/include/asm/smp.h
+++ b/xen/arch/x86/include/asm/smp.h
@@ -79,6 +79,18 @@ extern bool unaccounted_cpus;
 
 void *cpu_alloc_stack(unsigned int cpu);
 
+/*
+ * Setup the per-CPU area stack mappings.
+ *
+ * @dest_cpu:  CPU where the mappings are to appear.
+ * @stack_cpu: CPU whose stacks should be mapped.
+ */
+void cpu_set_stack_mappings(unsigned int dest_cpu, unsigned int stack_cpu);
+
+#define HAS_ARCH_SMP_CALLFUNC
+void arch_smp_pre_callfunc(unsigned int cpu);
+void arch_smp_post_callfunc(unsigned int cpu);
+
 #endif /* !__ASSEMBLY__ */
 
 #endif
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 8fea7465a9df..67ffdebb595e 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -87,6 +87,7 @@
  * doing the final put_page(), and remove it from the iommu if so.
  */
 
+#include <xen/cpu.h>
 #include <xen/init.h>
 #include <xen/ioreq.h>
 #include <xen/kernel.h>
@@ -6352,31 +6353,40 @@ void free_perdomain_mappings(struct domain *d)
     d->arch.perdomain_l3_pg = NULL;
 }
 
-static void write_sss_token(unsigned long *ptr)
+static void write_sss_token(unsigned long *ptr, unsigned long va)
 {
     /*
      * A supervisor shadow stack token is its own linear address, with the
      * busy bit (0) clear.
      */
-    *ptr = (unsigned long)ptr;
+    *ptr = va;
 }
 
-void memguard_guard_stack(void *p)
+void memguard_guard_stack(void *p, unsigned int cpu)
 {
+    unsigned long va =
+        (opt_asi_hvm || opt_asi_pv) ? (unsigned long)PERCPU_STACK_ADDR(cpu)
+                                    : (unsigned long)p;
+
     /* IST Shadow stacks.  4x 1k in stack page 0. */
     if ( IS_ENABLED(CONFIG_XEN_SHSTK) )
     {
-        write_sss_token(p + (IST_MCE * IST_SHSTK_SIZE) - 8);
-        write_sss_token(p + (IST_NMI * IST_SHSTK_SIZE) - 8);
-        write_sss_token(p + (IST_DB  * IST_SHSTK_SIZE) - 8);
-        write_sss_token(p + (IST_DF  * IST_SHSTK_SIZE) - 8);
+        write_sss_token(p + (IST_MCE * IST_SHSTK_SIZE) - 8,
+                        va + (IST_MCE * IST_SHSTK_SIZE) - 8);
+        write_sss_token(p + (IST_NMI * IST_SHSTK_SIZE) - 8,
+                        va + (IST_NMI * IST_SHSTK_SIZE) - 8);
+        write_sss_token(p + (IST_DB  * IST_SHSTK_SIZE) - 8,
+                        va + (IST_DB  * IST_SHSTK_SIZE) - 8);
+        write_sss_token(p + (IST_DF  * IST_SHSTK_SIZE) - 8,
+                        va + (IST_DF  * IST_SHSTK_SIZE) - 8);
     }
     map_pages_to_xen((unsigned long)p, virt_to_mfn(p), 1, PAGE_HYPERVISOR_SHSTK);
 
     /* Primary Shadow Stack.  1x 4k in stack page 5. */
     p += PRIMARY_SHSTK_SLOT * PAGE_SIZE;
+    va += PRIMARY_SHSTK_SLOT * PAGE_SIZE;
     if ( IS_ENABLED(CONFIG_XEN_SHSTK) )
-        write_sss_token(p + PAGE_SIZE - 8);
+        write_sss_token(p + PAGE_SIZE - 8, va + PAGE_SIZE - 8);
 
     map_pages_to_xen((unsigned long)p, virt_to_mfn(p), 1, PAGE_HYPERVISOR_SHSTK);
 }
@@ -6567,6 +6577,105 @@ void setup_perdomain_slot(const struct vcpu *v, root_pgentry_t *root_pgt)
                   root_pgt[root_table_offset(PERDOMAIN_VIRT_START)]);
 }
 
+static struct page_info *l2_all_stacks;
+
+int add_stack(const void *stack, unsigned int cpu)
+{
+    unsigned long va = (unsigned long)PERCPU_STACK_ADDR(cpu);
+    struct page_info *pg;
+    l2_pgentry_t *l2tab = NULL;
+    l1_pgentry_t *l1tab = NULL;
+    unsigned int nr;
+    int rc = 0;
+
+    /*
+     * Assume CPU stack allocation is always serialized, either because it's
+     * done on the BSP during boot, or in case of hotplug, in stop machine
+     * context.
+     */
+    ASSERT(system_state < SYS_STATE_active || cpu_in_hotplug_context());
+
+    if ( !opt_asi_hvm && !opt_asi_pv )
+        return 0;
+
+    if ( !l2_all_stacks )
+    {
+        l2_all_stacks = alloc_domheap_page(NULL, MEMF_no_owner);
+        if ( !l2_all_stacks )
+            return -ENOMEM;
+        l2tab = __map_domain_page(l2_all_stacks);
+        clear_page(l2tab);
+    }
+    else
+        l2tab = __map_domain_page(l2_all_stacks);
+
+    /* code assumes all the stacks can be mapped with a single l2. */
+    ASSERT(l3_table_offset((unsigned long)percpu_fix_to_virt(PCPU_STACK_END)) ==
+        l3_table_offset((unsigned long)percpu_fix_to_virt(PCPU_STACK_START)));
+    for ( nr = 0 ; nr < (1U << STACK_ORDER) ; nr++)
+    {
+        l2_pgentry_t *pl2e = l2tab + l2_table_offset(va);
+
+        if ( !(l2e_get_flags(*pl2e) & _PAGE_PRESENT) )
+        {
+            pg = alloc_domheap_page(NULL, MEMF_no_owner);
+            if ( !pg )
+            {
+                rc = -ENOMEM;
+                break;
+            }
+            l1tab = __map_domain_page(pg);
+            clear_page(l1tab);
+            l2e_write(pl2e, l2e_from_page(pg, __PAGE_HYPERVISOR_RW));
+        }
+        else if ( !l1tab )
+            l1tab = map_l1t_from_l2e(*pl2e);
+
+        l1e_write(&l1tab[l1_table_offset(va)],
+                  l1e_from_mfn(virt_to_mfn(stack),
+                               is_shstk_slot(nr) ? __PAGE_HYPERVISOR_SHSTK
+                                                 : __PAGE_HYPERVISOR_RW));
+
+        va += PAGE_SIZE;
+        stack += PAGE_SIZE;
+
+        if ( !l1_table_offset(va) )
+        {
+            unmap_domain_page(l1tab);
+            l1tab = NULL;
+        }
+    }
+
+    unmap_domain_page(l1tab);
+    unmap_domain_page(l2tab);
+    /*
+     * Don't care to free the intermediate page-tables on failure, can be used
+     * to map other stacks.
+     */
+
+    return rc;
+}
+
+int map_all_stacks(struct domain *d)
+{
+    /*
+     * Create the per-domain L3.  Pass a dummy PERDOMAIN_VIRT_START, but note
+     * only the per-domain L3 is allocated when nr == 0.
+     */
+    int rc = create_perdomain_mapping(d, PERDOMAIN_VIRT_START, 0, NULL, NULL);
+    l3_pgentry_t *l3tab;
+
+    if ( rc )
+        return rc;
+
+    l3tab = __map_domain_page(d->arch.perdomain_l3_pg);
+    l3tab[l3_table_offset((unsigned long)percpu_fix_to_virt(PCPU_STACK_START))]
+        = l3e_from_page(l2_all_stacks, __PAGE_HYPERVISOR_RW);
+    unmap_domain_page(l3tab);
+
+    return 0;
+}
+
 static void __init __maybe_unused build_assertions(void)
 {
     /*
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 5bf81b81b46f..76f7d71b8c1c 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -808,8 +808,6 @@ static void __init noreturn reinit_bsp_stack(void)
     /* Update SYSCALL trampolines */
     percpu_traps_init();
 
-    stack_base[0] = stack;
-
     rc = setup_cpu_root_pgt(0);
     if ( rc )
         panic("Error %d setting up PV root page table\n", rc);
@@ -1771,10 +1769,6 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
     system_state = SYS_STATE_boot;
 
-    bsp_stack = cpu_alloc_stack(0);
-    if ( !bsp_stack )
-        panic("No memory for BSP stack\n");
-
     console_init_ring();
     vesa_init();
 
@@ -1961,6 +1955,16 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
     alternative_branches();
 
+    /*
+     * Alloc the BSP stack closer to the point where the AP ones also get
+     * allocated - and after the speculation mitigations have been initialized.
+     * In order to set up the shadow stack token correctly Xen needs to know
+     * whether per-CPU mapped stacks are being used.
+     */
+    bsp_stack = cpu_alloc_stack(0);
+    if ( !bsp_stack )
+        panic("No memory for BSP stack\n");
+
     /*
      * Setup the local per-domain L3 for the BSP also, so it matches the state
      * of the APs.
@@ -2065,8 +2069,17 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
         info->last_spec_ctrl = default_xen_spec_ctrl;
     }
 
+    stack_base[0] = bsp_stack;
+
     /* Copy the cpu info block, and move onto the BSP stack. */
-    bsp_info = get_cpu_info_from_stack((unsigned long)bsp_stack);
+    if ( opt_asi_hvm || opt_asi_pv )
+    {
+        cpu_set_stack_mappings(0, 0);
+        bsp_info = get_cpu_info_from_stack((unsigned long)PERCPU_STACK_ADDR(0));
+    }
+    else
+        bsp_info = get_cpu_info_from_stack((unsigned long)bsp_stack);
+
     *bsp_info = *info;
 
     asm volatile ("mov %[stk], %%rsp; jmp %c[fn]" ::
diff --git a/xen/arch/x86/smp.c b/xen/arch/x86/smp.c
index 04c6a0572319..18a7196195cf 100644
--- a/xen/arch/x86/smp.c
+++ b/xen/arch/x86/smp.c
@@ -22,6 +22,7 @@
 #include <asm/hardirq.h>
 #include <asm/hpet.h>
 #include <asm/setup.h>
+#include <asm/spec_ctrl.h>
 #include <irq_vectors.h>
 #include <mach_apic.h>
 
@@ -433,3 +434,31 @@ long cf_check cpu_down_helper(void *data)
         ret = cpu_down(cpu);
     return ret;
 }
+
+void arch_smp_pre_callfunc(unsigned int cpu)
+{
+    if ( (!opt_asi_pv && !opt_asi_hvm) || cpu == smp_processor_id() ||
+         (!current->domain->arch.asi && !is_idle_vcpu(current)) ||
+        /*
+         * CPU#0 still runs on the .init stack when the APs are started, don't
+         * attempt to map such stack.
+         */
+         (!cpu && system_state < SYS_STATE_active) )
+        return;
+
+    cpu_set_stack_mappings(smp_processor_id(), cpu);
+}
+
+void arch_smp_post_callfunc(unsigned int cpu)
+{
+    unsigned int i;
+
+    if ( (!opt_asi_pv && !opt_asi_hvm) || cpu == smp_processor_id() ||
+         (!current->domain->arch.asi && !is_idle_vcpu(current)) )
+        return;
+
+    for ( i = 0; i < (1U << STACK_ORDER); i++ )
+        percpu_clear_fixmap(PERCPU_STACK_IDX(cpu) + i);
+
+    flush_area_local(PERCPU_STACK_ADDR(cpu), FLUSH_ORDER(STACK_ORDER));
+}
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index d9841ed3b663..548e3102101c 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -579,7 +579,20 @@ static int do_boot_cpu(int apicid, int cpu)
         printk("Booting processor %d/%d eip %lx\n",
                cpu, apicid, start_eip);
 
-    stack_start = stack_base[cpu] + STACK_SIZE - sizeof(struct cpu_info);
+    if ( opt_asi_hvm || opt_asi_pv )
+    {
+        /*
+         * Uniformly run with the stack mapping of the per-CPU area (including
+         * the idle vCPU) if ASI is enabled for any domain type.
+         */
+        cpu_set_stack_mappings(cpu, cpu);
+
+        ASSERT(IS_ALIGNED((unsigned long)PERCPU_STACK_ADDR(cpu), STACK_SIZE));
+
+        stack_start = PERCPU_STACK_ADDR(cpu) + STACK_SIZE - sizeof(struct cpu_info);
+    }
+    else
+        stack_start = stack_base[cpu] + STACK_SIZE - sizeof(struct cpu_info);
 
     /*
      * If per-CPU idle root page table has been allocated, switch to it as
@@ -1053,11 +1066,41 @@ void *cpu_alloc_stack(unsigned int cpu)
     stack = alloc_xenheap_pages(STACK_ORDER, memflags);
 
     if ( stack )
-        memguard_guard_stack(stack);
+    {
+        int rc = add_stack(stack, cpu);
+
+        if ( rc )
+        {
+            printk(XENLOG_ERR "unable to map stack for CPU %u: %d\n", cpu, rc);
+            free_xenheap_pages(stack, STACK_ORDER);
+            return NULL;
+        }
+        memguard_guard_stack(stack, cpu);
+    }
 
     return stack;
 }
 
+void cpu_set_stack_mappings(unsigned int dest_cpu, unsigned int stack_cpu)
+{
+    unsigned int i;
+
+    for ( i = 0; i < (1U << STACK_ORDER); i++ )
+    {
+        unsigned int flags = (is_shstk_slot(i) ? __PAGE_HYPERVISOR_SHSTK
+                                               : __PAGE_HYPERVISOR_RW) |
+                             (dest_cpu == stack_cpu ? _PAGE_GLOBAL : 0);
+
+        if ( is_shstk_slot(i) && dest_cpu != stack_cpu )
+            continue;
+
+        percpu_set_fixmap_remote(dest_cpu, PERCPU_STACK_IDX(stack_cpu) + i,
+                                 _mfn(virt_to_mfn(stack_base[stack_cpu] +
+                                                  i * PAGE_SIZE)),
+                                 flags);
+    }
+}
+
 static int cpu_smpboot_alloc(unsigned int cpu)
 {
     struct cpu_info *info;
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index b4fb95917023..28513c0e3d6a 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -609,10 +609,12 @@ void show_stack_overflow(unsigned int cpu, const struct cpu_user_regs *regs)
     unsigned long esp = regs->rsp;
     unsigned long curr_stack_base = esp & ~(STACK_SIZE - 1);
     unsigned long esp_top, esp_bottom;
+    const void *stack = current->domain->arch.asi ? PERCPU_STACK_ADDR(cpu)
+                                                  : stack_base[cpu];
 
-    if ( _p(curr_stack_base) != stack_base[cpu] )
+    if ( _p(curr_stack_base) != stack )
         printk("Current stack base %p differs from expected %p\n",
-               _p(curr_stack_base), stack_base[cpu]);
+               _p(curr_stack_base), stack);
 
     esp_bottom = (esp | (STACK_SIZE - 1)) + 1;
     esp_top    = esp_bottom - PRIMARY_STACK_SIZE;
diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
index d952c3ba785e..3a8233ed62ac 100644
--- a/xen/common/efi/runtime.c
+++ b/xen/common/efi/runtime.c
@@ -32,6 +32,7 @@ void efi_rs_leave(struct efi_rs_state *state);
 
 #ifndef CONFIG_ARM
 # include <asm/i387.h>
+# include <asm/spec_ctrl.h>
 # include <asm/xstate.h>
 # include <public/platform.h>
 #endif
@@ -85,6 +86,7 @@ struct efi_rs_state efi_rs_enter(void)
     static const u16 fcw = FCW_DEFAULT;
     static const u32 mxcsr = MXCSR_DEFAULT;
     struct efi_rs_state state = { .cr3 = 0 };
+    root_pgentry_t *efi_pgt, *idle_pgt;
 
     if ( mfn_eq(efi_l4_mfn, INVALID_MFN) )
         return state;
@@ -98,6 +100,16 @@ struct efi_rs_state efi_rs_enter(void)
 
     efi_rs_on_cpu = smp_processor_id();
 
+    if ( opt_asi_pv || opt_asi_hvm )
+    {
+        /* Insert the idle per-domain slot for the stack mapping. */
+        efi_pgt = map_domain_page(efi_l4_mfn);
+        idle_pgt = maddr_to_virt(idle_vcpu[efi_rs_on_cpu]->arch.cr3);
+        efi_pgt[root_table_offset(PERDOMAIN_VIRT_START)].l4 =
+            idle_pgt[root_table_offset(PERDOMAIN_VIRT_START)].l4;
+        unmap_domain_page(efi_pgt);
+    }
+
     /* prevent fixup_page_fault() from doing anything */
     irq_enter();
 
diff --git a/xen/common/smp.c b/xen/common/smp.c
index a011f541f1ea..04f5aede0d3d 100644
--- a/xen/common/smp.c
+++ b/xen/common/smp.c
@@ -29,6 +29,7 @@ static struct call_data_struct {
     void (*func) (void *info);
     void *info;
     int wait;
+    unsigned int caller;
     cpumask_t selected;
 } call_data;
 
@@ -63,6 +64,7 @@ void on_selected_cpus(
     call_data.func = func;
     call_data.info = info;
     call_data.wait = wait;
+    call_data.caller = smp_processor_id();
 
     smp_send_call_function_mask(&call_data.selected);
 
@@ -82,6 +84,12 @@ void smp_call_function_interrupt(void)
     if ( !cpumask_test_cpu(cpu, &call_data.selected) )
         return;
 
+    /*
+     * TODO: use bounce buffers to pass callfunc data, so that when using ASI
+     * there's no need to map remote CPU stacks.
+     */
+    arch_smp_pre_callfunc(call_data.caller);
+
     irq_enter();
 
     if ( unlikely(!func) )
@@ -102,6 +110,8 @@ void smp_call_function_interrupt(void)
     }
 
     irq_exit();
+
+    arch_smp_post_callfunc(call_data.caller);
 }
 
 /*
diff --git a/xen/include/xen/smp.h b/xen/include/xen/smp.h
index 2ca9ff1bfcc1..610c279ca24c 100644
--- a/xen/include/xen/smp.h
+++ b/xen/include/xen/smp.h
@@ -76,4 +76,9 @@ extern void *stack_base[NR_CPUS];
 void initialize_cpu_data(unsigned int cpu);
 int setup_cpu_root_pgt(unsigned int cpu);
 
+#ifndef HAS_ARCH_SMP_CALLFUNC
+static inline void arch_smp_pre_callfunc(unsigned int cpu) {}
+static inline void arch_smp_post_callfunc(unsigned int cpu) {}
+#endif
+
 #endif /* __XEN_SMP_H__ */
-- 
2.45.2


