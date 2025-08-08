Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 992F4B1E095
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 04:20:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073903.1436665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukCiD-00067c-RG; Fri, 08 Aug 2025 02:20:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073903.1436665; Fri, 08 Aug 2025 02:20:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukCiD-00065c-Np; Fri, 08 Aug 2025 02:20:05 +0000
Received: by outflank-mailman (input) for mailman id 1073903;
 Fri, 08 Aug 2025 02:20:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hyIc=2U=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ukCiC-0005lR-4n
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 02:20:05 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 305b74fd-73fe-11f0-b898-0df219b8e170;
 Fri, 08 Aug 2025 04:20:02 +0200 (CEST)
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
X-Inumbo-ID: 305b74fd-73fe-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1754619601; x=1754878801;
	bh=AHtqm8Rq9uACsvnZ5tyK7BjxNs5//7MbFetoXPPO1cc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=f1PscD6lZO/kOSm5kakrnC6D82MYnPHIZr0g91tB5xPWdgrf29WE5a1FTRkesx5HU
	 X8yY+m9DWwph3vtAuI+0AQ5sqy0JcDrYtCwpL0Xrxs+b01cf5aFZzamKgXGoCYqJhB
	 RvCss5FzdMyAl5j2dbOdJJ9naCO3/piwmhz8bHy/F7P2SqaKPm3nD7y8mji3KMNFna
	 FAHK2ARShX9ueyck1b7AwcdiZlbHQaRfuD5sEtPM5GhcCsp6rOMzY+5ssrhGUSlSxj
	 qNNctoSAyx8WoIBmxUbqjrd0bCwTyb0jwV67sH0q0ZEP1PCWQoKun8wOe0VNEP+tod
	 cyd5D1RLJKz7Q==
Date: Fri, 08 Aug 2025 02:19:56 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v14 1/4] xen/domain: unify domain ID allocation
Message-ID: <20250808021938.669855-2-dmukhin@ford.com>
In-Reply-To: <20250808021938.669855-1-dmukhin@ford.com>
References: <20250808021938.669855-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 19e5857599a554055eca274ea5705df5675bb685
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>=20

Currently, there are two different domain ID allocation implementations:

  1) Sequential IDs allocation in dom0less Arm code based on max_init_domid=
;

  2) Sequential IDs allocation in XEN_DOMCTL_createdomain; does not use
     max_init_domid (both Arm and x86).

The domain ID allocation covers dom0 or late hwdom, predefined domains,
post-boot domains, excluding Xen system domains (domid >=3D
DOMID_FIRST_RESERVED).

It makes sense to have a common helper code for such task across architectu=
res
(Arm and x86) and between dom0less / toolstack domU allocation.

Note, fixing dependency on max_init_domid is out of scope of this patch.

Wrap the domain ID allocation as an arch-independent function domid_alloc()=
 in
new common/domid.c based on the bitmap.

Allocation algorithm:
- If an explicit domain ID is provided, verify its availability and use it =
if
  ID is not used;
- If DOMID_INVALID is provided, search the range [1..DOMID_FIRST_RESERVED-1=
],
  starting from the last used ID.
  Implementation guarantees that two consecutive calls will never return th=
e
  same ID. ID#0 is reserved for the first boot domain (currently, dom0) and
  excluded from the allocation range.

Remove is_free_domid() helper as it is not needed now.

No functional change intended.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v13:
- fixed panic() formatting in x86's create_dom0()
- fixed login in do_domctl()
- optimizations in domid_alloc()
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
index 463ae4474d30..789f2b9d3ce7 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2050,6 +2050,7 @@ void __init create_dom0(void)
         .grant_opts =3D XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
     };
     unsigned int flags =3D CDF_privileged | CDF_hardware;
+    domid_t domid;
     int rc;
=20
     /* The vGIC for DOM0 is exactly emulating the hardware GIC */
@@ -2074,7 +2075,11 @@ void __init create_dom0(void)
     if ( !llc_coloring_enabled )
         flags |=3D CDF_directmap;
=20
-    dom0 =3D domain_create(0, &dom0_cfg, flags);
+    domid =3D domid_alloc(0);
+    if ( domid =3D=3D DOMID_INVALID )
+        panic("Error allocating domain ID 0\n");
+
+    dom0 =3D domain_create(domid, &dom0_cfg, flags);
     if ( IS_ERR(dom0) )
         panic("Error creating domain 0 (rc =3D %ld)\n", PTR_ERR(dom0));
=20
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 1543dd251cc6..398da734c0c5 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1047,8 +1047,11 @@ static struct domain *__init create_dom0(struct boot=
_info *bi)
     if ( iommu_enabled )
         dom0_cfg.flags |=3D XEN_DOMCTL_CDF_iommu;
=20
-    /* Create initial domain.  Not d0 for pvshim. */
-    bd->domid =3D get_initial_domain_id();
+    /* Allocate initial domain ID.  Not d0 for pvshim. */
+    bd->domid =3D domid_alloc(get_initial_domain_id());
+    if ( bd->domid =3D=3D DOMID_INVALID )
+        panic("Error allocating domain ID %u\n", get_initial_domain_id());
+
     d =3D domain_create(bd->domid, &dom0_cfg,
                       pv_shim ? 0 : CDF_privileged | CDF_hardware);
     if ( IS_ERR(d) )
diff --git a/xen/common/Makefile b/xen/common/Makefile
index c316957fcb36..0c7d0f5d46e1 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -11,6 +11,7 @@ obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) +=3D devic=
e.o
 obj-$(CONFIG_DEVICE_TREE_PARSE) +=3D device-tree/
 obj-$(CONFIG_IOREQ_SERVER) +=3D dm.o
 obj-y +=3D domain.o
+obj-y +=3D domid.o
 obj-y +=3D event_2l.o
 obj-y +=3D event_channel.o
 obj-$(CONFIG_EVTCHN_FIFO) +=3D event_fifo.o
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tr=
ee/dom0less-build.c
index 6bb038111de9..f4b6b515d2d2 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -833,6 +833,7 @@ void __init create_domUs(void)
     {
         struct kernel_info ki =3D KERNEL_INFO_INIT;
         int rc =3D parse_dom0less_node(node, &ki.bd);
+        domid_t domid;
=20
         if ( rc =3D=3D -ENOENT )
             continue;
@@ -842,13 +843,13 @@ void __init create_domUs(void)
         if ( (max_init_domid + 1) >=3D DOMID_FIRST_RESERVED )
             panic("No more domain IDs available\n");
=20
-        /*
-         * The variable max_init_domid is initialized with zero, so here i=
t's
-         * very important to use the pre-increment operator to call
-         * domain_create() with a domid > 0. (domid =3D=3D 0 is reserved f=
or Dom0)
-         */
-        ki.bd.d =3D domain_create(++max_init_domid,
-                                &ki.bd.create_cfg, ki.bd.create_flags);
+        domid =3D domid_alloc(DOMID_INVALID);
+        if ( domid =3D=3D DOMID_INVALID )
+            panic("Error allocating ID for domain %s\n", dt_node_name(node=
));
+
+        max_init_domid =3D max(max_init_domid, domid);
+
+        ki.bd.d =3D domain_create(domid, &ki.bd.create_cfg, ki.bd.create_f=
lags);
         if ( IS_ERR(ki.bd.d) )
             panic("Error creating domain %s (rc =3D %ld)\n",
                   dt_node_name(node), PTR_ERR(ki.bd.d));
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 5241a1629eeb..a7e303253d1a 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -692,6 +692,8 @@ static void _domain_destroy(struct domain *d)
=20
     lock_profile_deregister_struct(LOCKPROF_TYPE_PERDOM, d);
=20
+    domid_free(d->domain_id);
+
     free_domain_struct(d);
 }
=20
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index f2a7caaf853c..71e712c1f316 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -51,20 +51,6 @@ static int xenctl_bitmap_to_nodemask(nodemask_t *nodemas=
k,
                                    MAX_NUMNODES);
 }
=20
-static inline int is_free_domid(domid_t dom)
-{
-    struct domain *d;
-
-    if ( dom >=3D DOMID_FIRST_RESERVED )
-        return 0;
-
-    if ( (d =3D rcu_lock_domain_by_id(dom)) =3D=3D NULL )
-        return 1;
-
-    rcu_unlock_domain(d);
-    return 0;
-}
-
 void getdomaininfo(struct domain *d, struct xen_domctl_getdomaininfo *info=
)
 {
     struct vcpu *v;
@@ -423,36 +409,19 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u=
_domctl)
=20
     case XEN_DOMCTL_createdomain:
     {
-        domid_t        dom;
-        static domid_t rover =3D 0;
+        /* NB: ID#0 is reserved, find the first suitable ID instead. */
+        domid_t domid =3D domid_alloc(op->domain ?: DOMID_INVALID);
=20
-        dom =3D op->domain;
-        if ( (dom > 0) && (dom < DOMID_FIRST_RESERVED) )
+        if ( domid =3D=3D DOMID_INVALID )
         {
             ret =3D -EEXIST;
-            if ( !is_free_domid(dom) )
-                break;
-        }
-        else
-        {
-            for ( dom =3D rover + 1; dom !=3D rover; dom++ )
-            {
-                if ( dom =3D=3D DOMID_FIRST_RESERVED )
-                    dom =3D 1;
-                if ( is_free_domid(dom) )
-                    break;
-            }
-
-            ret =3D -ENOMEM;
-            if ( dom =3D=3D rover )
-                break;
-
-            rover =3D dom;
+            break;
         }
=20
-        d =3D domain_create(dom, &op->u.createdomain, false);
+        d =3D domain_create(domid, &op->u.createdomain, false);
         if ( IS_ERR(d) )
         {
+            domid_free(domid);
             ret =3D PTR_ERR(d);
             d =3D NULL;
             break;
diff --git a/xen/common/domid.c b/xen/common/domid.c
new file mode 100644
index 000000000000..7839a2885810
--- /dev/null
+++ b/xen/common/domid.c
@@ -0,0 +1,95 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Domain ID allocator.
+ *
+ * Covers dom0 or late hwdom, predefined domains, post-boot domains.
+ * Excludes system domains (ID >=3D DOMID_FIRST_RESERVED).
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
+ * - If an explicit domain ID is provided, verify its availability and use=
 it
+ *   if ID is not used;
+ * - If DOMID_INVALID is provided, search [1..DOMID_FIRST_RESERVED-1] rang=
e,
+ *   starting from the last used ID. Implementation guarantees that two
+ *   consecutive calls will never return the same ID. ID#0 is reserved for
+ *   the first boot domain (currently, dom0) and excluded from the allocat=
ion
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
+            domid =3D DOMID_INVALID;
+    }
+    /*
+     * Exhaustive search.
+     *
+     * Domain ID#0 is reserved for the first boot domain (e.g. control dom=
ain)
+     * and excluded from allocation.
+     */
+    else
+    {
+        domid_t num =3D DOMID_FIRST_RESERVED;
+
+        domid =3D find_next_zero_bit(domid_bitmap, num, domid_last + 1);
+        if ( domid =3D=3D num && domid_last !=3D 0 )
+        {
+            num =3D domid_last + 1;
+            domid =3D find_next_zero_bit(domid_bitmap, num, 1);
+        }
+
+        ASSERT(domid <=3D DOMID_FIRST_RESERVED);
+        if ( domid < num )
+        {
+            __set_bit(domid, domid_bitmap);
+            domid_last =3D domid;
+        }
+        else
+            domid =3D DOMID_INVALID;
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
+    ASSERT(domid <=3D DOMID_FIRST_RESERVED);
+
+    spin_lock(&domid_lock);
+    rc =3D __test_and_clear_bit(domid, domid_bitmap);
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
=20
 domid_t get_initial_domain_id(void);
=20
+domid_t domid_alloc(domid_t domid);
+void domid_free(domid_t domid);
+
 /* CDF_* constant. Internal flags for domain creation. */
 /* Is this a privileged domain? */
 #define CDF_privileged           (1U << 0)
--=20
2.34.1



