Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 959C36D5C85
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 11:59:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517752.803590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjdRZ-0003qt-Qo; Tue, 04 Apr 2023 09:59:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517752.803590; Tue, 04 Apr 2023 09:59:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjdRZ-0003mO-Jn; Tue, 04 Apr 2023 09:59:13 +0000
Received: by outflank-mailman (input) for mailman id 517752;
 Tue, 04 Apr 2023 09:59:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oy2y=73=citrix.com=prvs=4518c43dc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pjdMK-00056d-2X
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 09:53:48 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 962f50e3-d2ce-11ed-b464-930f4c7d94ae;
 Tue, 04 Apr 2023 11:53:45 +0200 (CEST)
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
X-Inumbo-ID: 962f50e3-d2ce-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680602025;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BD8/V6HTXPI8zjfRwIUp+LKbifOL/pPEYn5jnL6tGjU=;
  b=aEhT89AkO8KrOFxlJwGFdsHqSg/+e2oJSGcN+/+4ebY3pOECirJTasTI
   NJJW2kRRMv4SSesCIJgTczQdOJ1FVlZKpkVyg9387ZRhlEgNqiFgc7JS7
   UNO4QXgeunyYt0obMr3+kHTO9kb+XUujwqDpGY3MDaNprTswMPVREsXIh
   E=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 103612437
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:KGRsUKqQKYmTq8pX0IbW2gF8deReBmJnZRIvgKrLsJaIsI4StFCzt
 garIBmFPPyKZGb0KY0iOd61oRsDvpDXm4VhSwo5pSgxHy4ao5uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WNwUmAWP6gR5weCzyVNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAGxUbhuAm6WU+7m2d8Q9tu4mEMX6A6pK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVxrl6PqLVxyG/U1AFri5DmMcbPe8zMTsJQ9qqdj
 juepDqgWE1Ba7RzzxKD/lb0q+qSkBj6G4YOO5eU8cN2sgeMkzl75Bo+CgLg/KjRZlSFc8JSL
 QkY9zQjqYA29Ve3VZ/tUhugunmGsxUAHd1KHIUSyiuA167V6AaxHXUfQ3hKb9lOnNAybSwn0
 BmOhdyBONB0mOTLEzTHrO7S9G7sf3FPdgfueBPoUyNZutnoo510rCnEQ+tOQZ6fi+H5CA7Zl
 mXiQDcFu1kDsSIa//zlrQia3Gz2+cGhoh0dvVuOAD/8hu9tTMv8PtHztwCGhRpVBNzBJmRtq
 kTojCR3AAomKZiW3BKAT+wWdF1Cz6bUaWaM6bKD8nRIythMx5JAVdoKiN2GDB01WvvogBewC
 KMphStf5YVIIFyhZrJtboS6BqwClPawTYm5CKGONYAQMvCdkTNrGwk3PSatM53FyhBwwcnTx
 7/AGSpTMZrqIfs+l2fnLwvs+bQq2jo/1QvueHwP9Dz+ieD2TCfMGd843K6mMrhRAFWs/F+Er
 L6y9qKil31ibQEJSnKIrtJJdAxVdChT6FKfg5U/S9Nv6zFOQAkJY8I9C5t4E2C5t8y5Ttv1w
 0w=
IronPort-HdrOrdr: A9a23:XbA7vaCUYNajGozlHelo55DYdb4zR+YMi2TDt3oddfU1SL38qy
 nKpp4mPHDP5wr5NEtPpTniAtjjfZq/z/5ICOAqVN/PYOCPggCVxepZnOjfKlPbehEX9oRmpN
 1dm6oVMqyMMbCt5/yKnDVRELwbsaa6GLjDv5a785/0JzsaE52J6W1Ce2GmO3wzfiZqL7wjGq
 GR48JWzgDQAkj+PqyAdx84t/GonayzqK7b
X-IronPort-AV: E=Sophos;i="5.98,317,1673931600"; 
   d="scan'208";a="103612437"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 15/15] x86: Remove temporary {cpuid,msr}_policy defines
Date: Tue, 4 Apr 2023 10:52:22 +0100
Message-ID: <20230404095222.1373721-16-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230404095222.1373721-1-andrew.cooper3@citrix.com>
References: <20230404095222.1373721-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

With all code areas updated, drop the temporary defines and adjust all
remaining users.

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * Split out of RFC patch
---
 xen/arch/x86/cpu/mcheck/mce_intel.c    |  2 +-
 xen/arch/x86/cpuid.c                   |  2 +-
 xen/arch/x86/domain.c                  |  2 +-
 xen/arch/x86/hvm/hvm.c                 |  4 ++--
 xen/arch/x86/hvm/svm/svm.c             |  2 +-
 xen/arch/x86/hvm/vlapic.c              |  2 +-
 xen/arch/x86/hvm/vmx/vmx.c             |  8 ++++----
 xen/arch/x86/include/asm/msr.h         |  2 +-
 xen/arch/x86/msr.c                     | 20 +++++++++-----------
 xen/arch/x86/pv/domain.c               |  2 +-
 xen/arch/x86/pv/emul-priv-op.c         |  4 ++--
 xen/arch/x86/traps.c                   |  2 +-
 xen/arch/x86/x86_emulate/x86_emulate.c |  2 +-
 xen/include/xen/lib/x86/cpu-policy.h   |  4 ----
 14 files changed, 26 insertions(+), 32 deletions(-)

diff --git a/xen/arch/x86/cpu/mcheck/mce_intel.c b/xen/arch/x86/cpu/mcheck/mce_intel.c
index 301533722d1a..2f23f02923d2 100644
--- a/xen/arch/x86/cpu/mcheck/mce_intel.c
+++ b/xen/arch/x86/cpu/mcheck/mce_intel.c
@@ -1008,7 +1008,7 @@ int vmce_intel_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
 
 int vmce_intel_rdmsr(const struct vcpu *v, uint32_t msr, uint64_t *val)
 {
-    const struct cpuid_policy *cp = v->domain->arch.cpuid;
+    const struct cpu_policy *cp = v->domain->arch.cpu_policy;
     unsigned int bank = msr - MSR_IA32_MC0_CTL2;
 
     switch ( msr )
diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 3f20c342fde8..f311372cdf1f 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -36,7 +36,7 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
                  uint32_t subleaf, struct cpuid_leaf *res)
 {
     const struct domain *d = v->domain;
-    const struct cpuid_policy *p = d->arch.cpuid;
+    const struct cpu_policy *p = d->arch.cpu_policy;
 
     *res = EMPTY_LEAF;
 
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index b23e5014d1d3..91f57e3a3b17 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -283,7 +283,7 @@ void update_guest_memory_policy(struct vcpu *v,
 
 void domain_cpu_policy_changed(struct domain *d)
 {
-    const struct cpuid_policy *p = d->arch.cpuid;
+    const struct cpu_policy *p = d->arch.cpu_policy;
     struct vcpu *v;
 
     if ( is_pv_domain(d) )
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 675c523d9909..7020fdce995c 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -924,7 +924,7 @@ const char *hvm_efer_valid(const struct vcpu *v, uint64_t value,
                            signed int cr0_pg)
 {
     const struct domain *d = v->domain;
-    const struct cpuid_policy *p = d->arch.cpuid;
+    const struct cpu_policy *p = d->arch.cpu_policy;
 
     if ( value & ~EFER_KNOWN_MASK )
         return "Unknown bits set";
@@ -961,7 +961,7 @@ const char *hvm_efer_valid(const struct vcpu *v, uint64_t value,
 /* These bits in CR4 can be set by the guest. */
 unsigned long hvm_cr4_guest_valid_bits(const struct domain *d)
 {
-    const struct cpuid_policy *p = d->arch.cpuid;
+    const struct cpu_policy *p = d->arch.cpu_policy;
     bool mce, vmxe, cet;
 
     /* Logic broken out simply to aid readability below. */
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 02563e4b7027..b8fe759db456 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -583,7 +583,7 @@ static void cf_check svm_cpuid_policy_changed(struct vcpu *v)
 {
     struct svm_vcpu *svm = &v->arch.hvm.svm;
     struct vmcb_struct *vmcb = svm->vmcb;
-    const struct cpuid_policy *cp = v->domain->arch.cpuid;
+    const struct cpu_policy *cp = v->domain->arch.cpu_policy;
     u32 bitmap = vmcb_get_exception_intercepts(vmcb);
 
     if ( opt_hvm_fep ||
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index dc93b5e930b1..f4f5ffc673e5 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -1083,7 +1083,7 @@ static void set_x2apic_id(struct vlapic *vlapic)
 
 int guest_wrmsr_apic_base(struct vcpu *v, uint64_t value)
 {
-    const struct cpuid_policy *cp = v->domain->arch.cpuid;
+    const struct cpu_policy *cp = v->domain->arch.cpu_policy;
     struct vlapic *vlapic = vcpu_vlapic(v);
 
     if ( !has_vlapic(v->domain) )
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index e05588505871..ee4c41628cc3 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -710,7 +710,7 @@ static void vmx_restore_host_msrs(void)
 
 static void vmx_save_guest_msrs(struct vcpu *v)
 {
-    const struct cpuid_policy *cp = v->domain->arch.cpuid;
+    const struct cpu_policy *cp = v->domain->arch.cpu_policy;
     struct vcpu_msrs *msrs = v->arch.msrs;
 
     /*
@@ -731,7 +731,7 @@ static void vmx_save_guest_msrs(struct vcpu *v)
 
 static void vmx_restore_guest_msrs(struct vcpu *v)
 {
-    const struct cpuid_policy *cp = v->domain->arch.cpuid;
+    const struct cpu_policy *cp = v->domain->arch.cpu_policy;
     const struct vcpu_msrs *msrs = v->arch.msrs;
 
     write_gs_shadow(v->arch.hvm.vmx.shadow_gs);
@@ -784,7 +784,7 @@ void vmx_update_exception_bitmap(struct vcpu *v)
 
 static void cf_check vmx_cpuid_policy_changed(struct vcpu *v)
 {
-    const struct cpuid_policy *cp = v->domain->arch.cpuid;
+    const struct cpu_policy *cp = v->domain->arch.cpu_policy;
     int rc = 0;
 
     if ( opt_hvm_fep ||
@@ -3521,7 +3521,7 @@ static int cf_check vmx_msr_write_intercept(
     unsigned int msr, uint64_t msr_content)
 {
     struct vcpu *v = current;
-    const struct cpuid_policy *cp = v->domain->arch.cpuid;
+    const struct cpu_policy *cp = v->domain->arch.cpu_policy;
 
     HVM_DBG_LOG(DBG_LEVEL_MSR, "ecx=%#x, msr_value=%#"PRIx64, msr, msr_content);
 
diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
index 458841733e18..1d8ea9f26faa 100644
--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -290,7 +290,7 @@ static inline void wrmsr_tsc_aux(uint32_t val)
     }
 }
 
-uint64_t msr_spec_ctrl_valid_bits(const struct cpuid_policy *cp);
+uint64_t msr_spec_ctrl_valid_bits(const struct cpu_policy *cp);
 
 /* Container object for per-vCPU MSRs */
 struct vcpu_msrs
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 802fc60baf81..2e16818bf509 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -54,8 +54,7 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
 {
     const struct vcpu *curr = current;
     const struct domain *d = v->domain;
-    const struct cpuid_policy *cp = d->arch.cpuid;
-    const struct msr_policy *mp = d->arch.msr;
+    const struct cpu_policy *cp = d->arch.cpu_policy;
     const struct vcpu_msrs *msrs = v->arch.msrs;
     int ret = X86EMUL_OKAY;
 
@@ -139,13 +138,13 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
         goto get_reg;
 
     case MSR_INTEL_PLATFORM_INFO:
-        *val = mp->platform_info.raw;
+        *val = cp->platform_info.raw;
         break;
 
     case MSR_ARCH_CAPABILITIES:
         if ( !cp->feat.arch_caps )
             goto gp_fault;
-        *val = mp->arch_caps.raw;
+        *val = cp->arch_caps.raw;
         break;
 
     case MSR_INTEL_MISC_FEATURES_ENABLES:
@@ -326,7 +325,7 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
  * separate CPUID features for this functionality, but only set will be
  * active.
  */
-uint64_t msr_spec_ctrl_valid_bits(const struct cpuid_policy *cp)
+uint64_t msr_spec_ctrl_valid_bits(const struct cpu_policy *cp)
 {
     bool ssbd = cp->feat.ssbd || cp->extd.amd_ssbd;
     bool psfd = cp->feat.intel_psfd || cp->extd.psfd;
@@ -345,8 +344,7 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
 {
     const struct vcpu *curr = current;
     struct domain *d = v->domain;
-    const struct cpuid_policy *cp = d->arch.cpuid;
-    const struct msr_policy *mp = d->arch.msr;
+    const struct cpu_policy *cp = d->arch.cpu_policy;
     struct vcpu_msrs *msrs = v->arch.msrs;
     int ret = X86EMUL_OKAY;
 
@@ -387,7 +385,7 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
          * for backwards compatiblity, the OS should write 0 to it before
          * trying to access the current microcode version.
          */
-        if ( d->arch.cpuid->x86_vendor != X86_VENDOR_INTEL || val != 0 )
+        if ( cp->x86_vendor != X86_VENDOR_INTEL || val != 0 )
             goto gp_fault;
         break;
 
@@ -397,7 +395,7 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
          * to AMD CPUs as well (at least the architectural/CPUID part does).
          */
         if ( is_pv_domain(d) ||
-             d->arch.cpuid->x86_vendor != X86_VENDOR_AMD )
+             cp->x86_vendor != X86_VENDOR_AMD )
             goto gp_fault;
         break;
 
@@ -409,7 +407,7 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
          * by any CPUID bit.
          */
         if ( is_pv_domain(d) ||
-             d->arch.cpuid->x86_vendor != X86_VENDOR_INTEL )
+             cp->x86_vendor != X86_VENDOR_INTEL )
             goto gp_fault;
         break;
 
@@ -446,7 +444,7 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
         bool old_cpuid_faulting = msrs->misc_features_enables.cpuid_faulting;
 
         rsvd = ~0ull;
-        if ( mp->platform_info.cpuid_faulting )
+        if ( cp->platform_info.cpuid_faulting )
             rsvd &= ~MSR_MISC_FEATURES_CPUID_FAULTING;
 
         if ( val & rsvd )
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index 95492715d8ad..5c92812dc67a 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -146,7 +146,7 @@ static void release_compat_l4(struct vcpu *v)
 
 unsigned long pv_fixup_guest_cr4(const struct vcpu *v, unsigned long cr4)
 {
-    const struct cpuid_policy *p = v->domain->arch.cpuid;
+    const struct cpu_policy *p = v->domain->arch.cpu_policy;
 
     /* Discard attempts to set guest controllable bits outside of the policy. */
     cr4 &= ~((p->basic.tsc     ? 0 : X86_CR4_TSD)      |
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index ab52768271c5..04416f197951 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -885,7 +885,7 @@ static int cf_check read_msr(
 {
     struct vcpu *curr = current;
     const struct domain *currd = curr->domain;
-    const struct cpuid_policy *cp = currd->arch.cpuid;
+    const struct cpu_policy *cp = currd->arch.cpu_policy;
     bool vpmu_msr = false, warn = false;
     uint64_t tmp;
     int ret;
@@ -1034,7 +1034,7 @@ static int cf_check write_msr(
 {
     struct vcpu *curr = current;
     const struct domain *currd = curr->domain;
-    const struct cpuid_policy *cp = currd->arch.cpuid;
+    const struct cpu_policy *cp = currd->arch.cpu_policy;
     bool vpmu_msr = false;
     int ret;
 
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index c36e3f855bd9..e4f8b158e1ed 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1036,7 +1036,7 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
                              uint32_t subleaf, struct cpuid_leaf *res)
 {
     const struct domain *d = v->domain;
-    const struct cpuid_policy *p = d->arch.cpuid;
+    const struct cpu_policy *p = d->arch.cpu_policy;
     uint32_t base = is_viridian_domain(d) ? 0x40000100 : 0x40000000;
     uint32_t idx  = leaf - base;
     unsigned int limit = is_viridian_domain(d) ? p->hv2_limit : p->hv_limit;
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
index 5a0ec5900a93..c69f7c65f526 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -848,7 +848,7 @@ protmode_load_seg(
     struct x86_emulate_ctxt *ctxt,
     const struct x86_emulate_ops *ops)
 {
-    const struct cpuid_policy *cp = ctxt->cpuid;
+    const struct cpu_policy *cp = ctxt->cpu_policy;
     enum x86_segment sel_seg = (sel & 4) ? x86_seg_ldtr : x86_seg_gdtr;
     struct { uint32_t a, b; } desc, desc_hi = {};
     uint8_t dpl, rpl;
diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
index dee46adeff17..182cf77cffaf 100644
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -375,10 +375,6 @@ struct cpu_policy
     uint8_t x86_vendor;
 };
 
-/* Temporary */
-#define cpuid_policy cpu_policy
-#define msr_policy cpu_policy
-
 struct cpu_policy_errors
 {
     uint32_t leaf, subleaf;
-- 
2.30.2


