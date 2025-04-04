Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF130A7C6B6
	for <lists+xen-devel@lfdr.de>; Sat,  5 Apr 2025 01:23:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.938394.1339248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0qMW-0007JW-AP; Fri, 04 Apr 2025 23:22:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 938394.1339248; Fri, 04 Apr 2025 23:22:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0qMW-0007HE-4G; Fri, 04 Apr 2025 23:22:12 +0000
Received: by outflank-mailman (input) for mailman id 938394;
 Fri, 04 Apr 2025 23:22:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zs29=WW=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u0qMT-0007Gp-Q7
 for xen-devel@lists.xenproject.org; Fri, 04 Apr 2025 23:22:11 +0000
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch
 [109.224.244.18]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a9db45a-11ab-11f0-9ffb-bf95429c2676;
 Sat, 05 Apr 2025 01:21:58 +0200 (CEST)
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
X-Inumbo-ID: 9a9db45a-11ab-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=ibpxuwtswncnlmh4zkhiwv5cie.protonmail; t=1743808916; x=1744068116;
	bh=49Ju++lLuXU44wcNF7eEoQx4Rfpq2a7Ix0334NpiMts=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=N6varBW8+czG+Pf6ypEky0x4sVyrMy4pE+d4Nh5tsQMbgBEtsaVl2jMMNMZTSXcgc
	 gvq7wlurq/Xh4LBb2MoV9SxI5JYk4wfjBrvZnOweYKLc1pvJuiaWiH7bcrxNFcGxcd
	 lCSBJtokjzuRH8IoTBuV0cQjWGKlnoC+AmlPGIGSkXhOnLMsNGDko8mZN5CMkfhjJM
	 29xPiv/kmZ0paID3svwXQ6UOXmAZX2LNCsOOd3UWBIMEiGzWrhdKCyPd5N7QuCigf1
	 CTfH7nBEpcfPTFzbXkAZRvDwNioOdX+AdzVrDXKzNYBMUsFzMf3BpBsVQ2Q/unuIRr
	 EMzykx5l+tQiQ==
Date: Fri, 04 Apr 2025 23:21:51 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v4] x86/domain: revisit logging in arch_domain_create()
Message-ID: <20250404232145.1252544-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 9dc92184b58b03b843d7e9e2828c1d6cd23c2ca2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Use %pd in all logs issued from arch_domain_create() and reword some of the
messages.

Also, expand error message in arch_domain_create() under !emulation_flags_o=
k()
case to help debugging.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v3:
- re-formatted log messages
- shortened message text where possible
---
 xen/arch/x86/domain.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 4989600627..0db0567877 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -791,13 +791,14 @@ int arch_domain_create(struct domain *d,
     {
         if ( !opt_allow_unsafe )
         {
-            printk(XENLOG_G_ERR "Xen does not allow DomU creation on this =
CPU"
-                   " for security reasons.\n");
+            printk(XENLOG_G_ERR
+                   "%pd: cannot create domain on this CPU due to security =
reasons\n",
+                   d);
             return -EPERM;
         }
         printk(XENLOG_G_WARNING
-               "Dom%d may compromise security on this CPU.\n",
-               d->domain_id);
+               "%pd: may compromise security on this CPU\n",
+               d);
     }
=20
     emflags =3D config->arch.emulation_flags;
@@ -807,16 +808,20 @@ int arch_domain_create(struct domain *d,
=20
     if ( emflags & ~XEN_X86_EMU_ALL )
     {
-        printk(XENLOG_G_ERR "d%d: Invalid emulation bitmap: %#x\n",
-               d->domain_id, emflags);
+        printk(XENLOG_G_ERR
+               "%pd: invalid emulation bitmap: %#x\n",
+               d, emflags);
         return -EINVAL;
     }
=20
     if ( !emulation_flags_ok(d, emflags) )
     {
-        printk(XENLOG_G_ERR "d%d: Xen does not allow %s domain creation "
-               "with the current selection of emulators: %#x\n",
-               d->domain_id, is_hvm_domain(d) ? "HVM" : "PV", emflags);
+        printk(XENLOG_G_ERR
+               "%pd: cannot create %s %sdomain with emulators: %#x\n",
+               d,
+               is_hvm_domain(d) ? "HVM" : "PV",
+               is_hardware_domain(d) ? "hardware " : "",
+               emflags);
         return -EOPNOTSUPP;
     }
     d->arch.emulation_flags =3D emflags;
--=20
2.34.1



