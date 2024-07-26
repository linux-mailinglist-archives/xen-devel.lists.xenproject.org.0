Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 919BF93D65D
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 17:42:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765661.1176321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXN4b-0004rU-Uv; Fri, 26 Jul 2024 15:41:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765661.1176321; Fri, 26 Jul 2024 15:41:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXN4b-0004pI-PW; Fri, 26 Jul 2024 15:41:37 +0000
Received: by outflank-mailman (input) for mailman id 765661;
 Fri, 26 Jul 2024 15:41:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bxzg=O2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sXMvL-00084Z-Ik
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2024 15:32:03 +0000
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [2607:f8b0:4864:20::835])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3216d2c5-4b64-11ef-bbff-fd08da9f4363;
 Fri, 26 Jul 2024 17:31:58 +0200 (CEST)
Received: by mail-qt1-x835.google.com with SMTP id
 d75a77b69052e-44ff7cc5432so5018541cf.3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2024 08:31:58 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-44fe8201583sm13962251cf.69.2024.07.26.08.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jul 2024 08:31:56 -0700 (PDT)
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
X-Inumbo-ID: 3216d2c5-4b64-11ef-bbff-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722007917; x=1722612717; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y0jFmKsOaRzFzsuDJr/vpzxDf870ieWIqAEP938hVyw=;
        b=M7Qeu1AAlr0bQG8bOphO1sdcojnhZZLTcmLZp1Z8T+qyHIZ3L32hi40lz8Dx+apTol
         wwtj4pTT4IU4v/Q0T2N1SPwX2wcCQgd65sK+1GpcKjiJwy+KO4tcH9TilJbsqbBfSgP9
         IPjc6HO62lw93TFytJoVqfD5MJ5Ln5pcDkv5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722007917; x=1722612717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y0jFmKsOaRzFzsuDJr/vpzxDf870ieWIqAEP938hVyw=;
        b=xNhhr2hZwqIXClJVPSAFTpKMfaCcWrAgH44XtF2eLso/79fMcxU98Fu8xrh3NGVHKm
         Taw0MnjWf7+v5YHUJY8JCOd36NDu46AtKb4AakEERzqFYvpdyDRMA+c+cJaKJ9LA+8tv
         2+7HR21adF86zOIetTCTD1Nu+G5GG9nKfAPl7cCQ09zajnb+Z6LT2LCbSAVitv81/3wD
         0GRGO/U+wEDOhk0l1x6QYA0vBCwrQqf+CJA+oo6bw5LfwVOLJMHMJTnQ8hifhBO41FIJ
         UaTSK43IO8lEZqlix4L0lDMPB9H+ip1PcJyR1oVEPMNQP4ozJEy23HT42v+n8aHNFdrc
         sy7A==
X-Gm-Message-State: AOJu0YzKckbeIHrjeNUD7G8AuxoaJfUzDFAuuQb2ol9YogKBJwuEUABY
	sN/Hc/rLTM371r7lF/4KCo1/wXRsEy3ksEVGDaeZl+6mT8Scwd53IjgBB9FjEXoLjb46ClBdxgC
	G
X-Google-Smtp-Source: AGHT+IGiS/h6u9qqSHvgUrluH594A0zTw0s1tnDElj/8eDjyLad+rVrps4h28Kg+Rh5qgtG1Fnzf4g==
X-Received: by 2002:a05:622a:547:b0:44f:f7be:4d3e with SMTP id d75a77b69052e-45004d6fd41mr2322221cf.5.1722007917022;
        Fri, 26 Jul 2024 08:31:57 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: alejandro.vallejo@cloud.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Tim Deegan <tim@xen.org>
Subject: [PATCH 14/22] x86/hvm: use a per-pCPU monitor table in shadow mode
Date: Fri, 26 Jul 2024 17:21:58 +0200
Message-ID: <20240726152206.28411-15-roger.pau@citrix.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240726152206.28411-1-roger.pau@citrix.com>
References: <20240726152206.28411-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Instead of allocating a monitor table for each vCPU when running in HVM shadow
mode, use a per-pCPU monitor table, which gets the per-domain slot updated on
guest context switch.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
I've tested this manually, but XenServer builds disable shadow support, so it
possibly hasn't been given the same level of testing as the rest of the
changes.
---
 xen/arch/x86/hvm/hvm.c              |  7 +++
 xen/arch/x86/include/asm/hvm/vcpu.h |  6 ++-
 xen/arch/x86/include/asm/paging.h   | 18 ++++++++
 xen/arch/x86/mm.c                   |  6 +++
 xen/arch/x86/mm/shadow/common.c     | 42 +++++++-----------
 xen/arch/x86/mm/shadow/hvm.c        | 65 ++++++++++++----------------
 xen/arch/x86/mm/shadow/multi.c      | 66 ++++++++++++++++++-----------
 xen/arch/x86/mm/shadow/private.h    |  4 +-
 8 files changed, 120 insertions(+), 94 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 3f771bc65677..419d78a79c51 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -141,6 +141,7 @@ void hvm_set_cpu_monitor_table(struct vcpu *v)
 
     ASSERT(pgt);
 
+    paging_set_cpu_monitor_table(v);
     setup_perdomain_slot(v, pgt);
 
     make_cr3(v, _mfn(virt_to_mfn(pgt)));
@@ -150,6 +151,8 @@ void hvm_clear_cpu_monitor_table(struct vcpu *v)
 {
     /* Poison %cr3, it will be updated when the vCPU is scheduled. */
     make_cr3(v, INVALID_MFN);
+
+    paging_clear_cpu_monitor_table(v);
 }
 
 static int cf_check cpu_callback(
@@ -1645,6 +1648,10 @@ int hvm_vcpu_initialise(struct vcpu *v)
     int rc;
     struct domain *d = v->domain;
 
+#ifdef CONFIG_SHADOW_PAGING
+    v->arch.hvm.shadow_linear_l3 = INVALID_MFN;
+#endif
+
     hvm_asid_flush_vcpu(v);
 
     spin_lock_init(&v->arch.hvm.tm_lock);
diff --git a/xen/arch/x86/include/asm/hvm/vcpu.h b/xen/arch/x86/include/asm/hvm/vcpu.h
index 64c7a6fedea9..f7faaaa21521 100644
--- a/xen/arch/x86/include/asm/hvm/vcpu.h
+++ b/xen/arch/x86/include/asm/hvm/vcpu.h
@@ -149,8 +149,10 @@ struct hvm_vcpu {
         uint16_t p2midx;
     } fast_single_step;
 
-    /* (MFN) hypervisor page table */
-    pagetable_t         monitor_table;
+#ifdef CONFIG_SHADOW_PAGING
+    /* Reference to the linear L3 page table. */
+    mfn_t shadow_linear_l3;
+#endif
 
     struct hvm_vcpu_asid n1asid;
 
diff --git a/xen/arch/x86/include/asm/paging.h b/xen/arch/x86/include/asm/paging.h
index 8a2a0af40874..c1e188bcd3c0 100644
--- a/xen/arch/x86/include/asm/paging.h
+++ b/xen/arch/x86/include/asm/paging.h
@@ -117,6 +117,8 @@ struct paging_mode {
                                             unsigned long cr3,
                                             paddr_t ga, uint32_t *pfec,
                                             unsigned int *page_order);
+    void          (*set_cpu_monitor_table  )(struct vcpu *v);
+    void          (*clear_cpu_monitor_table)(struct vcpu *v);
 #endif
     pagetable_t   (*update_cr3            )(struct vcpu *v, bool noflush);
 
@@ -288,6 +290,22 @@ static inline bool paging_flush_tlb(const unsigned long *vcpu_bitmap)
     return current->domain->arch.paging.flush_tlb(vcpu_bitmap);
 }
 
+static inline void paging_set_cpu_monitor_table(struct vcpu *v)
+{
+    const struct paging_mode *mode = paging_get_hostmode(v);
+
+    if ( mode->set_cpu_monitor_table )
+        mode->set_cpu_monitor_table(v);
+}
+
+static inline void paging_clear_cpu_monitor_table(struct vcpu *v)
+{
+    const struct paging_mode *mode = paging_get_hostmode(v);
+
+    if ( mode->clear_cpu_monitor_table )
+        mode->clear_cpu_monitor_table(v);
+}
+
 #endif /* CONFIG_HVM */
 
 /* Update all the things that are derived from the guest's CR3.
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 7f2666adaef4..13aa15f4db22 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -534,6 +534,12 @@ void write_ptbase(struct vcpu *v)
     }
     else
     {
+        ASSERT(!is_hvm_domain(d) || !d->arch.asi
+#ifdef CONFIG_HVM
+               || mfn_eq(maddr_to_mfn(v->arch.cr3),
+                         virt_to_mfn(this_cpu(monitor_pgt)))
+#endif
+               );
         /* Make sure to clear use_pv_cr3 and xen_cr3 before pv_cr3. */
         cpu_info->use_pv_cr3 = false;
         cpu_info->xen_cr3 = 0;
diff --git a/xen/arch/x86/mm/shadow/common.c b/xen/arch/x86/mm/shadow/common.c
index 0176e33bc9c7..d31c1db8a1ab 100644
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -2413,16 +2413,12 @@ static void sh_update_paging_modes(struct vcpu *v)
                 &SHADOW_INTERNAL_NAME(sh_paging_mode, 2);
         }
 
-        if ( pagetable_is_null(v->arch.hvm.monitor_table) )
+        if ( mfn_eq(v->arch.hvm.shadow_linear_l3, INVALID_MFN) )
         {
-            mfn_t mmfn = sh_make_monitor_table(
-                             v, v->arch.paging.mode->shadow.shadow_levels);
-
-            if ( mfn_eq(mmfn, INVALID_MFN) )
+            if ( sh_update_monitor_table(
+                     v, v->arch.paging.mode->shadow.shadow_levels) )
                 return;
 
-            v->arch.hvm.monitor_table = pagetable_from_mfn(mmfn);
-            make_cr3(v, mmfn);
             hvm_update_host_cr3(v);
         }
 
@@ -2440,8 +2436,8 @@ static void sh_update_paging_modes(struct vcpu *v)
                  (v->arch.paging.mode->shadow.shadow_levels !=
                   old_mode->shadow.shadow_levels) )
             {
-                /* Need to make a new monitor table for the new mode */
-                mfn_t new_mfn, old_mfn;
+                /* Might need to make a new L3 linear table for the new mode */
+                mfn_t old_mfn;
 
                 if ( v != current && vcpu_runnable(v) )
                 {
@@ -2455,24 +2451,21 @@ static void sh_update_paging_modes(struct vcpu *v)
                     return;
                 }
 
-                old_mfn = pagetable_get_mfn(v->arch.hvm.monitor_table);
-                v->arch.hvm.monitor_table = pagetable_null();
-                new_mfn = sh_make_monitor_table(
-                              v, v->arch.paging.mode->shadow.shadow_levels);
-                if ( mfn_eq(new_mfn, INVALID_MFN) )
+                old_mfn = v->arch.hvm.shadow_linear_l3;
+                v->arch.hvm.shadow_linear_l3 = INVALID_MFN;
+                if ( sh_update_monitor_table(
+                         v, v->arch.paging.mode->shadow.shadow_levels) )
                 {
                     sh_destroy_monitor_table(v, old_mfn,
                                              old_mode->shadow.shadow_levels);
                     return;
                 }
-                v->arch.hvm.monitor_table = pagetable_from_mfn(new_mfn);
-                SHADOW_PRINTK("new monitor table %"PRI_mfn "\n",
-                               mfn_x(new_mfn));
+                SHADOW_PRINTK("new L3 linear table %"PRI_mfn "\n",
+                               mfn_x(v->arch.hvm.shadow_linear_l3));
 
                 /* Don't be running on the old monitor table when we
                  * pull it down!  Switch CR3, and warn the HVM code that
                  * its host cr3 has changed. */
-                make_cr3(v, new_mfn);
                 if ( v == current )
                     write_ptbase(v);
                 hvm_update_host_cr3(v);
@@ -2781,16 +2774,13 @@ void shadow_vcpu_teardown(struct vcpu *v)
 
     sh_detach_old_tables(v);
 #ifdef CONFIG_HVM
-    if ( shadow_mode_external(d) )
+    if ( shadow_mode_external(d) &&
+         !mfn_eq(v->arch.hvm.shadow_linear_l3, INVALID_MFN) )
     {
-        mfn_t mfn = pagetable_get_mfn(v->arch.hvm.monitor_table);
-
-        if ( mfn_x(mfn) )
-            sh_destroy_monitor_table(
-                v, mfn,
+        sh_destroy_monitor_table(
+                v, v->arch.hvm.shadow_linear_l3,
                 v->arch.paging.mode->shadow.shadow_levels);
-
-        v->arch.hvm.monitor_table = pagetable_null();
+        v->arch.hvm.shadow_linear_l3 = INVALID_MFN;
     }
 #endif
 
diff --git a/xen/arch/x86/mm/shadow/hvm.c b/xen/arch/x86/mm/shadow/hvm.c
index 93922a71e511..15c75cf766bb 100644
--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -736,30 +736,15 @@ bool cf_check shadow_flush_tlb(const unsigned long *vcpu_bitmap)
     return true;
 }
 
-mfn_t sh_make_monitor_table(const struct vcpu *v, unsigned int shadow_levels)
+int sh_update_monitor_table(struct vcpu *v, unsigned int shadow_levels)
 {
     struct domain *d = v->domain;
-    mfn_t m4mfn;
-    l4_pgentry_t *l4e;
 
-    ASSERT(!pagetable_get_pfn(v->arch.hvm.monitor_table));
+    ASSERT(mfn_eq(v->arch.hvm.shadow_linear_l3, INVALID_MFN));
 
     /* Guarantee we can get the memory we need */
-    if ( !shadow_prealloc(d, SH_type_monitor_table, CONFIG_PAGING_LEVELS) )
-        return INVALID_MFN;
-
-    m4mfn = shadow_alloc(d, SH_type_monitor_table, 0);
-    mfn_to_page(m4mfn)->shadow_flags = 4;
-
-    l4e = map_domain_page(m4mfn);
-
-    /*
-     * Create a self-linear mapping, but no shadow-linear mapping.  A
-     * shadow-linear mapping will either be inserted below when creating
-     * lower level monitor tables, or later in sh_update_cr3().
-     */
-    init_xen_l4_slots(l4e, m4mfn, INVALID_MFN, d->arch.perdomain_l3_pg,
-                      false, true, false);
+    if ( !shadow_prealloc(d, SH_type_monitor_table, CONFIG_PAGING_LEVELS - 1) )
+        return -ENOMEM;
 
     if ( shadow_levels < 4 )
     {
@@ -773,52 +758,54 @@ mfn_t sh_make_monitor_table(const struct vcpu *v, unsigned int shadow_levels)
          */
         m3mfn = shadow_alloc(d, SH_type_monitor_table, 0);
         mfn_to_page(m3mfn)->shadow_flags = 3;
-        l4e[l4_table_offset(SH_LINEAR_PT_VIRT_START)]
-            = l4e_from_mfn(m3mfn, __PAGE_HYPERVISOR_RW);
 
         m2mfn = shadow_alloc(d, SH_type_monitor_table, 0);
         mfn_to_page(m2mfn)->shadow_flags = 2;
         l3e = map_domain_page(m3mfn);
         l3e[0] = l3e_from_mfn(m2mfn, __PAGE_HYPERVISOR_RW);
         unmap_domain_page(l3e);
-    }
 
-    unmap_domain_page(l4e);
+        v->arch.hvm.shadow_linear_l3 = m3mfn;
+
+        /*
+         * If the vCPU is not the current one the L4 entry will be updated on
+         * context switch.
+         */
+        if ( v == current )
+            this_cpu(monitor_pgt)[l4_table_offset(SH_LINEAR_PT_VIRT_START)]
+                = l4e_from_mfn(m3mfn, __PAGE_HYPERVISOR_RW);
+    }
+    else if ( v == current )
+        /* The shadow linear mapping will be inserted in sh_update_cr3(). */
+        this_cpu(monitor_pgt)[l4_table_offset(SH_LINEAR_PT_VIRT_START)]
+            = l4e_empty();
 
-    return m4mfn;
+    return 0;
 }
 
-void sh_destroy_monitor_table(const struct vcpu *v, mfn_t mmfn,
+void sh_destroy_monitor_table(const struct vcpu *v, mfn_t m3mfn,
                               unsigned int shadow_levels)
 {
     struct domain *d = v->domain;
 
-    ASSERT(mfn_to_page(mmfn)->u.sh.type == SH_type_monitor_table);
-
     if ( shadow_levels < 4 )
     {
-        mfn_t m3mfn;
-        l4_pgentry_t *l4e = map_domain_page(mmfn);
-        l3_pgentry_t *l3e;
-        unsigned int linear_slot = l4_table_offset(SH_LINEAR_PT_VIRT_START);
+        l3_pgentry_t *l3e = map_domain_page(m3mfn);
+
+        ASSERT(!mfn_eq(m3mfn, INVALID_MFN));
+        ASSERT(mfn_to_page(m3mfn)->u.sh.type == SH_type_monitor_table);
 
         /*
          * Need to destroy the l3 and l2 monitor pages used
          * for the linear map.
          */
-        ASSERT(l4e_get_flags(l4e[linear_slot]) & _PAGE_PRESENT);
-        m3mfn = l4e_get_mfn(l4e[linear_slot]);
-        l3e = map_domain_page(m3mfn);
         ASSERT(l3e_get_flags(l3e[0]) & _PAGE_PRESENT);
         shadow_free(d, l3e_get_mfn(l3e[0]));
         unmap_domain_page(l3e);
         shadow_free(d, m3mfn);
-
-        unmap_domain_page(l4e);
     }
-
-    /* Put the memory back in the pool */
-    shadow_free(d, mmfn);
+    else
+        ASSERT(mfn_eq(m3mfn, INVALID_MFN));
 }
 
 /**************************************************************************/
diff --git a/xen/arch/x86/mm/shadow/multi.c b/xen/arch/x86/mm/shadow/multi.c
index 0def0c073ca8..68c59233794f 100644
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -3007,6 +3007,32 @@ static unsigned long cf_check sh_gva_to_gfn(
     return gfn_x(gfn);
 }
 
+static void cf_check set_cpu_monitor_table(struct vcpu *v)
+{
+    root_pgentry_t *pgt = this_cpu(monitor_pgt);
+
+    virt_to_page(pgt)->shadow_flags = 4;
+
+    /* Setup linear L3 entry. */
+    if ( !mfn_eq(v->arch.hvm.shadow_linear_l3, INVALID_MFN) )
+        pgt[l4_table_offset(SH_LINEAR_PT_VIRT_START)] =
+            l4e_from_mfn(v->arch.hvm.shadow_linear_l3, __PAGE_HYPERVISOR_RW);
+    else
+        pgt[l4_table_offset(SH_LINEAR_PT_VIRT_START)] =
+            l4e_from_pfn(
+                pagetable_get_pfn(v->arch.paging.shadow.shadow_table[0]),
+                __PAGE_HYPERVISOR_RW);
+}
+
+static void cf_check clear_cpu_monitor_table(struct vcpu *v)
+{
+    root_pgentry_t *pgt = this_cpu(monitor_pgt);
+
+    virt_to_page(pgt)->shadow_flags = 0;
+
+    pgt[l4_table_offset(SH_LINEAR_PT_VIRT_START)] = l4e_empty();
+}
+
 #endif /* CONFIG_HVM */
 
 static inline void
@@ -3033,8 +3059,11 @@ sh_update_linear_entries(struct vcpu *v)
      */
 
     /* Don't try to update the monitor table if it doesn't exist */
-    if ( !shadow_mode_external(d) ||
-         pagetable_get_pfn(v->arch.hvm.monitor_table) == 0 )
+    if ( !shadow_mode_external(d)
+#if SHADOW_PAGING_LEVELS == 3
+         || mfn_eq(v->arch.hvm.shadow_linear_l3, INVALID_MFN)
+#endif
+       )
         return;
 
 #if !defined(CONFIG_HVM)
@@ -3051,17 +3080,6 @@ sh_update_linear_entries(struct vcpu *v)
                 pagetable_get_pfn(v->arch.paging.shadow.shadow_table[0]),
                 __PAGE_HYPERVISOR_RW);
     }
-    else
-    {
-        l4_pgentry_t *ml4e;
-
-        ml4e = map_domain_page(pagetable_get_mfn(v->arch.hvm.monitor_table));
-        ml4e[l4_table_offset(SH_LINEAR_PT_VIRT_START)] =
-            l4e_from_pfn(
-                pagetable_get_pfn(v->arch.paging.shadow.shadow_table[0]),
-                __PAGE_HYPERVISOR_RW);
-        unmap_domain_page(ml4e);
-    }
 
 #elif SHADOW_PAGING_LEVELS == 3
 
@@ -3087,16 +3105,8 @@ sh_update_linear_entries(struct vcpu *v)
                 + l2_linear_offset(SH_LINEAR_PT_VIRT_START);
         else
         {
-            mfn_t l3mfn, l2mfn;
-            l4_pgentry_t *ml4e;
-            l3_pgentry_t *ml3e;
-            int linear_slot = shadow_l4_table_offset(SH_LINEAR_PT_VIRT_START);
-            ml4e = map_domain_page(pagetable_get_mfn(v->arch.hvm.monitor_table));
-
-            ASSERT(l4e_get_flags(ml4e[linear_slot]) & _PAGE_PRESENT);
-            l3mfn = l4e_get_mfn(ml4e[linear_slot]);
-            ml3e = map_domain_page(l3mfn);
-            unmap_domain_page(ml4e);
+            mfn_t l2mfn;
+            l3_pgentry_t *ml3e = map_domain_page(v->arch.hvm.shadow_linear_l3);
 
             ASSERT(l3e_get_flags(ml3e[0]) & _PAGE_PRESENT);
             l2mfn = l3e_get_mfn(ml3e[0]);
@@ -3341,9 +3351,13 @@ static pagetable_t cf_check sh_update_cr3(struct vcpu *v, bool noflush)
     ///
     /// v->arch.cr3
     ///
-    if ( shadow_mode_external(d) )
+    if ( shadow_mode_external(d) && v == current )
     {
-        make_cr3(v, pagetable_get_mfn(v->arch.hvm.monitor_table));
+#ifdef CONFIG_HVM
+        make_cr3(v, _mfn(virt_to_mfn(this_cpu(monitor_pgt))));
+#else
+        ASSERT_UNREACHABLE();
+#endif
     }
 #if SHADOW_PAGING_LEVELS == 4
     else // not shadow_mode_external...
@@ -4106,6 +4120,8 @@ const struct paging_mode sh_paging_mode = {
     .invlpg                        = sh_invlpg,
 #ifdef CONFIG_HVM
     .gva_to_gfn                    = sh_gva_to_gfn,
+    .set_cpu_monitor_table         = set_cpu_monitor_table,
+    .clear_cpu_monitor_table       = clear_cpu_monitor_table,
 #endif
     .update_cr3                    = sh_update_cr3,
     .guest_levels                  = GUEST_PAGING_LEVELS,
diff --git a/xen/arch/x86/mm/shadow/private.h b/xen/arch/x86/mm/shadow/private.h
index a5fc3a7676eb..6743aeefe12e 100644
--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -420,8 +420,8 @@ void shadow_unhook_mappings(struct domain *d, mfn_t smfn, int user_only);
  * sh_{make,destroy}_monitor_table() depend only on the number of shadow
  * levels.
  */
-mfn_t sh_make_monitor_table(const struct vcpu *v, unsigned int shadow_levels);
-void sh_destroy_monitor_table(const struct vcpu *v, mfn_t mmfn,
+int sh_update_monitor_table(struct vcpu *v, unsigned int shadow_levels);
+void sh_destroy_monitor_table(const struct vcpu *v, mfn_t m3mfn,
                               unsigned int shadow_levels);
 
 /* VRAM dirty tracking helpers. */
-- 
2.45.2


