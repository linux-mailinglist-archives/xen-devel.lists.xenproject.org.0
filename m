Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E4BAE4CD4
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 20:28:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022628.1398467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTlu2-000793-HX; Mon, 23 Jun 2025 18:28:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022628.1398467; Mon, 23 Jun 2025 18:28:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTlu2-00077J-Cv; Mon, 23 Jun 2025 18:28:22 +0000
Received: by outflank-mailman (input) for mailman id 1022628;
 Mon, 23 Jun 2025 18:28:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v3i4=ZG=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uTlu1-00074l-1R
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 18:28:21 +0000
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch
 [79.135.106.31]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5d8047c-505f-11f0-b894-0df219b8e170;
 Mon, 23 Jun 2025 20:28:19 +0200 (CEST)
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
X-Inumbo-ID: d5d8047c-505f-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1750703297; x=1750962497;
	bh=Udhc20tlUIA4sPslsaWRUlqBtQkVoUUerUSlsQ1uvRs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=YmYPxPJxI+WHS+wxEciq03oQLrKtZG9i34qbOUQSCwRnimQenTwCQf+Iy6GhaujSU
	 mYSpFXtxKXSQYHjL+g3/h5YOCWk3tuQ6VYIURvA6vYEMjYzsEXglgTSsUqQo2RZOzb
	 s4wbn2+SR2T7r+D/79SOpLIF3uuvr8GGrKaWMKi+yW+XKBUtFR5UfJ3xhDaz+kZPNr
	 xPMCfc7ElW8xzkiziJR74Za1qahTt8UrvLmQFm11rhpc5MRWxEeliXPDyIoE2AbKUE
	 Vj/UKyDsNPPviSlVf6bYXrmPREh3yPbqCsScm2QZ9XToR8vwvIykEydY1VjbFZ7bAF
	 CdwZFB6I+xfig==
Date: Mon, 23 Jun 2025 18:28:12 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v10 3/3] xen/domain: use get_initial_domain_id() instead of open-coded 0
Message-ID: <20250623182721.194238-4-dmukhin@ford.com>
In-Reply-To: <20250623182721.194238-1-dmukhin@ford.com>
References: <20250623182721.194238-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 6d9b981d706e86ad449e201c8684fa2999e4884c
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Remove the open-coded domain ID 0 and replace it with a call to
get_initial_domain_id().

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v9:
- new patch
---
 xen/arch/arm/domain_build.c | 4 ++--
 xen/common/domain.c         | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index b59b56636920..b525d78c608f 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2074,9 +2074,9 @@ void __init create_dom0(void)
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
diff --git a/xen/common/domain.c b/xen/common/domain.c
index be022c720b13..27575b4610e3 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -492,7 +492,7 @@ static int late_hwdom_init(struct domain *d)
     struct domain *dom0;
     int rv;
=20
-    if ( d !=3D hardware_domain || d->domain_id =3D=3D 0 )
+    if ( d !=3D hardware_domain || d->domain_id =3D=3D get_initial_domain_=
id() )
         return 0;
=20
     rv =3D xsm_init_hardware_domain(XSM_HOOK, d);
@@ -501,7 +501,7 @@ static int late_hwdom_init(struct domain *d)
=20
     printk("Initialising hardware domain %d\n", hardware_domid);
=20
-    dom0 =3D rcu_lock_domain_by_id(0);
+    dom0 =3D rcu_lock_domain_by_id(get_initial_domain_id());
     ASSERT(dom0 !=3D NULL);
     /*
      * Hardware resource ranges for domain 0 have been set up from
@@ -2479,7 +2479,7 @@ domid_t domid_alloc(domid_t domid)
         if ( domid =3D=3D DOMID_FIRST_RESERVED )
             domid =3D find_next_zero_bit(domid_bitmap,
                                        DOMID_FIRST_RESERVED,
-                                       1);
+                                       get_initial_domain_id() + 1);
 #endif
=20
         if ( domid < DOMID_FIRST_RESERVED )
--=20
2.34.1



