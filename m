Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2635A05FE6
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 16:19:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867480.1279016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVXpq-0000CI-GX; Wed, 08 Jan 2025 15:19:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867480.1279016; Wed, 08 Jan 2025 15:19:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVXpq-00009y-DN; Wed, 08 Jan 2025 15:19:06 +0000
Received: by outflank-mailman (input) for mailman id 867480;
 Wed, 08 Jan 2025 15:19:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HyFE=UA=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tVXpo-0008Ue-QQ
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 15:19:04 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4744bb5-cdd3-11ef-99a4-01e77a169b0f;
 Wed, 08 Jan 2025 16:19:02 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-aaec61d0f65so285320266b.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 07:19:02 -0800 (PST)
Received: from localhost.localdomain ([66.81.170.107])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0eae71desm2488412166b.89.2025.01.08.07.19.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 07:19:01 -0800 (PST)
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
X-Inumbo-ID: e4744bb5-cdd3-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736349542; x=1736954342; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XjrHpoafwPytgBLLE9UWiWZhowYUy5r4Ft9RDVMVLUE=;
        b=BsK/awXxL3rqIgDMLE74aaE63ujSQ2fhVdgh/kWRIynhd6ZsrLfipJqNuF49i4mcA/
         h5RQKPKH2e4t5hRYQAHXTvUfK/tND+84iil7xP0SPoYH8dT983wZU2O5gZulYbvpORwO
         2sUUzPge1ahR8V34KGNIMNvD/72Ntc6/jZvG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736349542; x=1736954342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XjrHpoafwPytgBLLE9UWiWZhowYUy5r4Ft9RDVMVLUE=;
        b=TnLdQ3GsSmzH2pWP7mFdaX6I+fpr1/MO0MZxNLRw79F33Crhnjp0evIT0gGQPy7p5A
         jd8Uhi4GFecFpBr5T1mBgQE2vpFipaTf+ESwVRUgt7djyjvAt2FSc/BtSii4WbQlNYqF
         LR4OpgHiSY6mW8y6GHmEoPSOWRJGwwsf0N6OFPSgR3psln6J8+oKt3XTOrEV697zl2ET
         DOyCiPc0pAQk8dlZ0Mc4FjQTixK1oOeLquJLgBwLVVslsISEDgXZyn2e4Xsl5nCemY07
         2c5EdcY6IR7dBjqSrW9a6ajPzuEa74tYS4E1TFMFM7nGLmZ5S8Me6lgz0QryUrtkW4j1
         yOfg==
X-Gm-Message-State: AOJu0YyfeUFCI2EeQ7dktdc9agOInHY8pvHe1L6R4DXMN4KeJ+Xb9WBA
	h6X8nf2eCJ1MU8RCKzk9crPLvv4TzWKcCtN+pvRi8cFjr+XmS6YAJUDOw2+hRQgcmHiG3b00nr9
	Cyq2UQQ==
X-Gm-Gg: ASbGncs+SRfjSGY6gz+F/sVqefvmLVaDoOtvT2pRix9wxyTHMcZVOHl0wm/s3BQkaHc
	zdZ4Jr87a4USk/Ch2BCWtAhOhhxqus27twt2DhsWWJkxg67KQm8LgZ97eUq8PfjXDW21pSTslmt
	Lt34SdnGe3vyEwAxacNmDekmI2Bslo5zcEcMe240AEUKZQK7/iP2GNCzj0n83NX9VAkNZ0jHTFk
	Gp5CQsC3aUHm4VDb5gsCKkfI5g4mhA77zBYOMCXSEM+1IMDGUnutXnEfJRPPIT05yukR/cW4z2l
	5zw=
X-Google-Smtp-Source: AGHT+IFy2qJHO7J67PwIOe0KP7iXXVioCmlPY6UKUmkZiRaVm0XX4FKWhIb/MWinoqrJ0CU6MUY5UA==
X-Received: by 2002:a17:907:1c93:b0:aa6:894c:84b9 with SMTP id a640c23a62f3a-ab2ab6a4da6mr267067066b.23.1736349541822;
        Wed, 08 Jan 2025 07:19:01 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Hongyan Xia <hongyxia@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julien Grall <jgrall@amazon.com>,
	Elias El Yandouzi <eliasely@amazon.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: [PATCH v5 01/15] x86: Create per-domain mapping for guest_root_pt
Date: Wed,  8 Jan 2025 15:18:08 +0000
Message-ID: <20250108151822.16030-2-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108151822.16030-1-alejandro.vallejo@cloud.com>
References: <20250108151822.16030-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hongyan Xia <hongyxia@amazon.com>

This patch introduces a per-domain mapping for the `guest_root_pt` in PV
guests as part of the effort to remove the direct map in Xen.

For the time being, the `root_pgt` is not mapped or unmapped, as it
remains
a Xenheap page. This will be addressed in subsequent patches.

Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>
Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v4->v5:
  * bugfix: s/FREE_XENHEAP_PAGE/XFREE/ on destroying root_pt_l1tab.
  * Add a few extra comments to the declarations for sanity's sake.
  * Refactor pv_root_pt macro to use L1_PAGETABLE_ENTRIES instead.
  * Removed extra newline in pv_destory_root_pt_l1tab()

v3->v4:
  * Fix over-allocation issue
  * Update the mappings when switching from kernel to user-mode

v2->v3:
  * Rename SHADOW_ROOT
  * Haven't addressed the potentially over-allocation issue as I don't
get it

v1->v2:
  * Rework the shadow perdomain mapping solution in the follow-up
patches

Changes since Hongyan's version:
  * Remove the final dot in the commit title

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/arch/x86/include/asm/config.h | 10 ++++++-
 xen/arch/x86/include/asm/domain.h |  3 +++
 xen/arch/x86/mm.c                 | 13 +++++++++
 xen/arch/x86/pv/domain.c          | 44 ++++++++++++++++++++++++++++---
 xen/arch/x86/x86_64/asm-offsets.c |  1 +
 xen/arch/x86/x86_64/entry.S       |  9 ++++++-
 6 files changed, 74 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/include/asm/config.h b/xen/arch/x86/include/asm/config.h
index 19746f956ec3..42c8a120e7dc 100644
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
@@ -282,6 +282,14 @@ extern unsigned long xen_phys_start;
 #define ARG_XLAT_START(v)        \
     (ARG_XLAT_VIRT_START + ((v)->vcpu_id << ARG_XLAT_VA_SHIFT))
 
+/* pv_root_pt mapping area. The fourth per-domain-mapping sub-area */
+#define PV_ROOT_PT_MAPPING_VIRT_START   PERDOMAIN_VIRT_SLOT(3)
+#define PV_ROOT_PT_MAPPING_ENTRIES      MAX_VIRT_CPUS
+
+/* The address of a particular VCPU's PV_ROOT_PT */
+#define PV_ROOT_PT_MAPPING_VCPU_VIRT_START(v) \
+    (PV_ROOT_PT_MAPPING_VIRT_START + ((v)->vcpu_id * PAGE_SIZE))
+
 #define ELFSIZE 64
 
 #define ARCH_CRASH_SAVE_VMCOREINFO
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index b79d6badd71c..b5a14991ca0b 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -273,6 +273,9 @@ struct pv_domain
 {
     l1_pgentry_t **gdt_ldt_l1tab;
 
+    /* Array of pointers to the l1 PTs holding PV root PTs of each vCPU */
+    l1_pgentry_t **root_pt_l1tab;
+
     atomic_t nr_l4_pages;
 
     /* Is a 32-bit PV guest? */
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index fa21903eb25a..adcc0b5ff328 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -527,6 +527,14 @@ void make_cr3(struct vcpu *v, mfn_t mfn)
         v->arch.cr3 |= get_pcid_bits(v, false);
 }
 
+/* Index of the l1 PT that maps v's root PT */
+#define pv_root_pt_idx(v) ((v)->vcpu_id / L1_PAGETABLE_ENTRIES)
+
+/* Pointer to the PTE that maps v's root PT in the perdomain area */
+#define pv_root_pt_pte(v) \
+    ((v)->domain->arch.pv.root_pt_l1tab[pv_root_pt_idx(v)] + \
+     ((v)->vcpu_id & (L1_PAGETABLE_ENTRIES - 1)))
+
 void write_ptbase(struct vcpu *v)
 {
     const struct domain *d = v->domain;
@@ -538,11 +546,16 @@ void write_ptbase(struct vcpu *v)
 
     if ( is_pv_domain(d) && d->arch.pv.xpti )
     {
+        mfn_t guest_root_pt = _mfn(MASK_EXTR(v->arch.cr3, X86_CR3_ADDR_MASK));
+        l1_pgentry_t *pte = pv_root_pt_pte(v);
+
         cpu_info->root_pgt_changed = true;
         cpu_info->pv_cr3 = __pa(this_cpu(root_pgt));
         if ( new_cr4 & X86_CR4_PCIDE )
             cpu_info->pv_cr3 |= get_pcid_bits(v, true);
         switch_cr3_cr4(v->arch.cr3, new_cr4);
+
+        l1e_write(pte, l1e_from_mfn(guest_root_pt, __PAGE_HYPERVISOR_RO));
     }
     else
     {
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index 7aef628f55be..4b85a02d910e 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -289,6 +289,20 @@ static void pv_destroy_gdt_ldt_l1tab(struct vcpu *v)
                               1U << GDT_LDT_VCPU_SHIFT);
 }
 
+static int pv_create_root_pt_l1tab(const struct vcpu *v)
+{
+    return create_perdomain_mapping(v->domain,
+                                    PV_ROOT_PT_MAPPING_VCPU_VIRT_START(v),
+                                    1, v->domain->arch.pv.root_pt_l1tab,
+                                    NULL);
+}
+
+static void pv_destroy_root_pt_l1tab(const struct vcpu *v)
+{
+    destroy_perdomain_mapping(v->domain,
+                              PV_ROOT_PT_MAPPING_VCPU_VIRT_START(v), 1);
+}
+
 void pv_vcpu_destroy(struct vcpu *v)
 {
     if ( is_pv_32bit_vcpu(v) )
@@ -298,6 +312,7 @@ void pv_vcpu_destroy(struct vcpu *v)
     }
 
     pv_destroy_gdt_ldt_l1tab(v);
+    pv_destroy_root_pt_l1tab(v);
     XFREE(v->arch.pv.trap_ctxt);
 }
 
@@ -312,6 +327,13 @@ int pv_vcpu_initialise(struct vcpu *v)
     if ( rc )
         return rc;
 
+    if ( v->domain->arch.pv.xpti )
+    {
+        rc = pv_create_root_pt_l1tab(v);
+        if ( rc )
+            goto done;
+    }
+
     BUILD_BUG_ON(X86_NR_VECTORS * sizeof(*v->arch.pv.trap_ctxt) >
                  PAGE_SIZE);
     v->arch.pv.trap_ctxt = xzalloc_array(struct trap_info, X86_NR_VECTORS);
@@ -347,10 +369,12 @@ void pv_domain_destroy(struct domain *d)
 
     destroy_perdomain_mapping(d, GDT_LDT_VIRT_START,
                               GDT_LDT_MBYTES << (20 - PAGE_SHIFT));
+    destroy_perdomain_mapping(d, PV_ROOT_PT_MAPPING_VIRT_START, d->max_vcpus);
 
     XFREE(d->arch.pv.cpuidmasks);
 
     FREE_XENHEAP_PAGE(d->arch.pv.gdt_ldt_l1tab);
+    XFREE(d->arch.pv.root_pt_l1tab);
 }
 
 void noreturn cf_check continue_pv_domain(void);
@@ -376,8 +400,22 @@ int pv_domain_initialise(struct domain *d)
          (d->arch.pv.cpuidmasks = xmemdup(&cpuidmask_defaults)) == NULL )
         goto fail;
 
+    rc = create_perdomain_mapping(d, PV_ROOT_PT_MAPPING_VIRT_START,
+                                  d->max_vcpus, NULL, NULL);
+    if ( rc )
+        goto fail;
+
     d->arch.ctxt_switch = &pv_csw;
 
+    if ( d->arch.pv.xpti )
+    {
+        d->arch.pv.root_pt_l1tab =
+            xzalloc_array(l1_pgentry_t *,
+                          DIV_ROUND_UP(d->max_vcpus, L1_PAGETABLE_ENTRIES));
+        if ( !d->arch.pv.root_pt_l1tab )
+            goto fail;
+    }
+
     if ( !is_pv_32bit_domain(d) && use_invpcid && cpu_has_pcid )
         switch ( ACCESS_ONCE(opt_pcid) )
         {
@@ -451,7 +489,8 @@ static void _toggle_guest_pt(struct vcpu *v)
             guest_update = false;
         }
     }
-    write_cr3(cr3);
+
+    write_ptbase(v);
 
     if ( !pagetable_is_null(old_shadow) )
         shadow_put_top_level(v->domain, old_shadow);
@@ -491,9 +530,6 @@ void toggle_guest_mode(struct vcpu *v)
     {
         struct cpu_info *cpu_info = get_cpu_info();
 
-        cpu_info->root_pgt_changed = true;
-        cpu_info->pv_cr3 = __pa(this_cpu(root_pgt)) |
-                           (d->arch.pv.pcid ? get_pcid_bits(v, true) : 0);
         /*
          * As in _toggle_guest_pt() the XPTI CR3 write needs to be a TLB-
          * flushing one too for shadow mode guests.
diff --git a/xen/arch/x86/x86_64/asm-offsets.c b/xen/arch/x86/x86_64/asm-offsets.c
index 630bdc39451d..c1ae5013af96 100644
--- a/xen/arch/x86/x86_64/asm-offsets.c
+++ b/xen/arch/x86/x86_64/asm-offsets.c
@@ -80,6 +80,7 @@ void __dummy__(void)
 
 #undef OFFSET_EF
 
+    OFFSET(VCPU_id, struct vcpu, vcpu_id);
     OFFSET(VCPU_processor, struct vcpu, processor);
     OFFSET(VCPU_domain, struct vcpu, domain);
     OFFSET(VCPU_vcpu_info, struct vcpu, vcpu_info_area.map);
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index 40d094d5b2ee..4de41ce743c7 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -170,9 +170,16 @@ FUNC_LOCAL(restore_all_guest)
         movabs $PADDR_MASK & PAGE_MASK, %rsi
         movabs $DIRECTMAP_VIRT_START, %rcx
         and   %rsi, %rdi
-        and   %r9, %rsi
         add   %rcx, %rdi
+
+        /*
+         * The address in the vCPU cr3 is always mapped in the per-domain
+         * pv_root_pt virt area.
+         */
+        imul  $PAGE_SIZE, VCPU_id(%rbx), %esi
+        movabs $PV_ROOT_PT_MAPPING_VIRT_START, %rcx
         add   %rcx, %rsi
+
         mov   $ROOT_PAGETABLE_FIRST_XEN_SLOT, %ecx
         mov   root_table_offset(SH_LINEAR_PT_VIRT_START)*8(%rsi), %r8
         mov   %r8, root_table_offset(SH_LINEAR_PT_VIRT_START)*8(%rdi)
-- 
2.47.1


