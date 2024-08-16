Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3CE9547E4
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2024 13:19:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.778584.1188635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seuzC-0001pQ-Ka; Fri, 16 Aug 2024 11:19:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 778584.1188635; Fri, 16 Aug 2024 11:19:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seuzC-0001no-Hd; Fri, 16 Aug 2024 11:19:14 +0000
Received: by outflank-mailman (input) for mailman id 778584;
 Fri, 16 Aug 2024 11:19:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0eKx=PP=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1seuzB-0001mN-3h
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2024 11:19:13 +0000
Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c64582a-5bc1-11ef-a505-bb4a2ccca743;
 Fri, 16 Aug 2024 13:19:11 +0200 (CEST)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 8C5B82B8AD;
 Fri, 16 Aug 2024 07:19:10 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 830592B8AC;
 Fri, 16 Aug 2024 07:19:10 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 912E72B8AB;
 Fri, 16 Aug 2024 07:19:09 -0400 (EDT)
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
X-Inumbo-ID: 5c64582a-5bc1-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=PjnMO2z53AIZ819k6PFRrFgWX
	6KC8ZTHVSlS1GFYRHg=; b=RJz3lELjHQkcdAJIiw2+DyP48jnGSsN1JYu3eQHWc
	jtU59lDyc4nd30jCzlyT8o6C/gaDivwYg3gGIPjKH7Jl4EXigYR9aB8MVrLNZeru
	9RC6cNsNRIRQWU38oFmQM09dQ9eyiLCF63HfhlnHNs0AfX+PRu+oOyt32eXLluIA
	aM=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: [XEN PATCH v2 5/5] x86/amd: optional build of amd.c
Date: Fri, 16 Aug 2024 14:19:07 +0300
Message-Id: <3c641433fa7cfe1f7fdc918ab32086835a2e13eb.1723806405.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1723806405.git.Sergiy_Kibrik@epam.com>
References: <cover.1723806405.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 5BA4DA1C-5BC1-11EF-AEDC-9B0F950A682E-90055647!pb-smtp2.pobox.com
Content-Transfer-Encoding: quoted-printable

Similar to making Intel CPU support optional -- as we've got CONFIG_AMD o=
ption
now, we can put arch/x86/cpu/amd.c under it and make it possible to build
Xen without AMD CPU support. One possible use case is to dispose of dead =
code
in Intel-only systems.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
CC: Jan Beulich <jbeulich@suse.com>
---
changes in v2:
 - drop routines-stubs in amd.h, handle call sites instead
 - cpu_has_amd_erratum() return int instead of bool
---
 xen/arch/x86/cpu/Makefile      |  2 +-
 xen/arch/x86/cpu/common.c      |  4 +++-
 xen/arch/x86/hvm/svm/svm.c     |  6 ++++--
 xen/arch/x86/include/asm/amd.h | 20 ++++++++++++++++++--
 xen/arch/x86/spec_ctrl.c       |  2 ++
 5 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/cpu/Makefile b/xen/arch/x86/cpu/Makefile
index eeb9ebe562..2c34597136 100644
--- a/xen/arch/x86/cpu/Makefile
+++ b/xen/arch/x86/cpu/Makefile
@@ -2,7 +2,7 @@ obj-y +=3D mcheck/
 obj-y +=3D microcode/
 obj-y +=3D mtrr/
=20
-obj-y +=3D amd.o
+obj-$(CONFIG_AMD) +=3D amd.o
 obj-$(CONFIG_CENTAUR) +=3D centaur.o
 obj-y +=3D common.o
 obj-$(CONFIG_HYGON) +=3D hygon.o
diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 580b01d6d5..5930b712bf 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -194,7 +194,7 @@ void ctxt_switch_levelling(const struct vcpu *next)
=20
 		if (cpu_has_cpuid_faulting)
 			set_cpuid_faulting(enable_cpuid_faulting);
-		else
+		else if ( IS_ENABLED(CONFIG_AMD) )
 			amd_set_cpuid_user_dis(enable_cpuid_faulting);
=20
 		return;
@@ -340,7 +340,9 @@ void __init early_cpu_init(bool verbose)
 	case X86_VENDOR_INTEL:    intel_unlock_cpuid_leaves(c);
 				  actual_cpu =3D intel_cpu_dev;    break;
 #endif
+#ifdef CONFIG_AMD
 	case X86_VENDOR_AMD:      actual_cpu =3D amd_cpu_dev;      break;
+#endif
 #ifdef CONFIG_CENTAUR
 	case X86_VENDOR_CENTAUR:  actual_cpu =3D centaur_cpu_dev;  break;
 #endif
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 92bb10c504..88902e2d3a 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -919,7 +919,8 @@ static void cf_check svm_ctxt_switch_from(struct vcpu=
 *v)
      * Possibly clear previous guest selection of SSBD if set.  Note tha=
t
      * SPEC_CTRL.SSBD is already handled by svm_vmexit_spec_ctrl.
      */
-    if ( v->arch.msrs->virt_spec_ctrl.raw & SPEC_CTRL_SSBD )
+    if ( IS_ENABLED(CONFIG_AMD) &&
+         v->arch.msrs->virt_spec_ctrl.raw & SPEC_CTRL_SSBD )
     {
         ASSERT(v->domain->arch.cpuid->extd.virt_ssbd);
         amd_set_legacy_ssbd(false);
@@ -953,7 +954,8 @@ static void cf_check svm_ctxt_switch_to(struct vcpu *=
v)
         wrmsr_tsc_aux(v->arch.msrs->tsc_aux);
=20
     /* Load SSBD if set by the guest. */
-    if ( v->arch.msrs->virt_spec_ctrl.raw & SPEC_CTRL_SSBD )
+    if ( IS_ENABLED(CONFIG_AMD) &&
+         v->arch.msrs->virt_spec_ctrl.raw & SPEC_CTRL_SSBD )
     {
         ASSERT(v->domain->arch.cpuid->extd.virt_ssbd);
         amd_set_legacy_ssbd(true);
diff --git a/xen/arch/x86/include/asm/amd.h b/xen/arch/x86/include/asm/am=
d.h
index fa4e0fc766..da35b82d5a 100644
--- a/xen/arch/x86/include/asm/amd.h
+++ b/xen/arch/x86/include/asm/amd.h
@@ -158,20 +158,36 @@
 #define is_zen4_uarch()   boot_cpu_has(X86_FEATURE_AUTO_IBRS)
=20
 struct cpuinfo_x86;
+#ifdef CONFIG_AMD
 int cpu_has_amd_erratum(const struct cpuinfo_x86 *cpu, int osvw_id, ...)=
;
+#else
+static inline int cpu_has_amd_erratum(const struct cpuinfo_x86 *cpu,
+                                      int osvw_id, ...)
+{
+    return 0;
+}
+#endif
=20
 extern s8 opt_allow_unsafe;
=20
 void fam10h_check_enable_mmcfg(void);
 void check_enable_amd_mmconf_dmi(void);
=20
-extern bool amd_acpi_c1e_quirk;
 void amd_check_disable_c1e(unsigned int port, u8 value);
=20
 extern bool amd_legacy_ssbd;
-extern bool amd_virt_spec_ctrl;
 bool amd_setup_legacy_ssbd(void);
 void amd_set_legacy_ssbd(bool enable);
 void amd_set_cpuid_user_dis(bool enable);
=20
+#ifdef CONFIG_AMD
+extern bool amd_acpi_c1e_quirk;
+extern bool amd_virt_spec_ctrl;
+#else
+
+#define amd_acpi_c1e_quirk (false)
+#define amd_virt_spec_ctrl (false)
+
+#endif
+
 #endif /* __AMD_H__ */
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index ba6c3e80d2..1964a417de 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -1893,10 +1893,12 @@ void __init init_speculation_mitigations(void)
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


