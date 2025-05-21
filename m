Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1072ABE860
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 02:01:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991287.1375198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHWtK-0003TN-9v; Wed, 21 May 2025 00:01:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991287.1375198; Wed, 21 May 2025 00:01:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHWtK-0003RB-5U; Wed, 21 May 2025 00:01:02 +0000
Received: by outflank-mailman (input) for mailman id 991287;
 Wed, 21 May 2025 00:01:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q6H9=YF=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uHWtI-0003ED-MZ
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 00:01:00 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id acc4adee-35d6-11f0-b892-0df219b8e170;
 Wed, 21 May 2025 02:00:58 +0200 (CEST)
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
X-Inumbo-ID: acc4adee-35d6-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1747785658; x=1748044858;
	bh=dyWE4g9RjoCjxwzz+tbMoGFTSyVkuUaSnQCT8L45dwk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=TbSqvMPGyLUnSry1J+SA51tgHl9mOQP1t0Z66lTI0S24Aq08/Ua1vmdjgH2RDku7E
	 sl8IGfAc3N5H79SR4ElyeXcO8O17UnC5cPV7tUlNyh+16f6UaiTGbuTzIkJe1iGiRo
	 jwbxC0HR/jEB+Q1e3DqcfER4N7t0gVFtPXwq72yk0T0VMS/5PVJ0FBneAYeanUo3Pn
	 8iq4J0T3uyvrGZFPwKjpFkNgd6EhB223+U1kNBrSXw7YjNiA5YH2AxDnldgZ5Mk/3V
	 HafsksnYXhKXE/sUiIl9CziZ9CxFYb5/wnNJsJAzwCsSSmRxvpJmMrPCC1fDGnJTFJ
	 3I+BmkfnGzPKg==
Date: Wed, 21 May 2025 00:00:52 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, teddy.astie@vates.tech, dmukhin@ford.com
Subject: [PATCH v8 3/3] xen/domain: introduce CONFIG_MAX_DOMID
Message-ID: <20250521000024.2944685-4-dmukhin@ford.com>
In-Reply-To: <20250521000024.2944685-1-dmukhin@ford.com>
References: <20250521000024.2944685-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 4bd2800df5799a7a1e01ada611e97a9ce4808730
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Embedded deployments of Xen do not need to have support for more than dozen=
 of
domains.

Introduce build-time configuration option to limit the number of domains du=
ring
run-time.

Also, move DOMID_FIRST_RESERVED compile-time check from Arm to common code.

Suggested-by: Julien Grall <julien@xen.org>
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
This is an RFC.

Changes since v7:
- moved DOMID_FIRST_RESERVED compile-time checks to common code
- changed description for MAX_DOMID Kconfig option
---
 xen/arch/arm/tee/ffa.c              |  3 +--
 xen/arch/x86/cpu/mcheck/mce.c       |  2 +-
 xen/arch/x86/cpu/vpmu.c             |  2 +-
 xen/common/Kconfig                  |  7 +++++++
 xen/common/domain.c                 | 21 ++++++++++++---------
 xen/common/sched/core.c             |  4 ++--
 xen/drivers/passthrough/vtd/iommu.c |  2 +-
 xen/include/public/domctl.h         |  2 +-
 8 files changed, 26 insertions(+), 17 deletions(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 3bbdd7168a..7417ce6bed 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -331,10 +331,9 @@ static int ffa_domain_init(struct domain *d)
      * reserved for the hypervisor and we only support secure endpoints us=
ing
      * FF-A IDs with BIT 15 set to 1 so make sure those are not used by Xe=
n.
      */
-    BUILD_BUG_ON(DOMID_FIRST_RESERVED >=3D UINT16_MAX);
     BUILD_BUG_ON((DOMID_MASK & BIT(15, U)) !=3D 0);
=20
-    if ( d->domain_id >=3D DOMID_FIRST_RESERVED )
+    if ( d->domain_id >=3D CONFIG_MAX_DOMID )
         return -ERANGE;
=20
     ctx =3D xzalloc(struct ffa_ctx);
diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.c
index 1c348e557d..ee8ddd33b0 100644
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -1493,7 +1493,7 @@ long do_mca(XEN_GUEST_HANDLE_PARAM(xen_mc_t) u_xen_mc=
)
             d =3D rcu_lock_domain_by_any_id(mc_msrinject->mcinj_domid);
             if ( d =3D=3D NULL )
             {
-                if ( mc_msrinject->mcinj_domid >=3D DOMID_FIRST_RESERVED )
+                if ( mc_msrinject->mcinj_domid >=3D CONFIG_MAX_DOMID )
                     return x86_mcerr("do_mca inject: incompatible flag "
                                      "MC_MSRINJ_F_GPADDR with domain %d",
                                      -EINVAL, domid);
diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
index c28192ea26..67d423e088 100644
--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -174,7 +174,7 @@ void vpmu_do_interrupt(void)
      * in XENPMU_MODE_ALL, for everyone.
      */
     if ( (vpmu_mode & XENPMU_MODE_ALL) ||
-         (sampled->domain->domain_id >=3D DOMID_FIRST_RESERVED) )
+         (sampled->domain->domain_id >=3D CONFIG_MAX_DOMID) )
     {
         sampling =3D choose_hwdom_vcpu();
         if ( !sampling )
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 6d43be2e6e..66b91840f2 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -576,4 +576,11 @@ config BUDDY_ALLOCATOR_SIZE
 =09  Amount of memory reserved for the buddy allocator to serve Xen heap,
 =09  working alongside the colored one.
=20
+config MAX_DOMID
+=09int "Maximum number of user domains"
+=09range 1 32752
+=09default 32752
+=09help
+=09  Specifies the maximum number of domains a user can create.
+
 endmenu
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 01a65cb35d..204b71d096 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -68,7 +68,7 @@ struct domain *domain_list;
=20
 /* Non-system domain ID allocator. */
 static DEFINE_SPINLOCK(domid_lock);
-static DECLARE_BITMAP(domid_bitmap, DOMID_FIRST_RESERVED);
+static DECLARE_BITMAP(domid_bitmap, CONFIG_MAX_DOMID);
 static domid_t domid_last;
=20
 /*
@@ -155,7 +155,7 @@ int domain_init_states(void)
     ASSERT(rw_is_write_locked_by_me(&current->domain->event_lock));
=20
     dom_state_changed =3D xvzalloc_array(unsigned long,
-                                       BITS_TO_LONGS(DOMID_FIRST_RESERVED)=
);
+                                       BITS_TO_LONGS(CONFIG_MAX_DOMID));
     if ( !dom_state_changed )
         return -ENOMEM;
=20
@@ -235,7 +235,7 @@ int get_domain_state(struct xen_domctl_get_domain_state=
 *info, struct domain *d,
     while ( dom_state_changed )
     {
         dom =3D find_first_bit(dom_state_changed, DOMID_MASK + 1);
-        if ( dom >=3D DOMID_FIRST_RESERVED )
+        if ( dom >=3D CONFIG_MAX_DOMID )
             break;
         if ( test_and_clear_bit(dom, dom_state_changed) )
         {
@@ -824,7 +824,7 @@ struct domain *domain_create(domid_t domid,
     /* Sort out our idea of is_hardware_domain(). */
     if ( (flags & CDF_hardware) || domid =3D=3D hardware_domid )
     {
-        if ( hardware_domid < 0 || hardware_domid >=3D DOMID_FIRST_RESERVE=
D )
+        if ( hardware_domid < 0 || hardware_domid >=3D CONFIG_MAX_DOMID )
             panic("The value of hardware_dom must be a valid domain ID\n")=
;
=20
         /* late_hwdom is only allowed for dom0. */
@@ -2414,9 +2414,12 @@ domid_t get_initial_domain_id(void)
=20
 domid_t domid_alloc(domid_t domid)
 {
+    BUILD_BUG_ON(DOMID_FIRST_RESERVED >=3D UINT16_MAX);
+    BUILD_BUG_ON(DOMID_FIRST_RESERVED < CONFIG_MAX_DOMID);
+
     spin_lock(&domid_lock);
=20
-    if ( domid < DOMID_FIRST_RESERVED )
+    if ( domid < CONFIG_MAX_DOMID )
     {
         if ( __test_and_set_bit(domid, domid_bitmap) )
             domid =3D DOMID_INVALID;
@@ -2426,13 +2429,13 @@ domid_t domid_alloc(domid_t domid)
         bool reserved =3D __test_and_set_bit(get_initial_domain_id(),
                                            domid_bitmap);
=20
-        domid =3D find_next_zero_bit(domid_bitmap, DOMID_FIRST_RESERVED,
+        domid =3D find_next_zero_bit(domid_bitmap, CONFIG_MAX_DOMID,
                                    domid_last);
=20
-        if ( domid =3D=3D DOMID_FIRST_RESERVED )
-            domid =3D find_next_zero_bit(domid_bitmap, DOMID_FIRST_RESERVE=
D, 0);
+        if ( domid =3D=3D CONFIG_MAX_DOMID )
+            domid =3D find_next_zero_bit(domid_bitmap, CONFIG_MAX_DOMID, 0=
);
=20
-        if ( domid =3D=3D DOMID_FIRST_RESERVED )
+        if ( domid =3D=3D CONFIG_MAX_DOMID )
         {
             domid =3D DOMID_INVALID;
         }
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 9043414290..f1bfb6f6a2 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -867,7 +867,7 @@ int sched_init_domain(struct domain *d, unsigned int po=
olid)
     int ret;
=20
     ASSERT(d->cpupool =3D=3D NULL);
-    ASSERT(d->domain_id < DOMID_FIRST_RESERVED);
+    ASSERT(d->domain_id < CONFIG_MAX_DOMID);
=20
     if ( (ret =3D cpupool_add_domain(d, poolid)) )
         return ret;
@@ -891,7 +891,7 @@ int sched_init_domain(struct domain *d, unsigned int po=
olid)
=20
 void sched_destroy_domain(struct domain *d)
 {
-    ASSERT(d->domain_id < DOMID_FIRST_RESERVED);
+    ASSERT(d->domain_id < CONFIG_MAX_DOMID);
=20
     if ( d->cpupool )
     {
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/=
vtd/iommu.c
index c55f02c97e..5df85ca629 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1509,7 +1509,7 @@ int domain_context_mapping_one(
=20
         prev_did =3D context_domain_id(lctxt);
         domid =3D did_to_domain_id(iommu, prev_did);
-        if ( domid < DOMID_FIRST_RESERVED )
+        if ( domid < CONFIG_MAX_DOMID )
             prev_dom =3D rcu_lock_domain_by_id(domid);
         else if ( pdev ? domid =3D=3D pdev->arch.pseudo_domid : domid > DO=
MID_MASK )
             prev_dom =3D rcu_lock_domain(dom_io);
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 5b2063eed9..0c14c30c1b 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -36,7 +36,7 @@
=20
 /*
  * NB. xen_domctl.domain is an IN/OUT parameter for this operation.
- * If it is specified as an invalid value (0 or >=3D DOMID_FIRST_RESERVED)=
,
+ * If it is specified as an invalid value (0 or >=3D CONFIG_MAX_DOMID),
  * an id is auto-allocated and returned.
  */
 /* XEN_DOMCTL_createdomain */
--=20
2.34.1



