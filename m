Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5584CAE4CD3
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 20:28:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022625.1398457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTlts-0006he-9U; Mon, 23 Jun 2025 18:28:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022625.1398457; Mon, 23 Jun 2025 18:28:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTlts-0006g0-5z; Mon, 23 Jun 2025 18:28:12 +0000
Received: by outflank-mailman (input) for mailman id 1022625;
 Mon, 23 Jun 2025 18:28:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v3i4=ZG=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uTltr-00068u-0n
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 18:28:11 +0000
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch
 [79.135.106.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0bbcd0a-505f-11f0-a30f-13f23c93f187;
 Mon, 23 Jun 2025 20:28:10 +0200 (CEST)
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
X-Inumbo-ID: d0bbcd0a-505f-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1750703288; x=1750962488;
	bh=koB+Pvq4aT3GTen+IwSnn3j1ioEvBKt7OHrxH//L4u4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Jvj2FO94Cl2vBjFve4VcxT1V0yJH3hS/oFzeBDzl1Ks8lnOncEC0r0cIVeKX6N2bQ
	 oHp4aXnLF8hpx71cMGaw6cXWJtVAsz631q+JCSBhSgw1BR64bXwUXZ3GDTOqkkALo/
	 rDiu3FWgBojnjwHpsn7qjAI9Hu21fS++UPnFhw1zNXCXzM/lur4mhOt9C/HzI76CCV
	 D9Wi5eWM6YtiIlRwJwqN28KBCx5q3kxwxqi5zTzHOwOixPGVEGmZlkHfNjk8Fcp51c
	 3ufyjRktJVZfbTXYZBacNydSIt6sXL0P1wSYPtSATGot2Ti+EvGYgWnNaqql6K94+H
	 ejkvzw+BsY3/A==
Date: Mon, 23 Jun 2025 18:28:06 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v10 2/3] xen/domain: update create_dom0() messages
Message-ID: <20250623182721.194238-3-dmukhin@ford.com>
In-Reply-To: <20250623182721.194238-1-dmukhin@ford.com>
References: <20250623182721.194238-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: dd797a6c066bda0250210592555991ff73fdfe6b
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Use %pd for domain identification in error/panic messages in create_dom0().

No functional change.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v9:
- new patch
---
 xen/arch/arm/domain_build.c | 8 ++++----
 xen/arch/x86/setup.c        | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 9fa5143eb98c..b59b56636920 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2080,17 +2080,17 @@ void __init create_dom0(void)
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
     if ( alloc_dom0_vcpu0(dom0) =3D=3D NULL )
-        panic("Error creating domain 0 vcpu0\n");
+        panic("Error creating %pdv0\n", dom0);
=20
     rc =3D construct_dom0(dom0);
     if ( rc )
-        panic("Could not set up DOM0 guest OS (rc =3D %d)\n", rc);
+        panic("Could not set up guest OS for %pd (rc =3D %d)\n", dom0, rc)=
;
=20
     set_xs_domain(dom0);
 }
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 7adb92d78a18..28bcfd1861d4 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1080,7 +1080,7 @@ static struct domain *__init create_dom0(struct boot_=
info *bi)
=20
         if ( (strlen(acpi_param) =3D=3D 0) && acpi_disabled )
         {
-            printk("ACPI is disabled, notifying Domain 0 (acpi=3Doff)\n");
+            printk("ACPI is disabled, notifying %pd (acpi=3Doff)\n", d);
             safe_strcpy(acpi_param, "off");
         }
=20
@@ -1095,7 +1095,7 @@ static struct domain *__init create_dom0(struct boot_=
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



