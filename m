Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 160E0A05EF8
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 15:41:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867386.1278931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVXEp-0006DZ-T8; Wed, 08 Jan 2025 14:40:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867386.1278931; Wed, 08 Jan 2025 14:40:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVXEp-0006As-OT; Wed, 08 Jan 2025 14:40:51 +0000
Received: by outflank-mailman (input) for mailman id 867386;
 Wed, 08 Jan 2025 14:40:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2h7L=UA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tVX57-0006o2-Mg
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 14:30:49 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2626b1d6-cdcd-11ef-a0df-8be0dac302b0;
 Wed, 08 Jan 2025 15:30:46 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-aaee2c5ee6eso2013716966b.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 06:30:46 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0e830d9dsm2482307666b.5.2025.01.08.06.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 06:30:43 -0800 (PST)
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
X-Inumbo-ID: 2626b1d6-cdcd-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736346645; x=1736951445; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n+9ipm9aojVjLIK5yzenbimOjI0E5BZJ2ikbMkXDNCg=;
        b=D20e4cfbqWXrDsnosH5HUCM/n++kC/l7XJNpsPUR95nVcXAFk/4JTDChfxHX7KZ6ur
         PtrJ4yZVqJca7FROddgArJqakJs8vMDjfqd/V7BU6SSesFltT60mk9DRtB1oehAyGdu0
         zVleJfF3s8A2S02uVEVklyg8lYN7CRu8vhXg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736346645; x=1736951445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n+9ipm9aojVjLIK5yzenbimOjI0E5BZJ2ikbMkXDNCg=;
        b=BbauOqUJLWI1x0ZO0dZuBx6Y4WC1ZYwuNzDzbi5ZYKWIzWZysWddLwfcLI4/9h7H39
         ZOSfo/FMHrzz5aS28t5+Lm7hG+zJR7Cydtv7PrZRWA5rn2npADyMOIejCIr2KlgRCdD5
         t0l/ohbEr5cd+eJhC2R3lyuxPEPGdGXH7T/3vPF7R+EoqVZXGSk2wB6gq3EdrUtgOdvg
         JGEz9EQgIjBMU9ZUwSPcpkVGiXPuf1HEmUWklzD1GE55zf0Eq3PT9AeUSua5z9FoppYr
         gXFx8uYSCUcWFKetwLM92+obyyR8S4IjJ6d6tSnhzXgZ+5LFEgn0MqFFpgy6iBLVAzrs
         HktA==
X-Gm-Message-State: AOJu0YxqX0eSCEolXVUmP39AcsFUVHnG/Rw2PMm+2vl4fIxAHnnSzJS9
	ZhoLyj8vbyJT36Demej5v35YYAShb3ad/ZiE5y1HUk4OxY+fcgdTaT1oI4jTcIhU/AH9gKLNpf+
	S
X-Gm-Gg: ASbGncud9qerCr+inl6bgN52kVhWfygEAQiNh0XuwKlXpO84yT7FlhSfb+ahhVHGaa7
	YtiPtO6NkQ23u6KC/tkqr4tBDh76txcfScWevreV/8CoYPqPBgF2eZNYwv9GK6GDjSc/1h+iOv+
	ZraAg0sR9KXFzG9n7tihTBhv739aM4E8CLeX/lU6lUSIxyeLQjtRH8pHrt/7cpJU4iDHM9YQZC2
	dxWEGtV2RFwo83pMc5Xz0LDbwWLCb0IqaMVt78HSlHZW8Yu1k/QYq6M2pU9ZEc7jBk=
X-Google-Smtp-Source: AGHT+IFQ6xjtyx4IWz5iNuwpiOSpVoUvBXP3NeKXcaXm3nOGxgy2uWW8xrE/oDyTva2NL/5yAaTPow==
X-Received: by 2002:a17:907:97cc:b0:aa6:ac9b:6822 with SMTP id a640c23a62f3a-ab2ab670625mr215774366b.12.1736346643755;
        Wed, 08 Jan 2025 06:30:43 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 17/18] x86/mm: switch to a per-CPU mapped stack when using ASI
Date: Wed,  8 Jan 2025 15:26:57 +0100
Message-ID: <20250108142659.99490-18-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250108142659.99490-1-roger.pau@citrix.com>
References: <20250108142659.99490-1-roger.pau@citrix.com>
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
 docs/misc/xen-command-line.pandoc    |  5 +-
 xen/arch/x86/domain.c                | 30 ++++++++++++
 xen/arch/x86/include/asm/config.h    | 10 +++-
 xen/arch/x86/include/asm/current.h   |  5 ++
 xen/arch/x86/include/asm/domain.h    |  3 ++
 xen/arch/x86/include/asm/mm.h        |  2 +-
 xen/arch/x86/include/asm/smp.h       | 12 +++++
 xen/arch/x86/include/asm/spec_ctrl.h |  1 +
 xen/arch/x86/mm.c                    | 69 ++++++++++++++++++++++------
 xen/arch/x86/setup.c                 | 32 ++++++++++---
 xen/arch/x86/smp.c                   | 39 ++++++++++++++++
 xen/arch/x86/smpboot.c               | 20 +++++++-
 xen/arch/x86/spec_ctrl.c             | 67 +++++++++++++++++++++++----
 xen/arch/x86/traps.c                 |  8 +++-
 xen/common/smp.c                     | 10 ++++
 xen/common/stop_machine.c            | 10 ++++
 xen/include/xen/smp.h                |  8 ++++
 17 files changed, 295 insertions(+), 36 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 3c1ad7b5fe7d..e7828d092098 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -204,7 +204,7 @@ to appropriate auditing by Xen.  Argo is disabled by default.
 
 ### asi (x86)
 > `= List of [ <bool>, {pv,hvm}=<bool>,
-               {vcpu-pt}=<bool>|{pv,hvm}=<bool> ]`
+               {vcpu-pt,cpu-stack}=<bool>|{pv,hvm}=<bool> ]`
 
 Offers control over whether the hypervisor will engage in Address Space
 Isolation, by not having potentially sensitive information permanently mapped
@@ -221,6 +221,9 @@ meant to be used for debugging purposes only.**
 * `vcpu-pt` ensure each vCPU uses a unique top-level page-table and setup a
   virtual address space region to map memory on a per-vCPU basis.
 
+* `cpu-stack` prevent CPUs from having permanent mappings of stacks different
+  than their own.  Depends on the `vcpu-pt` option.
+
 ### asid (x86)
 > `= <boolean>`
 
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 6e1f622f7385..ac6332266e95 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -563,6 +563,26 @@ int arch_vcpu_create(struct vcpu *v)
     if ( rc )
         return rc;
 
+    if ( opt_cpu_stack_hvm || opt_cpu_stack_pv )
+    {
+        if ( is_idle_vcpu(v) || d->arch.cpu_stack )
+            create_perdomain_mapping(v, PCPU_STACK_VIRT(0),
+                                     nr_cpu_ids << STACK_ORDER, false);
+        else if ( !v->vcpu_id )
+        {
+            l3_pgentry_t *idle_perdomain =
+                __map_domain_page(idle_vcpu[0]->domain->arch.perdomain_l3_pg);
+            l3_pgentry_t *guest_perdomain =
+                __map_domain_page(d->arch.perdomain_l3_pg);
+
+            l3e_write(&guest_perdomain[PCPU_STACK_SLOT],
+                      idle_perdomain[PCPU_STACK_SLOT]);
+
+            unmap_domain_page(guest_perdomain);
+            unmap_domain_page(idle_perdomain);
+        }
+    }
+
     rc = mapcache_vcpu_init(v);
     if ( rc )
         return rc;
@@ -2031,6 +2051,16 @@ static void __context_switch(struct vcpu *n)
         }
         vcpu_restore_fpu_nonlazy(n, false);
         nd->arch.ctxt_switch->to(n);
+        if ( nd->arch.cpu_stack )
+        {
+            /*
+             * Tear down previous stack mappings and map current pCPU stack.
+             * This is safe because not yet running on 'n' page-tables.
+             */
+            destroy_perdomain_mapping(n, PCPU_STACK_VIRT(0),
+                                      nr_cpu_ids << STACK_ORDER);
+            vcpu_set_stack_mappings(n, cpu, true);
+        }
     }
 
     psr_ctxt_switch_to(nd);
diff --git a/xen/arch/x86/include/asm/config.h b/xen/arch/x86/include/asm/config.h
index af3ff3cb8705..016d6c8b21a9 100644
--- a/xen/arch/x86/include/asm/config.h
+++ b/xen/arch/x86/include/asm/config.h
@@ -168,7 +168,7 @@
 /* Slot 260: per-domain mappings (including map cache). */
 #define PERDOMAIN_VIRT_START    (PML4_ADDR(260))
 #define PERDOMAIN_SLOT_MBYTES   (PML4_ENTRY_BYTES >> (20 + PAGETABLE_ORDER))
-#define PERDOMAIN_SLOTS         3
+#define PERDOMAIN_SLOTS         4
 #define PERDOMAIN_VIRT_SLOT(s)  (PERDOMAIN_VIRT_START + (s) * \
                                  (PERDOMAIN_SLOT_MBYTES << 20))
 /* Slot 4: mirror of per-domain mappings (for compat xlat area accesses). */
@@ -288,6 +288,14 @@ extern unsigned long xen_phys_start;
 #define ARG_XLAT_START(v)        \
     (ARG_XLAT_VIRT_START + ((v)->vcpu_id << ARG_XLAT_VA_SHIFT))
 
+/* Per-CPU stacks area when using ASI. */
+#define PCPU_STACK_SLOT         3
+#define PCPU_STACK_VIRT_START   PERDOMAIN_VIRT_SLOT(PCPU_STACK_SLOT)
+#define PCPU_STACK_VIRT_END     (PCPU_STACK_VIRT_START + \
+                                 (PERDOMAIN_SLOT_MBYTES << 20))
+#define PCPU_STACK_VIRT(cpu)    (PCPU_STACK_VIRT_START + \
+                                 (cpu << STACK_ORDER) * PAGE_SIZE)
+
 #define ELFSIZE 64
 
 #define ARCH_CRASH_SAVE_VMCOREINFO
diff --git a/xen/arch/x86/include/asm/current.h b/xen/arch/x86/include/asm/current.h
index bcec328c9875..4a9776f87a7a 100644
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
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index a3c75e323cde..f83d2860c0b4 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -465,6 +465,9 @@ struct arch_domain
     /* Use a per-vCPU root pt, and switch per-domain slot to per-vCPU. */
     bool vcpu_pt;
 
+    /* Use per-CPU mapped stacks. */
+    bool cpu_stack;
+
     /* Emulated devices enabled bitmap. */
     uint32_t emulation_flags;
 } __cacheline_aligned;
diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index f79d1594fde4..77f31685fd95 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -519,7 +519,7 @@ extern struct rangeset *mmio_ro_ranges;
 #define compat_pfn_to_cr3(pfn) (((unsigned)(pfn) << 12) | ((unsigned)(pfn) >> 20))
 #define compat_cr3_to_pfn(cr3) (((unsigned)(cr3) >> 12) | ((unsigned)(cr3) << 20))
 
-void memguard_guard_stack(void *p);
+void memguard_guard_stack(void *p, unsigned int cpu);
 void memguard_unguard_stack(void *p);
 
 /*
diff --git a/xen/arch/x86/include/asm/smp.h b/xen/arch/x86/include/asm/smp.h
index c8c79601343d..a356f0bf0a61 100644
--- a/xen/arch/x86/include/asm/smp.h
+++ b/xen/arch/x86/include/asm/smp.h
@@ -79,6 +79,18 @@ extern bool unaccounted_cpus;
 
 void *cpu_alloc_stack(unsigned int cpu);
 
+/*
+ * Setup the per-CPU area stack mappings.
+ *
+ * @v:         vCPU where the mappings are to appear.
+ * @stack_cpu: CPU whose stacks should be mapped.
+ * @map_shstk: create mappings for shadow stack regions.
+ */
+void vcpu_set_stack_mappings(const struct vcpu *v, unsigned int stack_cpu,
+                             bool map_shstk);
+
+#define HAS_ARCH_SMP_CALLFUNC_PREAMBLE
+
 #endif /* !__ASSEMBLY__ */
 
 #endif
diff --git a/xen/arch/x86/include/asm/spec_ctrl.h b/xen/arch/x86/include/asm/spec_ctrl.h
index c58afbaab671..c8943e81befa 100644
--- a/xen/arch/x86/include/asm/spec_ctrl.h
+++ b/xen/arch/x86/include/asm/spec_ctrl.h
@@ -89,6 +89,7 @@ extern uint8_t default_scf;
 extern int8_t opt_xpti_hwdom, opt_xpti_domu;
 
 extern int8_t opt_vcpu_pt_pv, opt_vcpu_pt_hwdom, opt_vcpu_pt_hvm;
+extern int8_t opt_cpu_stack_pv, opt_cpu_stack_hwdom, opt_cpu_stack_hvm;
 
 extern bool cpu_has_bug_l1tf;
 extern int8_t opt_pv_l1tf_hwdom, opt_pv_l1tf_domu;
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 3a637e508ff3..22ee3170b86d 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -87,6 +87,7 @@
  * doing the final put_page(), and remove it from the iommu if so.
  */
 
+#include <xen/cpu.h>
 #include <xen/init.h>
 #include <xen/ioreq.h>
 #include <xen/kernel.h>
@@ -6424,8 +6425,10 @@ int create_perdomain_mapping(struct vcpu *v, unsigned long va,
     return rc;
 }
 
-void populate_perdomain_mapping(const struct vcpu *v, unsigned long va,
-                                mfn_t *mfn, unsigned long nr)
+static void populate_perdomain_mapping_flags(const struct vcpu *v,
+                                             unsigned long va, mfn_t *mfn,
+                                             unsigned long nr,
+                                             unsigned int flags)
 {
     l1_pgentry_t *l1tab = NULL, *pl1e;
     const l3_pgentry_t *l3tab;
@@ -6454,7 +6457,7 @@ void populate_perdomain_mapping(const struct vcpu *v, unsigned long va,
                 ASSERT_UNREACHABLE();
                 free_domheap_page(l1e_get_page(*pl1e));
             }
-            l1e_write(pl1e, l1e_from_mfn(mfn[i], __PAGE_HYPERVISOR_RW));
+            l1e_write(pl1e, l1e_from_mfn(mfn[i], flags));
         }
 
         return;
@@ -6505,7 +6508,7 @@ void populate_perdomain_mapping(const struct vcpu *v, unsigned long va,
             free_domheap_page(l1e_get_page(*pl1e));
         }
 
-        l1e_write(pl1e, l1e_from_mfn(*mfn, __PAGE_HYPERVISOR_RW));
+        l1e_write(pl1e, l1e_from_mfn(*mfn, flags));
     }
 
     unmap_domain_page(l1tab);
@@ -6513,6 +6516,31 @@ void populate_perdomain_mapping(const struct vcpu *v, unsigned long va,
     unmap_domain_page(l3tab);
 }
 
+void populate_perdomain_mapping(const struct vcpu *v, unsigned long va,
+                                mfn_t *mfn, unsigned long nr)
+{
+    populate_perdomain_mapping_flags(v, va, mfn, nr, __PAGE_HYPERVISOR_RW);
+}
+
+void vcpu_set_stack_mappings(const struct vcpu *v, unsigned int stack_cpu,
+                             bool map_shstk)
+{
+    unsigned int i;
+
+    for ( i = 0; i < (1U << STACK_ORDER); i++ )
+    {
+        unsigned int flags = is_shstk_slot(i) ? __PAGE_HYPERVISOR_SHSTK
+                                              : __PAGE_HYPERVISOR_RW;
+        mfn_t mfn = virt_to_mfn(stack_base[stack_cpu] + i * PAGE_SIZE);
+
+        if ( is_shstk_slot(i) && !map_shstk )
+            continue;
+
+        populate_perdomain_mapping_flags(v,
+            PCPU_STACK_VIRT(stack_cpu) + i * PAGE_SIZE, &mfn, 1, flags);
+    }
+}
+
 void destroy_perdomain_mapping(const struct vcpu *v, unsigned long va,
                                unsigned int nr)
 {
@@ -6599,7 +6627,12 @@ void free_perdomain_mappings(struct vcpu *v)
     l3tab = __map_domain_page(d->arch.vcpu_pt ? v->arch.pervcpu_l3_pg
                                               : d->arch.perdomain_l3_pg);
 
-    for ( i = 0; i < PERDOMAIN_SLOTS; ++i)
+    for ( i = 0; i < PERDOMAIN_SLOTS; ++i )
+    {
+        if ( i == PCPU_STACK_SLOT && !d->arch.cpu_stack )
+            /* Without ASI the stack L3e is shared with the idle page-tables. */
+            continue;
+
         if ( l3e_get_flags(l3tab[i]) & _PAGE_PRESENT )
         {
             struct page_info *l2pg = l3e_get_page(l3tab[i]);
@@ -6629,6 +6662,7 @@ void free_perdomain_mappings(struct vcpu *v)
             unmap_domain_page(l2tab);
             free_domheap_page(l2pg);
         }
+    }
 
     unmap_domain_page(l3tab);
     free_domheap_page(d->arch.vcpu_pt ? v->arch.pervcpu_l3_pg
@@ -6637,31 +6671,40 @@ void free_perdomain_mappings(struct vcpu *v)
     v->arch.pervcpu_l3_pg = NULL;
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
+        (opt_cpu_stack_hvm || opt_cpu_stack_pv) ? PCPU_STACK_VIRT(cpu)
+                                                : (unsigned long)p;
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
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 8ebe5a9443f3..d0b2c986962a 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -402,6 +402,11 @@ static void __init init_idle_domain(void)
     scheduler_init();
     set_current(idle_vcpu[0]);
     this_cpu(curr_vcpu) = current;
+    if ( opt_cpu_stack_hvm || opt_cpu_stack_pv )
+        /* Set per-domain slot in the idle page-tables to access stack mappings. */
+        l4e_write(&idle_pg_table[l4_table_offset(PERDOMAIN_VIRT_START)],
+                  l4e_from_page(idle_vcpu[0]->domain->arch.perdomain_l3_pg,
+                                __PAGE_HYPERVISOR_RW));
 }
 
 void srat_detect_node(int cpu)
@@ -896,8 +901,6 @@ static void __init noreturn reinit_bsp_stack(void)
     /* Update SYSCALL trampolines */
     percpu_traps_init();
 
-    stack_base[0] = stack;
-
     rc = setup_cpu_root_pgt(0);
     if ( rc )
         panic("Error %d setting up PV root page table\n", rc);
@@ -1864,10 +1867,6 @@ void asmlinkage __init noreturn __start_xen(void)
 
     system_state = SYS_STATE_boot;
 
-    bsp_stack = cpu_alloc_stack(0);
-    if ( !bsp_stack )
-        panic("No memory for BSP stack\n");
-
     console_init_ring();
     vesa_init();
 
@@ -2050,6 +2049,16 @@ void asmlinkage __init noreturn __start_xen(void)
 
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
      * NB: when running as a PV shim VCPUOP_up/down is wired to the shim
      * physical cpu_add/remove functions, so launch the guest with only
@@ -2155,8 +2164,17 @@ void asmlinkage __init noreturn __start_xen(void)
         info->last_spec_ctrl = default_xen_spec_ctrl;
     }
 
+    stack_base[0] = bsp_stack;
+
     /* Copy the cpu info block, and move onto the BSP stack. */
-    bsp_info = get_cpu_info_from_stack((unsigned long)bsp_stack);
+    if ( opt_cpu_stack_hvm || opt_cpu_stack_pv )
+    {
+        vcpu_set_stack_mappings(idle_vcpu[0], 0, true);
+        bsp_info = get_cpu_info_from_stack(PCPU_STACK_VIRT(0));
+    }
+    else
+        bsp_info = get_cpu_info_from_stack((unsigned long)bsp_stack);
+
     *bsp_info = *info;
 
     asm volatile ("mov %[stk], %%rsp; jmp %c[fn]" ::
diff --git a/xen/arch/x86/smp.c b/xen/arch/x86/smp.c
index 02a6ed7593f3..1b11017d5722 100644
--- a/xen/arch/x86/smp.c
+++ b/xen/arch/x86/smp.c
@@ -9,6 +9,7 @@
  */
 
 #include <xen/cpu.h>
+#include <xen/efi.h>
 #include <xen/irq.h>
 #include <xen/sched.h>
 #include <xen/delay.h>
@@ -27,6 +28,8 @@
 #include <asm/hpet.h>
 #include <asm/setup.h>
 
+#include <asm/spec_ctrl.h>
+
 /* Helper functions to prepare APIC register values. */
 static unsigned int prepare_ICR(unsigned int shortcut, int vector)
 {
@@ -435,3 +438,39 @@ long cf_check cpu_down_helper(void *data)
         ret = cpu_down(cpu);
     return ret;
 }
+
+void arch_smp_pre_callfunc(unsigned int cpu)
+{
+    if ( !opt_cpu_stack_hvm && !opt_cpu_stack_pv )
+        /*
+         * Avoid the unconditional sync_local_execstate() call below if ASI is
+         * not enabled for any domain.
+         */
+        return;
+
+    /*
+     * Sync execution state, so that the page-tables cannot change while
+     * creating or destroying the stack mappings.
+     */
+    sync_local_execstate();
+    if ( cpu == smp_processor_id() || !current->domain->arch.cpu_stack ||
+         /* EFI page-tables have all pCPU stacks mapped. */
+         efi_rs_using_pgtables() )
+        return;
+
+    vcpu_set_stack_mappings(current, cpu, false);
+}
+
+void arch_smp_post_callfunc(unsigned int cpu)
+{
+    if ( cpu == smp_processor_id() || !current->domain->arch.cpu_stack ||
+         /* EFI page-tables have all pCPU stacks mapped. */
+         efi_rs_using_pgtables() )
+        return;
+
+    ASSERT(current == this_cpu(curr_vcpu));
+    destroy_perdomain_mapping(current, PCPU_STACK_VIRT(cpu),
+                              (1U << STACK_ORDER));
+
+    flush_area_local((void *)PCPU_STACK_VIRT(cpu), FLUSH_ORDER(STACK_ORDER));
+}
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index a740a6402272..515ab3cb9c75 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -582,7 +582,21 @@ static int do_boot_cpu(int apicid, int cpu)
         printk("Booting processor %d/%d eip %lx\n",
                cpu, apicid, start_eip);
 
-    stack_start = stack_base[cpu] + STACK_SIZE - sizeof(struct cpu_info);
+    if ( opt_cpu_stack_hvm || opt_cpu_stack_pv )
+    {
+        /*
+         * Uniformly run with the stack mappings in the per-domain area if ASI
+         * is enabled for any domain type.
+         */
+        vcpu_set_stack_mappings(idle_vcpu[cpu], cpu, true);
+
+        ASSERT(IS_ALIGNED(PCPU_STACK_VIRT(cpu), STACK_SIZE));
+
+        stack_start = (void *)PCPU_STACK_VIRT(cpu) + STACK_SIZE -
+                      sizeof(struct cpu_info);
+    }
+    else
+        stack_start = stack_base[cpu] + STACK_SIZE - sizeof(struct cpu_info);
 
     /* This grunge runs the startup process for the targeted processor. */
 
@@ -1030,7 +1044,7 @@ void *cpu_alloc_stack(unsigned int cpu)
     stack = alloc_xenheap_pages(STACK_ORDER, memflags);
 
     if ( stack )
-        memguard_guard_stack(stack);
+        memguard_guard_stack(stack, cpu);
 
     return stack;
 }
@@ -1146,6 +1160,8 @@ static struct notifier_block cpu_smpboot_nfb = {
 
 void __init smp_prepare_cpus(void)
 {
+    BUILD_BUG_ON(PCPU_STACK_VIRT(CONFIG_NR_CPUS) > PCPU_STACK_VIRT_END);
+
     register_cpu_notifier(&cpu_smpboot_nfb);
 
     mtrr_aps_sync_begin();
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 9463a8624701..4f1e912f8057 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -89,6 +89,10 @@ bool __ro_after_init opt_bp_spec_reduce = true;
 int8_t __ro_after_init opt_vcpu_pt_hvm = -1;
 int8_t __ro_after_init opt_vcpu_pt_hwdom = -1;
 int8_t __ro_after_init opt_vcpu_pt_pv = -1;
+/* Per-CPU stacks. */
+int8_t __ro_after_init opt_cpu_stack_hvm = -1;
+int8_t __ro_after_init opt_cpu_stack_hwdom = -1;
+int8_t __ro_after_init opt_cpu_stack_pv = -1;
 
 static int __init cf_check parse_spec_ctrl(const char *s)
 {
@@ -395,6 +399,7 @@ static __init void xpti_init_default(void)
         printk(XENLOG_ERR
                "XPTI incompatible with per-vCPU page-tables, disabling ASI\n");
         opt_vcpu_pt_pv = 0;
+        opt_cpu_stack_pv = 0;
     }
     if ( (boot_cpu_data.x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) ||
          cpu_has_rdcl_no )
@@ -507,7 +512,10 @@ static int __init cf_check parse_asi(const char *s)
 
     /* Interpret 'asi' alone in its positive boolean form. */
     if ( *s == '\0' )
+    {
         opt_vcpu_pt_pv = opt_vcpu_pt_hwdom = opt_vcpu_pt_hvm = 1;
+        opt_cpu_stack_pv = opt_cpu_stack_hwdom = opt_cpu_stack_hvm = 1;
+    }
 
     do {
         ss = strchr(s, ',');
@@ -520,13 +528,14 @@ static int __init cf_check parse_asi(const char *s)
         case 0:
         case 1:
             opt_vcpu_pt_pv = opt_vcpu_pt_hwdom = opt_vcpu_pt_hvm = val;
+            opt_cpu_stack_pv = opt_cpu_stack_hvm = opt_cpu_stack_hwdom = val;
             break;
 
         default:
             if ( (val = parse_boolean("pv", s, ss)) >= 0 )
-                opt_vcpu_pt_pv = val;
+                opt_cpu_stack_pv = opt_vcpu_pt_pv = val;
             else if ( (val = parse_boolean("hvm", s, ss)) >= 0 )
-                opt_vcpu_pt_hvm = val;
+                opt_cpu_stack_hvm = opt_vcpu_pt_hvm = val;
             else if ( (val = parse_boolean("vcpu-pt", s, ss)) != -1 )
             {
                 switch ( val )
@@ -548,6 +557,28 @@ static int __init cf_check parse_asi(const char *s)
                     break;
                 }
             }
+            else if ( (val = parse_boolean("cpu-stack", s, ss)) != -1 )
+            {
+                switch ( val )
+                {
+                case 1:
+                case 0:
+                    opt_cpu_stack_pv = opt_cpu_stack_hvm =
+                        opt_cpu_stack_hwdom = val;
+                    break;
+
+                case -2:
+                    s += strlen("cpu-stack=");
+                    if ( (val = parse_boolean("pv", s, ss)) >= 0 )
+                        opt_cpu_stack_pv = val;
+                    else if ( (val = parse_boolean("hvm", s, ss)) >= 0 )
+                        opt_cpu_stack_hvm = val;
+                    else
+                default:
+                        rc = -EINVAL;
+                    break;
+                }
+            }
             else if ( *s )
                 rc = -EINVAL;
             break;
@@ -556,6 +587,14 @@ static int __init cf_check parse_asi(const char *s)
         s = ss + 1;
     } while ( *ss );
 
+    /* Per-CPU stacks depends on per-vCPU mappings. */
+    if ( opt_cpu_stack_pv == 1 )
+        opt_vcpu_pt_pv = 1;
+    if ( opt_cpu_stack_hvm == 1 )
+        opt_vcpu_pt_hvm = 1;
+    if ( opt_cpu_stack_hwdom == 1 )
+        opt_vcpu_pt_hwdom = 1;
+
     return rc;
 }
 custom_param("asi", parse_asi);
@@ -752,16 +791,17 @@ static void __init print_details(enum ind_thunk thunk)
 #endif
 
 #ifdef CONFIG_HVM
-    printk("  ASI features for HVM VMs:%s%s\n",
-           opt_vcpu_pt_hvm                           ? ""               : " None",
-           opt_vcpu_pt_hvm                           ? " vCPU-PT"       : "");
+    printk("  ASI features for HVM VMs:%s%s%s\n",
+           opt_vcpu_pt_hvm || opt_cpu_stack_hvm      ? ""               : " None",
+           opt_vcpu_pt_hvm                           ? " vCPU-PT"       : "",
+           opt_cpu_stack_hvm                         ? " CPU-STACK"     : "");
 
 #endif
 #ifdef CONFIG_PV
-    printk("  ASI features for PV VMs:%s%s\n",
-           opt_vcpu_pt_pv                            ? ""               : " None",
-           opt_vcpu_pt_pv                            ? " vCPU-PT"       : "");
-
+    printk("  ASI features for PV VMs:%s%s%s\n",
+           opt_vcpu_pt_pv || opt_cpu_stack_pv        ? ""               : " None",
+           opt_vcpu_pt_pv                            ? " vCPU-PT"       : "",
+           opt_cpu_stack_pv                          ? " CPU-STACK"     : "");
 #endif
 }
 
@@ -1869,6 +1909,9 @@ void spec_ctrl_init_domain(struct domain *d)
     d->arch.vcpu_pt = is_hardware_domain(d) ? opt_vcpu_pt_hwdom
                                             : pv ? opt_vcpu_pt_pv
                                                  : opt_vcpu_pt_hvm;
+    d->arch.cpu_stack = is_hardware_domain(d) ? opt_cpu_stack_hwdom
+                                              : pv ? opt_cpu_stack_pv
+                                                   : opt_cpu_stack_hvm;
 }
 
 void __init init_speculation_mitigations(void)
@@ -2172,6 +2215,12 @@ void __init init_speculation_mitigations(void)
         opt_vcpu_pt_hwdom = 0;
     if ( opt_vcpu_pt_hvm == -1 )
         opt_vcpu_pt_hvm = 0;
+    if ( opt_cpu_stack_pv == -1 )
+        opt_cpu_stack_pv = 0;
+    if ( opt_cpu_stack_hwdom == -1 )
+        opt_cpu_stack_hwdom = 0;
+    if ( opt_cpu_stack_hvm == -1 )
+        opt_cpu_stack_hvm = 0;
 
     if ( opt_vcpu_pt_pv || opt_vcpu_pt_hvm )
         warning_add(
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index a7f6fb611c34..c80ef2268e94 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -74,6 +74,7 @@
 #include <asm/pv/trace.h>
 #include <asm/pv/mm.h>
 #include <asm/shstk.h>
+#include <asm/spec_ctrl.h>
 
 /*
  * opt_nmi: one of 'ignore', 'dom0', or 'fatal'.
@@ -609,10 +610,13 @@ void show_stack_overflow(unsigned int cpu, const struct cpu_user_regs *regs)
     unsigned long esp = regs->rsp;
     unsigned long curr_stack_base = esp & ~(STACK_SIZE - 1);
     unsigned long esp_top, esp_bottom;
+    const void *stack =
+        (opt_cpu_stack_hvm || opt_cpu_stack_pv) ? (void *)PCPU_STACK_VIRT(cpu)
+                                                : stack_base[cpu];
 
-    if ( _p(curr_stack_base) != stack_base[cpu] )
+    if ( _p(curr_stack_base) != stack )
         printk("Current stack base %p differs from expected %p\n",
-               _p(curr_stack_base), stack_base[cpu]);
+               _p(curr_stack_base), stack);
 
     esp_bottom = (esp | (STACK_SIZE - 1)) + 1;
     esp_top    = esp_bottom - PRIMARY_STACK_SIZE;
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
diff --git a/xen/common/stop_machine.c b/xen/common/stop_machine.c
index 398cfd507c10..142059c36374 100644
--- a/xen/common/stop_machine.c
+++ b/xen/common/stop_machine.c
@@ -40,6 +40,7 @@ enum stopmachine_state {
 
 struct stopmachine_data {
     unsigned int nr_cpus;
+    unsigned int caller;
 
     enum stopmachine_state state;
     atomic_t done;
@@ -104,6 +105,7 @@ int stop_machine_run(int (*fn)(void *data), void *data, unsigned int cpu)
     stopmachine_data.fn_result = 0;
     atomic_set(&stopmachine_data.done, 0);
     stopmachine_data.state = STOPMACHINE_START;
+    stopmachine_data.caller = this;
 
     smp_wmb();
 
@@ -148,6 +150,12 @@ static void cf_check stopmachine_action(void *data)
 
     BUG_ON(cpu != smp_processor_id());
 
+    /*
+     * TODO: use bounce buffers to pass callfunc data, so that when using ASI
+     * there's no need to map remote CPU stacks.
+     */
+    arch_smp_pre_callfunc(stopmachine_data.caller);
+
     smp_mb();
 
     while ( state != STOPMACHINE_EXIT )
@@ -180,6 +188,8 @@ static void cf_check stopmachine_action(void *data)
     }
 
     local_irq_enable();
+
+    arch_smp_post_callfunc(stopmachine_data.caller);
 }
 
 static int cf_check cpu_callback(
diff --git a/xen/include/xen/smp.h b/xen/include/xen/smp.h
index 2ca9ff1bfcc1..a25d47e29dce 100644
--- a/xen/include/xen/smp.h
+++ b/xen/include/xen/smp.h
@@ -76,4 +76,12 @@ extern void *stack_base[NR_CPUS];
 void initialize_cpu_data(unsigned int cpu);
 int setup_cpu_root_pgt(unsigned int cpu);
 
+#ifdef HAS_ARCH_SMP_CALLFUNC_PREAMBLE
+void arch_smp_pre_callfunc(unsigned int cpu);
+void arch_smp_post_callfunc(unsigned int cpu);
+#else
+static inline void arch_smp_pre_callfunc(unsigned int cpu) {}
+static inline void arch_smp_post_callfunc(unsigned int cpu) {}
+#endif
+
 #endif /* __XEN_SMP_H__ */
-- 
2.46.0


