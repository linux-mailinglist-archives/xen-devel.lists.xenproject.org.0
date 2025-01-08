Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A94A4A05FE0
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 16:19:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867481.1279026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVXpr-0000S2-P8; Wed, 08 Jan 2025 15:19:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867481.1279026; Wed, 08 Jan 2025 15:19:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVXpr-0000PX-LP; Wed, 08 Jan 2025 15:19:07 +0000
Received: by outflank-mailman (input) for mailman id 867481;
 Wed, 08 Jan 2025 15:19:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HyFE=UA=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tVXpp-0008Lg-Cp
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 15:19:05 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5a4a2a2-cdd3-11ef-a0df-8be0dac302b0;
 Wed, 08 Jan 2025 16:19:04 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ab2b72fb3c9so123438366b.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 07:19:04 -0800 (PST)
Received: from localhost.localdomain ([66.81.170.107])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0eae71desm2488412166b.89.2025.01.08.07.19.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 07:19:03 -0800 (PST)
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
X-Inumbo-ID: e5a4a2a2-cdd3-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736349544; x=1736954344; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b5kW+L9or4UchYGbtNWwT1tJvUFiadtexJoE68LPlKw=;
        b=U7ARSjPCGO0znmMI9r/qNh4LJXhhHoPd824PeTWz9iG/byXWT2cW06pEUttR8QdncM
         +e8Mm3bcrp3PyK/slRqr/GxIwbMao9BQqE2p3kIl7/0ynk5306BpgmfgZja21IcXXrAg
         FPBzfZysJRa7sxDcjy90jk5B1c4dqf4S4sdFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736349544; x=1736954344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b5kW+L9or4UchYGbtNWwT1tJvUFiadtexJoE68LPlKw=;
        b=uvZr6epX7KHQLAHi19TUDS+49Fgyu4Uq7LT2HONtd+jgfLCESAj5ds9gKo5nLHUWmR
         4PZGlwkRGc4FuIPoWH8ypHtDlkShuzmBbOEDzvaO2s3jUkXP6NPxAOSRfIM7SqDuTOOE
         es+cFfbEzGf6Uuroa8QpK4dUUlqeAzu36dT2gPddlK8KnDrwdR4A578upVIdIMeI23Kt
         Y9vYi8RIFz/DIqD/q2c0xAuxednh4AcRsL+JInB6yhf+lbVXpOwKLlYLPFd0s6iev3Bo
         qXLmDHCmQw29h0KIcfR9QeZ4jSlBK/W7RQwtPvBCAKyGKJ2hO079+Yjn7HhpPHkhE7y7
         CiNw==
X-Gm-Message-State: AOJu0YwaVl4HAK9yTGsJCIa+tD2rdqlVbswyez3vpfuP9/3xi3SX5u8E
	OTxJ2pfR9Z0pYMam+WUg5Kzif2yTXbLY0TgNQTB+v3klid8DqtvUZVN5jblUS+luKrq3RFOHO7b
	dMr8Ltg==
X-Gm-Gg: ASbGncsAEiodk1DlQj9vVBTC1Cuv6zFwVg+zojaVZzhNXgVIqWEuxpNYOXEuryUCBji
	dwg8rzGC2xaCkR842m6EAz2C3pvmFWLkU6IZ/kygSLZNA2cCyQRiOVPw0wrRaxv0HyFpxIQu689
	k7XhePjogVfjTBf/j7t31GFBMzUy62SQ1oL0NzeHLU90RZvi2zLQ+eBx+0tt3ALgpQzH9Qtvyn3
	oBhc/iz/OBMDnfFwgOFydOtc1f88G6IXLyV3WBVT+OpGQfk1dxvOEjdZlic6YlRKd45KdR1vNOd
	yh0=
X-Google-Smtp-Source: AGHT+IHV6oa2te4PnkoUSSr5SDjwRGUrfSPwGyilCbkNwbSum59kdIk8gEKqbOSWy3RmfhUHpU0ykQ==
X-Received: by 2002:a17:907:7f08:b0:aab:9258:488 with SMTP id a640c23a62f3a-ab2904ff9d7mr611013366b.10.1736349543895;
        Wed, 08 Jan 2025 07:19:03 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Hongyan Xia <hongyxia@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julien Grall <jgrall@amazon.com>,
	Elias El Yandouzi <eliasely@amazon.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: [PATCH v5 03/15] x86/pv: Rewrite how building PV dom0 handles domheap mappings
Date: Wed,  8 Jan 2025 15:18:10 +0000
Message-ID: <20250108151822.16030-4-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108151822.16030-1-alejandro.vallejo@cloud.com>
References: <20250108151822.16030-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hongyan Xia <hongyxia@amazon.com>

Building a PV dom0 is allocating from the domheap but uses it like the
xenheap. Use the pages as they should be.

Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>
Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v4->v5:
  * Bugfix: Don't map l4start with a mapcache and unmap with another.
            This is a revert to how it originally was in the series.
            i.e: UNMAP_DOMAIN_PAGE(l4start) before overriding current
                 and then re-mapping on the idle PTs if needed.
  * Simplify UNMAP_MAP_AND_ADVANCE removing the do-while(). It's not
    needed with the ({ x }) expression. Assignments return the
    assigned value, so the last line was not needed either.

v3->v4:
  * Reduce the scope of l{1,2,4}start_mfn variables
  * Make the macro `UNMAP_MAP_AND_ADVANCE` return the new virtual
address

v2->v3:
  * Fold following patch 'x86/pv: Map L4 page table for shim domain'

v1->v2:
  * Clarify the commit message
  * Break the patch in two parts

Changes since Hongyan's version:
  * Rebase
  * Remove spurious newline
---
 xen/arch/x86/pv/dom0_build.c | 61 +++++++++++++++++++++++++-----------
 1 file changed, 42 insertions(+), 19 deletions(-)

diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 08a4534d5c19..649412590e72 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -384,6 +384,8 @@ static int __init dom0_construct(struct boot_info *bi, struct domain *d)
     l3_pgentry_t *l3tab = NULL, *l3start = NULL;
     l2_pgentry_t *l2tab = NULL, *l2start = NULL;
     l1_pgentry_t *l1tab = NULL, *l1start = NULL;
+    mfn_t l3start_mfn = INVALID_MFN;
+    mfn_t l4start_mfn = INVALID_MFN;
 
     /*
      * This fully describes the memory layout of the initial domain. All
@@ -738,22 +740,30 @@ static int __init dom0_construct(struct boot_info *bi, struct domain *d)
         v->arch.pv.event_callback_cs    = FLAT_COMPAT_KERNEL_CS;
     }
 
+#define UNMAP_MAP_AND_ADVANCE(mfn_var, virt_var, maddr) ({  \
+    unmap_domain_page(virt_var);                            \
+    mfn_var = maddr_to_mfn(maddr);                          \
+    maddr += PAGE_SIZE;                                     \
+    virt_var = map_domain_page(mfn_var);                    \
+})
+
     if ( !compat )
     {
         maddr_to_page(mpt_alloc)->u.inuse.type_info = PGT_l4_page_table;
-        l4start = l4tab = __va(mpt_alloc); mpt_alloc += PAGE_SIZE;
+        l4tab = UNMAP_MAP_AND_ADVANCE(l4start_mfn, l4start, mpt_alloc);
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
@@ -762,15 +772,17 @@ static int __init dom0_construct(struct boot_info *bi, struct domain *d)
     {
         if ( !((unsigned long)l1tab & (PAGE_SIZE-1)) )
         {
+            mfn_t l1start_mfn;
             maddr_to_page(mpt_alloc)->u.inuse.type_info = PGT_l1_page_table;
-            l1start = l1tab = __va(mpt_alloc); mpt_alloc += PAGE_SIZE;
+            l1tab = UNMAP_MAP_AND_ADVANCE(l1start_mfn, l1start, mpt_alloc);
             clear_page(l1tab);
             if ( count == 0 )
                 l1tab += l1_table_offset(v_start);
             if ( !((unsigned long)l2tab & (PAGE_SIZE-1)) )
             {
+                mfn_t l2start_mfn;
                 maddr_to_page(mpt_alloc)->u.inuse.type_info = PGT_l2_page_table;
-                l2start = l2tab = __va(mpt_alloc); mpt_alloc += PAGE_SIZE;
+                l2tab = UNMAP_MAP_AND_ADVANCE(l2start_mfn, l2start, mpt_alloc);
                 clear_page(l2tab);
                 if ( count == 0 )
                     l2tab += l2_table_offset(v_start);
@@ -780,19 +792,19 @@ static int __init dom0_construct(struct boot_info *bi, struct domain *d)
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
@@ -811,30 +823,37 @@ static int __init dom0_construct(struct boot_info *bi, struct domain *d)
 
     if ( compat )
     {
-        l2_pgentry_t *l2t;
-
         /* Ensure the first four L3 entries are all populated. */
         for ( i = 0, l3tab = l3start; i < 4; ++i, ++l3tab )
         {
             if ( !l3e_get_intpte(*l3tab) )
             {
+                mfn_t l2start_mfn;
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
+        UNMAP_DOMAIN_PAGE(l2start);
+        l2start = map_l2t_from_l3e(l3start[3]);
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
@@ -1003,8 +1022,12 @@ static int __init dom0_construct(struct boot_info *bi, struct domain *d)
      * !CONFIG_VIDEO case so the logic here can be simplified.
      */
     if ( pv_shim )
+    {
+        l4start = map_domain_page(l4start_mfn);
         pv_shim_setup_dom(d, l4start, v_start, vxenstore_start, vconsole_start,
                           vphysmap_start, si);
+        UNMAP_DOMAIN_PAGE(l4start);
+    }
 
 #ifdef CONFIG_COMPAT
     if ( compat )
-- 
2.47.1


