Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEBCA05EA9
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 15:31:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867333.1278910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVX50-0001C5-SQ; Wed, 08 Jan 2025 14:30:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867333.1278910; Wed, 08 Jan 2025 14:30:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVX50-00016o-Mg; Wed, 08 Jan 2025 14:30:42 +0000
Received: by outflank-mailman (input) for mailman id 867333;
 Wed, 08 Jan 2025 14:30:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2h7L=UA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tVX4y-0006o2-Kh
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 14:30:40 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2225e2e3-cdcd-11ef-a0df-8be0dac302b0;
 Wed, 08 Jan 2025 15:30:39 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-aa689a37dd4so565882666b.3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 06:30:39 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0f015ae1sm2498095766b.147.2025.01.08.06.30.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 06:30:38 -0800 (PST)
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
X-Inumbo-ID: 2225e2e3-cdcd-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736346639; x=1736951439; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WR7teHFML1rITUYnPw8UNQ0VYOmZRC0EHDzMIXlg0pw=;
        b=cVY/4bU0wVsnhDKeWp7d7jb51GsqOsuDcxoBKROiNH4+FJKji5K/AH+eIl8YlqSSSM
         olJNQnE5+kjezvngMc96TbtI8EMEVm0L6HaGtouS0HduPX9NklXJBnlZN1rVurFApjmC
         9yrQOyQFHiu6W/+htqhbzPKrow25KIYOhWQ/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736346639; x=1736951439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WR7teHFML1rITUYnPw8UNQ0VYOmZRC0EHDzMIXlg0pw=;
        b=u6qNx4S2XAgrBNFM60qWbmyPfiTFMDEAd4SGx1BGg75Yt3B+v0NHZy3aO8Vf7nPTHy
         VPT1J08EaGBxw5w2Ow8tmuC5TqC/Ug13X02PSXdpTUWQ4bO5nXzepW9zwZhTo6wL8YCC
         SxXC3ipnL4B5vDCnx/JG3B5F25dH6loCFaRCgyllTNiyXOo4Vyn2ZdYL/Y4Jagi2WUji
         f1LDw0wwSiuOko9bGA1P4uU+oTxqhz/Z5spQN/hzyTOxf0BQSHj8nnThCvF7cpl/o9n4
         K0TVE+WKMwgiibW1PRORTf9KiEfFP7q50Ue2UCbSE/yHlyCFbF173Ef/ovVQncuUH4HU
         Ku0A==
X-Gm-Message-State: AOJu0YzwnHne2WkgzinvnzBNPvC3Rky5PJvWpKaXZj0LllJ80fRVkPww
	lsF+XN7/DknopTMT24rLbJuWW6DKcsdpyidiK+qJVT4GxizPCjl2/UWaEf2UFF9a5B8DRhMPWZa
	O
X-Gm-Gg: ASbGncs36JjTZQWmT1/+mXzTx2yLVY/vTEHBi+rWfudOPTvxNU5zJRHC0FoGAxZ75vU
	+xuWimaU78twk2OgauUJYyZ3sEoTyAktHHAbgPzPjeH0AE2IH7CsAqvctkNEydFTbEKJh/zxvoy
	IxXI7IiXmFys/FN1E7tzjO5oClzQyqRm5RULa8Io1qlrwyQWTCI1Eq581JQgx3zV24lcjcmPWWX
	kikSxTaPOTLEFnqUcWvMN+21IDoa5pGA5CI5FC+fT2UT8RhZkF+mX8FTwctUXa7Ppc=
X-Google-Smtp-Source: AGHT+IF/Xw9nkDZk1ywDDDE/IVmeebeNSqZlflHTjUOVoey3KkVwbF4xhORQCkJpHXMzlcnEBQFmaw==
X-Received: by 2002:a17:906:ef09:b0:aab:71fc:47a3 with SMTP id a640c23a62f3a-ab2abda708dmr260798666b.60.1736346638763;
        Wed, 08 Jan 2025 06:30:38 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Tim Deegan <tim@xen.org>
Subject: [PATCH v2 14/18] x86/mm: introduce per-vCPU L3 page-table
Date: Wed,  8 Jan 2025 15:26:54 +0100
Message-ID: <20250108142659.99490-15-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250108142659.99490-1-roger.pau@citrix.com>
References: <20250108142659.99490-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Such table is to be used in the per-domain slot when running with Address Space
Isolation enabled for the domain.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/domain.h |  3 +++
 xen/arch/x86/include/asm/mm.h     |  2 +-
 xen/arch/x86/mm.c                 | 45 ++++++++++++++++++++++---------
 xen/arch/x86/mm/hap/hap.c         |  2 +-
 xen/arch/x86/mm/shadow/hvm.c      |  2 +-
 xen/arch/x86/mm/shadow/multi.c    |  2 +-
 xen/arch/x86/pv/dom0_build.c      |  2 +-
 xen/arch/x86/pv/domain.c          |  2 +-
 8 files changed, 41 insertions(+), 19 deletions(-)

diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index fb92a10bf3b7..5bf0ad3fdcf7 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -666,6 +666,9 @@ struct arch_vcpu
 
     struct vcpu_msrs *msrs;
 
+    /* ASI: per-vCPU L3 table to use in the L4 per-domain slot. */
+    struct page_info *pervcpu_l3_pg;
+
     struct {
         bool next_interrupt_enabled;
     } monitor;
diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index f501e5e115ff..f79d1594fde4 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -375,7 +375,7 @@ int devalidate_page(struct page_info *page, unsigned long type,
 
 void init_xen_pae_l2_slots(l2_pgentry_t *l2t, const struct domain *d);
 void init_xen_l4_slots(l4_pgentry_t *l4t, mfn_t l4mfn,
-                       const struct domain *d, mfn_t sl4mfn, bool ro_mpt);
+                       const struct vcpu *v, mfn_t sl4mfn, bool ro_mpt);
 bool fill_ro_mpt(mfn_t mfn);
 void zap_ro_mpt(mfn_t mfn);
 
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 49403196d56e..583bf4c58bf9 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -1658,8 +1658,9 @@ static int promote_l3_table(struct page_info *page)
  * extended directmap.
  */
 void init_xen_l4_slots(l4_pgentry_t *l4t, mfn_t l4mfn,
-                       const struct domain *d, mfn_t sl4mfn, bool ro_mpt)
+                       const struct vcpu *v, mfn_t sl4mfn, bool ro_mpt)
 {
+    const struct domain *d = v->domain;
     /*
      * PV vcpus need a shortened directmap.  HVM and Idle vcpus get the full
      * directmap.
@@ -1687,7 +1688,9 @@ void init_xen_l4_slots(l4_pgentry_t *l4t, mfn_t l4mfn,
 
     /* Slot 260: Per-domain mappings. */
     l4t[l4_table_offset(PERDOMAIN_VIRT_START)] =
-        l4e_from_page(d->arch.perdomain_l3_pg, __PAGE_HYPERVISOR_RW);
+        l4e_from_page(d->arch.vcpu_pt ? v->arch.pervcpu_l3_pg
+                                      : d->arch.perdomain_l3_pg,
+                      __PAGE_HYPERVISOR_RW);
 
     /* Slot 4: Per-domain mappings mirror. */
     BUILD_BUG_ON(IS_ENABLED(CONFIG_PV32) &&
@@ -1842,8 +1845,15 @@ static int promote_l4_table(struct page_info *page)
 
     if ( !rc )
     {
+        /*
+         * Use vCPU#0 unconditionally.  When not running with ASI enabled the
+         * per-domain table is shared between all vCPUs, so it doesn't matter
+         * which vCPU gets passed to init_xen_l4_slots().  When running with
+         * ASI enabled this L4 will not be used, as a shadow per-vCPU L4 is
+         * used instead.
+         */
         init_xen_l4_slots(pl4e, l4mfn,
-                          d, INVALID_MFN, VM_ASSIST(d, m2p_strict));
+                          d->vcpu[0], INVALID_MFN, VM_ASSIST(d, m2p_strict));
         atomic_inc(&d->arch.pv.nr_l4_pages);
     }
     unmap_domain_page(pl4e);
@@ -6313,14 +6323,17 @@ int create_perdomain_mapping(struct vcpu *v, unsigned long va,
     ASSERT(va >= PERDOMAIN_VIRT_START &&
            va < PERDOMAIN_VIRT_SLOT(PERDOMAIN_SLOTS));
 
-    if ( !d->arch.perdomain_l3_pg )
+    if ( !v->arch.pervcpu_l3_pg && !d->arch.perdomain_l3_pg )
     {
         pg = alloc_domheap_page(d, MEMF_no_owner);
         if ( !pg )
             return -ENOMEM;
         l3tab = __map_domain_page(pg);
         clear_page(l3tab);
-        d->arch.perdomain_l3_pg = pg;
+        if ( d->arch.vcpu_pt )
+            v->arch.pervcpu_l3_pg = pg;
+        else
+            d->arch.perdomain_l3_pg = pg;
         if ( !nr )
         {
             unmap_domain_page(l3tab);
@@ -6330,7 +6343,8 @@ int create_perdomain_mapping(struct vcpu *v, unsigned long va,
     else if ( !nr )
         return 0;
     else
-        l3tab = __map_domain_page(d->arch.perdomain_l3_pg);
+        l3tab = __map_domain_page(d->arch.vcpu_pt ? v->arch.pervcpu_l3_pg
+                                                  : d->arch.perdomain_l3_pg);
 
     ASSERT(!l3_table_offset(va ^ (va + nr * PAGE_SIZE - 1)));
 
@@ -6436,8 +6450,9 @@ void populate_perdomain_mapping(const struct vcpu *v, unsigned long va,
         return;
     }
 
-    ASSERT(d->arch.perdomain_l3_pg);
-    l3tab = __map_domain_page(d->arch.perdomain_l3_pg);
+    ASSERT(d->arch.perdomain_l3_pg || v->arch.pervcpu_l3_pg);
+    l3tab = __map_domain_page(d->arch.vcpu_pt ? v->arch.pervcpu_l3_pg
+                                              : d->arch.perdomain_l3_pg);
 
     if ( unlikely(!(l3e_get_flags(l3tab[l3_table_offset(va)]) &
                     _PAGE_PRESENT)) )
@@ -6498,7 +6513,7 @@ void destroy_perdomain_mapping(const struct vcpu *v, unsigned long va,
            va < PERDOMAIN_VIRT_SLOT(PERDOMAIN_SLOTS));
     ASSERT(!nr || !l3_table_offset(va ^ (va + nr * PAGE_SIZE - 1)));
 
-    if ( !d->arch.perdomain_l3_pg )
+    if ( !d->arch.perdomain_l3_pg && !v->arch.pervcpu_l3_pg )
         return;
 
     /* Use likely to force the optimization for the fast path. */
@@ -6522,7 +6537,8 @@ void destroy_perdomain_mapping(const struct vcpu *v, unsigned long va,
         return;
     }
 
-    l3tab = __map_domain_page(d->arch.perdomain_l3_pg);
+    l3tab = __map_domain_page(d->arch.vcpu_pt ? v->arch.pervcpu_l3_pg
+                                              : d->arch.perdomain_l3_pg);
     pl3e = l3tab + l3_table_offset(va);
 
     if ( l3e_get_flags(*pl3e) & _PAGE_PRESENT )
@@ -6567,10 +6583,11 @@ void free_perdomain_mappings(struct vcpu *v)
     l3_pgentry_t *l3tab;
     unsigned int i;
 
-    if ( !d->arch.perdomain_l3_pg )
+    if ( !v->arch.pervcpu_l3_pg && !d->arch.perdomain_l3_pg )
         return;
 
-    l3tab = __map_domain_page(d->arch.perdomain_l3_pg);
+    l3tab = __map_domain_page(d->arch.vcpu_pt ? v->arch.pervcpu_l3_pg
+                                              : d->arch.perdomain_l3_pg);
 
     for ( i = 0; i < PERDOMAIN_SLOTS; ++i)
         if ( l3e_get_flags(l3tab[i]) & _PAGE_PRESENT )
@@ -6604,8 +6621,10 @@ void free_perdomain_mappings(struct vcpu *v)
         }
 
     unmap_domain_page(l3tab);
-    free_domheap_page(d->arch.perdomain_l3_pg);
+    free_domheap_page(d->arch.vcpu_pt ? v->arch.pervcpu_l3_pg
+                                      : d->arch.perdomain_l3_pg);
     d->arch.perdomain_l3_pg = NULL;
+    v->arch.pervcpu_l3_pg = NULL;
 }
 
 static void write_sss_token(unsigned long *ptr)
diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index ec5043a8aa9e..c7d9bf7c71bf 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -402,7 +402,7 @@ static mfn_t hap_make_monitor_table(struct vcpu *v)
     m4mfn = page_to_mfn(pg);
     l4e = map_domain_page(m4mfn);
 
-    init_xen_l4_slots(l4e, m4mfn, d, INVALID_MFN, false);
+    init_xen_l4_slots(l4e, m4mfn, v, INVALID_MFN, false);
     unmap_domain_page(l4e);
 
     return m4mfn;
diff --git a/xen/arch/x86/mm/shadow/hvm.c b/xen/arch/x86/mm/shadow/hvm.c
index 114957a3e1ec..d588dbbae003 100644
--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -776,7 +776,7 @@ mfn_t sh_make_monitor_table(const struct vcpu *v, unsigned int shadow_levels)
      * shadow-linear mapping will either be inserted below when creating
      * lower level monitor tables, or later in sh_update_cr3().
      */
-    init_xen_l4_slots(l4e, m4mfn, d, INVALID_MFN, false);
+    init_xen_l4_slots(l4e, m4mfn, v, INVALID_MFN, false);
 
     if ( shadow_levels < 4 )
     {
diff --git a/xen/arch/x86/mm/shadow/multi.c b/xen/arch/x86/mm/shadow/multi.c
index 10ddc408ff73..a1f8147e197a 100644
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -973,7 +973,7 @@ sh_make_shadow(struct vcpu *v, mfn_t gmfn, u32 shadow_type)
 
             BUILD_BUG_ON(sizeof(l4_pgentry_t) != sizeof(shadow_l4e_t));
 
-            init_xen_l4_slots(l4t, gmfn, d, smfn, (!is_pv_32bit_domain(d) &&
+            init_xen_l4_slots(l4t, gmfn, v, smfn, (!is_pv_32bit_domain(d) &&
                                                    VM_ASSIST(d, m2p_strict)));
             unmap_domain_page(l4t);
         }
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index f54d1da5c6f4..5081c19b9a9a 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -737,7 +737,7 @@ static int __init dom0_construct(struct boot_info *bi, struct domain *d)
         l4start = l4tab = __va(mpt_alloc); mpt_alloc += PAGE_SIZE;
         clear_page(l4tab);
         init_xen_l4_slots(l4tab, _mfn(virt_to_mfn(l4start)),
-                          d, INVALID_MFN, true);
+                          d->vcpu[0], INVALID_MFN, true);
         v->arch.guest_table = pagetable_from_paddr(__pa(l4start));
     }
     else
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index 5bda168eadff..8d2428051607 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -125,7 +125,7 @@ static int setup_compat_l4(struct vcpu *v)
     mfn = page_to_mfn(pg);
     l4tab = map_domain_page(mfn);
     clear_page(l4tab);
-    init_xen_l4_slots(l4tab, mfn, v->domain, INVALID_MFN, false);
+    init_xen_l4_slots(l4tab, mfn, v, INVALID_MFN, false);
     unmap_domain_page(l4tab);
 
     /* This page needs to look like a pagetable so that it can be shadowed */
-- 
2.46.0


