Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D272308D7
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 13:37:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0NvL-0006C7-FI; Tue, 28 Jul 2020 11:37:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K5Bo=BH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k0NvJ-0006Bw-Tb
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 11:37:33 +0000
X-Inumbo-ID: b9750142-d0c6-11ea-a8af-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b9750142-d0c6-11ea-a8af-12813bfff9fa;
 Tue, 28 Jul 2020 11:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595936252;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C30vCiBJRWVkXa2f7MgjSiHtu+zIa4xf5Yikt9EeBnM=;
 b=fdH3oDwtkYReN3a/EGRfwUz4TF2umd7FiSBCUdJo6YacrK9ZerkYKUei
 kikt1cYEfGYvtXdJyn0VsACQiib9wEJx5zungJcYBMUczjRQsWhhCg0D1
 +UxTjigSksyn7cOxJTeKXgwJUu3GcofzSxqlCrNZTcD7fH8xaTMmB5NdH 8=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: v8/lpfGxqn1loOuLjuecXkShCkCaTzInJqJvVSwD90xze7nR9dWxBGetJ8AkmkPDm6ggBCixtj
 fWgVUCLAw5wVADZIE/CwCCxOHO6HooXWpZyta1JLuWM5MuVJYdMxy9lBWTZvEC+zgLh1S/tlm6
 aIzCb7YW6EpP8kpY/IcUlqBqP08k+uLsOlUvjdhrILKPD1gZqLHopcC8LU6l8bC0ewQkHqdlCo
 RHpjcua+Ef5zJdHsxucOLdUb96w23iXIsKBKaYbzokWui+CgrRwBsaZcyqU1iEZz4utw3fCO4Y
 plY=
X-SBRS: 2.7
X-MesageID: 23524684
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,406,1589256000"; d="scan'208";a="23524684"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 2/5] xen/gnttab: Rework resource acquisition
Date: Tue, 28 Jul 2020 12:37:08 +0100
Message-ID: <20200728113712.22966-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200728113712.22966-1-andrew.cooper3@citrix.com>
References: <20200728113712.22966-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>, Jan
 Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>,
 Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

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
CC: Ian Jackson <ian.jackson@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Paul Durrant <paul@xen.org>
CC: Michał Leszczyński <michal.leszczynski@cert.pl>
CC: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
---
 xen/common/grant_table.c      | 93 ++++++++++++++++++++++++++++++-------------
 xen/common/memory.c           | 42 +------------------
 xen/include/xen/grant_table.h | 19 ++++-----
 3 files changed, 75 insertions(+), 79 deletions(-)

diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index 9f0cae52c0..122d1e7596 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -4013,6 +4013,72 @@ static int gnttab_get_shared_frame_mfn(struct domain *d,
     return 0;
 }
 
+int gnttab_acquire_resource(
+    struct domain *d, unsigned int id, unsigned long frame,
+    unsigned int nr_frames, xen_pfn_t mfn_list[])
+{
+    struct grant_table *gt = d->grant_table;
+    unsigned int i = nr_frames, tot_frames;
+    void **vaddrs;
+    int rc = 0;
+
+    /* Input sanity. */
+    if ( !nr_frames )
+        return -EINVAL;
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
+    switch ( id )
+    {
+        mfn_t tmp;
+
+    case XENMEM_resource_grant_table_id_shared:
+        rc = gnttab_get_shared_frame_mfn(d, tot_frames - 1, &tmp);
+        break;
+
+    case XENMEM_resource_grant_table_id_status:
+        if ( gt->gt_version != 2 )
+        {
+    default:
+            rc = -EINVAL;
+            break;
+        }
+        rc = gnttab_get_status_frame_mfn(d, tot_frames - 1, &tmp);
+        break;
+    }
+
+    /* Any errors from growing the table? */
+    if ( rc )
+        goto out;
+
+    switch ( id )
+    {
+    case XENMEM_resource_grant_table_id_shared:
+        vaddrs = gt->shared_raw;
+        break;
+
+    case XENMEM_resource_grant_table_id_status:
+        vaddrs = (void **)gt->status;
+        break;
+    }
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
@@ -4047,33 +4113,6 @@ int gnttab_map_frame(struct domain *d, unsigned long idx, gfn_t gfn, mfn_t *mfn)
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
index 714077c1e5..dc3a7248e3 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1007,44 +1007,6 @@ static long xatp_permission_check(struct domain *d, unsigned int space)
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
@@ -1091,8 +1053,8 @@ static int acquire_resource(
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


