Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC599C3F58
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 14:12:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833744.1249038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAUDO-0002Pq-BC; Mon, 11 Nov 2024 13:12:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833744.1249038; Mon, 11 Nov 2024 13:12:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAUDO-0002HD-4T; Mon, 11 Nov 2024 13:12:22 +0000
Received: by outflank-mailman (input) for mailman id 833744;
 Mon, 11 Nov 2024 13:12:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=//j0=SG=amazon.co.uk=prvs=038d26d0c=eliasely@srs-se1.protection.inumbo.net>)
 id 1tAUDM-0007pD-Ki
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 13:12:20 +0000
Received: from smtp-fw-80009.amazon.com (smtp-fw-80009.amazon.com
 [99.78.197.220]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 926adfa4-a02e-11ef-99a3-01e77a169b0f;
 Mon, 11 Nov 2024 14:12:17 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.25.36.210])
 by smtp-border-fw-80009.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 13:12:14 +0000
Received: from EX19MTAUEA001.ant.amazon.com [10.0.44.209:9713]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.28.135:2525]
 with esmtp (Farcaster)
 id 48b4a276-1a66-4074-bd7b-085f57bc54d0; Mon, 11 Nov 2024 13:12:14 +0000 (UTC)
Received: from EX19D008UEA004.ant.amazon.com (10.252.134.191) by
 EX19MTAUEA001.ant.amazon.com (10.252.134.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Mon, 11 Nov 2024 13:12:10 +0000
Received: from EX19MTAUWA001.ant.amazon.com (10.250.64.204) by
 EX19D008UEA004.ant.amazon.com (10.252.134.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Mon, 11 Nov 2024 13:12:10 +0000
Received: from email-imr-corp-prod-pdx-all-2b-5ec155c2.us-west-2.amazon.com
 (10.25.36.214) by mail-relay.amazon.com (10.250.64.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1258.34 via Frontend Transport; Mon, 11 Nov 2024 13:12:10 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com [10.253.91.118])
 by email-imr-corp-prod-pdx-all-2b-5ec155c2.us-west-2.amazon.com (Postfix) with
 ESMTPS id 5C20A42133; Mon, 11 Nov 2024 13:12:09 +0000 (UTC)
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
X-Inumbo-ID: 926adfa4-a02e-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6Ijk5Ljc4LjE5Ny4yMjAiLCJoZWxvIjoic210cC1mdy04MDAwOS5hbWF6b24uY29tIn0=
X-Custom-Transaction: eyJpZCI6IjkyNmFkZmE0LWEwMmUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMzMwNzM3LjU3NDgwMSwic2VuZGVyIjoicHJ2cz0wMzhkMjZkMGM9ZWxpYXNlbHlAYW1hem9uLmNvLnVrIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1731330737; x=1762866737;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NbnwLhZKUKoYnkTOzveP1+7G4/9UJh8Fxdfo/6vpj1s=;
  b=ovX13qpUSVTyHFLvS6DgQbqszCqxznh/8OmWV0I1x4M9ggK+s6glj5Uz
   jFFQKNGjQJTXseuHz61eTilBrTx2Lp9kG00VVTYZoDq+yxN07GE+sUStO
   B4cBqyE83v2KU5iqI+hXLcU6a3hb3Kjd1n+uneOA/7K+Edevp3gaGszEe
   c=;
X-IronPort-AV: E=Sophos;i="6.12,145,1728950400"; 
   d="scan'208";a="146255449"
X-Farcaster-Flow-ID: 48b4a276-1a66-4074-bd7b-085f57bc54d0
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Hongyan Xia
	<hongyxia@amazon.com>, Julien Grall <jgrall@amazon.com>, Elias El Yandouzi
	<eliasely@amazon.com>
Subject: [PATCH V4 11/15] x86/setup: Do not create valid mappings when directmap=no
Date: Mon, 11 Nov 2024 13:11:44 +0000
Message-ID: <20241111131148.52568-12-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241111131148.52568-1-eliasely@amazon.com>
References: <20241111131148.52568-1-eliasely@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Hongyan Xia <hongyxia@amazon.com>

Create empty mappings in the second e820 pass. Also, destroy existing
direct map mappings created in the first pass.

To make xenheap pages visible in guests, it is necessary to create empty
L3 tables in the direct map even when directmap=no, since guest cr3s
copy idle domain's L4 entries, which means they will share mappings in
the direct map if we pre-populate idle domain's L4 entries and L3
tables. A helper is introduced for this.

Also, after the direct map is actually gone, we need to stop updating
the direct map in update_xen_mappings().

Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 4e258419ac34..1633ed0302b1 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1022,6 +1022,56 @@ static struct domain *__init create_dom0(const module_t *image,
     return d;
 }
 
+/*
+ * This either populates a valid direct map, or allocates empty L3 tables and
+ * creates the L4 entries for virtual address between [start, end) in the
+ * direct map depending on has_directmap();
+ *
+ * When directmap=no, we still need to populate empty L3 tables in the
+ * direct map region. The reason is that on-demand xenheap mappings are
+ * created in the idle domain's page table but must be seen by
+ * everyone. Since all domains share the direct map L4 entries, they
+ * will share xenheap mappings if we pre-populate the L4 entries and L3
+ * tables in the direct map region for all RAM. We also rely on the fact
+ * that L3 tables are never freed.
+ */
+static void __init populate_directmap(paddr_t pstart, paddr_t pend,
+                                      unsigned int flags)
+{
+    unsigned long vstart = (unsigned long)__va(pstart);
+    unsigned long vend = (unsigned long)__va(pend);
+
+    if ( pstart >= pend )
+        return;
+
+    BUG_ON(vstart < DIRECTMAP_VIRT_START);
+    BUG_ON(vend > DIRECTMAP_VIRT_END);
+
+    if ( has_directmap() )
+        /* Populate valid direct map. */
+        BUG_ON(map_pages_to_xen(vstart, maddr_to_mfn(pstart),
+                                PFN_DOWN(pend - pstart), flags));
+    else
+    {
+        /* Create empty L3 tables. */
+        unsigned long vaddr = vstart & ~((1UL << L4_PAGETABLE_SHIFT) - 1);
+
+        for ( unsigned long idx = l4_table_offset(vaddr);
+              idx <= l4_table_offset(vend); idx++ )
+        {
+            l4_pgentry_t *pl4e = &idle_pg_table[l4_table_offset(idx)];
+
+            if ( !(l4e_get_flags(*pl4e) & _PAGE_PRESENT) )
+            {
+                mfn_t mfn = alloc_boot_pages(1, 1);
+
+                clear_domain_page(mfn);
+                l4e_write(pl4e, l4e_from_mfn(mfn, __PAGE_HYPERVISOR));
+            }
+        }
+    }
+}
+
 /* How much of the directmap is prebuilt at compile time. */
 #define PREBUILT_MAP_LIMIT (1 << L2_PAGETABLE_SHIFT)
 
@@ -1670,8 +1720,17 @@ void asmlinkage __init noreturn __start_xen(void)
         map_e = min_t(uint64_t, e,
                       ARRAY_SIZE(l2_directmap) << L2_PAGETABLE_SHIFT);
 
-        /* Pass mapped memory to allocator /before/ creating new mappings. */
+        /*
+         * Pass mapped memory to allocator /before/ creating new mappings.
+         * The direct map for the bottom 4GiB has been populated in the first
+         * e820 pass. In the second pass, we make sure those existing mappings
+         * are destroyed when directmap=no.
+         */
         init_boot_pages(s, min(map_s, e));
+        if ( !has_directmap() )
+            destroy_xen_mappings((unsigned long)__va(s),
+                                 (unsigned long)__va(min(map_s, e)));
+
         s = map_s;
         if ( s < map_e )
         {
@@ -1679,6 +1738,9 @@ void asmlinkage __init noreturn __start_xen(void)
             map_s = (s + mask) & ~mask;
             map_e &= ~mask;
             init_boot_pages(map_s, map_e);
+            if ( !has_directmap() )
+                destroy_xen_mappings((unsigned long)__va(map_s),
+                                     (unsigned long)__va(map_e));
         }
 
         if ( map_s > map_e )
@@ -1692,8 +1754,7 @@ void asmlinkage __init noreturn __start_xen(void)
 
             if ( map_e < end )
             {
-                map_pages_to_xen((unsigned long)__va(map_e), maddr_to_mfn(map_e),
-                                 PFN_DOWN(end - map_e), PAGE_HYPERVISOR);
+                populate_directmap(map_e, end, PAGE_HYPERVISOR);
                 init_boot_pages(map_e, end);
                 map_e = end;
             }
@@ -1702,13 +1763,11 @@ void asmlinkage __init noreturn __start_xen(void)
         {
             /* This range must not be passed to the boot allocator and
              * must also not be mapped with _PAGE_GLOBAL. */
-            map_pages_to_xen((unsigned long)__va(map_e), maddr_to_mfn(map_e),
-                             PFN_DOWN(e - map_e), __PAGE_HYPERVISOR_RW);
+            populate_directmap(map_e, e, __PAGE_HYPERVISOR_RW);
         }
         if ( s < map_s )
         {
-            map_pages_to_xen((unsigned long)__va(s), maddr_to_mfn(s),
-                             PFN_DOWN(map_s - s), PAGE_HYPERVISOR);
+            populate_directmap(s, map_s, PAGE_HYPERVISOR);
             init_boot_pages(s, map_s);
         }
     }
-- 
2.40.1


