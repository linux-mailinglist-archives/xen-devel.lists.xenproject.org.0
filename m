Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C4EAB940C
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 04:29:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986191.1371860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFkpA-0006yZ-Lm; Fri, 16 May 2025 02:29:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986191.1371860; Fri, 16 May 2025 02:29:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFkpA-0006vG-Ip; Fri, 16 May 2025 02:29:24 +0000
Received: by outflank-mailman (input) for mailman id 986191;
 Fri, 16 May 2025 02:29:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=07xk=YA=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uFkp8-0006te-Pk
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 02:29:22 +0000
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch
 [109.224.244.16]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92f3ed54-31fd-11f0-9eb6-5ba50f476ded;
 Fri, 16 May 2025 04:29:21 +0200 (CEST)
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
X-Inumbo-ID: 92f3ed54-31fd-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1747362560; x=1747621760;
	bh=v1vn8ef3G4X58jhWf4vJUvPbMgDk9COkx7mA/B+hxO0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=TyJxbmrhxNM9N4pdybXCxOjZcXHLylq1QtjamuDFe4f7UzkFU0vBZrqAV2dYr1AVQ
	 NPRloJiwr+w6przTXjCYQQ3EVVgcHSDPEoYgidSfpehzRxio4N/dOXc0WyuddnECXo
	 1chTJsIKF8Zm7svDD85SlvkMczz6/CYRmHvk2O5P+Ly004Q5RBiJGOQ8be6pAtrRpw
	 +uhvNhudv8hoWY+O9byS5s58uB+uxvMXSNng6lVCwDkAMovjdb8g0Sfpu5x0gmNiZq
	 80cbF8fTcGBlgm0tu3splgnKgrFePnsYYss92SN00sk2W0+Paqp/GdGlIw7EB/l+8N
	 P4QWJF1LGvSsQ==
Date: Fri, 16 May 2025 02:29:16 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v2 2/2] xen/domain: rewrite emulation_flags_ok()
Message-ID: <20250516022855.1146121-3-dmukhin@ford.com>
In-Reply-To: <20250516022855.1146121-1-dmukhin@ford.com>
References: <20250516022855.1146121-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: b6b8864594d38da9accff697830df3459e336910
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Rewrite emulation_flags_ok() to simplify future modifications.

Also, introduce X86_EMU_{BASELINE,OPTIONAL} helper macros.

No functional change intended.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v1:
- kept use of non-public X86_EMU_XXX flags
- corrected some comments and macro definitions
---
 xen/arch/x86/domain.c             | 29 +++++++++++------------------
 xen/arch/x86/include/asm/domain.h |  6 ++++++
 2 files changed, 17 insertions(+), 18 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index f197dad4c0..c64c2c6fef 100644
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
+    /* PV */
+    if ( !is_hvm_domain(d) )
+        return emflags =3D=3D 0 || emflags =3D=3D X86_EMU_PIT;
=20
-    return true;
+    /* HVM */
+    if ( is_hardware_domain(d) )
+        return emflags =3D=3D (X86_EMU_LAPIC |
+                           X86_EMU_IOAPIC |
+                           X86_EMU_VPCI);
+
+    return (emflags & ~X86_EMU_OPTIONAL) =3D=3D X86_EMU_BASELINE ||
+            emflags =3D=3D X86_EMU_LAPIC;
 }
=20
 void __init arch_init_idle_domain(struct domain *d)
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/d=
omain.h
index 8c0dea12a5..3a9a9fd80d 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -494,6 +494,12 @@ struct arch_domain
                                  X86_EMU_PIT | X86_EMU_USE_PIRQ |       \
                                  X86_EMU_VPCI)
=20
+/* User-selectable features. */
+#define X86_EMU_OPTIONAL        (X86_EMU_USE_PIRQ)
+
+#define X86_EMU_BASELINE        (X86_EMU_ALL & ~(X86_EMU_VPCI | \
+                                                 X86_EMU_OPTIONAL))
+
 #define has_vlapic(d)      (!!((d)->arch.emulation_flags & X86_EMU_LAPIC))
 #define has_vhpet(d)       (!!((d)->arch.emulation_flags & X86_EMU_HPET))
 #define has_vpm(d)         (!!((d)->arch.emulation_flags & X86_EMU_PM))
--=20
2.34.1



