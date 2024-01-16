Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D39F782F549
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 20:26:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668080.1039985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPp4z-0003dM-P7; Tue, 16 Jan 2024 19:26:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668080.1039985; Tue, 16 Jan 2024 19:26:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPp4z-0003at-JF; Tue, 16 Jan 2024 19:26:33 +0000
Received: by outflank-mailman (input) for mailman id 668080;
 Tue, 16 Jan 2024 19:26:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wmx9=I2=amazon.co.uk=prvs=738631f0b=eliasely@srs-se1.protection.inumbo.net>)
 id 1rPp4y-0003Xv-2o
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 19:26:32 +0000
Received: from smtp-fw-52004.amazon.com (smtp-fw-52004.amazon.com
 [52.119.213.154]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26299e47-b4a5-11ee-98f1-6d05b1d4d9a1;
 Tue, 16 Jan 2024 20:26:30 +0100 (CET)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-pdx-2b-m6i4x-7fa2de02.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-52004.iad7.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 19:26:28 +0000
Received: from smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev
 (pdx2-ws-svc-p26-lb5-vlan2.pdx.amazon.com [10.39.38.66])
 by email-inbound-relay-pdx-2b-m6i4x-7fa2de02.us-west-2.amazon.com (Postfix)
 with ESMTPS id EBE47410A5; Tue, 16 Jan 2024 19:26:26 +0000 (UTC)
Received: from EX19MTAUEA001.ant.amazon.com [10.0.29.78:2602]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.57.22:2525]
 with esmtp (Farcaster)
 id e792b96e-ad88-4b4f-ac4b-041a01b78128; Tue, 16 Jan 2024 19:26:26 +0000 (UTC)
Received: from EX19D008UEA004.ant.amazon.com (10.252.134.191) by
 EX19MTAUEA001.ant.amazon.com (10.252.134.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 19:26:24 +0000
Received: from EX19MTAUEB001.ant.amazon.com (10.252.135.35) by
 EX19D008UEA004.ant.amazon.com (10.252.134.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 19:26:24 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (10.253.91.118) by mail-relay.amazon.com (10.252.135.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Tue, 16 Jan 2024 19:26:23 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 26299e47-b4a5-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1705433191; x=1736969191;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RlZPoKBPtPftpmhS8npiHVFZDFdnG1+rb/ajeW5MDFo=;
  b=D9OVH2+o8lgOUCuFIlqUB2ZmF5cKOn+zgZgdQvM5AWJvm/t+q+4Kthkv
   o6c+voUgcCF3gX+vLaq25om9RCZLSDATRdqN6v3QgaCxpreAuaK1Xj3un
   hk9oMxehNH1e3iQwNmX45rlEq4QaDR3L4/mUjMe/6bG5vzsBA4GUl5mO+
   Q=;
X-IronPort-AV: E=Sophos;i="6.05,200,1701129600"; 
   d="scan'208";a="178399454"
X-Farcaster-Flow-ID: e792b96e-ad88-4b4f-ac4b-041a01b78128
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Hongyan Xia
	<hongyxia@amazon.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Julien Grall
	<jgrall@amazon.com>, Elias El Yandouzi <eliasely@amazon.com>
Subject: [PATCH v2 (resend) 07/27] x86: Map/unmap pages in restore_all_guests
Date: Tue, 16 Jan 2024 19:25:51 +0000
Message-ID: <20240116192611.41112-8-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240116192611.41112-1-eliasely@amazon.com>
References: <20240116192611.41112-1-eliasely@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: Bulk

From: Hongyan Xia <hongyxia@amazon.com>

Before, it assumed the pv cr3 could be accessed via a direct map. This
is no longer true.

Note that we do not map and unmap root_pgt for now since it is still a
xenheap page.

Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>

----

    Changes in V2:
        * Rework the shadow perdomain mapping solution in the follow-up patches

    Changes since Hongyan's version:
        * Remove the final dot in the commit title

diff --git a/xen/arch/x86/include/asm/config.h b/xen/arch/x86/include/asm/config.h
index bbced338be..7cf1f33dc0 100644
--- a/xen/arch/x86/include/asm/config.h
+++ b/xen/arch/x86/include/asm/config.h
@@ -202,7 +202,7 @@ extern unsigned char boot_edid_info[128];
 /* Slot 260: per-domain mappings (including map cache). */
 #define PERDOMAIN_VIRT_START    (PML4_ADDR(260))
 #define PERDOMAIN_SLOT_MBYTES   (PML4_ENTRY_BYTES >> (20 + PAGETABLE_ORDER))
-#define PERDOMAIN_SLOTS         3
+#define PERDOMAIN_SLOTS         4
 #define PERDOMAIN_VIRT_SLOT(s)  (PERDOMAIN_VIRT_START + (s) * \
                                  (PERDOMAIN_SLOT_MBYTES << 20))
 /* Slot 4: mirror of per-domain mappings (for compat xlat area accesses). */
@@ -316,6 +316,16 @@ extern unsigned long xen_phys_start;
 #define ARG_XLAT_START(v)        \
     (ARG_XLAT_VIRT_START + ((v)->vcpu_id << ARG_XLAT_VA_SHIFT))
 
+/* root_pt shadow mapping area. The fourth per-domain-mapping sub-area */
+#define SHADOW_ROOT_PT_VIRT_START   PERDOMAIN_VIRT_SLOT(3)
+#define SHADOW_ROOT_PT_ENTRIES      MAX_VIRT_CPUS
+#define SHADOW_ROOT_PT_VIRT_END     (SHADOW_ROOT_PT_VIRT_START +    \
+                                     (SHADOW_ROOT_PT_ENTRIES * PAGE_SIZE))
+
+/* The address of a particular VCPU's ROOT_PT */
+#define SHADOW_ROOT_PT_VCPU_VIRT_START(v) \
+    (SHADOW_ROOT_PT_VIRT_START + ((v)->vcpu_id * PAGE_SIZE))
+
 #define ELFSIZE 64
 
 #define ARCH_CRASH_SAVE_VMCOREINFO
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 622d22bef2..4d97c68028 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -273,6 +273,7 @@ struct time_scale {
 struct pv_domain
 {
     l1_pgentry_t **gdt_ldt_l1tab;
+    l1_pgentry_t **shadow_root_pt_l1tab;
 
     atomic_t nr_l4_pages;
 
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index b56e0d8065..a72c32d87c 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -505,6 +505,13 @@ void share_xen_page_with_guest(struct page_info *page, struct domain *d,
     spin_unlock(&d->page_alloc_lock);
 }
 
+#define shadow_root_pt_idx(v) \
+    ((v)->vcpu_id >> PAGETABLE_ORDER)
+
+#define pv_shadow_root_pt_pte(v) \
+    ((v)->domain->arch.pv.shadow_root_pt_l1tab[shadow_root_pt_idx(v)] + \
+     ((v)->vcpu_id & (L1_PAGETABLE_ENTRIES - 1)))
+
 void make_cr3(struct vcpu *v, mfn_t mfn)
 {
     struct domain *d = v->domain;
@@ -524,6 +531,13 @@ void write_ptbase(struct vcpu *v)
 
     if ( is_pv_vcpu(v) && v->domain->arch.pv.xpti )
     {
+        mfn_t guest_root_pt = _mfn(v->arch.cr3 >> PAGE_SHIFT);
+        l1_pgentry_t *pte = pv_shadow_root_pt_pte(v);
+
+        ASSERT(v == current);
+
+        l1e_write(pte, l1e_from_mfn(guest_root_pt, __PAGE_HYPERVISOR_RW));
+
         cpu_info->root_pgt_changed = true;
         cpu_info->pv_cr3 = __pa(this_cpu(root_pgt));
         if ( new_cr4 & X86_CR4_PCIDE )
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index 2a445bb17b..fef9ae2352 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -288,6 +288,19 @@ static void pv_destroy_gdt_ldt_l1tab(struct vcpu *v)
                               1U << GDT_LDT_VCPU_SHIFT);
 }
 
+static int pv_create_shadow_root_pt_l1tab(struct vcpu *v)
+{
+    return create_perdomain_mapping(v->domain, SHADOW_ROOT_PT_VCPU_VIRT_START(v),
+                                    1, v->domain->arch.pv.shadow_root_pt_l1tab,
+                                    NULL);
+}
+
+static void pv_destroy_shadow_root_pt_l1tab(struct vcpu *v)
+
+{
+    destroy_perdomain_mapping(v->domain, SHADOW_ROOT_PT_VCPU_VIRT_START(v), 1);
+}
+
 void pv_vcpu_destroy(struct vcpu *v)
 {
     if ( is_pv_32bit_vcpu(v) )
@@ -297,6 +310,7 @@ void pv_vcpu_destroy(struct vcpu *v)
     }
 
     pv_destroy_gdt_ldt_l1tab(v);
+    pv_destroy_shadow_root_pt_l1tab(v);
     XFREE(v->arch.pv.trap_ctxt);
 }
 
@@ -311,6 +325,13 @@ int pv_vcpu_initialise(struct vcpu *v)
     if ( rc )
         return rc;
 
+    if ( v->domain->arch.pv.xpti )
+    {
+        rc = pv_create_shadow_root_pt_l1tab(v);
+        if ( rc )
+            goto done;
+    }
+
     BUILD_BUG_ON(X86_NR_VECTORS * sizeof(*v->arch.pv.trap_ctxt) >
                  PAGE_SIZE);
     v->arch.pv.trap_ctxt = xzalloc_array(struct trap_info, X86_NR_VECTORS);
@@ -346,10 +367,12 @@ void pv_domain_destroy(struct domain *d)
 
     destroy_perdomain_mapping(d, GDT_LDT_VIRT_START,
                               GDT_LDT_MBYTES << (20 - PAGE_SHIFT));
+    destroy_perdomain_mapping(d, SHADOW_ROOT_PT_VIRT_START, SHADOW_ROOT_PT_ENTRIES);
 
     XFREE(d->arch.pv.cpuidmasks);
 
     FREE_XENHEAP_PAGE(d->arch.pv.gdt_ldt_l1tab);
+    FREE_XENHEAP_PAGE(d->arch.pv.shadow_root_pt_l1tab);
 }
 
 void noreturn cf_check continue_pv_domain(void);
@@ -371,6 +394,12 @@ int pv_domain_initialise(struct domain *d)
         goto fail;
     clear_page(d->arch.pv.gdt_ldt_l1tab);
 
+    d->arch.pv.shadow_root_pt_l1tab =
+        alloc_xenheap_pages(0, MEMF_node(domain_to_node(d)));
+    if ( !d->arch.pv.shadow_root_pt_l1tab )
+        goto fail;
+    clear_page(d->arch.pv.shadow_root_pt_l1tab);
+
     if ( levelling_caps & ~LCAP_faulting &&
          (d->arch.pv.cpuidmasks = xmemdup(&cpuidmask_defaults)) == NULL )
         goto fail;
@@ -381,6 +410,11 @@ int pv_domain_initialise(struct domain *d)
     if ( rc )
         goto fail;
 
+    rc = create_perdomain_mapping(d, SHADOW_ROOT_PT_VIRT_START,
+                                  SHADOW_ROOT_PT_ENTRIES, NULL, NULL);
+    if ( rc )
+        goto fail;
+
     d->arch.ctxt_switch = &pv_csw;
 
     d->arch.pv.xpti = is_hardware_domain(d) ? opt_xpti_hwdom : opt_xpti_domu;
diff --git a/xen/arch/x86/x86_64/asm-offsets.c b/xen/arch/x86/x86_64/asm-offsets.c
index 57b73a4e62..23f9cca1a2 100644
--- a/xen/arch/x86/x86_64/asm-offsets.c
+++ b/xen/arch/x86/x86_64/asm-offsets.c
@@ -51,6 +51,7 @@ void __dummy__(void)
     OFFSET(UREGS_kernel_sizeof, struct cpu_user_regs, es);
     BLANK();
 
+    OFFSET(VCPU_id, struct vcpu, vcpu_id);
     OFFSET(VCPU_processor, struct vcpu, processor);
     OFFSET(VCPU_domain, struct vcpu, domain);
     OFFSET(VCPU_vcpu_info, struct vcpu, vcpu_info_area.map);
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index c25b14dde6..a216c5ca7a 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -165,7 +165,15 @@ restore_all_guest:
         and   %rsi, %rdi
         and   %r9, %rsi
         add   %rcx, %rdi
+
+        /*
+         * The address in the vCPU cr3 is always mapped in the shadow
+         * root_pt virt area.
+         */
+        imul $PAGE_SIZE, VCPU_id(%rbx), %esi
+        movabs $SHADOW_ROOT_PT_VIRT_START, %rcx
         add   %rcx, %rsi
+
         mov   $ROOT_PAGETABLE_FIRST_XEN_SLOT, %ecx
         mov   root_table_offset(SH_LINEAR_PT_VIRT_START)*8(%rsi), %r8
         mov   %r8, root_table_offset(SH_LINEAR_PT_VIRT_START)*8(%rdi)
-- 
2.40.1


