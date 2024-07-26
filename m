Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F6D93D640
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 17:39:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765605.1176290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXN2I-0001h6-Vt; Fri, 26 Jul 2024 15:39:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765605.1176290; Fri, 26 Jul 2024 15:39:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXN2I-0001dZ-S6; Fri, 26 Jul 2024 15:39:14 +0000
Received: by outflank-mailman (input) for mailman id 765605;
 Fri, 26 Jul 2024 15:39:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bxzg=O2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sXMvW-00084T-VO
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2024 15:32:15 +0000
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [2607:f8b0:4864:20::82e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a956b84-4b64-11ef-8776-851b0ebba9a2;
 Fri, 26 Jul 2024 17:32:13 +0200 (CEST)
Received: by mail-qt1-x82e.google.com with SMTP id
 d75a77b69052e-44fe58fcf29so3847531cf.2
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2024 08:32:12 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-44fe81259cesm14414941cf.6.2024.07.26.08.32.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jul 2024 08:32:09 -0700 (PDT)
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
X-Inumbo-ID: 3a956b84-4b64-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722007931; x=1722612731; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D/Si1GObgr7VHk+37CZa7YHHAXjnb60+qTIn0xcWOxk=;
        b=kvGLK3cnHBOWVPyLL2a5LWNAGH+IdS0PqP3iwoNcbT6QccCG9Vk/FaOHrdLhd3/MKc
         dSw+1gjN6EFBEeD6JMmsEX8TUtLoAagtbO4akI9YTzxFqawG9GhG2/dHhddSJKW6uKWF
         Y8qEVNx1T3TP6rx0HwqaPQz7SOIQu4FID+fQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722007931; x=1722612731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D/Si1GObgr7VHk+37CZa7YHHAXjnb60+qTIn0xcWOxk=;
        b=uwMQpRUpNf+DscGt3s4mol6LnWsFis3Zd2ueXE5m50WvUsKJbwCe3TZna6oTWboplb
         vrW0RkzerbuSCMf8B7R2X+f4a8rtEN74rI3JwJo4aPjkSOcWjU06IdpIAXtcwYQTCDGv
         wVYkHSsT87rKnnpNCgEGrehpU9LcPJmfHy5EnE84zE01F8cT5+Rn3aklccaoriK6P55Z
         xffCEP8XccVrJAl+uk5HGk8rNXuYCHRmGSqvIPUL096ejROgvpz3OPJKZxm54Qb+7S4H
         WA4tj/yGNYT01prVNM90/U/TlkF7C3di92Ji4gNu6OcoMK+4ZhvBw7cv1OnRAO5hY819
         AHIw==
X-Gm-Message-State: AOJu0YzGQfVAPg4ZZdzZa01cf24MVSeJAV4M+POvrPhD9mOdw7kvpnuA
	9cwBuDMJ13EfMr29nwJAx0CpgxuoosQq+5f9DDOtx/X+aykkIKPf7StCVVJZQaUvsm3qTGDGyzk
	9
X-Google-Smtp-Source: AGHT+IFlmoKIVbvsxd/sjDsiPGUXG2bxnsKNLp/iKOSkxDcooIG1tLdj9v2mDDAsKk1LuEAAGdEnhA==
X-Received: by 2002:a05:622a:13d1:b0:447:e83a:1051 with SMTP id d75a77b69052e-45004f3dd66mr1394031cf.47.1722007930041;
        Fri, 26 Jul 2024 08:32:10 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: alejandro.vallejo@cloud.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 20/22] x86/pv: allow using a unique per-pCPU root page table (L4)
Date: Fri, 26 Jul 2024 17:22:04 +0200
Message-ID: <20240726152206.28411-21-roger.pau@citrix.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240726152206.28411-1-roger.pau@citrix.com>
References: <20240726152206.28411-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When running PV guests it's possible for the guest to use the same root page
table (L4) for all vCPUs, which in turn will result in Xen also using the same
root page table on all pCPUs that are running any domain vCPU.

When using XPTI Xen switches to a per-CPU shadow L4 when running in guest
context, switching to the fully populated L4 when in Xen context.

Take advantage of this existing shadowing and force the usage of a per-CPU L4
that shadows the guest selected L4 when Address Space Isolation is requested
for PV guests.

The mapping of the guest L4 is done with a per-CPU fixmap entry, that however
requires that the currently loaded L4 has the per-CPU slot setup.  In order to
ensure this switch to the shadow per-CPU L4 with just the Xen slots populated,
and then map the guest L4 and copy the contents of the guest controlled
slots.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/domain.c              | 37 +++++++++++++++++++++
 xen/arch/x86/flushtlb.c            |  9 ++++++
 xen/arch/x86/include/asm/current.h | 15 ++++++---
 xen/arch/x86/include/asm/fixmap.h  |  1 +
 xen/arch/x86/include/asm/pv/mm.h   |  8 +++++
 xen/arch/x86/mm.c                  | 47 +++++++++++++++++++++++++++
 xen/arch/x86/pv/domain.c           | 25 ++++++++++++--
 xen/arch/x86/pv/mm.c               | 52 ++++++++++++++++++++++++++++++
 xen/arch/x86/smpboot.c             | 20 +++++++++++-
 9 files changed, 207 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index b62c4311da6c..94a42ef29cd1 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -45,6 +45,7 @@
 #include <asm/io.h>
 #include <asm/processor.h>
 #include <asm/desc.h>
+#include <asm/fixmap.h>
 #include <asm/i387.h>
 #include <asm/xstate.h>
 #include <asm/cpuidle.h>
@@ -2110,11 +2111,47 @@ void context_switch(struct vcpu *prev, struct vcpu *next)
 
     local_irq_disable();
 
+    if ( is_pv_domain(prevd) && prevd->arch.asi )
+    {
+        /*
+         * Don't leak the L4 shadow mapping in the per-CPU area.  Can't be done
+         * in paravirt_ctxt_switch_from() because the lazy idle vCPU context
+         * switch would otherwise enter an infinite loop in
+         * mapcache_current_vcpu() with sync_local_execstate().
+         *
+         * Note clearing the fixmpa must strictly be done ahead of changing the
+         * current vCPU and with interrupts disabled, so there's no window
+         * where current->domain->arch.asi == true and PCPU_FIX_PV_L4SHADOW is
+         * not mapped.
+         */
+        percpu_clear_fixmap(PCPU_FIX_PV_L4SHADOW);
+        get_cpu_info()->root_pgt_changed = false;
+    }
+
     set_current(next);
 
     if ( (per_cpu(curr_vcpu, cpu) == next) ||
          (is_idle_domain(nextd) && cpu_online(cpu)) )
     {
+        if ( is_pv_domain(nextd) && nextd->arch.asi )
+        {
+            /* Signal the fixmap entry must be mapped. */
+            get_cpu_info()->new_cr3 = true;
+            if ( get_cpu_info()->root_pgt_changed )
+            {
+                /*
+                 * Map and update the shadow L4 in case we received any
+                 * FLUSH_ROOT_PGTBL request while running on the idle vCPU.
+                 *
+                 * Do it before enabling interrupts so that no flush IPI can be
+                 * delivered without having PCPU_FIX_PV_L4SHADOW correctly
+                 * mapped.
+                 */
+                pv_update_shadow_l4(next, true);
+                get_cpu_info()->root_pgt_changed = false;
+            }
+        }
+
         local_irq_enable();
     }
     else
diff --git a/xen/arch/x86/flushtlb.c b/xen/arch/x86/flushtlb.c
index fd5ed16ffb57..b85ce232abbb 100644
--- a/xen/arch/x86/flushtlb.c
+++ b/xen/arch/x86/flushtlb.c
@@ -17,6 +17,7 @@
 #include <asm/nops.h>
 #include <asm/page.h>
 #include <asm/pv/domain.h>
+#include <asm/pv/mm.h>
 #include <asm/spec_ctrl.h>
 
 /* Debug builds: Wrap frequently to stress-test the wrap logic. */
@@ -192,7 +193,15 @@ unsigned int flush_area_local(const void *va, unsigned int flags)
     unsigned int order = (flags - 1) & FLUSH_ORDER_MASK;
 
     if ( flags & FLUSH_ROOT_PGTBL )
+    {
+        const struct vcpu *curr = current;
+        const struct domain *curr_d = curr->domain;
+
         get_cpu_info()->root_pgt_changed = true;
+        if ( is_pv_domain(curr_d) && curr_d->arch.asi )
+            /* Update the shadow root page-table ahead of doing TLB flush. */
+            pv_update_shadow_l4(curr, false);
+    }
 
     if ( flags & (FLUSH_TLB|FLUSH_TLB_GLOBAL) )
     {
diff --git a/xen/arch/x86/include/asm/current.h b/xen/arch/x86/include/asm/current.h
index bcec328c9875..6a021607a1a9 100644
--- a/xen/arch/x86/include/asm/current.h
+++ b/xen/arch/x86/include/asm/current.h
@@ -60,10 +60,14 @@ struct cpu_info {
     uint8_t      scf; /* SCF_* */
 
     /*
-     * The following field controls copying of the L4 page table of 64-bit
-     * PV guests to the per-cpu root page table on entering the guest context.
-     * If set the L4 page table is being copied to the root page table and
-     * the field will be reset.
+     * For XPTI the following field controls copying of the L4 page table of
+     * 64-bit PV guests to the per-cpu root page table on entering the guest
+     * context.  If set the L4 page table is being copied to the root page
+     * table and the field will be reset.
+     *
+     * For ASI the field is used to acknowledge whether a FLUSH_ROOT_PGTBL
+     * request has been received when running the idle vCPU on PV guest
+     * page-tables (a lazy context switch to the idle vCPU).
      */
     bool         root_pgt_changed;
 
@@ -74,6 +78,9 @@ struct cpu_info {
      */
     bool         use_pv_cr3;
 
+    /* For ASI: per-CPU fixmap of guest L4 is possibly out of sync. */
+    bool         new_cr3;
+
     /* get_stack_bottom() must be 16-byte aligned */
 };
 
diff --git a/xen/arch/x86/include/asm/fixmap.h b/xen/arch/x86/include/asm/fixmap.h
index a456c65072d8..bc68a98568ae 100644
--- a/xen/arch/x86/include/asm/fixmap.h
+++ b/xen/arch/x86/include/asm/fixmap.h
@@ -120,6 +120,7 @@ extern void __set_fixmap_x(
 
 /* per-CPU fixmap area. */
 enum percpu_fixed_addresses {
+    PCPU_FIX_PV_L4SHADOW,
     __end_of_percpu_fixed_addresses
 };
 
diff --git a/xen/arch/x86/include/asm/pv/mm.h b/xen/arch/x86/include/asm/pv/mm.h
index 182764542c1f..a7c74898fce0 100644
--- a/xen/arch/x86/include/asm/pv/mm.h
+++ b/xen/arch/x86/include/asm/pv/mm.h
@@ -23,6 +23,9 @@ bool pv_destroy_ldt(struct vcpu *v);
 
 int validate_segdesc_page(struct page_info *page);
 
+void pv_clear_l4_guest_entries(root_pgentry_t *root_pgt);
+void pv_update_shadow_l4(const struct vcpu *v, bool flush);
+
 #else
 
 #include <xen/errno.h>
@@ -44,6 +47,11 @@ static inline bool pv_map_ldt_shadow_page(unsigned int off) { return false; }
 static inline bool pv_destroy_ldt(struct vcpu *v)
 { ASSERT_UNREACHABLE(); return false; }
 
+static inline void pv_clear_l4_guest_entries(root_pgentry_t *root_pgt)
+{ ASSERT_UNREACHABLE(); }
+static inline void pv_update_shadow_l4(const struct vcpu *v, bool flush)
+{ ASSERT_UNREACHABLE(); }
+
 #endif
 
 #endif /* __X86_PV_MM_H__ */
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 937089d203cc..8fea7465a9df 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -513,6 +513,8 @@ void make_cr3(struct vcpu *v, mfn_t mfn)
     v->arch.cr3 = mfn_x(mfn) << PAGE_SHIFT;
     if ( is_pv_domain(d) && d->arch.pv.pcid )
         v->arch.cr3 |= get_pcid_bits(v, false);
+    if ( is_pv_domain(d) && d->arch.asi )
+        get_cpu_info()->new_cr3 = true;
 }
 
 void write_ptbase(struct vcpu *v)
@@ -532,6 +534,40 @@ void write_ptbase(struct vcpu *v)
             cpu_info->pv_cr3 |= get_pcid_bits(v, true);
         switch_cr3_cr4(v->arch.cr3, new_cr4);
     }
+    else if ( is_pv_domain(d) && d->arch.asi )
+    {
+        root_pgentry_t *root_pgt = this_cpu(root_pgt);
+        unsigned long cr3 = __pa(root_pgt);
+
+        /*
+         * XPTI and ASI cannot be simultaneously used even by different
+         * domains at runtime.
+         */
+        ASSERT(!cpu_info->use_pv_cr3 && !cpu_info->xen_cr3 &&
+               !cpu_info->pv_cr3);
+
+        if ( new_cr4 & X86_CR4_PCIDE )
+            cr3 |= get_pcid_bits(v, false);
+
+        /*
+         * Zap guest L4 entries ahead of flushing the TLB, so that the CPU
+         * cannot speculatively populate the TLB with stale mappings.
+         */
+        pv_clear_l4_guest_entries(root_pgt);
+
+        /*
+         * Switch to the shadow L4 with just the Xen slots populated, the guest
+         * slots will be populated by pv_update_shadow_l4() once running on the
+         * shadow L4.
+         *
+         * The reason for switching to the per-CPU shadow L4 before updating
+         * the guest slots is that pv_update_shadow_l4() uses per-CPU mappings,
+         * and the in-use page-table previous to the switch_cr3_cr4() call
+         * might not support per-CPU mappings.
+         */
+        switch_cr3_cr4(cr3, new_cr4);
+        pv_update_shadow_l4(v, false);
+    }
     else
     {
         ASSERT(!is_hvm_domain(d) || !d->arch.asi
@@ -6505,6 +6541,17 @@ void setup_perdomain_slot(const struct vcpu *v, root_pgentry_t *root_pgt)
 
         ASSERT(l3);
         populate_perdomain(d, root_pgt, l3);
+
+        if ( is_pv_domain(d) )
+        {
+            /*
+             * Abuse the fact that this function is called on vCPU context
+             * switch and clean previous guest controlled slots from the shadow
+             * L4.
+             */
+            pv_clear_l4_guest_entries(root_pgt);
+            get_cpu_info()->new_cr3 = true;
+        }
     }
     else if ( is_hvm_domain(d) || d->arch.pv.xpti )
         l4e_write(&root_pgt[root_table_offset(PERDOMAIN_VIRT_START)],
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index 46ee10a8a4c2..80bf2bf934dd 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -15,6 +15,7 @@
 #include <asm/invpcid.h>
 #include <asm/spec_ctrl.h>
 #include <asm/pv/domain.h>
+#include <asm/pv/mm.h>
 #include <asm/shadow.h>
 
 #ifdef CONFIG_PV32
@@ -384,7 +385,7 @@ int pv_domain_initialise(struct domain *d)
 
     d->arch.ctxt_switch = &pv_csw;
 
-    d->arch.pv.flush_root_pt = d->arch.pv.xpti;
+    d->arch.pv.flush_root_pt = d->arch.pv.xpti || d->arch.asi;
 
     if ( !is_pv_32bit_domain(d) && use_invpcid && cpu_has_pcid )
         switch ( ACCESS_ONCE(opt_pcid) )
@@ -446,7 +447,27 @@ static void _toggle_guest_pt(struct vcpu *v)
      * to release). Switch to the idle page tables in such an event; the
      * guest will have been crashed already.
      */
-    cr3 = v->arch.cr3;
+    if ( v->domain->arch.asi )
+    {
+        /*
+         * _toggle_guest_pt() might switch between user and kernel page tables,
+         * but doesn't use write_ptbase(), and hence needs an explicit call to
+         * sync the shadow L4.
+         */
+        cr3 = __pa(this_cpu(root_pgt));
+        if ( v->domain->arch.pv.pcid )
+            cr3 |= get_pcid_bits(v, false);
+        /*
+         * Ensure the current root page table is already the shadow L4, as
+         * guest user/kernel switches can only happen once the guest is
+         * running.
+         */
+        ASSERT(read_cr3() == cr3);
+        pv_update_shadow_l4(v, false);
+    }
+    else
+        cr3 = v->arch.cr3;
+
     if ( shadow_mode_enabled(v->domain) )
     {
         cr3 &= ~X86_CR3_NOFLUSH;
diff --git a/xen/arch/x86/pv/mm.c b/xen/arch/x86/pv/mm.c
index 24f0d2e4ff7d..c20ce099ae27 100644
--- a/xen/arch/x86/pv/mm.c
+++ b/xen/arch/x86/pv/mm.c
@@ -11,6 +11,7 @@
 #include <xen/guest_access.h>
 
 #include <asm/current.h>
+#include <asm/fixmap.h>
 #include <asm/p2m.h>
 
 #include "mm.h"
@@ -103,6 +104,57 @@ void init_xen_pae_l2_slots(l2_pgentry_t *l2t, const struct domain *d)
 }
 #endif
 
+void pv_clear_l4_guest_entries(root_pgentry_t *root_pgt)
+{
+    unsigned int i;
+
+    for ( i = 0; i < ROOT_PAGETABLE_FIRST_XEN_SLOT; i++ )
+        l4e_write(&root_pgt[i], l4e_empty());
+    for ( i = ROOT_PAGETABLE_LAST_XEN_SLOT + 1; i < L4_PAGETABLE_ENTRIES; i++ )
+        l4e_write(&root_pgt[i], l4e_empty());
+}
+
+void pv_update_shadow_l4(const struct vcpu *v, bool flush)
+{
+    const root_pgentry_t *guest_pgt = percpu_fix_to_virt(PCPU_FIX_PV_L4SHADOW);
+    root_pgentry_t *shadow_pgt = this_cpu(root_pgt);
+
+    ASSERT(!v->domain->arch.pv.xpti);
+    ASSERT(is_pv_vcpu(v));
+    ASSERT(!is_idle_vcpu(v));
+
+    if ( get_cpu_info()->new_cr3 )
+    {
+        percpu_set_fixmap(PCPU_FIX_PV_L4SHADOW, maddr_to_mfn(v->arch.cr3),
+                          __PAGE_HYPERVISOR_RO);
+        get_cpu_info()->new_cr3 = false;
+    }
+
+    if ( is_pv_32bit_vcpu(v) )
+    {
+        l4e_write(&shadow_pgt[0], guest_pgt[0]);
+        l4e_write(&shadow_pgt[root_table_offset(PERDOMAIN_ALT_VIRT_START)],
+            shadow_pgt[root_table_offset(PERDOMAIN_VIRT_START)]);
+    }
+    else
+    {
+        unsigned int i;
+
+        for ( i = 0; i < ROOT_PAGETABLE_FIRST_XEN_SLOT; i++ )
+            l4e_write(&shadow_pgt[i], guest_pgt[i]);
+        for ( i = ROOT_PAGETABLE_LAST_XEN_SLOT + 1;
+              i < L4_PAGETABLE_ENTRIES; i++ )
+            l4e_write(&shadow_pgt[i], guest_pgt[i]);
+
+        /* The presence of this Xen slot is selected by the guest. */
+        l4e_write(&shadow_pgt[l4_table_offset(RO_MPT_VIRT_START)],
+            guest_pgt[l4_table_offset(RO_MPT_VIRT_START)]);
+    }
+
+    if ( flush )
+        flush_local(FLUSH_TLB_GLOBAL);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 40cc14799252..d9841ed3b663 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -829,7 +829,7 @@ int setup_cpu_root_pgt(unsigned int cpu)
     unsigned int off;
     int rc;
 
-    if ( !opt_xpti_hwdom && !opt_xpti_domu )
+    if ( !opt_xpti_hwdom && !opt_xpti_domu && !opt_asi_pv )
         return 0;
 
     rpt = alloc_xenheap_page();
@@ -839,6 +839,18 @@ int setup_cpu_root_pgt(unsigned int cpu)
     clear_page(rpt);
     per_cpu(root_pgt, cpu) = rpt;
 
+    if ( opt_asi_pv )
+    {
+        /*
+         * Populate the Xen slots, the guest ones will be copied from the guest
+         * root page-table.
+         */
+        init_xen_l4_slots(rpt, _mfn(virt_to_mfn(rpt)), INVALID_MFN, NULL,
+                          false, false, true);
+
+        return 0;
+    }
+
     rpt[root_table_offset(RO_MPT_VIRT_START)] =
         idle_pg_table[root_table_offset(RO_MPT_VIRT_START)];
     /* SH_LINEAR_PT inserted together with guest mappings. */
@@ -892,6 +904,12 @@ static void cleanup_cpu_root_pgt(unsigned int cpu)
 
     per_cpu(root_pgt, cpu) = NULL;
 
+    if ( opt_asi_pv )
+    {
+        free_xenheap_page(rpt);
+        return;
+    }
+
     for ( r = root_table_offset(DIRECTMAP_VIRT_START);
           r < root_table_offset(HYPERVISOR_VIRT_END); ++r )
     {
-- 
2.45.2


