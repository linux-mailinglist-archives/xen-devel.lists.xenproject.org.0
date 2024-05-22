Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7168CBD2E
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 10:44:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727352.1131836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9ha7-0004Bt-UB; Wed, 22 May 2024 08:44:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727352.1131836; Wed, 22 May 2024 08:44:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9ha7-00049a-RZ; Wed, 22 May 2024 08:44:19 +0000
Received: by outflank-mailman (input) for mailman id 727352;
 Wed, 22 May 2024 08:44:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V5RZ=MZ=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1s9ha6-00049U-Cc
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 08:44:18 +0000
Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7926cbdf-1817-11ef-90a0-e314d9c70b13;
 Wed, 22 May 2024 10:44:17 +0200 (CEST)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 357263579F;
 Wed, 22 May 2024 04:44:16 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 1E8333579E;
 Wed, 22 May 2024 04:44:16 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.97])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 8621E3579D;
 Wed, 22 May 2024 04:44:14 -0400 (EDT)
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
X-Inumbo-ID: 7926cbdf-1817-11ef-90a0-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=7TGP+W8jkZr2yV0hnrertRwq7
	O7r+p4IX9AQgP14leA=; b=YPbKPtoPohuFUMfxlv3ra2i8mxjUzTgwmnmJC4pCp
	SvSHenornZ/YLsyNdaYv3/CEgmR8xPw2I+PkVyXTDA6zW5TPayzqllRnWIa1oPrr
	SsmpZfnH5BCEO1un5V2JaS92k+Nyao8ee+yU7/nBppi9513li9luorCB35UgJDN7
	JY=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v4 3/3] x86/MCE: optional build of AMD/Intel MCE code
Date: Wed, 22 May 2024 11:44:12 +0300
Message-Id: <ceed2e3492037f198c407b10e41e0e086f8b0e1c.1716366581.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1716366581.git.Sergiy_Kibrik@epam.com>
References: <cover.1716366581.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 77D6EBFA-1817-11EF-B26D-78DCEB2EC81B-90055647!pb-smtp1.pobox.com
Content-Transfer-Encoding: quoted-printable

Separate Intel/AMD-specific MCE code using CONFIG_{INTEL,AMD} config opti=
ons.
Now we can avoid build of mcheck code if support for specific platform is
intentionally disabled by configuration.

Also global variables lmce_support & cmci_support from Intel-specific
mce_intel.c have to moved to common mce.c, as they get checked in common =
code.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
changes in v4:
 - attribute {lmce_support,cmci_support} with __ro_after_init
changes in v3:
 - default return value of init_nonfatal_mce_checker() done in separate p=
atch
 - move lmce_support & cmci_support to common mce.c code
 - changed patch description
changes in v2:
 - fallback to original ordering in Makefile
 - redefine lmce_support & cmci_support global vars to false when !INTEL
 - changed patch description
---
 xen/arch/x86/cpu/mcheck/Makefile    | 8 ++++----
 xen/arch/x86/cpu/mcheck/mce.c       | 4 ++++
 xen/arch/x86/cpu/mcheck/mce_intel.c | 4 ----
 xen/arch/x86/cpu/mcheck/non-fatal.c | 4 ++++
 4 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/cpu/mcheck/Makefile b/xen/arch/x86/cpu/mcheck/M=
akefile
index f927f10b4d..e6cb4dd503 100644
--- a/xen/arch/x86/cpu/mcheck/Makefile
+++ b/xen/arch/x86/cpu/mcheck/Makefile
@@ -1,12 +1,12 @@
-obj-y +=3D amd_nonfatal.o
-obj-y +=3D mce_amd.o
+obj-$(CONFIG_AMD) +=3D amd_nonfatal.o
+obj-$(CONFIG_AMD) +=3D mce_amd.o
 obj-y +=3D mcaction.o
 obj-y +=3D barrier.o
-obj-y +=3D intel-nonfatal.o
+obj-$(CONFIG_INTEL) +=3D intel-nonfatal.o
 obj-y +=3D mctelem.o
 obj-y +=3D mce.o
 obj-y +=3D mce-apei.o
-obj-y +=3D mce_intel.o
+obj-$(CONFIG_INTEL) +=3D mce_intel.o
 obj-y +=3D non-fatal.o
 obj-y +=3D util.o
 obj-y +=3D vmce.o
diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.=
c
index fb9dec5b89..1664ca6412 100644
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -38,6 +38,10 @@ DEFINE_PER_CPU_READ_MOSTLY(unsigned int, nr_mce_banks)=
;
 unsigned int __read_mostly firstbank;
 unsigned int __read_mostly ppin_msr;
 uint8_t __read_mostly cmci_apic_vector;
+bool __ro_after_init cmci_support;
+
+/* If mce_force_broadcast =3D=3D 1, lmce_support will be disabled forcib=
ly. */
+bool __ro_after_init lmce_support;
=20
 DEFINE_PER_CPU_READ_MOSTLY(struct mca_banks *, poll_bankmask);
 DEFINE_PER_CPU_READ_MOSTLY(struct mca_banks *, no_cmci_banks);
diff --git a/xen/arch/x86/cpu/mcheck/mce_intel.c b/xen/arch/x86/cpu/mchec=
k/mce_intel.c
index af43281cc6..dd812f4b8a 100644
--- a/xen/arch/x86/cpu/mcheck/mce_intel.c
+++ b/xen/arch/x86/cpu/mcheck/mce_intel.c
@@ -26,16 +26,12 @@
 #include "mcaction.h"
=20
 static DEFINE_PER_CPU_READ_MOSTLY(struct mca_banks *, mce_banks_owned);
-bool __read_mostly cmci_support;
 static bool __read_mostly ser_support;
 static bool __read_mostly mce_force_broadcast;
 boolean_param("mce_fb", mce_force_broadcast);
=20
 static int __read_mostly nr_intel_ext_msrs;
=20
-/* If mce_force_broadcast =3D=3D 1, lmce_support will be disabled forcib=
ly. */
-bool __read_mostly lmce_support;
-
 /* Intel SDM define bit15~bit0 of IA32_MCi_STATUS as the MC error code *=
/
 #define INTEL_MCCOD_MASK 0xFFFF
=20
diff --git a/xen/arch/x86/cpu/mcheck/non-fatal.c b/xen/arch/x86/cpu/mchec=
k/non-fatal.c
index 5a53bcd0b7..a9ee9bb94f 100644
--- a/xen/arch/x86/cpu/mcheck/non-fatal.c
+++ b/xen/arch/x86/cpu/mcheck/non-fatal.c
@@ -24,15 +24,19 @@ static int __init cf_check init_nonfatal_mce_checker(=
void)
 	 * Check for non-fatal errors every MCE_RATE s
 	 */
 	switch (c->x86_vendor) {
+#ifdef CONFIG_AMD
 	case X86_VENDOR_AMD:
 	case X86_VENDOR_HYGON:
 		/* Assume we are on K8 or newer AMD or Hygon CPU here */
 		amd_nonfatal_mcheck_init(c);
 		break;
+#endif
=20
+#ifdef CONFIG_INTEL
 	case X86_VENDOR_INTEL:
 		intel_nonfatal_mcheck_init(c);
 		break;
+#endif
=20
 	default:
 		/* unhandled vendor isn't really an error */
--=20
2.25.1


