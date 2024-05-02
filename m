Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3E68B977F
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 11:21:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715708.1117541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Scm-0004HS-MG; Thu, 02 May 2024 09:21:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715708.1117541; Thu, 02 May 2024 09:21:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Scm-0004Fd-JY; Thu, 02 May 2024 09:21:08 +0000
Received: by outflank-mailman (input) for mailman id 715708;
 Thu, 02 May 2024 09:21:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jUhA=MF=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1s2Scl-00043A-6p
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 09:21:07 +0000
Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4cc15598-0865-11ef-909b-e314d9c70b13;
 Thu, 02 May 2024 11:21:06 +0200 (CEST)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id D9BDB1EF76;
 Thu,  2 May 2024 05:21:03 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id BA55A1EF74;
 Thu,  2 May 2024 05:21:03 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id CEBDA1EF73;
 Thu,  2 May 2024 05:21:02 -0400 (EDT)
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
X-Inumbo-ID: 4cc15598-0865-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=qhW4J/cTFeEpCYrlIcXjhJRer
	OeqjMFOR0GWdMpf6D0=; b=WSRxL6Ii5P734QIsNDFDUTACl7oppmt6R0wKYAJXf
	guqIFaD7Gc5rTIBoqWsfHT69cwkwk5zH+L09BcErNVfFDaxd623nrY5oWfaqIHWP
	Nh2mN+MFqeEkNTRgsj/P4RoWUbgJEieU12TdcNlnaTB7mDecEaxhLgUfVhUPNI++
	LI=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v2 5/5] x86/MCE: optional build of AMD/Intel MCE code
Date: Thu,  2 May 2024 12:21:00 +0300
Message-Id: <47d32ecff7b915bd23b6d13b76cedf4b39db71a2.1714640459.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1714640459.git.Sergiy_Kibrik@epam.com>
References: <cover.1714640459.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 4BD369E6-0865-11EF-B450-78DCEB2EC81B-90055647!pb-smtp1.pobox.com
Content-Transfer-Encoding: quoted-printable

Separate Intel/AMD-specific MCE code using CONFIG_{INTEL,AMD} config opti=
ons.
Now we can avoid build of mcheck code if support for specific platform is
intentionally disabled by configuration.

Add default return value to init_nonfatal_mce_checker() routine -- in cas=
e
of a build with both AMD and INTEL options are off (e.g. randconfig).

Also global Intel-specific variables lmce_support & cmci_support have to =
be
redefined if !INTEL, as they get checked in common code.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
CC: Jan Beulich <jbeulich@suse.com>
---
changes in v2:
 - fallback to original ordering in Makefile
 - redefine lmce_support & cmci_support global vars to false when !INTEL
 - changed patch description
---
 xen/arch/x86/cpu/mcheck/Makefile    | 8 ++++----
 xen/arch/x86/cpu/mcheck/mce.h       | 8 ++++++++
 xen/arch/x86/cpu/mcheck/non-fatal.c | 6 ++++++
 3 files changed, 18 insertions(+), 4 deletions(-)

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
diff --git a/xen/arch/x86/cpu/mcheck/mce.h b/xen/arch/x86/cpu/mcheck/mce.=
h
index d6d56aa232..7fbf1fa2ae 100644
--- a/xen/arch/x86/cpu/mcheck/mce.h
+++ b/xen/arch/x86/cpu/mcheck/mce.h
@@ -40,7 +40,11 @@ enum mcheck_type {
 };
=20
 extern uint8_t cmci_apic_vector;
+#ifdef CONFIG_INTEL
 extern bool lmce_support;
+#else
+#define lmce_support (false)
+#endif
=20
 /* Init functions */
 enum mcheck_type amd_mcheck_init(const struct cpuinfo_x86 *c, bool bsp);
@@ -120,7 +124,11 @@ DECLARE_PER_CPU(struct mca_banks *, poll_bankmask);
 DECLARE_PER_CPU(struct mca_banks *, no_cmci_banks);
 DECLARE_PER_CPU(struct mca_banks *, mce_clear_banks);
=20
+#ifdef CONFIG_INTEL
 extern bool cmci_support;
+#else
+#define cmci_support (false)
+#endif
 extern bool is_mc_panic;
 extern bool mce_broadcast;
 extern void mcheck_mca_clearbanks(struct mca_banks *bankmask);
diff --git a/xen/arch/x86/cpu/mcheck/non-fatal.c b/xen/arch/x86/cpu/mchec=
k/non-fatal.c
index 33cacd15c2..2d91a3b1e0 100644
--- a/xen/arch/x86/cpu/mcheck/non-fatal.c
+++ b/xen/arch/x86/cpu/mcheck/non-fatal.c
@@ -24,14 +24,20 @@ static int __init cf_check init_nonfatal_mce_checker(=
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
+#ifdef CONFIG_INTEL
 	case X86_VENDOR_INTEL:
 		intel_nonfatal_mcheck_init(c);
 		break;
+#endif
+	default:
+		return -ENODEV;
 	}
 	printk(KERN_INFO "mcheck_poll: Machine check polling timer started.\n")=
;
 	return 0;
--=20
2.25.1


