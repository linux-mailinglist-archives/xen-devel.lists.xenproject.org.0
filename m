Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0589C3F5F
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 14:12:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833730.1248942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAUDA-00086b-EE; Mon, 11 Nov 2024 13:12:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833730.1248942; Mon, 11 Nov 2024 13:12:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAUDA-00083a-Ap; Mon, 11 Nov 2024 13:12:08 +0000
Received: by outflank-mailman (input) for mailman id 833730;
 Mon, 11 Nov 2024 13:12:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=//j0=SG=amazon.co.uk=prvs=038d26d0c=eliasely@srs-se1.protection.inumbo.net>)
 id 1tAUD9-0007pD-3C
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 13:12:07 +0000
Received: from smtp-fw-80009.amazon.com (smtp-fw-80009.amazon.com
 [99.78.197.220]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8978212a-a02e-11ef-99a3-01e77a169b0f;
 Mon, 11 Nov 2024 14:12:02 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.25.36.210])
 by smtp-border-fw-80009.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 13:11:58 +0000
Received: from EX19MTAUEA002.ant.amazon.com [10.0.29.78:22725]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.48.172:2525]
 with esmtp (Farcaster)
 id 8f8c18e5-5ef7-40b5-8357-f7b9025a8ac1; Mon, 11 Nov 2024 13:11:58 +0000 (UTC)
Received: from EX19D008UEC001.ant.amazon.com (10.252.135.232) by
 EX19MTAUEA002.ant.amazon.com (10.252.134.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Mon, 11 Nov 2024 13:11:58 +0000
Received: from EX19MTAUEA001.ant.amazon.com (10.252.134.203) by
 EX19D008UEC001.ant.amazon.com (10.252.135.232) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Mon, 11 Nov 2024 13:11:57 +0000
Received: from email-imr-corp-prod-pdx-all-2b-5ec155c2.us-west-2.amazon.com
 (10.124.125.2) by mail-relay.amazon.com (10.252.134.102) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1258.34 via Frontend Transport; Mon, 11 Nov 2024 13:11:57 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com [10.253.91.118])
 by email-imr-corp-prod-pdx-all-2b-5ec155c2.us-west-2.amazon.com (Postfix) with
 ESMTPS id F080642133; Mon, 11 Nov 2024 13:11:55 +0000 (UTC)
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
X-Inumbo-ID: 8978212a-a02e-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6Ijk5Ljc4LjE5Ny4yMjAiLCJoZWxvIjoic210cC1mdy04MDAwOS5hbWF6b24uY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijg5NzgyMTJhLWEwMmUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMzMwNzIyLjc2MjY2NSwic2VuZGVyIjoicHJ2cz0wMzhkMjZkMGM9ZWxpYXNlbHlAYW1hem9uLmNvLnVrIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1731330722; x=1762866722;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=601Gks7wh38jDiP8wRPfBulDLIgsNYKRD4iPPQ6CqSQ=;
  b=sw29fEW1Ke1Fj21mZOykfkfvBNuWvKCEBPWtqIXtXMD/4WkxnsYOBDRu
   4eUGHPpwhXVt5D5WL+oWlQai1af2P9MQQ8kNbL3DCyhLCIpA6rL11wttC
   5Nkq+UP4gYymnJ6NurIpYW/992+hKlf8KVIr97hU7THFRvgDt7wtYZaQb
   E=;
X-IronPort-AV: E=Sophos;i="6.12,145,1728950400"; 
   d="scan'208";a="146255369"
X-Farcaster-Flow-ID: 8f8c18e5-5ef7-40b5-8357-f7b9025a8ac1
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Hongyan Xia
	<hongyxia@amazon.com>, Julien Grall <jgrall@amazon.com>, Elias El Yandouzi
	<eliasely@amazon.com>
Subject: [PATCH V4 01/15] x86: Create per-domain mapping for guest_root_pt
Date: Mon, 11 Nov 2024 13:11:34 +0000
Message-ID: <20241111131148.52568-2-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241111131148.52568-1-eliasely@amazon.com>
References: <20241111131148.52568-1-eliasely@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Hongyan Xia <hongyxia@amazon.com>

This patch introduces a per-domain mapping for the `guest_root_pt` in PV
guests as part of the effort to remove the direct map in Xen.

For the time being, the `root_pgt` is not mapped or unmapped, as it remains
a Xenheap page. This will be addressed in subsequent patches.

Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>

----
    Changes in V4:
        * Fix over-allocation issue
        * Update the mappings when switching from kernel to user-mode

    Changes in V3:
        * Rename SHADOW_ROOT
        * Haven't addressed the potentially over-allocation issue as I don't get it

    Changes in V2:
        * Rework the shadow perdomain mapping solution in the follow-up patches

    Changes since Hongyan's version:
        * Remove the final dot in the commit title

diff --git a/xen/arch/x86/include/asm/config.h b/xen/arch/x86/include/asm/config.h
index f8a5a4913b07..bd360ec4141e 100644
--- a/xen/arch/x86/include/asm/config.h
+++ b/xen/arch/x86/include/asm/config.h
@@ -174,7 +174,7 @@
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
index b79d6badd71c..478ce41ad8ca 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -272,6 +272,7 @@ struct time_scale {
 struct pv_domain
 {
     l1_pgentry_t **gdt_ldt_l1tab;
+    l1_pgentry_t **root_pt_l1tab;
 
     atomic_t nr_l4_pages;
 
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index d537a799bced..a152e21bb086 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -516,6 +516,13 @@ void make_cr3(struct vcpu *v, mfn_t mfn)
         v->arch.cr3 |= get_pcid_bits(v, false);
 }
 
+#define pv_root_pt_idx(v) \
+    ((v)->vcpu_id >> PAGETABLE_ORDER)
+
+#define pv_root_pt_pte(v) \
+    ((v)->domain->arch.pv.root_pt_l1tab[pv_root_pt_idx(v)] + \
+     ((v)->vcpu_id & (L1_PAGETABLE_ENTRIES - 1)))
+
 void write_ptbase(struct vcpu *v)
 {
     const struct domain *d = v->domain;
@@ -527,11 +534,16 @@ void write_ptbase(struct vcpu *v)
 
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
index d5a8564c1cbe..1a1c999743ac 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -289,6 +289,21 @@ static void pv_destroy_gdt_ldt_l1tab(struct vcpu *v)
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
+
+{
+    destroy_perdomain_mapping(v->domain,
+                              PV_ROOT_PT_MAPPING_VCPU_VIRT_START(v), 1);
+}
+
 void pv_vcpu_destroy(struct vcpu *v)
 {
     if ( is_pv_32bit_vcpu(v) )
@@ -298,6 +313,7 @@ void pv_vcpu_destroy(struct vcpu *v)
     }
 
     pv_destroy_gdt_ldt_l1tab(v);
+    pv_destroy_root_pt_l1tab(v);
     XFREE(v->arch.pv.trap_ctxt);
 }
 
@@ -312,6 +328,13 @@ int pv_vcpu_initialise(struct vcpu *v)
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
@@ -347,10 +370,12 @@ void pv_domain_destroy(struct domain *d)
 
     destroy_perdomain_mapping(d, GDT_LDT_VIRT_START,
                               GDT_LDT_MBYTES << (20 - PAGE_SHIFT));
+    destroy_perdomain_mapping(d, PV_ROOT_PT_MAPPING_VIRT_START, d->max_vcpus);
 
     XFREE(d->arch.pv.cpuidmasks);
 
     FREE_XENHEAP_PAGE(d->arch.pv.gdt_ldt_l1tab);
+    FREE_XENHEAP_PAGE(d->arch.pv.root_pt_l1tab);
 }
 
 void noreturn cf_check continue_pv_domain(void);
@@ -382,8 +407,22 @@ int pv_domain_initialise(struct domain *d)
     if ( rc )
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
@@ -457,7 +496,8 @@ static void _toggle_guest_pt(struct vcpu *v)
             guest_update = false;
         }
     }
-    write_cr3(cr3);
+
+    write_ptbase(v);
 
     if ( !pagetable_is_null(old_shadow) )
         shadow_put_top_level(v->domain, old_shadow);
@@ -497,9 +537,6 @@ void toggle_guest_mode(struct vcpu *v)
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
index c5c723b5f4d4..91413b905768 100644
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
2.40.1


