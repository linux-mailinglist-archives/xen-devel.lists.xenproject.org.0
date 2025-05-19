Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D69DFABC7B6
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 21:23:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990170.1374114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH65J-0007g1-Kn; Mon, 19 May 2025 19:23:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990170.1374114; Mon, 19 May 2025 19:23:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH65J-0007dX-HC; Mon, 19 May 2025 19:23:37 +0000
Received: by outflank-mailman (input) for mailman id 990170;
 Mon, 19 May 2025 19:23:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wD6k=YD=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uH65I-0007ND-GG
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 19:23:36 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1bb89ce-34e6-11f0-b892-0df219b8e170;
 Mon, 19 May 2025 21:23:34 +0200 (CEST)
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
X-Inumbo-ID: c1bb89ce-34e6-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1747682612; x=1747941812;
	bh=rQWgIHLHmbS0TIalS6R8fgsHrwCunvDl9aKdr7mtmX4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=DsN+YQjTk0OmHjHQpuk65cI+tQ3DTParuSUFcbTqTNdHrPIScEP2lYA/0IqHn/cCI
	 R7xTxrBpbl61BDjHVt3vSOYTqL09vD656bg5Vb5yGLfcx+YvHhLHVDFiZHEwPZcBzr
	 gXLSuv32V3OU4dcYmbq/OPbvy4wgNbTuuQbGD3IG66+Mh1qlG8tMwN8dC6CBISOvpG
	 VmhZRZzx6n9s8GCK1VEHa8IoHJIItQsNRt03RiCEWwz541qtoIXL5V/Hv23h5DDFOJ
	 NmRhEkyYqOmo94szAzNR5Quq0jLtbwtUHF0iNp6QnCbDmYJuOrcjfb9A18xUXPLqoN
	 VtjBsXP/bzdbA==
Date: Mon, 19 May 2025 19:23:27 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, teddy.astie@vates.tech, dmukhin@ford.com
Subject: [PATCH v7 1/3] xen/domain: unify domain ID allocation
Message-ID: <20250519192306.1364471-2-dmukhin@ford.com>
In-Reply-To: <20250519192306.1364471-1-dmukhin@ford.com>
References: <20250519192306.1364471-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 56997b8d44c109755c76eb5c07309375e52417ec
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Currently, hypervisor code has two different non-system domain ID allocatio=
n
implementations:

  (a) Sequential IDs allocation in dom0less Arm code based on max_init_domi=
d;

  (b) Sequential IDs allocation in XEN_DOMCTL_createdomain; does not use
      max_init_domid (both Arm and x86).

It makes sense to have a common helper code for such task across architectu=
res
(Arm and x86) and between dom0less / toolstack domU allocation.

Wrap the domain ID allocation as an arch-independent function domid_alloc()=
 in
common/domain.c based on the bitmap.

Allocation algorithm:
- If an explicit domain ID is provided, verify its availability and use it =
if
  ID is not used;
- If DOMID_INVALID is provided, perform an exhaustive search within
  [0..CONFIG_MAX_DOMID-1] range, starting from the last used domain ID.
  domid_alloc() guarantees that two subsequent calls will result in differe=
nt
  IDs allocation.

Also, remove is_free_domid() helper as it is not needed now.

No functional change intended.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v6:
- reworked to bitmap
- dropped incorrect uses of ASSERT()
- fixed XEN_DOMCTL_createdomain to call domid_free() in case of unsuccessfu=
l ID
  allocation
---
 xen/arch/arm/domain_build.c             | 17 ++++++---
 xen/arch/x86/setup.c                    | 11 +++---
 xen/common/device-tree/dom0less-build.c | 10 +++---
 xen/common/domain.c                     | 48 +++++++++++++++++++++++++
 xen/common/domctl.c                     | 42 +++-------------------
 xen/include/xen/domain.h                |  3 ++
 6 files changed, 81 insertions(+), 50 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index b189a7cfae..e9d563c269 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2010,6 +2010,7 @@ void __init create_dom0(void)
         .grant_opts =3D XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
     };
     unsigned int flags =3D CDF_privileged | CDF_hardware;
+    domid_t domid;
     int rc;
=20
     /* The vGIC for DOM0 is exactly emulating the hardware GIC */
@@ -2034,19 +2035,25 @@ void __init create_dom0(void)
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
-        panic("Error creating domain 0 (rc =3D %ld)\n", PTR_ERR(dom0));
+        panic("Error creating domain %d (rc =3D %ld)\n", domid, PTR_ERR(do=
m0));
=20
     if ( llc_coloring_enabled && (rc =3D dom0_set_llc_colors(dom0)) )
-        panic("Error initializing LLC coloring for domain 0 (rc =3D %d)\n"=
, rc);
+        panic("Error initializing LLC coloring for domain %pd (rc =3D %d)\=
n",
+              dom0, rc);
=20
     if ( alloc_dom0_vcpu0(dom0) =3D=3D NULL )
-        panic("Error creating domain 0 vcpu0\n");
+        panic("Error creating domain %pdv0\n", dom0);
=20
     rc =3D construct_dom0(dom0);
     if ( rc )
-        panic("Could not set up DOM0 guest OS (rc =3D %d)\n", rc);
+        panic("Could not set up guest OS for domain %pd (rc =3D %d)\n",
+              dom0, rc);
=20
     set_xs_domain(dom0);
 }
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 2518954124..ac1c3e669b 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1030,8 +1030,11 @@ static struct domain *__init create_dom0(struct boot=
_info *bi)
     if ( iommu_enabled )
         dom0_cfg.flags |=3D XEN_DOMCTL_CDF_iommu;
=20
-    /* Create initial domain.  Not d0 for pvshim. */
-    bd->domid =3D get_initial_domain_id();
+    /* Allocate initial domain ID. Not d0 for pvshim. */
+    bd->domid =3D domid_alloc(get_initial_domain_id());
+    if ( bd->domid =3D=3D DOMID_INVALID )
+        panic("Error allocating domain ID %d\n", get_initial_domain_id());
+
     d =3D domain_create(bd->domid, &dom0_cfg,
                       pv_shim ? 0 : CDF_privileged | CDF_hardware);
     if ( IS_ERR(d) )
@@ -1063,7 +1066,7 @@ static struct domain *__init create_dom0(struct boot_=
info *bi)
=20
         if ( (strlen(acpi_param) =3D=3D 0) && acpi_disabled )
         {
-            printk("ACPI is disabled, notifying Domain 0 (acpi=3Doff)\n");
+            printk("ACPI is disabled, notifying domain %pd (acpi=3Doff)\n"=
, d);
             safe_strcpy(acpi_param, "off");
         }
=20
@@ -1078,7 +1081,7 @@ static struct domain *__init create_dom0(struct boot_=
info *bi)
=20
     bd->d =3D d;
     if ( construct_dom0(bd) !=3D 0 )
-        panic("Could not construct domain 0\n");
+        panic("Could not construct domain %pd\n", d);
=20
     bd->cmdline =3D NULL;
     xfree(cmdline);
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tr=
ee/dom0less-build.c
index 2c56f13771..9236dbae11 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -850,15 +850,13 @@ void __init create_domUs(void)
         struct xen_domctl_createdomain d_cfg =3D {0};
         unsigned int flags =3D 0U;
         bool has_dtb =3D false;
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
         d_cfg.max_evtchn_port =3D 1023;
         d_cfg.max_grant_frames =3D -1;
         d_cfg.max_maptrack_frames =3D -1;
@@ -981,7 +979,11 @@ void __init create_domUs(void)
          * very important to use the pre-increment operator to call
          * domain_create() with a domid > 0. (domid =3D=3D 0 is reserved f=
or Dom0)
          */
-        d =3D domain_create(++max_init_domid, &d_cfg, flags);
+        domid =3D domid_alloc(++max_init_domid);
+        if ( domid =3D=3D DOMID_INVALID )
+            panic("Error allocating ID for domain %s\n", dt_node_name(node=
));
+
+        d =3D domain_create(domid, &d_cfg, flags);
         if ( IS_ERR(d) )
             panic("Error creating domain %s (rc =3D %ld)\n",
                   dt_node_name(node), PTR_ERR(d));
diff --git a/xen/common/domain.c b/xen/common/domain.c
index abf1969e60..37fe811f3f 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -66,6 +66,12 @@ DEFINE_RCU_READ_LOCK(domlist_read_lock);
 static struct domain *domain_hash[DOMAIN_HASH_SIZE];
 struct domain *domain_list;
=20
+/* Non-system domain ID allocator. */
+#define CONFIG_MAX_DOMID DOMID_FIRST_RESERVED
+static DEFINE_SPINLOCK(domid_lock);
+static DECLARE_BITMAP(domid_bitmap, CONFIG_MAX_DOMID);
+static domid_t domid_last;
+
 /*
  * Insert a domain into the domlist/hash.  This allows the domain to be lo=
oked
  * up by domid, and therefore to be the subject of hypercalls/etc.
@@ -1449,6 +1455,8 @@ void domain_destroy(struct domain *d)
=20
     TRACE_TIME(TRC_DOM0_DOM_REM, d->domain_id);
=20
+    domid_free(d->domain_id);
+
     /* Remove from the domlist/hash. */
     domlist_remove(d);
=20
@@ -2405,6 +2413,46 @@ domid_t get_initial_domain_id(void)
     return hardware_domid;
 }
=20
+domid_t domid_alloc(domid_t domid)
+{
+    spin_lock(&domid_lock);
+
+    if ( domid < CONFIG_MAX_DOMID )
+    {
+        if ( __test_and_set_bit(domid, domid_bitmap) )
+            domid =3D DOMID_INVALID;
+    }
+    else
+    {
+        domid =3D find_next_zero_bit(domid_bitmap, CONFIG_MAX_DOMID,
+                                   domid_last);
+
+        if ( domid =3D=3D CONFIG_MAX_DOMID )
+            domid =3D find_next_zero_bit(domid_bitmap, CONFIG_MAX_DOMID, 0=
);
+
+        if ( domid =3D=3D CONFIG_MAX_DOMID )
+        {
+            domid =3D DOMID_INVALID;
+        }
+        else
+        {
+            __set_bit(domid, domid_bitmap);
+            domid_last =3D domid;
+        }
+    }
+
+    spin_unlock(&domid_lock);
+
+    return domid;
+}
+
+void domid_free(domid_t domid)
+{
+    spin_lock(&domid_lock);
+    __clear_bit(domid, domid_bitmap);
+    spin_unlock(&domid_lock);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index bfe2e1f9f0..8ef0c147c9 100644
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
@@ -421,36 +407,18 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u=
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
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index e10baf2615..8aab05ae93 100644
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



