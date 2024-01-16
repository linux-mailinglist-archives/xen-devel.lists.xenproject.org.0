Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 230A082F4AF
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 19:52:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667958.1039734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPoXh-00054g-D8; Tue, 16 Jan 2024 18:52:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667958.1039734; Tue, 16 Jan 2024 18:52:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPoXh-00052O-9Z; Tue, 16 Jan 2024 18:52:09 +0000
Received: by outflank-mailman (input) for mailman id 667958;
 Tue, 16 Jan 2024 18:52:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wmx9=I2=amazon.co.uk=prvs=738631f0b=eliasely@srs-se1.protection.inumbo.net>)
 id 1rPoXf-0003xp-Vg
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 18:52:07 +0000
Received: from smtp-fw-52004.amazon.com (smtp-fw-52004.amazon.com
 [52.119.213.154]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57915316-b4a0-11ee-9b0f-b553b5be7939;
 Tue, 16 Jan 2024 19:52:06 +0100 (CET)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-iad-1d-m6i4x-b404fda3.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-52004.iad7.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 18:52:05 +0000
Received: from smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev
 (iad7-ws-svc-p70-lb3-vlan3.iad.amazon.com [10.32.235.38])
 by email-inbound-relay-iad-1d-m6i4x-b404fda3.us-east-1.amazon.com (Postfix)
 with ESMTPS id 1869880D88; Tue, 16 Jan 2024 18:52:03 +0000 (UTC)
Received: from EX19MTAUEC001.ant.amazon.com [10.0.44.209:38504]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.95.118:2525]
 with esmtp (Farcaster)
 id ad726f4a-3b94-4479-8df0-0904c57dc3d8; Tue, 16 Jan 2024 18:52:02 +0000 (UTC)
Received: from EX19D008UEA001.ant.amazon.com (10.252.134.62) by
 EX19MTAUEC001.ant.amazon.com (10.252.135.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 18:51:50 +0000
Received: from EX19MTAUWB001.ant.amazon.com (10.250.64.248) by
 EX19D008UEA001.ant.amazon.com (10.252.134.62) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 18:51:49 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (10.253.91.118) by mail-relay.amazon.com (10.250.64.254) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Tue, 16 Jan 2024 18:51:48 +0000
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
X-Inumbo-ID: 57915316-b4a0-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1705431126; x=1736967126;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DFq2dA1Yv5iX6XPtrbHhlSvMP8eVQGNEuxktAlGi9eU=;
  b=t+pOHan5mvObSCvx7BmNh42+O5ktxbplcj27g6LTbpZLrwTf4PwUXfBc
   NZZoszUsTmzwslP03NzrE69wFf3TvjTODEUIEsInsBcHSPtjUKuLCGJVW
   0sg55A3bTHBZOdaSktNLAw6FdANA2IrRkgKNo8jL6dE2tm5iyZOtDeJGP
   8=;
X-IronPort-AV: E=Sophos;i="6.05,200,1701129600"; 
   d="scan'208";a="178391950"
X-Farcaster-Flow-ID: ad726f4a-3b94-4479-8df0-0904c57dc3d8
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Hongyan Xia
	<hongyxia@amazon.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Julien Grall
	<jgrall@amazon.com>, Elias El Yandouzi <eliasely@amazon.com>
Subject: [PATCH v2] x86/pv: Rewrite how building PV dom0 handles domheap mappings
Date: Tue, 16 Jan 2024 18:50:38 +0000
Message-ID: <20240116185056.15000-10-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240116185056.15000-1-eliasely@amazon.com>
References: <20240116185056.15000-1-eliasely@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: Bulk

From: Hongyan Xia <hongyxia@amazon.com>

Building a PV dom0 is allocating from the domheap but uses it like the
xenheap. Use the pages as they should be.

Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>

----

    Changes in V2:
        * Clarify the commit message
        * Break the patch in two parts

    Changes since Hongyan's version:
        * Rebase
        * Remove spurious newline

diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 5659814e0c..dc5e9fe117 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -382,6 +382,10 @@ int __init dom0_construct_pv(struct domain *d,
     l3_pgentry_t *l3tab = NULL, *l3start = NULL;
     l2_pgentry_t *l2tab = NULL, *l2start = NULL;
     l1_pgentry_t *l1tab = NULL, *l1start = NULL;
+    mfn_t l4start_mfn = INVALID_MFN;
+    mfn_t l3start_mfn = INVALID_MFN;
+    mfn_t l2start_mfn = INVALID_MFN;
+    mfn_t l1start_mfn = INVALID_MFN;
 
     /*
      * This fully describes the memory layout of the initial domain. All
@@ -708,22 +712,32 @@ int __init dom0_construct_pv(struct domain *d,
         v->arch.pv.event_callback_cs    = FLAT_COMPAT_KERNEL_CS;
     }
 
+#define UNMAP_MAP_AND_ADVANCE(mfn_var, virt_var, maddr) \
+do {                                                    \
+    unmap_domain_page(virt_var);                        \
+    mfn_var = maddr_to_mfn(maddr);                      \
+    maddr += PAGE_SIZE;                                 \
+    virt_var = map_domain_page(mfn_var);                \
+} while ( false )
+
     if ( !compat )
     {
         maddr_to_page(mpt_alloc)->u.inuse.type_info = PGT_l4_page_table;
-        l4start = l4tab = __va(mpt_alloc); mpt_alloc += PAGE_SIZE;
+        UNMAP_MAP_AND_ADVANCE(l4start_mfn, l4start, mpt_alloc);
+        l4tab = l4start;
         clear_page(l4tab);
-        init_xen_l4_slots(l4tab, _mfn(virt_to_mfn(l4start)),
-                          d, INVALID_MFN, true);
-        v->arch.guest_table = pagetable_from_paddr(__pa(l4start));
+        init_xen_l4_slots(l4tab, l4start_mfn, d, INVALID_MFN, true);
+        v->arch.guest_table = pagetable_from_mfn(l4start_mfn);
     }
     else
     {
         /* Monitor table already created by switch_compat(). */
-        l4start = l4tab = __va(pagetable_get_paddr(v->arch.guest_table));
+        l4start_mfn = pagetable_get_mfn(v->arch.guest_table);
+        l4start = l4tab = map_domain_page(l4start_mfn);
         /* See public/xen.h on why the following is needed. */
         maddr_to_page(mpt_alloc)->u.inuse.type_info = PGT_l3_page_table;
         l3start = __va(mpt_alloc); mpt_alloc += PAGE_SIZE;
+        UNMAP_MAP_AND_ADVANCE(l3start_mfn, l3start, mpt_alloc);
     }
 
     l4tab += l4_table_offset(v_start);
@@ -733,14 +747,16 @@ int __init dom0_construct_pv(struct domain *d,
         if ( !((unsigned long)l1tab & (PAGE_SIZE-1)) )
         {
             maddr_to_page(mpt_alloc)->u.inuse.type_info = PGT_l1_page_table;
-            l1start = l1tab = __va(mpt_alloc); mpt_alloc += PAGE_SIZE;
+            UNMAP_MAP_AND_ADVANCE(l1start_mfn, l1start, mpt_alloc);
+            l1tab = l1start;
             clear_page(l1tab);
             if ( count == 0 )
                 l1tab += l1_table_offset(v_start);
             if ( !((unsigned long)l2tab & (PAGE_SIZE-1)) )
             {
                 maddr_to_page(mpt_alloc)->u.inuse.type_info = PGT_l2_page_table;
-                l2start = l2tab = __va(mpt_alloc); mpt_alloc += PAGE_SIZE;
+                UNMAP_MAP_AND_ADVANCE(l2start_mfn, l2start, mpt_alloc);
+                l2tab = l2start;
                 clear_page(l2tab);
                 if ( count == 0 )
                     l2tab += l2_table_offset(v_start);
@@ -750,19 +766,19 @@ int __init dom0_construct_pv(struct domain *d,
                     {
                         maddr_to_page(mpt_alloc)->u.inuse.type_info =
                             PGT_l3_page_table;
-                        l3start = __va(mpt_alloc); mpt_alloc += PAGE_SIZE;
+                        UNMAP_MAP_AND_ADVANCE(l3start_mfn, l3start, mpt_alloc);
                     }
                     l3tab = l3start;
                     clear_page(l3tab);
                     if ( count == 0 )
                         l3tab += l3_table_offset(v_start);
-                    *l4tab = l4e_from_paddr(__pa(l3start), L4_PROT);
+                    *l4tab = l4e_from_mfn(l3start_mfn, L4_PROT);
                     l4tab++;
                 }
-                *l3tab = l3e_from_paddr(__pa(l2start), L3_PROT);
+                *l3tab = l3e_from_mfn(l2start_mfn, L3_PROT);
                 l3tab++;
             }
-            *l2tab = l2e_from_paddr(__pa(l1start), L2_PROT);
+            *l2tab = l2e_from_mfn(l1start_mfn, L2_PROT);
             l2tab++;
         }
         if ( count < initrd_pfn || count >= initrd_pfn + PFN_UP(initrd_len) )
@@ -781,30 +797,34 @@ int __init dom0_construct_pv(struct domain *d,
 
     if ( compat )
     {
-        l2_pgentry_t *l2t;
-
         /* Ensure the first four L3 entries are all populated. */
         for ( i = 0, l3tab = l3start; i < 4; ++i, ++l3tab )
         {
             if ( !l3e_get_intpte(*l3tab) )
             {
                 maddr_to_page(mpt_alloc)->u.inuse.type_info = PGT_l2_page_table;
-                l2tab = __va(mpt_alloc); mpt_alloc += PAGE_SIZE;
-                clear_page(l2tab);
-                *l3tab = l3e_from_paddr(__pa(l2tab), L3_PROT);
+                UNMAP_MAP_AND_ADVANCE(l2start_mfn, l2start, mpt_alloc);
+                clear_page(l2start);
+                *l3tab = l3e_from_mfn(l2start_mfn, L3_PROT);
             }
             if ( i == 3 )
                 l3e_get_page(*l3tab)->u.inuse.type_info |= PGT_pae_xen_l2;
         }
 
-        l2t = map_l2t_from_l3e(l3start[3]);
-        init_xen_pae_l2_slots(l2t, d);
-        unmap_domain_page(l2t);
+        init_xen_pae_l2_slots(l2start, d);
     }
 
+#undef UNMAP_MAP_AND_ADVANCE
+
+    UNMAP_DOMAIN_PAGE(l1start);
+    UNMAP_DOMAIN_PAGE(l2start);
+    UNMAP_DOMAIN_PAGE(l3start);
+
     /* Pages that are part of page tables must be read only. */
     mark_pv_pt_pages_rdonly(d, l4start, vpt_start, nr_pt_pages, &flush_flags);
 
+    UNMAP_DOMAIN_PAGE(l4start);
+
     /* Mask all upcalls... */
     for ( i = 0; i < XEN_LEGACY_MAX_VCPUS; i++ )
         shared_info(d, vcpu_info[i].evtchn_upcall_mask) = 1;
-- 
2.40.1


