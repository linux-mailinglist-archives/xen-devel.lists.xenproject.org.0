Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC3B867C4E
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 17:44:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685648.1066713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ree5C-0000rb-2I; Mon, 26 Feb 2024 16:44:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685648.1066713; Mon, 26 Feb 2024 16:44:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ree5B-0000pH-V1; Mon, 26 Feb 2024 16:44:01 +0000
Received: by outflank-mailman (input) for mailman id 685648;
 Mon, 26 Feb 2024 16:43:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPQ6=KD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ree59-0000BK-Ro
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 16:43:59 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d3b3ca4-d4c6-11ee-8a58-1f161083a0e0;
 Mon, 26 Feb 2024 17:43:59 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2d09cf00214so51658461fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 08:43:59 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d18-20020a056402401200b005640022af58sm2509237eda.83.2024.02.26.08.43.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 08:43:58 -0800 (PST)
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
X-Inumbo-ID: 3d3b3ca4-d4c6-11ee-8a58-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708965838; x=1709570638; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=I+hozS1nSCFWHKTN5uvAFxwcd3lo+nQd/gYn/2VyyrI=;
        b=QvpsZJUucOiHyY4YAqgv1YaVsvSIqt2sQbs0k5EWR8e6T/B/zSFij39iRRtNt0oUv8
         ENigmxjW3d6vM6cE4uLOhpPr8tV0ut4kdul4k7wHHIzDtqo7Frno6UOsBCokf1tGH9/j
         QWBEvlSqi+YTNC8b/oIIgmlNr8WLrOQLl1IBXYXyxt0UwoqtWShqCLS2TenxALylgYaD
         Ny+6UusEnvl/3t5BtkWcpIbq/slZvNXVBAXEfhuztAZxaoOakFY9MFyBbuW7IWlqLEPG
         Wu0yB/jL9KE5CfjH/Gsw/dTOTnhg7RIDrdc3XnLsN6uDwmWATR4VxZj/5aeIjlU90Iay
         IQVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708965838; x=1709570638;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I+hozS1nSCFWHKTN5uvAFxwcd3lo+nQd/gYn/2VyyrI=;
        b=vG0FZTcKd8ISrB4va7io+aVP5eWJOT+GCQXeiSn5e7eLBbRYlcSLk7zwwwrTgmTB+s
         QtRmbwcNGJgS6RNrjKJUyY3PIiXHz3NqXsVyjQd9eJ4ODxSyajkRrhR9/ZbfC+GNVltW
         IEKzALt9dFoYYuoBwIdCZUvumVzDoLSe5PM/7TEUCIsfBu0fVhY1nx9BhvaAzFWlZShV
         /RK8t+Yfc2hqa12dEWUCLznAR1krU4jJ7+7g0Es6vfQVhU7kknHRWiKP50BScFNwlWkG
         2uDowlKVnhXQnEvx/hYk+c5qBoMw5yEAhtRbiJPYLbU0+Bjnm3hxgEHDL/fa6AJ0fgkx
         kFlA==
X-Gm-Message-State: AOJu0Yxd8sCGCZf6jHA1AZK+oSx24SxyOhdLQBUIxKXxlD1ljiUQuB4N
	GEt9VVqI+2zozihV/daRKtpOy9Vz4mwxG1pG+HUJzYn+wEIygI3zld8AoSGCWjexJ0Cvbq7NM0Y
	=
X-Google-Smtp-Source: AGHT+IGW/ceIqxVXPr0RzY6ctXnRWKp3aDNdb1/mUUv8JqciivLWvhcaIi3a9r4IsAjstRF9WGeotQ==
X-Received: by 2002:ac2:55a3:0:b0:513:31c:e54e with SMTP id y3-20020ac255a3000000b00513031ce54emr52954lfg.30.1708965838745;
        Mon, 26 Feb 2024 08:43:58 -0800 (PST)
Message-ID: <36dd8c5a-7b50-404e-ac96-3407c9d574c4@suse.com>
Date: Mon, 26 Feb 2024 17:43:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 06/12] VMX: convert vmx_cpu_based_exec_control
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <293e5aef-8843-461c-bc96-709a605b2680@suse.com>
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
In-Reply-To: <293e5aef-8843-461c-bc96-709a605b2680@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

... to a field in the capability/controls struct.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -162,7 +162,6 @@ static int cf_check parse_ept_param_runt
 
 /* Dynamic (run-time adjusted) execution control flags. */
 struct vmx_caps __ro_after_init vmx_caps;
-u32 vmx_cpu_based_exec_control __read_mostly;
 u32 vmx_secondary_exec_control __read_mostly;
 uint64_t vmx_tertiary_exec_control __read_mostly;
 u32 vmx_vmexit_control __read_mostly;
@@ -261,7 +260,6 @@ static int vmx_init_vmcs_config(bool bsp
 {
     u32 vmx_basic_msr_low, vmx_basic_msr_high, min, opt;
     struct vmx_caps caps = {};
-    u32 _vmx_cpu_based_exec_control;
     u32 _vmx_secondary_exec_control = 0;
     uint64_t _vmx_tertiary_exec_control = 0;
     u64 _vmx_ept_vpid_cap = 0;
@@ -299,12 +297,12 @@ static int vmx_init_vmcs_config(bool bsp
            CPU_BASED_MONITOR_TRAP_FLAG |
            CPU_BASED_ACTIVATE_SECONDARY_CONTROLS |
            CPU_BASED_ACTIVATE_TERTIARY_CONTROLS);
-    _vmx_cpu_based_exec_control = adjust_vmx_controls(
+    caps.cpu_based_exec_control = adjust_vmx_controls(
         "CPU-Based Exec Control", min, opt,
         MSR_IA32_VMX_PROCBASED_CTLS, &mismatch);
-    _vmx_cpu_based_exec_control &= ~CPU_BASED_RDTSC_EXITING;
-    if ( _vmx_cpu_based_exec_control & CPU_BASED_TPR_SHADOW )
-        _vmx_cpu_based_exec_control &=
+    caps.cpu_based_exec_control &= ~CPU_BASED_RDTSC_EXITING;
+    if ( caps.cpu_based_exec_control & CPU_BASED_TPR_SHADOW )
+        caps.cpu_based_exec_control &=
             ~(CPU_BASED_CR8_LOAD_EXITING | CPU_BASED_CR8_STORE_EXITING);
 
     rdmsrl(MSR_IA32_VMX_MISC, _vmx_misc_cap);
@@ -321,7 +319,7 @@ static int vmx_init_vmcs_config(bool bsp
         return -EINVAL;
     }
 
-    if ( _vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_SECONDARY_CONTROLS )
+    if ( caps.cpu_based_exec_control & CPU_BASED_ACTIVATE_SECONDARY_CONTROLS )
     {
         min = 0;
         opt = (SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES |
@@ -351,7 +349,7 @@ static int vmx_init_vmcs_config(bool bsp
          * "APIC Register Virtualization" and "Virtual Interrupt Delivery"
          * can be set only when "use TPR shadow" is set
          */
-        if ( (_vmx_cpu_based_exec_control & CPU_BASED_TPR_SHADOW) &&
+        if ( (caps.cpu_based_exec_control & CPU_BASED_TPR_SHADOW) &&
              opt_apicv_enabled )
             opt |= SECONDARY_EXEC_APIC_REGISTER_VIRT |
                    SECONDARY_EXEC_VIRTUAL_INTR_DELIVERY |
@@ -362,7 +360,7 @@ static int vmx_init_vmcs_config(bool bsp
             MSR_IA32_VMX_PROCBASED_CTLS2, &mismatch);
     }
 
-    if ( _vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_TERTIARY_CONTROLS )
+    if ( caps.cpu_based_exec_control & CPU_BASED_ACTIVATE_TERTIARY_CONTROLS )
     {
         uint64_t opt = 0;
 
@@ -498,7 +496,6 @@ static int vmx_init_vmcs_config(bool bsp
     {
         /* First time through. */
         vmx_caps = caps;
-        vmx_cpu_based_exec_control = _vmx_cpu_based_exec_control;
         vmx_secondary_exec_control = _vmx_secondary_exec_control;
         vmx_tertiary_exec_control  = _vmx_tertiary_exec_control;
         vmx_ept_vpid_cap           = _vmx_ept_vpid_cap;
@@ -531,7 +528,7 @@ static int vmx_init_vmcs_config(bool bsp
             vmx_caps.pin_based_exec_control, caps.pin_based_exec_control);
         mismatch |= cap_check(
             "CPU-Based Exec Control",
-            vmx_cpu_based_exec_control, _vmx_cpu_based_exec_control);
+            vmx_caps.cpu_based_exec_control, caps.cpu_based_exec_control);
         mismatch |= cap_check(
             "Secondary Exec Control",
             vmx_secondary_exec_control, _vmx_secondary_exec_control);
@@ -1111,7 +1108,7 @@ static int construct_vmcs(struct vcpu *v
     /* VMCS controls. */
     __vmwrite(PIN_BASED_VM_EXEC_CONTROL, vmx_caps.pin_based_exec_control);
 
-    v->arch.hvm.vmx.exec_control = vmx_cpu_based_exec_control;
+    v->arch.hvm.vmx.exec_control = vmx_caps.cpu_based_exec_control;
     if ( d->arch.vtsc && !cpu_has_vmx_tsc_scaling )
         v->arch.hvm.vmx.exec_control |= CPU_BASED_RDTSC_EXITING;
 
@@ -2214,7 +2211,6 @@ int __init vmx_vmcs_init(void)
          * Make sure all dependent features are off as well.
          */
         memset(&vmx_caps, 0, sizeof(vmx_caps));
-        vmx_cpu_based_exec_control = 0;
         vmx_secondary_exec_control = 0;
         vmx_tertiary_exec_control  = 0;
         vmx_vmexit_control         = 0;
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -210,7 +210,6 @@ void vmx_vmcs_reload(struct vcpu *v);
 #define CPU_BASED_MONITOR_EXITING             0x20000000U
 #define CPU_BASED_PAUSE_EXITING               0x40000000U
 #define CPU_BASED_ACTIVATE_SECONDARY_CONTROLS 0x80000000U
-extern u32 vmx_cpu_based_exec_control;
 
 #define PIN_BASED_EXT_INTR_MASK         0x00000001
 #define PIN_BASED_NMI_EXITING           0x00000008
@@ -297,6 +296,7 @@ extern u64 vmx_ept_vpid_cap;
 struct vmx_caps {
     uint64_t basic_msr;
     uint32_t pin_based_exec_control;
+    uint32_t cpu_based_exec_control;
 };
 extern struct vmx_caps vmx_caps;
 
@@ -305,15 +305,15 @@ extern struct vmx_caps vmx_caps;
 #define cpu_has_vmx_virtualize_apic_accesses \
     (vmx_secondary_exec_control & SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES)
 #define cpu_has_vmx_tpr_shadow \
-    (vmx_cpu_based_exec_control & CPU_BASED_TPR_SHADOW)
+    (vmx_caps.cpu_based_exec_control & CPU_BASED_TPR_SHADOW)
 #define cpu_has_vmx_vnmi \
     (vmx_caps.pin_based_exec_control & PIN_BASED_VIRTUAL_NMIS)
 #define cpu_has_vmx_msr_bitmap \
-    (vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_MSR_BITMAP)
+    (vmx_caps.cpu_based_exec_control & CPU_BASED_ACTIVATE_MSR_BITMAP)
 #define cpu_has_vmx_secondary_exec_control \
-    (vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_SECONDARY_CONTROLS)
+    (vmx_caps.cpu_based_exec_control & CPU_BASED_ACTIVATE_SECONDARY_CONTROLS)
 #define cpu_has_vmx_tertiary_exec_control \
-    (vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_TERTIARY_CONTROLS)
+    (vmx_caps.cpu_based_exec_control & CPU_BASED_ACTIVATE_TERTIARY_CONTROLS)
 #define cpu_has_vmx_ept \
     (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_EPT)
 #define cpu_has_vmx_dt_exiting \
@@ -323,7 +323,7 @@ extern struct vmx_caps vmx_caps;
 #define cpu_has_vmx_vpid \
     (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_VPID)
 #define cpu_has_monitor_trap_flag \
-    (vmx_cpu_based_exec_control & CPU_BASED_MONITOR_TRAP_FLAG)
+    (vmx_caps.cpu_based_exec_control & CPU_BASED_MONITOR_TRAP_FLAG)
 #define cpu_has_vmx_pat \
     (vmx_vmentry_control & VM_ENTRY_LOAD_GUEST_PAT)
 #define cpu_has_vmx_efer \


