Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C92394CE5B
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2024 12:11:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774625.1185081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scMak-0002rZ-V5; Fri, 09 Aug 2024 10:11:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774625.1185081; Fri, 09 Aug 2024 10:11:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scMak-0002pY-SS; Fri, 09 Aug 2024 10:11:26 +0000
Received: by outflank-mailman (input) for mailman id 774625;
 Fri, 09 Aug 2024 10:11:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7QEF=PI=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1scMaj-0002pI-7t
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2024 10:11:25 +0000
Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb57f72e-5637-11ef-bc04-fd08da9f4363;
 Fri, 09 Aug 2024 12:11:24 +0200 (CEST)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 72A6C186EA;
 Fri,  9 Aug 2024 06:11:23 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 69B9A186E9;
 Fri,  9 Aug 2024 06:11:23 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 85467186E8;
 Fri,  9 Aug 2024 06:11:22 -0400 (EDT)
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
X-Inumbo-ID: bb57f72e-5637-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=ojiKxXFKhugIX7qMuxIF0x+el
	EBDUt8AoK9fdheBKz0=; b=N6Xf0d6ExwA7PjY/19wATQGl6mBbbrks7ML9o9RLI
	4DizJKTCh57db7gJ5TQOBHqAjhjUU+iEcoY9baKFzqOQnpt8tgibhGa3xbzK5O+9
	Np/cgmV1FEZgORxiNvaqVn3EyzBBXeRKkd+Lh+HIyxmtRDC8Qq4sqMNv+g/SRbYF
	zI=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v1 2/2] x86/amd: optional build of amd.c
Date: Fri,  9 Aug 2024 13:11:20 +0300
Message-Id: <5632b05e993cca78a58b800dd37165ccd80b944f.1723196909.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1723196909.git.Sergiy_Kibrik@epam.com>
References: <cover.1723196909.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 BA99E13C-5637-11EF-970D-2BAEEB2EC81B-90055647!pb-smtp1.pobox.com
Content-Transfer-Encoding: quoted-printable

Similar to making Intel CPU support optional -- as we've got CONFIG_AMD o=
ption
now, we can put arch/x86/cpu/amd.c under it and make it possible to build
Xen without AMD CPU support. One possible use case is to dispose of dead =
code
in Intel-only systems.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 xen/arch/x86/cpu/Makefile      |  4 ++--
 xen/arch/x86/cpu/common.c      |  4 +++-
 xen/arch/x86/include/asm/amd.h | 22 ++++++++++++++++++++++
 xen/arch/x86/spec_ctrl.c       |  2 ++
 4 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/cpu/Makefile b/xen/arch/x86/cpu/Makefile
index 020c86bda3..5efd87be38 100644
--- a/xen/arch/x86/cpu/Makefile
+++ b/xen/arch/x86/cpu/Makefile
@@ -2,10 +2,10 @@ obj-y +=3D mcheck/
 obj-y +=3D microcode/
 obj-y +=3D mtrr/
=20
-obj-y +=3D amd.o
+obj-$(CONFIG_AMD) +=3D amd.o
 obj-y +=3D centaur.o
 obj-y +=3D common.o
-obj-y +=3D hygon.o
+obj-$(CONFIG_AMD) +=3D hygon.o
 obj-$(CONFIG_INTEL) +=3D intel.o
 obj-$(CONFIG_INTEL) +=3D intel_cacheinfo.o
 obj-y +=3D mwait-idle.o
diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 50ce13f81c..7be689c2e3 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -341,9 +341,11 @@ void __init early_cpu_init(bool verbose)
 				  actual_cpu =3D intel_cpu_dev;    break;
 	case X86_VENDOR_SHANGHAI: actual_cpu =3D shanghai_cpu_dev; break;
 #endif
+#ifdef CONFIG_AMD
 	case X86_VENDOR_AMD:      actual_cpu =3D amd_cpu_dev;      break;
-	case X86_VENDOR_CENTAUR:  actual_cpu =3D centaur_cpu_dev;  break;
 	case X86_VENDOR_HYGON:    actual_cpu =3D hygon_cpu_dev;    break;
+#endif
+	case X86_VENDOR_CENTAUR:  actual_cpu =3D centaur_cpu_dev;  break;
 	default:
 		actual_cpu =3D default_cpu;
 		if (!verbose)
diff --git a/xen/arch/x86/include/asm/amd.h b/xen/arch/x86/include/asm/am=
d.h
index fa4e0fc766..a2481eddc7 100644
--- a/xen/arch/x86/include/asm/amd.h
+++ b/xen/arch/x86/include/asm/amd.h
@@ -158,13 +158,21 @@
 #define is_zen4_uarch()   boot_cpu_has(X86_FEATURE_AUTO_IBRS)
=20
 struct cpuinfo_x86;
+#ifdef CONFIG_AMD
 int cpu_has_amd_erratum(const struct cpuinfo_x86 *cpu, int osvw_id, ...)=
;
+#else
+static inline int cpu_has_amd_erratum(const struct cpuinfo_x86 *cpu, int=
 osvw_id, ...)
+{
+    return false;
+}
+#endif
=20
 extern s8 opt_allow_unsafe;
=20
 void fam10h_check_enable_mmcfg(void);
 void check_enable_amd_mmconf_dmi(void);
=20
+#ifdef CONFIG_AMD
 extern bool amd_acpi_c1e_quirk;
 void amd_check_disable_c1e(unsigned int port, u8 value);
=20
@@ -173,5 +181,19 @@ extern bool amd_virt_spec_ctrl;
 bool amd_setup_legacy_ssbd(void);
 void amd_set_legacy_ssbd(bool enable);
 void amd_set_cpuid_user_dis(bool enable);
+#else
+static inline void amd_set_cpuid_user_dis(bool enable) {}
+static inline void amd_set_legacy_ssbd(bool enable) {}
+static inline bool amd_setup_legacy_ssbd(void)
+{
+    return false;
+}
+
+#define amd_acpi_c1e_quirk (false)
+#define amd_virt_spec_ctrl (false)
+#define amd_legacy_ssbd (false)
+
+static inline void amd_check_disable_c1e(unsigned int port, u8 value) {}
+#endif
=20
 #endif /* __AMD_H__ */
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 92405b8be7..8231515c80 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -1884,10 +1884,12 @@ void __init init_speculation_mitigations(void)
             setup_force_cpu_cap(X86_FEATURE_SC_MSR_HVM);
     }
=20
+#ifdef CONFIG_AMD
     /* Support VIRT_SPEC_CTRL.SSBD if AMD_SSBD is not available. */
     if ( opt_msr_sc_hvm && !cpu_has_amd_ssbd &&
          (cpu_has_virt_ssbd || (amd_legacy_ssbd && amd_setup_legacy_ssbd=
())) )
         amd_virt_spec_ctrl =3D true;
+#endif
=20
     /* Figure out default_xen_spec_ctrl. */
     if ( has_spec_ctrl && ibrs )
--=20
2.25.1


