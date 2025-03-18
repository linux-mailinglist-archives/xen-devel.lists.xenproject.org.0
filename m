Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94427A680C4
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 00:37:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919892.1324259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tugUP-00057o-5V; Tue, 18 Mar 2025 23:36:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919892.1324259; Tue, 18 Mar 2025 23:36:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tugUP-00054O-11; Tue, 18 Mar 2025 23:36:53 +0000
Received: by outflank-mailman (input) for mailman id 919892;
 Tue, 18 Mar 2025 23:36:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6oY5=WF=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tugUO-0004Rg-21
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 23:36:52 +0000
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd39c87a-0451-11f0-9899-31a8f345e629;
 Wed, 19 Mar 2025 00:36:50 +0100 (CET)
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
X-Inumbo-ID: dd39c87a-0451-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1742341008; x=1742600208;
	bh=5+7Swk3BoRdHzWMaplmAr3XGJqn1SC0JZyVTBod6PsE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=lgw/v88V3dGHf1I0jQKeceXMMjN3X9xQiDpef/IR4E+FIoElURXcaM2bCmLMe8m9d
	 IJkZ1+d4mi0Ve9JpYiOR1pn9OsuGxz7poAT188JFSSwXQ4Hfsu/Q2N6gSxXE82UHDd
	 WpSDVPIepjECTV64yPle+/w9IBs0Uom2rYrh0KFTg8PE7aPeQupKaQp+E0dUoRJmu2
	 krKB4egtruJY/kAaN3kov6BY+l0+BykusHLCPZ4d2bDTtMum6Eh07bar6PMowTe8Fu
	 6+HqQydSjLCWYXxPdSSnW/VJs+4G72zS8tkiiBBJ997THbVN66yNR7K/JAEgsq96mD
	 HX4fQH4MpwkQA==
Date: Tue, 18 Mar 2025 23:36:44 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v1 4/8] xen/domain: introduce domid_alloc()
Message-ID: <20250318233617.849903-5-dmukhin@ford.com>
In-Reply-To: <20250318233617.849903-1-dmukhin@ford.com>
References: <20250318233617.849903-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: b4c7297e86a6cd66f321795cab7881583df8818c
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Move domain ID allocation to a dedicated function domid_alloc() and
use it during domain creation.

Update domid_top within domid_alloc() to reflect the highest known
domain ID.

Initialize domid_top using the result of get_initial_domain_id().

Allocation algorithm:
- If an explicit domain ID is provided, verify its availability and
  use it if free;
- Otherwise, perform an exhaustive search for the first available ID
  within the [0..DOMID_FIRST_RESERVED) range, excluding hardware_domid.

The change is a prerequisite for enabling console input rotation
across domains on x86 (currently, limited to dom0, PV shim and Xen).

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/arm/dom0less-build.c | 15 ++++----
 xen/arch/arm/domain_build.c   | 19 +++++++---
 xen/common/domctl.c           | 71 ++++++++++++++++++++++-------------
 xen/common/kernel.c           |  8 ++++
 xen/include/xen/domain.h      |  3 ++
 5 files changed, 76 insertions(+), 40 deletions(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index d7d7665c0a..4b9e22039e 100644
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
-        if ( (domid_top + 1) >=3D DOMID_FIRST_RESERVED )
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
-        d =3D domain_create(++domid_top, &d_cfg, flags);
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
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index bfe2e1f9f0..9964aa000a 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -63,6 +63,46 @@ static inline int is_free_domid(domid_t dom)
     return 0;
 }
=20
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
+        for ( domid =3D domid_top + 1; domid !=3D domid_top; domid++ )
+        {
+            if ( domid =3D=3D DOMID_FIRST_RESERVED )
+                domid =3D 0;
+            if ( domid =3D=3D hardware_domid )
+                continue;
+            if ( is_free_domid(domid) )
+                break;
+        }
+
+        if ( domid =3D=3D domid_top )
+            return -ENOMEM;
+    }
+
+    if ( domid_top < domid )
+        domid_top =3D domid;
+
+    return domid;
+}
+
 void getdomaininfo(struct domain *d, struct xen_domctl_getdomaininfo *info=
)
 {
     struct vcpu *v;
@@ -421,34 +461,11 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u=
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
diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index 8b63ca55f1..50c44b986e 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -568,6 +568,14 @@ static long xenver_varbuf_op(int cmd, XEN_GUEST_HANDLE=
_PARAM(void) arg)
     return sz;
 }
=20
+static int __init cf_check globals_init(void)
+{
+    domid_top =3D get_initial_domain_id();
+
+    return 0;
+}
+__initcall(globals_init);
+
 long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     bool deny =3D xsm_xen_version(XSM_OTHER, cmd);
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index b7425827b8..c91b9704de 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -39,6 +39,9 @@ extern domid_t domid_top;
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



