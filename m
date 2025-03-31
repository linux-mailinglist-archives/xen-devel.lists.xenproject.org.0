Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A84A77140
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 01:06:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933115.1335159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzOCL-0003o4-VY; Mon, 31 Mar 2025 23:05:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933115.1335159; Mon, 31 Mar 2025 23:05:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzOCL-0003lt-RQ; Mon, 31 Mar 2025 23:05:41 +0000
Received: by outflank-mailman (input) for mailman id 933115;
 Mon, 31 Mar 2025 23:05:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MI1n=WS=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tzOCJ-0003Id-Ve
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 23:05:39 +0000
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch
 [109.224.244.17]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8ee703a-0e84-11f0-9ffb-bf95429c2676;
 Tue, 01 Apr 2025 01:05:38 +0200 (CEST)
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
X-Inumbo-ID: a8ee703a-0e84-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1743462337; x=1743721537;
	bh=dyXCUi+vmDLIhO4Pef6I/Jb6d7Tp3JhCzVlgaMYn8zA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=CVrRv41s7ikszRZ1TD7hqNSvr7SfqUuX4M3w3zdW2qkcrSoWhgHfdDKKwyM1xEoU5
	 0sF2u7EaaT88jd1bXRa2v3uKHgujlUwBa54CGQ4cUvKEH/pPvFnhTkoe17wpyvB42D
	 7p0/9SFfXfVxlnY9mL2NbgW8xOGOddbaARz/Ojj0GFotyWg7RtnEOmjTknL2LnFF9J
	 Ek9ChGaaEx705E6Khbs7zpW59vjrP8usoxs6xZALvql14Hj+n+A+QiXPr2J5m0ik8v
	 4BBdAhF/na64PfZ96GRqUOisQMYdww6g0TamQnZfx831VI7NeacVh+nyK8ZpnYmhGK
	 lLyj1cing/maA==
Date: Mon, 31 Mar 2025 23:05:33 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v2 2/7] xen/domain: introduce domid_alloc()
Message-ID: <20250331230508.440198-3-dmukhin@ford.com>
In-Reply-To: <20250331230508.440198-1-dmukhin@ford.com>
References: <20250331230508.440198-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 34cd198a2bef150aa01177dde758ad9e039cc326
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Move domain ID allocation during domain creation to a dedicated
function domid_alloc().

Allocation algorithm:
- If an explicit domain ID is provided, verify its availability and
  use it if ID is unused;
- Otherwise, perform an exhaustive search for the first available ID
  within the [0..DOMID_FIRST_RESERVED) range, excluding hardware_domid.

This minimizes the use of max_init_domid in the code and, thus, is a
prerequisite change for enabling console input rotation across domains
with console input permission on x86 platforms (which currently is
limited to dom0, PV shim and Xen).

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v1:
- use domid_alloc() during dom0 creation on x86
---
 xen/arch/arm/dom0less-build.c | 15 ++++++------
 xen/arch/arm/domain_build.c   | 19 +++++++++++----
 xen/arch/x86/setup.c          |  8 ++++++-
 xen/common/domain.c           | 45 +++++++++++++++++++++++++++++++++++
 xen/common/domctl.c           | 45 ++++-------------------------------
 xen/include/xen/domain.h      |  3 +++
 6 files changed, 80 insertions(+), 55 deletions(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 573b0d25ae..4b9e22039e 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -975,14 +975,18 @@ void __init create_domUs(void)
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
+        rc =3D domid_alloc(DOMID_AUTO);
+        if ( rc < 0 )
+            panic("cannot allocate domain ID for domain %s (rc =3D %d)\n",
+                  dt_node_name(node), rc);
+        domid =3D rc;
=20
         if ( dt_find_property(node, "xen,static-mem", NULL) )
         {
@@ -1107,12 +1111,7 @@ void __init create_domUs(void)
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
+        d =3D domain_create(domid, &d_cfg, flags);
         if ( IS_ERR(d) )
             panic("Error creating domain %s (rc =3D %ld)\n",
                   dt_node_name(node), PTR_ERR(d));
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 2b5b433183..2d8c2931d6 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2367,8 +2367,15 @@ void __init create_dom0(void)
         .grant_opts =3D XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
     };
     unsigned int flags =3D CDF_privileged;
+    domid_t domid;
     int rc;
=20
+    rc =3D domid_alloc(get_initial_domain_id());
+    if ( rc < 0 )
+        panic("Cannot use domain ID %d (rc =3D %d)\n",
+              get_initial_domain_id(), rc);
+    domid =3D rc;
+
     /* The vGIC for DOM0 is exactly emulating the hardware GIC */
     dom0_cfg.arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE;
     dom0_cfg.arch.nr_spis =3D VGIC_DEF_NR_SPIS;
@@ -2391,19 +2398,21 @@ void __init create_dom0(void)
     if ( !llc_coloring_enabled )
         flags |=3D CDF_directmap;
=20
-    dom0 =3D domain_create(0, &dom0_cfg, flags);
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
index d70abb7e0c..ad349528ea 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -996,6 +996,7 @@ static struct domain *__init create_dom0(struct boot_in=
fo *bi)
     domid_t domid;
     struct boot_module *image;
     unsigned int idx;
+    int rc;
=20
     idx =3D first_boot_module_index(bi, BOOTMOD_KERNEL);
     if ( idx >=3D bi->nr_modules )
@@ -1003,6 +1004,12 @@ static struct domain *__init create_dom0(struct boot=
_info *bi)
=20
     image =3D &bi->mods[idx];
=20
+    rc =3D domid_alloc(get_initial_domain_id());
+    if ( rc < 0 )
+        panic("Cannot use domain ID %d (rc =3D %d)\n",
+              get_initial_domain_id(), rc);
+    domid =3D rc;
+
     if ( opt_dom0_pvh )
     {
         dom0_cfg.flags |=3D (XEN_DOMCTL_CDF_hvm |
@@ -1017,7 +1024,6 @@ static struct domain *__init create_dom0(struct boot_=
info *bi)
         dom0_cfg.flags |=3D XEN_DOMCTL_CDF_iommu;
=20
     /* Create initial domain.  Not d0 for pvshim. */
-    domid =3D get_initial_domain_id();
     d =3D domain_create(domid, &dom0_cfg, pv_shim ? 0 : CDF_privileged);
     if ( IS_ERR(d) )
         panic("Error creating d%u: %ld\n", domid, PTR_ERR(d));
diff --git a/xen/common/domain.c b/xen/common/domain.c
index b9f549c617..b07d70a7e3 100644
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
index 83069de501..9b7159a743 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -37,6 +37,9 @@ void arch_get_domain_info(const struct domain *d,
=20
 domid_t get_initial_domain_id(void);
=20
+#define DOMID_AUTO               (-1)
+int domid_alloc(int hint);
+
 /* CDF_* constant. Internal flags for domain creation. */
 /* Is this a privileged domain? */
 #define CDF_privileged           (1U << 0)
--=20
2.34.1



