Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BA6A8B01B
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 08:15:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.955072.1348911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4w3W-0004pc-Ig; Wed, 16 Apr 2025 06:15:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 955072.1348911; Wed, 16 Apr 2025 06:15:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4w3W-0004ni-GA; Wed, 16 Apr 2025 06:15:30 +0000
Received: by outflank-mailman (input) for mailman id 955072;
 Wed, 16 Apr 2025 06:15:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1z0E=XC=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u4w3U-0004nc-IM
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 06:15:29 +0000
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch
 [79.135.106.31]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3043263b-1a8a-11f0-9eaf-5ba50f476ded;
 Wed, 16 Apr 2025 08:15:26 +0200 (CEST)
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
X-Inumbo-ID: 3043263b-1a8a-11f0-9eaf-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1744784125; x=1745043325;
	bh=bVktnvEfiZN3tRkTsGceg+QCeJY1reNnd4H/1QHjy40=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=EqZDLofqt8TuhX1FPl8dn0GywWuaz7fQCWWIlHTMCmCaG+57W9M4O7OHxHpKvkRrm
	 aQ23Ib3uZqrykX7YLcJn4F1dg23rA5IU0UvpzSPzEeJQNbiONLbdR2WzXSrlPswIIB
	 YJUBZhzcSPBbAfX35YAbgLNMjZIXR6iYFDhc4ZMwj9KqY0zUs3qwmmxW/KRriWI17w
	 nwpDmh6vD1OsaIr63T8t6xVLZ6N5XV206qauICQqnUeHl2evTvyVDkc1yQ55tCNUYo
	 n3Jug9YwCJM56uzOyQuGbZvWeruKaV+mzfgZUSVc+kz6PS/vy9RHENQXxjFv5g5brR
	 P0SqkuZmMjoFA==
Date: Wed, 16 Apr 2025 06:15:18 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v3] xen/domain: unify domain ID allocation
Message-ID: <20250416061509.934220-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 67fce5b5eef23c2c07a625da54181b821bb4b2aa
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Unify the logic of domain ID allocation, so that both the initial domain
creation and the usage by domctl use the same helper function across
architectures (Arm and x86).

Wrap the domain ID allocation as an arch-independent function domid_alloc()=
 in
common/domain.c.

Allocation algorithm:
- If an explicit domain ID is provided, verify its availability and
  use it if ID is unused;
- Otherwise, perform an exhaustive search for the first available ID
  within the [0..DOMID_FIRST_RESERVED) range, excluding hardware_domid.

Move the is_free_domid() helper closer to domid_alloc(). Simplify
is_free_domid() by removing the domain ID range check, as the ID is now
guaranteed to be within the valid range. Additionally, update the predicate=
 to
return a bool value instead of an int.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Link to v2: https://lore.kernel.org/xen-devel/20250331230508.440198-3-dmukh=
in@ford.com/
CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/177080184=
7

I hope by moving it to an isolated thread the review will be simpler.

Changes since v2:
- added max_init_domid change so the patch does not need to depend on
  other patches
- moved uses of domid_alloc() close to domain_create()
- use DOMID_INVALID as the indicator for doing an exhaustive domain ID sear=
ch
---
 xen/arch/arm/dom0less-build.c | 19 ++++++++-------
 xen/arch/arm/domain_build.c   | 19 +++++++++++----
 xen/arch/x86/setup.c          |  8 +++++--
 xen/common/domain.c           | 45 +++++++++++++++++++++++++++++++++++
 xen/common/domctl.c           | 45 ++++-------------------------------
 xen/include/xen/domain.h      |  2 ++
 6 files changed, 81 insertions(+), 57 deletions(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index bd15563750..387ba938ba 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -993,15 +993,13 @@ void __init create_domUs(void)
             .grant_opts =3D XEN_DOMCTL_GRANT_version(opt_gnttab_max_versio=
n),
         };
         unsigned int flags =3D 0U;
+        domid_t domid;
         uint32_t val;
         int rc;
=20
         if ( !dt_device_is_compatible(node, "xen,domain") )
             continue;
=20
-        if ( (max_init_domid + 1) >=3D DOMID_FIRST_RESERVED )
-            panic("No more domain IDs available\n");
-
         if ( dt_find_property(node, "xen,static-mem", NULL) )
         {
             if ( llc_coloring_enabled )
@@ -1125,12 +1123,15 @@ void __init create_domUs(void)
         if ( !llc_coloring_enabled && llc_colors_str )
             panic("'llc-colors' found, but LLC coloring is disabled\n");
=20
-        /*
-         * The variable max_init_domid is initialized with zero, so here i=
t's
-         * very important to use the pre-increment operator to call
-         * domain_create() with a domid > 0. (domid =3D=3D 0 is reserved f=
or Dom0)
-         */
-        d =3D domain_create(++max_init_domid, &d_cfg, flags);
+        rc =3D domid_alloc(DOMID_INVALID);
+        if ( rc < 0 )
+            panic("Error allocating ID for domain %s (rc =3D %d)\n",
+                  dt_node_name(node), rc);
+        domid =3D rc;
+        if ( max_init_domid < domid )
+            max_init_domid =3D domid;
+
+        d =3D domain_create(domid, &d_cfg, flags);
         if ( IS_ERR(d) )
             panic("Error creating domain %s (rc =3D %ld)\n",
                   dt_node_name(node), PTR_ERR(d));
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 634333cdde..2ee6ffd30b 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2370,6 +2370,7 @@ void __init create_dom0(void)
         .grant_opts =3D XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
     };
     unsigned int flags =3D CDF_privileged;
+    domid_t domid;
     int rc;
=20
     /* The vGIC for DOM0 is exactly emulating the hardware GIC */
@@ -2394,19 +2395,27 @@ void __init create_dom0(void)
     if ( !llc_coloring_enabled )
         flags |=3D CDF_directmap;
=20
-    dom0 =3D domain_create(0, &dom0_cfg, flags);
+    rc =3D domid_alloc(get_initial_domain_id());
+    if ( rc < 0 )
+        panic("Error allocating domain ID %d (rc =3D %d)\n",
+              get_initial_domain_id(), rc);
+    domid =3D rc;
+
+    dom0 =3D domain_create(domid, &dom0_cfg, flags);
     if ( IS_ERR(dom0) )
-        panic("Error creating domain 0 (rc =3D %ld)\n", PTR_ERR(dom0));
+        panic("Error creating domain %d (rc =3D %ld)\n", domid, PTR_ERR(do=
m0));
=20
     if ( llc_coloring_enabled && (rc =3D dom0_set_llc_colors(dom0)) )
-        panic("Error initializing LLC coloring for domain 0 (rc =3D %d)\n"=
, rc);
+        panic("Error initializing LLC coloring for domain %d (rc =3D %d)\n=
",
+              domid, rc);
=20
     if ( alloc_dom0_vcpu0(dom0) =3D=3D NULL )
-        panic("Error creating domain 0 vcpu0\n");
+        panic("Error creating domain %d vcpu0\n", domid);
=20
     rc =3D construct_dom0(dom0);
     if ( rc )
-        panic("Could not set up DOM0 guest OS (rc =3D %d)\n", rc);
+        panic("Could not set up guest OS for domain %d (rc =3D %d)\n",
+              domid, rc);
 }
=20
 /*
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 3c257f0bad..e20a416bf4 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1009,8 +1009,12 @@ static struct domain *__init create_dom0(struct boot=
_info *bi)
     if ( iommu_enabled )
         dom0_cfg.flags |=3D XEN_DOMCTL_CDF_iommu;
=20
-    /* Create initial domain.  Not d0 for pvshim. */
-    bd->domid =3D get_initial_domain_id();
+    /* Allocate initial domain ID. Not d0 for pvshim. */
+    bd->domid =3D domid_alloc(get_initial_domain_id());
+    if ( bd->domid < 0 )
+        panic("Error allocating domain ID %d (rc =3D %d)\n",
+              get_initial_domain_id(), bd->domid);
+
     d =3D domain_create(bd->domid, &dom0_cfg, pv_shim ? 0 : CDF_privileged=
);
     if ( IS_ERR(d) )
         panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 585fd726a9..db98d9c1b2 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -66,6 +66,51 @@ DEFINE_RCU_READ_LOCK(domlist_read_lock);
 static struct domain *domain_hash[DOMAIN_HASH_SIZE];
 struct domain *domain_list;
=20
+static inline bool is_free_domid(domid_t dom)
+{
+    struct domain *d =3D rcu_lock_domain_by_id(dom);
+
+    if ( d )
+        rcu_unlock_domain(d);
+
+    return !d;
+}
+
+/*
+ * Allocate new domain ID based on the hint.
+ *
+ * If hint is outside of valid [0..DOMID_FIRST_RESERVED] range of IDs,
+ * perform an exhaustive search of the first free domain ID excluding
+ * hardware_domid.
+ */
+int domid_alloc(int hint)
+{
+    domid_t domid;
+
+    if ( hint >=3D 0 && hint < DOMID_FIRST_RESERVED )
+    {
+        if ( !is_free_domid(hint) )
+            return -EEXIST;
+
+        domid =3D hint;
+    }
+    else
+    {
+        for ( domid =3D 0; domid < DOMID_FIRST_RESERVED; domid++ )
+        {
+            if ( domid =3D=3D hardware_domid )
+                continue;
+            if ( is_free_domid(domid) )
+                break;
+        }
+
+        if ( domid =3D=3D DOMID_FIRST_RESERVED )
+            return -ENOMEM;
+    }
+
+    return domid;
+}
+
 /*
  * Insert a domain into the domlist/hash.  This allows the domain to be lo=
oked
  * up by domid, and therefore to be the subject of hypercalls/etc.
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index bfe2e1f9f0..3d21612660 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -49,20 +49,6 @@ static int xenctl_bitmap_to_nodemask(nodemask_t *nodemas=
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
@@ -421,34 +407,11 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u=
_domctl)
=20
     case XEN_DOMCTL_createdomain:
     {
-        domid_t        dom;
-        static domid_t rover =3D 0;
+        ret =3D domid_alloc(op->domain);
+        if ( ret < 0 )
+            break;
=20
-        dom =3D op->domain;
-        if ( (dom > 0) && (dom < DOMID_FIRST_RESERVED) )
-        {
-            ret =3D -EEXIST;
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
-        }
-
-        d =3D domain_create(dom, &op->u.createdomain, false);
+        d =3D domain_create(ret, &op->u.createdomain, false);
         if ( IS_ERR(d) )
         {
             ret =3D PTR_ERR(d);
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index a34daa7d10..9f2470b095 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -38,6 +38,8 @@ void arch_get_domain_info(const struct domain *d,
=20
 domid_t get_initial_domain_id(void);
=20
+int domid_alloc(int hint);
+
 /* CDF_* constant. Internal flags for domain creation. */
 /* Is this a privileged domain? */
 #define CDF_privileged           (1U << 0)
--=20
2.34.1



