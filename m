Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C7E27481A
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 20:25:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKmya-0008MQ-Ic; Tue, 22 Sep 2020 18:25:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J35V=C7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kKmyY-0008GC-Vo
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 18:25:15 +0000
X-Inumbo-ID: 66495c64-27dd-4231-8881-6ceacd5bb973
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 66495c64-27dd-4231-8881-6ceacd5bb973;
 Tue, 22 Sep 2020 18:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600799105;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OuR4rl0T07fCn2F5T8U3Qe+EIRHDfpOiju296cMpCPk=;
 b=FutK5hehDy7VsIYH4lvSHV9HymyDT5x+d8qf4IUfT0ZYYb+Tel/fUY6Z
 lDy1YM93bNRGDf72aC5rNc0RbZ9U2JkNwId4imOkYEim0H9avLqtSagIn
 qNnQXRAXJ75vnU71glmQuCsiuPEaYq6mul8nAT7HUvmYYxHOVuskPDtlr U=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Lho6xcsGRtCB8Anv/OIHYGk5B1SKYJ/od3/Q02hzEGZefEHhpRxfJr6PiFSRRlkoL5GI+OwCOU
 ovoyiWaG3nkqTTzmvzotQix3thglJqJfw5HHX0sgIEnpSdhVDICM9FJx6vThirvdwY/TjIB41T
 OTs+62QRnZ2zEJpXzCqqs2wa/B/U8ZOkIeAcNL1fkPTQ7JiNL6sIqPr+EBnAWhVRFEhq/6SqbF
 xyProNbNxUXPV+076XnCynLOCZ60kf1EsB4i3ZfyNr5xBUZp0fXG7Z477Y4FYKSOeFw60fnJ6N
 EzU=
X-SBRS: 2.7
X-MesageID: 28290900
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,291,1596513600"; d="scan'208";a="28290900"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
 <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
 <wl@xen.org>, Julien Grall <julien@xen.org>, Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>,
 Hubert Jasudowicz <hubert.jasudowicz@cert.pl>, Tamas K Lengyel
 <tamas@tklengyel.com>
Subject: [PATCH v2 04/11] xen/memory: Fix acquire_resource size semantics
Date: Tue, 22 Sep 2020 19:24:37 +0100
Message-ID: <20200922182444.12350-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200922182444.12350-1-andrew.cooper3@citrix.com>
References: <20200922182444.12350-1-andrew.cooper3@citrix.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Calling XENMEM_acquire_resource with a NULL frame_list is a request for the
size of the resource, but the returned 32 is bogus.

If someone tries to follow it for XENMEM_resource_ioreq_server, the acquire
call will fail as IOREQ servers currently top out at 2 frames, and it is only
half the size of the default grant table limit for guests.

Also, no users actually request a resource size, because it was never wired up
in the sole implementaion of resource acquisition in Linux.

Introduce a new resource_max_frames() to calculate the size of a resource, and
implement it the IOREQ and grant subsystems.

It is impossible to guarantee that a mapping call following a successful size
call will succeed (e.g. The target IOREQ server gets destroyed, or the domain
switches from grant v2 to v1).  Document the restriction, and use the
flexibility to simplify the paths to be lockless.

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

v2:
 * Spelling fixes
 * Add more local variables.
 * Don't return any status frames on ARM where v2 support is compiled out.
---
 xen/arch/x86/mm.c             | 20 ++++++++++++++++
 xen/common/grant_table.c      | 23 ++++++++++++++++++
 xen/common/memory.c           | 55 +++++++++++++++++++++++++++++++++----------
 xen/include/asm-x86/mm.h      |  3 +++
 xen/include/public/memory.h   | 16 +++++++++----
 xen/include/xen/grant_table.h |  8 +++++++
 xen/include/xen/mm.h          |  6 +++++
 7 files changed, 114 insertions(+), 17 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index d1cfc8fb4a..e82307bdae 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -4591,6 +4591,26 @@ int xenmem_add_to_physmap_one(
     return rc;
 }
 
+unsigned int arch_resource_max_frames(
+    struct domain *d, unsigned int type, unsigned int id)
+{
+    unsigned int nr = 0;
+
+    switch ( type )
+    {
+#ifdef CONFIG_HVM
+    case XENMEM_resource_ioreq_server:
+        if ( !is_hvm_domain(d) )
+            break;
+        /* One frame for the buf-ioreq ring, and one frame per 128 vcpus. */
+        nr = 1 + DIV_ROUND_UP(d->max_vcpus * sizeof(struct ioreq), PAGE_SIZE);
+        break;
+#endif
+    }
+
+    return nr;
+}
+
 int arch_acquire_resource(struct domain *d, unsigned int type,
                           unsigned int id, unsigned long frame,
                           unsigned int nr_frames, xen_pfn_t mfn_list[])
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index 912f07be47..8c401a5540 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -4013,6 +4013,29 @@ static int gnttab_get_shared_frame_mfn(struct domain *d,
     return 0;
 }
 
+unsigned int gnttab_resource_max_frames(struct domain *d, unsigned int id)
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
     struct domain *d, unsigned int id, unsigned long frame,
     unsigned int nr_frames, xen_pfn_t mfn_list[])
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 177fc378d9..c559935732 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1007,6 +1007,26 @@ static long xatp_permission_check(struct domain *d, unsigned int space)
     return xsm_add_to_physmap(XSM_TARGET, current->domain, d);
 }
 
+/*
+ * Return 0 on any kind of error.  Caller converts to -EINVAL.
+ *
+ * All nonzero values should be repeatable (i.e. derived from some fixed
+ * property of the domain), and describe the full resource (i.e. mapping the
+ * result of this call will be the entire resource).
+ */
+static unsigned int resource_max_frames(struct domain *d,
+                                        unsigned int type, unsigned int id)
+{
+    switch ( type )
+    {
+    case XENMEM_resource_grant_table:
+        return gnttab_resource_max_frames(d, id);
+
+    default:
+        return arch_resource_max_frames(d, type, id);
+    }
+}
+
 static int acquire_resource(
     XEN_GUEST_HANDLE_PARAM(xen_mem_acquire_resource_t) arg)
 {
@@ -1018,6 +1038,7 @@ static int acquire_resource(
      * use-cases then per-CPU arrays or heap allocations may be required.
      */
     xen_pfn_t mfn_list[32];
+    unsigned int max_frames;
     int rc;
 
     /*
@@ -1034,19 +1055,6 @@ static int acquire_resource(
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
 
@@ -1058,6 +1066,27 @@ static int acquire_resource(
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
+
+        rc = -EFAULT;
+        if ( __copy_field_to_guest(arg, &xmar, nr_frames) )
+            goto out;
+
+        rc = 0;
+        goto out;
+    }
+
     switch ( xmar.type )
     {
     case XENMEM_resource_grant_table:
diff --git a/xen/include/asm-x86/mm.h b/xen/include/asm-x86/mm.h
index deeba75a1c..13977652a8 100644
--- a/xen/include/asm-x86/mm.h
+++ b/xen/include/asm-x86/mm.h
@@ -639,6 +639,9 @@ static inline bool arch_mfn_in_directmap(unsigned long mfn)
     return mfn <= (virt_to_mfn(eva - 1) + 1);
 }
 
+unsigned int arch_resource_max_frames(struct domain *d,
+                                      unsigned int type, unsigned int id);
+
 int arch_acquire_resource(struct domain *d, unsigned int type,
                           unsigned int id, unsigned long frame,
                           unsigned int nr_frames, xen_pfn_t mfn_list[]);
diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
index 21d483298e..d7eb34f167 100644
--- a/xen/include/public/memory.h
+++ b/xen/include/public/memory.h
@@ -639,10 +639,18 @@ struct xen_mem_acquire_resource {
 #define XENMEM_resource_grant_table_id_status 1
 
     /*
-     * IN/OUT - As an IN parameter number of frames of the resource
-     *          to be mapped. However, if the specified value is 0 and
-     *          frame_list is NULL then this field will be set to the
-     *          maximum value supported by the implementation on return.
+     * IN/OUT
+     *
+     * As an IN parameter number of frames of the resource to be mapped.
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
index 5a2c75b880..bae4d79623 100644
--- a/xen/include/xen/grant_table.h
+++ b/xen/include/xen/grant_table.h
@@ -57,6 +57,8 @@ int mem_sharing_gref_to_gfn(struct grant_table *gt, grant_ref_t ref,
 int gnttab_map_frame(struct domain *d, unsigned long idx, gfn_t gfn,
                      mfn_t *mfn);
 
+unsigned int gnttab_resource_max_frames(struct domain *d, unsigned int id);
+
 int gnttab_acquire_resource(
     struct domain *d, unsigned int id, unsigned long frame,
     unsigned int nr_frames, xen_pfn_t mfn_list[]);
@@ -93,6 +95,12 @@ static inline int gnttab_map_frame(struct domain *d, unsigned long idx,
     return -EINVAL;
 }
 
+static inline unsigned int gnttab_resource_max_frames(
+    struct domain *d, unsigned int id)
+{
+    return 0;
+}
+
 static inline int gnttab_acquire_resource(
     struct domain *d, unsigned int id, unsigned long frame,
     unsigned int nr_frames, xen_pfn_t mfn_list[])
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 26a4a3d350..d686876b0e 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -686,6 +686,12 @@ static inline void put_page_alloc_ref(struct page_info *page)
 }
 
 #ifndef CONFIG_ARCH_ACQUIRE_RESOURCE
+static inline unsigned int arch_resource_max_frames(
+    struct domain *d, unsigned int type, unsigned int id)
+{
+    return 0;
+}
+
 static inline int arch_acquire_resource(
     struct domain *d, unsigned int type, unsigned int id, unsigned long frame,
     unsigned int nr_frames, xen_pfn_t mfn_list[])
-- 
2.11.0


