Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E108FE4DC
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2024 13:05:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736071.1142197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFAvR-0002yj-2s; Thu, 06 Jun 2024 11:04:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736071.1142197; Thu, 06 Jun 2024 11:04:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFAvR-0002xK-06; Thu, 06 Jun 2024 11:04:57 +0000
Received: by outflank-mailman (input) for mailman id 736071;
 Thu, 06 Jun 2024 11:04:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/dWw=NI=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sFAvP-0002xD-JN
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2024 11:04:55 +0000
Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9965dd70-23f4-11ef-90a2-e314d9c70b13;
 Thu, 06 Jun 2024 13:04:53 +0200 (CEST)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 15E1024BBC;
 Thu,  6 Jun 2024 07:04:52 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 0E34924BBB;
 Thu,  6 Jun 2024 07:04:52 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp2.pobox.com (Postfix) with ESMTPSA id D080D24BBA;
 Thu,  6 Jun 2024 07:04:50 -0400 (EDT)
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
X-Inumbo-ID: 9965dd70-23f4-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=j4XJ7kK9wSYGSQ2+xY8WxVZQ/YBI9b9Yv5L00MvO5ts=; b=jmem
	UtFC/hA1NXCzrtBAxnof7n+EhbwGUnfgM6bUkuVWhWQ45/r1aLi07D5NCKUN3n2d
	k2dHsuaPwbkzj43LgSZq2EicztgiUb5+WQgSvzER7RzJfB9grQ7Kl2phKHwmZgAN
	0/xDdAbTuPGnL/5plrdsH/CsxvOmBMG3Q2JGW5E=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v1] x86/intel: optional build of TSX support
Date: Thu,  6 Jun 2024 14:04:48 +0300
Message-Id: <20240606110448.2540261-1-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Pobox-Relay-ID:
 9876CF90-23F4-11EF-BAB5-6488940A682E-90055647!pb-smtp2.pobox.com
Content-Transfer-Encoding: quoted-printable

Transactional Synchronization Extensions are available for certain Intel'=
s
CPUs only, hence can be put under CONFIG_INTEL build option.

The whole TSX support, even if supported by CPU, may need to be disabled =
via
options, by microcode or through spec-ctrl, depending on a set of specifi=
c
conditions. To make sure nothing gets accidentally rutime-broken all
modifications of global TSX configuration variables is secured by #ifdef'=
s,
while variables themselves redefined to 0, so that ones can't mistakenly =
be
written to.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 xen/arch/x86/Makefile                | 2 +-
 xen/arch/x86/include/asm/processor.h | 8 ++++++++
 xen/arch/x86/spec_ctrl.c             | 4 ++++
 3 files changed, 13 insertions(+), 1 deletion(-)

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
index c26ef9090c..8b12627ab0 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -503,9 +503,17 @@ static inline uint8_t get_cpu_family(uint32_t raw, u=
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
+static inline void tsx_init(void)
+{
+}
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


