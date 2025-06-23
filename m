Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 553F9AE4CD2
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 20:28:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022624.1398446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTltq-0006Tj-1U; Mon, 23 Jun 2025 18:28:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022624.1398446; Mon, 23 Jun 2025 18:28:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTltp-0006R2-Ux; Mon, 23 Jun 2025 18:28:09 +0000
Received: by outflank-mailman (input) for mailman id 1022624;
 Mon, 23 Jun 2025 18:28:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v3i4=ZG=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uTlto-00068u-1e
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 18:28:08 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cee38958-505f-11f0-a30f-13f23c93f187;
 Mon, 23 Jun 2025 20:28:07 +0200 (CEST)
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
X-Inumbo-ID: cee38958-505f-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1750703286; x=1750962486;
	bh=UkTM0QT8ZgoZN9K96tEgWBupK+Zqg6ED8nILkPgW1Hw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ekM5XLHqEqpnfVuS2tJoJMLeYZ3J0jxon4qTV8orjW6CrR9CSxuI5AwhBo+OXD/mG
	 QJqD/MQifjZP/PE6AjskyCYLoxFj04VM5ZuEmfIodrzmqVPwm1nkl2ogUNZdVMiIUO
	 YNAQ0/kHFdFZicmZVW7lZ62FW2+NcCBqThCnwlgxnh9SYBSUd16J1FAyTSyRdQfN6H
	 e2KGBbT5vBmLwSf8TrJ5YgNDscdUebI9BfgyWqgbH2DdZUIV9xAslOmqcWEGw6rmGV
	 HVLuRBAJRLwkPOHqjAhHxoP6Rtd6Zm3k2ujJFGIJ8M9xqA2jlnH6mDw2lsc2S8Jwn/
	 +uAEhAlWbN/kw==
Date: Mon, 23 Jun 2025 18:28:01 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v10 1/3] xen/domain: unify domain ID allocation
Message-ID: <20250623182721.194238-2-dmukhin@ford.com>
In-Reply-To: <20250623182721.194238-1-dmukhin@ford.com>
References: <20250623182721.194238-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 9d97cf73f5ad68b5742ab157ab71251a5bb64d18
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

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
common/domain.c based on the bitmap.

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
  excluded from allocation range.

Remove is_free_domid() helper as it is not needed now.

No functional change intended.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes from v9:
- dropped unrelated message formatting from create_dom0()
- no wraparound of IDs in dom0less case
- fixed ID#0 treatment

Link to v9: https://lore.kernel.org/r/20250528225030.2652166-2-dmukhin@ford=
.com
---
 xen/arch/arm/domain_build.c             |  7 ++-
 xen/arch/x86/setup.c                    |  7 ++-
 xen/common/device-tree/dom0less-build.c | 17 +++---
 xen/common/domain.c                     | 75 +++++++++++++++++++++++++
 xen/common/domctl.c                     | 42 ++------------
 xen/include/xen/domain.h                |  3 +
 6 files changed, 102 insertions(+), 49 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 4ff161887ec3..9fa5143eb98c 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2049,6 +2049,7 @@ void __init create_dom0(void)
         .grant_opts =3D XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
     };
     unsigned int flags =3D CDF_privileged | CDF_hardware;
+    domid_t domid;
     int rc;
=20
     /* The vGIC for DOM0 is exactly emulating the hardware GIC */
@@ -2073,7 +2074,11 @@ void __init create_dom0(void)
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
index f32efa7c6045..7adb92d78a18 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1044,8 +1044,11 @@ static struct domain *__init create_dom0(struct boot=
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
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tr=
ee/dom0less-build.c
index 3d503c697337..576fdfa6a19a 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -839,15 +839,13 @@ void __init create_domUs(void)
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
@@ -965,12 +963,13 @@ void __init create_domUs(void)
=20
         arch_create_domUs(node, &d_cfg, flags);
=20
-        /*
-         * The variable max_init_domid is initialized with zero, so here i=
t's
-         * very important to use the pre-increment operator to call
-         * domain_create() with a domid > 0. (domid =3D=3D 0 is reserved f=
or Dom0)
-         */
-        d =3D domain_create(++max_init_domid, &d_cfg, flags);
+        domid =3D domid_alloc(DOMID_INVALID);
+        if ( domid =3D=3D DOMID_INVALID )
+            panic("Error allocating ID for domain %s\n", dt_node_name(node=
));
+        if ( max_init_domid < domid )
+            max_init_domid =3D domid;
+
+        d =3D domain_create(domid, &d_cfg, flags);
         if ( IS_ERR(d) )
             panic("Error creating domain %s (rc =3D %ld)\n",
                   dt_node_name(node), PTR_ERR(d));
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 434d32901b1b..be022c720b13 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -66,6 +66,14 @@ DEFINE_RCU_READ_LOCK(domlist_read_lock);
 static struct domain *domain_hash[DOMAIN_HASH_SIZE];
 struct domain *domain_list;
=20
+/*
+ * Domain ID allocator.
+ * Covers dom0 or late hwdom, predefined domains, post-boot domains; exclu=
des
+ * Xen system domains (ID >=3D DOMID_FIRST_RESERVED).
+ */
+static DEFINE_SPINLOCK(domid_lock);
+static DECLARE_BITMAP(domid_bitmap, DOMID_FIRST_RESERVED);
+
 /*
  * Insert a domain into the domlist/hash.  This allows the domain to be lo=
oked
  * up by domid, and therefore to be the subject of hypercalls/etc.
@@ -1452,6 +1460,8 @@ void domain_destroy(struct domain *d)
=20
     TRACE_TIME(TRC_DOM0_DOM_REM, d->domain_id);
=20
+    domid_free(d->domain_id);
+
     /* Remove from the domlist/hash. */
     domlist_remove(d);
=20
@@ -2433,6 +2443,71 @@ void thaw_domains(void)
     rcu_read_unlock(&domlist_read_lock);
 }
=20
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
+     *
+     * In dom0less build, domains are not dynamically destroyed, so there'=
s no
+     * need to do a wraparound of the IDs.
+     */
+#ifdef CONFIG_DOM0LESS_BOOT
+    else if ( domid_last + 1 >=3D DOMID_FIRST_RESERVED )
+    {
+        domid =3D DOMID_INVALID;
+    }
+#endif
+    else
+    {
+        domid =3D find_next_zero_bit(domid_bitmap,
+                                   DOMID_FIRST_RESERVED,
+                                   domid_last + 1);
+#ifdef CONFIG_DOM0LESS_BOOT
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
+        {
+            domid =3D DOMID_INVALID;
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
+    if ( domid < DOMID_FIRST_RESERVED )
+    {
+        spin_lock(&domid_lock);
+        __clear_bit(domid, domid_bitmap);
+        spin_unlock(&domid_lock);
+    }
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index bfe2e1f9f057..8ef0c147c9b0 100644
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



