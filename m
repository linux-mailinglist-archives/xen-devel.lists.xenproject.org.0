Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5023D1C088A
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 22:50:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUG8Q-0004QP-8V; Thu, 30 Apr 2020 20:50:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fL57=6O=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jUG8O-0004Q7-SE
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 20:50:16 +0000
X-Inumbo-ID: 2ed536a3-8b24-11ea-9ab3-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2ed536a3-8b24-11ea-9ab3-12813bfff9fa;
 Thu, 30 Apr 2020 20:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3jn+1WoLnrWmwaD8Flpv3LUTCB5BEWlqT9Jy2nqV9e4=; b=NUlVPCW6rftBkpIbssTQnRUstn
 cCBO6ewSmywoum6FKCJ+/2dCwHa79TXlIKq6QdlJMjtGcIKwLgGhXQd3PHJh4EP6SxE++v+0SShBD
 3mY4ZiNRk5HVg8vdBzrirflwkF8xxyA3Eb2NsU2qu9F1qryOEgLRSieWxSo587W1LRKg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jUG8I-0004UZ-KR; Thu, 30 Apr 2020 20:50:10 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jUG3J-0005wj-7Z; Thu, 30 Apr 2020 20:45:01 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 16/16] x86/setup: do not create valid mappings when
 directmap=no
Date: Thu, 30 Apr 2020 21:44:25 +0100
Message-Id: <6e03a111f564366ca4a5d145dde2cd46e757935b.1588278317.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588278317.git.hongyxia@amazon.com>
References: <cover.1588278317.git.hongyxia@amazon.com>
In-Reply-To: <cover.1588278317.git.hongyxia@amazon.com>
References: <cover.1588278317.git.hongyxia@amazon.com>
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
---
 xen/arch/x86/mm.c    |  2 +-
 xen/arch/x86/setup.c | 74 +++++++++++++++++++++++++++++++++++++++-----
 2 files changed, 68 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 64da997764..33b7e3a003 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -798,7 +798,7 @@ static int update_xen_mappings(unsigned long mfn, unsigned int cacheattr)
 
     if ( unlikely(alias) && cacheattr )
         err = map_pages_to_xen(xen_va, _mfn(mfn), 1, 0);
-    if ( !err )
+    if ( arch_has_directmap() && !err )
         err = map_pages_to_xen((unsigned long)mfn_to_virt(mfn), _mfn(mfn), 1,
                      PAGE_HYPERVISOR | cacheattr_to_pte_flags(cacheattr));
     if ( unlikely(alias) && !cacheattr && !err )
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index dbb2ac1c8f..13c37f435b 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -684,6 +684,57 @@ static unsigned int __init copy_bios_e820(struct e820entry *map, unsigned int li
 /* How much of the directmap is prebuilt at compile time. */
 #define PREBUILT_MAP_LIMIT (1 << L2_PAGETABLE_SHIFT)
 
+/*
+ * This either populates a valid direct map, or allocates empty L3 tables and
+ * creates the L4 entries for virtual address between [start, end) in the
+ * direct map depending on arch_has_directmap();
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
+    if ( arch_has_directmap() )
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
 void __init noreturn __start_xen(unsigned long mbi_p)
 {
     char *memmap_type = NULL;
@@ -1366,8 +1417,17 @@ void __init noreturn __start_xen(unsigned long mbi_p)
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
+        if ( !arch_has_directmap() )
+            destroy_xen_mappings((unsigned long)__va(s),
+                                 (unsigned long)__va(min(map_s, e)));
+
         s = map_s;
         if ( s < map_e )
         {
@@ -1376,6 +1436,9 @@ void __init noreturn __start_xen(unsigned long mbi_p)
             map_s = (s + mask) & ~mask;
             map_e &= ~mask;
             init_boot_pages(map_s, map_e);
+            if ( !arch_has_directmap() )
+                destroy_xen_mappings((unsigned long)__va(map_s),
+                                     (unsigned long)__va(map_e));
         }
 
         if ( map_s > map_e )
@@ -1389,8 +1452,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
 
             if ( map_e < end )
             {
-                map_pages_to_xen((unsigned long)__va(map_e), maddr_to_mfn(map_e),
-                                 PFN_DOWN(end - map_e), PAGE_HYPERVISOR);
+                populate_directmap(map_e, end, PAGE_HYPERVISOR);
                 init_boot_pages(map_e, end);
                 map_e = end;
             }
@@ -1399,13 +1461,11 @@ void __init noreturn __start_xen(unsigned long mbi_p)
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
2.24.1.AMZN


