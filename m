Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A187922F034
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jul 2020 16:22:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k041f-0007Gl-0O; Mon, 27 Jul 2020 14:22:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wM/5=BG=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1k041c-00075u-Os
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2020 14:22:44 +0000
X-Inumbo-ID: 989d5e54-d014-11ea-a7d9-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 989d5e54-d014-11ea-a7d9-12813bfff9fa;
 Mon, 27 Jul 2020 14:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p+Zha4UMAvAuCQ2vvLKkoAQIt1J/pkiKRu6ISLJk4/g=; b=a+BF/QpCrT3d6dXzIQMg8IhgX5
 cxuYa+p3SMX7YBl6wvl86e4p5d8FHsc5qeauSykhH8NQtQ+Y3m25QQMWX11sceooBuh3HCb557jXa
 rvCUsxJdqpsh2Z7zrfTCWf3VA6Yq9yxTv66UgOEBx2ZF4Gle1y9ZQryQr+8C7ih/KGmw=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1k041K-0001Nr-74; Mon, 27 Jul 2020 14:22:26 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1k041J-0002w6-U2; Mon, 27 Jul 2020 14:22:26 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v8 06/15] x86_64/mm: introduce pl2e in paging_init
Date: Mon, 27 Jul 2020 15:21:56 +0100
Message-Id: <fb7afef3e8af222700761d337ef3d6df11fc0f5f.1595857947.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1595857947.git.hongyxia@amazon.com>
References: <cover.1595857947.git.hongyxia@amazon.com>
In-Reply-To: <cover.1595857947.git.hongyxia@amazon.com>
References: <cover.1595857947.git.hongyxia@amazon.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jgrall@amazon.com,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Wei Liu <wei.liu2@citrix.com>

We will soon map and unmap pages in paging_init(). Introduce pl2e so
that we can use l2_ro_mpt to point to the page table itself.

No functional change.

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>

---
Changed in v7:
- reword commit message.
---
 xen/arch/x86/x86_64/mm.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index 102079a801..243014a119 100644
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
2.16.6


