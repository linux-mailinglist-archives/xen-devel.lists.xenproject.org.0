Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7947B28744
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 22:41:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083896.1443429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un1F2-00082e-K1; Fri, 15 Aug 2025 20:41:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083896.1443429; Fri, 15 Aug 2025 20:41:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un1F2-0007uC-3X; Fri, 15 Aug 2025 20:41:36 +0000
Received: by outflank-mailman (input) for mailman id 1083896;
 Fri, 15 Aug 2025 20:41:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oFbR=23=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1un1Ey-0005Rl-2D
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 20:41:32 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38d972ff-7a18-11f0-b898-0df219b8e170;
 Fri, 15 Aug 2025 22:41:30 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-45a1b0cbbbaso15530345e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Aug 2025 13:41:30 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3bb5d089e07sm3153924f8f.0.2025.08.15.13.41.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Aug 2025 13:41:28 -0700 (PDT)
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
X-Inumbo-ID: 38d972ff-7a18-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755290489; x=1755895289; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tsAW6YRQ7EL+rm+g8TqTA5BGiKOLvFJtiuYCMyK0eMA=;
        b=MtRdOHa1fV27dfLwkNwnfejdWy+wf5oQlMZiU0XRcVORaiNtiKjY6CcyhknIX1xA1K
         97+zkDbxq89vUiE4uokEQxwbG/GAFZymlGaE85x6vVpehSjr8eDmWhvZkKAsVepX/a0v
         kJ/aLm3lY8Ar1VV9q5J1u0gM0lDk170O6FoMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755290489; x=1755895289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tsAW6YRQ7EL+rm+g8TqTA5BGiKOLvFJtiuYCMyK0eMA=;
        b=fTL+7InH8/Ng4xtkTh2X4IQrQHyFYtFneiTModCuz8O//L2/KoLGSsV9zMtZ8zWBZq
         NVaZJBkbA1mISDM0sIxWTvhPqt8ELb116f5goBicVA3DbMWPxA7RsGAGWdxe9ggYuyQ1
         9saVU5eDoEqvDTyvSjP5k3Bb4qfYj8x2E9fYVaty6+o7ZOL8JbgrpmtBTsVXQ/o8L070
         0sBWsmRRKtX/xZQY82wR6vbtPfGCzbf4zGUCePWNg7FP4TeOfi3TJZEd5lurrVoYVGfZ
         Ch+x8uIKVKN3NItbYWfeeOuJMDxsiTYCeqjQSdNqm60flTi7ACTQU1x7bBRt12MDV8dc
         T6bw==
X-Gm-Message-State: AOJu0YzPG2oD4Uksj1O5BM+nm6INZQMNOnXNGUGEbdlbGtQWI2m9ggyN
	lmnulBvxMZfeVNG+Kwnsxi+2gBJDlEOq3U6fqv06t/djAE2iaZh4Dqf70jnpysMstGbUvmxXoR+
	/o2a9
X-Gm-Gg: ASbGnct/AM4kEIiWnZacorpQhrPRl8f88ya/xv/MvebhsxpjsBha2wgvva1PU6k+9W1
	mDzXX/Gx9K8+/+pNt1dnP6cjBJnleKFl5nI5lufpHuXmRWWt2apU4HAY/qfufrMqSn62YQN2x4h
	FqsMgJU519ZsDDqAU3ehjlY0w6DshYy/8hLHJ49NZLZWvZHF5+hgJi00J2l6V2MCWtwEhhpmPbx
	wIIx5e81pEV/P+RCP5l8pgl3elHBqZoYgi6A/8Nl1uHs4WZTRXT3GV12sDKguw+9xJQI/JgWytm
	9piJXTsH355oIGHcPMlF5kZW0VtsemVGcTZRebjipdNFD9u3twy3xuL+nO0OOy9VmrIorLThEd8
	mwxLj8n5rLisZd79PN2htab3yZkeYJL0pbYTN5uZfZ4lX/OhYJQRkxUFyqmGq1yHEFRxR9eYpz+
	Nslm9gApSDXqo=
X-Google-Smtp-Source: AGHT+IG4qV3LMsXZdcksnTtPUD53NbWs2YRqPMmUo3CKbagEy/65pcXsy5+FfvxgmjCk2FDjGtr+QA==
X-Received: by 2002:a05:600c:4ec6:b0:456:f1e:205c with SMTP id 5b1f17b1804b1-45a23deba7bmr25980285e9.4.1755290489144;
        Fri, 15 Aug 2025 13:41:29 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 11/16] x86/msr: Change rdmsr() to have normal API
Date: Fri, 15 Aug 2025 21:41:12 +0100
Message-Id: <20250815204117.3312742-12-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
References: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We want a consistent MSR API, and these want to be named rdmsr() and wrmsr(),
but not with their current APIs.  The current rdmsr() flavours writing to
their parameters by name makes code that reads like invalid C, and is
unergonomic to use in lots of cases.

Change the API, and update the callers all in one go.  Where appropriate,
update the write side to wrmsrns() as per the recommendation.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

I do have a more creative solution if this patch is considered to be too
large.  https://gitlab.com/xen-project/hardware/xen-staging/-/commit/e13cf25d06d08481e2c138daa1fd902cf36d757b
---
 xen/arch/x86/acpi/cpufreq/powernow.c | 12 ++++++-----
 xen/arch/x86/cpu/amd.c               |  6 +++---
 xen/arch/x86/cpu/common.c            | 20 +++++++++++--------
 xen/arch/x86/cpu/intel.c             | 30 ++++++++++++++--------------
 xen/arch/x86/genapic/x2apic.c        |  5 +----
 xen/arch/x86/hvm/vmx/vmcs.c          | 30 +++++++++++++++++++++-------
 xen/arch/x86/include/asm/msr.h       | 30 ++++++++++++++++++++++++----
 xen/arch/x86/include/asm/prot-key.h  |  6 +-----
 xen/arch/x86/tsx.c                   | 27 ++++++++++---------------
 9 files changed, 99 insertions(+), 67 deletions(-)

diff --git a/xen/arch/x86/acpi/cpufreq/powernow.c b/xen/arch/x86/acpi/cpufreq/powernow.c
index 12fca45b4551..71ac0b45261a 100644
--- a/xen/arch/x86/acpi/cpufreq/powernow.c
+++ b/xen/arch/x86/acpi/cpufreq/powernow.c
@@ -140,23 +140,25 @@ static int cf_check powernow_cpufreq_target(
 
 static void amd_fixup_frequency(struct xen_processor_px *px)
 {
-    u32 hi, lo, fid, did;
+    uint64_t val;
+    uint32_t fid, did;
     int index = px->control & 0x00000007;
     const struct cpuinfo_x86 *c = &current_cpu_data;
 
     if ((c->x86 != 0x10 || c->x86_model >= 10) && c->x86 != 0x11)
         return;
 
-    rdmsr(MSR_PSTATE_DEF_BASE + index, lo, hi);
+    val = rdmsr(MSR_PSTATE_DEF_BASE + index);
+
     /*
      * MSR C001_0064+:
      * Bit 63: PstateEn. Read-write. If set, the P-state is valid.
      */
-    if (!(hi & (1U << 31)))
+    if (!(val & (1UL << 63)))
         return;
 
-    fid = lo & 0x3f;
-    did = (lo >> 6) & 7;
+    fid = val & 0x3f;
+    did = (val >> 6) & 7;
     if (c->x86 == 0x10)
         px->core_frequency = (100 * (fid + 16)) >> did;
     else
diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 567b992a9fe2..769413e96a3f 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -1369,9 +1369,9 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
 	}
 
 	if (cpu_has(c, X86_FEATURE_EFRO)) {
-		rdmsr(MSR_K8_HWCR, l, h);
-		l |= (1 << 27); /* Enable read-only APERF/MPERF bit */
-		wrmsr(MSR_K8_HWCR, l, h);
+		/* Enable read-only APERF/MPERF bit */
+		wrmsrns(MSR_K8_HWCR,
+			rdmsr(MSR_K8_HWCR) | (1 << 27));
 	}
 
 	/* Prevent TSC drift in non single-processor, single-core platforms. */
diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 530b9eb39abc..9c6b8c291d6e 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -329,6 +329,7 @@ static inline u32 phys_pkg_id(u32 cpuid_apic, int index_msb)
 void __init early_cpu_init(bool verbose)
 {
 	struct cpuinfo_x86 *c = &boot_cpu_data;
+	uint64_t val;
 	u32 eax, ebx, ecx, edx;
 
 	c->x86_cache_alignment = 32;
@@ -412,10 +413,11 @@ void __init early_cpu_init(bool verbose)
 			    &c->x86_capability[FEATURESET_7c0],
 			    &c->x86_capability[FEATURESET_7d0]);
 
-		if (test_bit(X86_FEATURE_ARCH_CAPS, c->x86_capability))
-			rdmsr(MSR_ARCH_CAPABILITIES,
-			      c->x86_capability[FEATURESET_m10Al],
-			      c->x86_capability[FEATURESET_m10Ah]);
+		if (test_bit(X86_FEATURE_ARCH_CAPS, c->x86_capability)) {
+			val = rdmsr(MSR_ARCH_CAPABILITIES);
+			c->x86_capability[FEATURESET_m10Al] = val;
+			c->x86_capability[FEATURESET_m10Al] = val >> 32;
+		}
 
 		if (max_subleaf >= 1)
 			cpuid_count(7, 1, &eax, &ebx, &ecx,
@@ -467,6 +469,7 @@ void reset_cpuinfo(struct cpuinfo_x86 *c, bool keep_basic)
 
 static void generic_identify(struct cpuinfo_x86 *c)
 {
+	uint64_t val;
 	u32 eax, ebx, ecx, edx, tmp;
 
 	/* Get vendor name */
@@ -559,10 +562,11 @@ static void generic_identify(struct cpuinfo_x86 *c)
 			    &c->x86_capability[FEATURESET_Da1],
 			    &tmp, &tmp, &tmp);
 
-	if (test_bit(X86_FEATURE_ARCH_CAPS, c->x86_capability))
-		rdmsr(MSR_ARCH_CAPABILITIES,
-		      c->x86_capability[FEATURESET_m10Al],
-		      c->x86_capability[FEATURESET_m10Ah]);
+	if (test_bit(X86_FEATURE_ARCH_CAPS, c->x86_capability)) {
+		val = rdmsr(MSR_ARCH_CAPABILITIES);
+		c->x86_capability[FEATURESET_m10Al] = val;
+		c->x86_capability[FEATURESET_m10Al] = val >> 32;
+	}
 }
 
 /*
diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
index ecca11f04db8..4f5bb022deea 100644
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -23,17 +23,17 @@ static uint32_t __ro_after_init mcu_opt_ctrl_val;
 
 void update_mcu_opt_ctrl(void)
 {
-    uint32_t mask = mcu_opt_ctrl_mask, lo, hi;
+    uint32_t mask = mcu_opt_ctrl_mask, val;
 
     if ( !mask )
         return;
 
-    rdmsr(MSR_MCU_OPT_CTRL, lo, hi);
+    val = rdmsr(MSR_MCU_OPT_CTRL);
 
-    lo &= ~mask;
-    lo |= mcu_opt_ctrl_val;
+    val &= ~mask;
+    val |= mcu_opt_ctrl_val;
 
-    wrmsr(MSR_MCU_OPT_CTRL, lo, hi);
+    wrmsrns(MSR_MCU_OPT_CTRL, val);
 }
 
 void __init set_in_mcu_opt_ctrl(uint32_t mask, uint32_t val)
@@ -51,17 +51,17 @@ static uint32_t __ro_after_init pb_opt_ctrl_val;
 
 void update_pb_opt_ctrl(void)
 {
-    uint32_t mask = pb_opt_ctrl_mask, lo, hi;
+    uint32_t mask = pb_opt_ctrl_mask, val;
 
     if ( !mask )
         return;
 
-    rdmsr(MSR_PB_OPT_CTRL, lo, hi);
+    val = rdmsr(MSR_PB_OPT_CTRL);
 
-    lo &= ~mask;
-    lo |= pb_opt_ctrl_val;
+    val &= ~mask;
+    val |= pb_opt_ctrl_val;
 
-    wrmsr(MSR_PB_OPT_CTRL, lo, hi);
+    wrmsrns(MSR_PB_OPT_CTRL, val);
 }
 
 void __init set_in_pb_opt_ctrl(uint32_t mask, uint32_t val)
@@ -456,15 +456,15 @@ static void __init probe_mwait_errata(void)
  */
 static void Intel_errata_workarounds(struct cpuinfo_x86 *c)
 {
-	unsigned long lo, hi;
+	uint64_t val;
 
 	if ((c->x86 == 15) && (c->x86_model == 1) && (c->x86_mask == 1)) {
-		rdmsr (MSR_IA32_MISC_ENABLE, lo, hi);
-		if ((lo & (1<<9)) == 0) {
+		val = rdmsr(MSR_IA32_MISC_ENABLE);
+		if ((val & (1 << 9)) == 0) {
 			printk (KERN_INFO "CPU: C0 stepping P4 Xeon detected.\n");
 			printk (KERN_INFO "CPU: Disabling hardware prefetching (Errata 037)\n");
-			lo |= (1<<9);	/* Disable hw prefetching */
-			wrmsr (MSR_IA32_MISC_ENABLE, lo, hi);
+			val |= (1 << 9); /* Disable hw prefetching */
+			wrmsrns(MSR_IA32_MISC_ENABLE, val);
 		}
 	}
 
diff --git a/xen/arch/x86/genapic/x2apic.c b/xen/arch/x86/genapic/x2apic.c
index 1d55eb6b8a41..58157c217ee8 100644
--- a/xen/arch/x86/genapic/x2apic.c
+++ b/xen/arch/x86/genapic/x2apic.c
@@ -268,14 +268,11 @@ const struct genapic *__init apic_x2apic_probe(void)
 
 void __init check_x2apic_preenabled(void)
 {
-    u32 lo, hi;
-
     if ( !cpu_has_x2apic )
         return;
 
     /* Check whether x2apic mode was already enabled by the BIOS. */
-    rdmsr(MSR_APIC_BASE, lo, hi);
-    if ( lo & APIC_BASE_EXTD )
+    if ( rdmsr(MSR_APIC_BASE) & APIC_BASE_EXTD )
     {
         printk("x2APIC mode is already enabled by BIOS.\n");
         x2apic_enabled = 1;
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index ab8b1c87ec0f..1fa61a944b23 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -207,9 +207,13 @@ static void __init vmx_display_features(void)
 static u32 adjust_vmx_controls(
     const char *name, u32 ctl_min, u32 ctl_opt, u32 msr, bool *mismatch)
 {
+    uint64_t val;
     u32 vmx_msr_low, vmx_msr_high, ctl = ctl_min | ctl_opt;
 
-    rdmsr(msr, vmx_msr_low, vmx_msr_high);
+    val = rdmsr(msr);
+
+    vmx_msr_low = val;
+    vmx_msr_high = val >> 32;
 
     ctl &= vmx_msr_high; /* bit == 0 in high word ==> must be zero */
     ctl |= vmx_msr_low;  /* bit == 1 in low word  ==> must be one  */
@@ -258,10 +262,13 @@ static int vmx_init_vmcs_config(bool bsp)
 {
     u32 vmx_basic_msr_low, vmx_basic_msr_high, min, opt;
     struct vmx_caps caps = {};
-    u64 _vmx_misc_cap = 0;
+    uint64_t _vmx_misc_cap = 0, val;
     bool mismatch = false;
 
-    rdmsr(MSR_IA32_VMX_BASIC, vmx_basic_msr_low, vmx_basic_msr_high);
+    val = rdmsr(MSR_IA32_VMX_BASIC);
+
+    vmx_basic_msr_low = val;
+    vmx_basic_msr_high = val >> 32;
 
     min = (PIN_BASED_EXT_INTR_MASK |
            PIN_BASED_NMI_EXITING);
@@ -366,7 +373,10 @@ static int vmx_init_vmcs_config(bool bsp)
     if ( caps.secondary_exec_control & (SECONDARY_EXEC_ENABLE_EPT |
                                         SECONDARY_EXEC_ENABLE_VPID) )
     {
-        rdmsr(MSR_IA32_VMX_EPT_VPID_CAP, caps.ept, caps.vpid);
+        val = rdmsr(MSR_IA32_VMX_EPT_VPID_CAP);
+
+        caps.ept = val;
+        caps.vpid = val >> 32;
 
         if ( !opt_ept_ad )
             caps.ept &= ~VMX_EPT_AD_BIT;
@@ -408,9 +418,15 @@ static int vmx_init_vmcs_config(bool bsp)
          * We check VMX_BASIC_MSR[55] to correctly handle default controls.
          */
         uint32_t must_be_one, must_be_zero, msr = MSR_IA32_VMX_PROCBASED_CTLS;
+
         if ( vmx_basic_msr_high & (VMX_BASIC_DEFAULT1_ZERO >> 32) )
             msr = MSR_IA32_VMX_TRUE_PROCBASED_CTLS;
-        rdmsr(msr, must_be_one, must_be_zero);
+
+        val = rdmsr(msr);
+
+        must_be_one = val;
+        must_be_zero = val >> 32;
+
         if ( must_be_one & (CPU_BASED_INVLPG_EXITING |
                             CPU_BASED_CR3_LOAD_EXITING |
                             CPU_BASED_CR3_STORE_EXITING) )
@@ -699,7 +715,7 @@ void cf_check vmx_cpu_dead(unsigned int cpu)
 
 static int _vmx_cpu_up(bool bsp)
 {
-    u32 eax, edx;
+    u32 eax;
     int rc, bios_locked, cpu = smp_processor_id();
     u64 cr0, vmx_cr0_fixed0, vmx_cr0_fixed1;
 
@@ -719,7 +735,7 @@ static int _vmx_cpu_up(bool bsp)
         return -EINVAL;
     }
 
-    rdmsr(MSR_IA32_FEATURE_CONTROL, eax, edx);
+    eax = rdmsr(MSR_IA32_FEATURE_CONTROL);
 
     bios_locked = !!(eax & IA32_FEATURE_CONTROL_LOCK);
     if ( bios_locked )
diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
index c0d66562956d..f1b2bd5adc9f 100644
--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -9,10 +9,32 @@
 #include <asm/asm_defns.h>
 #include <asm/msr-index.h>
 
-#define rdmsr(msr,val1,val2) \
-     __asm__ __volatile__("rdmsr" \
-			  : "=a" (val1), "=d" (val2) \
-			  : "c" (msr))
+/*
+ * MSR APIs.  Most logic is expected to use:
+ *
+ *   uint64_t foo = rdmsr(MSR_BAR);
+ *   wrmsrns(MSR_BAR, foo);
+ *
+ * In addition, *_safe() wrappers exist to cope gracefully with a #GP.
+ *
+ *
+ * All legacy forms are to be phased out:
+ *
+ *  rdmsrl(MSR_FOO, val);
+ *  wrmsr(MSR_FOO, lo, hi);
+ *  wrmsrl(MSR_FOO, val);
+ */
+
+static inline uint64_t rdmsr(unsigned int msr)
+{
+    unsigned long lo, hi;
+
+    asm volatile ( "rdmsr"
+                   : "=a" (lo), "=d" (hi)
+                   : "c" (msr) );
+
+    return (hi << 32) | lo;
+}
 
 #define rdmsrl(msr,val) do { unsigned long a__,b__; \
        __asm__ __volatile__("rdmsr" \
diff --git a/xen/arch/x86/include/asm/prot-key.h b/xen/arch/x86/include/asm/prot-key.h
index 3e9c2eaef415..8fb15b5c32e9 100644
--- a/xen/arch/x86/include/asm/prot-key.h
+++ b/xen/arch/x86/include/asm/prot-key.h
@@ -52,11 +52,7 @@ DECLARE_PER_CPU(uint32_t, pkrs);
 
 static inline uint32_t rdpkrs(void)
 {
-    uint32_t pkrs, tmp;
-
-    rdmsr(MSR_PKRS, pkrs, tmp);
-
-    return pkrs;
+    return rdmsr(MSR_PKRS);
 }
 
 static inline uint32_t rdpkrs_and_cache(void)
diff --git a/xen/arch/x86/tsx.c b/xen/arch/x86/tsx.c
index 2a0c7c08a2ba..fe9f0ab4f792 100644
--- a/xen/arch/x86/tsx.c
+++ b/xen/arch/x86/tsx.c
@@ -42,6 +42,8 @@ void tsx_init(void)
 {
     static bool __read_mostly once;
 
+    uint64_t val;
+
     /*
      * This function is first called between microcode being loaded, and
      * CPUID being scanned generally. early_cpu_init() has already prepared
@@ -62,8 +64,6 @@ void tsx_init(void)
              * On a TAA-vulnerable or later part with at least the May 2020
              * microcode mitigating SRBDS.
              */
-            uint64_t val;
-
             rdmsrl(MSR_MCU_OPT_CTRL, val);
 
             /*
@@ -118,8 +118,6 @@ void tsx_init(void)
 
         if ( cpu_has_tsx_force_abort )
         {
-            uint64_t val;
-
             /*
              * On an early TSX-enabled Skylake part subject to the memory
              * ordering erratum, with at least the March 2019 microcode.
@@ -250,18 +248,17 @@ void tsx_init(void)
          *    controlled, we have or will set MSR_MCU_OPT_CTRL.RTM_ALLOW to
          *    let TSX_CTRL.RTM_DISABLE be usable.
          */
-        uint32_t hi, lo;
 
-        rdmsr(MSR_TSX_CTRL, lo, hi);
+        val = rdmsr(MSR_TSX_CTRL);
 
         /* Check bottom bit only.  Higher bits are various sentinels. */
         rtm_disabled = !(opt_tsx & 1);
 
-        lo &= ~(TSX_CTRL_RTM_DISABLE | TSX_CTRL_CPUID_CLEAR);
+        val &= ~(TSX_CTRL_RTM_DISABLE | TSX_CTRL_CPUID_CLEAR);
         if ( rtm_disabled )
-            lo |= TSX_CTRL_RTM_DISABLE | TSX_CTRL_CPUID_CLEAR;
+            val |= TSX_CTRL_RTM_DISABLE | TSX_CTRL_CPUID_CLEAR;
 
-        wrmsr(MSR_TSX_CTRL, lo, hi);
+        wrmsrns(MSR_TSX_CTRL, val);
     }
     else if ( cpu_has_tsx_force_abort )
     {
@@ -269,14 +266,12 @@ void tsx_init(void)
          * On an early TSX-enable Skylake part subject to the memory ordering
          * erratum, with at least the March 2019 microcode.
          */
-        uint32_t hi, lo;
-
-        rdmsr(MSR_TSX_FORCE_ABORT, lo, hi);
+        val = rdmsr(MSR_TSX_FORCE_ABORT);
 
         /* Check bottom bit only.  Higher bits are various sentinels. */
         rtm_disabled = !(opt_tsx & 1);
 
-        lo &= ~(TSX_FORCE_ABORT_RTM | TSX_CPUID_CLEAR | TSX_ENABLE_RTM);
+        val &= ~(TSX_FORCE_ABORT_RTM | TSX_CPUID_CLEAR | TSX_ENABLE_RTM);
 
         if ( cpu_has_rtm_always_abort )
         {
@@ -291,7 +286,7 @@ void tsx_init(void)
              *  - TSX_FORCE_ABORT.ENABLE_RTM may be used to opt in to
              *    re-enabling RTM, at the users own risk.
              */
-            lo |= rtm_disabled ? TSX_CPUID_CLEAR : TSX_ENABLE_RTM;
+            val |= rtm_disabled ? TSX_CPUID_CLEAR : TSX_ENABLE_RTM;
         }
         else
         {
@@ -304,10 +299,10 @@ void tsx_init(void)
              *    setting TSX_FORCE_ABORT.FORCE_ABORT_RTM.
              */
             if ( rtm_disabled )
-                lo |= TSX_FORCE_ABORT_RTM;
+                val |= TSX_FORCE_ABORT_RTM;
         }
 
-        wrmsr(MSR_TSX_FORCE_ABORT, lo, hi);
+        wrmsrns(MSR_TSX_FORCE_ABORT, val);
     }
     else if ( opt_tsx >= 0 )
         printk_once(XENLOG_WARNING
-- 
2.39.5


