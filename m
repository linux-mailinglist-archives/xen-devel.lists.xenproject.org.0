Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A89CAD3B85
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 16:45:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011034.1389324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP0E6-00010n-1j; Tue, 10 Jun 2025 14:45:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011034.1389324; Tue, 10 Jun 2025 14:45:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP0E5-0000yI-VK; Tue, 10 Jun 2025 14:45:21 +0000
Received: by outflank-mailman (input) for mailman id 1011034;
 Tue, 10 Jun 2025 14:45:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zL97=YZ=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uP0E4-0000yC-Lu
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 14:45:20 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86f99796-4609-11f0-b894-0df219b8e170;
 Tue, 10 Jun 2025 16:45:18 +0200 (CEST)
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
X-Inumbo-ID: 86f99796-4609-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1749566717; x=1749825917;
	bh=j8NChAoRRghHkw6bMdTgGH+7hSXGauASCqa0irGPmnE=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=igWk0BbFYPUYflBR7P2G83gBqaHtDuV8TBMtx+BcbgaBK0txXjenS+bQc5frpT0db
	 yGMZFEQIP4El/tTlC937x3RRxUKcNTJWrHLyUdurp00u5LMU+LOGewogQWwKnrCWFf
	 5ztW81NrLauZqR/HcdDtLncA68QJi5x9cFVTm7rQx9jvtCqjO8EuzQ+1r/UqmD6F4W
	 v0pmPeX40Ythl2mZDcQrB/i0lJs9dPx+XkLRincAfntnyeNiFCK2Qe5qvd3HPvwyq4
	 HitoELmBlCkqYYXrozXy4Lg1L8rf/GSHpvMhALjDZzVntvQIEf/aSnt5U/X/l5ybpT
	 blI1pW0Nta+tA==
Date: Tue, 10 Jun 2025 14:45:12 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, teddy.astie@vates.tech, dmukhin@ford.com
Subject: [PATCH v7] xen/domain: rewrite emulation_flags_ok()
Message-ID: <20250610144500.3176661-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 15c94af66adda4f24e222cb211be6c59b2f8fe66
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Rewrite emulation_flags_ok() to simplify future modifications.

No functional change intended.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v6:
- simplified checks for PV further

Link to v6: https://lore.kernel.org/xen-devel/20250610004216.3012253-1-dmuk=
hin@ford.com/
Link to CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/1=
862559089
---
 xen/arch/x86/domain.c | 78 +++++++++++++++++++++++++++++++++----------
 1 file changed, 60 insertions(+), 18 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 7536b6c871..fdbd064ebf 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -743,32 +743,74 @@ int arch_sanitise_domain_config(struct xen_domctl_cre=
atedomain *config)
     return 0;
 }
=20
+/*
+ * Verify that the domain's emulation flags resolve to a supported configu=
ration.
+ *
+ * This ensures we only allow a known, safe subset of emulation combinatio=
ns
+ * (for both functionality and security). Arbitrary mixes are likely to ca=
use
+ * errors (e.g. null pointer dereferences).
+ *
+ * NB: use the internal X86_EMU_XXX symbols, not the public XEN_X86_EMU_XX=
X
+ * symbols.
+ */
 static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
 {
+    enum {
+        CAP_PV          =3D BIT(0, U),
+        CAP_HVM         =3D BIT(1, U),
+        CAP_HWDOM       =3D BIT(2, U),
+        CAP_DOMU        =3D BIT(3, U),
+    };
+    static const struct {
+        unsigned int caps;
+        uint32_t min;
+        uint32_t opt;
+    } configs[] =3D {
+#ifdef CONFIG_PV
+        /* PV dom0 and domU */
+        {
+            .caps   =3D CAP_PV | CAP_HWDOM | CAP_DOMU,
+            .opt    =3D X86_EMU_PIT,
+        },
+#endif /* #ifdef CONFIG_PV */
+
+#ifdef CONFIG_HVM
+        /* PVH dom0 */
+        {
+            .caps   =3D CAP_HVM | CAP_HWDOM,
+            .min    =3D X86_EMU_LAPIC | X86_EMU_IOAPIC | X86_EMU_VPCI,
+        },
+
+        /* PVH domU */
+        {
+            .caps   =3D CAP_HVM | CAP_DOMU,
+            .min    =3D X86_EMU_LAPIC,
+        },
+
+        /* HVM domU */
+        {
+            .caps   =3D CAP_HVM | CAP_DOMU,
+            .min    =3D X86_EMU_ALL & ~(X86_EMU_VPCI | X86_EMU_USE_PIRQ),
+            /* HVM PIRQ feature is user-selectable. */
+            .opt    =3D X86_EMU_USE_PIRQ,
+        },
+#endif /* #ifdef CONFIG_HVM */
+    };
+    unsigned int i;
+    unsigned int caps =3D (is_pv_domain(d) ? CAP_PV : CAP_HVM) |
+                        (is_hardware_domain(d) ? CAP_HWDOM : CAP_DOMU);
+
 #ifdef CONFIG_HVM
     /* This doesn't catch !CONFIG_HVM case but it is better than nothing *=
/
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
+    for ( i =3D 0; i < ARRAY_SIZE(configs); i++ )
+        if ( (caps & configs[i].caps) =3D=3D caps &&
+             (emflags & ~configs[i].opt) =3D=3D configs[i].min )
+            return true;
=20
-    return true;
+    return false;
 }
=20
 void __init arch_init_idle_domain(struct domain *d)
--=20
2.34.1



