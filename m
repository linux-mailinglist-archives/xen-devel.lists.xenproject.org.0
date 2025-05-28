Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9998DAC7431
	for <lists+xen-devel@lfdr.de>; Thu, 29 May 2025 00:51:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999591.1380240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKPbv-0007yS-PI; Wed, 28 May 2025 22:50:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999591.1380240; Wed, 28 May 2025 22:50:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKPbv-0007vW-LM; Wed, 28 May 2025 22:50:59 +0000
Received: by outflank-mailman (input) for mailman id 999591;
 Wed, 28 May 2025 22:50:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ql61=YM=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uKPbt-0007tz-TH
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 22:50:58 +0000
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch
 [79.135.106.31]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36b00870-3c16-11f0-b894-0df219b8e170;
 Thu, 29 May 2025 00:50:55 +0200 (CEST)
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
X-Inumbo-ID: 36b00870-3c16-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=gdfsaiyzcbfupgnn6juwp67waq.protonmail; t=1748472653; x=1748731853;
	bh=Z/JvWCVHhSekNxhXX77FDFM+KKfoHa1i5v/UEaZpFV8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=WZhRxnd2uCWaEjqQDes08jEY7QTgCEx/3Zilfdd82dVWX+nI8Em+zEyjXo3VqeyHP
	 TQemV8S9QAa/RKW3KqBpx/FXoBBKyjoSDwnGipsN5XmexL/HL+JrcKsPwBa0Y6rMoY
	 iiS6CNn66D/suV/KgtyXtJDeF8QrsYzND6wpBx6CDXCqoqGMpivw3ghBmaTfuMwd3t
	 itW4J9s2ASp69M6UhucXG/L5WZHiK0VgPtvIaAA01yp2uly/EjukSfTq/KMhw5BrJW
	 5E+1oaUbu1p9INLERPYFB32ZZyBO1y38reohsJu0a4hMortyZB8sQ3znoupiVVOIif
	 5wz0z4hIN308w==
Date: Wed, 28 May 2025 22:50:49 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, roger.pau@citrix.com, sstabellini@kernel.org, teddy.astie@vates.tech, dmukhin@ford.com, Denis Mukhin <dmkhn@proton.me>
Subject: [PATCH v9 2/3] xen/domain: adjust domain ID allocation for Arm
Message-ID: <20250528225030.2652166-3-dmukhin@ford.com>
In-Reply-To: <20250528225030.2652166-1-dmukhin@ford.com>
References: <20250528225030.2652166-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 98d2e0e7e4c3aa440e1df941fd653d8272b356b0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmkhn@proton.me>

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
Changes since v8:
- rebased=20
---
 xen/arch/arm/domain_build.c             | 4 ++--
 xen/common/device-tree/dom0less-build.c | 9 +++------
 xen/common/domain.c                     | 4 ++--
 3 files changed, 7 insertions(+), 10 deletions(-)

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
index a509f8fecd..9a6015f4ce 100644
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
index ae0c44fcbb..129b4fcb37 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -2423,8 +2423,8 @@ domid_t domid_alloc(domid_t domid)
     else
     {
         static domid_t domid_last;
-        /* NB: account for late hwdom case, skip ID#0 */
-        const domid_t reserved_domid =3D 0;
+        /* NB: account for late hwdom case */
+        const domid_t reserved_domid =3D get_initial_domain_id();
         const bool reserved =3D __test_and_set_bit(reserved_domid, domid_b=
itmap);
=20
         domid =3D find_next_zero_bit(domid_bitmap, DOMID_FIRST_RESERVED,
--=20
2.34.1



