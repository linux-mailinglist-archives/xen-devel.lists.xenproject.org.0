Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A8E309193
	for <lists+xen-devel@lfdr.de>; Sat, 30 Jan 2021 03:59:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78646.143242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5gU7-0001AJ-GY; Sat, 30 Jan 2021 02:59:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78646.143242; Sat, 30 Jan 2021 02:59:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5gU7-00019K-8Q; Sat, 30 Jan 2021 02:59:39 +0000
Received: by outflank-mailman (input) for mailman id 78646;
 Sat, 30 Jan 2021 02:59:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bynp=HB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l5gU5-0000YD-Qr
 for xen-devel@lists.xenproject.org; Sat, 30 Jan 2021 02:59:37 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e82c1f1d-02ed-4b5d-b9ca-591e636518df;
 Sat, 30 Jan 2021 02:59:14 +0000 (UTC)
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
X-Inumbo-ID: e82c1f1d-02ed-4b5d-b9ca-591e636518df
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611975554;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VoTeqylyIKYNUVGR1p4EbYqyDB1lDehnO+q/9sVC2vI=;
  b=VfjfWAy02G0IfGUExxrGpFFV0R7fjZfyGbc+PDtjhpz6PpiLzX+7G/3L
   p/LRpJhUD2hL0SKKgJLliAE9Lc+7CN+xTb2iWjXS+abHn28R6xJhSC5Wx
   ex5Mjvc3Xx1EdySDmMzkLhoYTX2O5HTFh3gixPUFr5Pr4UYDTWkuEKCl6
   o=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: wSvciXDYXWGNEV5d0mKKe9gT+n67YO2SHpfaeRlKDfg8scP66BMzOYvZdGMyQsib2NOC+JzSjf
 M2xgiduc7UIWeFSFkQC2BTsG/fvN1VthkCjJSkZn59l34NJymTpBaATn5qMVPyEZynqY2b4LML
 qom3XHgiktuTZMjXWOwpS42fdHV569c4CsoLB379Hp0N3vC8OdSXjE+SDy5s/7/8fleP0dNwqm
 QpRr8/U1EXPfhrAHmtthaDqEHSPKsGKtOflB6+WGBfSJ6GphlZGTlZcRJe48rcx064QHzWkKon
 Kt8=
X-SBRS: 5.1
X-MesageID: 37525492
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,387,1602561600"; 
   d="scan'208";a="37525492"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>,
	Hubert Jasudowicz <hubert.jasudowicz@cert.pl>, Tamas K Lengyel
	<tamas@tklengyel.com>
Subject: [PATCH v8 02/16] xen/gnttab: Rework resource acquisition
Date: Sat, 30 Jan 2021 02:58:38 +0000
Message-ID: <20210130025852.12430-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210130025852.12430-1-andrew.cooper3@citrix.com>
References: <20210130025852.12430-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The existing logic doesn't function in the general case for mapping a guests
grant table, due to arbitrary 32 frame limit, and the default grant table
limit being 64.

In order to start addressing this, rework the existing grant table logic by
implementing a single gnttab_acquire_resource().  This is far more efficient
than the previous acquire_grant_table() in memory.c because it doesn't take
the grant table write lock, and attempt to grow the table, for every single
frame.

The new gnttab_acquire_resource() function subsumes the previous two
gnttab_get_{shared,status}_frame() helpers.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Ian Jackson <iwj@xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Paul Durrant <paul@xen.org>
CC: Michał Leszczyński <michal.leszczynski@cert.pl>
CC: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
CC: Tamas K Lengyel <tamas@tklengyel.com>

v8:
 * Rebase over 'frame' truncation/overflow changes.
 * Rebase over ARM/IOREQ series.

v3:
 * Fold switch statements in gnttab_acquire_resource()
---
 xen/common/grant_table.c      | 76 ++++++++++++++++++++++++++++---------------
 xen/common/memory.c           | 42 ++----------------------
 xen/include/xen/grant_table.h | 19 ++++-------
 3 files changed, 58 insertions(+), 79 deletions(-)

diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index 4ecec35f28..235bf88daf 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -3987,6 +3987,55 @@ static int gnttab_get_shared_frame_mfn(struct domain *d,
     return 0;
 }
 
+int gnttab_acquire_resource(
+    struct domain *d, unsigned int id, unsigned int frame,
+    unsigned int nr_frames, xen_pfn_t mfn_list[])
+{
+    struct grant_table *gt = d->grant_table;
+    unsigned int i, final_frame;
+    mfn_t tmp;
+    void **vaddrs;
+    int rc = -EINVAL;
+
+    if ( !nr_frames )
+        return rc;
+
+    final_frame = frame + nr_frames - 1;
+
+    /* Grow table if necessary. */
+    grant_write_lock(gt);
+    switch ( id )
+    {
+    case XENMEM_resource_grant_table_id_shared:
+        vaddrs = gt->shared_raw;
+        rc = gnttab_get_shared_frame_mfn(d, final_frame, &tmp);
+        break;
+
+    case XENMEM_resource_grant_table_id_status:
+        if ( gt->gt_version != 2 )
+            break;
+
+        /* Check that void ** is a suitable representation for gt->status. */
+        BUILD_BUG_ON(!__builtin_types_compatible_p(
+                         typeof(gt->status), grant_status_t **));
+        vaddrs = (void **)gt->status;
+        rc = gnttab_get_status_frame_mfn(d, final_frame, &tmp);
+        break;
+    }
+
+    /* Any errors?  Bad id, or from growing the table? */
+    if ( rc )
+        goto out;
+
+    for ( i = 0; i < nr_frames; ++i )
+        mfn_list[i] = virt_to_mfn(vaddrs[frame + i]);
+
+ out:
+    grant_write_unlock(gt);
+
+    return rc;
+}
+
 int gnttab_map_frame(struct domain *d, unsigned long idx, gfn_t gfn, mfn_t *mfn)
 {
     int rc = 0;
@@ -4021,33 +4070,6 @@ int gnttab_map_frame(struct domain *d, unsigned long idx, gfn_t gfn, mfn_t *mfn)
     return rc;
 }
 
-int gnttab_get_shared_frame(struct domain *d, unsigned int idx,
-                            mfn_t *mfn)
-{
-    struct grant_table *gt = d->grant_table;
-    int rc;
-
-    grant_write_lock(gt);
-    rc = gnttab_get_shared_frame_mfn(d, idx, mfn);
-    grant_write_unlock(gt);
-
-    return rc;
-}
-
-int gnttab_get_status_frame(struct domain *d, unsigned int idx,
-                            mfn_t *mfn)
-{
-    struct grant_table *gt = d->grant_table;
-    int rc;
-
-    grant_write_lock(gt);
-    rc = (gt->gt_version == 2) ?
-        gnttab_get_status_frame_mfn(d, idx, mfn) : -EINVAL;
-    grant_write_unlock(gt);
-
-    return rc;
-}
-
 static void gnttab_usage_print(struct domain *rd)
 {
     int first = 1;
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 4d681597a5..b36c28af63 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1054,44 +1054,6 @@ static long xatp_permission_check(struct domain *d, unsigned int space)
     return xsm_add_to_physmap(XSM_TARGET, current->domain, d);
 }
 
-static int acquire_grant_table(struct domain *d, unsigned int id,
-                               unsigned int frame,
-                               unsigned int nr_frames,
-                               xen_pfn_t mfn_list[])
-{
-    unsigned int i = nr_frames;
-
-    /* Iterate backwards in case table needs to grow */
-    while ( i-- != 0 )
-    {
-        mfn_t mfn = INVALID_MFN;
-        int rc;
-
-        switch ( id )
-        {
-        case XENMEM_resource_grant_table_id_shared:
-            rc = gnttab_get_shared_frame(d, frame + i, &mfn);
-            break;
-
-        case XENMEM_resource_grant_table_id_status:
-            rc = gnttab_get_status_frame(d, frame + i, &mfn);
-            break;
-
-        default:
-            rc = -EINVAL;
-            break;
-        }
-
-        if ( rc )
-            return rc;
-
-        ASSERT(!mfn_eq(mfn, INVALID_MFN));
-        mfn_list[i] = mfn_x(mfn);
-    }
-
-    return 0;
-}
-
 static int acquire_ioreq_server(struct domain *d,
                                 unsigned int id,
                                 unsigned int frame,
@@ -1188,8 +1150,8 @@ static int acquire_resource(
     switch ( xmar.type )
     {
     case XENMEM_resource_grant_table:
-        rc = acquire_grant_table(d, xmar.id, xmar.frame, xmar.nr_frames,
-                                 mfn_list);
+        rc = gnttab_acquire_resource(d, xmar.id, xmar.frame, xmar.nr_frames,
+                                     mfn_list);
         break;
 
     case XENMEM_resource_ioreq_server:
diff --git a/xen/include/xen/grant_table.h b/xen/include/xen/grant_table.h
index 6d14fe2526..14973de734 100644
--- a/xen/include/xen/grant_table.h
+++ b/xen/include/xen/grant_table.h
@@ -55,10 +55,10 @@ int mem_sharing_gref_to_gfn(struct grant_table *gt, grant_ref_t ref,
 
 int gnttab_map_frame(struct domain *d, unsigned long idx, gfn_t gfn,
                      mfn_t *mfn);
-int gnttab_get_shared_frame(struct domain *d, unsigned int idx,
-                            mfn_t *mfn);
-int gnttab_get_status_frame(struct domain *d, unsigned int idx,
-                            mfn_t *mfn);
+
+int gnttab_acquire_resource(
+    struct domain *d, unsigned int id, unsigned int frame,
+    unsigned int nr_frames, xen_pfn_t mfn_list[]);
 
 #else
 
@@ -92,14 +92,9 @@ static inline int gnttab_map_frame(struct domain *d, unsigned long idx,
     return -EINVAL;
 }
 
-static inline int gnttab_get_shared_frame(struct domain *d, unsigned int idx,
-                                          mfn_t *mfn)
-{
-    return -EINVAL;
-}
-
-static inline int gnttab_get_status_frame(struct domain *d, unsigned int idx,
-                                          mfn_t *mfn)
+static inline int gnttab_acquire_resource(
+    struct domain *d, unsigned int id, unsigned int frame,
+    unsigned int nr_frames, xen_pfn_t mfn_list[])
 {
     return -EINVAL;
 }
-- 
2.11.0


