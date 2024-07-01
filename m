Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9DF91D9E5
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 10:25:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751339.1159258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOCLg-0006U7-40; Mon, 01 Jul 2024 08:25:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751339.1159258; Mon, 01 Jul 2024 08:25:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOCLg-0006RE-1E; Mon, 01 Jul 2024 08:25:20 +0000
Received: by outflank-mailman (input) for mailman id 751339;
 Mon, 01 Jul 2024 08:25:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1OIh=OB=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sOCLe-0006R3-Mx
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 08:25:18 +0000
Received: from pb-smtp20.pobox.com (pb-smtp20.pobox.com [173.228.157.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70e2b01a-3783-11ef-b4bb-af5377834399;
 Mon, 01 Jul 2024 10:25:16 +0200 (CEST)
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id E4BFD19E1B;
 Mon,  1 Jul 2024 04:25:13 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id DD30B19E1A;
 Mon,  1 Jul 2024 04:25:13 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [46.211.5.251])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp20.pobox.com (Postfix) with ESMTPSA id 7E52C19E19;
 Mon,  1 Jul 2024 04:25:10 -0400 (EDT)
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
X-Inumbo-ID: 70e2b01a-3783-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=zjWAT/kxmJqbEXZbahfspC9tyZt5NOyCrJQMNAB7xII=; b=QKhg
	b2EyWYiV6veseM4oqBBaR4p97pnzokLTOTvbidu8KkEjntBDqozb0TJVEX0x8uTk
	fOEheJWizca+89NkMVWzi7EWX4uNlMXrEMprYuMeXgnlVSM8Jwwuq4jurIo8bSU1
	lP+vbuhh7Sho9AoUIahIdU/F3mB3LHfbG4c7B5Q=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [XEN PATCH v2] x86/intel: optional build of TSX support
Date: Mon,  1 Jul 2024 11:25:06 +0300
Message-Id: <20240701082506.190941-1-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Pobox-Relay-ID:
 6E77753A-3783-11EF-BE1A-C38742FD603B-90055647!pb-smtp20.pobox.com
Content-Transfer-Encoding: quoted-printable

Transactional Synchronization Extensions are supported on certain Intel's
CPUs only, hence can be put under CONFIG_INTEL build option.

The whole TSX support, even if supported by CPU, may need to be disabled =
via
options, by microcode or through spec-ctrl, depending on a set of specifi=
c
conditions. To make sure nothing gets accidentally runtime-broken all
modifications of global TSX configuration variables is secured by #ifdef'=
s,
while variables themselves redefined to 0, so that ones can't mistakenly =
be
written to.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>
---
changes in v2:
 - updated command line doc
 - updated patch description
 - make tsx_init() stub one line
---
 docs/misc/xen-command-line.pandoc    | 2 +-
 xen/arch/x86/Makefile                | 2 +-
 xen/arch/x86/include/asm/processor.h | 6 ++++++
 xen/arch/x86/spec_ctrl.c             | 4 ++++
 4 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-li=
ne.pandoc
index 1dea7431fa..2dc946a35d 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2584,7 +2584,7 @@ pages) must also be specified via the tbuf_size par=
ameter.
 ### tsx
     =3D <bool>
=20
-    Applicability: x86
+    Applicability: x86 with CONFIG_INTEL active
     Default: false on parts vulnerable to TAA, true otherwise
=20
 Controls for the use of Transactional Synchronization eXtensions.
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index d902fb7acc..286c003ec3 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -67,7 +67,7 @@ obj-y +=3D srat.o
 obj-y +=3D string.o
 obj-y +=3D time.o
 obj-y +=3D traps.o
-obj-y +=3D tsx.o
+obj-$(CONFIG_INTEL) +=3D tsx.o
 obj-y +=3D usercopy.o
 obj-y +=3D x86_emulate.o
 obj-$(CONFIG_TBOOT) +=3D tboot.o
diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/=
asm/processor.h
index c26ef9090c..66463f6a6d 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -503,9 +503,15 @@ static inline uint8_t get_cpu_family(uint32_t raw, u=
int8_t *model,
     return fam;
 }
=20
+#ifdef CONFIG_INTEL
 extern int8_t opt_tsx;
 extern bool rtm_disabled;
 void tsx_init(void);
+#else
+#define opt_tsx      0     /* explicitly indicate TSX is off */
+#define rtm_disabled false /* RTM was not force-disabled */
+static inline void tsx_init(void) {}
+#endif
=20
 void update_mcu_opt_ctrl(void);
 void set_in_mcu_opt_ctrl(uint32_t mask, uint32_t val);
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 40f6ae0170..6b3631e375 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -116,8 +116,10 @@ static int __init cf_check parse_spec_ctrl(const cha=
r *s)
             if ( opt_pv_l1tf_domu < 0 )
                 opt_pv_l1tf_domu =3D 0;
=20
+#ifdef CONFIG_INTEL
             if ( opt_tsx =3D=3D -1 )
                 opt_tsx =3D -3;
+#endif
=20
         disable_common:
             opt_rsb_pv =3D false;
@@ -2264,6 +2266,7 @@ void __init init_speculation_mitigations(void)
      * plausibly value TSX higher than Hyperthreading...), disable TSX t=
o
      * mitigate TAA.
      */
+#ifdef CONFIG_INTEL
     if ( opt_tsx =3D=3D -1 && cpu_has_bug_taa && cpu_has_tsx_ctrl &&
          ((hw_smt_enabled && opt_smt) ||
           !boot_cpu_has(X86_FEATURE_SC_VERW_IDLE)) )
@@ -2271,6 +2274,7 @@ void __init init_speculation_mitigations(void)
         opt_tsx =3D 0;
         tsx_init();
     }
+#endif
=20
     /*
      * On some SRBDS-affected hardware, it may be safe to relax srb-lock=
 by
--=20
2.25.1


