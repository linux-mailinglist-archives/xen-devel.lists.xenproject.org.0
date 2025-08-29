Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1353B3C591
	for <lists+xen-devel@lfdr.de>; Sat, 30 Aug 2025 01:22:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1102357.1454986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us8Pc-0007td-94; Fri, 29 Aug 2025 23:21:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1102357.1454986; Fri, 29 Aug 2025 23:21:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us8Pc-0007rR-5E; Fri, 29 Aug 2025 23:21:40 +0000
Received: by outflank-mailman (input) for mailman id 1102357;
 Fri, 29 Aug 2025 23:21:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1us8Pa-0007dq-PK
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 23:21:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1us8Pa-00CpQO-0H;
 Fri, 29 Aug 2025 23:21:38 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1us8PZ-008JlB-39;
 Fri, 29 Aug 2025 23:21:38 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=3UNF2+WIdTCXkwxI0MBT0wokOCC9edQY8jbVKD7OSYw=; b=XzOQH7HGX07CKgpjm3RSaukt7B
	MX6Vsmfrmo+1T4m519iYsjDMBbjtK9rXitG6uG3YfmE44HYeMK0OSi9MVnEKye1ggnhPndrsmtT9r
	5kzn3yZXjzLrvtVuvTnYjmXXKBRPqSg36SzH0HkFBmDEclU8TjeCOhUDEToFOCYxnHd8=;
From: dmukhin@xen.org
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	jbeulich@suse.com,
	julien@xen.org,
	michal.orzel@amd.com,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	dmukhin@ford.com,
	Julien Grall <jgrall@amazon.com>,
	Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Subject: [PATCH v17 1/4] xen/domain: unify domain ID allocation
Date: Fri, 29 Aug 2025 16:21:29 -0700
Message-ID: <20250829232132.3460081-2-dmukhin@ford.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250829232132.3460081-1-dmukhin@ford.com>
References: <20250829232132.3460081-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denis Mukhin <dmukhin@ford.com> 

Currently, there are two different domain ID allocation implementations:

  1) Sequential IDs allocation in dom0less Arm code based on max_init_domid;

  2) Sequential IDs allocation in XEN_DOMCTL_createdomain; does not use
     max_init_domid (both Arm and x86).

The domain ID allocation covers dom0 or late hwdom, predefined domains,
post-boot domains, excluding Xen system domains (domid >=
DOMID_FIRST_RESERVED).

It makes sense to have a common helper code for such task across architectures
(Arm and x86) and between dom0less / toolstack domU allocation.

Note, fixing dependency on max_init_domid is out of scope of this patch.

Wrap the domain ID allocation as an arch-independent function domid_alloc() in
new common/domid.c based on the bitmap.

Allocation algorithm:
- If an explicit domain ID is provided, verify its availability and use it if
  ID is not used;
- If DOMID_INVALID is provided, search the range [1..DOMID_FIRST_RESERVED-1],
  starting from the last used ID.
  Implementation guarantees that two consecutive calls will never return the
  same ID. ID#0 is reserved for the first boot domain (currently, dom0) and
  excluded from the allocation range.

Remove is_free_domid() helper as it is not needed now.

No functional change intended.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
Changes since v16:
- n/a
- kept existing R-bs
---
 xen/arch/arm/domain_build.c             |  7 +-
 xen/arch/x86/setup.c                    |  7 +-
 xen/common/Makefile                     |  1 +
 xen/common/device-tree/dom0less-build.c | 15 ++--
 xen/common/domain.c                     |  2 +
 xen/common/domctl.c                     | 43 ++---------
 xen/common/domid.c                      | 95 +++++++++++++++++++++++++
 xen/include/xen/domain.h                |  3 +
 8 files changed, 126 insertions(+), 47 deletions(-)
 create mode 100644 xen/common/domid.c

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index a9e4153e3cf9..aca35b8961d6 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2050,6 +2050,7 @@ void __init create_dom0(void)
         .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
     };
     unsigned int flags = CDF_privileged | CDF_hardware;
+    domid_t domid;
     int rc;
 
     /* The vGIC for DOM0 is exactly emulating the hardware GIC */
@@ -2074,7 +2075,11 @@ void __init create_dom0(void)
     if ( !llc_coloring_enabled )
         flags |= CDF_directmap;
 
-    dom0 = domain_create(0, &dom0_cfg, flags);
+    domid = domid_alloc(0);
+    if ( domid == DOMID_INVALID )
+        panic("Error allocating domain ID 0\n");
+
+    dom0 = domain_create(domid, &dom0_cfg, flags);
     if ( IS_ERR(dom0) )
         panic("Error creating domain 0 (rc = %ld)\n", PTR_ERR(dom0));
 
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 6c81841426a4..78e24b78c5a6 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1038,8 +1038,11 @@ static struct domain *__init create_dom0(struct boot_info *bi)
     if ( iommu_enabled )
         dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
 
-    /* Create initial domain.  Not d0 for pvshim. */
-    bd->domid = get_initial_domain_id();
+    /* Allocate initial domain ID.  Not d0 for pvshim. */
+    bd->domid = domid_alloc(get_initial_domain_id());
+    if ( bd->domid == DOMID_INVALID )
+        panic("Error allocating domain ID %u\n", get_initial_domain_id());
+
     d = domain_create(bd->domid, &dom0_cfg,
                       pv_shim ? 0 : CDF_privileged | CDF_hardware);
     if ( IS_ERR(d) )
diff --git a/xen/common/Makefile b/xen/common/Makefile
index c316957fcb36..0c7d0f5d46e1 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -11,6 +11,7 @@ obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) += device.o
 obj-$(CONFIG_DEVICE_TREE_PARSE) += device-tree/
 obj-$(CONFIG_IOREQ_SERVER) += dm.o
 obj-y += domain.o
+obj-y += domid.o
 obj-y += event_2l.o
 obj-y += event_channel.o
 obj-$(CONFIG_EVTCHN_FIFO) += event_fifo.o
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index badc227031eb..8ef5ae9c0912 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -834,6 +834,7 @@ void __init create_domUs(void)
     {
         struct kernel_info ki = KERNEL_INFO_INIT;
         int rc = parse_dom0less_node(node, &ki.bd);
+        domid_t domid;
 
         if ( rc == -ENOENT )
             continue;
@@ -843,13 +844,13 @@ void __init create_domUs(void)
         if ( (max_init_domid + 1) >= DOMID_FIRST_RESERVED )
             panic("No more domain IDs available\n");
 
-        /*
-         * The variable max_init_domid is initialized with zero, so here it's
-         * very important to use the pre-increment operator to call
-         * domain_create() with a domid > 0. (domid == 0 is reserved for Dom0)
-         */
-        ki.bd.d = domain_create(++max_init_domid,
-                                &ki.bd.create_cfg, ki.bd.create_flags);
+        domid = domid_alloc(DOMID_INVALID);
+        if ( domid == DOMID_INVALID )
+            panic("Error allocating ID for domain %s\n", dt_node_name(node));
+
+        max_init_domid = max(max_init_domid, domid);
+
+        ki.bd.d = domain_create(domid, &ki.bd.create_cfg, ki.bd.create_flags);
         if ( IS_ERR(ki.bd.d) )
             panic("Error creating domain %s (rc = %ld)\n",
                   dt_node_name(node), PTR_ERR(ki.bd.d));
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 104e917f07e3..775c33928585 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -692,6 +692,8 @@ static void _domain_destroy(struct domain *d)
 
     lock_profile_deregister_struct(LOCKPROF_TYPE_PERDOM, d);
 
+    domid_free(d->domain_id);
+
     free_domain_struct(d);
 }
 
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index f2a7caaf853c..71e712c1f316 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -51,20 +51,6 @@ static int xenctl_bitmap_to_nodemask(nodemask_t *nodemask,
                                    MAX_NUMNODES);
 }
 
-static inline int is_free_domid(domid_t dom)
-{
-    struct domain *d;
-
-    if ( dom >= DOMID_FIRST_RESERVED )
-        return 0;
-
-    if ( (d = rcu_lock_domain_by_id(dom)) == NULL )
-        return 1;
-
-    rcu_unlock_domain(d);
-    return 0;
-}
-
 void getdomaininfo(struct domain *d, struct xen_domctl_getdomaininfo *info)
 {
     struct vcpu *v;
@@ -423,36 +409,19 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
 
     case XEN_DOMCTL_createdomain:
     {
-        domid_t        dom;
-        static domid_t rover = 0;
+        /* NB: ID#0 is reserved, find the first suitable ID instead. */
+        domid_t domid = domid_alloc(op->domain ?: DOMID_INVALID);
 
-        dom = op->domain;
-        if ( (dom > 0) && (dom < DOMID_FIRST_RESERVED) )
+        if ( domid == DOMID_INVALID )
         {
             ret = -EEXIST;
-            if ( !is_free_domid(dom) )
-                break;
-        }
-        else
-        {
-            for ( dom = rover + 1; dom != rover; dom++ )
-            {
-                if ( dom == DOMID_FIRST_RESERVED )
-                    dom = 1;
-                if ( is_free_domid(dom) )
-                    break;
-            }
-
-            ret = -ENOMEM;
-            if ( dom == rover )
-                break;
-
-            rover = dom;
+            break;
         }
 
-        d = domain_create(dom, &op->u.createdomain, false);
+        d = domain_create(domid, &op->u.createdomain, false);
         if ( IS_ERR(d) )
         {
+            domid_free(domid);
             ret = PTR_ERR(d);
             d = NULL;
             break;
diff --git a/xen/common/domid.c b/xen/common/domid.c
new file mode 100644
index 000000000000..2387ddb08300
--- /dev/null
+++ b/xen/common/domid.c
@@ -0,0 +1,95 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Domain ID allocator.
+ *
+ * Covers dom0 or late hwdom, predefined domains, post-boot domains.
+ * Excludes system domains (ID >= DOMID_FIRST_RESERVED).
+ *
+ * Copyright 2025 Ford Motor Company
+ */
+
+#include <xen/domain.h>
+
+static DEFINE_SPINLOCK(domid_lock);
+static DECLARE_BITMAP(domid_bitmap, DOMID_FIRST_RESERVED);
+
+/*
+ * Allocate domain ID.
+ *
+ * @param domid Domain ID hint:
+ * - If an explicit domain ID is provided, verify its availability and use it
+ *   if ID is not used;
+ * - If DOMID_INVALID is provided, search [1..DOMID_FIRST_RESERVED-1] range,
+ *   starting from the last used ID. Implementation guarantees that two
+ *   consecutive calls will never return the same ID. ID#0 is reserved for
+ *   the first boot domain (currently, dom0) and excluded from the allocation
+ *   range.
+ * @return Valid domain ID in case of successful allocation,
+ *         DOMID_INVALID - otherwise.
+ */
+domid_t domid_alloc(domid_t domid)
+{
+    static domid_t domid_last;
+
+    spin_lock(&domid_lock);
+
+    /* Exact match. */
+    if ( domid < DOMID_FIRST_RESERVED )
+    {
+        if ( __test_and_set_bit(domid, domid_bitmap) )
+            domid = DOMID_INVALID;
+    }
+    /*
+     * Exhaustive search.
+     *
+     * Domain ID#0 is reserved for the first boot domain (e.g. control domain)
+     * and excluded from allocation.
+     */
+    else
+    {
+        domid_t bound = DOMID_FIRST_RESERVED;
+
+        domid = find_next_zero_bit(domid_bitmap, bound, domid_last + 1);
+        if ( domid >= bound && domid_last != 0 )
+        {
+            bound = domid_last + 1;
+            domid = find_next_zero_bit(domid_bitmap, bound, 1);
+        }
+
+        ASSERT(domid <= DOMID_FIRST_RESERVED);
+        if ( domid < bound )
+        {
+            __set_bit(domid, domid_bitmap);
+            domid_last = domid;
+        }
+        else
+            domid = DOMID_INVALID;
+    }
+
+    spin_unlock(&domid_lock);
+
+    return domid;
+}
+
+void domid_free(domid_t domid)
+{
+    int rc;
+
+    ASSERT(domid <= DOMID_FIRST_RESERVED);
+
+    spin_lock(&domid_lock);
+    rc = __test_and_clear_bit(domid, domid_bitmap);
+    spin_unlock(&domid_lock);
+
+    ASSERT(rc);
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index e10baf2615fd..8aab05ae93c8 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -38,6 +38,9 @@ void arch_get_domain_info(const struct domain *d,
 
 domid_t get_initial_domain_id(void);
 
+domid_t domid_alloc(domid_t domid);
+void domid_free(domid_t domid);
+
 /* CDF_* constant. Internal flags for domain creation. */
 /* Is this a privileged domain? */
 #define CDF_privileged           (1U << 0)
-- 
2.51.0


