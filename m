Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD3BAB93E7
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 04:05:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986164.1371829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFkRf-0003It-9r; Fri, 16 May 2025 02:05:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986164.1371829; Fri, 16 May 2025 02:05:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFkRf-0003Fm-7L; Fri, 16 May 2025 02:05:07 +0000
Received: by outflank-mailman (input) for mailman id 986164;
 Fri, 16 May 2025 02:05:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=07xk=YA=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uFkRd-0002f4-Ns
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 02:05:05 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e906ed1-31fa-11f0-9ffb-bf95429c2676;
 Fri, 16 May 2025 04:05:04 +0200 (CEST)
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
X-Inumbo-ID: 2e906ed1-31fa-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1747361103; x=1747620303;
	bh=UNygIiQeosiEp8EG38J9RJGGNELDAURW7bNhwd6Excg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=fd9fsyh9x7EwAubpvGzyVC5NuYM0OXWmRbv+QcV50I7bWWpQ5MJ15F1+7P0MXAsyI
	 xR5zZm597/cSdcSY8W0nzrQof4GFsK+Zf7GP9h1REDaCPntAvJZpSj//ftlrcfsFtw
	 5Yspj80qVb5kEE6X0+R2mfGWhJfvvFQzsWWRzPz9kJw5t/XJxRmODDSSTS7+rcw/xd
	 c7H/3QtaIzRUC/1gdvSicR8aVnMq//Z/r0r3w9ARkLt5w6XI+Qxpi5VOYBmtWHvXTj
	 lsg/MJNtA3hoox1TTh7z8dTuhtmoVfju5bnLqswU+bzkPlooDNEXKBqpn1ta1oa+b+
	 uNzo9wHiC0vnw==
Date: Fri, 16 May 2025 02:04:58 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v6 2/2] xen/domain: adjust domain ID allocation for Arm
Message-ID: <20250516020434.1145337-3-dmukhin@ford.com>
In-Reply-To: <20250516020434.1145337-1-dmukhin@ford.com>
References: <20250516020434.1145337-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 30aae9b71305ff1fe0734ae0f3f19f0d659dac6f
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Remove the hardcoded domain ID 0 allocation for hardware domain and replace=
 it
with a call to get_initial_domain_id() (returns the value of hardware_domid=
 on
Arm).

Update domid_alloc(DOMID_INVALID) case to ensure that get_initial_domain_id=
()
ID is skipped during domain ID allocation to cover domU case.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v5:
- rebased
---
 xen/arch/arm/domain_build.c             | 4 ++--
 xen/common/device-tree/dom0less-build.c | 9 +++------
 xen/common/domain.c                     | 5 ++++-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index e9d563c269..0ad80b020a 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2035,9 +2035,9 @@ void __init create_dom0(void)
     if ( !llc_coloring_enabled )
         flags |=3D CDF_directmap;
=20
-    domid =3D domid_alloc(0);
+    domid =3D domid_alloc(get_initial_domain_id());
     if ( domid =3D=3D DOMID_INVALID )
-        panic("Error allocating domain ID 0\n");
+        panic("Error allocating domain ID %d\n", get_initial_domain_id());
=20
     dom0 =3D domain_create(domid, &dom0_cfg, flags);
     if ( IS_ERR(dom0) )
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tr=
ee/dom0less-build.c
index 9236dbae11..8e38affd0c 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -974,14 +974,11 @@ void __init create_domUs(void)
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
-        domid =3D domid_alloc(++max_init_domid);
+        domid =3D domid_alloc(DOMID_INVALID);
         if ( domid =3D=3D DOMID_INVALID )
             panic("Error allocating ID for domain %s\n", dt_node_name(node=
));
+        if ( max_init_domid < domid )
+            max_init_domid =3D domid;
=20
         d =3D domain_create(domid, &d_cfg, flags);
         if ( IS_ERR(d) )
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 0ba3cdc47d..055397b5aa 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -85,7 +85,7 @@ void __init domid_init(void)
  *
  * If hint is outside of valid [0..DOMID_FIRST_RESERVED - 1] range of IDs,
  * perform an exhaustive search starting from the end of the used domain I=
D
- * range.
+ * range, excluding get_initial_domain_id() ID.
  */
 domid_t domid_alloc(domid_t domid)
 {
@@ -103,6 +103,9 @@ domid_t domid_alloc(domid_t domid)
             if ( domid =3D=3D DOMID_FIRST_RESERVED )
                 domid =3D 0;
=20
+            if ( domid =3D=3D get_initial_domain_id() )
+                continue;
+
             if ( !rangeset_contains_singleton(domid_rangeset, domid) )
                 break;
         }
--=20
2.34.1



