Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2633A8C4229
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2024 15:41:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720938.1124075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6Vvk-0006xk-JZ; Mon, 13 May 2024 13:41:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720938.1124075; Mon, 13 May 2024 13:41:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6Vvk-0006tD-9p; Mon, 13 May 2024 13:41:28 +0000
Received: by outflank-mailman (input) for mailman id 720938;
 Mon, 13 May 2024 13:41:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w2Lj=MQ=amazon.co.uk=prvs=8568adbc3=eliasely@srs-se1.protection.inumbo.net>)
 id 1s6Vvi-0002zP-2X
 for xen-devel@lists.xenproject.org; Mon, 13 May 2024 13:41:26 +0000
Received: from smtp-fw-80008.amazon.com (smtp-fw-80008.amazon.com
 [99.78.197.219]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d0f6584-112e-11ef-909d-e314d9c70b13;
 Mon, 13 May 2024 15:41:25 +0200 (CEST)
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.25.36.214])
 by smtp-border-fw-80008.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 13:41:21 +0000
Received: from EX19MTAUEC001.ant.amazon.com [10.0.29.78:8777]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.49.39:2525]
 with esmtp (Farcaster)
 id 1f592ada-6af3-40a6-8187-6ef26bab752b; Mon, 13 May 2024 13:41:20 +0000 (UTC)
Received: from EX19D008UEA004.ant.amazon.com (10.252.134.191) by
 EX19MTAUEC001.ant.amazon.com (10.252.135.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 13 May 2024 13:41:18 +0000
Received: from EX19MTAUWB001.ant.amazon.com (10.250.64.248) by
 EX19D008UEA004.ant.amazon.com (10.252.134.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 13 May 2024 13:41:18 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (10.253.91.118) by mail-relay.amazon.com (10.250.64.254) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28 via Frontend Transport; Mon, 13 May 2024 13:41:16 +0000
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
X-Inumbo-ID: 7d0f6584-112e-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1715607685; x=1747143685;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=roZUKjZFy3HRbWFvKqZPI52BDqwj8toyBUHm6ct47Gk=;
  b=P+C5/qpQjrPPVpYCsTGPxC548LmqXHTKl2UNl2J+70YEOwqD+LnQjUhQ
   dPiswTsJ/GCZFkJkpB61nNjzQsROO2LwbPx2zpmYqrq8+rVLpAAlmRG03
   CdyzjyBk0or0SFJ/QA/eYRzpm3XLJjcY5xE7/xHS1BlGXHxqgeSaYOrYW
   w=;
X-IronPort-AV: E=Sophos;i="6.08,158,1712620800"; 
   d="scan'208";a="88768912"
X-Farcaster-Flow-ID: 1f592ada-6af3-40a6-8187-6ef26bab752b
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Hongyan Xia
	<hongyxia@amazon.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Julien Grall <jgrall@amazon.com>, Elias El Yandouzi
	<eliasely@amazon.com>
Subject: [PATCH V3 (resend) 13/19] x86/setup: Do not create valid mappings when directmap=no
Date: Mon, 13 May 2024 13:40:40 +0000
Message-ID: <20240513134046.82605-14-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240513134046.82605-1-eliasely@amazon.com>
References: <20240513134046.82605-1-eliasely@amazon.com>
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
index f26c9799e4..919347d8c2 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -978,6 +978,57 @@ static struct domain *__init create_dom0(const module_t *image,
 /* How much of the directmap is prebuilt at compile time. */
 #define PREBUILT_MAP_LIMIT (1 << L2_PAGETABLE_SHIFT)
 
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
+static void __init populate_directmap(uint64_t pstart, uint64_t pend,
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
+        for ( ; vaddr < vend; vaddr += (1UL << L4_PAGETABLE_SHIFT) )
+        {
+            l4_pgentry_t *pl4e = &idle_pg_table[l4_table_offset(vaddr)];
+
+            if ( !(l4e_get_flags(*pl4e) & _PAGE_PRESENT) )
+            {
+                mfn_t mfn = alloc_boot_pages(1, 1);
+                void *v = map_domain_page(mfn);
+
+                clear_page(v);
+                UNMAP_DOMAIN_PAGE(v);
+                l4e_write(pl4e, l4e_from_mfn(mfn, __PAGE_HYPERVISOR));
+            }
+        }
+    }
+}
+
 void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 {
     const char *memmap_type = NULL, *loader, *cmdline = "";
@@ -1601,8 +1652,17 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
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
@@ -1610,6 +1670,9 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
             map_s = (s + mask) & ~mask;
             map_e &= ~mask;
             init_boot_pages(map_s, map_e);
+            if ( !has_directmap() )
+                destroy_xen_mappings((unsigned long)__va(map_s),
+                                     (unsigned long)__va(map_e));
         }
 
         if ( map_s > map_e )
@@ -1623,8 +1686,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
             if ( map_e < end )
             {
-                map_pages_to_xen((unsigned long)__va(map_e), maddr_to_mfn(map_e),
-                                 PFN_DOWN(end - map_e), PAGE_HYPERVISOR);
+                populate_directmap(map_e, end, PAGE_HYPERVISOR);
                 init_boot_pages(map_e, end);
                 map_e = end;
             }
@@ -1633,13 +1695,11 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
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


