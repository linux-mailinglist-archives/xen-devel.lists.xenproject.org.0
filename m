Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 677012ED0A2
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jan 2021 14:23:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62891.111553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxVG6-0006bO-UI; Thu, 07 Jan 2021 13:23:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62891.111553; Thu, 07 Jan 2021 13:23:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxVG6-0006b2-Ph; Thu, 07 Jan 2021 13:23:22 +0000
Received: by outflank-mailman (input) for mailman id 62891;
 Thu, 07 Jan 2021 13:23:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mofb=GK=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1kxVG5-0006aw-FD
 for xen-devel@lists.xenproject.org; Thu, 07 Jan 2021 13:23:21 +0000
Received: from mga03.intel.com (unknown [134.134.136.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d259c9a0-0bc4-4eb1-852a-cf6cf2e34b42;
 Thu, 07 Jan 2021 13:23:18 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2021 05:23:16 -0800
Received: from mlupinac-mobl1.amr.corp.intel.com (HELO ubuntu.localdomain)
 ([10.209.25.187])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2021 05:23:15 -0800
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
X-Inumbo-ID: d259c9a0-0bc4-4eb1-852a-cf6cf2e34b42
IronPort-SDR: LJf6MuIw538QlIcDNE8pkuC/Iz64jqftCzbya7dua7B/APgaS9Y1/9bQj4GuseGXsxFN384X1n
 IPXdp8OCr0nw==
X-IronPort-AV: E=McAfee;i="6000,8403,9856"; a="177521183"
X-IronPort-AV: E=Sophos;i="5.79,329,1602572400"; 
   d="scan'208";a="177521183"
IronPort-SDR: TxK5tS4WBIB5J2ovBAmkb79eO7BI+jKY1dNedabkw9QkYj3UP5tmtQYBPPxulJPjVhQM2DFSVC
 oK5y7H3xYs7g==
X-IronPort-AV: E=Sophos;i="5.79,329,1602572400"; 
   d="scan'208";a="398620017"
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2] x86/mem_sharing: Resolve mm-lock order violations when forking VMs with nested p2m
Date: Thu,  7 Jan 2021 05:23:03 -0800
Message-Id: <253be1190a5cdc452611b3741d852d1c7d2bc8d4.1610025394.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several lock-order violations have been encountered while attempting to fork
VMs with nestedhvm=1 set. This patch resolves the issues.

The order violations stems from a call to p2m_flush_nestedp2m being performed
whenever the hostp2m changes. This functions always takes the p2m lock for the
nested_p2m. However, with sharing the p2m locks always have to be taken before
the sharing lock. To resolve this issue we avoid taking the sharing lock where
possible (and was actually unecessary to begin with). But we also make
p2m_flush_nestedp2m aware that the p2m lock may have already been taken and
preemptively take all nested_p2m locks before unsharing a page where taking the
sharing lock is necessary.

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
---
v2: cosmetic fixes
---
 xen/arch/x86/mm/mem_sharing.c | 44 ++++++++++++++++++++++++-----------
 xen/arch/x86/mm/p2m.c         | 12 ++++++++--
 2 files changed, 40 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index fc7b2a4102..ebce11e0e0 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -39,6 +39,7 @@
 #include <asm/event.h>
 #include <asm/hap.h>
 #include <asm/hvm/hvm.h>
+#include <asm/hvm/nestedhvm.h>
 #include <xsm/xsm.h>
 
 #include <public/hvm/params.h>
@@ -893,13 +894,11 @@ static int nominate_page(struct domain *d, gfn_t gfn,
         goto out;
 
     /*
-     * Now that the page is validated, we can lock it. There is no
-     * race because we're holding the p2m entry, so no one else
-     * could be nominating this gfn.
+     * Now that the page is validated, we can make it shared. There is no race
+     * because we're holding the p2m entry, so no one else could be nominating
+     * this gfn & and it is evidently not yet shared with any other VM, thus we
+     * don't need to take the mem_sharing_page_lock here.
      */
-    ret = -ENOENT;
-    if ( !mem_sharing_page_lock(page) )
-        goto out;
 
     /* Initialize the shared state */
     ret = -ENOMEM;
@@ -935,7 +934,6 @@ static int nominate_page(struct domain *d, gfn_t gfn,
 
     *phandle = page->sharing->handle;
     audit_add_list(page);
-    mem_sharing_page_unlock(page);
     ret = 0;
 
 out:
@@ -1214,7 +1212,8 @@ int __mem_sharing_unshare_page(struct domain *d,
     p2m_type_t p2mt;
     mfn_t mfn;
     struct page_info *page, *old_page;
-    int last_gfn;
+    bool last_gfn;
+    int rc = 0;
     gfn_info_t *gfn_info = NULL;
 
     mfn = get_gfn(d, gfn, &p2mt);
@@ -1226,6 +1225,15 @@ int __mem_sharing_unshare_page(struct domain *d,
         return 0;
     }
 
+    /* lock nested p2ms to avoid lock-order violation with sharing lock */
+    if ( unlikely(nestedhvm_enabled(d)) )
+    {
+        unsigned int i;
+
+        for ( i = 0; i < MAX_NESTEDP2M; i++ )
+            p2m_lock(d->arch.nested_p2m[i]);
+    }
+
     page = __grab_shared_page(mfn);
     if ( page == NULL )
     {
@@ -1276,9 +1284,7 @@ int __mem_sharing_unshare_page(struct domain *d,
             put_page_alloc_ref(page);
 
         put_page_and_type(page);
-        put_gfn(d, gfn);
-
-        return 0;
+        goto out;
     }
 
     if ( last_gfn )
@@ -1295,12 +1301,12 @@ int __mem_sharing_unshare_page(struct domain *d,
         /* Undo dec of nr_saved_mfns, as the retry will decrease again. */
         atomic_inc(&nr_saved_mfns);
         mem_sharing_page_unlock(old_page);
-        put_gfn(d, gfn);
         /*
          * Caller is responsible for placing an event
          * in the ring.
          */
-        return -ENOMEM;
+        rc = -ENOMEM;
+        goto out;
     }
 
     copy_domain_page(page_to_mfn(page), page_to_mfn(old_page));
@@ -1327,8 +1333,18 @@ int __mem_sharing_unshare_page(struct domain *d,
      */
     paging_mark_dirty(d, page_to_mfn(page));
     /* We do not need to unlock a private page */
+
+ out:
+    if ( unlikely(nestedhvm_enabled(d)) )
+    {
+        unsigned int i;
+
+        for ( i = 0; i < MAX_NESTEDP2M; i++ )
+            p2m_unlock(d->arch.nested_p2m[i]);
+    }
+
     put_gfn(d, gfn);
-    return 0;
+    return rc;
 }
 
 int relinquish_shared_pages(struct domain *d)
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index ad4bb94514..a32301c343 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -1597,9 +1597,17 @@ p2m_flush(struct vcpu *v, struct p2m_domain *p2m)
 void
 p2m_flush_nestedp2m(struct domain *d)
 {
-    int i;
+    unsigned int i;
+
     for ( i = 0; i < MAX_NESTEDP2M; i++ )
-        p2m_flush_table(d->arch.nested_p2m[i]);
+    {
+        struct p2m_domain *p2m = d->arch.nested_p2m[i];
+
+        if ( p2m_locked_by_me(p2m) )
+            p2m_flush_table_locked(p2m);
+        else
+            p2m_flush_table(p2m);
+    }
 }
 
 void np2m_flush_base(struct vcpu *v, unsigned long np2m_base)
-- 
2.25.1


