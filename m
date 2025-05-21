Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCC3ABE85D
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 02:00:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991281.1375178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHWt2-0002XX-L1; Wed, 21 May 2025 00:00:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991281.1375178; Wed, 21 May 2025 00:00:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHWt2-0002VX-Hl; Wed, 21 May 2025 00:00:44 +0000
Received: by outflank-mailman (input) for mailman id 991281;
 Wed, 21 May 2025 00:00:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q6H9=YF=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uHWt1-0002HS-Bp
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 00:00:43 +0000
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch
 [109.224.244.17]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2e697ab-35d6-11f0-a2fa-13f23c93f187;
 Wed, 21 May 2025 02:00:42 +0200 (CEST)
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
X-Inumbo-ID: a2e697ab-35d6-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1747785641; x=1748044841;
	bh=pvUKgvpXykk6QPUGl6S7aKbOTQ27IdteI+qrKZUIs0A=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=An2iLpdqI15UhAcI0GkxEVPTUsxOoayhPebJIgCaUJqgNGxNUfBN6/rpcWmyKUpuL
	 eHwLLblh4XZ4jXBNavjYH6rneTV4gVsCKmAUZq7JaAealPHfHL/tCA7rPvPjG90XDS
	 LhypG4sCiZhnxa039wX+MphJmBAP/3a8YelI2fqbY/sO9uqbMrcdq9qXxHo1+tidAm
	 UK0AmML5Vj6uNmQxUnMJ4LrcBMjYyfVL0wM71qAFhICdaJGn4UhmkXJcL833V8CORy
	 ISgwaAxsVSA0HhmIBj+O6jbl0BQzapFt19ntZiPbpA7mELbODqdU3JKVy4mMNUh0iR
	 1Gb/R717yzfZQ==
Date: Wed, 21 May 2025 00:00:38 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, teddy.astie@vates.tech, dmukhin@ford.com
Subject: [PATCH v8 1/3] xen/domain: unify domain ID allocation
Message-ID: <20250521000024.2944685-2-dmukhin@ford.com>
In-Reply-To: <20250521000024.2944685-1-dmukhin@ford.com>
References: <20250521000024.2944685-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: f7978f4ed4e2dd4147763957d2eb90fa79770726
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
- If DOMID_INVALID is provided, search the range [0..DOMID_FIRST_RESERVED-1=
],
  starting from the last used ID and wrapping around as needed. It guarante=
es
  that two consecutive calls will never return the same ID.

Also, remove is_free_domid() helper as it is not needed now.

No functional change intended.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v7:
- Use DOMID_FIRST_RESERVED
---
 xen/arch/arm/domain_build.c             | 17 ++++++---
 xen/arch/x86/setup.c                    | 11 +++---
 xen/common/device-tree/dom0less-build.c | 10 +++---
 xen/common/domain.c                     | 47 +++++++++++++++++++++++++
 xen/common/domctl.c                     | 42 +++-------------------
 xen/include/xen/domain.h                |  3 ++
 6 files changed, 80 insertions(+), 50 deletions(-)

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
index abf1969e60..9c6932c457 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -66,6 +66,11 @@ DEFINE_RCU_READ_LOCK(domlist_read_lock);
 static struct domain *domain_hash[DOMAIN_HASH_SIZE];
 struct domain *domain_list;
=20
+/* Non-system domain ID allocator. */
+static DEFINE_SPINLOCK(domid_lock);
+static DECLARE_BITMAP(domid_bitmap, DOMID_FIRST_RESERVED);
+static domid_t domid_last;
+
 /*
  * Insert a domain into the domlist/hash.  This allows the domain to be lo=
oked
  * up by domid, and therefore to be the subject of hypercalls/etc.
@@ -1449,6 +1454,8 @@ void domain_destroy(struct domain *d)
=20
     TRACE_TIME(TRC_DOM0_DOM_REM, d->domain_id);
=20
+    domid_free(d->domain_id);
+
     /* Remove from the domlist/hash. */
     domlist_remove(d);
=20
@@ -2405,6 +2412,46 @@ domid_t get_initial_domain_id(void)
     return hardware_domid;
 }
=20
+domid_t domid_alloc(domid_t domid)
+{
+    spin_lock(&domid_lock);
+
+    if ( domid < DOMID_FIRST_RESERVED )
+    {
+        if ( __test_and_set_bit(domid, domid_bitmap) )
+            domid =3D DOMID_INVALID;
+    }
+    else
+    {
+        domid =3D find_next_zero_bit(domid_bitmap, DOMID_FIRST_RESERVED,
+                                   domid_last);
+
+        if ( domid =3D=3D DOMID_FIRST_RESERVED )
+            domid =3D find_next_zero_bit(domid_bitmap, DOMID_FIRST_RESERVE=
D, 0);
+
+        if ( domid =3D=3D DOMID_FIRST_RESERVED )
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



