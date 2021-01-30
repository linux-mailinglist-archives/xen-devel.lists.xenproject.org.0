Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6151A309194
	for <lists+xen-devel@lfdr.de>; Sat, 30 Jan 2021 03:59:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78636.143166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5gTo-0000cr-GV; Sat, 30 Jan 2021 02:59:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78636.143166; Sat, 30 Jan 2021 02:59:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5gTo-0000bt-BL; Sat, 30 Jan 2021 02:59:20 +0000
Received: by outflank-mailman (input) for mailman id 78636;
 Sat, 30 Jan 2021 02:59:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bynp=HB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l5gTm-0000YI-Ka
 for xen-devel@lists.xenproject.org; Sat, 30 Jan 2021 02:59:18 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e36d1d0f-d6f1-4f37-a127-bb2f2204f32b;
 Sat, 30 Jan 2021 02:59:11 +0000 (UTC)
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
X-Inumbo-ID: e36d1d0f-d6f1-4f37-a127-bb2f2204f32b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611975551;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=93CR4kmg/8GZY8NLHrixBV4GEUjGS22KZOnsW0XYf7E=;
  b=DkCSOCDnjRPQVzOdDc/bvLW+rOSxWQQi6cQgKl2+ht5/iWlJWTiey+zI
   FrygUVg0sBDdIsjmvY5YeDekPEdWoq6cfO5JLEzCMQa1zuAYUcOV8sCav
   xObGZSzQZjz8CWvJ5zwW9aTFQPV7m1dED+ISEgsDiuAvVc7y5Zd4aiJXP
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Nzg8qdJGppbJDNhy+QLq1yces252bMm9S8eBeeYoD/aaHMWNsCYddw2pxVg/54Yzpfk7h5xtER
 N6cx3XaCIoe/ZfwLol9R4m9cE064PtxpToiWxQQTskXiQ1PU/dQbI/rkHaj3ErlbdnKR54BpH5
 MwAL41OdmrgtyJMZwOcKZdI+9KYyI0fOae9llcdE83lVpKch704S4i8GdUSrh6IQAcC7Ym60PF
 RC23Ai1hUdBQoCT4FRdGVEzpLJrueHePydkJZuydjcIxv9kAwQEfC0AbILSXxgQwREHwsgJSr4
 7QY=
X-SBRS: 5.1
X-MesageID: 37525490
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,387,1602561600"; 
   d="scan'208";a="37525490"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>,
	Hubert Jasudowicz <hubert.jasudowicz@cert.pl>, Tamas K Lengyel
	<tamas@tklengyel.com>
Subject: [PATCH v8 03/16] xen/memory: Fix acquire_resource size semantics
Date: Sat, 30 Jan 2021 02:58:39 +0000
Message-ID: <20210130025852.12430-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210130025852.12430-1-andrew.cooper3@citrix.com>
References: <20210130025852.12430-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Calling XENMEM_acquire_resource with a NULL frame_list is a request for the
size of the resource, but the returned 32 is bogus.

If someone tries to follow it for XENMEM_resource_ioreq_server, the acquire
call will fail as IOREQ servers currently top out at 2 frames, and it is only
half the size of the default grant table limit for guests.

Also, no users actually request a resource size, because it was never wired up
in the sole implementation of resource acquisition in Linux.

Introduce a new resource_max_frames() to calculate the size of a resource, and
implement it the IOREQ and grant subsystems.

It is impossible to guarantee that a mapping call following a successful size
call will succeed (e.g. The target IOREQ server gets destroyed, or the domain
switches from grant v2 to v1).  Document the restriction, and use the
flexibility to simplify the paths to be lockless.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Paul Durrant <paul@xen.org>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
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
 * Rebase over ARM/IOREQ series

v3:
 * Use const struct domain *
 * Fold goto out paths
v2:
 * Spelling fixes
 * Add more local variables.
 * Don't return any status frames on ARM where v2 support is compiled out.
---
 xen/common/grant_table.c      | 23 +++++++++++++++
 xen/common/memory.c           | 66 ++++++++++++++++++++++++++++++++++---------
 xen/include/public/memory.h   | 17 ++++++++---
 xen/include/xen/grant_table.h |  8 ++++++
 4 files changed, 97 insertions(+), 17 deletions(-)

diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index 235bf88daf..280b7969b6 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -3987,6 +3987,29 @@ static int gnttab_get_shared_frame_mfn(struct domain *d,
     return 0;
 }
 
+unsigned int gnttab_resource_max_frames(const struct domain *d, unsigned int id)
+{
+    const struct grant_table *gt = d->grant_table;
+    unsigned int nr = 0;
+
+    /* Don't need the grant lock.  This limit is fixed at domain create time. */
+    switch ( id )
+    {
+    case XENMEM_resource_grant_table_id_shared:
+        nr = gt->max_grant_frames;
+        break;
+
+    case XENMEM_resource_grant_table_id_status:
+        if ( GNTTAB_MAX_VERSION < 2 )
+            break;
+
+        nr = grant_to_status_frames(gt->max_grant_frames);
+        break;
+    }
+
+    return nr;
+}
+
 int gnttab_acquire_resource(
     struct domain *d, unsigned int id, unsigned int frame,
     unsigned int nr_frames, xen_pfn_t mfn_list[])
diff --git a/xen/common/memory.c b/xen/common/memory.c
index b36c28af63..9fb34eb4d0 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1054,6 +1054,42 @@ static long xatp_permission_check(struct domain *d, unsigned int space)
     return xsm_add_to_physmap(XSM_TARGET, current->domain, d);
 }
 
+unsigned int ioreq_server_max_frames(const struct domain *d)
+{
+    unsigned int nr = 0;
+
+#ifdef CONFIG_IOREQ_SERVER
+    if ( is_hvm_domain(d) )
+        /* One frame for the buf-ioreq ring, and one frame per 128 vcpus. */
+        nr = 1 + DIV_ROUND_UP(d->max_vcpus * sizeof(struct ioreq), PAGE_SIZE);
+#endif
+
+    return nr;
+}
+
+/*
+ * Return 0 on any kind of error.  Caller converts to -EINVAL.
+ *
+ * All nonzero values should be repeatable (i.e. derived from some fixed
+ * property of the domain), and describe the full resource (i.e. mapping the
+ * result of this call will be the entire resource).
+ */
+static unsigned int resource_max_frames(const struct domain *d,
+                                        unsigned int type, unsigned int id)
+{
+    switch ( type )
+    {
+    case XENMEM_resource_grant_table:
+        return gnttab_resource_max_frames(d, id);
+
+    case XENMEM_resource_ioreq_server:
+        return ioreq_server_max_frames(d);
+
+    default:
+        return -EOPNOTSUPP;
+    }
+}
+
 static int acquire_ioreq_server(struct domain *d,
                                 unsigned int id,
                                 unsigned int frame,
@@ -1099,6 +1135,7 @@ static int acquire_resource(
      * use-cases then per-CPU arrays or heap allocations may be required.
      */
     xen_pfn_t mfn_list[32];
+    unsigned int max_frames;
     int rc;
 
     if ( !arch_acquire_resource_check(currd) )
@@ -1110,19 +1147,6 @@ static int acquire_resource(
     if ( xmar.pad != 0 )
         return -EINVAL;
 
-    if ( guest_handle_is_null(xmar.frame_list) )
-    {
-        if ( xmar.nr_frames )
-            return -EINVAL;
-
-        xmar.nr_frames = ARRAY_SIZE(mfn_list);
-
-        if ( __copy_field_to_guest(arg, &xmar, nr_frames) )
-            return -EFAULT;
-
-        return 0;
-    }
-
     if ( xmar.nr_frames > ARRAY_SIZE(mfn_list) )
         return -E2BIG;
 
@@ -1147,6 +1171,22 @@ static int acquire_resource(
     if ( rc )
         goto out;
 
+    max_frames = resource_max_frames(d, xmar.type, xmar.id);
+
+    rc = -EINVAL;
+    if ( !max_frames )
+        goto out;
+
+    if ( guest_handle_is_null(xmar.frame_list) )
+    {
+        if ( xmar.nr_frames )
+            goto out;
+
+        xmar.nr_frames = max_frames;
+        rc = __copy_field_to_guest(arg, &xmar, nr_frames) ? -EFAULT : 0;
+        goto out;
+    }
+
     switch ( xmar.type )
     {
     case XENMEM_resource_grant_table:
diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
index 7ff56d5f28..020c79d757 100644
--- a/xen/include/public/memory.h
+++ b/xen/include/public/memory.h
@@ -639,10 +639,19 @@ struct xen_mem_acquire_resource {
 #define XENMEM_resource_grant_table_id_status 1
 
     /*
-     * IN/OUT - As an IN parameter number of frames of the resource
-     *          to be mapped. However, if the specified value is 0 and
-     *          frame_list is NULL then this field will be set to the
-     *          maximum value supported by the implementation on return.
+     * IN/OUT
+     *
+     * As an IN parameter number of frames of the resource to be mapped.
+     * This value may be updated over the course of the operation.
+     *
+     * When frame_list is NULL and nr_frames is 0, this is interpreted as a
+     * request for the size of the resource, which shall be returned in the
+     * nr_frames field.
+     *
+     * The size of a resource will never be zero, but a nonzero result doesn't
+     * guarantee that a subsequent mapping request will be successful.  There
+     * are further type/id specific constraints which may change between the
+     * two calls.
      */
     uint32_t nr_frames;
     uint32_t pad;
diff --git a/xen/include/xen/grant_table.h b/xen/include/xen/grant_table.h
index 14973de734..63b6dc78f4 100644
--- a/xen/include/xen/grant_table.h
+++ b/xen/include/xen/grant_table.h
@@ -56,6 +56,8 @@ int mem_sharing_gref_to_gfn(struct grant_table *gt, grant_ref_t ref,
 int gnttab_map_frame(struct domain *d, unsigned long idx, gfn_t gfn,
                      mfn_t *mfn);
 
+unsigned int gnttab_resource_max_frames(const struct domain *d, unsigned int id);
+
 int gnttab_acquire_resource(
     struct domain *d, unsigned int id, unsigned int frame,
     unsigned int nr_frames, xen_pfn_t mfn_list[]);
@@ -92,6 +94,12 @@ static inline int gnttab_map_frame(struct domain *d, unsigned long idx,
     return -EINVAL;
 }
 
+static inline unsigned int gnttab_resource_max_frames(
+    const struct domain *d, unsigned int id)
+{
+    return 0;
+}
+
 static inline int gnttab_acquire_resource(
     struct domain *d, unsigned int id, unsigned int frame,
     unsigned int nr_frames, xen_pfn_t mfn_list[])
-- 
2.11.0


