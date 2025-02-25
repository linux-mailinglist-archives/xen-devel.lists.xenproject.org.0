Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 633E5A43DCF
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 12:38:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895683.1304350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmtGd-0004Cd-C2; Tue, 25 Feb 2025 11:38:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895683.1304350; Tue, 25 Feb 2025 11:38:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmtGd-0004A3-8O; Tue, 25 Feb 2025 11:38:27 +0000
Received: by outflank-mailman (input) for mailman id 895683;
 Tue, 25 Feb 2025 11:38:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wvcP=VQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tmtGb-0002yH-AF
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 11:38:25 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05b08b1e-f36d-11ef-9aae-95dc52dad729;
 Tue, 25 Feb 2025 12:38:24 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-38f3ac22948so2775907f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2025 03:38:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd882dacsm2011394f8f.55.2025.02.25.03.38.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 03:38:23 -0800 (PST)
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
X-Inumbo-ID: 05b08b1e-f36d-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740483504; x=1741088304; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=A+f6cERMr2V6QYmDlZeR9EgHe8xVGJETSHpn3wIcu1U=;
        b=KByuSYqOhC+S37gQqqRNeks+rIt6609H/13sWprNgUfctqlO0WBN1K+jzGQNj7wwM4
         Cz3WfjHaCT1UNEFB8eI4XauTxMr+mlns6hHx/F//4NEawEi9xOSqdhrcXAtJrvH+u0mq
         +kkZyTjeCLtYfNN+FRMMCoqI6TLEXVtPQSN0iEsiJ/Ecmqd3WIH8ZMCqEkSlEX2Hwqzo
         NN5UQGD9Y+VBopj9MoW4pt7uI2WWRDtIR+9s9eg3DKT4VyzbzNN4nrdkZpVXrZFyhiwq
         wAX/6QyneHJLQ6XTv7++JFsHBpAkH9oa6m3xkUhZovfeksMhIZGYXLi/Fv3+79a86sM7
         v9Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740483504; x=1741088304;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A+f6cERMr2V6QYmDlZeR9EgHe8xVGJETSHpn3wIcu1U=;
        b=cXLG+u3FXxF7mZVTiw8uvDsLsGQ7+XCDqKaN7P2Ph//DOCaka4fPl5DhrX2NL4Ql1g
         3uJh93Ax0LL8w0zrwG64YeIBbIeyIx5/ZIT8aBVoypQW8b/qmzcK2CfWGAT4JomtuuMk
         AVmnMDN+sYnHqgGi8tluaId98ZGPQTRg/9Wgn8IsdljIW5mmUHs16BK3IKk6J/NEpBaP
         i2dS7moNosrT88g8zx5EjaHGzj5XGRV4ix9RjJLkq0tETC7PeLsBFXVpKocdiNfmj7lf
         QfDv1NgEnYd9N7wHXRCAHfHhFbGkzF6ZMJTi6mPiAlsACj5uqL3jG0pluT/pHSxeS/K/
         NTDw==
X-Gm-Message-State: AOJu0Yz7N2Li2dOJaek/mZ5hjEadG6lVsE7xZ/zzgAW1EmeMmHCD4U9p
	A14+qsKa95QGHNEpqoySSkQzKOti0cL/2dJuWxUbNLxLGoivxLpSPYNJy5XZV4q/IIvKDmihQZc
	=
X-Gm-Gg: ASbGncto+Y8cOCzOT3FR90c8uwYmvZ/fAWPPMH6mwnnPwwW00TihvO/gOxB52XeanV4
	nFiyM5JzYxJJv1Etp0DdXCBEBFmgSAISSR4r3ZTvsgP/TaaYj4a+1XxLloP31Z3wnS1hKGJIKFd
	r/GTmbifghh/mMj+iQv3jD3+cbdafPDdDsZsqEFgVrq5p9EFgHaPxGdmA07v5eQtz0vv5ONg6r+
	oMIGI9WglVkApcdm98P93wzssZg3ezwe+xacCXz5DpwtcHS0GW33dgzW3HtgRqul/Ey/xqzLumY
	AyxjJpjbNzjsjtsnNyNTOJQYFhMPH6rXWmW1UTa/dVRoR8W4qOrkqzPFyuIhK1ewh6zA59vwerW
	o9H6RwE1DLAc=
X-Google-Smtp-Source: AGHT+IEW92YODdoW9X9CHm6IKG7EL5QPZ0TbtF6H4hDYk9C4SF+cyHj1ePLvx3jgE+T4l2CHcGaN+g==
X-Received: by 2002:a5d:4882:0:b0:38d:e378:20f7 with SMTP id ffacd0b85a97d-390cc6304abmr1885722f8f.41.1740483503937;
        Tue, 25 Feb 2025 03:38:23 -0800 (PST)
Message-ID: <10001295-6482-4bac-92fa-f89aad16bf40@suse.com>
Date: Tue, 25 Feb 2025 12:38:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 04/11] VMX: convert vmx_pin_based_exec_control
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <748548e8-79e5-4957-be16-c5ea4d202d21@suse.com>
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
In-Reply-To: <748548e8-79e5-4957-be16-c5ea4d202d21@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

... to a field in the capability/controls struct. Use an instance of
that struct also in vmx_init_vmcs_config().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
---
v4: Re-base.
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
@@ -263,7 +262,7 @@ static bool cap_check(
 static int vmx_init_vmcs_config(bool bsp)
 {
     u32 vmx_basic_msr_low, vmx_basic_msr_high, min, opt;
-    u32 _vmx_pin_based_exec_control;
+    struct vmx_caps caps = {};
     u32 _vmx_cpu_based_exec_control;
     u32 _vmx_secondary_exec_control = 0;
     uint64_t _vmx_tertiary_exec_control = 0;
@@ -280,7 +279,7 @@ static int vmx_init_vmcs_config(bool bsp
            PIN_BASED_NMI_EXITING);
     opt = (PIN_BASED_VIRTUAL_NMIS |
            PIN_BASED_POSTED_INTERRUPT);
-    _vmx_pin_based_exec_control = adjust_vmx_controls(
+    caps.pin_based_exec_control = adjust_vmx_controls(
         "Pin-Based Exec Control", min, opt,
         MSR_IA32_VMX_PINBASED_CTLS, &mismatch);
 
@@ -443,7 +442,7 @@ static int vmx_init_vmcs_config(bool bsp
     if ( (_vmx_secondary_exec_control & SECONDARY_EXEC_PAUSE_LOOP_EXITING) &&
           ple_gap == 0 )
     {
-        if ( !vmx_pin_based_exec_control )
+        if ( !vmx_caps.pin_based_exec_control )
             printk(XENLOG_INFO "Disable Pause-Loop Exiting.\n");
         _vmx_secondary_exec_control &= ~ SECONDARY_EXEC_PAUSE_LOOP_EXITING;
     }
@@ -461,10 +460,10 @@ static int vmx_init_vmcs_config(bool bsp
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
@@ -498,10 +497,10 @@ static int vmx_init_vmcs_config(bool bsp
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
@@ -532,7 +531,7 @@ static int vmx_init_vmcs_config(bool bsp
             vmcs_revision_id, vmx_basic_msr_low & VMX_BASIC_REVISION_MASK);
         mismatch |= cap_check(
             "Pin-Based Exec Control",
-            vmx_pin_based_exec_control, _vmx_pin_based_exec_control);
+            vmx_caps.pin_based_exec_control, caps.pin_based_exec_control);
         mismatch |= cap_check(
             "CPU-Based Exec Control",
             vmx_cpu_based_exec_control, _vmx_cpu_based_exec_control);
@@ -1113,7 +1112,7 @@ static int construct_vmcs(struct vcpu *v
     vmx_vmcs_enter(v);
 
     /* VMCS controls. */
-    __vmwrite(PIN_BASED_VM_EXEC_CONTROL, vmx_pin_based_exec_control);
+    __vmwrite(PIN_BASED_VM_EXEC_CONTROL, vmx_caps.pin_based_exec_control);
 
     v->arch.hvm.vmx.exec_control = vmx_cpu_based_exec_control;
     if ( d->arch.vtsc && !cpu_has_vmx_tsc_scaling )
@@ -2150,7 +2149,7 @@ void vmcs_dump_vcpu(struct vcpu *v)
     printk("TSC Offset = 0x%016lx  TSC Multiplier = 0x%016lx\n",
            vmr(TSC_OFFSET), vmr(TSC_MULTIPLIER));
     if ( (v->arch.hvm.vmx.exec_control & CPU_BASED_TPR_SHADOW) ||
-         (vmx_pin_based_exec_control & PIN_BASED_POSTED_INTERRUPT) )
+         (vmx_caps.pin_based_exec_control & PIN_BASED_POSTED_INTERRUPT) )
         printk("TPR Threshold = 0x%02x  PostedIntrVec = 0x%02x\n",
                vmr32(TPR_THRESHOLD), vmr16(POSTED_INTR_NOTIFICATION_VECTOR));
     if ( (v->arch.hvm.vmx.secondary_exec_control &
@@ -2229,7 +2228,6 @@ int __init vmx_vmcs_init(void)
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
@@ -303,6 +302,7 @@ extern u64 vmx_ept_vpid_cap;
 /* Capabilities and dynamic (run-time adjusted) execution control flags. */
 struct vmx_caps {
     uint64_t basic_msr;
+    uint32_t pin_based_exec_control;
 };
 extern struct vmx_caps vmx_caps;
 
@@ -317,7 +317,7 @@ extern struct vmx_caps vmx_caps;
      vmx_cpu_based_exec_control & CPU_BASED_TPR_SHADOW)
 #define cpu_has_vmx_vnmi \
     (IS_ENABLED(CONFIG_INTEL_VMX) && \
-     vmx_pin_based_exec_control & PIN_BASED_VIRTUAL_NMIS)
+     (vmx_caps.pin_based_exec_control & PIN_BASED_VIRTUAL_NMIS))
 #define cpu_has_vmx_msr_bitmap \
     (IS_ENABLED(CONFIG_INTEL_VMX) && \
      vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_MSR_BITMAP)
@@ -371,7 +371,7 @@ extern struct vmx_caps vmx_caps;
      vmx_secondary_exec_control & SECONDARY_EXEC_VIRTUALIZE_X2APIC_MODE)
 #define cpu_has_vmx_posted_intr_processing \
     (IS_ENABLED(CONFIG_INTEL_VMX) && \
-     vmx_pin_based_exec_control & PIN_BASED_POSTED_INTERRUPT)
+     (vmx_caps.pin_based_exec_control & PIN_BASED_POSTED_INTERRUPT))
 #define cpu_has_vmx_vmcs_shadowing \
     (IS_ENABLED(CONFIG_INTEL_VMX) && \
      vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_VMCS_SHADOWING)


