Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1CB1E7B64
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 13:12:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jecwL-00051I-7P; Fri, 29 May 2020 11:12:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5BQD=7L=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jecwI-0004za-SZ
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 11:12:38 +0000
X-Inumbo-ID: 45ca6424-a19d-11ea-a898-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 45ca6424-a19d-11ea-a898-12813bfff9fa;
 Fri, 29 May 2020 11:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3ia5t7aD91zFWrOTJLQvEkhVOgAWqDPMpKLXYMNiGwk=; b=Ra9ikO68KYQYeqAnq+j2Xlsf/g
 8OAD12Ek+gVsoc3GOz+FvWIo8S4hn8CYZgyL9JHdANMaa7oq9vklChdegf9wNqGC4RfumGGAHxPCR
 iI/ncl/Uo4MueYV83culpD2rSxvxD4mDctWWnwpPxVMLWZWobWwRffV83EItHPStoZKI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jecw3-00022b-QY; Fri, 29 May 2020 11:12:23 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jecw3-0006tM-Gt; Fri, 29 May 2020 11:12:23 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v7 09/15] efi: use new page table APIs in copy_mapping
Date: Fri, 29 May 2020 12:11:53 +0100
Message-Id: <0259b645c81ecc3879240e30760b0e7641a2b602.1590750232.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590750232.git.hongyxia@amazon.com>
References: <cover.1590750232.git.hongyxia@amazon.com>
In-Reply-To: <cover.1590750232.git.hongyxia@amazon.com>
References: <cover.1590750232.git.hongyxia@amazon.com>
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
Cc: julien@xen.org, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Wei Liu <wei.liu2@citrix.com>

After inspection ARM doesn't have alloc_xen_pagetable so this function
is x86 only, which means it is safe for us to change.

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Hongyan Xia <hongyxia@amazon.com>

---
Changed in v7:
- hoist l3 variables out of the loop to avoid repetitive mappings.
---
 xen/common/efi/boot.c | 34 ++++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index a6f84c945a..2599ae50d2 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -6,6 +6,7 @@
 #include <xen/compile.h>
 #include <xen/ctype.h>
 #include <xen/dmi.h>
+#include <xen/domain_page.h>
 #include <xen/init.h>
 #include <xen/keyhandler.h>
 #include <xen/lib.h>
@@ -1442,29 +1443,42 @@ static __init void copy_mapping(unsigned long mfn, unsigned long end,
                                                  unsigned long emfn))
 {
     unsigned long next;
+    l3_pgentry_t *l3src = NULL, *l3dst = NULL;
 
     for ( ; mfn < end; mfn = next )
     {
         l4_pgentry_t l4e = efi_l4_pgtable[l4_table_offset(mfn << PAGE_SHIFT)];
-        l3_pgentry_t *l3src, *l3dst;
         unsigned long va = (unsigned long)mfn_to_virt(mfn);
 
+        if ( !((mfn << PAGE_SHIFT) & ((1UL << L4_PAGETABLE_SHIFT) - 1)) )
+        {
+            UNMAP_DOMAIN_PAGE(l3src);
+            UNMAP_DOMAIN_PAGE(l3dst);
+        }
         next = mfn + (1UL << (L3_PAGETABLE_SHIFT - PAGE_SHIFT));
         if ( !is_valid(mfn, min(next, end)) )
             continue;
-        if ( !(l4e_get_flags(l4e) & _PAGE_PRESENT) )
+        if ( !l3dst )
         {
-            l3dst = alloc_xen_pagetable();
-            BUG_ON(!l3dst);
-            clear_page(l3dst);
-            efi_l4_pgtable[l4_table_offset(mfn << PAGE_SHIFT)] =
-                l4e_from_paddr(virt_to_maddr(l3dst), __PAGE_HYPERVISOR);
+            if ( !(l4e_get_flags(l4e) & _PAGE_PRESENT) )
+            {
+                mfn_t l3mfn;
+
+                l3dst = alloc_map_clear_xen_pt(&l3mfn);
+                BUG_ON(!l3dst);
+                efi_l4_pgtable[l4_table_offset(mfn << PAGE_SHIFT)] =
+                    l4e_from_mfn(l3mfn, __PAGE_HYPERVISOR);
+            }
+            else
+                l3dst = map_l3t_from_l4e(l4e);
         }
-        else
-            l3dst = l4e_to_l3e(l4e);
-        l3src = l4e_to_l3e(idle_pg_table[l4_table_offset(va)]);
+        if ( !l3src )
+            l3src = map_l3t_from_l4e(idle_pg_table[l4_table_offset(va)]);
         l3dst[l3_table_offset(mfn << PAGE_SHIFT)] = l3src[l3_table_offset(va)];
     }
+
+    unmap_domain_page(l3src);
+    unmap_domain_page(l3dst);
 }
 
 static bool __init ram_range_valid(unsigned long smfn, unsigned long emfn)
-- 
2.24.1.AMZN


