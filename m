Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBE89547C7
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2024 13:15:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.778555.1188614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seuvF-0007uD-Uc; Fri, 16 Aug 2024 11:15:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 778555.1188614; Fri, 16 Aug 2024 11:15:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seuvF-0007rv-S2; Fri, 16 Aug 2024 11:15:09 +0000
Received: by outflank-mailman (input) for mailman id 778555;
 Fri, 16 Aug 2024 11:15:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0eKx=PP=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1seuvE-0007rp-Bj
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2024 11:15:08 +0000
Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca007d53-5bc0-11ef-8776-851b0ebba9a2;
 Fri, 16 Aug 2024 13:15:06 +0200 (CEST)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 4A9DA1AE93;
 Fri, 16 Aug 2024 07:15:04 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 320161AE92;
 Fri, 16 Aug 2024 07:15:04 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 85F981AE8E;
 Fri, 16 Aug 2024 07:15:00 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
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
X-Inumbo-ID: ca007d53-5bc0-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=SImZJDa/oxwFzFRYOBx72eonr
	TZPtSmDNOl28smcrN4=; b=W5GAoZqVvANw8VMDmkR8LKn9oLIJKvQ04wCU9ocs6
	aP3eA5UnByYIn0h5IeATBNHlr510pSfxazBe/tnaFYbyXwWhwNvp7pVOnhqvxcaR
	ZlIve0cLYYu1UzZVofENQElpHkSXjnk58nDtshhERb/lsK9STNb4P1W8jS4u0FHv
	5c=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: [XEN PATCH v2 3/5] x86/spec-ctrl: configurable Intlel/AMD-specific calculations
Date: Fri, 16 Aug 2024 14:14:52 +0300
Message-Id: <b789679a7edd41c88eca41d3c703d2292cfcce0e.1723806405.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1723806405.git.Sergiy_Kibrik@epam.com>
References: <cover.1723806405.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 C7331240-5BC0-11EF-94DE-E92ED1CD468F-90055647!pb-smtp21.pobox.com
Content-Transfer-Encoding: quoted-printable

Put platforms-specific code under #ifdef CONFIG_{AMD,INTEL} so that when
corresponding CPU support is disabled by configuration less dead code wil=
l end
up in the build.

This includes re-ordering of calls to ibpb_calculations() & div_calculati=
ons(),
but since they don't access common variables or feature bits it should be
safe to do.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
CC: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/spec_ctrl.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 75a4177a75..ba6c3e80d2 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -1012,6 +1012,7 @@ static bool __init should_use_eager_fpu(void)
     }
 }
=20
+#ifdef CONFIG_AMD
 /*
  * https://www.amd.com/content/dam/amd/en/documents/corporate/cr/specula=
tive-return-stack-overflow-whitepaper.pdf
  */
@@ -1110,6 +1111,7 @@ static void __init div_calculations(bool hw_smt_ena=
bled)
             "enabled.  Please assess your configuration and choose an\n"
             "explicit 'smt=3D<bool>' setting.  See XSA-439.\n");
 }
+#endif /* CONFIG_AMD */
=20
 static void __init ibpb_calculations(void)
 {
@@ -1319,6 +1321,7 @@ static __init void l1tf_calculations(void)
                                             : (3UL << (paddr_bits - 2)))=
);
 }
=20
+#ifdef CONFIG_INTEL
 /* Calculate whether this CPU is vulnerable to MDS. */
 static __init void mds_calculations(void)
 {
@@ -1730,6 +1733,8 @@ static void __init bhi_calculations(void)
     }
 }
=20
+#endif /* CONFIG_INTEL */
+
 void spec_ctrl_init_domain(struct domain *d)
 {
     bool pv =3D is_pv_domain(d);
@@ -2025,11 +2030,13 @@ void __init init_speculation_mitigations(void)
             default_scf |=3D SCF_ist_rsb;
     }
=20
+#ifdef CONFIG_AMD
     srso_calculations(hw_smt_enabled);
=20
-    ibpb_calculations();
-
     div_calculations(hw_smt_enabled);
+#endif
+
+    ibpb_calculations();
=20
     /* Check whether Eager FPU should be enabled by default. */
     if ( opt_eager_fpu =3D=3D -1 )
@@ -2136,9 +2143,10 @@ void __init init_speculation_mitigations(void)
      * - March 2023, for RFDS.  Enumerate RFDS_CLEAR to mean that VERW n=
ow
      *   scrubs non-architectural entries from certain register files.
      */
+#ifdef CONFIG_INTEL
     mds_calculations();
     rfds_calculations();
-
+#endif
     /*
      * Parts which enumerate FB_CLEAR are those with now-updated microco=
de
      * which weren't susceptible to the original MFBDS (and therefore di=
dn't
@@ -2255,7 +2263,6 @@ void __init init_speculation_mitigations(void)
         opt_tsx =3D 0;
         tsx_init();
     }
-#endif
=20
     /*
      * On some SRBDS-affected hardware, it may be safe to relax srb-lock=
 by
@@ -2286,6 +2293,8 @@ void __init init_speculation_mitigations(void)
=20
     bhi_calculations();
=20
+#endif /* CONFIG_INTEL */
+
     print_details(thunk);
=20
     /*
--=20
2.25.1


