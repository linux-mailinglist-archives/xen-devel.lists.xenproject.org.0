Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCC9849C02
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 14:38:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676066.1051876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWzAU-0007nC-5O; Mon, 05 Feb 2024 13:37:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676066.1051876; Mon, 05 Feb 2024 13:37:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWzAU-0007lJ-27; Mon, 05 Feb 2024 13:37:50 +0000
Received: by outflank-mailman (input) for mailman id 676066;
 Mon, 05 Feb 2024 13:37:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8/S5=JO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rWzAS-0007l7-2D
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 13:37:48 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf1f29c4-c42b-11ee-8a45-1f161083a0e0;
 Mon, 05 Feb 2024 14:37:46 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40fb63c40c0so39433665e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 05:37:46 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 f9-20020a05600c4e8900b0040f035bebfcsm8625476wmq.12.2024.02.05.05.37.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 05:37:45 -0800 (PST)
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
X-Inumbo-ID: bf1f29c4-c42b-11ee-8a45-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707140266; x=1707745066; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=07aP1qEUKfU9p7fDjH02hl2Wgx9V9VqMoOdijrGIkAk=;
        b=eCxBGvqHEdz2eWnhgkBVOolFsi7fJewod/mwqWstWnTt4rajUQVxkdtSeK47vlY6c6
         f4UPZyDxpl4dwenBJk4pIxlm115VZ1FhD+ywWmrs7KFrio3YXn5OS0m+RHCRSi3pp51S
         6HvII86pSxU8s38KMc2VWJx5CBRJpp6Bv6D9tgXL/K3RCcA0NZ1KFUw1aWRAbdahJoGY
         JHXQL2yurKCZFi7OVemu2NuZrSr9ytnSWNmJbV2GNdwCgwqpSk26pPM8UHWKjSmnLrYp
         KHv8U/r/1HZmgykPKMyOW3Vps1TQlYIzOtsnLLMcEueC+3O9WllfNAEccsX81JMpRR81
         WbAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707140266; x=1707745066;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=07aP1qEUKfU9p7fDjH02hl2Wgx9V9VqMoOdijrGIkAk=;
        b=PanFpET/74xqyY/rN6QPZL13t0OFxVG7XwWV8BKZMM+xzg9HoDHbhrfyMcCW5+7ivd
         qwE8rHvjEXVwAwm3lcK5+xnF1mUHLl6mQYzAWuPc28wCfdB+jXA1OdCg2GwuwC+iVm9a
         mVbf2Y70/s8borkLKS2NadrUGgy1GXxH2qHS1DpGyjnI743Dq38PM62KEQHtSWdUVkJe
         rgbZh+Xvz4hcyjGVj/TxG6oVOCzpMyGBxvajuJpSAQxP9xLogJYxRKsEwH8UZh4nN+D/
         w3uRfxf/Lw+bf30NWeze7+x0yWbeuHomVxdksXx6IENL/gRfCxN0FJ6RQ3L4FXPuO0N9
         J9Tw==
X-Gm-Message-State: AOJu0YzYgVrUSI4+9YGVOGyXLsh2UXkupDx3IY0W/8MXXyiWn1iiCHq0
	l25Cggz6UH+bY6r8BFIcTkbaUbkCCcussATx0swkltbe7uHOeQpjoVv68jQaD6x16JD6JU5E1D0
	=
X-Google-Smtp-Source: AGHT+IEJB1Xik0xxmpKBk6ml66jNYoIJ8zz8EiPv6nzfeKDtgWnW0Adn8C9VdjUfu3QlSSkGpwAJDQ==
X-Received: by 2002:a05:600c:1c88:b0:40d:8bc2:6059 with SMTP id k8-20020a05600c1c8800b0040d8bc26059mr4904521wms.36.1707140265918;
        Mon, 05 Feb 2024 05:37:45 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWXs1K47j0vODaBHD2YixDtZniESQOohEYalDit9pxWRSDDqj8ycL1T7kPNOmhzogkrBpP0oEX8tg7tgGOkLSG/2BPmK8yWePs54H+ecyZBeeW+fJQPbnrGnkZkubcx8W0OpAVp10G1dO9br1O9qWrZNhzSs1od9vTfTU+8/b0=
Message-ID: <bc782b14-d897-4a94-b71d-97c4abeb85df@suse.com>
Date: Mon, 5 Feb 2024 14:37:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4.5 3/8] VMX: tertiary execution control infrastructure
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <9dd23064-c79e-4a50-9c71-c0e73b189944@suse.com>
 <aa553449-888f-4e52-85b7-0bc0b7f010b4@suse.com>
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
In-Reply-To: <aa553449-888f-4e52-85b7-0bc0b7f010b4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This is a prereq to enabling e.g. the MSRLIST feature.

Note that the PROCBASED_CTLS3 MSR is different from other VMX feature
reporting MSRs, in that all 64 bits report allowed 1-settings.

vVMX code is left alone, though, for the time being.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v4.5: Bump zero-padding width in vmcs_dump_vcpu(). Add
      TERTIARY_EXEC_VIRT_SPEC_CTRL. Constify
      vmx_update_tertiary_exec_control()'s parameter. Re-base.
v2: New.

--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -164,6 +164,7 @@ static int cf_check parse_ept_param_runt
 u32 vmx_pin_based_exec_control __read_mostly;
 u32 vmx_cpu_based_exec_control __read_mostly;
 u32 vmx_secondary_exec_control __read_mostly;
+uint64_t vmx_tertiary_exec_control __read_mostly;
 u32 vmx_vmexit_control __read_mostly;
 u32 vmx_vmentry_control __read_mostly;
 u64 vmx_ept_vpid_cap __read_mostly;
@@ -228,10 +229,32 @@ static u32 adjust_vmx_controls(
     return ctl;
 }
 
-static bool cap_check(const char *name, u32 expected, u32 saw)
+static uint64_t adjust_vmx_controls2(
+    const char *name, uint64_t ctl_min, uint64_t ctl_opt, unsigned int msr,
+    bool *mismatch)
+{
+    uint64_t vmx_msr, ctl = ctl_min | ctl_opt;
+
+    rdmsrl(msr, vmx_msr);
+
+    ctl &= vmx_msr; /* bit == 0 ==> must be zero */
+
+    /* Ensure minimum (required) set of control bits are supported. */
+    if ( ctl_min & ~ctl )
+    {
+        *mismatch = true;
+        printk("VMX: CPU%u has insufficient %s (%#lx; requires %#lx)\n",
+               smp_processor_id(), name, ctl, ctl_min);
+    }
+
+    return ctl;
+}
+
+static bool cap_check(
+    const char *name, unsigned long expected, unsigned long saw)
 {
     if ( saw != expected )
-        printk("VMX %s: saw %#x expected %#x\n", name, saw, expected);
+        printk("VMX %s: saw %#lx expected %#lx\n", name, saw, expected);
     return saw != expected;
 }
 
@@ -241,6 +264,7 @@ static int vmx_init_vmcs_config(bool bsp
     u32 _vmx_pin_based_exec_control;
     u32 _vmx_cpu_based_exec_control;
     u32 _vmx_secondary_exec_control = 0;
+    uint64_t _vmx_tertiary_exec_control = 0;
     u64 _vmx_ept_vpid_cap = 0;
     u64 _vmx_misc_cap = 0;
     u32 _vmx_vmexit_control;
@@ -274,7 +298,8 @@ static int vmx_init_vmcs_config(bool bsp
     opt = (CPU_BASED_ACTIVATE_MSR_BITMAP |
            CPU_BASED_TPR_SHADOW |
            CPU_BASED_MONITOR_TRAP_FLAG |
-           CPU_BASED_ACTIVATE_SECONDARY_CONTROLS);
+           CPU_BASED_ACTIVATE_SECONDARY_CONTROLS |
+           CPU_BASED_ACTIVATE_TERTIARY_CONTROLS);
     _vmx_cpu_based_exec_control = adjust_vmx_controls(
         "CPU-Based Exec Control", min, opt,
         MSR_IA32_VMX_PROCBASED_CTLS, &mismatch);
@@ -338,6 +363,15 @@ static int vmx_init_vmcs_config(bool bsp
             MSR_IA32_VMX_PROCBASED_CTLS2, &mismatch);
     }
 
+    if ( _vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_TERTIARY_CONTROLS )
+    {
+        uint64_t opt = 0;
+
+        _vmx_tertiary_exec_control = adjust_vmx_controls2(
+            "Tertiary Exec Control", 0, opt,
+            MSR_IA32_VMX_PROCBASED_CTLS3, &mismatch);
+    }
+
     /* The IA32_VMX_EPT_VPID_CAP MSR exists only when EPT or VPID available */
     if ( _vmx_secondary_exec_control & (SECONDARY_EXEC_ENABLE_EPT |
                                         SECONDARY_EXEC_ENABLE_VPID) )
@@ -468,6 +502,7 @@ static int vmx_init_vmcs_config(bool bsp
         vmx_pin_based_exec_control = _vmx_pin_based_exec_control;
         vmx_cpu_based_exec_control = _vmx_cpu_based_exec_control;
         vmx_secondary_exec_control = _vmx_secondary_exec_control;
+        vmx_tertiary_exec_control  = _vmx_tertiary_exec_control;
         vmx_ept_vpid_cap           = _vmx_ept_vpid_cap;
         vmx_vmexit_control         = _vmx_vmexit_control;
         vmx_vmentry_control        = _vmx_vmentry_control;
@@ -503,6 +538,9 @@ static int vmx_init_vmcs_config(bool bsp
             "Secondary Exec Control",
             vmx_secondary_exec_control, _vmx_secondary_exec_control);
         mismatch |= cap_check(
+            "Tertiary Exec Control",
+            vmx_tertiary_exec_control, _vmx_tertiary_exec_control);
+        mismatch |= cap_check(
             "VMExit Control",
             vmx_vmexit_control, _vmx_vmexit_control);
         mismatch |= cap_check(
@@ -1080,6 +1118,7 @@ static int construct_vmcs(struct vcpu *v
         v->arch.hvm.vmx.exec_control |= CPU_BASED_RDTSC_EXITING;
 
     v->arch.hvm.vmx.secondary_exec_control = vmx_secondary_exec_control;
+    v->arch.hvm.vmx.tertiary_exec_control  = vmx_tertiary_exec_control;
 
     /*
      * Disable features which we don't want active by default:
@@ -1134,6 +1173,10 @@ static int construct_vmcs(struct vcpu *v
         __vmwrite(SECONDARY_VM_EXEC_CONTROL,
                   v->arch.hvm.vmx.secondary_exec_control);
 
+    if ( cpu_has_vmx_tertiary_exec_control )
+        __vmwrite(TERTIARY_VM_EXEC_CONTROL,
+                  v->arch.hvm.vmx.tertiary_exec_control);
+
     /* MSR access bitmap. */
     if ( cpu_has_vmx_msr_bitmap )
     {
@@ -2068,10 +2111,12 @@ void vmcs_dump_vcpu(struct vcpu *v)
                vmr(HOST_PERF_GLOBAL_CTRL));
 
     printk("*** Control State ***\n");
-    printk("PinBased=%08x CPUBased=%08x SecondaryExec=%08x\n",
+    printk("PinBased=%08x CPUBased=%08x\n",
            vmr32(PIN_BASED_VM_EXEC_CONTROL),
-           vmr32(CPU_BASED_VM_EXEC_CONTROL),
-           vmr32(SECONDARY_VM_EXEC_CONTROL));
+           vmr32(CPU_BASED_VM_EXEC_CONTROL));
+    printk("SecondaryExec=%08x TertiaryExec=%016lx\n",
+           vmr32(SECONDARY_VM_EXEC_CONTROL),
+           vmr(TERTIARY_VM_EXEC_CONTROL));
     printk("EntryControls=%08x ExitControls=%08x\n", vmentry_ctl, vmexit_ctl);
     printk("ExceptionBitmap=%08x PFECmask=%08x PFECmatch=%08x\n",
            vmr32(EXCEPTION_BITMAP),
@@ -2174,6 +2219,7 @@ int __init vmx_vmcs_init(void)
         vmx_pin_based_exec_control = 0;
         vmx_cpu_based_exec_control = 0;
         vmx_secondary_exec_control = 0;
+        vmx_tertiary_exec_control  = 0;
         vmx_vmexit_control         = 0;
         vmx_vmentry_control        = 0;
         vmx_ept_vpid_cap           = 0;
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -114,6 +114,7 @@ struct vmx_vcpu {
     /* Cache of cpu execution control. */
     u32                  exec_control;
     u32                  secondary_exec_control;
+    uint64_t             tertiary_exec_control;
     u32                  exception_bitmap;
 
     uint64_t             shadow_gs;
@@ -196,6 +197,7 @@ void vmx_vmcs_reload(struct vcpu *v);
 #define CPU_BASED_RDTSC_EXITING               0x00001000U
 #define CPU_BASED_CR3_LOAD_EXITING            0x00008000U
 #define CPU_BASED_CR3_STORE_EXITING           0x00010000U
+#define CPU_BASED_ACTIVATE_TERTIARY_CONTROLS  0x00020000U
 #define CPU_BASED_CR8_LOAD_EXITING            0x00080000U
 #define CPU_BASED_CR8_STORE_EXITING           0x00100000U
 #define CPU_BASED_TPR_SHADOW                  0x00200000U
@@ -260,6 +262,14 @@ extern u32 vmx_vmentry_control;
 #define SECONDARY_EXEC_NOTIFY_VM_EXITING        0x80000000U
 extern u32 vmx_secondary_exec_control;
 
+#define TERTIARY_EXEC_LOADIWKEY_EXITING         BIT(0, UL)
+#define TERTIARY_EXEC_ENABLE_HLAT               BIT(1, UL)
+#define TERTIARY_EXEC_EPT_PAGING_WRITE          BIT(2, UL)
+#define TERTIARY_EXEC_GUEST_PAGING_VERIFY       BIT(3, UL)
+#define TERTIARY_EXEC_IPI_VIRT                  BIT(4, UL)
+#define TERTIARY_EXEC_VIRT_SPEC_CTRL            BIT(7, UL)
+extern uint64_t vmx_tertiary_exec_control;
+
 #define VMX_EPT_EXEC_ONLY_SUPPORTED                         0x00000001
 #define VMX_EPT_WALK_LENGTH_4_SUPPORTED                     0x00000040
 #define VMX_EPT_MEMORY_TYPE_UC                              0x00000100
@@ -296,6 +306,8 @@ extern u64 vmx_ept_vpid_cap;
     (vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_MSR_BITMAP)
 #define cpu_has_vmx_secondary_exec_control \
     (vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_SECONDARY_CONTROLS)
+#define cpu_has_vmx_tertiary_exec_control \
+    (vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_TERTIARY_CONTROLS)
 #define cpu_has_vmx_ept \
     (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_EPT)
 #define cpu_has_vmx_dt_exiting \
@@ -423,6 +435,7 @@ enum vmcs_field {
     VIRT_EXCEPTION_INFO             = 0x0000202a,
     XSS_EXIT_BITMAP                 = 0x0000202c,
     TSC_MULTIPLIER                  = 0x00002032,
+    TERTIARY_VM_EXEC_CONTROL        = 0x00002034,
     GUEST_PHYSICAL_ADDRESS          = 0x00002400,
     VMCS_LINK_POINTER               = 0x00002800,
     GUEST_IA32_DEBUGCTL             = 0x00002802,
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -347,6 +347,7 @@
 #define MSR_IA32_VMX_TRUE_EXIT_CTLS             0x48f
 #define MSR_IA32_VMX_TRUE_ENTRY_CTLS            0x490
 #define MSR_IA32_VMX_VMFUNC                     0x491
+#define MSR_IA32_VMX_PROCBASED_CTLS3            0x492
 
 /* K7/K8 MSRs. Not complete. See the architecture manual for a more
    complete list. */
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -760,6 +760,12 @@ void vmx_update_secondary_exec_control(s
                   v->arch.hvm.vmx.secondary_exec_control);
 }
 
+void vmx_update_tertiary_exec_control(const struct vcpu *v)
+{
+    __vmwrite(TERTIARY_VM_EXEC_CONTROL,
+              v->arch.hvm.vmx.tertiary_exec_control);
+}
+
 void vmx_update_exception_bitmap(struct vcpu *v)
 {
     u32 bitmap = unlikely(v->arch.hvm.vmx.vmx_realmode)
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -81,6 +81,7 @@ void vmx_realmode(struct cpu_user_regs *
 void vmx_update_exception_bitmap(struct vcpu *v);
 void vmx_update_cpu_exec_control(struct vcpu *v);
 void vmx_update_secondary_exec_control(struct vcpu *v);
+void vmx_update_tertiary_exec_control(const struct vcpu *v);
 
 #define POSTED_INTR_ON  0
 #define POSTED_INTR_SN  1


