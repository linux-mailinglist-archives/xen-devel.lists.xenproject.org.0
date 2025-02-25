Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4276A43DDF
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 12:40:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895699.1304370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmtIj-0006fM-2G; Tue, 25 Feb 2025 11:40:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895699.1304370; Tue, 25 Feb 2025 11:40:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmtIi-0006c7-VS; Tue, 25 Feb 2025 11:40:36 +0000
Received: by outflank-mailman (input) for mailman id 895699;
 Tue, 25 Feb 2025 11:40:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wvcP=VQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tmtHa-0002yH-57
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 11:39:26 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29b9dde5-f36d-11ef-9aae-95dc52dad729;
 Tue, 25 Feb 2025 12:39:25 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-38f488f3161so2980564f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2025 03:39:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd86cca1sm1988689f8f.24.2025.02.25.03.39.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 03:39:24 -0800 (PST)
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
X-Inumbo-ID: 29b9dde5-f36d-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740483564; x=1741088364; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kvNtan6HIHBpRNJGMzv9mjkqb85FcLGIsPKTiKpkSvY=;
        b=S3hmDTUvqJaWTfUeLoRRV4KKm/cOkDMoeQRd4ZfRUp8gnp30bU0kr+jP4b6wOPpKwV
         jVLxcwAJhGMHRUM0K79HE/rrSeJrpT7/oju1fMESSUI5Y8hFBKUQN4L7ltMvng3TAxjt
         fKFPR9y/CSKII7s3V+pRjKLIHYopB82QgLZMPxOk7nr3kueVaRYxdUGoK4d2GQ13EV6a
         7XA4wIFV75FuYIY3tTfXja+WpOaV/HRX/kZ+sclmmHx1hLxmjeorWvXXtTzcFqZOb+yj
         bUeV7Kt43bzcyc/1IIliJTH5jDcH7DcYWpBycR28J0Apt7opBt9Q0IFh/S4KZdJ4X5MM
         DGUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740483564; x=1741088364;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kvNtan6HIHBpRNJGMzv9mjkqb85FcLGIsPKTiKpkSvY=;
        b=R7V3Vap2P574rjdPCq76kNHUV0ExKVWwQ9gvXjoTfRoLPPWrszcyxrTd/ekKojOzk4
         X4HX32WbtGVjHJqZNgPiIrs28/k9lUMw06y8No7fbOXesX+dSbseV/2cPFGBePYo5q/r
         +WLhUFclNGQOo/fRBF4pqmQYXr8W3/yU4Yl+NcMyrU3ekyNmJt65zhQ2mKi7Gz8XqOJL
         D18WBL5HT10i9RbsOgEYH5WVJGdW0oZu+3TGPQl+Y2xaLNiXB0cJ4UByQDzBN864K46p
         DYFPSz64Sr036uVHpMtDrgPMU2UnM8HUYZMN8tzVqL6puIaXIq2S/Ohfev++zXWJ40TC
         IBeQ==
X-Gm-Message-State: AOJu0YzERPPNMsf1T68BFZrxzGjTETFXheJE0sZJBt6XlD3C2s+T4E8J
	Gb6/8bHKf2+N9pEyCgPUEirgCIQARBKaf9nE5Vk/Uml9soOz1SXjqEGgW6gC/X25OUi5OB2XCkc
	=
X-Gm-Gg: ASbGncuZPyjYYYMBLX5fevZQ5gx7GSndmGU7dWAh/HHKGXVQzxLso083mRCRzgLvLXv
	AWQVEzsdQRenVvrkYi/onu6vunaOzUYB4Ti/q52s7Ol22fRskZkh7H025Vtf4fWwExncGda9H/M
	e8gQ/NyTfWt99yQKFYpQ/a83HBaUXDlt37Ifir0uTOQ8262A/fYEz1fvyjn6Fqj/CGUS54gwJLp
	d6U4CVDzmmbc01Q76Ibr7SiHemUSEP/xPc1jw8nS+2bD7TBRJ63gF1e2GVtWrCWhSqJLOB3q4cM
	Iy+8j+6seNbo9v3gBUk6MDz5RSSFIuYcCd59xUBj0lLqcUjX2gjXRYwd57f+bA33w72g2/kcWYx
	PiXwpMpw6ouA=
X-Google-Smtp-Source: AGHT+IEFMNPKc3Sav1tQkGhOzBM8I0/QgxLhgHxzE7hmEWHmkb6djRe7GH0tPjefLSyCPrr8HQgtaA==
X-Received: by 2002:a05:6000:1541:b0:38d:d767:364 with SMTP id ffacd0b85a97d-38f70789915mr12699292f8f.13.1740483564393;
        Tue, 25 Feb 2025 03:39:24 -0800 (PST)
Message-ID: <b21b40b0-f2c5-4ccd-bb0a-125569d5803d@suse.com>
Date: Tue, 25 Feb 2025 12:39:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 06/11] VMX: convert vmx_secondary_exec_control
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

... to a field in the capability/controls struct.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
---
v4: Re-base.
v2: New.

--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -162,7 +162,6 @@ static int cf_check parse_ept_param_runt
 
 /* Dynamic (run-time adjusted) execution control flags. */
 struct vmx_caps __ro_after_init vmx_caps;
-u32 vmx_secondary_exec_control __read_mostly;
 uint64_t vmx_tertiary_exec_control __read_mostly;
 u32 vmx_vmexit_control __read_mostly;
 u32 vmx_vmentry_control __read_mostly;
@@ -262,7 +261,6 @@ static int vmx_init_vmcs_config(bool bsp
 {
     u32 vmx_basic_msr_low, vmx_basic_msr_high, min, opt;
     struct vmx_caps caps = {};
-    u32 _vmx_secondary_exec_control = 0;
     uint64_t _vmx_tertiary_exec_control = 0;
     u64 _vmx_ept_vpid_cap = 0;
     u64 _vmx_misc_cap = 0;
@@ -357,7 +355,7 @@ static int vmx_init_vmcs_config(bool bsp
                    SECONDARY_EXEC_VIRTUAL_INTR_DELIVERY |
                    SECONDARY_EXEC_VIRTUALIZE_X2APIC_MODE;
 
-        _vmx_secondary_exec_control = adjust_vmx_controls(
+        caps.secondary_exec_control = adjust_vmx_controls(
             "Secondary Exec Control", min, opt,
             MSR_IA32_VMX_PROCBASED_CTLS2, &mismatch);
     }
@@ -373,7 +371,7 @@ static int vmx_init_vmcs_config(bool bsp
     }
 
     /* The IA32_VMX_EPT_VPID_CAP MSR exists only when EPT or VPID available */
-    if ( _vmx_secondary_exec_control & (SECONDARY_EXEC_ENABLE_EPT |
+    if ( caps.secondary_exec_control & (SECONDARY_EXEC_ENABLE_EPT |
                                         SECONDARY_EXEC_ENABLE_VPID) )
     {
         rdmsrl(MSR_IA32_VMX_EPT_VPID_CAP, _vmx_ept_vpid_cap);
@@ -395,7 +393,7 @@ static int vmx_init_vmcs_config(bool bsp
         if ( !(_vmx_ept_vpid_cap & VMX_EPT_MEMORY_TYPE_WB) ||
              !(_vmx_ept_vpid_cap & VMX_EPT_WALK_LENGTH_4_SUPPORTED) ||
              !(_vmx_ept_vpid_cap & VMX_EPT_INVEPT_ALL_CONTEXT) )
-            _vmx_secondary_exec_control &= ~SECONDARY_EXEC_ENABLE_EPT;
+            caps.secondary_exec_control &= ~SECONDARY_EXEC_ENABLE_EPT;
 
         /*
          * the CPU must support INVVPID all context invalidation, because we
@@ -404,14 +402,14 @@ static int vmx_init_vmcs_config(bool bsp
          * Or we just don't use VPID.
          */
         if ( !(_vmx_ept_vpid_cap & VMX_VPID_INVVPID_ALL_CONTEXT) )
-            _vmx_secondary_exec_control &= ~SECONDARY_EXEC_ENABLE_VPID;
+            caps.secondary_exec_control &= ~SECONDARY_EXEC_ENABLE_VPID;
 
         /* EPT A/D bits is required for PML */
         if ( !(_vmx_ept_vpid_cap & VMX_EPT_AD_BIT) )
-            _vmx_secondary_exec_control &= ~SECONDARY_EXEC_ENABLE_PML;
+            caps.secondary_exec_control &= ~SECONDARY_EXEC_ENABLE_PML;
     }
 
-    if ( _vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_EPT )
+    if ( caps.secondary_exec_control & SECONDARY_EXEC_ENABLE_EPT )
     {
         /*
          * To use EPT we expect to be able to clear certain intercepts.
@@ -424,25 +422,25 @@ static int vmx_init_vmcs_config(bool bsp
         if ( must_be_one & (CPU_BASED_INVLPG_EXITING |
                             CPU_BASED_CR3_LOAD_EXITING |
                             CPU_BASED_CR3_STORE_EXITING) )
-            _vmx_secondary_exec_control &=
+            caps.secondary_exec_control &=
                 ~(SECONDARY_EXEC_ENABLE_EPT |
                   SECONDARY_EXEC_UNRESTRICTED_GUEST);
     }
 
     /* PML cannot be supported if EPT is not used */
-    if ( !(_vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_EPT) )
-        _vmx_secondary_exec_control &= ~SECONDARY_EXEC_ENABLE_PML;
+    if ( !(caps.secondary_exec_control & SECONDARY_EXEC_ENABLE_EPT) )
+        caps.secondary_exec_control &= ~SECONDARY_EXEC_ENABLE_PML;
 
     /* Turn off opt_ept_pml if PML feature is not present. */
-    if ( !(_vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_PML) )
+    if ( !(caps.secondary_exec_control & SECONDARY_EXEC_ENABLE_PML) )
         opt_ept_pml = false;
 
-    if ( (_vmx_secondary_exec_control & SECONDARY_EXEC_PAUSE_LOOP_EXITING) &&
+    if ( (caps.secondary_exec_control & SECONDARY_EXEC_PAUSE_LOOP_EXITING) &&
           ple_gap == 0 )
     {
         if ( !vmx_caps.pin_based_exec_control )
             printk(XENLOG_INFO "Disable Pause-Loop Exiting.\n");
-        _vmx_secondary_exec_control &= ~ SECONDARY_EXEC_PAUSE_LOOP_EXITING;
+        caps.secondary_exec_control &= ~ SECONDARY_EXEC_PAUSE_LOOP_EXITING;
     }
 
     min = VM_EXIT_ACK_INTR_ON_EXIT;
@@ -457,7 +455,7 @@ static int vmx_init_vmcs_config(bool bsp
      * delivery" and "acknowledge interrupt on exit" is set. For the latter
      * is a minimal requirement, only check the former, which is optional.
      */
-    if ( !(_vmx_secondary_exec_control & SECONDARY_EXEC_VIRTUAL_INTR_DELIVERY) )
+    if ( !(caps.secondary_exec_control & SECONDARY_EXEC_VIRTUAL_INTR_DELIVERY) )
         caps.pin_based_exec_control &= ~PIN_BASED_POSTED_INTERRUPT;
 
     if ( iommu_intpost &&
@@ -469,7 +467,7 @@ static int vmx_init_vmcs_config(bool bsp
     }
 
     /* The IA32_VMX_VMFUNC MSR exists only when VMFUNC is available */
-    if ( _vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_VM_FUNCTIONS )
+    if ( caps.secondary_exec_control & SECONDARY_EXEC_ENABLE_VM_FUNCTIONS )
     {
         rdmsrl(MSR_IA32_VMX_VMFUNC, _vmx_vmfunc);
 
@@ -479,12 +477,12 @@ static int vmx_init_vmcs_config(bool bsp
          * Or we just don't use VMFUNC.
          */
         if ( !(_vmx_vmfunc & VMX_VMFUNC_EPTP_SWITCHING) )
-            _vmx_secondary_exec_control &= ~SECONDARY_EXEC_ENABLE_VM_FUNCTIONS;
+            caps.secondary_exec_control &= ~SECONDARY_EXEC_ENABLE_VM_FUNCTIONS;
     }
 
     /* Virtualization exceptions are only enabled if VMFUNC is enabled */
-    if ( !(_vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_VM_FUNCTIONS) )
-        _vmx_secondary_exec_control &= ~SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS;
+    if ( !(caps.secondary_exec_control & SECONDARY_EXEC_ENABLE_VM_FUNCTIONS) )
+        caps.secondary_exec_control &= ~SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS;
 
     min = 0;
     opt = (VM_ENTRY_LOAD_GUEST_PAT | VM_ENTRY_LOAD_GUEST_EFER |
@@ -499,7 +497,6 @@ static int vmx_init_vmcs_config(bool bsp
     {
         /* First time through. */
         vmx_caps = caps;
-        vmx_secondary_exec_control = _vmx_secondary_exec_control;
         vmx_tertiary_exec_control  = _vmx_tertiary_exec_control;
         vmx_ept_vpid_cap           = _vmx_ept_vpid_cap;
         vmx_vmexit_control         = _vmx_vmexit_control;
@@ -534,7 +531,7 @@ static int vmx_init_vmcs_config(bool bsp
             vmx_caps.cpu_based_exec_control, caps.cpu_based_exec_control);
         mismatch |= cap_check(
             "Secondary Exec Control",
-            vmx_secondary_exec_control, _vmx_secondary_exec_control);
+            vmx_caps.secondary_exec_control, caps.secondary_exec_control);
         mismatch |= cap_check(
             "Tertiary Exec Control",
             vmx_tertiary_exec_control, _vmx_tertiary_exec_control);
@@ -1115,7 +1112,7 @@ static int construct_vmcs(struct vcpu *v
     if ( d->arch.vtsc && !cpu_has_vmx_tsc_scaling )
         v->arch.hvm.vmx.exec_control |= CPU_BASED_RDTSC_EXITING;
 
-    v->arch.hvm.vmx.secondary_exec_control = vmx_secondary_exec_control;
+    v->arch.hvm.vmx.secondary_exec_control = vmx_caps.secondary_exec_control;
     v->arch.hvm.vmx.tertiary_exec_control  = vmx_tertiary_exec_control;
 
     /*
@@ -2225,7 +2222,6 @@ int __init vmx_vmcs_init(void)
          * Make sure all dependent features are off as well.
          */
         memset(&vmx_caps, 0, sizeof(vmx_caps));
-        vmx_secondary_exec_control = 0;
         vmx_tertiary_exec_control  = 0;
         vmx_vmexit_control         = 0;
         vmx_vmentry_control        = 0;
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -258,7 +258,6 @@ extern u32 vmx_vmentry_control;
 #define SECONDARY_EXEC_TSC_SCALING              0x02000000U
 #define SECONDARY_EXEC_BUS_LOCK_DETECTION       0x40000000U
 #define SECONDARY_EXEC_NOTIFY_VM_EXITING        0x80000000U
-extern u32 vmx_secondary_exec_control;
 
 #define TERTIARY_EXEC_LOADIWKEY_EXITING         BIT(0, UL)
 #define TERTIARY_EXEC_ENABLE_HLAT               BIT(1, UL)
@@ -303,15 +302,16 @@ struct vmx_caps {
     uint64_t basic_msr;
     uint32_t pin_based_exec_control;
     uint32_t cpu_based_exec_control;
+    uint32_t secondary_exec_control;
 };
 extern struct vmx_caps vmx_caps;
 
 #define cpu_has_wbinvd_exiting \
     (IS_ENABLED(CONFIG_INTEL_VMX) && \
-     vmx_secondary_exec_control & SECONDARY_EXEC_WBINVD_EXITING)
+     (vmx_caps.secondary_exec_control & SECONDARY_EXEC_WBINVD_EXITING))
 #define cpu_has_vmx_virtualize_apic_accesses \
     (IS_ENABLED(CONFIG_INTEL_VMX) && \
-     vmx_secondary_exec_control & SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES)
+     (vmx_caps.secondary_exec_control & SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES))
 #define cpu_has_vmx_tpr_shadow \
     (IS_ENABLED(CONFIG_INTEL_VMX) && \
      (vmx_caps.cpu_based_exec_control & CPU_BASED_TPR_SHADOW))
@@ -329,16 +329,16 @@ extern struct vmx_caps vmx_caps;
      (vmx_caps.cpu_based_exec_control & CPU_BASED_ACTIVATE_TERTIARY_CONTROLS))
 #define cpu_has_vmx_ept \
     (IS_ENABLED(CONFIG_INTEL_VMX) && \
-     vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_EPT)
+     (vmx_caps.secondary_exec_control & SECONDARY_EXEC_ENABLE_EPT))
 #define cpu_has_vmx_dt_exiting \
     (IS_ENABLED(CONFIG_INTEL_VMX) && \
-     vmx_secondary_exec_control & SECONDARY_EXEC_DESCRIPTOR_TABLE_EXITING)
+     (vmx_caps.secondary_exec_control & SECONDARY_EXEC_DESCRIPTOR_TABLE_EXITING))
 #define cpu_has_vmx_rdtscp \
     (IS_ENABLED(CONFIG_INTEL_VMX) && \
-     vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_RDTSCP)
+     (vmx_caps.secondary_exec_control & SECONDARY_EXEC_ENABLE_RDTSCP))
 #define cpu_has_vmx_vpid \
     (IS_ENABLED(CONFIG_INTEL_VMX) && \
-     vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_VPID)
+     (vmx_caps.secondary_exec_control & SECONDARY_EXEC_ENABLE_VPID))
 #define cpu_has_monitor_trap_flag \
     (IS_ENABLED(CONFIG_INTEL_VMX) && \
      (vmx_caps.cpu_based_exec_control & CPU_BASED_MONITOR_TRAP_FLAG))
@@ -350,56 +350,56 @@ extern struct vmx_caps vmx_caps;
      vmx_vmentry_control & VM_ENTRY_LOAD_GUEST_EFER)
 #define cpu_has_vmx_unrestricted_guest \
     (IS_ENABLED(CONFIG_INTEL_VMX) && \
-     vmx_secondary_exec_control & SECONDARY_EXEC_UNRESTRICTED_GUEST)
+     (vmx_caps.secondary_exec_control & SECONDARY_EXEC_UNRESTRICTED_GUEST))
 #define vmx_unrestricted_guest(v)               \
     ((v)->arch.hvm.vmx.secondary_exec_control & \
      SECONDARY_EXEC_UNRESTRICTED_GUEST)
 #define cpu_has_vmx_ple \
     (IS_ENABLED(CONFIG_INTEL_VMX) && \
-     vmx_secondary_exec_control & SECONDARY_EXEC_PAUSE_LOOP_EXITING)
+     (vmx_caps.secondary_exec_control & SECONDARY_EXEC_PAUSE_LOOP_EXITING))
 #define cpu_has_vmx_invpcid \
     (IS_ENABLED(CONFIG_INTEL_VMX) && \
-     vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_INVPCID)
+     (vmx_caps.secondary_exec_control & SECONDARY_EXEC_ENABLE_INVPCID))
 #define cpu_has_vmx_apic_reg_virt \
     (IS_ENABLED(CONFIG_INTEL_VMX) && \
-     vmx_secondary_exec_control & SECONDARY_EXEC_APIC_REGISTER_VIRT)
+     (vmx_caps.secondary_exec_control & SECONDARY_EXEC_APIC_REGISTER_VIRT))
 #define cpu_has_vmx_virtual_intr_delivery \
     (IS_ENABLED(CONFIG_INTEL_VMX) && \
-     vmx_secondary_exec_control & SECONDARY_EXEC_VIRTUAL_INTR_DELIVERY)
+     (vmx_caps.secondary_exec_control & SECONDARY_EXEC_VIRTUAL_INTR_DELIVERY))
 #define cpu_has_vmx_virtualize_x2apic_mode \
     (IS_ENABLED(CONFIG_INTEL_VMX) && \
-     vmx_secondary_exec_control & SECONDARY_EXEC_VIRTUALIZE_X2APIC_MODE)
+     (vmx_caps.secondary_exec_control & SECONDARY_EXEC_VIRTUALIZE_X2APIC_MODE))
 #define cpu_has_vmx_posted_intr_processing \
     (IS_ENABLED(CONFIG_INTEL_VMX) && \
      (vmx_caps.pin_based_exec_control & PIN_BASED_POSTED_INTERRUPT))
 #define cpu_has_vmx_vmcs_shadowing \
     (IS_ENABLED(CONFIG_INTEL_VMX) && \
-     vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_VMCS_SHADOWING)
+     (vmx_caps.secondary_exec_control & SECONDARY_EXEC_ENABLE_VMCS_SHADOWING))
 #define cpu_has_vmx_vmfunc \
     (IS_ENABLED(CONFIG_INTEL_VMX) && \
-     vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_VM_FUNCTIONS)
+     (vmx_caps.secondary_exec_control & SECONDARY_EXEC_ENABLE_VM_FUNCTIONS))
 #define cpu_has_vmx_virt_exceptions \
     (IS_ENABLED(CONFIG_INTEL_VMX) && \
-     vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS)
+     (vmx_caps.secondary_exec_control & SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS))
 #define cpu_has_vmx_pml \
     (IS_ENABLED(CONFIG_INTEL_VMX) && \
-     vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_PML)
+     (vmx_caps.secondary_exec_control & SECONDARY_EXEC_ENABLE_PML))
 #define cpu_has_vmx_mpx \
     (IS_ENABLED(CONFIG_INTEL_VMX) && \
      (vmx_vmexit_control & VM_EXIT_CLEAR_BNDCFGS) && \
      (vmx_vmentry_control & VM_ENTRY_LOAD_BNDCFGS))
 #define cpu_has_vmx_xsaves \
     (IS_ENABLED(CONFIG_INTEL_VMX) && \
-     vmx_secondary_exec_control & SECONDARY_EXEC_XSAVES)
+     (vmx_caps.secondary_exec_control & SECONDARY_EXEC_XSAVES))
 #define cpu_has_vmx_tsc_scaling \
     (IS_ENABLED(CONFIG_INTEL_VMX) && \
-     vmx_secondary_exec_control & SECONDARY_EXEC_TSC_SCALING)
+     (vmx_caps.secondary_exec_control & SECONDARY_EXEC_TSC_SCALING))
 #define cpu_has_vmx_bus_lock_detection \
     (IS_ENABLED(CONFIG_INTEL_VMX) && \
-     vmx_secondary_exec_control & SECONDARY_EXEC_BUS_LOCK_DETECTION)
+     (vmx_caps.secondary_exec_control & SECONDARY_EXEC_BUS_LOCK_DETECTION))
 #define cpu_has_vmx_notify_vm_exiting \
     (IS_ENABLED(CONFIG_INTEL_VMX) && \
-     vmx_secondary_exec_control & SECONDARY_EXEC_NOTIFY_VM_EXITING)
+     (vmx_caps.secondary_exec_control & SECONDARY_EXEC_NOTIFY_VM_EXITING))
 
 #define VMCS_RID_TYPE_MASK              0x80000000U
 


