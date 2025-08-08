Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DBFB1E6A5
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 12:44:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1074269.1436936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukKa5-00064m-WA; Fri, 08 Aug 2025 10:44:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1074269.1436936; Fri, 08 Aug 2025 10:44:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukKa5-00061y-Sq; Fri, 08 Aug 2025 10:44:13 +0000
Received: by outflank-mailman (input) for mailman id 1074269;
 Fri, 08 Aug 2025 10:44:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X7wO=2U=cloud.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1ukKa4-0005NR-88
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 10:44:12 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e9b4bf2-7444-11f0-a324-13f23c93f187;
 Fri, 08 Aug 2025 12:44:11 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-6154655c8aeso2885433a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 08 Aug 2025 03:44:11 -0700 (PDT)
Received: from fedora.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8eff60esm13490420a12.13.2025.08.08.03.44.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 03:44:08 -0700 (PDT)
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
X-Inumbo-ID: 9e9b4bf2-7444-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1754649851; x=1755254651; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6OPhMV1SXhoUeCkmofhNOg12vmHdK5r/c0U6u2GaPw4=;
        b=k7RGlQJZTfHkcw4M2pKDr0cTtM+AOCd//ePXatO4Ee5AFKAj+OUvkM3sfwj9ANFExd
         GaIPj0k4OEuipcBva8rCiH2Lh9c563OFD5fqqrwv6YtspdasAcP3G5dSXtX3g4hcrzsI
         z6/AmxaMGY3aO7GVH6YXsm3wqKSWsAlNitaAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754649851; x=1755254651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6OPhMV1SXhoUeCkmofhNOg12vmHdK5r/c0U6u2GaPw4=;
        b=ORjQgZCl3VY76oBtd6FjxwsrGCJOPh4bV5y5NLAuxjbfDvhfmufrSDnRaV0hIVkyH1
         aSoAjro/ImL19GFErs1/7NAHCMw4gNJByV5T+eZ6st9mWVeicAlGAFPFXn0mKbf3Ocg+
         bG5L0ZL4C013assHSdz+TCes45/qciqnx9E+3/IafgidMGCDo7j+z67dbohmTHXNJC8X
         AU0f1p1X2B8TiWN6rsE0m+EskoUESgxVQovKFVE5wK5+SjpU0p8uEZ7yF8zrXLIpeKwJ
         Ku2Qx5H9XS2yXkBsJAlOYzCAgCelHQDRt5a8SzjiiV6Bf+c4Cz7nTk/3UGwZh543HuAY
         w4kw==
X-Gm-Message-State: AOJu0YzdvT8ybDMyAGJWpyBFiqRxIlPxG1+VUHfOnaHyQTEtWqLDjlSi
	lEPFCYotjb/TpYr/v+bFX8kMyjbemXjVFPOtb5pNEgCpjO5lPb6ywBl+eDmSrAfCf5Euq9k8ayp
	DDKro
X-Gm-Gg: ASbGnctPYJ/I4C7d3DcF5MfIUUldktHnu8kHIifAVOnsRP0YfCrABmn9mYl2G41yIxi
	DWcR3ce+upqoWkV9Bjq/yae+mhkTnSVDlhcrwO6OOAe+fLlKNFc5u4pV37ujx31BgrM6qNOJYAY
	W3bGZKmUbt1Wvv8La651K34vEWqSzdjKul/tNjnSi0o7IYQ9ygK5iICcE3zug4K1iezQYXiUWRh
	KFrenEZezkxUryUeUm9qmFRjB+gOx42mBRPqItLf9cenkj5hMImgFS/LRG6ELFJC5pbIr7Cp/Ui
	2Ja2DvC99PVS2gNQdQoQ44hoOGH7Cn97YzpPJJRJH+4QYQ/Ut9Nn3C+IpGmujn/Jo3GLkOYmc+J
	8he/d17w2iQgnzLqePswFsbpI/hv0ebD0Zb+tNIcNYn+279BhSA==
X-Google-Smtp-Source: AGHT+IGUU9ZjQhzrtb23k4QdrryOAYnrPnFYz6oHFjNei9rxZCVaq6wHHTecwNylL4tmyf9Co2pe2A==
X-Received: by 2002:a05:6402:278d:b0:615:c767:5b94 with SMTP id 4fb4d7f45d1cf-617ed1d8376mr800208a12.9.1754649849273;
        Fri, 08 Aug 2025 03:44:09 -0700 (PDT)
From: Kevin Lampis <kevin.lampis@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Kevin Lampis <kevin.lampis@cloud.com>
Subject: [PATCH] x86: Remove x86 prefixed names from cpuinfo
Date: Fri,  8 Aug 2025 11:43:49 +0100
Message-ID: <20250808104349.635091-1-kevin.lampis@cloud.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct cpuinfo_x86
  .x86        => .family
  .x86_vendor => .vendor
  .x86_model  => .model
  .x86_mask   => .stepping

No functional change.

Signed-off-by: Kevin Lampis <kevin.lampis@cloud.com>
---
 xen/arch/x86/acpi/cpu_idle.c             | 20 +++---
 xen/arch/x86/acpi/cpufreq/acpi.c         |  2 +-
 xen/arch/x86/acpi/cpufreq/cpufreq.c      |  4 +-
 xen/arch/x86/acpi/cpufreq/powernow.c     |  4 +-
 xen/arch/x86/alternative.c               |  8 +--
 xen/arch/x86/apic.c                      |  8 +--
 xen/arch/x86/cpu/amd.c                   | 84 ++++++++++++------------
 xen/arch/x86/cpu/centaur.c               |  4 +-
 xen/arch/x86/cpu/common.c                | 38 +++++------
 xen/arch/x86/cpu/hygon.c                 |  4 +-
 xen/arch/x86/cpu/intel.c                 | 30 ++++-----
 xen/arch/x86/cpu/intel_cacheinfo.c       |  6 +-
 xen/arch/x86/cpu/mcheck/amd_nonfatal.c   |  2 +-
 xen/arch/x86/cpu/mcheck/mcaction.c       |  2 +-
 xen/arch/x86/cpu/mcheck/mce.c            | 30 ++++-----
 xen/arch/x86/cpu/mcheck/mce.h            |  2 +-
 xen/arch/x86/cpu/mcheck/mce_amd.c        | 16 ++---
 xen/arch/x86/cpu/mcheck/mce_intel.c      |  5 +-
 xen/arch/x86/cpu/mcheck/non-fatal.c      |  2 +-
 xen/arch/x86/cpu/mcheck/vmce.c           |  8 +--
 xen/arch/x86/cpu/mtrr/generic.c          |  6 +-
 xen/arch/x86/cpu/mwait-idle.c            |  4 +-
 xen/arch/x86/cpu/vpmu.c                  |  4 +-
 xen/arch/x86/cpu/vpmu_amd.c              |  6 +-
 xen/arch/x86/cpu/vpmu_intel.c            |  4 +-
 xen/arch/x86/cpuid.c                     |  2 +-
 xen/arch/x86/dom0_build.c                |  4 +-
 xen/arch/x86/domain.c                    | 12 ++--
 xen/arch/x86/e820.c                      |  2 +-
 xen/arch/x86/hvm/hvm.c                   |  2 +-
 xen/arch/x86/hvm/svm/svm.c               |  6 +-
 xen/arch/x86/hvm/vmx/vmcs.c              |  4 +-
 xen/arch/x86/hvm/vmx/vmx.c               | 28 ++++----
 xen/arch/x86/i8259.c                     |  2 +-
 xen/arch/x86/include/asm/cpufeature.h    | 21 ++----
 xen/arch/x86/include/asm/intel-family.h  |  4 ++
 xen/arch/x86/io_apic.c                   |  2 +-
 xen/arch/x86/irq.c                       |  4 +-
 xen/arch/x86/mpparse.c                   |  8 +--
 xen/arch/x86/msr.c                       |  4 +-
 xen/arch/x86/nmi.c                       | 12 ++--
 xen/arch/x86/platform_hypercall.c        |  6 +-
 xen/arch/x86/pv/domain.c                 |  2 +-
 xen/arch/x86/pv/emul-priv-op.c           | 30 ++++-----
 xen/arch/x86/setup.c                     |  6 +-
 xen/arch/x86/traps-setup.c               |  4 +-
 xen/arch/x86/tsx.c                       |  4 +-
 xen/drivers/passthrough/amd/iommu_init.c |  6 +-
 48 files changed, 234 insertions(+), 244 deletions(-)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index d60a07bfd5..95a626f49c 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -178,10 +178,10 @@ static void cf_check do_get_hw_residencies(void *arg)
     struct cpuinfo_x86 *c = &current_cpu_data;
     struct hw_residencies *hw_res = arg;
 
-    if ( c->x86_vendor != X86_VENDOR_INTEL || c->x86 != 6 )
+    if ( c->vendor != X86_VENDOR_INTEL || c->family != 6 )
         return;
 
-    switch ( c->x86_model )
+    switch ( c->model )
     {
     /* 4th generation Intel Core (Haswell) */
     case 0x45:
@@ -915,7 +915,7 @@ void cf_check acpi_dead_idle(void)
             mwait(cx->address, 0);
         }
     }
-    else if ( (current_cpu_data.x86_vendor &
+    else if ( (current_cpu_data.vendor &
                (X86_VENDOR_AMD | X86_VENDOR_HYGON)) &&
               cx->entry_method == ACPI_CSTATE_EM_SYSIO )
     {
@@ -1042,8 +1042,8 @@ static void acpi_processor_power_init_bm_check(struct acpi_processor_flags *flag
     flags->bm_check = 0;
     if ( num_online_cpus() == 1 )
         flags->bm_check = 1;
-    else if ( (c->x86_vendor == X86_VENDOR_INTEL) ||
-              ((c->x86_vendor == X86_VENDOR_AMD) && (c->x86 == 0x15)) )
+    else if ( (c->vendor == X86_VENDOR_INTEL) ||
+              ((c->vendor == X86_VENDOR_AMD) && (c->family == 0x15)) )
     {
         /*
          * Today all MP CPUs that support C3 share cache.
@@ -1059,8 +1059,8 @@ static void acpi_processor_power_init_bm_check(struct acpi_processor_flags *flag
      * is not required while entering C3 type state on
      * P4, Core and beyond CPUs
      */
-    if ( c->x86_vendor == X86_VENDOR_INTEL &&
-        (c->x86 > 0x6 || (c->x86 == 6 && c->x86_model >= 14)) )
+    if ( c->vendor == X86_VENDOR_INTEL &&
+        (c->family > 0x6 || (c->family == 6 && c->model >= 14)) )
             flags->bm_control = 0;
 }
 
@@ -1416,12 +1416,12 @@ static void amd_cpuidle_init(struct acpi_processor_power *power)
     if ( vendor_override < 0 )
         return;
 
-    switch ( c->x86 )
+    switch ( c->model )
     {
     case 0x1a:
     case 0x19:
     case 0x18:
-        if ( boot_cpu_data.x86_vendor != X86_VENDOR_HYGON )
+        if ( boot_cpu_data.vendor != X86_VENDOR_HYGON )
         {
     default:
             vendor_override = -1;
@@ -1648,7 +1648,7 @@ static int cf_check cpu_callback(
         break;
 
     case CPU_ONLINE:
-        if ( (boot_cpu_data.x86_vendor &
+        if ( (boot_cpu_data.vendor &
               (X86_VENDOR_AMD | X86_VENDOR_HYGON)) &&
              processor_powers[cpu] )
             amd_cpuidle_init(processor_powers[cpu]);
diff --git a/xen/arch/x86/acpi/cpufreq/acpi.c b/xen/arch/x86/acpi/cpufreq/acpi.c
index 0c25376406..8a102baff3 100644
--- a/xen/arch/x86/acpi/cpufreq/acpi.c
+++ b/xen/arch/x86/acpi/cpufreq/acpi.c
@@ -468,7 +468,7 @@ static int cf_check acpi_cpufreq_cpu_init(struct cpufreq_policy *policy)
 
     /* Check for APERF/MPERF support in hardware
      * also check for boost support */
-    if (c->x86_vendor == X86_VENDOR_INTEL && c->cpuid_level >= 6)
+    if ( c->vendor == X86_VENDOR_INTEL && c->cpuid_level >= 6 )
         on_selected_cpus(cpumask_of(cpu), feature_detect, policy, 1);
 
     /*
diff --git a/xen/arch/x86/acpi/cpufreq/cpufreq.c b/xen/arch/x86/acpi/cpufreq/cpufreq.c
index 45f301f354..abb19573a7 100644
--- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
+++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
@@ -128,7 +128,7 @@ static int __init cf_check cpufreq_driver_init(void)
 
     if ( cpufreq_controller == FREQCTL_xen )
     {
-        switch ( boot_cpu_data.x86_vendor )
+        switch ( boot_cpu_data.vendor )
         {
         case X86_VENDOR_INTEL:
             ret = -ENOENT;
@@ -182,7 +182,7 @@ __initcall(cpufreq_driver_late_init);
 int cpufreq_cpu_init(unsigned int cpu)
 {
     /* Currently we only handle Intel, AMD and Hygon processor */
-    if ( boot_cpu_data.x86_vendor &
+    if ( boot_cpu_data.vendor &
          (X86_VENDOR_INTEL | X86_VENDOR_AMD | X86_VENDOR_HYGON) )
         return cpufreq_add_cpu(cpu);
 
diff --git a/xen/arch/x86/acpi/cpufreq/powernow.c b/xen/arch/x86/acpi/cpufreq/powernow.c
index 12fca45b45..4c04dd242f 100644
--- a/xen/arch/x86/acpi/cpufreq/powernow.c
+++ b/xen/arch/x86/acpi/cpufreq/powernow.c
@@ -144,7 +144,7 @@ static void amd_fixup_frequency(struct xen_processor_px *px)
     int index = px->control & 0x00000007;
     const struct cpuinfo_x86 *c = &current_cpu_data;
 
-    if ((c->x86 != 0x10 || c->x86_model >= 10) && c->x86 != 0x11)
+    if ((c->family != 0x10 || c->model >= 10) && c->family != 0x11)
         return;
 
     rdmsr(MSR_PSTATE_DEF_BASE + index, lo, hi);
@@ -157,7 +157,7 @@ static void amd_fixup_frequency(struct xen_processor_px *px)
 
     fid = lo & 0x3f;
     did = (lo >> 6) & 7;
-    if (c->x86 == 0x10)
+    if (c->family == 0x10)
         px->core_frequency = (100 * (fid + 16)) >> did;
     else
         px->core_frequency = (100 * (fid + 8)) >> did;
diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
index 9f844241bc..5ed0c26725 100644
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -89,7 +89,7 @@ static bool init_or_livepatch_read_mostly toolchain_nops_are_ideal;
 
 static void __init arch_init_ideal_nops(void)
 {
-    switch ( boot_cpu_data.x86_vendor )
+    switch ( boot_cpu_data.vendor )
     {
     case X86_VENDOR_INTEL:
         /*
@@ -97,10 +97,10 @@ static void __init arch_init_ideal_nops(void)
          * actually perform better with the "k8_nops" than with the SDM-
          * recommended NOPs.
          */
-        if ( boot_cpu_data.x86 != 6 )
+        if ( boot_cpu_data.family != 6 )
             break;
 
-        switch ( boot_cpu_data.x86_model )
+        switch ( boot_cpu_data.model )
         {
         case 0x0f ... 0x1b:
         case 0x1d ... 0x25:
@@ -111,7 +111,7 @@ static void __init arch_init_ideal_nops(void)
         break;
 
     case X86_VENDOR_AMD:
-        if ( boot_cpu_data.x86 <= 0xf )
+        if ( boot_cpu_data.family <= 0xf )
             ideal_nops = k8_nops;
         break;
     }
diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
index 0fd8bdba70..5cd9d8c47d 100644
--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -96,12 +96,12 @@ static int modern_apic(void)
 {
     unsigned int lvr, version;
     /* AMD systems use old APIC versions, so check the CPU */
-    if (boot_cpu_data.x86_vendor == X86_VENDOR_AMD &&
-        boot_cpu_data.x86 >= 0xf)
+    if (boot_cpu_data.vendor == X86_VENDOR_AMD &&
+        boot_cpu_data.family >= 0xf)
         return 1;
 
     /* Hygon systems use modern APIC */
-    if (boot_cpu_data.x86_vendor == X86_VENDOR_HYGON)
+    if (boot_cpu_data.vendor == X86_VENDOR_HYGON)
         return 1;
 
     lvr = apic_read(APIC_LVR);
@@ -447,7 +447,7 @@ void __init init_bsp_APIC(void)
     value |= APIC_SPIV_APIC_ENABLED;
     
     /* This bit is reserved on P4/Xeon and should be cleared */
-    if ((boot_cpu_data.x86_vendor == X86_VENDOR_INTEL) && (boot_cpu_data.x86 == 15))
+    if ((boot_cpu_data.vendor == X86_VENDOR_INTEL) && (boot_cpu_data.family == 15))
         value &= ~APIC_SPIV_FOCUS_DISABLED;
     else
         value |= APIC_SPIV_FOCUS_DISABLED;
diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index eb428f284e..2062d8779c 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -190,7 +190,7 @@ static void __init noinline probe_masking_msrs(void)
 	 */
 
 	/* Fam11 doesn't support masking at all. */
-	if (c->x86 == 0x11)
+	if (c->family == 0x11)
 		return;
 
 	cpuidmask_defaults._1cd =
@@ -202,7 +202,7 @@ static void __init noinline probe_masking_msrs(void)
 		cpuidmask_defaults._7ab0 =
 			_probe_mask_msr(MSR_AMD_L7S0_FEATURE_MASK, LCAP_7ab0);
 
-	if (c->x86 == 0x15 && c->cpuid_level >= 6 && cpuid_ecx(6))
+	if (c->family == 0x15 && c->cpuid_level >= 6 && cpuid_ecx(6))
 		cpuidmask_defaults._6c =
 			_probe_mask_msr(MSR_AMD_THRM_FEATURE_MASK, LCAP_6c);
 
@@ -219,7 +219,7 @@ static void __init noinline probe_masking_msrs(void)
 	       expected_levelling_cap, levelling_caps,
 	       (expected_levelling_cap ^ levelling_caps) & levelling_caps);
 	printk(XENLOG_WARNING "Fam %#x, model %#x level %#x\n",
-	       c->x86, c->x86_model, c->cpuid_level);
+	       c->family, c->model, c->cpuid_level);
 	printk(XENLOG_WARNING
 	       "If not running virtualised, please report a bug\n");
 }
@@ -428,7 +428,7 @@ int cpu_has_amd_erratum(const struct cpuinfo_x86 *cpu, int osvw_id, ...)
 	u32 range;
 	u32 ms;
 	
-	if (cpu->x86_vendor != X86_VENDOR_AMD)
+	if (cpu->vendor != X86_VENDOR_AMD)
 		return 0;
 
 	if (osvw_id >= 0 && cpu_has(cpu, X86_FEATURE_OSVW)) {
@@ -449,9 +449,9 @@ int cpu_has_amd_erratum(const struct cpuinfo_x86 *cpu, int osvw_id, ...)
 	/* OSVW unavailable or ID unknown, match family-model-stepping range */
 	va_start(ap, osvw_id);
 
-	ms = (cpu->x86_model << 4) | cpu->x86_mask;
+	ms = (cpu->model << 4) | cpu->stepping;
 	while ((range = va_arg(ap, int))) {
-		if ((cpu->x86 == AMD_MODEL_RANGE_FAMILY(range)) &&
+		if ((cpu->family == AMD_MODEL_RANGE_FAMILY(range)) &&
 		    (ms >= AMD_MODEL_RANGE_START(range)) &&
 		    (ms <= AMD_MODEL_RANGE_END(range))) {
 			va_end(ap);
@@ -519,8 +519,8 @@ static void check_syscfg_dram_mod_en(void)
 {
 	uint64_t syscfg;
 
-	if (!((boot_cpu_data.x86_vendor == X86_VENDOR_AMD) &&
-		(boot_cpu_data.x86 >= 0x0f)))
+	if (!((boot_cpu_data.vendor == X86_VENDOR_AMD) &&
+		(boot_cpu_data.family >= 0x0f)))
 		return;
 
 	rdmsrl(MSR_K8_SYSCFG, syscfg);
@@ -563,7 +563,7 @@ static void amd_get_topology(struct cpuinfo_x86 *c)
                 cpuid(0x8000001e, &eax, &ebx, &ecx, &edx);
                 c->x86_num_siblings = ((ebx >> 8) & 0xff) + 1;
 
-                if (c->x86 < 0x17)
+                if (c->family < 0x17)
                         c->compute_unit_id = ebx & 0xFF;
                 else {
                         c->cpu_core_id = ebx & 0xFF;
@@ -621,10 +621,10 @@ static void amd_process_freq(const struct cpuinfo_x86 *c,
 	unsigned int idx = 0, h;
 	uint64_t hi, lo, val;
 
-	if (c->x86 < 0x10 || c->x86 > 0x1A)
+	if (c->family < 0x10 || c->family > 0x1A)
 		return;
 
-	if (c->x86 < 0x17) {
+	if (c->family < 0x17) {
 		unsigned int node = 0;
 		uint64_t nbcfg;
 
@@ -674,7 +674,7 @@ static void amd_process_freq(const struct cpuinfo_x86 *c,
 				 * accounted for in order to correctly fetch the
 				 * nominal frequency of the processor.
 				 */
-				switch (c->x86) {
+				switch (c->family) {
 				case 0x10: idx = 1; break;
 				case 0x12: idx = 7; break;
 				case 0x14: idx = 7; break;
@@ -694,7 +694,7 @@ static void amd_process_freq(const struct cpuinfo_x86 *c,
 	}
 
 	lo = 0; /* gcc may not recognize the loop having at least 5 iterations */
-	for (h = c->x86 == 0x10 ? 5 : 8; h--; )
+	for (h = c->family == 0x10 ? 5 : 8; h--; )
 		if (!rdmsr_safe(0xC0010064 + h, lo) && (lo >> 63))
 			break;
 	if (!(lo >> 63))
@@ -704,18 +704,18 @@ static void amd_process_freq(const struct cpuinfo_x86 *c,
 	    !rdmsr_safe(0xC0010064 + idx, val) && (val >> 63) &&
 	    !rdmsr_safe(0xC0010064, hi) && (hi >> 63)) {
 		if (nom_mhz)
-			*nom_mhz = amd_parse_freq(c->x86, val);
+			*nom_mhz = amd_parse_freq(c->family, val);
 		if (low_mhz)
-			*low_mhz = amd_parse_freq(c->x86, lo);
+			*low_mhz = amd_parse_freq(c->family, lo);
 		if (hi_mhz)
-			*hi_mhz = amd_parse_freq(c->x86, hi);
+			*hi_mhz = amd_parse_freq(c->family, hi);
 	} else if (h && !rdmsr_safe(0xC0010064, hi) && (hi >> 63)) {
 		if (low_mhz)
-			*low_mhz = amd_parse_freq(c->x86, lo);
+			*low_mhz = amd_parse_freq(c->family, lo);
 		if (hi_mhz)
-			*hi_mhz = amd_parse_freq(c->x86, hi);
+			*hi_mhz = amd_parse_freq(c->family, hi);
 	} else if (low_mhz)
-		*low_mhz = amd_parse_freq(c->x86, lo);
+		*low_mhz = amd_parse_freq(c->family, lo);
 }
 
 void cf_check early_init_amd(struct cpuinfo_x86 *c)
@@ -794,7 +794,7 @@ static bool set_legacy_ssbd(const struct cpuinfo_x86 *c, bool enable)
 {
 	int bit = -1;
 
-	switch (c->x86) {
+	switch (c->family) {
 	case 0x15: bit = 54; break;
 	case 0x16: bit = 33; break;
 	case 0x17:
@@ -856,7 +856,7 @@ bool __init amd_setup_legacy_ssbd(void)
 {
 	unsigned int i;
 
-	if ((boot_cpu_data.x86 != 0x17 && boot_cpu_data.x86 != 0x18) ||
+	if ((boot_cpu_data.family != 0x17 && boot_cpu_data.family != 0x18) ||
 	    boot_cpu_data.x86_num_siblings <= 1 || opt_ssbd)
 		return true;
 
@@ -903,7 +903,7 @@ static void core_set_legacy_ssbd(bool enable)
 
 	BUG_ON(this_cpu(legacy_ssbd) == enable);
 
-	if ((c->x86 != 0x17 && c->x86 != 0x18) || c->x86_num_siblings <= 1) {
+	if ((c->family != 0x17 && c->family != 0x18) || c->x86_num_siblings <= 1) {
 		BUG_ON(!set_legacy_ssbd(c, enable));
 		return;
 	}
@@ -994,10 +994,10 @@ void amd_check_zenbleed(void)
 	 * position to care either way.  An admin doesn't want to be disabling
 	 * AVX as a mitigation on any build of Xen with this logic present.
 	 */
-	if (cpu_has_hypervisor || boot_cpu_data.x86 != 0x17)
+	if (cpu_has_hypervisor || boot_cpu_data.family != 0x17)
 		return;
 
-	switch (boot_cpu_data.x86_model) {
+	switch (boot_cpu_data.model) {
 	case 0x30 ... 0x3f: good_rev = 0x0830107a; break;
 	case 0x60 ... 0x67: good_rev = 0x0860010b; break;
 	case 0x68 ... 0x6f: good_rev = 0x08608105; break;
@@ -1082,7 +1082,7 @@ static void amd_check_bp_cfg(void)
 	/*
 	 * AMD Erratum #1485.  Set bit 5, as instructed.
 	 */
-	if (!cpu_has_hypervisor && boot_cpu_data.x86 == 0x19 && is_zen4_uarch())
+	if (!cpu_has_hypervisor && boot_cpu_data.family == 0x19 && is_zen4_uarch())
 		new |= (1 << 5);
 
 	/*
@@ -1125,7 +1125,7 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
 	 * Errata 63 for SH-B3 steppings
 	 * Errata 122 for all steppings (F+ have it disabled by default)
 	 */
-	if (c->x86 == 15) {
+	if (c->family == 15) {
 		rdmsrl(MSR_K8_HWCR, value);
 		value |= 1 << 6;
 		wrmsrl(MSR_K8_HWCR, value);
@@ -1138,7 +1138,7 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
 	 */
 	__clear_bit(X86_FEATURE_PBE, c->x86_capability);
 	
-	if (c->x86 == 0xf && c->x86_model < 0x14
+	if (c->family == 0xf && c->model < 0x14
 	    && cpu_has(c, X86_FEATURE_LAHF_LM)) {
 		/*
 		 * Some BIOSes incorrectly force this feature, but only K8
@@ -1157,7 +1157,7 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
 	if (c == &boot_cpu_data && !cpu_has(c, X86_FEATURE_RSTR_FP_ERR_PTRS))
 		setup_force_cpu_cap(X86_BUG_FPU_PTRS);
 
-	if (c->x86 == 0x0f || c->x86 == 0x11)
+	if (c->family == 0x0f || c->family == 0x11)
 		/* Always dispatch serialising on this hardare. */
 		__set_bit(X86_FEATURE_LFENCE_DISPATCH, c->x86_capability);
 	else /* Implicily "== 0x10 || >= 0x12" by being 64bit. */
@@ -1165,12 +1165,12 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
 
 	amd_init_ssbd(c);
 
-	if (c->x86 == 0x17)
+	if (c->family == 0x17)
 		amd_init_spectral_chicken();
 
 	/* Probe for NSCB on Zen2 CPUs when not virtualised */
 	if (!cpu_has_hypervisor && !cpu_has_nscb && c == &boot_cpu_data &&
-	    c->x86 == 0x17)
+	    c->family == 0x17)
 		detect_zen2_null_seg_behaviour();
 
 	/*
@@ -1192,7 +1192,7 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
 	if (c == &boot_cpu_data && !cpu_has_clflushopt)
 		setup_force_cpu_cap(X86_BUG_CLFLUSH_MFENCE);
 
-	switch(c->x86)
+	switch(c->family)
 	{
 	case 0xf ... 0x11:
 		disable_c1e(NULL);
@@ -1241,15 +1241,15 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
 		if (cpu_has(c, X86_FEATURE_ITSC)) {
 			__set_bit(X86_FEATURE_CONSTANT_TSC, c->x86_capability);
 			__set_bit(X86_FEATURE_NONSTOP_TSC, c->x86_capability);
-			if (c->x86 != 0x11)
+			if (c->family != 0x11)
 				__set_bit(X86_FEATURE_TSC_RELIABLE,
 					  c->x86_capability);
 		}
 	}
 
 	/* re-enable TopologyExtensions if switched off by BIOS */
-	if ((c->x86 == 0x15) &&
-	    (c->x86_model >= 0x10) && (c->x86_model <= 0x1f) &&
+	if ((c->family == 0x15) &&
+	    (c->model >= 0x10) && (c->model <= 0x1f) &&
 	    !cpu_has(c, X86_FEATURE_TOPOEXT) &&
 	    !rdmsr_safe(MSR_K8_EXT_FEATURE_MASK, value)) {
 		value |= 1ULL << 54;
@@ -1266,14 +1266,14 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
 	 * The way access filter has a performance penalty on some workloads.
 	 * Disable it on the affected CPUs.
 	 */
-	if (c->x86 == 0x15 && c->x86_model >= 0x02 && c->x86_model < 0x20 &&
+	if (c->family == 0x15 && c->model >= 0x02 && c->model < 0x20 &&
 	    !rdmsr_safe(MSR_AMD64_IC_CFG, value) && (value & 0x1e) != 0x1e)
 		wrmsr_safe(MSR_AMD64_IC_CFG, value | 0x1e);
 
         amd_get_topology(c);
 
 	/* Pointless to use MWAIT on Family10 as it does not deep sleep. */
-	if (c->x86 == 0x10)
+	if (c->family == 0x10)
 		__clear_bit(X86_FEATURE_MONITOR, c->x86_capability);
 
 	if (!cpu_has_amd_erratum(c, AMD_ERRATUM_121))
@@ -1290,7 +1290,7 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
 		       "*** Pass \"allow_unsafe\" if you're trusting"
 		       " all your (PV) guest kernels. ***\n");
 
-	if (c->x86 == 0x16 && c->x86_model <= 0xf) {
+	if (c->family == 0x16 && c->model <= 0xf) {
 		if (c == &boot_cpu_data) {
 			l = pci_conf_read32(PCI_SBDF(0, 0, 0x18, 3), 0x58);
 			h = pci_conf_read32(PCI_SBDF(0, 0, 0x18, 3), 0x5c);
@@ -1318,7 +1318,7 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
 					    smp_processor_id());
 			wrmsrl(MSR_AMD64_LS_CFG, value | (1 << 15));
 		}
-	} else if (c->x86 == 0x12) {
+	} else if (c->family == 0x12) {
 		rdmsrl(MSR_AMD64_DE_CFG, value);
 		if (!(value & (1U << 31))) {
 			if (c == &boot_cpu_data || opt_cpu_info)
@@ -1332,7 +1332,7 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
 	/* AMD CPUs do not support SYSENTER outside of legacy mode. */
 	__clear_bit(X86_FEATURE_SEP, c->x86_capability);
 
-	if (c->x86 == 0x10) {
+	if (c->family == 0x10) {
 		/* do this for boot cpu */
 		if (c == &boot_cpu_data)
 			check_enable_amd_mmconf_dmi();
@@ -1355,14 +1355,14 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
 	 * Family 0x12 and above processors have APIC timer
 	 * running in deep C states.
 	 */
-	if ( opt_arat && c->x86 > 0x11 )
+	if ( opt_arat && c->family > 0x11 )
 		__set_bit(X86_FEATURE_ARAT, c->x86_capability);
 
 	/*
 	 * Prior to Family 0x14, perf counters are not reset during warm reboot.
 	 * We have to reset them manually.
 	 */
-	if (nmi_watchdog != NMI_LOCAL_APIC && c->x86 < 0x14) {
+	if (nmi_watchdog != NMI_LOCAL_APIC && c->family < 0x14) {
 		wrmsrl(MSR_K7_PERFCTR0, 0);
 		wrmsrl(MSR_K7_PERFCTR1, 0);
 		wrmsrl(MSR_K7_PERFCTR2, 0);
@@ -1404,7 +1404,7 @@ static int __init cf_check amd_check_erratum_1474(void)
 	s_time_t delta;
 
 	if (cpu_has_hypervisor ||
-	    (boot_cpu_data.x86 != 0x17 && boot_cpu_data.x86 != 0x18))
+	    (boot_cpu_data.family != 0x17 && boot_cpu_data.family != 0x18))
 		return 0;
 
 	/*
diff --git a/xen/arch/x86/cpu/centaur.c b/xen/arch/x86/cpu/centaur.c
index 750168d1e8..d0e10cafc7 100644
--- a/xen/arch/x86/cpu/centaur.c
+++ b/xen/arch/x86/cpu/centaur.c
@@ -39,7 +39,7 @@ static void init_c3(struct cpuinfo_x86 *c)
 		}
 	}
 
-	if (c->x86 == 0x6 && c->x86_model >= 0xf) {
+	if (c->family == 0x6 && c->model >= 0xf) {
 		c->x86_cache_alignment = c->x86_clflush_size * 2;
 		__set_bit(X86_FEATURE_CONSTANT_TSC, c->x86_capability);
 	}
@@ -50,7 +50,7 @@ static void init_c3(struct cpuinfo_x86 *c)
 
 static void cf_check init_centaur(struct cpuinfo_x86 *c)
 {
-	if (c->x86 == 6)
+	if (c->family == 6)
 		init_c3(c);
 }
 
diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index e063fe790a..3738109a99 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -338,8 +338,8 @@ void __init early_cpu_init(bool verbose)
 	*(u32 *)&c->x86_vendor_id[8] = ecx;
 	*(u32 *)&c->x86_vendor_id[4] = edx;
 
-	c->x86_vendor = x86_cpuid_lookup_vendor(ebx, ecx, edx);
-	switch (c->x86_vendor) {
+	c->vendor = x86_cpuid_lookup_vendor(ebx, ecx, edx);
+	switch (c->vendor) {
 	case X86_VENDOR_INTEL:    intel_unlock_cpuid_leaves(c);
 				  actual_cpu = intel_cpu_dev;    break;
 	case X86_VENDOR_AMD:      actual_cpu = amd_cpu_dev;      break;
@@ -356,7 +356,7 @@ void __init early_cpu_init(bool verbose)
 	}
 
 	cpuid(0x00000001, &eax, &ebx, &ecx, &edx);
-	c->x86 = get_cpu_family(eax, &c->x86_model, &c->x86_mask);
+	c->family = get_cpu_family(eax, &c->model, &c->stepping);
 
 	edx &= ~cleared_caps[FEATURESET_1d];
 	ecx &= ~cleared_caps[FEATURESET_1c];
@@ -400,8 +400,8 @@ void __init early_cpu_init(bool verbose)
 		printk(XENLOG_INFO
 		       "CPU Vendor: %s, Family %u (%#x), "
 		       "Model %u (%#x), Stepping %u (raw %08x)\n",
-		       x86_cpuid_vendor_to_str(c->x86_vendor), c->x86,
-		       c->x86, c->x86_model, c->x86_model, c->x86_mask,
+		       x86_cpuid_vendor_to_str(c->vendor), c->family,
+		       c->family, c->model, c->model, c->stepping,
 		       eax);
 
 	if (c->cpuid_level >= 7) {
@@ -442,7 +442,7 @@ void __init early_cpu_init(bool verbose)
 		paddr_bits -= (ebx >> 6) & 0x3f;
 	}
 
-	if (!(c->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)))
+	if (!(c->vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)))
 		park_offline_cpus = opt_mce;
 
 	initialize_cpu_data(0);
@@ -452,10 +452,10 @@ void reset_cpuinfo(struct cpuinfo_x86 *c, bool keep_basic)
 {
     if ( !keep_basic )
     {
-        c->x86_vendor = 0;
-        c->x86 = 0;
-        c->x86_model = 0;
-        c->x86_mask = 0;
+        c->vendor = 0;
+        c->family = 0;
+        c->model = 0;
+        c->stepping = 0;
         memset(&c->x86_capability, 0, sizeof(c->x86_capability));
         memset(&c->x86_vendor_id, 0, sizeof(c->x86_vendor_id));
         memset(&c->x86_model_id, 0, sizeof(c->x86_model_id));
@@ -474,18 +474,18 @@ static void generic_identify(struct cpuinfo_x86 *c)
 	*(u32 *)&c->x86_vendor_id[8] = ecx;
 	*(u32 *)&c->x86_vendor_id[4] = edx;
 
-	c->x86_vendor = x86_cpuid_lookup_vendor(ebx, ecx, edx);
-	if (boot_cpu_data.x86_vendor != c->x86_vendor)
+	c->vendor = x86_cpuid_lookup_vendor(ebx, ecx, edx);
+	if (boot_cpu_data.vendor != c->vendor)
 		printk(XENLOG_ERR "CPU%u vendor %u mismatch against BSP %u\n",
-		       smp_processor_id(), c->x86_vendor,
-		       boot_cpu_data.x86_vendor);
+		       smp_processor_id(), c->vendor,
+		       boot_cpu_data.vendor);
 
 	/* Initialize the standard set of capabilities */
 	/* Note that the vendor-specific code below might override */
 
 	/* Model and family information. */
 	cpuid(1, &eax, &ebx, &ecx, &edx);
-	c->x86 = get_cpu_family(eax, &c->x86_model, &c->x86_mask);
+	c->family = get_cpu_family(eax, &c->model, &c->stepping);
 	c->apicid = phys_pkg_id((ebx >> 24) & 0xFF, 0);
 	c->phys_proc_id = c->apicid;
 
@@ -610,7 +610,7 @@ void identify_cpu(struct cpuinfo_x86 *c)
 	if ( !c->x86_model_id[0] ) {
 		/* Last resort... */
 		snprintf(c->x86_model_id, sizeof(c->x86_model_id),
-			"%02x/%02x", c->x86_vendor, c->x86_model);
+			"%02x/%02x", c->vendor, c->model);
 	}
 
 	/* Now the feature flags better reflect actual CPU features! */
@@ -829,16 +829,16 @@ void print_cpu_info(unsigned int cpu)
 
 	printk("CPU%u: ", cpu);
 
-	vendor = x86_cpuid_vendor_to_str(c->x86_vendor);
+	vendor = x86_cpuid_vendor_to_str(c->vendor);
 	if (strncmp(c->x86_model_id, vendor, strlen(vendor)))
 		printk("%s ", vendor);
 
 	if (!c->x86_model_id[0])
-		printk("%d86", c->x86);
+		printk("%d86", c->family);
 	else
 		printk("%s", c->x86_model_id);
 
-	printk(" stepping %02x\n", c->x86_mask);
+	printk(" stepping %02x\n", c->stepping);
 }
 
 static cpumask_t cpu_initialized;
diff --git a/xen/arch/x86/cpu/hygon.c b/xen/arch/x86/cpu/hygon.c
index f7508cc8fc..f454fbef33 100644
--- a/xen/arch/x86/cpu/hygon.c
+++ b/xen/arch/x86/cpu/hygon.c
@@ -36,12 +36,12 @@ static void cf_check init_hygon(struct cpuinfo_x86 *c)
 
 	/* Probe for NSCB on Zen2 CPUs when not virtualised */
 	if (!cpu_has_hypervisor && !cpu_has_nscb && c == &boot_cpu_data &&
-	    c->x86 == 0x18)
+	    c->family == 0x18)
 		detect_zen2_null_seg_behaviour();
 
 	/*
 	 * TODO: Check heuristic safety with Hygon first
-	if (c->x86 == 0x18)
+	if (c->family == 0x18)
 		amd_init_spectral_chicken();
 	 */
 
diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
index 29144ffe37..60bb1a5ae7 100644
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -86,7 +86,7 @@ static void __init check_memory_type_self_snoop_errata(void)
 	if (!boot_cpu_has(X86_FEATURE_SS))
 		return;
 
-	switch (boot_cpu_data.x86_model) {
+	switch (boot_cpu_data.model) {
 	case 0x0f: /* Merom */
 	case 0x16: /* Merom L */
 	case 0x17: /* Penryn */
@@ -137,10 +137,10 @@ static void __init probe_masking_msrs(void)
 	unsigned int exp_msr_basic, exp_msr_ext, exp_msr_xsave;
 
 	/* Only family 6 supports this feature. */
-	if (c->x86 != 6)
+	if (c->family != 6)
 		return;
 
-	switch (c->x86_model) {
+	switch (c->model) {
 	case 0x17: /* Yorkfield, Wolfdale, Penryn, Harpertown(DP) */
 	case 0x1d: /* Dunnington(MP) */
 		msr_basic = MSR_INTEL_MASK_V1_CPUID1;
@@ -191,7 +191,7 @@ static void __init probe_masking_msrs(void)
 	       expected_levelling_cap, levelling_caps,
 	       (expected_levelling_cap ^ levelling_caps) & levelling_caps);
 	printk(XENLOG_WARNING "Fam %#x, model %#x expected (%#x/%#x/%#x), "
-	       "got (%#x/%#x/%#x)\n", c->x86, c->x86_model,
+	       "got (%#x/%#x/%#x)\n", c->family, c->model,
 	       exp_msr_basic, exp_msr_ext, exp_msr_xsave,
 	       msr_basic, msr_ext, msr_xsave);
 	printk(XENLOG_WARNING
@@ -265,7 +265,7 @@ static void __init noinline intel_init_levelling(void)
 	 * so skip it altogether. In the case where Xen is virtualized these
 	 * MSRs may be emulated though, so we allow it in that case.
 	 */
-	if ((boot_cpu_data.x86 != 0xf || cpu_has_hypervisor) &&
+	if ((boot_cpu_data.family != 0xf || cpu_has_hypervisor) &&
 	    probe_cpuid_faulting()) {
 		expected_levelling_cap |= LCAP_faulting;
 		levelling_caps |= LCAP_faulting;
@@ -348,7 +348,7 @@ void intel_unlock_cpuid_leaves(struct cpuinfo_x86 *c)
 static void cf_check early_init_intel(struct cpuinfo_x86 *c)
 {
 	/* Netburst reports 64 bytes clflush size, but does IO in 128 bytes */
-	if (c->x86 == 15 && c->x86_cache_alignment == 64)
+	if (c->family == 15 && c->x86_cache_alignment == 64)
 		c->x86_cache_alignment = 128;
 
 	if (c == &boot_cpu_data &&
@@ -358,8 +358,8 @@ static void cf_check early_init_intel(struct cpuinfo_x86 *c)
 	intel_unlock_cpuid_leaves(c);
 
 	/* CPUID workaround for Intel 0F33/0F34 CPU */
-	if (boot_cpu_data.x86 == 0xF && boot_cpu_data.x86_model == 3 &&
-	    (boot_cpu_data.x86_mask == 3 || boot_cpu_data.x86_mask == 4))
+	if (boot_cpu_data.vfm == INTEL_P4_PRESCOTT &&
+	    (boot_cpu_data.stepping == 3 || boot_cpu_data.stepping == 4))
 		paddr_bits = 36;
 
 	if (c == &boot_cpu_data) {
@@ -458,7 +458,7 @@ static void Intel_errata_workarounds(struct cpuinfo_x86 *c)
 {
 	unsigned long lo, hi;
 
-	if ((c->x86 == 15) && (c->x86_model == 1) && (c->x86_mask == 1)) {
+	if ( c->vfm == INTEL_P4_WILLAMETTE && c->stepping == 1 ) {
 		rdmsr (MSR_IA32_MISC_ENABLE, lo, hi);
 		if ((lo & (1<<9)) == 0) {
 			printk (KERN_INFO "CPU: C0 stepping P4 Xeon detected.\n");
@@ -468,8 +468,8 @@ static void Intel_errata_workarounds(struct cpuinfo_x86 *c)
 		}
 	}
 
-	if (c->x86 == 6 && cpu_has_clflush &&
-	    (c->x86_model == 29 || c->x86_model == 46 || c->x86_model == 47))
+	if (c->family == 6 && cpu_has_clflush &&
+	    (c->model == 29 || c->model == 46 || c->model == 47))
 		setup_force_cpu_cap(X86_BUG_CLFLUSH_MONITOR);
 
 	probe_c3_errata(c);
@@ -540,7 +540,7 @@ static void intel_log_freq(const struct cpuinfo_x86 *c)
         }
     }
 
-    switch ( c->x86 )
+    switch ( c->family )
     {
         static const unsigned short core_factors[] =
             { 26667, 13333, 20000, 16667, 33333, 10000, 40000 };
@@ -553,7 +553,7 @@ static void intel_log_freq(const struct cpuinfo_x86 *c)
         if ( !max_ratio )
             return;
 
-        switch ( c->x86_model )
+        switch ( c->model )
         {
         case 0x0e: /* Core */
         case 0x0f: case 0x16: case 0x17: case 0x1d: /* Core2 */
@@ -657,8 +657,8 @@ static void cf_check init_intel(struct cpuinfo_x86 *c)
 	/* Work around errata */
 	Intel_errata_workarounds(c);
 
-	if ((c->x86 == 0xf && c->x86_model >= 0x03) ||
-		(c->x86 == 0x6 && c->x86_model >= 0x0e))
+	if ((c->family == 0xf && c->model >= 0x03) ||
+		(c->family == 0x6 && c->model >= 0x0e))
 		__set_bit(X86_FEATURE_CONSTANT_TSC, c->x86_capability);
 	if (cpu_has(c, X86_FEATURE_ITSC)) {
 		__set_bit(X86_FEATURE_CONSTANT_TSC, c->x86_capability);
diff --git a/xen/arch/x86/cpu/intel_cacheinfo.c b/xen/arch/x86/cpu/intel_cacheinfo.c
index e88faa7545..a81d0764fb 100644
--- a/xen/arch/x86/cpu/intel_cacheinfo.c
+++ b/xen/arch/x86/cpu/intel_cacheinfo.c
@@ -168,15 +168,15 @@ void init_intel_cacheinfo(struct cpuinfo_x86 *c)
 	 * Don't use cpuid2 if cpuid4 is supported. For P4, we use cpuid2 for
 	 * trace cache
 	 */
-	if ((num_cache_leaves == 0 || c->x86 == 15) && c->cpuid_level > 1 &&
-	    c->x86_vendor != X86_VENDOR_SHANGHAI)
+	if ((num_cache_leaves == 0 || c->family == 15) && c->cpuid_level > 1 &&
+	    c->vendor != X86_VENDOR_SHANGHAI)
 	{
 		/* supports eax=2  call */
 		unsigned int i, j, n, regs[4];
 		unsigned char *dp = (unsigned char *)regs;
 		int only_trace = 0;
 
-		if (num_cache_leaves != 0 && c->x86 == 15)
+		if (num_cache_leaves != 0 && c->family == 15)
 			only_trace = 1;
 
 		/* Number of times to iterate */
diff --git a/xen/arch/x86/cpu/mcheck/amd_nonfatal.c b/xen/arch/x86/cpu/mcheck/amd_nonfatal.c
index 7d48c9ab5f..fb52639e13 100644
--- a/xen/arch/x86/cpu/mcheck/amd_nonfatal.c
+++ b/xen/arch/x86/cpu/mcheck/amd_nonfatal.c
@@ -191,7 +191,7 @@ static void cf_check mce_amd_work_fn(void *data)
 
 void __init amd_nonfatal_mcheck_init(struct cpuinfo_x86 *c)
 {
-	if (!(c->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)))
+	if (!(c->vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)))
 		return;
 
 	/* Assume we are on K8 or newer AMD or Hygon CPU here */
diff --git a/xen/arch/x86/cpu/mcheck/mcaction.c b/xen/arch/x86/cpu/mcheck/mcaction.c
index bf7a0de965..236424569a 100644
--- a/xen/arch/x86/cpu/mcheck/mcaction.c
+++ b/xen/arch/x86/cpu/mcheck/mcaction.c
@@ -101,7 +101,7 @@ mc_memerr_dhandler(struct mca_binfo *binfo,
                       * not always precise. In that case, fallback to broadcast.
                       */
                      global->mc_domid != bank->mc_domid ||
-                     (boot_cpu_data.x86_vendor == X86_VENDOR_INTEL &&
+                     (boot_cpu_data.vendor == X86_VENDOR_INTEL &&
                       (!(global->mc_gstatus & MCG_STATUS_LMCE) ||
                        !(d->vcpu[mc_vcpuid]->arch.vmce.mcg_ext_ctl &
                          MCG_EXT_CTL_LMCE_EN))) )
diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.c
index bbc0d24732..8ebaae242e 100644
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -334,7 +334,7 @@ mcheck_mca_logout(enum mca_source who, struct mca_banks *bankmask,
                 mca_init_global(mc_flags, mig);
                 /* A hook here to get global extended msrs */
                 if ( IS_ENABLED(CONFIG_INTEL) &&
-                     boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
+                     boot_cpu_data.vendor == X86_VENDOR_INTEL )
                     intel_get_extended_msrs(mig, mci);
             }
         }
@@ -564,8 +564,8 @@ bool mce_available(const struct cpuinfo_x86 *c)
  */
 unsigned int mce_firstbank(struct cpuinfo_x86 *c)
 {
-    return c->x86 == 6 &&
-           c->x86_vendor == X86_VENDOR_INTEL && c->x86_model < 0x1a;
+    return c->family == 6 &&
+           c->vendor == X86_VENDOR_INTEL && c->model < 0x1a;
 }
 
 static int show_mca_info(int inited, struct cpuinfo_x86 *c)
@@ -596,7 +596,7 @@ static int show_mca_info(int inited, struct cpuinfo_x86 *c)
         case mcheck_amd_famXX:
         case mcheck_hygon:
             printk("%s%s Fam%xh machine check reporting enabled\n",
-                   prefix, type_str[inited], c->x86);
+                   prefix, type_str[inited], c->family);
             break;
 
         case mcheck_none:
@@ -766,7 +766,7 @@ void mcheck_init(struct cpuinfo_x86 *c, bool bsp)
     else if ( cpu_bank_alloc(cpu) )
         panic("Insufficient memory for MCE bank allocations\n");
 
-    switch ( c->x86_vendor )
+    switch ( c->vendor )
     {
 #ifdef CONFIG_AMD
     case X86_VENDOR_AMD:
@@ -777,7 +777,7 @@ void mcheck_init(struct cpuinfo_x86 *c, bool bsp)
 
 #ifdef CONFIG_INTEL
     case X86_VENDOR_INTEL:
-        switch ( c->x86 )
+        switch ( c->family )
         {
         case 6:
         case 15:
@@ -866,7 +866,7 @@ static void x86_mcinfo_apei_save(
     memset(&m, 0, sizeof(struct mce));
 
     m.cpu = mc_global->mc_coreid;
-    m.cpuvendor = boot_cpu_data.x86_vendor;
+    m.cpuvendor = boot_cpu_data.vendor;
     m.cpuid = cpuid_eax(1);
     m.socketid = mc_global->mc_socketid;
     m.apicid = mc_global->mc_apicid;
@@ -967,10 +967,10 @@ static void cf_check __maybe_unused do_mc_get_cpu_info(void *v)
                         &xcp->mc_apicid, &xcp->mc_ncores,
                         &xcp->mc_ncores_active, &xcp->mc_nthreads);
     xcp->mc_cpuid_level = c->cpuid_level;
-    xcp->mc_family = c->x86;
-    xcp->mc_vendor = c->x86_vendor;
-    xcp->mc_model = c->x86_model;
-    xcp->mc_step = c->x86_mask;
+    xcp->mc_family = c->family;
+    xcp->mc_vendor = c->vendor;
+    xcp->mc_model = c->model;
+    xcp->mc_step = c->stepping;
     xcp->mc_cache_size = c->x86_cache_size;
     xcp->mc_cache_alignment = c->x86_cache_alignment;
     memcpy(xcp->mc_vendorid, c->x86_vendor_id, sizeof xcp->mc_vendorid);
@@ -1126,7 +1126,7 @@ static bool __maybe_unused x86_mc_msrinject_verify(struct xen_mc_msrinject *mci)
 
         if ( IS_MCA_BANKREG(reg, mci->mcinj_cpunr) )
         {
-            if ( c->x86_vendor == X86_VENDOR_AMD )
+            if ( c->vendor == X86_VENDOR_AMD )
             {
                 /*
                  * On AMD we can set MCi_STATUS_WREN in the
@@ -1161,15 +1161,15 @@ static bool __maybe_unused x86_mc_msrinject_verify(struct xen_mc_msrinject *mci)
             case MSR_F10_MC4_MISC1:
             case MSR_F10_MC4_MISC2:
             case MSR_F10_MC4_MISC3:
-                if ( c->x86_vendor != X86_VENDOR_AMD )
+                if ( c->vendor != X86_VENDOR_AMD )
                     reason = "only supported on AMD";
-                else if ( c->x86 < 0x10 )
+                else if ( c->family < 0x10 )
                     reason = "only supported on AMD Fam10h+";
                 break;
 
             /* MSRs that the HV will take care of */
             case MSR_K8_HWCR:
-                if ( c->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
+                if ( c->vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
                     reason = "HV will operate HWCR";
                 else
                     reason = "only supported on AMD or Hygon";
diff --git a/xen/arch/x86/cpu/mcheck/mce.h b/xen/arch/x86/cpu/mcheck/mce.h
index eba4b536c7..5c50453cb5 100644
--- a/xen/arch/x86/cpu/mcheck/mce.h
+++ b/xen/arch/x86/cpu/mcheck/mce.h
@@ -136,7 +136,7 @@ void x86_mcinfo_dump(struct mc_info *mi);
 
 static inline int mce_vendor_bank_msr(const struct vcpu *v, uint32_t msr)
 {
-    switch (boot_cpu_data.x86_vendor) {
+    switch (boot_cpu_data.vendor) {
     case X86_VENDOR_INTEL:
         if (msr >= MSR_IA32_MC0_CTL2 &&
             msr < MSR_IA32_MCx_CTL2(v->arch.vmce.mcg_cap & MCG_CAP_COUNT) )
diff --git a/xen/arch/x86/cpu/mcheck/mce_amd.c b/xen/arch/x86/cpu/mcheck/mce_amd.c
index 4f06a3153b..690c72c455 100644
--- a/xen/arch/x86/cpu/mcheck/mce_amd.c
+++ b/xen/arch/x86/cpu/mcheck/mce_amd.c
@@ -160,17 +160,17 @@ mcequirk_lookup_amd_quirkdata(const struct cpuinfo_x86 *c)
 {
     unsigned int i;
 
-    BUG_ON(c->x86_vendor != X86_VENDOR_AMD);
+    BUG_ON(c->vendor != X86_VENDOR_AMD);
 
     for ( i = 0; i < ARRAY_SIZE(mce_amd_quirks); i++ )
     {
-        if ( c->x86 != mce_amd_quirks[i].cpu_family )
+        if ( c->family != mce_amd_quirks[i].cpu_family )
             continue;
         if ( (mce_amd_quirks[i].cpu_model != ANY) &&
-             (mce_amd_quirks[i].cpu_model != c->x86_model) )
+             (mce_amd_quirks[i].cpu_model != c->model) )
             continue;
         if ( (mce_amd_quirks[i].cpu_stepping != ANY) &&
-             (mce_amd_quirks[i].cpu_stepping != c->x86_mask) )
+             (mce_amd_quirks[i].cpu_stepping != c->stepping) )
                 continue;
         return mce_amd_quirks[i].quirk;
     }
@@ -291,13 +291,13 @@ amd_mcheck_init(const struct cpuinfo_x86 *c, bool bsp)
     uint32_t i;
     enum mcequirk_amd_flags quirkflag = 0;
 
-    if ( c->x86_vendor != X86_VENDOR_HYGON )
+    if ( c->vendor != X86_VENDOR_HYGON )
         quirkflag = mcequirk_lookup_amd_quirkdata(c);
 
     /* Assume that machine check support is available.
      * The minimum provided support is at least the K8. */
     if ( bsp )
-        mce_handler_init(c->x86 == 0xf ? &k8_callbacks : &k10_callbacks);
+        mce_handler_init(c->family == 0xf ? &k8_callbacks : &k10_callbacks);
 
     for ( i = 0; i < this_cpu(nr_mce_banks); i++ )
     {
@@ -311,7 +311,7 @@ amd_mcheck_init(const struct cpuinfo_x86 *c, bool bsp)
         }
     }
 
-    if ( c->x86 == 0xf )
+    if ( c->family == 0xf )
         return mcheck_amd_k8;
 
     if ( quirkflag == MCEQUIRK_F10_GART )
@@ -337,6 +337,6 @@ amd_mcheck_init(const struct cpuinfo_x86 *c, bool bsp)
             ppin_msr = MSR_AMD_PPIN;
     }
 
-    return c->x86_vendor == X86_VENDOR_HYGON ?
+    return c->vendor == X86_VENDOR_HYGON ?
             mcheck_hygon : mcheck_amd_famXX;
 }
diff --git a/xen/arch/x86/cpu/mcheck/mce_intel.c b/xen/arch/x86/cpu/mcheck/mce_intel.c
index 1e52b1ac25..c266c4e3b9 100644
--- a/xen/arch/x86/cpu/mcheck/mce_intel.c
+++ b/xen/arch/x86/cpu/mcheck/mce_intel.c
@@ -709,8 +709,7 @@ static bool mce_is_broadcast(struct cpuinfo_x86 *c)
      * DisplayFamily_DisplayModel encoding of 06H_EH and above,
      * a MCA signal is broadcast to all logical processors in the system
      */
-    if ( c->x86_vendor == X86_VENDOR_INTEL && c->x86 == 6 &&
-         c->x86_model >= 0xe )
+    if ( c->vendor == X86_VENDOR_INTEL && c->family == 6 && c->model >= 0xe )
         return true;
     return false;
 }
@@ -858,7 +857,7 @@ static void intel_init_ppin(const struct cpuinfo_x86 *c)
      * other purposes.  Despite the late addition of a CPUID bit (rendering
      * the MSR architectural), keep using the same detection logic there.
      */
-    switch ( c->x86_model )
+    switch ( c->model )
     {
         uint64_t val;
 
diff --git a/xen/arch/x86/cpu/mcheck/non-fatal.c b/xen/arch/x86/cpu/mcheck/non-fatal.c
index a9ee9bb94f..4e7c64abef 100644
--- a/xen/arch/x86/cpu/mcheck/non-fatal.c
+++ b/xen/arch/x86/cpu/mcheck/non-fatal.c
@@ -23,7 +23,7 @@ static int __init cf_check init_nonfatal_mce_checker(void)
 	/*
 	 * Check for non-fatal errors every MCE_RATE s
 	 */
-	switch (c->x86_vendor) {
+	switch (c->vendor) {
 #ifdef CONFIG_AMD
 	case X86_VENDOR_AMD:
 	case X86_VENDOR_HYGON:
diff --git a/xen/arch/x86/cpu/mcheck/vmce.c b/xen/arch/x86/cpu/mcheck/vmce.c
index 5abdf4cb5f..bef4eedb31 100644
--- a/xen/arch/x86/cpu/mcheck/vmce.c
+++ b/xen/arch/x86/cpu/mcheck/vmce.c
@@ -45,7 +45,7 @@ void vmce_init_vcpu(struct vcpu *v)
     int i;
 
     /* global MCA MSRs init */
-    if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
+    if ( boot_cpu_data.vendor == X86_VENDOR_INTEL )
         v->arch.vmce.mcg_cap = INTEL_GUEST_MCG_CAP;
     else
         v->arch.vmce.mcg_cap = AMD_GUEST_MCG_CAP;
@@ -63,7 +63,7 @@ int vmce_restore_vcpu(struct vcpu *v, const struct hvm_vmce_vcpu *ctxt)
 {
     unsigned long guest_mcg_cap;
 
-    if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
+    if ( boot_cpu_data.vendor == X86_VENDOR_INTEL )
         guest_mcg_cap = INTEL_GUEST_MCG_CAP | MCG_LMCE_P;
     else
         guest_mcg_cap = AMD_GUEST_MCG_CAP;
@@ -136,7 +136,7 @@ static int bank_mce_rdmsr(const struct vcpu *v, uint32_t msr, uint64_t *val)
         break;
 
     default:
-        switch ( boot_cpu_data.x86_vendor )
+        switch ( boot_cpu_data.vendor )
         {
 #ifdef CONFIG_INTEL
         case X86_VENDOR_CENTAUR:
@@ -273,7 +273,7 @@ static int bank_mce_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
         break;
 
     default:
-        switch ( boot_cpu_data.x86_vendor )
+        switch ( boot_cpu_data.vendor )
         {
 #ifdef CONFIG_INTEL
         case X86_VENDOR_INTEL:
diff --git a/xen/arch/x86/cpu/mtrr/generic.c b/xen/arch/x86/cpu/mtrr/generic.c
index c587e9140e..190be7f1b4 100644
--- a/xen/arch/x86/cpu/mtrr/generic.c
+++ b/xen/arch/x86/cpu/mtrr/generic.c
@@ -218,9 +218,9 @@ static void __init print_mtrr_state(const char *level)
 			printk("%s  %u disabled\n", level, i);
 	}
 
-	if ((boot_cpu_data.x86_vendor == X86_VENDOR_AMD &&
-	     boot_cpu_data.x86 >= 0xf) ||
-	     boot_cpu_data.x86_vendor == X86_VENDOR_HYGON) {
+	if ((boot_cpu_data.vendor == X86_VENDOR_AMD &&
+	     boot_cpu_data.family >= 0xf) ||
+	     boot_cpu_data.vendor == X86_VENDOR_HYGON) {
 		uint64_t syscfg, tom2;
 
 		rdmsrl(MSR_K8_SYSCFG, syscfg);
diff --git a/xen/arch/x86/cpu/mwait-idle.c b/xen/arch/x86/cpu/mwait-idle.c
index f47fdfb569..37322c46c0 100644
--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -1637,7 +1637,7 @@ static int __init mwait_idle_probe(void)
 		lapic_timer_reliable_states = LAPIC_TIMER_ALWAYS_RELIABLE;
 
 	pr_debug(PREFIX "v" MWAIT_IDLE_VERSION " model %#x\n",
-		 boot_cpu_data.x86_model);
+		 boot_cpu_data.model);
 
 	pr_debug(PREFIX "lapic_timer_reliable_states %#x\n",
 		 lapic_timer_reliable_states);
@@ -1816,7 +1816,7 @@ bool __init mwait_pc10_supported(void)
 {
 	unsigned int ecx, edx, dummy;
 
-	if (boot_cpu_data.x86_vendor != X86_VENDOR_INTEL ||
+	if (boot_cpu_data.vendor != X86_VENDOR_INTEL ||
 	    !cpu_has_monitor ||
 	    boot_cpu_data.cpuid_level < CPUID_MWAIT_LEAF)
 		return false;
diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
index c28192ea26..64328bdf3f 100644
--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -398,7 +398,7 @@ int vpmu_load(struct vcpu *v, bool from_guest)
 static int vpmu_arch_initialise(struct vcpu *v)
 {
     struct vpmu_struct *vpmu = vcpu_vpmu(v);
-    uint8_t vendor = current_cpu_data.x86_vendor;
+    uint8_t vendor = current_cpu_data.vendor;
     int ret;
 
     BUILD_BUG_ON(sizeof(struct xen_pmu_intel_ctxt) > XENPMU_CTXT_PAD_SZ);
@@ -815,7 +815,7 @@ static struct notifier_block cpu_nfb = {
 
 static int __init cf_check vpmu_init(void)
 {
-    int vendor = current_cpu_data.x86_vendor;
+    int vendor = current_cpu_data.vendor;
     const struct arch_vpmu_ops *ops = NULL;
 
     if ( !opt_vpmu_enabled )
diff --git a/xen/arch/x86/cpu/vpmu_amd.c b/xen/arch/x86/cpu/vpmu_amd.c
index a6117dfebf..16d8d8cef3 100644
--- a/xen/arch/x86/cpu/vpmu_amd.c
+++ b/xen/arch/x86/cpu/vpmu_amd.c
@@ -538,7 +538,7 @@ static const struct arch_vpmu_ops *__init common_init(void)
     if ( !num_counters )
     {
         printk(XENLOG_WARNING "VPMU: Unsupported CPU family %#x\n",
-               current_cpu_data.x86);
+               current_cpu_data.family);
         return ERR_PTR(-EINVAL);
     }
 
@@ -563,7 +563,7 @@ static const struct arch_vpmu_ops *__init common_init(void)
 
 const struct arch_vpmu_ops *__init amd_vpmu_init(void)
 {
-    switch ( current_cpu_data.x86 )
+    switch ( current_cpu_data.family )
     {
     case 0x15:
     case 0x17:
@@ -591,7 +591,7 @@ const struct arch_vpmu_ops *__init amd_vpmu_init(void)
 
 const struct arch_vpmu_ops *__init hygon_vpmu_init(void)
 {
-    switch ( current_cpu_data.x86 )
+    switch ( current_cpu_data.family )
     {
     case 0x18:
         num_counters = F15H_NUM_COUNTERS;
diff --git a/xen/arch/x86/cpu/vpmu_intel.c b/xen/arch/x86/cpu/vpmu_intel.c
index 7ce98ee42e..bc9d871056 100644
--- a/xen/arch/x86/cpu/vpmu_intel.c
+++ b/xen/arch/x86/cpu/vpmu_intel.c
@@ -923,7 +923,7 @@ const struct arch_vpmu_ops *__init core2_vpmu_init(void)
         return ERR_PTR(-EINVAL);
     }
 
-    if ( current_cpu_data.x86 != 6 )
+    if ( current_cpu_data.family != 6 )
     {
         printk(XENLOG_WARNING "VPMU: only family 6 is supported\n");
         return ERR_PTR(-EINVAL);
@@ -964,7 +964,7 @@ const struct arch_vpmu_ops *__init core2_vpmu_init(void)
               sizeof(struct xen_pmu_cntr_pair) * arch_pmc_cnt;
 
     /* TODO: It's clearly incorrect for this to quirk all Intel Fam6 CPUs. */
-    pmc_quirk = current_cpu_data.x86 == 6;
+    pmc_quirk = current_cpu_data.family == 6;
 
     if ( sizeof(struct xen_pmu_data) + sizeof(uint64_t) * fixed_pmc_cnt +
          sizeof(struct xen_pmu_cntr_pair) * arch_pmc_cnt > PAGE_SIZE )
diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 8dc68945f7..cd7df0f117 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -434,7 +434,7 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
 
     case 0xa:
         /* TODO: Rework vPMU control in terms of toolstack choices. */
-        if ( boot_cpu_data.x86_vendor != X86_VENDOR_INTEL ||
+        if ( boot_cpu_data.vendor != X86_VENDOR_INTEL ||
              !vpmu_available(v) )
             *res = EMPTY_LEAF;
         else
diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 0b467fd4a4..864dd9e53e 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -572,10 +572,10 @@ int __init dom0_setup_permissions(struct domain *d)
             rc |= iomem_deny_access(d, mfn, mfn);
     }
     /* HyperTransport range. */
-    if ( boot_cpu_data.x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
+    if ( boot_cpu_data.vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
     {
         mfn = paddr_to_pfn(1UL <<
-                           (boot_cpu_data.x86 < 0x17 ? 40 : paddr_bits));
+                           (boot_cpu_data.family < 0x17 ? 40 : paddr_bits));
         rc |= iomem_deny_access(d, mfn - paddr_to_pfn(3UL << 32), mfn - 1);
     }
 
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 56c3816187..234e828bb3 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -317,7 +317,7 @@ void domain_cpu_policy_changed(struct domain *d)
             if ( cpu_has_htt )
                 edx |= cpufeat_mask(X86_FEATURE_HTT);
 
-            switch ( boot_cpu_data.x86_vendor )
+            switch ( boot_cpu_data.vendor )
             {
             case X86_VENDOR_INTEL:
                 /*
@@ -370,7 +370,7 @@ void domain_cpu_policy_changed(struct domain *d)
         {
             uint64_t mask = cpuidmask_defaults._6c;
 
-            if ( boot_cpu_data.x86_vendor == X86_VENDOR_AMD )
+            if ( boot_cpu_data.vendor == X86_VENDOR_AMD )
                 mask &= (~0ULL << 32) | p->basic.raw[6].c;
 
             d->arch.pv.cpuidmasks->_6c = mask;
@@ -385,7 +385,7 @@ void domain_cpu_policy_changed(struct domain *d)
              * wholesale from the policy, but clamp the features in 7[0].ebx
              * per usual.
              */
-            if ( boot_cpu_data.x86_vendor &
+            if ( boot_cpu_data.vendor &
                  (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
                 mask = (((uint64_t)p->feat.max_subleaf << 32) |
                         ((uint32_t)mask & p->feat._7b0));
@@ -398,7 +398,7 @@ void domain_cpu_policy_changed(struct domain *d)
             uint64_t mask = cpuidmask_defaults.Da1;
             uint32_t eax = p->xstate.Da1;
 
-            if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
+            if ( boot_cpu_data.vendor == X86_VENDOR_INTEL )
                 mask &= (~0ULL << 32) | eax;
 
             d->arch.pv.cpuidmasks->Da1 = mask;
@@ -425,7 +425,7 @@ void domain_cpu_policy_changed(struct domain *d)
             if ( !(p->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
                 edx &= ~CPUID_COMMON_1D_FEATURES;
 
-            switch ( boot_cpu_data.x86_vendor )
+            switch ( boot_cpu_data.vendor )
             {
             case X86_VENDOR_INTEL:
                 mask &= ((uint64_t)edx << 32) | ecx;
@@ -455,7 +455,7 @@ void domain_cpu_policy_changed(struct domain *d)
         cpu_policy_updated(v);
 
         /* If PMU version is zero then the guest doesn't have VPMU */
-        if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL &&
+        if ( boot_cpu_data.vendor == X86_VENDOR_INTEL &&
              p->basic.pmu_version == 0 )
             vpmu_destroy(v);
     }
diff --git a/xen/arch/x86/e820.c b/xen/arch/x86/e820.c
index ca577c0bde..872208ab37 100644
--- a/xen/arch/x86/e820.c
+++ b/xen/arch/x86/e820.c
@@ -426,7 +426,7 @@ static uint64_t __init mtrr_top_of_ram(void)
 
     /* By default we check only Intel systems. */
     if ( e820_mtrr_clip == -1 )
-        e820_mtrr_clip = boot_cpu_data.x86_vendor == X86_VENDOR_INTEL;
+        e820_mtrr_clip = boot_cpu_data.vendor == X86_VENDOR_INTEL;
 
     if ( !e820_mtrr_clip )
         return 0;
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index cb8ecd050d..2459b43d32 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -3881,7 +3881,7 @@ void hvm_ud_intercept(struct cpu_user_regs *regs)
 {
     struct vcpu *cur = current;
     bool should_emulate =
-        cur->domain->arch.cpuid->x86_vendor != boot_cpu_data.x86_vendor;
+        cur->domain->arch.cpuid->x86_vendor != boot_cpu_data.vendor;
     struct hvm_emulate_ctxt ctxt;
 
     hvm_emulate_init_once(&ctxt, opt_hvm_fep ? NULL : is_cross_vendor, regs);
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index fce750ca1f..c79822787d 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -588,7 +588,7 @@ static void cf_check svm_cpuid_policy_changed(struct vcpu *v)
     u32 bitmap = vmcb_get_exception_intercepts(vmcb);
 
     if ( opt_hvm_fep ||
-         (v->domain->arch.cpuid->x86_vendor != boot_cpu_data.x86_vendor) )
+         (v->domain->arch.cpuid->x86_vendor != boot_cpu_data.vendor) )
         bitmap |= (1U << X86_EXC_UD);
     else
         bitmap &= ~(1U << X86_EXC_UD);
@@ -1053,7 +1053,7 @@ static void svm_guest_osvw_init(struct domain *d)
      * be conservative here and therefore we tell the guest that erratum 298
      * is present (because we really don't know).
      */
-    if ( osvw_length == 0 && boot_cpu_data.x86 == 0x10 )
+    if ( osvw_length == 0 && boot_cpu_data.family == 0x10 )
         svm->osvw.status |= 1;
 
     spin_unlock(&osvw_lock);
@@ -1788,7 +1788,7 @@ static int cf_check svm_msr_read_intercept(
         if ( !rdmsr_safe(msr, *msr_content) )
             break;
 
-        if ( boot_cpu_data.x86 == 0xf )
+        if ( boot_cpu_data.family == 0xf )
         {
             /*
              * Win2k8 x64 reads this MSR on revF chips, where it wasn't
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index ab8b1c87ec..a5eef5970c 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -2145,8 +2145,8 @@ int __init vmx_vmcs_init(void)
 
     if ( opt_ept_ad < 0 )
         /* Work around Erratum AVR41 on Avoton processors. */
-        opt_ept_ad = !(boot_cpu_data.x86 == 6 &&
-                       boot_cpu_data.x86_model == 0x4d);
+        opt_ept_ad = !(boot_cpu_data.family == 6 &&
+                       boot_cpu_data.model == 0x4d);
 
     ret = _vmx_cpu_up(true);
 
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index cb82d52ef0..f441e41531 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -497,10 +497,10 @@ static const struct lbr_info *__ro_after_init model_specific_lbr;
 
 static const struct lbr_info *__init get_model_specific_lbr(void)
 {
-    switch ( boot_cpu_data.x86 )
+    switch ( boot_cpu_data.family )
     {
     case 6:
-        switch ( boot_cpu_data.x86_model )
+        switch ( boot_cpu_data.model )
         {
         /* Core2 Duo */
         case 0x0f:
@@ -556,7 +556,7 @@ static const struct lbr_info *__init get_model_specific_lbr(void)
         break;
 
     case 15:
-        switch ( boot_cpu_data.x86_model )
+        switch ( boot_cpu_data.model )
         {
         /* Pentium4/Xeon with em64t */
         case 3: case 4: case 6:
@@ -792,7 +792,7 @@ static void cf_check vmx_cpuid_policy_changed(struct vcpu *v)
     int rc = 0;
 
     if ( opt_hvm_fep ||
-         (v->domain->arch.cpuid->x86_vendor != boot_cpu_data.x86_vendor) )
+         (v->domain->arch.cpuid->x86_vendor != boot_cpu_data.vendor) )
         v->arch.hvm.vmx.exception_bitmap |= (1U << X86_EXC_UD);
     else
         v->arch.hvm.vmx.exception_bitmap &= ~(1U << X86_EXC_UD);
@@ -2984,11 +2984,11 @@ static bool __init has_if_pschange_mc(void)
      * IF_PSCHANGE_MC is only known to affect Intel Family 6 processors at
      * this time.
      */
-    if ( boot_cpu_data.x86_vendor != X86_VENDOR_INTEL ||
-         boot_cpu_data.x86 != 6 )
+    if ( boot_cpu_data.vendor != X86_VENDOR_INTEL ||
+         boot_cpu_data.family != 6 )
         return false;
 
-    switch ( boot_cpu_data.x86_model )
+    switch ( boot_cpu_data.model )
     {
         /*
          * Core processors since at least Nehalem are vulnerable.
@@ -3047,7 +3047,7 @@ static bool __init has_if_pschange_mc(void)
 
     default:
         printk("Unrecognised CPU model %#x - assuming vulnerable to IF_PSCHANGE_MC\n",
-               boot_cpu_data.x86_model);
+               boot_cpu_data.model);
         return true;
     }
 }
@@ -3336,11 +3336,11 @@ static void __init lbr_tsx_fixup_check(void)
      * fixed up as well.
      */
     if ( cpu_has_hle || cpu_has_rtm ||
-         boot_cpu_data.x86_vendor != X86_VENDOR_INTEL ||
-         boot_cpu_data.x86 != 6 )
+         boot_cpu_data.vendor != X86_VENDOR_INTEL ||
+         boot_cpu_data.family != 6 )
         return;
 
-    switch ( boot_cpu_data.x86_model )
+    switch ( boot_cpu_data.model )
     {
     case 0x3c: /* HSM182, HSD172 - 4th gen Core */
     case 0x3f: /* HSE117 - Xeon E5 v3 */
@@ -3381,11 +3381,11 @@ static void __init ler_to_fixup_check(void)
      * that are not equal to bit[47].  Attempting to context switch this value
      * may cause a #GP.  Software should sign extend the MSR.
      */
-    if ( boot_cpu_data.x86_vendor != X86_VENDOR_INTEL ||
-         boot_cpu_data.x86 != 6 )
+    if ( boot_cpu_data.vendor != X86_VENDOR_INTEL ||
+         boot_cpu_data.family != 6 )
         return;
 
-    switch ( boot_cpu_data.x86_model )
+    switch ( boot_cpu_data.model )
     {
     case 0x3d: /* BDM131 - 5th gen Core */
     case 0x47: /* BDD??? - 5th gen Core (H-Processor line)
diff --git a/xen/arch/x86/i8259.c b/xen/arch/x86/i8259.c
index 5c7e21a751..d2a08661f8 100644
--- a/xen/arch/x86/i8259.c
+++ b/xen/arch/x86/i8259.c
@@ -419,7 +419,7 @@ void __init init_IRQ(void)
          * the interrupt.
          */
         cpumask_copy(desc->arch.cpu_mask,
-                     (boot_cpu_data.x86_vendor &
+                     (boot_cpu_data.vendor &
                       (X86_VENDOR_AMD | X86_VENDOR_HYGON) ? &cpumask_all
                                                           : cpumask_of(cpu)));
         desc->arch.vector = LEGACY_VECTOR(irq);
diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
index 441a7ecc49..0fefb4acb1 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -37,29 +37,16 @@
 #ifndef __ASSEMBLY__
 
 struct cpuinfo_x86 {
-    /* TODO: Phase out the x86 prefixed names. */
     union {
         struct {
-            union {
-                uint8_t x86_model;
-                uint8_t model;
-            };
-            union {
-                uint8_t x86;
-                uint8_t family;
-            };
-            union {
-                uint8_t x86_vendor;
-                uint8_t vendor;
-            };
+            uint8_t model;
+            uint8_t family;
+            uint8_t vendor;
             uint8_t _rsvd;             /* Use of this needs coordinating with VFM_MAKE() */
         };
         uint32_t vfm;                  /* Vendor Family Model */
     };
-    union {
-        uint8_t x86_mask;
-        uint8_t stepping;
-    };
+    uint8_t stepping;
 
     unsigned int cpuid_level;          /* Maximum supported CPUID level */
     unsigned int extended_cpuid_level; /* Maximum supported CPUID extended level */
diff --git a/xen/arch/x86/include/asm/intel-family.h b/xen/arch/x86/include/asm/intel-family.h
index d8c0bcc406..c71e744731 100644
--- a/xen/arch/x86/include/asm/intel-family.h
+++ b/xen/arch/x86/include/asm/intel-family.h
@@ -179,6 +179,10 @@
 #define INTEL_XEON_PHI_KNL		IFM(6, 0x57) /* Knights Landing */
 #define INTEL_XEON_PHI_KNM		IFM(6, 0x85) /* Knights Mill */
 
+/* Family 15 - NetBurst */
+#define INTEL_P4_WILLAMETTE		IFM(15, 0x01) /* Also Xeon Foster */
+#define INTEL_P4_PRESCOTT		IFM(15, 0x03)
+
 /* Family 5 */
 #define INTEL_FAM5_QUARK_X1000		0x09 /* Quark X1000 SoC */
 #define INTEL_QUARK_X1000		IFM(5, 0x09) /* Quark X1000 SoC */
diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index 1816e1c0b9..15d6b855cb 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -1480,7 +1480,7 @@ static void __init setup_ioapic_ids_from_mpc(void)
      * Don't check I/O APIC IDs for xAPIC systems. They have
      * no meaning without the serial APIC bus.
      */
-    if (!(boot_cpu_data.x86_vendor == X86_VENDOR_INTEL)
+    if (!(boot_cpu_data.vendor == X86_VENDOR_INTEL)
         || APIC_XAPIC(apic_version[boot_cpu_physical_apicid]))
         return;
 
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 556134f85a..c1d60395ed 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -1984,8 +1984,8 @@ void do_IRQ(struct cpu_user_regs *regs)
                      * interrupts have been delivered to CPUs
                      * different than the BSP.
                      */
-                    (boot_cpu_data.x86_vendor & (X86_VENDOR_AMD |
-                                                 X86_VENDOR_HYGON))) &&
+                    (boot_cpu_data.vendor & (X86_VENDOR_AMD |
+                                             X86_VENDOR_HYGON))) &&
                    bogus_8259A_irq(vector - FIRST_LEGACY_VECTOR)) )
             {
                 printk("CPU%u: No irq handler for vector %02x (IRQ %d%s)\n",
diff --git a/xen/arch/x86/mpparse.c b/xen/arch/x86/mpparse.c
index e74a714f50..38ba90d1cb 100644
--- a/xen/arch/x86/mpparse.c
+++ b/xen/arch/x86/mpparse.c
@@ -511,9 +511,9 @@ static inline void __init construct_default_ISA_mptable(int mpc_default_type)
 	/* Either an integrated APIC or a discrete 82489DX. */
 	processor.mpc_apicver = mpc_default_type > 4 ? 0x10 : 0x01;
 	processor.mpc_cpuflag = CPU_ENABLED;
-	processor.mpc_cpufeature = (boot_cpu_data.x86 << 8) |
-				   (boot_cpu_data.x86_model << 4) |
-				   boot_cpu_data.x86_mask;
+	processor.mpc_cpufeature = (boot_cpu_data.family << 8) |
+				   (boot_cpu_data.model << 4) |
+				   boot_cpu_data.stepping;
 	processor.mpc_featureflag =
             boot_cpu_data.x86_capability[FEATURESET_1d];
 	processor.mpc_reserved[0] = 0;
@@ -891,7 +891,7 @@ void __init mp_register_ioapic (
 	mp_ioapics[idx].mpc_apicaddr = address;
 
 	set_fixmap_nocache(FIX_IO_APIC_BASE_0 + idx, address);
-	if ((boot_cpu_data.x86_vendor == X86_VENDOR_INTEL)
+	if ((boot_cpu_data.vendor == X86_VENDOR_INTEL)
 		&& !APIC_XAPIC(apic_version[boot_cpu_physical_apicid]))
 		tmpid = io_apic_get_unique_id(idx, id);
 	else
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 2cd46b6c8a..ffee35daed 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -169,7 +169,7 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
 
     case MSR_IA32_PLATFORM_ID:
         if ( !(cp->x86_vendor & X86_VENDOR_INTEL) ||
-             !(boot_cpu_data.x86_vendor & X86_VENDOR_INTEL) )
+             !(boot_cpu_data.vendor & X86_VENDOR_INTEL) )
             goto gp_fault;
         rdmsrl(MSR_IA32_PLATFORM_ID, *val);
         break;
@@ -189,7 +189,7 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
          * the guest.
          */
         if ( !(cp->x86_vendor & (X86_VENDOR_INTEL | X86_VENDOR_AMD)) ||
-             !(boot_cpu_data.x86_vendor &
+             !(boot_cpu_data.vendor &
                (X86_VENDOR_INTEL | X86_VENDOR_AMD)) ||
              rdmsr_safe(MSR_AMD_PATCHLEVEL, *val) )
             goto gp_fault;
diff --git a/xen/arch/x86/nmi.c b/xen/arch/x86/nmi.c
index 9793fa2316..c61167fab8 100644
--- a/xen/arch/x86/nmi.c
+++ b/xen/arch/x86/nmi.c
@@ -216,12 +216,12 @@ void disable_lapic_nmi_watchdog(void)
 {
     if (nmi_active <= 0)
         return;
-    switch (boot_cpu_data.x86_vendor) {
+    switch (boot_cpu_data.vendor) {
     case X86_VENDOR_AMD:
         wrmsr(MSR_K7_EVNTSEL0, 0, 0);
         break;
     case X86_VENDOR_INTEL:
-        switch (boot_cpu_data.x86) {
+        switch (boot_cpu_data.family) {
         case 6:
             wrmsr(MSR_P6_EVNTSEL(0), 0, 0);
             break;
@@ -362,7 +362,7 @@ static void setup_p4_watchdog(void)
         clear_msr_range(0x3F1, 2);
     /* MSR 0x3F0 seems to have a default value of 0xFC00, but current
        docs doesn't fully define it, so leave it alone for now. */
-    if (boot_cpu_data.x86_model >= 0x3) {
+    if (boot_cpu_data.model >= 0x3) {
         /* MSR_P4_IQ_ESCR0/1 (0x3ba/0x3bb) removed */
         clear_msr_range(0x3A0, 26);
         clear_msr_range(0x3BC, 3);
@@ -387,16 +387,16 @@ void setup_apic_nmi_watchdog(void)
     if ( nmi_watchdog == NMI_NONE )
         return;
 
-    switch ( boot_cpu_data.x86_vendor )
+    switch ( boot_cpu_data.vendor )
     {
     case X86_VENDOR_AMD:
         setup_k7_watchdog();
         break;
 
     case X86_VENDOR_INTEL:
-        switch (boot_cpu_data.x86) {
+        switch (boot_cpu_data.family) {
         case 6:
-            setup_p6_watchdog((boot_cpu_data.x86_model < 14) 
+            setup_p6_watchdog((boot_cpu_data.model < 14)
                               ? P6_EVENT_CPU_CLOCKS_NOT_HALTED
                               : CORE_EVENT_CPU_CLOCKS_NOT_HALTED);
             break;
diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
index 3eba791889..65faf2b6f9 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -640,9 +640,9 @@ ret_t do_platform_op(
             const struct cpuinfo_x86 *c = &cpu_data[ver->xen_cpuid];
 
             memcpy(ver->vendor_id, c->x86_vendor_id, sizeof(ver->vendor_id));
-            ver->family = c->x86;
-            ver->model = c->x86_model;
-            ver->stepping = c->x86_mask;
+            ver->family = c->family;
+            ver->model = c->model;
+            ver->stepping = c->stepping;
         }
 
         ver->max_present = cpumask_last(&cpu_present_map);
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index 9334da1dab..b089a1e348 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -173,7 +173,7 @@ static int __init cf_check pge_init(void)
 {
     if ( opt_global_pages == -1 )
         opt_global_pages = !cpu_has_hypervisor ||
-                           !(boot_cpu_data.x86_vendor &
+                           !(boot_cpu_data.vendor &
                              (X86_VENDOR_AMD | X86_VENDOR_HYGON));
 
     return 0;
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index f3f012f8fb..e64ebad938 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -243,8 +243,8 @@ static bool pci_cfg_ok(struct domain *currd, unsigned int start,
     start |= CF8_ADDR_LO(currd->arch.pci_cf8);
     /* AMD extended configuration space access? */
     if ( CF8_ADDR_HI(currd->arch.pci_cf8) &&
-         boot_cpu_data.x86_vendor == X86_VENDOR_AMD &&
-         boot_cpu_data.x86 >= 0x10 && boot_cpu_data.x86 < 0x17 )
+         boot_cpu_data.vendor == X86_VENDOR_AMD &&
+         boot_cpu_data.family >= 0x10 && boot_cpu_data.family < 0x17 )
     {
         uint64_t msr_val;
 
@@ -867,7 +867,7 @@ static uint64_t guest_efer(const struct domain *d)
      */
     if ( is_pv_32bit_domain(d) )
         val &= ~(EFER_LME | EFER_LMA |
-                 (boot_cpu_data.x86_vendor == X86_VENDOR_INTEL
+                 (boot_cpu_data.vendor == X86_VENDOR_INTEL
                   ? EFER_SCE : 0));
     return val;
 }
@@ -942,7 +942,7 @@ static int cf_check read_msr(
     case MSR_K8_PSTATE5:
     case MSR_K8_PSTATE6:
     case MSR_K8_PSTATE7:
-        if ( boot_cpu_data.x86_vendor != X86_VENDOR_AMD )
+        if ( boot_cpu_data.vendor != X86_VENDOR_AMD )
             break;
         if ( unlikely(is_cpufreq_controller(currd)) )
             goto normal;
@@ -950,8 +950,8 @@ static int cf_check read_msr(
         return X86EMUL_OKAY;
 
     case MSR_FAM10H_MMIO_CONF_BASE:
-        if ( boot_cpu_data.x86_vendor != X86_VENDOR_AMD ||
-             boot_cpu_data.x86 < 0x10 || boot_cpu_data.x86 >= 0x17 )
+        if ( boot_cpu_data.vendor != X86_VENDOR_AMD ||
+             boot_cpu_data.family < 0x10 || boot_cpu_data.family >= 0x17 )
             break;
         /* fall through */
     case MSR_AMD64_NB_CFG:
@@ -975,13 +975,13 @@ static int cf_check read_msr(
     case MSR_P6_EVNTSEL(0) ... MSR_P6_EVNTSEL(3):
     case MSR_CORE_PERF_FIXED_CTR0 ... MSR_CORE_PERF_FIXED_CTR2:
     case MSR_CORE_PERF_FIXED_CTR_CTRL ... MSR_CORE_PERF_GLOBAL_OVF_CTRL:
-        if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
+        if ( boot_cpu_data.vendor == X86_VENDOR_INTEL )
         {
             vpmu_msr = true;
             /* fall through */
     case MSR_AMD_FAM15H_EVNTSEL0 ... MSR_AMD_FAM15H_PERFCTR5:
     case MSR_K7_EVNTSEL0 ... MSR_K7_PERFCTR3:
-            if ( vpmu_msr || (boot_cpu_data.x86_vendor &
+            if ( vpmu_msr || (boot_cpu_data.vendor &
                               (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
             {
                 if ( vpmu_do_rdmsr(reg, val) )
@@ -1084,7 +1084,7 @@ static int cf_check write_msr(
     case MSR_K8_PSTATE6:
     case MSR_K8_PSTATE7:
     case MSR_K8_HWCR:
-        if ( !(boot_cpu_data.x86_vendor &
+        if ( !(boot_cpu_data.vendor &
                (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
             break;
         if ( likely(!is_cpufreq_controller(currd)) ||
@@ -1103,8 +1103,8 @@ static int cf_check write_msr(
         break;
 
     case MSR_FAM10H_MMIO_CONF_BASE:
-        if ( boot_cpu_data.x86_vendor != X86_VENDOR_AMD ||
-             boot_cpu_data.x86 < 0x10 || boot_cpu_data.x86 >= 0x17 )
+        if ( boot_cpu_data.vendor != X86_VENDOR_AMD ||
+             boot_cpu_data.family < 0x10 || boot_cpu_data.family >= 0x17 )
             break;
         if ( !is_hwdom_pinned_vcpu(curr) )
             return X86EMUL_OKAY;
@@ -1132,7 +1132,7 @@ static int cf_check write_msr(
 
     case MSR_IA32_MPERF:
     case MSR_IA32_APERF:
-        if ( !(boot_cpu_data.x86_vendor &
+        if ( !(boot_cpu_data.vendor &
                (X86_VENDOR_INTEL | X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
             break;
         if ( likely(!is_cpufreq_controller(currd)) ||
@@ -1142,7 +1142,7 @@ static int cf_check write_msr(
 
     case MSR_IA32_THERM_CONTROL:
     case MSR_IA32_ENERGY_PERF_BIAS:
-        if ( boot_cpu_data.x86_vendor != X86_VENDOR_INTEL )
+        if ( boot_cpu_data.vendor != X86_VENDOR_INTEL )
             break;
         if ( !is_hwdom_pinned_vcpu(curr) || wrmsr_safe(reg, val) == 0 )
             return X86EMUL_OKAY;
@@ -1152,12 +1152,12 @@ static int cf_check write_msr(
     case MSR_P6_EVNTSEL(0) ... MSR_P6_EVNTSEL(3):
     case MSR_CORE_PERF_FIXED_CTR0 ... MSR_CORE_PERF_FIXED_CTR2:
     case MSR_CORE_PERF_FIXED_CTR_CTRL ... MSR_CORE_PERF_GLOBAL_OVF_CTRL:
-        if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
+        if ( boot_cpu_data.vendor == X86_VENDOR_INTEL )
         {
             vpmu_msr = true;
     case MSR_AMD_FAM15H_EVNTSEL0 ... MSR_AMD_FAM15H_PERFCTR5:
     case MSR_K7_EVNTSEL0 ... MSR_K7_PERFCTR3:
-            if ( vpmu_msr || (boot_cpu_data.x86_vendor &
+            if ( vpmu_msr || (boot_cpu_data.vendor &
                               (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
             {
                 if ( (vpmu_mode & XENPMU_MODE_ALL) &&
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 1543dd251c..94e914201c 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1392,7 +1392,7 @@ void asmlinkage __init noreturn __start_xen(void)
          * supervisor shadow stacks are now safe to use.
          */
         bool cpu_has_bug_shstk_fracture =
-            boot_cpu_data.x86_vendor == X86_VENDOR_INTEL &&
+            boot_cpu_data.vendor == X86_VENDOR_INTEL &&
             !boot_cpu_has(X86_FEATURE_CET_SSS);
 
         /*
@@ -2024,10 +2024,10 @@ void asmlinkage __init noreturn __start_xen(void)
 
     /* Do not enable SMEP/SMAP in PV shim on AMD and Hygon by default */
     if ( opt_smep == -1 )
-        opt_smep = !pv_shim || !(boot_cpu_data.x86_vendor &
+        opt_smep = !pv_shim || !(boot_cpu_data.vendor &
                                  (X86_VENDOR_AMD | X86_VENDOR_HYGON));
     if ( opt_smap == -1 )
-        opt_smap = !pv_shim || !(boot_cpu_data.x86_vendor &
+        opt_smap = !pv_shim || !(boot_cpu_data.vendor &
                                  (X86_VENDOR_AMD | X86_VENDOR_HYGON));
 
     if ( !opt_smep )
diff --git a/xen/arch/x86/traps-setup.c b/xen/arch/x86/traps-setup.c
index a8385b26ae..06ab71171c 100644
--- a/xen/arch/x86/traps-setup.c
+++ b/xen/arch/x86/traps-setup.c
@@ -30,10 +30,10 @@ static void __init init_ler(void)
      * Intel Pentium 4 is the only known CPU to not use the architectural MSR
      * indicies.
      */
-    switch ( boot_cpu_data.x86_vendor )
+    switch ( boot_cpu_data.vendor )
     {
     case X86_VENDOR_INTEL:
-        if ( boot_cpu_data.x86 == 0xf )
+        if ( boot_cpu_data.family == 0xf )
         {
             msr = MSR_P4_LER_FROM_LIP;
             break;
diff --git a/xen/arch/x86/tsx.c b/xen/arch/x86/tsx.c
index fbdd05971c..52636462d9 100644
--- a/xen/arch/x86/tsx.c
+++ b/xen/arch/x86/tsx.c
@@ -148,8 +148,8 @@ void tsx_init(void)
             {
                 printk(XENLOG_ERR
                        "FIRMWARE BUG: CPU %02x-%02x-%02x, ucode 0x%08x: RTM_ALWAYS_ABORT vs RTM mismatch\n",
-                       boot_cpu_data.x86, boot_cpu_data.x86_model,
-                       boot_cpu_data.x86_mask, this_cpu(cpu_sig).rev);
+                       boot_cpu_data.family, boot_cpu_data.model,
+                       boot_cpu_data.stepping, this_cpu(cpu_sig).rev);
 
                 setup_clear_cpu_cap(X86_FEATURE_RTM_ALWAYS_ABORT);
                 setup_clear_cpu_cap(X86_FEATURE_TSX_FORCE_ABORT);
diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
index 3f6d2f5db5..476d569e81 100644
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -835,9 +835,9 @@ static void amd_iommu_erratum_746_workaround(struct amd_iommu *iommu)
 {
     u32 value;
 
-    if ( (boot_cpu_data.x86 != 0x15) ||
-         (boot_cpu_data.x86_model < 0x10) ||
-         (boot_cpu_data.x86_model > 0x1f) )
+    if ( (boot_cpu_data.family != 0x15) ||
+         (boot_cpu_data.model < 0x10) ||
+         (boot_cpu_data.model > 0x1f) )
         return;
 
     pci_conf_write32(iommu->sbdf, 0xf0, 0x90);
-- 
2.50.1


