Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E988867C4C
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 17:43:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685646.1066704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ree4t-0000Jx-PN; Mon, 26 Feb 2024 16:43:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685646.1066704; Mon, 26 Feb 2024 16:43:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ree4t-0000Ev-KU; Mon, 26 Feb 2024 16:43:43 +0000
Received: by outflank-mailman (input) for mailman id 685646;
 Mon, 26 Feb 2024 16:43:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPQ6=KD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ree4s-0000BK-Fu
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 16:43:42 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32db792f-d4c6-11ee-8a58-1f161083a0e0;
 Mon, 26 Feb 2024 17:43:41 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-512b13bf764so4022409e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 08:43:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d18-20020a056402401200b005640022af58sm2509237eda.83.2024.02.26.08.43.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 08:43:41 -0800 (PST)
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
X-Inumbo-ID: 32db792f-d4c6-11ee-8a58-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708965821; x=1709570621; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9n+bbgXBOrLiMHM6zz3tWMkdYfLaMnbCqmKV8XjOqSc=;
        b=LAHOrbhOX03bGkAeSyUIQCZqlxKaBHl+A0Lw8oZHYf/X82uwcPHnwUQWGqhW616bdI
         zjKpb3lGm+C1aaUyzNdjfTq0x7u+1ZF7yUQrRTsYgSNpagjoxOepww32ci7J6vUVaZ6T
         cfQi8ZJ7/0ye0rTSoyqVKR3MPEDKFLITh0hVZObNVPaGAna3l9hsMBeHSIJdgzqBisGV
         QdCZS05/CVz/DuwGlQzF5kS/dI89ttt7Wf4lTHpx7eO3O/cfLKNXWlta6ZW4jxAouVH6
         S6Ad9KHfuX2I99OZjju60X4Qkikia7jtHhY6fGbYGiItAQxNBtTmpBydlFJlx8R5b4Ss
         GZ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708965821; x=1709570621;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9n+bbgXBOrLiMHM6zz3tWMkdYfLaMnbCqmKV8XjOqSc=;
        b=DIT5+O1PT3JblcDsg79dCEGLb/Nw+mLJfHRouGfMjf+LmdeGYKxG5O/2Jn6p05kSss
         ppkewOxJurlwYVqu825+05Evx9J03Hm/+TNViRH5cOF3aIIWlx5CFzamQM0F+d0C8rac
         NSeaCBy4WdjxlZVGjiu/UVNz8VJexHnDo51M5Q1iiHDw3e/LKaOEzaxHTFXDR1YiOOmK
         qHqlYIrpqO8YGnC7hOEU9J3tpICg3HBqs27BAn3NsDgIyduI+rcmLDKHQ8ciTkXIwb+h
         JjyTEV6m3E44uzjBmhZf2FnUNSQ5Ws/jo9jJtpZyWGOR/5FYUJLdGB03O/FwbrERVR+E
         eRtw==
X-Gm-Message-State: AOJu0YyU2k6hXNlTyJBiWFwUD3IsarHtLYPuC5b1NmkC1qb3oiFXNoAa
	f0CJeK4bEb+2IEKtNYi4h1UO43E1ROJRSqtwN1tirW+ZfAA328B2vznJHNt22zU5WfuRyIbjZuU
	=
X-Google-Smtp-Source: AGHT+IGNNeXW8Ss1pszPMFziokqO8jfdNI1FqfvC4Bl8vdK9qMAgCYc7W6+h/6lo68CWeWhxqVdjZw==
X-Received: by 2002:ac2:47fa:0:b0:512:cbf4:8f93 with SMTP id b26-20020ac247fa000000b00512cbf48f93mr4744980lfp.19.1708965821334;
        Mon, 26 Feb 2024 08:43:41 -0800 (PST)
Message-ID: <57a00d7b-1df1-4b74-b990-8b1e88784589@suse.com>
Date: Mon, 26 Feb 2024 17:43:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 05/12] VMX: convert vmx_pin_based_exec_control
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

... to a field in the capability/controls struct. Use an instance of
that struct also in vmx_init_vmcs_config().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: Add initializer to vmx_init_vmcs_config() new local var.
v2: New.

--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -162,7 +162,6 @@ static int cf_check parse_ept_param_runt
 
 /* Dynamic (run-time adjusted) execution control flags. */
 struct vmx_caps __ro_after_init vmx_caps;
-u32 vmx_pin_based_exec_control __read_mostly;
 u32 vmx_cpu_based_exec_control __read_mostly;
 u32 vmx_secondary_exec_control __read_mostly;
 uint64_t vmx_tertiary_exec_control __read_mostly;
@@ -261,7 +260,7 @@ static bool cap_check(
 static int vmx_init_vmcs_config(bool bsp)
 {
     u32 vmx_basic_msr_low, vmx_basic_msr_high, min, opt;
-    u32 _vmx_pin_based_exec_control;
+    struct vmx_caps caps = {};
     u32 _vmx_cpu_based_exec_control;
     u32 _vmx_secondary_exec_control = 0;
     uint64_t _vmx_tertiary_exec_control = 0;
@@ -278,7 +277,7 @@ static int vmx_init_vmcs_config(bool bsp
            PIN_BASED_NMI_EXITING);
     opt = (PIN_BASED_VIRTUAL_NMIS |
            PIN_BASED_POSTED_INTERRUPT);
-    _vmx_pin_based_exec_control = adjust_vmx_controls(
+    caps.pin_based_exec_control = adjust_vmx_controls(
         "Pin-Based Exec Control", min, opt,
         MSR_IA32_VMX_PINBASED_CTLS, &mismatch);
 
@@ -440,7 +439,7 @@ static int vmx_init_vmcs_config(bool bsp
     if ( (_vmx_secondary_exec_control & SECONDARY_EXEC_PAUSE_LOOP_EXITING) &&
           ple_gap == 0 )
     {
-        if ( !vmx_pin_based_exec_control )
+        if ( !vmx_caps.pin_based_exec_control )
             printk(XENLOG_INFO "Disable Pause-Loop Exiting.\n");
         _vmx_secondary_exec_control &= ~ SECONDARY_EXEC_PAUSE_LOOP_EXITING;
     }
@@ -458,10 +457,10 @@ static int vmx_init_vmcs_config(bool bsp
      * is a minimal requirement, only check the former, which is optional.
      */
     if ( !(_vmx_secondary_exec_control & SECONDARY_EXEC_VIRTUAL_INTR_DELIVERY) )
-        _vmx_pin_based_exec_control &= ~PIN_BASED_POSTED_INTERRUPT;
+        caps.pin_based_exec_control &= ~PIN_BASED_POSTED_INTERRUPT;
 
     if ( iommu_intpost &&
-         !(_vmx_pin_based_exec_control & PIN_BASED_POSTED_INTERRUPT) )
+         !(caps.pin_based_exec_control & PIN_BASED_POSTED_INTERRUPT) )
     {
         printk("Intel VT-d Posted Interrupt is disabled for CPU-side Posted "
                "Interrupt is not enabled\n");
@@ -495,10 +494,10 @@ static int vmx_init_vmcs_config(bool bsp
     if ( mismatch )
         return -EINVAL;
 
-    if ( !vmx_pin_based_exec_control )
+    if ( !vmx_caps.pin_based_exec_control )
     {
         /* First time through. */
-        vmx_pin_based_exec_control = _vmx_pin_based_exec_control;
+        vmx_caps = caps;
         vmx_cpu_based_exec_control = _vmx_cpu_based_exec_control;
         vmx_secondary_exec_control = _vmx_secondary_exec_control;
         vmx_tertiary_exec_control  = _vmx_tertiary_exec_control;
@@ -529,7 +528,7 @@ static int vmx_init_vmcs_config(bool bsp
             vmcs_revision_id, vmx_basic_msr_low & VMX_BASIC_REVISION_MASK);
         mismatch |= cap_check(
             "Pin-Based Exec Control",
-            vmx_pin_based_exec_control, _vmx_pin_based_exec_control);
+            vmx_caps.pin_based_exec_control, caps.pin_based_exec_control);
         mismatch |= cap_check(
             "CPU-Based Exec Control",
             vmx_cpu_based_exec_control, _vmx_cpu_based_exec_control);
@@ -1110,7 +1109,7 @@ static int construct_vmcs(struct vcpu *v
     vmx_vmcs_enter(v);
 
     /* VMCS controls. */
-    __vmwrite(PIN_BASED_VM_EXEC_CONTROL, vmx_pin_based_exec_control);
+    __vmwrite(PIN_BASED_VM_EXEC_CONTROL, vmx_caps.pin_based_exec_control);
 
     v->arch.hvm.vmx.exec_control = vmx_cpu_based_exec_control;
     if ( d->arch.vtsc && !cpu_has_vmx_tsc_scaling )
@@ -2136,7 +2135,7 @@ void vmcs_dump_vcpu(struct vcpu *v)
     printk("TSC Offset = 0x%016lx  TSC Multiplier = 0x%016lx\n",
            vmr(TSC_OFFSET), vmr(TSC_MULTIPLIER));
     if ( (v->arch.hvm.vmx.exec_control & CPU_BASED_TPR_SHADOW) ||
-         (vmx_pin_based_exec_control & PIN_BASED_POSTED_INTERRUPT) )
+         (vmx_caps.pin_based_exec_control & PIN_BASED_POSTED_INTERRUPT) )
         printk("TPR Threshold = 0x%02x  PostedIntrVec = 0x%02x\n",
                vmr32(TPR_THRESHOLD), vmr16(POSTED_INTR_NOTIFICATION_VECTOR));
     if ( (v->arch.hvm.vmx.secondary_exec_control &
@@ -2215,7 +2214,6 @@ int __init vmx_vmcs_init(void)
          * Make sure all dependent features are off as well.
          */
         memset(&vmx_caps, 0, sizeof(vmx_caps));
-        vmx_pin_based_exec_control = 0;
         vmx_cpu_based_exec_control = 0;
         vmx_secondary_exec_control = 0;
         vmx_tertiary_exec_control  = 0;
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -1057,7 +1057,7 @@ static void load_shadow_control(struct v
      * and EXCEPTION
      * Enforce the removed features
      */
-    nvmx_update_pin_control(v, vmx_pin_based_exec_control);
+    nvmx_update_pin_control(v, vmx_caps.pin_based_exec_control);
     vmx_update_cpu_exec_control(v);
     vmx_update_secondary_exec_control(v);
     nvmx_update_exit_control(v, vmx_vmexit_control);
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -217,7 +217,6 @@ extern u32 vmx_cpu_based_exec_control;
 #define PIN_BASED_VIRTUAL_NMIS          0x00000020
 #define PIN_BASED_PREEMPT_TIMER         0x00000040
 #define PIN_BASED_POSTED_INTERRUPT      0x00000080
-extern u32 vmx_pin_based_exec_control;
 
 #define VM_EXIT_SAVE_DEBUG_CNTRLS       0x00000004
 #define VM_EXIT_IA32E_MODE              0x00000200
@@ -297,6 +296,7 @@ extern u64 vmx_ept_vpid_cap;
 /* Capabilities and dynamic (run-time adjusted) execution control flags. */
 struct vmx_caps {
     uint64_t basic_msr;
+    uint32_t pin_based_exec_control;
 };
 extern struct vmx_caps vmx_caps;
 
@@ -307,7 +307,7 @@ extern struct vmx_caps vmx_caps;
 #define cpu_has_vmx_tpr_shadow \
     (vmx_cpu_based_exec_control & CPU_BASED_TPR_SHADOW)
 #define cpu_has_vmx_vnmi \
-    (vmx_pin_based_exec_control & PIN_BASED_VIRTUAL_NMIS)
+    (vmx_caps.pin_based_exec_control & PIN_BASED_VIRTUAL_NMIS)
 #define cpu_has_vmx_msr_bitmap \
     (vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_MSR_BITMAP)
 #define cpu_has_vmx_secondary_exec_control \
@@ -344,7 +344,7 @@ extern struct vmx_caps vmx_caps;
 #define cpu_has_vmx_virtualize_x2apic_mode \
     (vmx_secondary_exec_control & SECONDARY_EXEC_VIRTUALIZE_X2APIC_MODE)
 #define cpu_has_vmx_posted_intr_processing \
-    (vmx_pin_based_exec_control & PIN_BASED_POSTED_INTERRUPT)
+    (vmx_caps.pin_based_exec_control & PIN_BASED_POSTED_INTERRUPT)
 #define cpu_has_vmx_vmcs_shadowing \
     (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_VMCS_SHADOWING)
 #define cpu_has_vmx_vmfunc \


