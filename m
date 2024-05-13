Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 028618C4223
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2024 15:41:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720923.1123965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6VvJ-000345-1a; Mon, 13 May 2024 13:41:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720923.1123965; Mon, 13 May 2024 13:41:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6VvI-00031G-VE; Mon, 13 May 2024 13:41:00 +0000
Received: by outflank-mailman (input) for mailman id 720923;
 Mon, 13 May 2024 13:40:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w2Lj=MQ=amazon.co.uk=prvs=8568adbc3=eliasely@srs-se1.protection.inumbo.net>)
 id 1s6VvH-0002zP-RM
 for xen-devel@lists.xenproject.org; Mon, 13 May 2024 13:40:59 +0000
Received: from smtp-fw-52003.amazon.com (smtp-fw-52003.amazon.com
 [52.119.213.152]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d7b0301-112e-11ef-909d-e314d9c70b13;
 Mon, 13 May 2024 15:40:58 +0200 (CEST)
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.43.8.6])
 by smtp-border-fw-52003.iad7.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 13:40:56 +0000
Received: from EX19MTAUEA001.ant.amazon.com [10.0.29.78:58017]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.49.39:2525]
 with esmtp (Farcaster)
 id 021f1184-37dc-40b2-97a9-0457a47e1b12; Mon, 13 May 2024 13:40:55 +0000 (UTC)
Received: from EX19D008UEA001.ant.amazon.com (10.252.134.62) by
 EX19MTAUEA001.ant.amazon.com (10.252.134.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 13 May 2024 13:40:53 +0000
Received: from EX19MTAUWB001.ant.amazon.com (10.250.64.248) by
 EX19D008UEA001.ant.amazon.com (10.252.134.62) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 13 May 2024 13:40:53 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (10.253.91.118) by mail-relay.amazon.com (10.250.64.254) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28 via Frontend Transport; Mon, 13 May 2024 13:40:51 +0000
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
X-Inumbo-ID: 6d7b0301-112e-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1715607658; x=1747143658;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=l8CclplVrvwG16aVcnUczikHaxmRbby77xL0adFNfQA=;
  b=Qn190890JYvm4NbMVdH1dkWMFmj/Z1WGQ0VItQa6o2saT/EaZGAbZDcj
   IwbHS0FbdHQapKs5/MTOsxplqF0ZamxTW9C35L/FmW987CjnxtQlMIqYO
   m4zVh4VgXz5b3zRphzaRzNZvucQtmd4CGh8tlO7f8hBQui1fDAMBpRJD3
   8=;
X-IronPort-AV: E=Sophos;i="6.08,158,1712620800"; 
   d="scan'208";a="658309119"
X-Farcaster-Flow-ID: 021f1184-37dc-40b2-97a9-0457a47e1b12
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Hongyan Xia
	<hongyxia@amazon.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Julien Grall <jgrall@amazon.com>, Elias El Yandouzi
	<eliasely@amazon.com>
Subject: [PATCH V3 (resend) 01/19] x86: Create per-domain mapping of guest_root_pt
Date: Mon, 13 May 2024 13:40:28 +0000
Message-ID: <20240513134046.82605-2-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240513134046.82605-1-eliasely@amazon.com>
References: <20240513134046.82605-1-eliasely@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Hongyan Xia <hongyxia@amazon.com>

Create a per-domain mapping of PV guest_root_pt as direct map is being
removed.

Note that we do not map and unmap root_pgt for now since it is still a
xenheap page.

Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>

----
    Changes in V3:
        * Rename SHADOW_ROOT
        * Haven't addressed the potentially over-allocation issue as I don't get it

    Changes in V2:
        * Rework the shadow perdomain mapping solution in the follow-up patches

    Changes since Hongyan's version:
        * Remove the final dot in the commit title

diff --git a/xen/arch/x86/include/asm/config.h b/xen/arch/x86/include/asm/config.h
index ab7288cb36..5d710384df 100644
--- a/xen/arch/x86/include/asm/config.h
+++ b/xen/arch/x86/include/asm/config.h
@@ -203,7 +203,7 @@ extern unsigned char boot_edid_info[128];
 /* Slot 260: per-domain mappings (including map cache). */
 #define PERDOMAIN_VIRT_START    (PML4_ADDR(260))
 #define PERDOMAIN_SLOT_MBYTES   (PML4_ENTRY_BYTES >> (20 + PAGETABLE_ORDER))
-#define PERDOMAIN_SLOTS         3
+#define PERDOMAIN_SLOTS         4
 #define PERDOMAIN_VIRT_SLOT(s)  (PERDOMAIN_VIRT_START + (s) * \
                                  (PERDOMAIN_SLOT_MBYTES << 20))
 /* Slot 4: mirror of per-domain mappings (for compat xlat area accesses). */
@@ -317,6 +317,14 @@ extern unsigned long xen_phys_start;
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
index f5daeb182b..8a97530607 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -272,6 +272,7 @@ struct time_scale {
 struct pv_domain
 {
     l1_pgentry_t **gdt_ldt_l1tab;
+    l1_pgentry_t **root_pt_l1tab;
 
     atomic_t nr_l4_pages;
 
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index d968bbbc73..efdf20f775 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -505,6 +505,13 @@ void share_xen_page_with_guest(struct page_info *page, struct domain *d,
     nrspin_unlock(&d->page_alloc_lock);
 }
 
+#define pv_root_pt_idx(v) \
+    ((v)->vcpu_id >> PAGETABLE_ORDER)
+
+#define pv_root_pt_pte(v) \
+    ((v)->domain->arch.pv.root_pt_l1tab[pv_root_pt_idx(v)] + \
+     ((v)->vcpu_id & (L1_PAGETABLE_ENTRIES - 1)))
+
 void make_cr3(struct vcpu *v, mfn_t mfn)
 {
     struct domain *d = v->domain;
@@ -524,6 +531,13 @@ void write_ptbase(struct vcpu *v)
 
     if ( is_pv_vcpu(v) && v->domain->arch.pv.xpti )
     {
+        mfn_t guest_root_pt = _mfn(MASK_EXTR(v->arch.cr3, PAGE_MASK));
+        l1_pgentry_t *pte = pv_root_pt_pte(v);
+
+        ASSERT(v == current);
+
+        l1e_write(pte, l1e_from_mfn(guest_root_pt, __PAGE_HYPERVISOR_RO));
+
         cpu_info->root_pgt_changed = true;
         cpu_info->pv_cr3 = __pa(this_cpu(root_pgt));
         if ( new_cr4 & X86_CR4_PCIDE )
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index 2a445bb17b..1b025986f7 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -288,6 +288,21 @@ static void pv_destroy_gdt_ldt_l1tab(struct vcpu *v)
                               1U << GDT_LDT_VCPU_SHIFT);
 }
 
+static int pv_create_root_pt_l1tab(struct vcpu *v)
+{
+    return create_perdomain_mapping(v->domain,
+                                    PV_ROOT_PT_MAPPING_VCPU_VIRT_START(v),
+                                    1, v->domain->arch.pv.root_pt_l1tab,
+                                    NULL);
+}
+
+static void pv_destroy_root_pt_l1tab(struct vcpu *v)
+
+{
+    destroy_perdomain_mapping(v->domain,
+                              PV_ROOT_PT_MAPPING_VCPU_VIRT_START(v), 1);
+}
+
 void pv_vcpu_destroy(struct vcpu *v)
 {
     if ( is_pv_32bit_vcpu(v) )
@@ -297,6 +312,7 @@ void pv_vcpu_destroy(struct vcpu *v)
     }
 
     pv_destroy_gdt_ldt_l1tab(v);
+    pv_destroy_root_pt_l1tab(v);
     XFREE(v->arch.pv.trap_ctxt);
 }
 
@@ -311,6 +327,13 @@ int pv_vcpu_initialise(struct vcpu *v)
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
@@ -346,10 +369,12 @@ void pv_domain_destroy(struct domain *d)
 
     destroy_perdomain_mapping(d, GDT_LDT_VIRT_START,
                               GDT_LDT_MBYTES << (20 - PAGE_SHIFT));
+    destroy_perdomain_mapping(d, PV_ROOT_PT_MAPPING_VIRT_START, PV_ROOT_PT_MAPPING_ENTRIES);
 
     XFREE(d->arch.pv.cpuidmasks);
 
     FREE_XENHEAP_PAGE(d->arch.pv.gdt_ldt_l1tab);
+    FREE_XENHEAP_PAGE(d->arch.pv.root_pt_l1tab);
 }
 
 void noreturn cf_check continue_pv_domain(void);
@@ -371,6 +396,12 @@ int pv_domain_initialise(struct domain *d)
         goto fail;
     clear_page(d->arch.pv.gdt_ldt_l1tab);
 
+    d->arch.pv.root_pt_l1tab =
+        alloc_xenheap_pages(0, MEMF_node(domain_to_node(d)));
+    if ( !d->arch.pv.root_pt_l1tab )
+        goto fail;
+    clear_page(d->arch.pv.root_pt_l1tab);
+
     if ( levelling_caps & ~LCAP_faulting &&
          (d->arch.pv.cpuidmasks = xmemdup(&cpuidmask_defaults)) == NULL )
         goto fail;
@@ -381,6 +412,11 @@ int pv_domain_initialise(struct domain *d)
     if ( rc )
         goto fail;
 
+    rc = create_perdomain_mapping(d, PV_ROOT_PT_MAPPING_VIRT_START,
+                                  PV_ROOT_PT_MAPPING_ENTRIES, NULL, NULL);
+    if ( rc )
+        goto fail;
+
     d->arch.ctxt_switch = &pv_csw;
 
     d->arch.pv.xpti = is_hardware_domain(d) ? opt_xpti_hwdom : opt_xpti_domu;
diff --git a/xen/arch/x86/x86_64/asm-offsets.c b/xen/arch/x86/x86_64/asm-offsets.c
index 630bdc3945..c1ae5013af 100644
--- a/xen/arch/x86/x86_64/asm-offsets.c
+++ b/xen/arch/x86/x86_64/asm-offsets.c
@@ -80,6 +80,7 @@ void __dummy__(void)
 
 #undef OFFSET_EF
 
+    OFFSET(VCPU_id, struct vcpu, vcpu_id);
     OFFSET(VCPU_processor, struct vcpu, processor);
     OFFSET(VCPU_domain, struct vcpu, domain);
     OFFSET(VCPU_vcpu_info, struct vcpu, vcpu_info_area.map);
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index df015589ce..c1377da7a5 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -162,7 +162,15 @@ FUNC_LOCAL(restore_all_guest)
         and   %rsi, %rdi
         and   %r9, %rsi
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
2.40.1


