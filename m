Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A13EA05E9F
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 15:30:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867321.1278836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVX4p-0006xE-Ka; Wed, 08 Jan 2025 14:30:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867321.1278836; Wed, 08 Jan 2025 14:30:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVX4p-0006uc-BP; Wed, 08 Jan 2025 14:30:31 +0000
Received: by outflank-mailman (input) for mailman id 867321;
 Wed, 08 Jan 2025 14:30:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2h7L=UA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tVX4n-0005q4-Rs
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 14:30:29 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1aa728e9-cdcd-11ef-99a4-01e77a169b0f;
 Wed, 08 Jan 2025 15:30:27 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5d982de9547so287385a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 06:30:27 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d80675a6ddsm25112021a12.3.2025.01.08.06.30.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 06:30:24 -0800 (PST)
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
X-Inumbo-ID: 1aa728e9-cdcd-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736346626; x=1736951426; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m03YXRaYCtzyIlnn1N4iDdGZqjJbMIkKRiM7m/8rx14=;
        b=SKEAwsVHqJSOh0hGbVccs3ejq4OwHvtFfki3mykrulYwh7nS1w/yPYDmu9Uyqlo7IO
         gqCpOgcKIYy8QHMtBEo0u4mbUSzXyAdYOUBnFjA82PtH52lHnjoR4GlWJggehBFeisKm
         WE7/tgyNqvdyF7MNjUXUI1smD9ZarLL1CaJpo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736346626; x=1736951426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m03YXRaYCtzyIlnn1N4iDdGZqjJbMIkKRiM7m/8rx14=;
        b=eATkH06awYqBoe/UtB831ONsbBFyAHYMg4DhWC1pLTofGTQsbJCRZ2kpjXFn3QTOda
         3m+XTAOogo3p0fId81eJhTyoaC/aHVDqTRvlZFbDCCxfWa7yK0i9bPwhG9RmWBLJP6i2
         6QuCM3rGJp2ZG4BTLQYGvEEE+bwKr8AsRhRDoSgfSZ59kT1CuEZeceexk6FOiA33pSeo
         b6zCu4r6j+7EEf5GLhAFIdMCy4k88n0hUGxYytgr7YhTns5DjrkbspXkfG6qLA0vPrmO
         b1ErRImWytoeI2DXsqNwox/Eexc4WoUvMzR7JSsNSTtDw/PEemVrqKIEZ2DLfT7aQbfM
         NwMQ==
X-Gm-Message-State: AOJu0YwbJCUVT/YBXzduaz9CEIkEYr69OYmOAdBEI540lI2WiQ++Plu7
	+q6cLvmxlPyAocUEGErNCw2+yEnc5ZElSfNKxYp/3fg7AnWqyP9enQ4wDHTYVcbn0PI8nY+2RAJ
	R
X-Gm-Gg: ASbGncvT/slGUT9IwlZ6PC/XGH5++g08P+PbZws0Ok7hulbNESK/I0WloU9zpODzpAc
	JGnuWeNAUBiPWzF2q5qlSuIb4JDAAdfLL0O/sPxO85/Dz4qzB8uZILVCZxlm2pH7K5MMCMWKhOo
	xTR88AlawN9Jhq9TV1J9364AjeJCL0Ln5sDUFSJIq/sI4MCT51BQHN6jnn2w8ksCE6g3Tq3mRRn
	+jFWDhDfDt/3/6qxEBrKqFOCqEuWouZwJ72g7QLF/ouAH9TG36mhy1cHL1OkP+lRh8=
X-Google-Smtp-Source: AGHT+IEohyalVzvnZbfPC5tNJbo0bX+go4X3U0Zx/bW9ziWAaGUnjmDoFWM3cG+OkBfpx4y5duIIHQ==
X-Received: by 2002:a05:6402:3581:b0:5d3:ba42:e9fe with SMTP id 4fb4d7f45d1cf-5d972e04bb3mr2416313a12.12.1736346625293;
        Wed, 08 Jan 2025 06:30:25 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 04/18] x86/pv: introduce function to populate perdomain area and use it to map Xen GDT
Date: Wed,  8 Jan 2025 15:26:44 +0100
Message-ID: <20250108142659.99490-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250108142659.99490-1-roger.pau@citrix.com>
References: <20250108142659.99490-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current code to update the Xen part of the GDT when running a PV guest
relies on caching the direct map address of all the L1 tables used to map the
GDT and LDT, so that entries can be modified.

Introduce a new function that populates the per-domain region, either using the
recursive linear mappings when the target vCPU is the current one, or by
directly modifying the L1 table of the per-domain region.

Using such function to populate per-domain addresses drops the need to keep a
reference to per-domain L1 tables previously used to change the per-domain
mappings.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/domain.c                | 11 +++-
 xen/arch/x86/include/asm/desc.h      |  6 +-
 xen/arch/x86/include/asm/mm.h        |  2 +
 xen/arch/x86/include/asm/processor.h |  5 ++
 xen/arch/x86/mm.c                    | 88 ++++++++++++++++++++++++++++
 xen/arch/x86/smpboot.c               |  6 +-
 xen/arch/x86/traps.c                 | 10 ++--
 7 files changed, 113 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 1f680bf176ee..0bd0ef7e40f4 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1953,9 +1953,14 @@ static always_inline bool need_full_gdt(const struct domain *d)
 
 static void update_xen_slot_in_full_gdt(const struct vcpu *v, unsigned int cpu)
 {
-    l1e_write(pv_gdt_ptes(v) + FIRST_RESERVED_GDT_PAGE,
-              !is_pv_32bit_vcpu(v) ? per_cpu(gdt_l1e, cpu)
-                                   : per_cpu(compat_gdt_l1e, cpu));
+    ASSERT(v != current);
+
+    populate_perdomain_mapping(v,
+                               GDT_VIRT_START(v) +
+                               (FIRST_RESERVED_GDT_PAGE << PAGE_SHIFT),
+                               !is_pv_32bit_vcpu(v) ? &per_cpu(gdt_mfn, cpu)
+                                                    : &per_cpu(compat_gdt_mfn,
+                                                               cpu), 1);
 }
 
 static void load_full_gdt(const struct vcpu *v, unsigned int cpu)
diff --git a/xen/arch/x86/include/asm/desc.h b/xen/arch/x86/include/asm/desc.h
index a1e0807d97ed..33981bfca588 100644
--- a/xen/arch/x86/include/asm/desc.h
+++ b/xen/arch/x86/include/asm/desc.h
@@ -44,6 +44,8 @@
 
 #ifndef __ASSEMBLY__
 
+#include <xen/mm-frame.h>
+
 #define GUEST_KERNEL_RPL(d) (is_pv_32bit_domain(d) ? 1 : 3)
 
 /* Fix up the RPL of a guest segment selector. */
@@ -212,10 +214,10 @@ struct __packed desc_ptr {
 
 extern seg_desc_t boot_gdt[];
 DECLARE_PER_CPU(seg_desc_t *, gdt);
-DECLARE_PER_CPU(l1_pgentry_t, gdt_l1e);
+DECLARE_PER_CPU(mfn_t, gdt_mfn);
 extern seg_desc_t boot_compat_gdt[];
 DECLARE_PER_CPU(seg_desc_t *, compat_gdt);
-DECLARE_PER_CPU(l1_pgentry_t, compat_gdt_l1e);
+DECLARE_PER_CPU(mfn_t, compat_gdt_mfn);
 DECLARE_PER_CPU(bool, full_gdt_loaded);
 
 static inline void lgdt(const struct desc_ptr *gdtr)
diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index 6c7e66ee21ab..b50a51327b2b 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -603,6 +603,8 @@ int compat_arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
 int create_perdomain_mapping(struct domain *d, unsigned long va,
                              unsigned int nr, l1_pgentry_t **pl1tab,
                              struct page_info **ppg);
+void populate_perdomain_mapping(const struct vcpu *v, unsigned long va,
+                                mfn_t *mfn, unsigned long nr);
 void destroy_perdomain_mapping(struct domain *d, unsigned long va,
                                unsigned int nr);
 void free_perdomain_mappings(struct domain *d);
diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index d247ef8dd226..82ee89f736c2 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -243,6 +243,11 @@ static inline unsigned long cr3_pa(unsigned long cr3)
     return cr3 & X86_CR3_ADDR_MASK;
 }
 
+static inline mfn_t cr3_mfn(unsigned long cr3)
+{
+    return maddr_to_mfn(cr3_pa(cr3));
+}
+
 static inline unsigned int cr3_pcid(unsigned long cr3)
 {
     return IS_ENABLED(CONFIG_PV) ? cr3 & X86_CR3_PCID_MASK : 0;
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 3d5dd22b6c36..0abea792486c 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -6423,6 +6423,94 @@ int create_perdomain_mapping(struct domain *d, unsigned long va,
     return rc;
 }
 
+void populate_perdomain_mapping(const struct vcpu *v, unsigned long va,
+                                mfn_t *mfn, unsigned long nr)
+{
+    l1_pgentry_t *l1tab = NULL, *pl1e;
+    const l3_pgentry_t *l3tab;
+    const l2_pgentry_t *l2tab;
+    struct domain *d = v->domain;
+
+    ASSERT(va >= PERDOMAIN_VIRT_START &&
+           va < PERDOMAIN_VIRT_SLOT(PERDOMAIN_SLOTS));
+    ASSERT(!nr || !l3_table_offset(va ^ (va + nr * PAGE_SIZE - 1)));
+
+    /* Use likely to force the optimization for the fast path. */
+    if ( likely(v == current) )
+    {
+        unsigned int i;
+
+        /* Ensure page-tables are from current (if current != curr_vcpu). */
+        sync_local_execstate();
+
+        /* Fast path: get L1 entries using the recursive linear mappings. */
+        pl1e = &__linear_l1_table[l1_linear_offset(va)];
+
+        for ( i = 0; i < nr; i++, pl1e++ )
+        {
+            if ( unlikely(perdomain_l1e_needs_freeing(*pl1e)) )
+            {
+                ASSERT_UNREACHABLE();
+                free_domheap_page(l1e_get_page(*pl1e));
+            }
+            l1e_write(pl1e, l1e_from_mfn(mfn[i], __PAGE_HYPERVISOR_RW));
+        }
+
+        return;
+    }
+
+    ASSERT(d->arch.perdomain_l3_pg);
+    l3tab = __map_domain_page(d->arch.perdomain_l3_pg);
+
+    if ( unlikely(!(l3e_get_flags(l3tab[l3_table_offset(va)]) &
+                    _PAGE_PRESENT)) )
+    {
+        unmap_domain_page(l3tab);
+        gprintk(XENLOG_ERR, "unable to map at VA %lx: L3e not present\n", va);
+        ASSERT_UNREACHABLE();
+        domain_crash(d);
+
+        return;
+    }
+
+    l2tab = map_l2t_from_l3e(l3tab[l3_table_offset(va)]);
+
+    for ( ; nr--; va += PAGE_SIZE, mfn++ )
+    {
+        if ( !l1tab || !l1_table_offset(va) )
+        {
+            const l2_pgentry_t *pl2e = l2tab + l2_table_offset(va);
+
+            if ( unlikely(!(l2e_get_flags(*pl2e) & _PAGE_PRESENT)) )
+            {
+                gprintk(XENLOG_ERR, "unable to map at VA %lx: L2e not present\n",
+                        va);
+                ASSERT_UNREACHABLE();
+                domain_crash(d);
+
+                break;
+            }
+
+            unmap_domain_page(l1tab);
+            l1tab = map_l1t_from_l2e(*pl2e);
+        }
+
+        pl1e = &l1tab[l1_table_offset(va)];
+
+        if ( unlikely(perdomain_l1e_needs_freeing(*pl1e)) )
+        {
+            ASSERT_UNREACHABLE();
+            free_domheap_page(l1e_get_page(*pl1e));
+        }
+
+        l1e_write(pl1e, l1e_from_mfn(*mfn, __PAGE_HYPERVISOR_RW));
+    }
+
+    unmap_domain_page(l1tab);
+    unmap_domain_page(l2tab);
+    unmap_domain_page(l3tab);
+}
+
 void destroy_perdomain_mapping(struct domain *d, unsigned long va,
                                unsigned int nr)
 {
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 79a79c54c304..a740a6402272 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -1059,8 +1059,7 @@ static int cpu_smpboot_alloc(unsigned int cpu)
     if ( gdt == NULL )
         goto out;
     per_cpu(gdt, cpu) = gdt;
-    per_cpu(gdt_l1e, cpu) =
-        l1e_from_pfn(virt_to_mfn(gdt), __PAGE_HYPERVISOR_RW);
+    per_cpu(gdt_mfn, cpu) = _mfn(virt_to_mfn(gdt));
     memcpy(gdt, boot_gdt, NR_RESERVED_GDT_PAGES * PAGE_SIZE);
     BUILD_BUG_ON(NR_CPUS > 0x10000);
     gdt[PER_CPU_GDT_ENTRY - FIRST_RESERVED_GDT_ENTRY].a = cpu;
@@ -1069,8 +1068,7 @@ static int cpu_smpboot_alloc(unsigned int cpu)
     per_cpu(compat_gdt, cpu) = gdt = alloc_xenheap_pages(0, memflags);
     if ( gdt == NULL )
         goto out;
-    per_cpu(compat_gdt_l1e, cpu) =
-        l1e_from_pfn(virt_to_mfn(gdt), __PAGE_HYPERVISOR_RW);
+    per_cpu(compat_gdt_mfn, cpu) = _mfn(virt_to_mfn(gdt));
     memcpy(gdt, boot_compat_gdt, NR_RESERVED_GDT_PAGES * PAGE_SIZE);
     gdt[PER_CPU_GDT_ENTRY - FIRST_RESERVED_GDT_ENTRY].a = cpu;
 #endif
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 487b8c5a78c5..a7f6fb611c34 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -92,10 +92,10 @@ DEFINE_PER_CPU(uint64_t, efer);
 static DEFINE_PER_CPU(unsigned long, last_extable_addr);
 
 DEFINE_PER_CPU_READ_MOSTLY(seg_desc_t *, gdt);
-DEFINE_PER_CPU_READ_MOSTLY(l1_pgentry_t, gdt_l1e);
+DEFINE_PER_CPU_READ_MOSTLY(mfn_t, gdt_mfn);
 #ifdef CONFIG_PV32
 DEFINE_PER_CPU_READ_MOSTLY(seg_desc_t *, compat_gdt);
-DEFINE_PER_CPU_READ_MOSTLY(l1_pgentry_t, compat_gdt_l1e);
+DEFINE_PER_CPU_READ_MOSTLY(mfn_t, compat_gdt_mfn);
 #endif
 
 /* Master table, used by CPU0. */
@@ -2219,11 +2219,9 @@ void __init trap_init(void)
     init_ler();
 
     /* Cache {,compat_}gdt_l1e now that physically relocation is done. */
-    this_cpu(gdt_l1e) =
-        l1e_from_pfn(virt_to_mfn(boot_gdt), __PAGE_HYPERVISOR_RW);
+    this_cpu(gdt_mfn) = _mfn(virt_to_mfn(boot_gdt));
     if ( IS_ENABLED(CONFIG_PV32) )
-        this_cpu(compat_gdt_l1e) =
-            l1e_from_pfn(virt_to_mfn(boot_compat_gdt), __PAGE_HYPERVISOR_RW);
+        this_cpu(compat_gdt_mfn) = _mfn(virt_to_mfn(boot_compat_gdt));
 
     percpu_traps_init();
 
-- 
2.46.0


