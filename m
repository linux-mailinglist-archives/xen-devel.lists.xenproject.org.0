Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 922B6A797D3
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 23:44:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936078.1337397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u05sm-0001ME-Ut; Wed, 02 Apr 2025 21:44:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936078.1337397; Wed, 02 Apr 2025 21:44:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u05sm-0001K5-RZ; Wed, 02 Apr 2025 21:44:24 +0000
Received: by outflank-mailman (input) for mailman id 936078;
 Wed, 02 Apr 2025 21:44:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CoDa=WU=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u05sk-0001Jz-PN
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 21:44:23 +0000
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch
 [79.135.106.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a29c0901-100b-11f0-9eaa-5ba50f476ded;
 Wed, 02 Apr 2025 23:44:20 +0200 (CEST)
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
X-Inumbo-ID: a29c0901-100b-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=s3n67ongsnhqzjj3s2c2zfm2xi.protonmail; t=1743630259; x=1743889459;
	bh=TmNqU07uPQxkM/ghHUkY6N16icK4s+P0Dzt381klIEE=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=DF35QvxR8Ta+vpy+n5bFioraPiC9X4x0qiBbh2gZflxNRapBHC3gdc9cdv6KLboC+
	 xdKa7U/tKTGph20AlVUXysBg+TTFGZYK83/QWkOGF2b6PVKEXBwAPur2C2fwNq8Ivk
	 XOAD4zNbZBVnu108lEJWsur+I4gvpZUYoNiqnznvpStR3BJ1Duxs/sfbgLfHzLsFRE
	 SA1FzAnP+Gep4eG7BuqcMLMks8i5tz+iLO7HSBXhAFmcqDeRHEvETyAZRwnpbmYs6/
	 eEcBBxZGgmnGo9WNSQrP3HSevC65KTCPa3pm1VwUlIvQzeQpIs+AFpN5oi8+GjGWdB
	 qy1QeuXdRIKdw==
Date: Wed, 02 Apr 2025 21:44:15 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v3] x86/domain: revisit logging in arch_domain_create()
Message-ID: <20250402214406.115578-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: f26cd1a4b7aed4d217898d2b7dc24fa33d658f8c
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Use %pd in all logs issued from arch_domain_create().

Also, expand error message in arch_domain_create() under
!emulation_flags_ok() case to help debugging.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v2:
- dropped full stops in the updated log messages
---
 xen/arch/x86/domain.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 4989600627..4ae1344cf5 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -791,13 +791,12 @@ int arch_domain_create(struct domain *d,
     {
         if ( !opt_allow_unsafe )
         {
-            printk(XENLOG_G_ERR "Xen does not allow DomU creation on this =
CPU"
-                   " for security reasons.\n");
+            printk(XENLOG_G_ERR "%pd: Xen does not allow DomU creation on =
this CPU"
+                   " for security reasons\n", d);
             return -EPERM;
         }
         printk(XENLOG_G_WARNING
-               "Dom%d may compromise security on this CPU.\n",
-               d->domain_id);
+               "%pd: domain may compromise security on this CPU\n", d);
     }
=20
     emflags =3D config->arch.emulation_flags;
@@ -807,16 +806,19 @@ int arch_domain_create(struct domain *d,
=20
     if ( emflags & ~XEN_X86_EMU_ALL )
     {
-        printk(XENLOG_G_ERR "d%d: Invalid emulation bitmap: %#x\n",
-               d->domain_id, emflags);
+        printk(XENLOG_G_ERR "%pd: Invalid emulation bitmap: %#x\n",
+               d, emflags);
         return -EINVAL;
     }
=20
     if ( !emulation_flags_ok(d, emflags) )
     {
-        printk(XENLOG_G_ERR "d%d: Xen does not allow %s domain creation "
+        printk(XENLOG_G_ERR "%pd: Xen does not allow %s %sdomain creation =
"
                "with the current selection of emulators: %#x\n",
-               d->domain_id, is_hvm_domain(d) ? "HVM" : "PV", emflags);
+               d,
+               is_hvm_domain(d) ? "HVM" : "PV",
+               is_hardware_domain(d) ? "hardware " : "",
+               emflags);
         return -EOPNOTSUPP;
     }
     d->arch.emulation_flags =3D emflags;
--=20
2.34.1



