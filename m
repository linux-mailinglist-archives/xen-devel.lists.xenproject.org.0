Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE845B165AB
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 19:41:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1064318.1430032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhAnj-0007pi-1Z; Wed, 30 Jul 2025 17:41:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1064318.1430032; Wed, 30 Jul 2025 17:41:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhAni-0007mC-Sp; Wed, 30 Jul 2025 17:41:14 +0000
Received: by outflank-mailman (input) for mailman id 1064318;
 Wed, 30 Jul 2025 17:41:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Z10=2L=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uhAni-0006wr-2t
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 17:41:14 +0000
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch
 [79.135.106.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 626abef9-6d6c-11f0-b895-0df219b8e170;
 Wed, 30 Jul 2025 19:41:12 +0200 (CEST)
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
X-Inumbo-ID: 626abef9-6d6c-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1753897271; x=1754156471;
	bh=cOJp9/TT9teYJtKcMJEIwPElIEvwJ0QU1V6DnZCzFaY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=d51yxQ0Ll3qkFVm/TQABF+9jry1j4NWN6pKbOFf6gKMH1ABQyWvHW82Y5boQ3IV4N
	 OGPR4+Lrgm8At3k6ENC+1nmbXEpHq0uZrVgefdyWRQUk/Ga3MI/K4zDSMxVBHDDbmv
	 Styc6yJ2JVzm7iKTk8eh7ObzmTjS2YJKfgwsMiUTvvNIHg/ZK2+ARTld0Yp8Nlz//a
	 gK9AbSaJYj+5Vn5lHHOp5XehOLxk0XSN/a6xcWQbSu03La7l1HtSRjrBHovTrx+lVn
	 gae8t1mvRWVNsFBhSF35Tx7Q5F14XrHXgqRBKLLdR1qLIpR7VBVjbC7n0Aprrk0Go3
	 iLjo/5WdrAS4w==
Date: Wed, 30 Jul 2025 17:41:05 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: alejandro.garciavallejo@amd.com, andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v13 3/3] xen/domain: update create_dom0() messages
Message-ID: <20250730174042.1632011-4-dmukhin@ford.com>
In-Reply-To: <20250730174042.1632011-1-dmukhin@ford.com>
References: <20250730174042.1632011-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 8694e1a1eccb0df379012085a56cc309dee21075
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>=20

Use %pd for domain identification in error/panic messages in create_dom0().

No functional change.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
Reviewed-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v12:
- n/a
---
 xen/arch/arm/domain_build.c | 6 +++---
 xen/arch/x86/setup.c        | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 789f2b9d3ce7..02a15d160962 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2084,14 +2084,14 @@ void __init create_dom0(void)
         panic("Error creating domain 0 (rc =3D %ld)\n", PTR_ERR(dom0));
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



