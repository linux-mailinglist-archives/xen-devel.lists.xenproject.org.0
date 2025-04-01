Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 623D2A77221
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 02:53:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933299.1335309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzPs5-0001ok-C4; Tue, 01 Apr 2025 00:52:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933299.1335309; Tue, 01 Apr 2025 00:52:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzPs5-0001mO-8I; Tue, 01 Apr 2025 00:52:53 +0000
Received: by outflank-mailman (input) for mailman id 933299;
 Tue, 01 Apr 2025 00:52:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Dnoa=WT=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tzPs4-0001Vj-0o
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 00:52:52 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a379d6bf-0e93-11f0-9ea7-5ba50f476ded;
 Tue, 01 Apr 2025 02:52:51 +0200 (CEST)
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
X-Inumbo-ID: a379d6bf-0e93-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1743468770; x=1743727970;
	bh=B+nW3wpkgRHCfK9/oUXAoU8jQvHaLOWMAP0n+f15LaY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=TA1rQmaHsgnCSk9bWlamhagyRoq/7zM0ah9oNGDruOiCQzpvt0xAq+lav9GnU23hq
	 WpGxu3+TIyNOZ7G56HdBRZLKrU2YSeBc8qysNMuBlE5m7EBhbzt8/ktEnp0uxCufkI
	 LA8R0lMwb3sy1n08vYdEu7IkGZrqDoNYr3zovDgJsQZ3KeoijX5zwPa58HiKgkwUxV
	 vbwghoQAwJvb5+pqdHx3inwHP34igIIyM2+ciogKI7oe0zlol/7yg3c67jBeS9h265
	 c4wKHez1wuEh/yP4APKKiuvn2GT8f/LjvNaBP08nPD4olDnQWce41EWiOXl6OC9cSE
	 /db/kQoU7MBng==
Date: Tue, 01 Apr 2025 00:52:46 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v1 3/3] xen/domain: rewrite emulation_flags_ok()
Message-ID: <20250401005224.461325-4-dmukhin@ford.com>
In-Reply-To: <20250401005224.461325-1-dmukhin@ford.com>
References: <20250401005224.461325-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: bee36f03c1d6eac652f496a7ccdb1508ba725863
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Rewrite emulation_flags_ok() using XEN_X86_EMU_{OPTIONAL,BASELINE}
to simplify future modifications.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Came in the context of NS16550 emulator v3 series:
  https://lore.kernel.org/xen-devel/20250103-vuart-ns8250-v3-v1-0-c5d36b31d=
66c@ford.com/

After modifying emulation_flags_ok() with a new NS16550 vUART
configuration switch passed from the toolstack for the HVM
case, I decided to look into how to improve emulation_flags_ok().
---
 xen/arch/x86/domain.c | 29 +++++++++++------------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 15c5e2a652..23051bb176 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -750,25 +750,18 @@ static bool emulation_flags_ok(const struct domain *d=
, uint32_t emflags)
     BUILD_BUG_ON(X86_EMU_ALL !=3D XEN_X86_EMU_ALL);
 #endif
=20
-    if ( is_hvm_domain(d) )
-    {
-        if ( is_hardware_domain(d) &&
-             emflags !=3D (X86_EMU_VPCI | X86_EMU_LAPIC | X86_EMU_IOAPIC) =
)
-            return false;
-        if ( !is_hardware_domain(d) &&
-             /* HVM PIRQ feature is user-selectable. */
-             (emflags & ~X86_EMU_USE_PIRQ) !=3D
-             (X86_EMU_ALL & ~(X86_EMU_VPCI | X86_EMU_USE_PIRQ)) &&
-             emflags !=3D X86_EMU_LAPIC )
-            return false;
-    }
-    else if ( emflags !=3D 0 && emflags !=3D X86_EMU_PIT )
-    {
-        /* PV or classic PVH. */
-        return false;
-    }
+    /* PV or classic PVH */
+    if ( !is_hvm_domain(d) )
+        return emflags =3D=3D 0 || emflags =3D=3D XEN_X86_EMU_PIT;
=20
-    return true;
+    /* HVM */
+    if ( is_hardware_domain(d) )
+        return emflags =3D=3D (XEN_X86_EMU_LAPIC |
+                           XEN_X86_EMU_IOAPIC |
+                           XEN_X86_EMU_VPCI);
+
+    return (emflags & ~XEN_X86_EMU_OPTIONAL) =3D=3D XEN_X86_EMU_BASELINE |=
|
+            emflags =3D=3D XEN_X86_EMU_LAPIC;
 }
=20
 void __init arch_init_idle_domain(struct domain *d)
--=20
2.34.1



