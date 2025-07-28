Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3C8B14207
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 20:35:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061855.1427471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugSgg-0002UY-4q; Mon, 28 Jul 2025 18:35:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061855.1427471; Mon, 28 Jul 2025 18:35:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugSgg-0002R4-1m; Mon, 28 Jul 2025 18:35:02 +0000
Received: by outflank-mailman (input) for mailman id 1061855;
 Mon, 28 Jul 2025 18:35:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BLX+=2J=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ugSge-00027E-KE
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 18:35:00 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9163036b-6be1-11f0-a31e-13f23c93f187;
 Mon, 28 Jul 2025 20:35:00 +0200 (CEST)
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
X-Inumbo-ID: 9163036b-6be1-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1753727699; x=1753986899;
	bh=AJrWDRB/XvWmm/frqH3oNV/B10rMk3HBfyVy3aO8dtg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Yh1hhPOklzMb8lWrxb4thh7vCBQ1mfddLFYrC6cDtfcFYD4ZA09v4LrLEtijQH2GL
	 dPF+G6o3JgvSGjIQdTw4KJyD4EBiVmzFKRz1Nr6S/HjNeyW3Cqs9THS9Zuu0uyamlS
	 d1rwCoegXFbmUzjpYl2mmFpJkZVDP90q2sw3QnLYQinVWp5k19wOEnDgP2GQbH6ouq
	 HddPDreLJeFEW+GqF0atU5mbUlGLiA5LqWORL411GKCi1WXfLFWrTy2jXG4kUNQBbA
	 JpLwratp+WUOeNNiJijWYwcwt2AAAIOrk+RaOg4UFYG01CI2QYSwV9IBzwhKRKy8aU
	 swrCQOC5lvDVg==
Date: Mon, 28 Jul 2025 18:34:55 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: alejandro.garciavallejo@amd.com, andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v11 3/3] xen/domain: update create_dom0() messages
Message-ID: <20250728183427.1013975-4-dmukhin@ford.com>
In-Reply-To: <20250728183427.1013975-1-dmukhin@ford.com>
References: <20250728183427.1013975-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: ab9008a83a631816804c415d61b786e37d3cacdb
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>=20

Use %pd for domain identification in error/panic messages in create_dom0().

No functional change.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
Reviewed-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
Changed since v10:
- corrected messages in create_dom0()
- added Alejandro's R-b
---
 xen/arch/arm/domain_build.c | 8 ++++----
 xen/arch/x86/setup.c        | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 789f2b9d3ce7..9422b5e1827b 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2081,17 +2081,17 @@ void __init create_dom0(void)
=20
     dom0 =3D domain_create(domid, &dom0_cfg, flags);
     if ( IS_ERR(dom0) )
-        panic("Error creating domain 0 (rc =3D %ld)\n", PTR_ERR(dom0));
+        panic("Error creating d%d (rc =3D %ld)\n", domid, PTR_ERR(dom0));
=20
     if ( llc_coloring_enabled && (rc =3D dom0_set_llc_colors(dom0)) )
-        panic("Error initializing LLC coloring for domain 0 (rc =3D %d)\n"=
, rc);
+        panic("Error initializing LLC coloring for %pd (rc =3D %d)\n", dom=
0, rc);
=20
     if ( vcpu_create(dom0, 0) =3D=3D NULL )
-        panic("Error creating domain 0 vcpu0\n");
+        panic("Error creating %pdv0\n", dom0);
=20
     rc =3D construct_dom0(dom0);
     if ( rc )
-        panic("Could not set up DOM0 guest OS (rc =3D %d)\n", rc);
+        panic("Could not set up %pd guest OS (rc =3D %d)\n", dom0, rc);
=20
     set_xs_domain(dom0);
 }
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 2ff7c28c277b..a740c6f60c63 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1084,7 +1084,7 @@ static struct domain *__init create_dom0(struct boot_=
info *bi)
=20
         if ( (strlen(acpi_param) =3D=3D 0) && acpi_disabled )
         {
-            printk("ACPI is disabled, notifying Domain 0 (acpi=3Doff)\n");
+            printk("ACPI is disabled, notifying %pd (acpi=3Doff)\n", d);
             safe_strcpy(acpi_param, "off");
         }
=20
@@ -1099,7 +1099,7 @@ static struct domain *__init create_dom0(struct boot_=
info *bi)
=20
     bd->d =3D d;
     if ( construct_dom0(bd) !=3D 0 )
-        panic("Could not construct domain 0\n");
+        panic("Could not construct %pd\n", d);
=20
     bd->cmdline =3D NULL;
     xfree(cmdline);
--=20
2.34.1



