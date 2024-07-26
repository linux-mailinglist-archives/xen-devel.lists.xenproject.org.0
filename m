Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EF993D628
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 17:32:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765516.1176190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXMv7-000240-PE; Fri, 26 Jul 2024 15:31:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765516.1176190; Fri, 26 Jul 2024 15:31:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXMv7-00020c-Hu; Fri, 26 Jul 2024 15:31:49 +0000
Received: by outflank-mailman (input) for mailman id 765516;
 Fri, 26 Jul 2024 15:31:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bxzg=O2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sXMv5-00084T-D7
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2024 15:31:47 +0000
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [2607:f8b0:4864:20::f2a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a52ccd7-4b64-11ef-8776-851b0ebba9a2;
 Fri, 26 Jul 2024 17:31:45 +0200 (CEST)
Received: by mail-qv1-xf2a.google.com with SMTP id
 6a1803df08f44-6b79c969329so3887046d6.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2024 08:31:45 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb3f8d82a1sm17583836d6.8.2024.07.26.08.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jul 2024 08:31:43 -0700 (PDT)
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
X-Inumbo-ID: 2a52ccd7-4b64-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722007904; x=1722612704; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XVLmi/fkvu4CTYAI+yfb6OgrqWm3rUKjjqk2EK0FSak=;
        b=HbZWYo47BAi0LT/8bPoeBP1TStinvU5gFwLXujMNhmmFvcCwbrhorVNOI6bFM31aM3
         THhS4PiN+60SBBRxgxM/4+gXJYSg7bXefTnnkC/fd8J+6ue23TAmB37yNzOhTDGrOK60
         WKwtWI3wMhbYkU6aTjuz1qxXtC0y40hH2EPp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722007904; x=1722612704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XVLmi/fkvu4CTYAI+yfb6OgrqWm3rUKjjqk2EK0FSak=;
        b=A4SQbz0kW8PmOkn0TbL5DKmSkoUuM/WDdttwu7w0F6YE8JRsB0czuohCb6C04WADT1
         tXIfFB4T3NWaUEGvpxpaLsJ4nHKZYBYimbEveXh1FCc5yWKJpzM0WD1p9yAo0rja0770
         XnTuT0/9igfJKQn5FXw+MMa9+wa2LlqPRyGlz3Ubvjc9Fw2TpEpzrGyuDVod63Fyt5Xq
         NMQnNVSgazpY7zXvHaTNEMvicyOAhuOMdENW+3xsJaTEyiAl6pajfeEWKNSAoWoKmOhY
         x9FJmpMjO4RLO3EDVe7+SUCMg/A+POzn0Nm6DkGj0+oKk8KJdQia5x7XNFobxrMfuCWS
         0QzA==
X-Gm-Message-State: AOJu0YwJQmni7jSEhIXUz2qmLIsqdm3XEMSHMfj21B+NoF3RWcM6EIzt
	gk6fw2H5EHRgzhOkq4en/DAn0QTooKNU8Hgcq07cJdLIVexXPT8XK/kWP/RzIQYVEPSa/QHxldC
	7
X-Google-Smtp-Source: AGHT+IEcufzqkmPcezP4vOETUa2u5a43wCguxoFnd/xXU0ayAqpb2EzoCg4TNkabrtG+7Xer6mXs8Q==
X-Received: by 2002:a05:6214:d6a:b0:6b7:9b14:627b with SMTP id 6a1803df08f44-6bb55ace5bemr1746786d6.40.1722007903998;
        Fri, 26 Jul 2024 08:31:43 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: alejandro.vallejo@cloud.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Tim Deegan <tim@xen.org>
Subject: [PATCH 08/22] x86/mm: avoid passing a domain parameter to L4 init function
Date: Fri, 26 Jul 2024 17:21:52 +0200
Message-ID: <20240726152206.28411-9-roger.pau@citrix.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240726152206.28411-1-roger.pau@citrix.com>
References: <20240726152206.28411-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In preparation for the function being called from contexts where no domain is
present.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/mm.h  |  4 +++-
 xen/arch/x86/mm.c              | 24 +++++++++++++-----------
 xen/arch/x86/mm/hap/hap.c      |  3 ++-
 xen/arch/x86/mm/shadow/hvm.c   |  3 ++-
 xen/arch/x86/mm/shadow/multi.c |  7 +++++--
 xen/arch/x86/pv/dom0_build.c   |  3 ++-
 xen/arch/x86/pv/domain.c       |  3 ++-
 7 files changed, 29 insertions(+), 18 deletions(-)

diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index b3853ae734fa..076e7009dc99 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -375,7 +375,9 @@ int devalidate_page(struct page_info *page, unsigned long type,
 
 void init_xen_pae_l2_slots(l2_pgentry_t *l2t, const struct domain *d);
 void init_xen_l4_slots(l4_pgentry_t *l4t, mfn_t l4mfn,
-                       const struct domain *d, mfn_t sl4mfn, bool ro_mpt);
+                       mfn_t sl4mfn, const struct page_info *perdomain_l3,
+                       bool ro_mpt, bool maybe_compat, bool short_directmap);
+
 bool fill_ro_mpt(mfn_t mfn);
 void zap_ro_mpt(mfn_t mfn);
 
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index a792a300a866..c01b6712143e 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -1645,14 +1645,9 @@ static int promote_l3_table(struct page_info *page)
  * extended directmap.
  */
 void init_xen_l4_slots(l4_pgentry_t *l4t, mfn_t l4mfn,
-                       const struct domain *d, mfn_t sl4mfn, bool ro_mpt)
+                       mfn_t sl4mfn, const struct page_info *perdomain_l3,
+                       bool ro_mpt, bool maybe_compat, bool short_directmap)
 {
-    /*
-     * PV vcpus need a shortened directmap.  HVM and Idle vcpus get the full
-     * directmap.
-     */
-    bool short_directmap = !paging_mode_external(d);
-
     /* Slot 256: RO M2P (if applicable). */
     l4t[l4_table_offset(RO_MPT_VIRT_START)] =
         ro_mpt ? idle_pg_table[l4_table_offset(RO_MPT_VIRT_START)]
@@ -1673,13 +1668,14 @@ void init_xen_l4_slots(l4_pgentry_t *l4t, mfn_t l4mfn,
         l4e_from_mfn(sl4mfn, __PAGE_HYPERVISOR_RW);
 
     /* Slot 260: Per-domain mappings. */
-    l4t[l4_table_offset(PERDOMAIN_VIRT_START)] =
-        l4e_from_page(d->arch.perdomain_l3_pg, __PAGE_HYPERVISOR_RW);
+    if ( perdomain_l3 )
+        l4t[l4_table_offset(PERDOMAIN_VIRT_START)] =
+            l4e_from_page(perdomain_l3, __PAGE_HYPERVISOR_RW);
 
     /* Slot 4: Per-domain mappings mirror. */
     BUILD_BUG_ON(IS_ENABLED(CONFIG_PV32) &&
                  !l4_table_offset(PERDOMAIN_ALT_VIRT_START));
-    if ( !is_pv_64bit_domain(d) )
+    if ( perdomain_l3 && maybe_compat )
         l4t[l4_table_offset(PERDOMAIN_ALT_VIRT_START)] =
             l4t[l4_table_offset(PERDOMAIN_VIRT_START)];
 
@@ -1710,6 +1706,10 @@ void init_xen_l4_slots(l4_pgentry_t *l4t, mfn_t l4mfn,
     else
 #endif
     {
+        /*
+         * PV vcpus need a shortened directmap.  HVM and Idle vcpus get the full
+         * directmap.
+         */
         unsigned int slots = (short_directmap
                               ? ROOT_PAGETABLE_PV_XEN_SLOTS
                               : ROOT_PAGETABLE_XEN_SLOTS);
@@ -1830,7 +1830,9 @@ static int promote_l4_table(struct page_info *page)
     if ( !rc )
     {
         init_xen_l4_slots(pl4e, l4mfn,
-                          d, INVALID_MFN, VM_ASSIST(d, m2p_strict));
+                          INVALID_MFN, d->arch.perdomain_l3_pg,
+                          VM_ASSIST(d, m2p_strict), !is_pv_64bit_domain(d),
+                          true);
         atomic_inc(&d->arch.pv.nr_l4_pages);
     }
     unmap_domain_page(pl4e);
diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index d2011fde2462..c8514ca0e917 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -402,7 +402,8 @@ static mfn_t hap_make_monitor_table(struct vcpu *v)
     m4mfn = page_to_mfn(pg);
     l4e = map_domain_page(m4mfn);
 
-    init_xen_l4_slots(l4e, m4mfn, d, INVALID_MFN, false);
+    init_xen_l4_slots(l4e, m4mfn, INVALID_MFN, d->arch.perdomain_l3_pg,
+                      false, true, false);
     unmap_domain_page(l4e);
 
     return m4mfn;
diff --git a/xen/arch/x86/mm/shadow/hvm.c b/xen/arch/x86/mm/shadow/hvm.c
index c16f3b3adf32..93922a71e511 100644
--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -758,7 +758,8 @@ mfn_t sh_make_monitor_table(const struct vcpu *v, unsigned int shadow_levels)
      * shadow-linear mapping will either be inserted below when creating
      * lower level monitor tables, or later in sh_update_cr3().
      */
-    init_xen_l4_slots(l4e, m4mfn, d, INVALID_MFN, false);
+    init_xen_l4_slots(l4e, m4mfn, INVALID_MFN, d->arch.perdomain_l3_pg,
+                      false, true, false);
 
     if ( shadow_levels < 4 )
     {
diff --git a/xen/arch/x86/mm/shadow/multi.c b/xen/arch/x86/mm/shadow/multi.c
index 376f6823cd44..0def0c073ca8 100644
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -973,8 +973,11 @@ sh_make_shadow(struct vcpu *v, mfn_t gmfn, u32 shadow_type)
 
             BUILD_BUG_ON(sizeof(l4_pgentry_t) != sizeof(shadow_l4e_t));
 
-            init_xen_l4_slots(l4t, gmfn, d, smfn, (!is_pv_32bit_domain(d) &&
-                                                   VM_ASSIST(d, m2p_strict)));
+            init_xen_l4_slots(l4t, gmfn, smfn,
+                              d->arch.perdomain_l3_pg,
+                              (!is_pv_32bit_domain(d) &&
+                               VM_ASSIST(d, m2p_strict)),
+                              !is_pv_64bit_domain(d), true);
             unmap_domain_page(l4t);
         }
         break;
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 41772dbe80bf..6a6689f402bb 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -711,7 +711,8 @@ int __init dom0_construct_pv(struct domain *d,
         l4start = l4tab = __va(mpt_alloc); mpt_alloc += PAGE_SIZE;
         clear_page(l4tab);
         init_xen_l4_slots(l4tab, _mfn(virt_to_mfn(l4start)),
-                          d, INVALID_MFN, true);
+                          INVALID_MFN, d->arch.perdomain_l3_pg,
+                          true, !is_pv_64bit_domain(d), true);
         v->arch.guest_table = pagetable_from_paddr(__pa(l4start));
     }
     else
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index 86b74fb372d5..6ff71f14a2f2 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -124,7 +124,8 @@ static int setup_compat_l4(struct vcpu *v)
     mfn = page_to_mfn(pg);
     l4tab = map_domain_page(mfn);
     clear_page(l4tab);
-    init_xen_l4_slots(l4tab, mfn, v->domain, INVALID_MFN, false);
+    init_xen_l4_slots(l4tab, mfn, INVALID_MFN, v->domain->arch.perdomain_l3_pg,
+                      false, true, true);
     unmap_domain_page(l4tab);
 
     /* This page needs to look like a pagetable so that it can be shadowed */
-- 
2.45.2


