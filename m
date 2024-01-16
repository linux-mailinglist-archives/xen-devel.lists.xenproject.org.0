Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A63E82F508
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 20:08:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668036.1039914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPonl-0001Zj-Qy; Tue, 16 Jan 2024 19:08:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668036.1039914; Tue, 16 Jan 2024 19:08:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPonl-0001Xp-N0; Tue, 16 Jan 2024 19:08:45 +0000
Received: by outflank-mailman (input) for mailman id 668036;
 Tue, 16 Jan 2024 19:08:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wmx9=I2=amazon.co.uk=prvs=738631f0b=eliasely@srs-se1.protection.inumbo.net>)
 id 1rPoXv-0002UD-Mb
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 18:52:23 +0000
Received: from smtp-fw-52004.amazon.com (smtp-fw-52004.amazon.com
 [52.119.213.154]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6127d838-b4a0-11ee-98f1-6d05b1d4d9a1;
 Tue, 16 Jan 2024 19:52:22 +0100 (CET)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-pdx-2a-m6i4x-d47337e0.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-52004.iad7.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 18:52:20 +0000
Received: from smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev
 (pdx2-ws-svc-p26-lb5-vlan3.pdx.amazon.com [10.39.38.70])
 by email-inbound-relay-pdx-2a-m6i4x-d47337e0.us-west-2.amazon.com (Postfix)
 with ESMTPS id BEA5160B82; Tue, 16 Jan 2024 18:52:18 +0000 (UTC)
Received: from EX19MTAUEB002.ant.amazon.com [10.0.44.209:11277]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.41.129:2525]
 with esmtp (Farcaster)
 id 0f1eb0ec-6a7f-4103-a81e-21febc958291; Tue, 16 Jan 2024 18:52:17 +0000 (UTC)
Received: from EX19D008UEA004.ant.amazon.com (10.252.134.191) by
 EX19MTAUEB002.ant.amazon.com (10.252.135.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 18:52:16 +0000
Received: from EX19MTAUWB001.ant.amazon.com (10.250.64.248) by
 EX19D008UEA004.ant.amazon.com (10.252.134.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 18:52:16 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (10.253.91.118) by mail-relay.amazon.com (10.250.64.254) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Tue, 16 Jan 2024 18:52:14 +0000
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
X-Inumbo-ID: 6127d838-b4a0-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1705431142; x=1736967142;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RNtWDehKcdKd51zP4omQpNRTUkQx1O6KgQ+LUko8Hd0=;
  b=ZMNcmy6vt4QoLkqwWiUmDifSacuqbQlnspkwVzGFNrBF/mLt8kM9ilvc
   KG33e24yQpYK/yGaXEo+tou7m6w4V2VlTrW/dnn4qja8JQs7eiQWUqZSL
   SFOvyJiNqMleHHBGpP6pRqeVrCSS+t6PNdiuQmJ/H4dy2s9Z3OdbMEiCK
   4=;
X-IronPort-AV: E=Sophos;i="6.05,200,1701129600"; 
   d="scan'208";a="178391989"
X-Farcaster-Flow-ID: 0f1eb0ec-6a7f-4103-a81e-21febc958291
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Hongyan Xia
	<hongyxia@amazon.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Julien Grall
	<jgrall@amazon.com>, Elias El Yandouzi <eliasely@amazon.com>
Subject: [PATCH v2] x86/setup: Do not create valid mappings when directmap=no
Date: Tue, 16 Jan 2024 18:50:50 +0000
Message-ID: <20240116185056.15000-22-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240116185056.15000-1-eliasely@amazon.com>
References: <20240116185056.15000-1-eliasely@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: Bulk

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
index 3b698c8c41..84c496ac4a 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -976,6 +976,57 @@ static struct domain *__init create_dom0(const module_t *image,
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
@@ -1596,8 +1647,17 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
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
@@ -1605,6 +1665,9 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
             map_s = (s + mask) & ~mask;
             map_e &= ~mask;
             init_boot_pages(map_s, map_e);
+            if ( !has_directmap() )
+                destroy_xen_mappings((unsigned long)__va(map_s),
+                                     (unsigned long)__va(map_e));
         }
 
         if ( map_s > map_e )
@@ -1618,8 +1681,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
             if ( map_e < end )
             {
-                map_pages_to_xen((unsigned long)__va(map_e), maddr_to_mfn(map_e),
-                                 PFN_DOWN(end - map_e), PAGE_HYPERVISOR);
+                populate_directmap(map_e, end, PAGE_HYPERVISOR);
                 init_boot_pages(map_e, end);
                 map_e = end;
             }
@@ -1628,13 +1690,11 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
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


