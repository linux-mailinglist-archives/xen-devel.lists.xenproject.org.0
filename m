Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1068FB14206
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 20:35:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061852.1427452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugSgV-0001tJ-Kt; Mon, 28 Jul 2025 18:34:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061852.1427452; Mon, 28 Jul 2025 18:34:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugSgV-0001qZ-GV; Mon, 28 Jul 2025 18:34:51 +0000
Received: by outflank-mailman (input) for mailman id 1061852;
 Mon, 28 Jul 2025 18:34:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BLX+=2J=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ugSgU-0001cP-Dz
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 18:34:50 +0000
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch
 [109.224.244.16]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a8b6464-6be1-11f0-b895-0df219b8e170;
 Mon, 28 Jul 2025 20:34:48 +0200 (CEST)
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
X-Inumbo-ID: 8a8b6464-6be1-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1753727687; x=1753986887;
	bh=5/fATqD8Koyp7BvXnMJUpFUtZ0tCkLPqX6MEFhwjQkA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=hzdz+WG7seKe8/Ij9Xa15fQqw6/i6gqQoc6JOzpn37LJXdT1O0uey3P0ugJLDGoRi
	 xy/9r4811d0Y6VaXwNetlL5DFc6mZsTogf3+MJgclWOxwcnrsym2UVFy1efWJ9ndFv
	 ErMfiXYZsNA2nkE+yQR0r4Zx3vFEeOUT1YzEgCW5RcdpKTVs8r+LFfW2scIZP+TiKD
	 AAJN1XEAqiQmu5huPn7rOoDsdvdCXhHPAmppeJvzzCs6cEFFa5GcXEcs4+9xaNufQf
	 jJla/uyAt8IhXdJgvMis1oY+L1p5jpwsvBHobMTPFzAt2OMna7eFiJjYjZG+d3fF2z
	 1RX+LgSSf0Z3A==
Date: Mon, 28 Jul 2025 18:34:42 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: alejandro.garciavallejo@amd.com, andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v11 1/3] xen/domain: unify domain ID allocation
Message-ID: <20250728183427.1013975-2-dmukhin@ford.com>
In-Reply-To: <20250728183427.1013975-1-dmukhin@ford.com>
References: <20250728183427.1013975-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 52f895d429f4ebb4181e46b20223efc2d1be5e92
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
  starting from the last used ID. IDs are not wrapped around in dom0less ca=
se.
  Implementation guarantees that two consecutive calls will never return th=
e
  same ID. ID#0 is reserved for the first boot domain (currently, dom0) and
  excluded from the allocation range.

Remove is_free_domid() helper as it is not needed now.

No functional change intended.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v10:
- fixup #ifdefs in domid_alloc()
- corrected use of domid_free() in domain_destroy()
- rebased
- moved domid_{alloc,free}() to common/domid.c so the functional test could=
 be
  added later
---
 xen/arch/arm/domain_build.c             |  7 +-
 xen/arch/x86/setup.c                    |  7 +-
 xen/common/Makefile                     |  1 +
 xen/common/device-tree/dom0less-build.c | 15 ++--
 xen/common/domain.c                     |  2 +
 xen/common/domctl.c                     | 42 ++---------
 xen/common/domid.c                      | 93 +++++++++++++++++++++++++
 xen/include/xen/domain.h                |  3 +
 8 files changed, 122 insertions(+), 48 deletions(-)
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
index 1543dd251cc6..2ff7c28c277b 100644
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
+        panic("Error allocating domain ID %d\n", get_initial_domain_id());
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
index 6bb038111de9..1f9461d0e738 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -833,21 +833,20 @@ void __init create_domUs(void)
     {
         struct kernel_info ki =3D KERNEL_INFO_INIT;
         int rc =3D parse_dom0less_node(node, &ki.bd);
+        domid_t domid;
=20
         if ( rc =3D=3D -ENOENT )
             continue;
         if ( rc )
             panic("Malformed DTB: Invalid domain %s\n", dt_node_name(node)=
);
=20
-        if ( (max_init_domid + 1) >=3D DOMID_FIRST_RESERVED )
-            panic("No more domain IDs available\n");
+        domid =3D domid_alloc(DOMID_INVALID);
+        if ( domid =3D=3D DOMID_INVALID )
+            panic("Error allocating ID for domain %s\n", dt_node_name(node=
));
+        if ( max_init_domid < domid )
+            max_init_domid =3D domid;
=20
-        /*
-         * The variable max_init_domid is initialized with zero, so here i=
t's
-         * very important to use the pre-increment operator to call
-         * domain_create() with a domid > 0. (domid =3D=3D 0 is reserved f=
or Dom0)
-         */
-        ki.bd.d =3D domain_create(++max_init_domid,
+        ki.bd.d =3D domain_create(domid,
                                 &ki.bd.create_cfg, ki.bd.create_flags);
         if ( IS_ERR(ki.bd.d) )
             panic("Error creating domain %s (rc =3D %ld)\n",
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 3c65cca5b0ff..23dbc1f46c78 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1466,6 +1466,8 @@ void domain_destroy(struct domain *d)
     /* Remove from the domlist/hash. */
     domlist_remove(d);
=20
+    domid_free(d->domain_id);
+
     /* Schedule RCU asynchronous completion of domain destroy. */
     call_rcu(&d->rcu, complete_domain_destroy);
 }
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index f2a7caaf853c..5509998aa139 100644
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
@@ -423,36 +409,18 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u=
_domctl)
=20
     case XEN_DOMCTL_createdomain:
     {
-        domid_t        dom;
-        static domid_t rover =3D 0;
+        domid_t domid =3D domid_alloc(op->domain);
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
index 000000000000..e553ab6e5468
--- /dev/null
+++ b/xen/common/domid.c
@@ -0,0 +1,93 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Domain ID allocator.
+ * Covers dom0 or late hwdom, predefined domains, post-boot domains; exclu=
des
+ * Xen system domains (ID >=3D DOMID_FIRST_RESERVED).
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
+ * @param[in] domid Exact domain ID within [0..DOMID_FIRST_RESERVED-1] ran=
ge or
+ *                  DOMID_INVALID for exhaustive search within
+ *                  [1..DOMID_FIRST_RESERVED-1].
+ * @return Valid domain ID in case of successful allocation,
+ *         DOMID_INVALID - otherwise.
+ */
+domid_t cf_check domid_alloc(domid_t domid)
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
+     *
+     * In dom0less build, domains are not dynamically destroyed, so there'=
s no
+     * need to do a wraparound of the IDs.
+     */
+#ifdef CONFIG_DOM0LESS_BOOT
+    else if ( domid_last + 1 >=3D DOMID_FIRST_RESERVED )
+        domid =3D DOMID_INVALID;
+#endif
+    else
+    {
+        domid =3D find_next_zero_bit(domid_bitmap,
+                                   DOMID_FIRST_RESERVED,
+                                   domid_last + 1);
+#ifndef CONFIG_DOM0LESS_BOOT
+        ASSERT(domid <=3D DOMID_FIRST_RESERVED);
+        if ( domid =3D=3D DOMID_FIRST_RESERVED )
+            domid =3D find_next_zero_bit(domid_bitmap,
+                                       DOMID_FIRST_RESERVED,
+                                       1);
+#endif
+
+        if ( domid < DOMID_FIRST_RESERVED )
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
+void cf_check domid_free(domid_t domid)
+{
+    ASSERT(domid <=3D DOMID_FIRST_RESERVED);
+
+    spin_lock(&domid_lock);
+    __clear_bit(domid, domid_bitmap);
+    spin_unlock(&domid_lock);
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
index e10baf2615fd..31946bb1b653 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -38,6 +38,9 @@ void arch_get_domain_info(const struct domain *d,
=20
 domid_t get_initial_domain_id(void);
=20
+domid_t cf_check domid_alloc(domid_t domid);
+void cf_check domid_free(domid_t domid);
+
 /* CDF_* constant. Internal flags for domain creation. */
 /* Is this a privileged domain? */
 #define CDF_privileged           (1U << 0)
--=20
2.34.1



