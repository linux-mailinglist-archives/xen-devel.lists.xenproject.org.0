Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F009AC742F
	for <lists+xen-devel@lfdr.de>; Thu, 29 May 2025 00:51:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999592.1380250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKPc4-0008PU-4Q; Wed, 28 May 2025 22:51:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999592.1380250; Wed, 28 May 2025 22:51:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKPc4-0008LD-1X; Wed, 28 May 2025 22:51:08 +0000
Received: by outflank-mailman (input) for mailman id 999592;
 Wed, 28 May 2025 22:51:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ql61=YM=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uKPc2-0007tz-Sh
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 22:51:06 +0000
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch
 [79.135.106.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c9addbd-3c16-11f0-b894-0df219b8e170;
 Thu, 29 May 2025 00:51:05 +0200 (CEST)
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
X-Inumbo-ID: 3c9addbd-3c16-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=jyuo52idjzhdljhmxbj2pkmvci.protonmail; t=1748472664; x=1748731864;
	bh=Ism5zqoyp25HVyCSFsCPOuacHsymbgmA3mLoHwRNEeM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=jQyjBnmrG0SwnHJiPVn01yU/w6/KmTNZhPWxjXe+6mxxwwmwVjmsauPv3GKoNPq68
	 n2RNpR2zGz/EOYo1tsugZOH04/IaJ4bErWIU9BqsM+np8YPbP7MJaDegUxvYAEUYIb
	 BnSr3q7O3u+UKCEPSTE6p47IlSrJffXWWbvIpUV6495pPvc/5E38/2RkPUanRXLJ3L
	 gA8+mhghVA4ClK1SPJwdnCvVnuxWdwdGuVnCUwdrSLLZcuwa/GN8KYIrhgeKk7zoZN
	 H7wu0OBUEZSRwqw8Hg0HCM5AgF+crFY7zmAnsVxFlsrMPAFVBqjY9q4wNDUb4c2NXN
	 xfFu4yc0ZchEw==
Date: Wed, 28 May 2025 22:50:57 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, roger.pau@citrix.com, sstabellini@kernel.org, teddy.astie@vates.tech, dmukhin@ford.com, Denis Mukhin <dmkhn@proton.me>
Subject: [PATCH v9 3/3] xen/domain: introduce CONFIG_MAX_DOMID
Message-ID: <20250528225030.2652166-4-dmukhin@ford.com>
In-Reply-To: <20250528225030.2652166-1-dmukhin@ford.com>
References: <20250528225030.2652166-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 14520f3a02d52d3de6bc444d5f814acc9862d8fa
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmkhn@proton.me>

From: Denis Mukhin <dmukhin@ford.com>

Embedded deployments of Xen do not need to have support for more than dozen=
 of
domains.

Introduce build-time configuration option to limit the number of domains du=
ring
run-time.

Suggested-by: Julien Grall <julien@xen.org>
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v8:
- dropped hunk w/ compile-time check for DOMID_FIRST_RESERVED
- updated CONFIG_MAX_DOMID explanation
- dropped public header file changes
---
 xen/arch/x86/cpu/mcheck/mce.c       |  2 +-
 xen/arch/x86/cpu/vpmu.c             |  2 +-
 xen/common/Kconfig                  |  8 ++++++++
 xen/common/domain.c                 | 20 +++++++++++---------
 xen/common/sched/core.c             |  4 ++--
 xen/drivers/passthrough/vtd/iommu.c |  2 +-
 6 files changed, 24 insertions(+), 14 deletions(-)

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
index 3d66d09397..ef083856b8 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -579,4 +579,12 @@ config BUDDY_ALLOCATOR_SIZE
 =09  Amount of memory reserved for the buddy allocator to serve Xen heap,
 =09  working alongside the colored one.
=20
+config MAX_DOMID
+=09int "Maximum domain ID"
+=09range 1 32752
+=09default 32752
+=09help
+=09  Specifies the maximum domain ID (dom0 or late hwdom, predefined
+=09  domains, post-boot domains, excluding Xen system domains).
+
 endmenu
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 129b4fcb37..87e5be35e5 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -68,7 +68,7 @@ struct domain *domain_list;
=20
 /* Non-system domain ID allocator. */
 static DEFINE_SPINLOCK(domid_lock);
-static DECLARE_BITMAP(domid_bitmap, DOMID_FIRST_RESERVED);
+static DECLARE_BITMAP(domid_bitmap, CONFIG_MAX_DOMID);
=20
 /*
  * Insert a domain into the domlist/hash.  This allows the domain to be lo=
oked
@@ -154,7 +154,7 @@ int domain_init_states(void)
     ASSERT(rw_is_write_locked_by_me(&current->domain->event_lock));
=20
     dom_state_changed =3D xvzalloc_array(unsigned long,
-                                       BITS_TO_LONGS(DOMID_FIRST_RESERVED)=
);
+                                       BITS_TO_LONGS(CONFIG_MAX_DOMID));
     if ( !dom_state_changed )
         return -ENOMEM;
=20
@@ -234,7 +234,7 @@ int get_domain_state(struct xen_domctl_get_domain_state=
 *info, struct domain *d,
     while ( dom_state_changed )
     {
         dom =3D find_first_bit(dom_state_changed, DOMID_MASK + 1);
-        if ( dom >=3D DOMID_FIRST_RESERVED )
+        if ( dom >=3D CONFIG_MAX_DOMID )
             break;
         if ( test_and_clear_bit(dom, dom_state_changed) )
         {
@@ -823,7 +823,7 @@ struct domain *domain_create(domid_t domid,
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
@@ -2413,9 +2413,11 @@ domid_t get_initial_domain_id(void)
=20
 domid_t domid_alloc(domid_t domid)
 {
+    BUILD_BUG_ON(DOMID_FIRST_RESERVED < CONFIG_MAX_DOMID);
+
     spin_lock(&domid_lock);
=20
-    if ( domid < DOMID_FIRST_RESERVED )
+    if ( domid < CONFIG_MAX_DOMID )
     {
         if ( __test_and_set_bit(domid, domid_bitmap) )
             domid =3D DOMID_INVALID;
@@ -2427,13 +2429,13 @@ domid_t domid_alloc(domid_t domid)
         const domid_t reserved_domid =3D get_initial_domain_id();
         const bool reserved =3D __test_and_set_bit(reserved_domid, domid_b=
itmap);
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
--=20
2.34.1



