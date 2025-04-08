Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F0DA818E1
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 00:41:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.943235.1342063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2HcS-00063r-NF; Tue, 08 Apr 2025 22:40:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 943235.1342063; Tue, 08 Apr 2025 22:40:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2HcS-00060V-Jc; Tue, 08 Apr 2025 22:40:36 +0000
Received: by outflank-mailman (input) for mailman id 943235;
 Tue, 08 Apr 2025 22:40:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xbCh=W2=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u2HcQ-0005LN-4N
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 22:40:35 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a51e2f4-14ca-11f0-9eaa-5ba50f476ded;
 Wed, 09 Apr 2025 00:40:32 +0200 (CEST)
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
X-Inumbo-ID: 7a51e2f4-14ca-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1744152030; x=1744411230;
	bh=UjDXMl9+ugJIQktlxZ67eNKFMfXzRfDw1JSboiq8CLw=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=DJ6LYHNiQ9a1hBOQd9Fhd4dUJS2m7MgwNrbKvVUQ733ekyP5dOPCHWu/ATBVk6Uf2
	 hauTnYDENkAOaGBOGeDmq1Hm1WGFt58uXNijYcmHMx26/REirNlSm4idEhAtwMcpxw
	 Ng5XVtjFbKtSWlmmiiwSq5wrwubL68kaN1wmakBbof/dqokSMdSxyO/NlL3R4/xT9l
	 rxFlyL/TecsZgBwJEFbZiRKpyqEMIKjG9JPRalyd0NcHasTxZwZ1J+V6csJ3tDLI1g
	 O+A9EAUyxPQDPTH4WcWxilkwwWSJuh6PlBEA05jAkHNT/An9zRY2R3SeNC2rmcuszZ
	 MpRso2lwWZ8+Q==
Date: Tue, 08 Apr 2025 22:40:24 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, jbeulich@suse.com, roger.pau@citrix.com, dmukhin@ford.com
Subject: [PATCH v5] x86/domain: revisit logging in arch_domain_create()
Message-ID: <20250408224021.1579818-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 11dc7081b338859f57d9690f370bdae43bd65f37
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
Changes since v4:
- updated wording in the messages as per v4 review
---
 xen/arch/x86/domain.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 4989600627..60d85a9b3e 100644
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
+                   "%pd: will not create domU on this CPU for security rea=
sons\n",
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
+               "%pd: will not create %s %sdomain with emulators: %#x\n",
+               d,
+               is_hvm_domain(d) ? "HVM" : "PV",
+               is_hardware_domain(d) ? "hardware " : "",
+               emflags);
         return -EOPNOTSUPP;
     }
     d->arch.emulation_flags =3D emflags;
--=20
2.34.1



