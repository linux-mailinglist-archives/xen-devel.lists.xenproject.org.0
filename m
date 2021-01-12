Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3962F3B03
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 20:49:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65966.117006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzPfU-0006bl-Hv; Tue, 12 Jan 2021 19:49:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65966.117006; Tue, 12 Jan 2021 19:49:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzPfU-0006b2-C9; Tue, 12 Jan 2021 19:49:28 +0000
Received: by outflank-mailman (input) for mailman id 65966;
 Tue, 12 Jan 2021 19:49:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zh5d=GP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kzPfT-00064W-9x
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 19:49:27 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0d843cb8-1e7a-4e10-97f5-df9f4a6e9bae;
 Tue, 12 Jan 2021 19:49:05 +0000 (UTC)
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
X-Inumbo-ID: 0d843cb8-1e7a-4e10-97f5-df9f4a6e9bae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610480945;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QP34gUd0yVaYagIl+iAquadIBVEzTLaCpk9INm1PzbU=;
  b=UiRAtP14rF8+Aaen6AXCdpOEyQquQc9B4Kkn4DecxEVE+XCf46oPhFnS
   Mmc6ILvMLewLFugsl6mutFVlqIJH3x0R0J+etGWw7C9Io4uk/Ml3wZFEy
   zGyduw6V0HPiZ2Xh2nebpyLPl30kaD2oeSnZpvN+VEj8IDTn/B7u1CxEk
   o=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: hbTK65Tba221UsgBf/E7NkDFhhPx7vv8w4GZdv6KpeizVuIybV1NjGFvm6dLQzidSeN3AH8i4l
 h9C4nSyLBJdDbA//nIFpDIvIaGS9tHXlWVFgQbBKdycCS6rthe3Mpi2lKyU5UJQrBXRlhXAsZV
 xgfEuWqxXlkkr6OSl8u4PHFEgYJuQ5PstqxzpqiZK47pFlClTLvEtoe3FHfDkEXzTIdw0XW/vU
 BPUT+Jj6pU6vpiNHaUGJ/SqwUKKJtK1OX5mSTEIfhGA40HWG0aCKZZCX0FIAh8B7lowZIHwuVj
 uy4=
X-SBRS: 5.2
X-MesageID: 36235817
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,342,1602561600"; 
   d="scan'208";a="36235817"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>,
	Hubert Jasudowicz <hubert.jasudowicz@cert.pl>, Tamas K Lengyel
	<tamas@tklengyel.com>
Subject: [PATCH v3 1/7] xen/gnttab: Rework resource acquisition
Date: Tue, 12 Jan 2021 19:48:35 +0000
Message-ID: <20210112194841.1537-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210112194841.1537-1-andrew.cooper3@citrix.com>
References: <20210112194841.1537-1-andrew.cooper3@citrix.com>
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

v3:
 * Fold switch statements in gnttab_acquire_resource()
---
 xen/common/grant_table.c      | 80 ++++++++++++++++++++++++++++---------------
 xen/common/memory.c           | 42 ++---------------------
 xen/include/xen/grant_table.h | 19 ++++------
 3 files changed, 62 insertions(+), 79 deletions(-)

diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index a5d3ed8bda..f560c250d7 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -4013,6 +4013,59 @@ static int gnttab_get_shared_frame_mfn(struct domain *d,
     return 0;
 }
 
+int gnttab_acquire_resource(
+    struct domain *d, unsigned int id, unsigned long frame,
+    unsigned int nr_frames, xen_pfn_t mfn_list[])
+{
+    struct grant_table *gt = d->grant_table;
+    unsigned int i = nr_frames, tot_frames;
+    mfn_t tmp;
+    void **vaddrs;
+    int rc;
+
+    /* Overflow checks */
+    if ( frame + nr_frames < frame )
+        return -EINVAL;
+
+    tot_frames = frame + nr_frames;
+    if ( tot_frames != frame + nr_frames )
+        return -EINVAL;
+
+    /* Grow table if necessary. */
+    grant_write_lock(gt);
+    rc = -EINVAL;
+    switch ( id )
+    {
+    case XENMEM_resource_grant_table_id_shared:
+        vaddrs = gt->shared_raw;
+        rc = gnttab_get_shared_frame_mfn(d, tot_frames - 1, &tmp);
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
+        rc = gnttab_get_status_frame_mfn(d, tot_frames - 1, &tmp);
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
@@ -4047,33 +4100,6 @@ int gnttab_map_frame(struct domain *d, unsigned long idx, gfn_t gfn, mfn_t *mfn)
     return rc;
 }
 
-int gnttab_get_shared_frame(struct domain *d, unsigned long idx,
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
-int gnttab_get_status_frame(struct domain *d, unsigned long idx,
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
index b21b6c452d..82cf7b41ee 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1052,44 +1052,6 @@ static long xatp_permission_check(struct domain *d, unsigned int space)
     return xsm_add_to_physmap(XSM_TARGET, current->domain, d);
 }
 
-static int acquire_grant_table(struct domain *d, unsigned int id,
-                               unsigned long frame,
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
 static int acquire_resource(
     XEN_GUEST_HANDLE_PARAM(xen_mem_acquire_resource_t) arg)
 {
@@ -1144,8 +1106,8 @@ static int acquire_resource(
     switch ( xmar.type )
     {
     case XENMEM_resource_grant_table:
-        rc = acquire_grant_table(d, xmar.id, xmar.frame, xmar.nr_frames,
-                                 mfn_list);
+        rc = gnttab_acquire_resource(d, xmar.id, xmar.frame, xmar.nr_frames,
+                                     mfn_list);
         break;
 
     default:
diff --git a/xen/include/xen/grant_table.h b/xen/include/xen/grant_table.h
index 98603604b8..5a2c75b880 100644
--- a/xen/include/xen/grant_table.h
+++ b/xen/include/xen/grant_table.h
@@ -56,10 +56,10 @@ int mem_sharing_gref_to_gfn(struct grant_table *gt, grant_ref_t ref,
 
 int gnttab_map_frame(struct domain *d, unsigned long idx, gfn_t gfn,
                      mfn_t *mfn);
-int gnttab_get_shared_frame(struct domain *d, unsigned long idx,
-                            mfn_t *mfn);
-int gnttab_get_status_frame(struct domain *d, unsigned long idx,
-                            mfn_t *mfn);
+
+int gnttab_acquire_resource(
+    struct domain *d, unsigned int id, unsigned long frame,
+    unsigned int nr_frames, xen_pfn_t mfn_list[]);
 
 #else
 
@@ -93,14 +93,9 @@ static inline int gnttab_map_frame(struct domain *d, unsigned long idx,
     return -EINVAL;
 }
 
-static inline int gnttab_get_shared_frame(struct domain *d, unsigned long idx,
-                                          mfn_t *mfn)
-{
-    return -EINVAL;
-}
-
-static inline int gnttab_get_status_frame(struct domain *d, unsigned long idx,
-                                          mfn_t *mfn)
+static inline int gnttab_acquire_resource(
+    struct domain *d, unsigned int id, unsigned long frame,
+    unsigned int nr_frames, xen_pfn_t mfn_list[])
 {
     return -EINVAL;
 }
-- 
2.11.0


