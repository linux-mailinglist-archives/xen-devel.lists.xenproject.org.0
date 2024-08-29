Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9F59643AA
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 14:00:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785719.1195204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjdoe-0008Ld-KA; Thu, 29 Aug 2024 11:59:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785719.1195204; Thu, 29 Aug 2024 11:59:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjdoe-0008JW-HY; Thu, 29 Aug 2024 11:59:52 +0000
Received: by outflank-mailman (input) for mailman id 785719;
 Thu, 29 Aug 2024 11:59:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ImPG=P4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sjdod-0008JK-6S
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 11:59:51 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31774404-65fe-11ef-a0b0-8be0dac302b0;
 Thu, 29 Aug 2024 13:59:49 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5353d0b7463so997554e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Aug 2024 04:59:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8989221c63sm70089266b.201.2024.08.29.04.59.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Aug 2024 04:59:48 -0700 (PDT)
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
X-Inumbo-ID: 31774404-65fe-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724932789; x=1725537589; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZT3iXwalvN1B13aqyfNpuDLOaefZIro3XvoMHaM/jD4=;
        b=SQAdxl/RCkLIGMIQ4QebDp6wAOv6gOI91nqQMf7t22NQV0TA4Wy8akjQGLGAsc9w8A
         Tef1Bh6MJvP0ZnLNepEy8CRBLmXHf/b4yVt7NR8SOruENfCtn9PUDyM+2DP4VIN4EJcL
         8Kc7c5PVq+/8UAeIgOCxedVsmfXC8caO/ySxvNyZMu3YcL988Fa29ml0yaCIZZ5yNDKs
         cNT+rIsm7kP8OedisjSbVLmoBl0AqqZ+yFcash77L1mw9kXGnRk6CgyKKxKS+8irsgKw
         G+MV6o2kLv605X/Er1DgrLYtl7OTUprStWZGxWcDe5SxlV3EbaRYbXn85WE90Z5AVR5n
         o0DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724932789; x=1725537589;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZT3iXwalvN1B13aqyfNpuDLOaefZIro3XvoMHaM/jD4=;
        b=vcLWJ/vPL38oE4S4Akt6zzaH+PlBGmnUW7R0YCg7JOnfJQ6wrQWA6vH7i1jqblevK6
         /3eobKd61t26J62U9/D6jvBZBd8KkFxBUG9+gd4vvU5Yr8347LGusjR17ZKUGDvmS3Xd
         G07PAHsqeBB0cRWN+CPQM8ewqxk3i/b+ix3UIzcfxYViWTuI4BW8usmpKBB8sD/vdCIU
         30zRREq1096gF+vczYjnFqTfTV7EUvwJ5ahiImqZTOHVqC50vs5wNMR9P9m5QLt0+2xh
         8WjOfegbWx+Av3a7ES2u3l5Vok7I6vL9K8+Is9nDA7YmfK1iYZTN76kn73xN6sp+9FjH
         0U6g==
X-Gm-Message-State: AOJu0YyMCGrHdejtwcImui3fctQZ6jmiwnN4/mos900YP8oQEayaUyTM
	/7nV5Bxjk/Aw0vMtJqqxFV/pDdUMcQNUzTOTGMgrtflGxuiNoXiQh28DZ2nVqjWcwYdUtKHbfjM
	=
X-Google-Smtp-Source: AGHT+IHgX0dvvVFrjpUd7E1sffm4j1ybtRegBWCZC5TURTgk/AiHefRTANRfHIfHoUGNcJGcy2Wsnw==
X-Received: by 2002:ac2:4c49:0:b0:533:4785:82ab with SMTP id 2adb3069b0e04-5353e543424mr2311093e87.1.1724932789103;
        Thu, 29 Aug 2024 04:59:49 -0700 (PDT)
Message-ID: <e6341c57-cf0d-46c5-8582-a84af515a650@suse.com>
Date: Thu, 29 Aug 2024 13:59:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/5] types: replace remaining uses of s8
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <b1ded557-63b8-4999-98ca-de80488ebad1@suse.com>
Content-Language: en-US
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <b1ded557-63b8-4999-98ca-de80488ebad1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

... and move the type itself to linux-compat.h.

While doing so,
- convert __read_mostly to __ro_after_init for respective variables
  having their type changed (for acpi_numa add the attribute anew),
- in cpuid_hypervisor_leaves() drop a cast altogether,
- switch an adjacent struct arch_irq_desc field to bool.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -71,7 +71,7 @@ static struct {
 /*
  * Knob to control our willingness to enable the local APIC.
  */
-static s8 __initdata enable_local_apic; /* -1=force-disable, +1=force-enable */
+static int8_t __initdata enable_local_apic; /* -1=force-disable, +1=force-enable */
 
 /*
  * Debug level
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -46,7 +46,7 @@ static unsigned int __initdata opt_cpuid
 integer_param("cpuid_mask_thermal_ecx", opt_cpuid_mask_thermal_ecx);
 
 /* 1 = allow, 0 = don't allow guest creation, -1 = don't allow boot */
-s8 __read_mostly opt_allow_unsafe;
+int8_t __ro_after_init opt_allow_unsafe;
 boolean_param("allow_unsafe", opt_allow_unsafe);
 
 /* Signal whether the ACPI C1E quirk is required. */
--- a/xen/arch/x86/e820.c
+++ b/xen/arch/x86/e820.c
@@ -27,7 +27,7 @@ static unsigned long long __initdata opt
 size_param("availmem", opt_availmem);
 
 /* opt_nomtrr_check: Don't clip ram to highest cacheable MTRR. */
-static s8 __initdata e820_mtrr_clip = -1;
+static int8_t __initdata e820_mtrr_clip = -1;
 boolean_param("e820-mtrr-clip", e820_mtrr_clip);
 
 /* opt_e820_verbose: Be verbose about clipping, the original e820, &c */
--- a/xen/arch/x86/hvm/quirks.c
+++ b/xen/arch/x86/hvm/quirks.c
@@ -11,7 +11,7 @@
 #include <xen/param.h>
 #include <asm/hvm/support.h>
 
-s8 __read_mostly hvm_port80_allowed = -1;
+int8_t __ro_after_init hvm_port80_allowed = -1;
 boolean_param("hvm_port80", hvm_port80_allowed);
 
 static int __init cf_check dmi_hvm_deny_port80(const struct dmi_system_id *id)
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -59,7 +59,7 @@ static unsigned int __ro_after_init vm_n
 integer_param("vm-notify-window", vm_notify_window);
 
 static bool __read_mostly opt_ept_pml = true;
-static s8 __read_mostly opt_ept_ad = -1;
+static int8_t __ro_after_init opt_ept_ad = -1;
 int8_t __read_mostly opt_ept_exec_sp = -1;
 
 static int __init cf_check parse_ept_param(const char *s)
--- a/xen/arch/x86/include/asm/acpi.h
+++ b/xen/arch/x86/include/asm/acpi.h
@@ -100,7 +100,7 @@ extern unsigned long acpi_wakeup_address
 
 #define ARCH_HAS_POWER_INIT	1
 
-extern s8 acpi_numa;
+extern int8_t acpi_numa;
 
 extern struct acpi_sleep_info acpi_sinfo;
 #define acpi_video_flags bootsym(video_flags)
--- a/xen/arch/x86/include/asm/amd.h
+++ b/xen/arch/x86/include/asm/amd.h
@@ -160,7 +160,7 @@
 struct cpuinfo_x86;
 int cpu_has_amd_erratum(const struct cpuinfo_x86 *cpu, int osvw_id, ...);
 
-extern s8 opt_allow_unsafe;
+extern int8_t opt_allow_unsafe;
 
 void fam10h_check_enable_mmcfg(void);
 void check_enable_amd_mmconf_dmi(void);
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -241,7 +241,7 @@ struct hvm_function_table {
 
 extern struct hvm_function_table hvm_funcs;
 extern bool hvm_enabled;
-extern s8 hvm_port80_allowed;
+extern int8_t hvm_port80_allowed;
 
 extern const struct hvm_function_table *start_svm(void);
 extern const struct hvm_function_table *start_vmx(void);
--- a/xen/arch/x86/include/asm/irq.h
+++ b/xen/arch/x86/include/asm/irq.h
@@ -80,8 +80,8 @@ struct arch_irq_desc {
         cpumask_var_t pending_mask;
         vmask_t *used_vectors;
         unsigned move_cleanup_count;
-        u8 move_in_progress : 1;
-        s8 used;
+        bool move_in_progress : 1;
+        int8_t used;
         /*
          * Weak reference to domain having permission over this IRQ (which can
          * be different from the domain actually having the IRQ assigned)
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -170,7 +170,7 @@ static uint32_t __ro_after_init base_dis
       is_pv_domain(d)) ?                                        \
      L1_DISALLOW_MASK : (L1_DISALLOW_MASK & ~PAGE_CACHE_ATTRS))
 
-static s8 __read_mostly opt_mmio_relax;
+static int8_t __ro_after_init opt_mmio_relax;
 
 static int __init cf_check parse_mmio_relax(const char *s)
 {
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -35,7 +35,7 @@
 #include <xsm/xsm.h>
 #include <xen/vpci.h>
 
-static s8 __read_mostly use_msi = -1;
+static int8_t __ro_after_init use_msi = -1;
 boolean_param("msi", use_msi);
 
 static void __pci_disable_msix(struct msi_desc *entry);
--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -25,7 +25,7 @@ nodeid_t apicid_to_node[MAX_LOCAL_APIC]
     [0 ... MAX_LOCAL_APIC-1] = NUMA_NO_NODE
 };
 
-s8 acpi_numa = 0;
+int8_t __ro_after_init acpi_numa = 0;
 
 int __init arch_numa_setup(const char *opt)
 {
--- a/xen/arch/x86/oprofile/op_model_athlon.c
+++ b/xen/arch/x86/oprofile/op_model_athlon.c
@@ -157,7 +157,7 @@ static inline u64 op_amd_randomize_ibs_o
          * IbsOpMaxCnt must fit in the range from 0x0081 to
          * 0xff80.
          */
-        val += (s8)(random >> 4);
+        val += (int8_t)(random >> 4);
     else
         val |= (u64)(random & IBS_RANDOM_MASK) << 32;
 
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -166,7 +166,7 @@ unsigned long __read_mostly mmu_cr4_feat
 
 /* smep: Enable/disable Supervisor Mode Execution Protection */
 #define SMEP_HVM_ONLY (-2)
-static s8 __initdata opt_smep = -1;
+static int8_t __initdata opt_smep = -1;
 
 /*
  * Initial domain place holder. Needs to be global so it can be created in
@@ -203,7 +203,7 @@ custom_param("smep", parse_smep_param);
 
 /* smap: Enable/disable Supervisor Mode Access Prevention */
 #define SMAP_HVM_ONLY (-2)
-static s8 __initdata opt_smap = -1;
+static int8_t __initdata opt_smap = -1;
 
 static int __init cf_check parse_smap_param(const char *s)
 {
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1116,7 +1116,7 @@ void cpuid_hypervisor_leaves(const struc
             res->a = offset;
             res->b = offset >> 32;
             res->c = d->arch.vtsc_to_ns.mul_frac;
-            res->d = (s8)d->arch.vtsc_to_ns.shift;
+            res->d = d->arch.vtsc_to_ns.shift;
             break;
         }
 
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -79,7 +79,7 @@ struct cpufreq_policy {
 
     bool                resume; /* flag for cpufreq 1st run
                                  * S3 wakeup, hotplug cpu, etc */
-    s8                  turbo;  /* tristate flag: 0 for unsupported
+    int8_t              turbo;  /* tristate flag: 0 for unsupported
                                  * -1 for disable, 1 for enabled
                                  * See CPUFREQ_TURBO_* below for defines */
 };
--- a/xen/include/xen/linux-compat.h
+++ b/xen/include/xen/linux-compat.h
@@ -11,7 +11,7 @@
 
 #include <xen/types.h>
 
-typedef int8_t  __s8;
+typedef int8_t  s8, __s8;
 typedef uint8_t __u8;
 typedef int16_t __s16;
 typedef int32_t __s32;
--- a/xen/include/xen/types.h
+++ b/xen/include/xen/types.h
@@ -5,7 +5,6 @@
 #include <xen/stdint.h>
 
 /* Linux inherited types which are being phased out */
-typedef int8_t s8;
 typedef uint8_t u8;
 typedef int16_t s16;
 typedef uint16_t u16, __u16;


