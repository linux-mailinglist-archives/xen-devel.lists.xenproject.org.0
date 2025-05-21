Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4641AABE85E
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 02:00:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991282.1375189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHWt9-0002uU-U4; Wed, 21 May 2025 00:00:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991282.1375189; Wed, 21 May 2025 00:00:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHWt9-0002r8-Qk; Wed, 21 May 2025 00:00:51 +0000
Received: by outflank-mailman (input) for mailman id 991282;
 Wed, 21 May 2025 00:00:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q6H9=YF=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uHWt8-0002HS-QK
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 00:00:50 +0000
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch
 [109.224.244.18]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7819557-35d6-11f0-a2fa-13f23c93f187;
 Wed, 21 May 2025 02:00:50 +0200 (CEST)
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
X-Inumbo-ID: a7819557-35d6-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1747785649; x=1748044849;
	bh=gZuziIYnGqs/5mkfDoO7rMHMyTdKJ31HoXIZkb3ogxY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=SgfyCp/aOipnEISvQfwIG7qCTfnIQVUPThwCW8JbXmXMjTQTQFW9Pk89lMs8Uiktv
	 O6U+Ng/lsODW24bqQf33QTJiX8ICubq7Vc1Z9qelK7JZiWurRvj2jdxMoIuUClZv9V
	 s+PQ6yK+nq9htiYlseyTLVJcNECUGyl7rZefM5n2NFX5AkZfWjj9M0BCJfADcXprXb
	 tGH8GIAA1S/4EMQdEk4G5QMj5kGRl7MEDepUVdOJRi9iOxhFS5VMLZP9JR4kWdxdUn
	 mfEDs7J/0nx64ZUFWiV4VfdVIIUhSD0KPuepdNR1SXDHbWp/zcvLbUFwF7F3tfI4n5
	 w+N9N++quiBzA==
Date: Wed, 21 May 2025 00:00:44 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, teddy.astie@vates.tech, dmukhin@ford.com
Subject: [PATCH v8 2/3] xen/domain: adjust domain ID allocation for Arm
Message-ID: <20250521000024.2944685-3-dmukhin@ford.com>
In-Reply-To: <20250521000024.2944685-1-dmukhin@ford.com>
References: <20250521000024.2944685-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 907ae400060ee37746716b45fa33c0fbb991a03f
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
ID is skipped during domain ID allocation to cover domU case in dom0less
configuration. That also fixes a potential issue with re-using ID#0 for dom=
Us
when get_initial_domain_id() returns non-zero.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v7:
- use `bool reserved;` in domid_alloc()
---
 xen/arch/arm/domain_build.c             | 4 ++--
 xen/common/device-tree/dom0less-build.c | 9 +++------
 xen/common/domain.c                     | 6 ++++++
 3 files changed, 11 insertions(+), 8 deletions(-)

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
index 9c6932c457..01a65cb35d 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -2423,6 +2423,9 @@ domid_t domid_alloc(domid_t domid)
     }
     else
     {
+        bool reserved =3D __test_and_set_bit(get_initial_domain_id(),
+                                           domid_bitmap);
+
         domid =3D find_next_zero_bit(domid_bitmap, DOMID_FIRST_RESERVED,
                                    domid_last);
=20
@@ -2438,6 +2441,9 @@ domid_t domid_alloc(domid_t domid)
             __set_bit(domid, domid_bitmap);
             domid_last =3D domid;
         }
+
+        if ( !reserved )
+            __clear_bit(reserved, domid_bitmap);
     }
=20
     spin_unlock(&domid_lock);
--=20
2.34.1



