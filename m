Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0ECA783D1
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 23:11:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934805.1336387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzisa-0000lm-8P; Tue, 01 Apr 2025 21:10:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934805.1336387; Tue, 01 Apr 2025 21:10:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzisa-0000kj-5b; Tue, 01 Apr 2025 21:10:40 +0000
Received: by outflank-mailman (input) for mailman id 934805;
 Tue, 01 Apr 2025 21:10:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Dnoa=WT=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tzisX-0000aB-IB
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 21:10:38 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c094f2ba-0f3d-11f0-9ffb-bf95429c2676;
 Tue, 01 Apr 2025 23:10:35 +0200 (CEST)
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
X-Inumbo-ID: c094f2ba-0f3d-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1743541834; x=1743801034;
	bh=hj9Bk2XsZOw0d0IurV4cLOQhgFhNNpF0lbwQuOaOKLU=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=UpLZTEri+Db4cOhxxAp6AIgWz/HyOmNK3HnxiesffMy59SRKx3urscPzf4eP83g2Q
	 ScD4jYaMBOgVZto2E7bq0v35c1wmo4ysVljv1tW5gL4PVXHLNQTspwCkWR4Fnume0x
	 Bk9KnwPiIhivaoDoC3mH8NiZERMNZpsgZG96koNppIs9zlYRPWwiaOZoTW4wu/0q92
	 eZiRc8rM3VuQe/tJly6wQBrESW9CHkVituigpJMKW7rgIKGqvKdUi+HDx1Fb8mEOuD
	 4BDZQEZkxYHWbQ90CkXptr7udWG8N/V0haiHV6XmY/FpszLnIeMAjQsvLufpF4kH8r
	 PKvnWfVeFUXqA==
Date: Tue, 01 Apr 2025 21:10:28 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v2] x86/domain: revisit logging in arch_domain_create()
Message-ID: <20250401211018.75814-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 839b4d7e9735c64dc9d6a9a104cfc1749e5d14dd
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Use %pd in all logs issued from arch_domain_create().

Also, expand error message in arch_domain_create() under
!emulation_flags_ok() case to help debugging.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v1:
- dropped parentheses around "hardware" in the log message
---
 xen/arch/x86/domain.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 4989600627..bd887b4d44 100644
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
+                   " for security reasons.\n", d);
             return -EPERM;
         }
         printk(XENLOG_G_WARNING
-               "Dom%d may compromise security on this CPU.\n",
-               d->domain_id);
+               "%pd: domain may compromise security on this CPU.\n", d);
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



