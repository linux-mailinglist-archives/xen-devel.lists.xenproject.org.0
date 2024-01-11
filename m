Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9886882A9FC
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 10:00:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666026.1036436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNqv8-0005xg-N0; Thu, 11 Jan 2024 09:00:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666026.1036436; Thu, 11 Jan 2024 09:00:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNqv8-0005v8-JN; Thu, 11 Jan 2024 09:00:14 +0000
Received: by outflank-mailman (input) for mailman id 666026;
 Thu, 11 Jan 2024 09:00:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFj+=IV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNqv6-0003ka-Ur
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 09:00:13 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d35fb0ba-b05f-11ee-9b0f-b553b5be7939;
 Thu, 11 Jan 2024 10:00:11 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2cd81b09e83so10405351fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2024 01:00:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h6-20020adf9cc6000000b003375d8b0460sm643239wre.1.2024.01.11.01.00.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jan 2024 01:00:10 -0800 (PST)
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
X-Inumbo-ID: d35fb0ba-b05f-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704963610; x=1705568410; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qawFEibbVgiRlO1H8/uU4f49OyAJbl7VHfPdVn+MISc=;
        b=PyNNb6egspxaHIasxBqh8q8bi+pABNwJWUmN5csi1CoNoQs14xlJvHx4v8X7WsrWR1
         YbIadCLaN9MYuho+aiLftDKFmMoO7pRvAEgjmSAP9DGQg4SiLYufxb+5iGTAIwz1S192
         N5bWesevjbA496grKoTEJ+cEGvgHfZl+gSRmwE8iPb8Hgxed7hYBuzeRAgqhY3zDfdMA
         NcTQrj6G8RaSqTxqMhDnCbJJ6y80VqyG+gcAvcnDCuWXJ0mPJXUeutl1xsfAvpbrCDAo
         rqvRPF0LiIpXzcb5cnxcXjdrrc7VrX1VhsBOo2RNhOeElkTjmBva3xRE697quCAsH4aA
         sYRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704963610; x=1705568410;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qawFEibbVgiRlO1H8/uU4f49OyAJbl7VHfPdVn+MISc=;
        b=amJTXQXMML2qV37erpPzRnvNHy7BzLrWXhxyqtDFOMowdEkxOUjF4HrJj8VMZZuBkn
         2cR03M7Qwb2HCUr4IXewLhvmv4Bc2+M2WSurmwWWINuxoOrWiKcUcVgso4TxxyOf/kdn
         GnZVQFtg7N/YBLt+XqSIe3kMtZ4tNzLA3wotrwtIm0BC/OHC0Oj4ApgFdb+49hbxIFPE
         Qsr7JRfXhxJxoJ+Kuj/hLsL0PKfMWROTs89DdaziLZGrVP7WBB6sAqD1voZBIxTIJVrg
         nkoAMeY4BamefUck+aJ972Rd4JaOURFq2iu6+9dfYODhES7Oy+AhfZl7ZK+uqUJSfZ8j
         6Sgw==
X-Gm-Message-State: AOJu0YxMfhh3pOjZ5JvNfjJE8XDnYBQtRONtxYJpzAL9beb5G4L8ZZ+y
	W5nARTVgXUQMdcy91zG6HrUhd5oiBWJGFSt+bXG/dwQr9Q==
X-Google-Smtp-Source: AGHT+IEQKhzsNvlICIbgdAIU0k5/NJfJjUUsGbtye2SjRba9mbbQ6GOLq58VPZlbsRSgQzx0tQhCjQ==
X-Received: by 2002:a2e:8655:0:b0:2cc:6f7f:6ba4 with SMTP id i21-20020a2e8655000000b002cc6f7f6ba4mr103630ljj.199.1704963610473;
        Thu, 11 Jan 2024 01:00:10 -0800 (PST)
Message-ID: <aa553449-888f-4e52-85b7-0bc0b7f010b4@suse.com>
Date: Thu, 11 Jan 2024 10:00:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 3/8] VMX: tertiary execution control infrastructure
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <9dd23064-c79e-4a50-9c71-c0e73b189944@suse.com>
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
In-Reply-To: <9dd23064-c79e-4a50-9c71-c0e73b189944@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This is a prereq to enabling the MSRLIST feature.

Note that the PROCBASED_CTLS3 MSR is different from other VMX feature
reporting MSRs, in that all 64 bits report allowed 1-settings.

vVMX code is left alone, though, for the time being.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
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
+    printk("SecondaryExec=%08x TertiaryExec=%08lx\n",
+           vmr32(SECONDARY_VM_EXEC_CONTROL),
+           vmr(TERTIARY_VM_EXEC_CONTROL));
     printk("EntryControls=%08x ExitControls=%08x\n", vmentry_ctl, vmexit_ctl);
     printk("ExceptionBitmap=%08x PFECmask=%08x PFECmatch=%08x\n",
            vmr32(EXCEPTION_BITMAP),
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
@@ -260,6 +262,13 @@ extern u32 vmx_vmentry_control;
 #define SECONDARY_EXEC_NOTIFY_VM_EXITING        0x80000000U
 extern u32 vmx_secondary_exec_control;
 
+#define TERTIARY_EXEC_LOADIWKEY_EXITING         BIT(0, UL)
+#define TERTIARY_EXEC_ENABLE_HLAT               BIT(1, UL)
+#define TERTIARY_EXEC_EPT_PAGING_WRITE          BIT(2, UL)
+#define TERTIARY_EXEC_GUEST_PAGING_VERIFY       BIT(3, UL)
+#define TERTIARY_EXEC_IPI_VIRT                  BIT(4, UL)
+extern uint64_t vmx_tertiary_exec_control;
+
 #define VMX_EPT_EXEC_ONLY_SUPPORTED                         0x00000001
 #define VMX_EPT_WALK_LENGTH_4_SUPPORTED                     0x00000040
 #define VMX_EPT_MEMORY_TYPE_UC                              0x00000100
@@ -295,6 +304,8 @@ extern u64 vmx_ept_vpid_cap;
     (vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_MSR_BITMAP)
 #define cpu_has_vmx_secondary_exec_control \
     (vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_SECONDARY_CONTROLS)
+#define cpu_has_vmx_tertiary_exec_control \
+    (vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_TERTIARY_CONTROLS)
 #define cpu_has_vmx_ept \
     (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_EPT)
 #define cpu_has_vmx_dt_exiting \
@@ -422,6 +433,7 @@ enum vmcs_field {
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
 
+void vmx_update_tertiary_exec_control(struct vcpu *v)
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
+void vmx_update_tertiary_exec_control(struct vcpu *v);
 
 #define POSTED_INTR_ON  0
 #define POSTED_INTR_SN  1


