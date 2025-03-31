Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5708A77030
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 23:35:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932984.1335029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzMmC-0001wq-Ip; Mon, 31 Mar 2025 21:34:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932984.1335029; Mon, 31 Mar 2025 21:34:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzMmC-0001vI-FR; Mon, 31 Mar 2025 21:34:36 +0000
Received: by outflank-mailman (input) for mailman id 932984;
 Mon, 31 Mar 2025 21:34:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MI1n=WS=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tzMm9-0001vA-9u
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 21:34:34 +0000
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch
 [109.224.244.17]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eda80ebd-0e77-11f0-9ffb-bf95429c2676;
 Mon, 31 Mar 2025 23:34:30 +0200 (CEST)
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
X-Inumbo-ID: eda80ebd-0e77-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1743456869; x=1743716069;
	bh=hCk7UPeU4cSqzWxoWMpdZnQsPxbG8g2UltdF25C6YCg=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=iN3r2AEw9qPNkn1aVevo7sG4HSvcus6xrnRymRVWE1H0xRmoKhvRiVhph08mz+JGC
	 NswgsOSG8446hEdJpRMZZWaK5BrAebYyQodD8ABWHTbvp6s8S0sZ3GmFEHheUJ1N/v
	 ygjrJbWRlfTpf/YsszFoX6hMWCUZnBx9c0H8V+kkjTPjO1rCNvAk6OgmXsSlNtyEUm
	 PR8pW7iQKwxQ9aYGo4sOnA+cT68gs2C7FsHw/UoqWAesBpjw8/1rkBSvgqUkFoWs1u
	 JR4QccNRjM0iHo8JYU0VHZAGjXeYKLuljQUnQRZZNCmuGQTzwF5t94l9CNym+7s36T
	 0+jwefxPPkXhQ==
Date: Mon, 31 Mar 2025 21:34:24 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v1] x86/domain: revisit logging in arch_domain_create()
Message-ID: <20250331213406.422725-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 414ba1d83d156b13a002975fe83cb5ff80771cb7
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Use %pd in all logs issued from arch_domain_create().

Also, expand error message in arch_domain_create() under
!emulation_flags_ok() case to help debugging.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
The origin of the patch is:
  https://lore.kernel.org/xen-devel/20250103-vuart-ns8250-v3-v1-6-c5d36b31d=
66c@ford.com/
---
 xen/arch/x86/domain.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index a42fa54805..15c5e2a652 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -798,13 +798,12 @@ int arch_domain_create(struct domain *d,
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
@@ -814,16 +813,19 @@ int arch_domain_create(struct domain *d,
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
+               is_hardware_domain(d) ? "(hardware) " : "",
+               emflags);
         return -EOPNOTSUPP;
     }
     d->arch.emulation_flags =3D emflags;
--=20
2.34.1



