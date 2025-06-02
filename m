Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F73ACBB65
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 21:18:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003774.1383398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMAfL-0000OH-NY; Mon, 02 Jun 2025 19:17:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003774.1383398; Mon, 02 Jun 2025 19:17:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMAfL-0000Ko-KF; Mon, 02 Jun 2025 19:17:47 +0000
Received: by outflank-mailman (input) for mailman id 1003774;
 Mon, 02 Jun 2025 19:17:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J+98=YR=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uMAfK-0000JS-I9
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 19:17:46 +0000
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch
 [109.224.244.18]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43147dee-3fe6-11f0-a300-13f23c93f187;
 Mon, 02 Jun 2025 21:17:45 +0200 (CEST)
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
X-Inumbo-ID: 43147dee-3fe6-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1748891864; x=1749151064;
	bh=uzDJxgN96Kqct/U5nq9L2/hSZ+SqbrgJbBHgdSzDlw8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=N0t0Aeyiiu2xj4exQknK6b4bzlblBLK1kUHpxCissNgvb507Z4ngR7isvwZyedmZV
	 jSLno16ODafAY5HmtbWfl/F4ZdZ3g9ryH6gAxzCGEPLvK15EpdpML3iVV6yJurcAJf
	 5qFi/JexUzkjoODs78uVrSOt7GP6NctREv7MkuQCpO9Xy60ROthvRmSOKWhMUIPVzr
	 cLSv/DgjGFw8kt2ApZIguSy+aPHMDHNn8qZuxk6waXSA10Mb8Ih2/CB6S3gfqbGIyh
	 mKOWvoKxELGmVE08DQ1uikGvpNMoQUuRwls2uccnLxDdGRNH8R0Pry+RobYQh/iH46
	 WNXst4DSGsf8g==
Date: Mon, 02 Jun 2025 19:17:38 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, teddy.astie@vates.tech, dmukhin@ford.com
Subject: [PATCH v5 2/2] xen/domain: rewrite emulation_flags_ok()
Message-ID: <20250602191717.148361-3-dmukhin@ford.com>
In-Reply-To: <20250602191717.148361-1-dmukhin@ford.com>
References: <20250602191717.148361-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 9ead51012b322b3702c37d34c3ae7cb06b5d2c06
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Rewrite emulation_flags_ok() to simplify future modifications.

No functional change intended.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Teddy Astie <teddy.astie@vates.tech>
---
Changes since v4:
- updated commentaries
- added Teddy's R-b, kept Stefano's R-b
---
 xen/arch/x86/domain.c | 91 ++++++++++++++++++++++++++++++++++---------
 1 file changed, 73 insertions(+), 18 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 0363ccb384..4f6670ce37 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -743,32 +743,87 @@ int arch_sanitise_domain_config(struct xen_domctl_cre=
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
+ * errors (e.g., null pointer dereferences).
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
+        /* PV */
+        {
+            .caps   =3D CAP_PV | CAP_DOMU,
+            .min    =3D 0,
+            .opt    =3D 0,
+        },
+
+        /* PV dom0 */
+        {
+            .caps   =3D CAP_PV | CAP_HWDOM,
+            .min    =3D X86_EMU_PIT,
+            .opt    =3D 0,
+        },
+#endif /* #ifdef CONFIG_PV */
+
+#ifdef CONFIG_HVM
+        /* PVH dom0 */
+        {
+            .caps   =3D CAP_HVM | CAP_HWDOM,
+            .min    =3D X86_EMU_LAPIC | X86_EMU_IOAPIC | X86_EMU_VPCI,
+            .opt    =3D 0,
+        },
+
+        /* HVM domU */
+        {
+            .caps   =3D CAP_HVM | CAP_DOMU,
+            .min    =3D X86_EMU_ALL & ~(X86_EMU_VPCI | X86_EMU_USE_PIRQ),
+            /* HVM PIRQ feature is user-selectable. */
+            .opt    =3D X86_EMU_USE_PIRQ,
+        },
+
+        /* PVH domU */
+        {
+            .caps   =3D CAP_HVM | CAP_DOMU,
+            .min    =3D X86_EMU_LAPIC,
+            .opt    =3D 0,
+        },
+#endif /* #ifdef CONFIG_HVM */
+    };
+    unsigned int i, caps =3D is_hardware_domain(d) ? CAP_HWDOM : CAP_DOMU;
+
+    if ( is_pv_domain(d) )
+        caps |=3D CAP_PV;
+    else if ( is_hvm_domain(d) )
+        caps |=3D CAP_HVM;
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
+        if ( caps =3D=3D configs[i].caps &&
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



