Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E231B7812
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 16:09:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRz1R-00030I-66; Fri, 24 Apr 2020 14:09:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OF9t=6I=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jRz1P-0002zR-Le
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 14:09:39 +0000
X-Inumbo-ID: 35da7c9e-8635-11ea-94b0-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 35da7c9e-8635-11ea-94b0-12813bfff9fa;
 Fri, 24 Apr 2020 14:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QEgbzBwJFIRd1ScLggvvofYSSDEx2eZQcbh7hVPo+uI=; b=wZarron7xIIzBW7E+eHmwQVMNa
 ViVyFwLfw3guf+v0i57cFEEtYMQWjHElbIxWjU9f0tDb8zbGioYDKi5QP0Lk3Kx2YaS+E3xSgyXNF
 +tzr9+2UFxZpUt78F9Bw8zgTKMxXhy2yjtzO4U+qLTdnr+TxcpeH0O/YZVSS7v3ntIow=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jRz1E-0001hB-6c; Fri, 24 Apr 2020 14:09:28 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jRz1D-0001fN-QH; Fri, 24 Apr 2020 14:09:28 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v6 06/15] x86_64/mm: introduce pl2e in paging_init
Date: Fri, 24 Apr 2020 15:08:57 +0100
Message-Id: <40759ec2fa21e365ad8a59ab0de59b3f7f5fb42a.1587735799.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1587735799.git.hongyxia@amazon.com>
References: <cover.1587735799.git.hongyxia@amazon.com>
In-Reply-To: <cover.1587735799.git.hongyxia@amazon.com>
References: <cover.1587735799.git.hongyxia@amazon.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, julien@xen.org,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Wei Liu <wei.liu2@citrix.com>

Introduce pl2e so that we can use l2_ro_mpt to point to the page table
itself.

No functional change.

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
---
 xen/arch/x86/x86_64/mm.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index 6557255494..35f9de4ad4 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -479,7 +479,7 @@ void __init paging_init(void)
     unsigned long i, mpt_size, va;
     unsigned int n, memflags;
     l3_pgentry_t *l3_ro_mpt;
-    l2_pgentry_t *l2_ro_mpt = NULL;
+    l2_pgentry_t *pl2e = NULL, *l2_ro_mpt = NULL;
     struct page_info *l1_pg;
 
     /*
@@ -529,7 +529,7 @@ void __init paging_init(void)
             (L2_PAGETABLE_SHIFT - 3 + PAGE_SHIFT)));
 
         if ( cpu_has_page1gb &&
-             !((unsigned long)l2_ro_mpt & ~PAGE_MASK) &&
+             !((unsigned long)pl2e & ~PAGE_MASK) &&
              (mpt_size >> L3_PAGETABLE_SHIFT) > (i >> PAGETABLE_ORDER) )
         {
             unsigned int k, holes;
@@ -589,7 +589,7 @@ void __init paging_init(void)
             memset((void *)(RDWR_MPT_VIRT_START + (i << L2_PAGETABLE_SHIFT)),
                    0xFF, 1UL << L2_PAGETABLE_SHIFT);
         }
-        if ( !((unsigned long)l2_ro_mpt & ~PAGE_MASK) )
+        if ( !((unsigned long)pl2e & ~PAGE_MASK) )
         {
             if ( (l2_ro_mpt = alloc_xen_pagetable()) == NULL )
                 goto nomem;
@@ -597,13 +597,14 @@ void __init paging_init(void)
             l3e_write(&l3_ro_mpt[l3_table_offset(va)],
                       l3e_from_paddr(__pa(l2_ro_mpt),
                                      __PAGE_HYPERVISOR_RO | _PAGE_USER));
+            pl2e = l2_ro_mpt;
             ASSERT(!l2_table_offset(va));
         }
         /* NB. Cannot be GLOBAL: guest user mode should not see it. */
         if ( l1_pg )
-            l2e_write(l2_ro_mpt, l2e_from_page(
+            l2e_write(pl2e, l2e_from_page(
                 l1_pg, /*_PAGE_GLOBAL|*/_PAGE_PSE|_PAGE_USER|_PAGE_PRESENT));
-        l2_ro_mpt++;
+        pl2e++;
     }
 #undef CNT
 #undef MFN
@@ -613,6 +614,7 @@ void __init paging_init(void)
         goto nomem;
     compat_idle_pg_table_l2 = l2_ro_mpt;
     clear_page(l2_ro_mpt);
+    pl2e = l2_ro_mpt;
     /* Allocate and map the compatibility mode machine-to-phys table. */
     mpt_size = (mpt_size >> 1) + (1UL << (L2_PAGETABLE_SHIFT - 1));
     if ( mpt_size > RDWR_COMPAT_MPT_VIRT_END - RDWR_COMPAT_MPT_VIRT_START )
@@ -625,7 +627,7 @@ void __init paging_init(void)
              sizeof(*compat_machine_to_phys_mapping))
     BUILD_BUG_ON((sizeof(*frame_table) & ~sizeof(*frame_table)) % \
                  sizeof(*compat_machine_to_phys_mapping));
-    for ( i = 0; i < (mpt_size >> L2_PAGETABLE_SHIFT); i++, l2_ro_mpt++ )
+    for ( i = 0; i < (mpt_size >> L2_PAGETABLE_SHIFT); i++, pl2e++ )
     {
         memflags = MEMF_node(phys_to_nid(i <<
             (L2_PAGETABLE_SHIFT - 2 + PAGE_SHIFT)));
@@ -647,7 +649,7 @@ void __init paging_init(void)
                         (i << L2_PAGETABLE_SHIFT)),
                0xFF, 1UL << L2_PAGETABLE_SHIFT);
         /* NB. Cannot be GLOBAL as the ptes get copied into per-VM space. */
-        l2e_write(l2_ro_mpt, l2e_from_page(l1_pg, _PAGE_PSE|_PAGE_PRESENT));
+        l2e_write(pl2e, l2e_from_page(l1_pg, _PAGE_PSE|_PAGE_PRESENT));
     }
 #undef CNT
 #undef MFN
-- 
2.24.1.AMZN


