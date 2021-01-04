Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 829412E9C32
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 18:41:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61450.108170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwTrT-0004lL-La; Mon, 04 Jan 2021 17:41:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61450.108170; Mon, 04 Jan 2021 17:41:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwTrT-0004kh-GW; Mon, 04 Jan 2021 17:41:43 +0000
Received: by outflank-mailman (input) for mailman id 61450;
 Mon, 04 Jan 2021 17:41:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U5jC=GH=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1kwTrS-0004ic-8o
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 17:41:42 +0000
Received: from mga03.intel.com (unknown [134.134.136.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 66f86bf9-3ef4-408e-a754-27ee9a7dfe61;
 Mon, 04 Jan 2021 17:41:38 +0000 (UTC)
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2021 09:41:37 -0800
Received: from aparija-mobl1.amr.corp.intel.com (HELO ubuntu.localdomain)
 ([10.212.21.134])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2021 09:41:36 -0800
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
X-Inumbo-ID: 66f86bf9-3ef4-408e-a754-27ee9a7dfe61
IronPort-SDR: GVV9pu2VKp8wRLfoMkTDn/NzNHn3lEOzxZoSG6DlRiomi5ZFzuHanSWIhkNYs3fTPSVuVmChVH
 MF4cSqp8Q2qw==
X-IronPort-AV: E=McAfee;i="6000,8403,9854"; a="177086253"
X-IronPort-AV: E=Sophos;i="5.78,474,1599548400"; 
   d="scan'208";a="177086253"
IronPort-SDR: jgwOvK7QdMxPH8k3SL4zTym+FN1PzTW/S5Go/9ajvKicPa5NW48JaqzB9rGD3OLGkLll0HusyH
 mwlQJ6sm+8Dw==
X-IronPort-AV: E=Sophos;i="5.78,474,1599548400"; 
   d="scan'208";a="349597709"
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 2/2] x86/hap: Resolve mm-lock order violations when forking VMs with nested p2m
Date: Mon,  4 Jan 2021 09:41:27 -0800
Message-Id: <19aab6220bf191a31902488ed38c51d239572269.1609781242.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <6d5ca8a57a2745e933f00706bff306844611f64d.1609781242.git.tamas.lengyel@intel.com>
References: <6d5ca8a57a2745e933f00706bff306844611f64d.1609781242.git.tamas.lengyel@intel.com>
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
 xen/arch/x86/mm/mem_sharing.c | 43 +++++++++++++++++++++++------------
 xen/arch/x86/mm/p2m.c         | 11 ++++++++-
 2 files changed, 39 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index 4a02c7d6f2..e2f3f50eef 100644
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
@@ -1214,7 +1212,7 @@ int __mem_sharing_unshare_page(struct domain *d,
     p2m_type_t p2mt;
     mfn_t mfn;
     struct page_info *page, *old_page;
-    int last_gfn;
+    int last_gfn, rc = 0;
     gfn_info_t *gfn_info = NULL;
 
     mfn = get_gfn(d, gfn, &p2mt);
@@ -1226,6 +1224,15 @@ int __mem_sharing_unshare_page(struct domain *d,
         return 0;
     }
 
+    /* lock nested p2ms to avoid lock-order violation */
+    if ( unlikely(nestedhvm_enabled(d)) )
+    {
+        int i;
+
+        for ( i = 0; i < MAX_NESTEDP2M; i++ )
+            p2m_lock(d->arch.nested_p2m[i]);
+    }
+
     page = __grab_shared_page(mfn);
     if ( page == NULL )
     {
@@ -1276,9 +1283,7 @@ int __mem_sharing_unshare_page(struct domain *d,
             put_page_alloc_ref(page);
 
         put_page_and_type(page);
-        put_gfn(d, gfn);
-
-        return 0;
+        goto out;
     }
 
     if ( last_gfn )
@@ -1295,12 +1300,12 @@ int __mem_sharing_unshare_page(struct domain *d,
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
@@ -1327,8 +1332,18 @@ int __mem_sharing_unshare_page(struct domain *d,
      */
     paging_mark_dirty(d, page_to_mfn(page));
     /* We do not need to unlock a private page */
+
+ out:
+    if ( unlikely(nestedhvm_enabled(d)) )
+    {
+        int i;
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
index ad4bb94514..79a2b6762b 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -1598,8 +1598,17 @@ void
 p2m_flush_nestedp2m(struct domain *d)
 {
     int i;
+    struct p2m_domain *p2m;
+
     for ( i = 0; i < MAX_NESTEDP2M; i++ )
-        p2m_flush_table(d->arch.nested_p2m[i]);
+    {
+        p2m = d->arch.nested_p2m[i];
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


