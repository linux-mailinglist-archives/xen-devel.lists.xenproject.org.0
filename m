Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEB0A05F30
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 15:44:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867435.1278961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVXIM-0000GZ-2h; Wed, 08 Jan 2025 14:44:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867435.1278961; Wed, 08 Jan 2025 14:44:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVXIL-0000De-Vs; Wed, 08 Jan 2025 14:44:29 +0000
Received: by outflank-mailman (input) for mailman id 867435;
 Wed, 08 Jan 2025 14:44:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2h7L=UA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tVX53-0006o2-Lc
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 14:30:45 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 245e167c-cdcd-11ef-a0df-8be0dac302b0;
 Wed, 08 Jan 2025 15:30:43 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-aa68b513abcso3092362766b.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 06:30:43 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0f06f942sm2506044666b.200.2025.01.08.06.30.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 06:30:41 -0800 (PST)
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
X-Inumbo-ID: 245e167c-cdcd-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736346642; x=1736951442; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qyS16XcyT27yuHUB4k53rewk8F6szSNyvboeI7a+Yts=;
        b=nnNvLh+QuoCnKt3E3GKYYAfCp4J95IgIQxR6S8jUa8bsZie3sx3EpL6IODer6P6gcS
         ktbU1FnGfZVdpordfi5wXmMRqMdHULWzirCdYMFRLZzscd4C7yZMcz6xQoleJjPoZPEe
         ECtWlkVCFIwvJZal07fFEhzWIxz75/dKkUWqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736346642; x=1736951442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qyS16XcyT27yuHUB4k53rewk8F6szSNyvboeI7a+Yts=;
        b=UU3uYMQ64CoepXSEHYwzEKAe0gMb/o9W9gHSEy+PGdPgztZ3EH5G5iZBB2/1SbhBkb
         AwGhCjs/DL71hS8/en+9o24g+yLAgMynh4IQqvsX0iBjghv0Km3D4tSH6eHt/i6fjoO0
         u+vICzVmIyv4K8nSXjU7o4gLNVSybJ2Ud39uL0luHa0CGjAlv+1ymFWmXPI8Diic/3iK
         SE1yI+RW+48zguD+twdlbxJI3PBkAydFTqOh8YnHYitUorBTLa/wNsazr/PVxxJVesHx
         aXc8xLgOco5apCObGangsXWJTwSPKsloN1h9mrU0+wgc1IOsE2/fQqZRk54RZ8hdUNz0
         U8Xg==
X-Gm-Message-State: AOJu0YyMPD+xNvNwKKjtClGYy86OUjWm5TVhWMye7jeC8s76nhG2IhgZ
	lO4SsQ34y5oYSq4dool/KbnYrmlQC8jmS1aqz7gufkYE8DB7yh6cs7FgNIZrnBejH6VDReiRwY7
	h
X-Gm-Gg: ASbGnctq2wVMgnTUvhvO+4tVFxTOvhyLM5AY/LiVTGMrk47OgJSMzIPxlTS3K4L9Ia5
	gyjz4/ieBPVV8ymZstogi+EdAHG6jF7bS0bJS/nF8f6l/SHubpp/UKwbLliGSVcEkDWf2CIbQhL
	gLZgGt3b6U7HQ0f32VjoCIVnpJwVD+UyECxfdnGT2XeJKrBI8YPhzdbxIJljRigy/9zQFwtHwX5
	rrTkDapqS+a8IqCKXnd0wU3aMvx4tI+fZlTrNE1JmyKlnXoeN/P+NV1S6KOhLPPhy4=
X-Google-Smtp-Source: AGHT+IGHBykV7yeqFfoOvN865Kl8vXTpUOINIzQjWxGFlzMEcE27CB842P7ClQ3IU5vdT/VikV9Mew==
X-Received: by 2002:a17:907:2cc5:b0:aaf:c326:f2d8 with SMTP id a640c23a62f3a-ab2abdc0257mr262042466b.57.1736346641877;
        Wed, 08 Jan 2025 06:30:41 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 16/18] x86/pv: allow using a unique per-pCPU root page table (L4)
Date: Wed,  8 Jan 2025 15:26:56 +0100
Message-ID: <20250108142659.99490-17-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250108142659.99490-1-roger.pau@citrix.com>
References: <20250108142659.99490-1-roger.pau@citrix.com>
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
 xen/arch/x86/flushtlb.c           | 22 +++++++++++++++++
 xen/arch/x86/include/asm/config.h |  6 +++++
 xen/arch/x86/include/asm/domain.h |  3 +++
 xen/arch/x86/include/asm/pv/mm.h  |  5 ++++
 xen/arch/x86/mm.c                 | 12 +++++++++-
 xen/arch/x86/mm/paging.c          |  6 +++++
 xen/arch/x86/pv/dom0_build.c      | 10 ++++++--
 xen/arch/x86/pv/domain.c          | 31 +++++++++++++++++++++++-
 xen/arch/x86/pv/mm.c              | 40 +++++++++++++++++++++++++++++++
 9 files changed, 131 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/flushtlb.c b/xen/arch/x86/flushtlb.c
index a64c28f854ea..72692b504dd4 100644
--- a/xen/arch/x86/flushtlb.c
+++ b/xen/arch/x86/flushtlb.c
@@ -17,6 +17,7 @@
 #include <asm/nops.h>
 #include <asm/page.h>
 #include <asm/pv/domain.h>
+#include <asm/pv/mm.h>
 #include <asm/spec_ctrl.h>
 
 /* Debug builds: Wrap frequently to stress-test the wrap logic. */
@@ -192,7 +193,28 @@ unsigned int flush_area_local(const void *va, unsigned int flags)
     unsigned int order = (flags - 1) & FLUSH_ORDER_MASK;
 
     if ( flags & FLUSH_ROOT_PGTBL )
+    {
         get_cpu_info()->root_pgt_changed = true;
+        /*
+         * Use opt_vcpu_pt_pv instead of current->arch.vcpu_pt to avoid doing a
+         * sync_local_execstate() when per-vCPU page-tables are not enabled for
+         * PV.
+         */
+        if ( opt_vcpu_pt_pv )
+        {
+            const struct vcpu *curr;
+            const struct domain *curr_d;
+
+            sync_local_execstate();
+
+            curr = current;
+            curr_d = curr->domain;
+
+            if ( is_pv_domain(curr_d) && curr_d->arch.vcpu_pt )
+                /* Update shadow root page-table ahead of doing TLB flush. */
+                pv_asi_update_shadow_l4(curr);
+        }
+    }
 
     if ( flags & (FLUSH_TLB|FLUSH_TLB_GLOBAL) )
     {
diff --git a/xen/arch/x86/include/asm/config.h b/xen/arch/x86/include/asm/config.h
index 19746f956ec3..af3ff3cb8705 100644
--- a/xen/arch/x86/include/asm/config.h
+++ b/xen/arch/x86/include/asm/config.h
@@ -265,6 +265,12 @@ extern unsigned long xen_phys_start;
 /* The address of a particular VCPU's GDT or LDT. */
 #define GDT_VIRT_START(v)    \
     (PERDOMAIN_VIRT_START + ((v)->vcpu_id << GDT_LDT_VCPU_VA_SHIFT))
+/*
+ * There are 2 GDT pages reserved for Xen, but only one is used.  Use the
+ * remaining one to map the guest L4 when running with ASI enabled.
+ */
+#define L4_SHADOW(v) \
+    (GDT_VIRT_START(v) + ((FIRST_RESERVED_GDT_PAGE + 1) << PAGE_SHIFT))
 #define LDT_VIRT_START(v)    \
     (GDT_VIRT_START(v) + (64*1024))
 
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index ba5440099d90..a3c75e323cde 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -591,6 +591,9 @@ struct pv_vcpu
     /* Deferred VA-based update state. */
     bool need_update_runstate_area;
     struct vcpu_time_info pending_system_time;
+
+    /* For ASI: page to use as L4 shadow of the guest selected L4. */
+    root_pgentry_t *root_pgt;
 };
 
 struct arch_vcpu
diff --git a/xen/arch/x86/include/asm/pv/mm.h b/xen/arch/x86/include/asm/pv/mm.h
index 182764542c1f..540202f9712a 100644
--- a/xen/arch/x86/include/asm/pv/mm.h
+++ b/xen/arch/x86/include/asm/pv/mm.h
@@ -23,6 +23,8 @@ bool pv_destroy_ldt(struct vcpu *v);
 
 int validate_segdesc_page(struct page_info *page);
 
+void pv_asi_update_shadow_l4(const struct vcpu *v);
+
 #else
 
 #include <xen/errno.h>
@@ -44,6 +46,9 @@ static inline bool pv_map_ldt_shadow_page(unsigned int off) { return false; }
 static inline bool pv_destroy_ldt(struct vcpu *v)
 { ASSERT_UNREACHABLE(); return false; }
 
+static inline void pv_asi_update_shadow_l4(const struct vcpu *v)
+{ ASSERT_UNREACHABLE(); }
+
 #endif
 
 #endif /* __X86_PV_MM_H__ */
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 583bf4c58bf9..3a637e508ff3 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -546,6 +546,8 @@ void write_ptbase(struct vcpu *v)
     }
     else
     {
+        if ( is_pv_domain(d) && d->arch.vcpu_pt )
+            pv_asi_update_shadow_l4(v);
         /* Make sure to clear use_pv_cr3 and xen_cr3 before pv_cr3. */
         cpu_info->use_pv_cr3 = false;
         cpu_info->xen_cr3 = 0;
@@ -565,6 +567,7 @@ void write_ptbase(struct vcpu *v)
  */
 pagetable_t update_cr3(struct vcpu *v)
 {
+    const struct domain *d = v->domain;
     mfn_t cr3_mfn;
 
     if ( paging_mode_enabled(v->domain) )
@@ -575,7 +578,14 @@ pagetable_t update_cr3(struct vcpu *v)
     else
         cr3_mfn = pagetable_get_mfn(v->arch.guest_table);
 
-    make_cr3(v, cr3_mfn);
+    make_cr3(v, d->arch.vcpu_pt ? virt_to_mfn(v->arch.pv.root_pgt) : cr3_mfn);
+
+    if ( d->arch.vcpu_pt )
+    {
+        populate_perdomain_mapping(v, L4_SHADOW(v), &cr3_mfn, 1);
+        if ( v == this_cpu(curr_vcpu) )
+            flush_tlb_one_local(L4_SHADOW(v));
+    }
 
     return pagetable_null();
 }
diff --git a/xen/arch/x86/mm/paging.c b/xen/arch/x86/mm/paging.c
index c77f4c1dac52..be30f21c1a7b 100644
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -695,6 +695,12 @@ int paging_domctl(struct domain *d, struct xen_domctl_shadow_op *sc,
         return -EINVAL;
     }
 
+    if ( is_pv_domain(d) && d->arch.vcpu_pt )
+    {
+        gprintk(XENLOG_ERR, "Paging not supported on PV domains with ASI\n");
+        return -EOPNOTSUPP;
+    }
+
     if ( resuming
          ? (d->arch.paging.preempt.dom != current->domain ||
             d->arch.paging.preempt.op != sc->op)
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 5081c19b9a9a..6c1d99a9bf0d 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -838,8 +838,11 @@ static int __init dom0_construct(struct boot_info *bi, struct domain *d)
 
     d->arch.paging.mode = 0;
 
-    /* Set up CR3 value for switch_cr3_cr4(). */
-    update_cr3(v);
+    /*
+     * Set up CR3 value for switch_cr3_cr4().  Use make_cr3() instead of
+     * update_cr3() to avoid using an ASI page-table for dom0 building.
+     */
+    make_cr3(v, pagetable_get_mfn(v->arch.guest_table));
 
     /* We run on dom0's page tables for the final part of the build process. */
     switch_cr3_cr4(cr3_pa(v->arch.cr3), read_cr4());
@@ -1068,6 +1071,9 @@ static int __init dom0_construct(struct boot_info *bi, struct domain *d)
     }
 #endif
 
+    /* Must be called in case ASI is enabled. */
+    update_cr3(v);
+
     v->is_initialised = 1;
     clear_bit(_VPF_down, &v->pause_flags);
 
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index 8d2428051607..583723c5d360 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -15,6 +15,7 @@
 #include <asm/invpcid.h>
 #include <asm/spec_ctrl.h>
 #include <asm/pv/domain.h>
+#include <asm/pv/mm.h>
 #include <asm/shadow.h>
 
 #ifdef CONFIG_PV32
@@ -296,6 +297,7 @@ void pv_vcpu_destroy(struct vcpu *v)
 
     pv_destroy_gdt_ldt_l1tab(v);
     XFREE(v->arch.pv.trap_ctxt);
+    FREE_XENHEAP_PAGE(v->arch.pv.root_pgt);
 }
 
 int pv_vcpu_initialise(struct vcpu *v)
@@ -336,6 +338,24 @@ int pv_vcpu_initialise(struct vcpu *v)
             goto done;
     }
 
+    if ( d->arch.vcpu_pt )
+    {
+        v->arch.pv.root_pgt = alloc_xenheap_page();
+        if ( !v->arch.pv.root_pgt )
+        {
+            rc = -ENOMEM;
+            goto done;
+        }
+
+        /*
+         * VM assists are not yet known, RO machine-to-phys slot will be copied
+         * from the guest L4.
+         */
+        init_xen_l4_slots(v->arch.pv.root_pgt,
+                          _mfn(virt_to_mfn(v->arch.pv.root_pgt)),
+                          v, INVALID_MFN, false);
+    }
+
  done:
     if ( rc )
         pv_vcpu_destroy(v);
@@ -368,7 +388,7 @@ int pv_domain_initialise(struct domain *d)
 
     d->arch.ctxt_switch = &pv_csw;
 
-    d->arch.pv.flush_root_pt = d->arch.pv.xpti;
+    d->arch.pv.flush_root_pt = d->arch.pv.xpti || d->arch.vcpu_pt;
 
     if ( !is_pv_32bit_domain(d) && use_invpcid && cpu_has_pcid )
         switch ( ACCESS_ONCE(opt_pcid) )
@@ -409,6 +429,7 @@ bool __init xpti_pcid_enabled(void)
 
 static void _toggle_guest_pt(struct vcpu *v)
 {
+    const struct domain *d = v->domain;
     bool guest_update;
     pagetable_t old_shadow;
     unsigned long cr3;
@@ -417,6 +438,14 @@ static void _toggle_guest_pt(struct vcpu *v)
     guest_update = v->arch.flags & TF_kernel_mode;
     old_shadow = update_cr3(v);
 
+    if ( d->arch.vcpu_pt )
+        /*
+         * _toggle_guest_pt() might switch between user and kernel page tables,
+         * but doesn't use write_ptbase(), and hence needs an explicit call to
+         * sync the shadow L4.
+         */
+        pv_asi_update_shadow_l4(v);
+
     /*
      * Don't flush user global mappings from the TLB. Don't tick TLB clock.
      *
diff --git a/xen/arch/x86/pv/mm.c b/xen/arch/x86/pv/mm.c
index 4853e619f2a7..46c437692bea 100644
--- a/xen/arch/x86/pv/mm.c
+++ b/xen/arch/x86/pv/mm.c
@@ -12,6 +12,7 @@
 
 #include <asm/current.h>
 #include <asm/p2m.h>
+#include <asm/pv/domain.h>
 
 #include "mm.h"
 
@@ -104,6 +105,45 @@ void init_xen_pae_l2_slots(l2_pgentry_t *l2t, const struct domain *d)
 }
 #endif
 
+void pv_asi_update_shadow_l4(const struct vcpu *v)
+{
+    const root_pgentry_t *guest_pgt;
+    root_pgentry_t *root_pgt = v->arch.pv.root_pgt;
+    const struct domain *d = v->domain;
+
+    ASSERT(!d->arch.pv.xpti);
+    ASSERT(is_pv_domain(d));
+    ASSERT(!is_idle_domain(d));
+    ASSERT(current == this_cpu(curr_vcpu));
+
+    if ( likely(v == current) )
+        guest_pgt = (void *)L4_SHADOW(v);
+    else if ( !(v->arch.flags & TF_kernel_mode) )
+        guest_pgt =
+            map_domain_page(pagetable_get_mfn(v->arch.guest_table_user));
+    else
+        guest_pgt = map_domain_page(pagetable_get_mfn(v->arch.guest_table));
+
+    if ( is_pv_64bit_domain(d) )
+    {
+        unsigned int i;
+
+        for ( i = 0; i < ROOT_PAGETABLE_FIRST_XEN_SLOT; i++ )
+            l4e_write(&root_pgt[i], guest_pgt[i]);
+        for ( i = ROOT_PAGETABLE_LAST_XEN_SLOT + 1;
+              i < L4_PAGETABLE_ENTRIES; i++ )
+            l4e_write(&root_pgt[i], guest_pgt[i]);
+
+        l4e_write(&root_pgt[l4_table_offset(RO_MPT_VIRT_START)],
+                  guest_pgt[l4_table_offset(RO_MPT_VIRT_START)]);
+    }
+    else
+        l4e_write(&root_pgt[0], guest_pgt[0]);
+
+    if ( v != this_cpu(curr_vcpu) )
+        unmap_domain_page(guest_pgt);
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.46.0


