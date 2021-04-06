Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F0135518E
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 13:06:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.105805.202431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTjXS-0004Vu-RC; Tue, 06 Apr 2021 11:06:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105805.202431; Tue, 06 Apr 2021 11:06:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTjXS-0004Ul-Kp; Tue, 06 Apr 2021 11:06:30 +0000
Received: by outflank-mailman (input) for mailman id 105805;
 Tue, 06 Apr 2021 11:06:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>) id 1lTjXQ-0004RG-LP
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 11:06:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1lTjXQ-00053V-FM; Tue, 06 Apr 2021 11:06:28 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=ua82172827c7b5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1lTjXQ-0002qD-35; Tue, 06 Apr 2021 11:06:28 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:References:In-Reply-To:Message-Id:
	Date:Subject:Cc:To:From; bh=LFpwvb91UZUoU14PzilixiyXhwhbK+Ssko2aEV8OspU=; b=d
	tCkrh5Em0heROtY5F1o8msjHHMg4VJGceKwrKAfMdczs1c89z/qDBPzgak9d8od/844cCrLIfAx6C
	yGHve5ntFf3TfLz2dVb8jxEjowz0XkqOTXHh3rSPHzH5vzMV+ywXpvmBr2652xRGQB9gOdFd62I9M
	FSbtyBrcttub7geE=;
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Cc: jgrall@amazon.com,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v9 07/13] efi: use new page table APIs in copy_mapping
Date: Tue,  6 Apr 2021 12:05:55 +0100
Message-Id: <7acd46b563df7c684342a467de1b703be1366a74.1617706782.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617706782.git.hongyxia@amazon.com>
References: <cover.1617706782.git.hongyxia@amazon.com>
In-Reply-To: <cover.1617706782.git.hongyxia@amazon.com>
References: <cover.1617706782.git.hongyxia@amazon.com>

From: Wei Liu <wei.liu2@citrix.com>

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>

---
Changed in v8:
- remove redundant commit message.
- unmap l3src based on va instead of mfn.
- re-structure if condition around l3dst.

Changed in v7:
- hoist l3 variables out of the loop to avoid repetitive mappings.
---
 xen/common/efi/boot.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 63e289ab8506..64b319d0013b 100644
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
@@ -1439,29 +1440,42 @@ static __init void copy_mapping(unsigned long mfn, unsigned long end,
                                                  unsigned long emfn))
 {
     unsigned long next;
+    l3_pgentry_t *l3src = NULL, *l3dst = NULL;
 
     for ( ; mfn < end; mfn = next )
     {
         l4_pgentry_t l4e = efi_l4_pgtable[l4_table_offset(mfn << PAGE_SHIFT)];
-        l3_pgentry_t *l3src, *l3dst;
         unsigned long va = (unsigned long)mfn_to_virt(mfn);
 
+        if ( !(mfn & ((1UL << (L4_PAGETABLE_SHIFT - PAGE_SHIFT)) - 1)) )
+            UNMAP_DOMAIN_PAGE(l3dst);
+        if ( !(va & ((1UL << L4_PAGETABLE_SHIFT) - 1)) )
+            UNMAP_DOMAIN_PAGE(l3src);
         next = mfn + (1UL << (L3_PAGETABLE_SHIFT - PAGE_SHIFT));
         if ( !is_valid(mfn, min(next, end)) )
             continue;
-        if ( !(l4e_get_flags(l4e) & _PAGE_PRESENT) )
+
+        if ( l3dst )
+            /* nothing */;
+        else if ( !(l4e_get_flags(l4e) & _PAGE_PRESENT) )
         {
-            l3dst = alloc_xen_pagetable();
+            mfn_t l3mfn;
+
+            l3dst = alloc_map_clear_xen_pt(&l3mfn);
             BUG_ON(!l3dst);
-            clear_page(l3dst);
             efi_l4_pgtable[l4_table_offset(mfn << PAGE_SHIFT)] =
-                l4e_from_paddr(virt_to_maddr(l3dst), __PAGE_HYPERVISOR);
+                l4e_from_mfn(l3mfn, __PAGE_HYPERVISOR);
         }
         else
-            l3dst = l4e_to_l3e(l4e);
-        l3src = l4e_to_l3e(idle_pg_table[l4_table_offset(va)]);
+            l3dst = map_l3t_from_l4e(l4e);
+
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
2.23.3


