Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCC498717C
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 12:26:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805260.1216325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stlhP-0005vT-AP; Thu, 26 Sep 2024 10:26:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805260.1216325; Thu, 26 Sep 2024 10:26:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stlhP-0005tA-7p; Thu, 26 Sep 2024 10:26:15 +0000
Received: by outflank-mailman (input) for mailman id 805260;
 Thu, 26 Sep 2024 10:26:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SK2l=QY=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1stlhO-0005sp-6Q
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 10:26:14 +0000
Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c03b7fd1-7bf1-11ef-99a2-01e77a169b0f;
 Thu, 26 Sep 2024 12:26:11 +0200 (CEST)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 1FBEA187C3;
 Thu, 26 Sep 2024 06:26:11 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 18690187C2;
 Thu, 26 Sep 2024 06:26:11 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 6D2E2187C1;
 Thu, 26 Sep 2024 06:26:10 -0400 (EDT)
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
X-Inumbo-ID: c03b7fd1-7bf1-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=20ETVpIheobn7vEm20ssPBBVK1jiYJcRhNy3IbxSAbg=; b=RtGH
	E6GvGQ6GwsrMLVlpe7B7n/Jet/nkViw+BMk0tWog6DROAI2iG9zhHZVMdJoI8CZp
	EnuJeF+tsCXuUOB2AilNLhi4bl/j//CkWMCSeOeO20AWsb0NVbxLL8/6BRdazuiq
	z17L1VE/9LTgCHJqFAFpgGDPO2xV8AnVKYo8uL8=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [XEN PATCH v6] x86/intel: optional build of PSR support
Date: Thu, 26 Sep 2024 13:26:07 +0300
Message-Id: <20240926102607.95896-1-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Pobox-Relay-ID:
 BFA8DEF0-7BF1-11EF-BD2C-2BAEEB2EC81B-90055647!pb-smtp1.pobox.com
Content-Transfer-Encoding: quoted-printable

Xen's implementation of PSR only supports Intel CPUs right now, hence it =
can be
made dependant on CONFIG_INTEL build option.
Since platform implementation is not limited to single vendor, intermedia=
te
option CONFIG_X86_PSR introduced, which selected by CONFIG_INTEL.

When !X86_PSR then PSR-related sysctls XEN_SYSCTL_psr_cmt_op &
XEN_SYSCTL_psr_alloc are off as well.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
---
v5 patch here:
https://lore.kernel.org/xen-devel/20240918091517.1200080-1-Sergiy_Kibrik@=
epam.com/

changes in v6:
 - rename option PSR -> X86_PSR
 - add help text for X86_PSR option and default value
 - do not force X86_PSR option by 'select'
changes in v5:
 - simplify psr_cmt_enabled()
 - move PSR config option and add description
changes in v4:
 - introduced CONFIG_PSR
 - changed description
 - changes to psr stubs
---
 xen/arch/x86/Kconfig           | 10 ++++++++++
 xen/arch/x86/Makefile          |  2 +-
 xen/arch/x86/domctl.c          |  3 +++
 xen/arch/x86/include/asm/psr.h | 10 ++++++++--
 xen/arch/x86/sysctl.c          |  4 +++-
 5 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 62f0b5e0f4..924b60cfcc 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -231,6 +231,16 @@ config TBOOT
=20
 	  If unsure, stay with the default.
=20
+config X86_PSR
+	bool "Platform Shared Resource support" if EXPERT
+	default INTEL
+	help
+	  Support of Platform Shared Resource technology, which is basis for
+	  monitoring and control of resources like cache and memory bandwidth.
+	  See xl-psr documentation for details.
+
+	  If unsure, stay with the default.
+
 choice
 	prompt "Alignment of Xen image"
 	default XEN_ALIGN_2M if PV_SHIM_EXCLUSIVE
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 286c003ec3..76ffe5a561 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -57,7 +57,7 @@ obj-y +=3D pci.o
 obj-y +=3D percpu.o
 obj-y +=3D physdev.o
 obj-$(CONFIG_COMPAT) +=3D x86_64/physdev.o
-obj-y +=3D psr.o
+obj-$(CONFIG_X86_PSR) +=3D psr.o
 obj-y +=3D setup.o
 obj-y +=3D shutdown.o
 obj-y +=3D smp.o
diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 68b5b46d1a..6c1355e378 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -1195,6 +1195,7 @@ long arch_do_domctl(
     case XEN_DOMCTL_psr_alloc:
         switch ( domctl->u.psr_alloc.cmd )
         {
+#ifdef CONFIG_X86_PSR
         case XEN_DOMCTL_PSR_SET_L3_CBM:
             ret =3D psr_set_val(d, domctl->u.psr_alloc.target,
                               domctl->u.psr_alloc.data,
@@ -1257,6 +1258,8 @@ long arch_do_domctl(
=20
 #undef domctl_psr_get_val
=20
+#endif /* CONFIG_X86_PSR */
+
         default:
             ret =3D -EOPNOTSUPP;
             break;
diff --git a/xen/arch/x86/include/asm/psr.h b/xen/arch/x86/include/asm/ps=
r.h
index 51df78794c..d21a59d98f 100644
--- a/xen/arch/x86/include/asm/psr.h
+++ b/xen/arch/x86/include/asm/psr.h
@@ -69,12 +69,11 @@ extern struct psr_cmt *psr_cmt;
=20
 static inline bool psr_cmt_enabled(void)
 {
-    return !!psr_cmt;
+    return IS_ENABLED(CONFIG_X86_PSR) && psr_cmt;
 }
=20
 int psr_alloc_rmid(struct domain *d);
 void psr_free_rmid(struct domain *d);
-void psr_ctxt_switch_to(struct domain *d);
=20
 int psr_get_info(unsigned int socket, enum psr_type type,
                  uint32_t data[], unsigned int array_len);
@@ -83,8 +82,15 @@ int psr_get_val(struct domain *d, unsigned int socket,
 int psr_set_val(struct domain *d, unsigned int socket,
                 uint64_t new_val, enum psr_type type);
=20
+#ifdef CONFIG_X86_PSR
+void psr_ctxt_switch_to(struct domain *d);
 void psr_domain_init(struct domain *d);
 void psr_domain_free(struct domain *d);
+#else
+static inline void psr_ctxt_switch_to(struct domain *d) {}
+static inline void psr_domain_init(struct domain *d) {}
+static inline void psr_domain_free(struct domain *d) {}
+#endif
=20
 #endif /* __ASM_PSR_H__ */
=20
diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
index 1d40d82c5a..1b04947516 100644
--- a/xen/arch/x86/sysctl.c
+++ b/xen/arch/x86/sysctl.c
@@ -225,10 +225,11 @@ long arch_do_sysctl(
=20
     case XEN_SYSCTL_psr_alloc:
     {
-        uint32_t data[PSR_INFO_ARRAY_SIZE] =3D { };
+        uint32_t __maybe_unused data[PSR_INFO_ARRAY_SIZE] =3D { };
=20
         switch ( sysctl->u.psr_alloc.cmd )
         {
+#ifdef CONFIG_X86_PSR
         case XEN_SYSCTL_PSR_get_l3_info:
             ret =3D psr_get_info(sysctl->u.psr_alloc.target,
                                PSR_TYPE_L3_CBM, data, ARRAY_SIZE(data));
@@ -279,6 +280,7 @@ long arch_do_sysctl(
             if ( __copy_field_to_guest(u_sysctl, sysctl, u.psr_alloc) )
                 ret =3D -EFAULT;
             break;
+#endif /* CONFIG_X86_PSR */
=20
         default:
             ret =3D -EOPNOTSUPP;
--=20
2.25.1


