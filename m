Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 962F9867C51
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 17:44:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685651.1066723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ree5X-0001Nl-A1; Mon, 26 Feb 2024 16:44:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685651.1066723; Mon, 26 Feb 2024 16:44:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ree5X-0001MC-6T; Mon, 26 Feb 2024 16:44:23 +0000
Received: by outflank-mailman (input) for mailman id 685651;
 Mon, 26 Feb 2024 16:44:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPQ6=KD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ree5V-0000BK-Fg
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 16:44:21 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a19299a-d4c6-11ee-8a58-1f161083a0e0;
 Mon, 26 Feb 2024 17:44:20 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-55a179f5fa1so3892560a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 08:44:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d18-20020a056402401200b005640022af58sm2509237eda.83.2024.02.26.08.44.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 08:44:20 -0800 (PST)
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
X-Inumbo-ID: 4a19299a-d4c6-11ee-8a58-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708965860; x=1709570660; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SpUvRoudA/jtd2T5mUZMGFquMIbLtsovgL/QnQtxnRs=;
        b=apbkVH/4M0IOdvpR4ZB5WFHTCLWfO3zS5SVDHDfb52A7eFMlqb2EHUsc6z/gQLysbJ
         QJMos7nBWZLSgLHzyAQ6onKsD8hziFRNTdr2eJ12ATSnx4S4Pay8mrXActvxTqkMy62g
         zfyxgfQPgTvbUg4vd23P2dGFTqITLPSIY77f10DBUrxSqoZr2sg6KFxhhdTuqs9HjfSK
         z/GkXu2mKj9OHvQmiDs3DpIBGUN+2MkK9GcJaXTOmwHimlT1lDZ1RJb35SeRuRyhRwl2
         FZ69DhYN4xCTISW/DdXY5QvauRpk6Ef4zeozkCBpoLSULCj52LhXihqh4BD9O9n1mQEe
         xTRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708965860; x=1709570660;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SpUvRoudA/jtd2T5mUZMGFquMIbLtsovgL/QnQtxnRs=;
        b=pXQBZ/mfvvE0By3+lZZ3ofhnHWNIvQDZBbNJ3iO3OCbzbQsrCzTG9kmtF2zd3rm/qQ
         4vWHUUbQuPRmqEfrOTH7ubbcxWbYdwyaGQn5hRXp3lmoG7FYfi+BHKb5WTwyjOd1+q4m
         /o1mVEnHnmoGxZ8ujtdir7fEb7YKf2roMV+mteV5dr3dkbGTGNThPtNrB+ADshN1AxCu
         i1FJei8lDk1ixyOrriaHzt452/mYqCyphPJcRlWcxMsXjIOaXEqPpkKIj2nlZNON8qu8
         1ONuv44TkNm48l0D4Fg0gTn2/vs/pMwRh3MI7vOQg5y3aLFkSwL+FN7MPKfTYH3i0Bx+
         zOog==
X-Gm-Message-State: AOJu0YyVakGcBU2YCefazkfPB/9MxSAepGOgq/5ftnjHKnaTbEP9Qtfu
	Mk7IpF+JcMCKXtXmJKb6je4CV6izxsXF6x6C5CWstyoAYMdW7rHla0VZ3ccKWU6zze4sAEBUODc
	=
X-Google-Smtp-Source: AGHT+IFT3FjGjnzj4OyiinDq6o0Iumj4WCl3H/OgMJ/gI0s9UyiW57ulZMbRpyF6Wtl+t2U1vETXnQ==
X-Received: by 2002:a05:6402:1c82:b0:565:9892:a74e with SMTP id cy2-20020a0564021c8200b005659892a74emr4105428edb.21.1708965860318;
        Mon, 26 Feb 2024 08:44:20 -0800 (PST)
Message-ID: <6fecfa2d-3af7-4241-b7ab-1b89817cdf0d@suse.com>
Date: Mon, 26 Feb 2024 17:44:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 07/12] VMX: convert vmx_secondary_exec_control
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
-u32 vmx_secondary_exec_control __read_mostly;
 uint64_t vmx_tertiary_exec_control __read_mostly;
 u32 vmx_vmexit_control __read_mostly;
 u32 vmx_vmentry_control __read_mostly;
@@ -260,7 +259,6 @@ static int vmx_init_vmcs_config(bool bsp
 {
     u32 vmx_basic_msr_low, vmx_basic_msr_high, min, opt;
     struct vmx_caps caps = {};
-    u32 _vmx_secondary_exec_control = 0;
     uint64_t _vmx_tertiary_exec_control = 0;
     u64 _vmx_ept_vpid_cap = 0;
     u64 _vmx_misc_cap = 0;
@@ -355,7 +353,7 @@ static int vmx_init_vmcs_config(bool bsp
                    SECONDARY_EXEC_VIRTUAL_INTR_DELIVERY |
                    SECONDARY_EXEC_VIRTUALIZE_X2APIC_MODE;
 
-        _vmx_secondary_exec_control = adjust_vmx_controls(
+        caps.secondary_exec_control = adjust_vmx_controls(
             "Secondary Exec Control", min, opt,
             MSR_IA32_VMX_PROCBASED_CTLS2, &mismatch);
     }
@@ -370,7 +368,7 @@ static int vmx_init_vmcs_config(bool bsp
     }
 
     /* The IA32_VMX_EPT_VPID_CAP MSR exists only when EPT or VPID available */
-    if ( _vmx_secondary_exec_control & (SECONDARY_EXEC_ENABLE_EPT |
+    if ( caps.secondary_exec_control & (SECONDARY_EXEC_ENABLE_EPT |
                                         SECONDARY_EXEC_ENABLE_VPID) )
     {
         rdmsrl(MSR_IA32_VMX_EPT_VPID_CAP, _vmx_ept_vpid_cap);
@@ -392,7 +390,7 @@ static int vmx_init_vmcs_config(bool bsp
         if ( !(_vmx_ept_vpid_cap & VMX_EPT_MEMORY_TYPE_WB) ||
              !(_vmx_ept_vpid_cap & VMX_EPT_WALK_LENGTH_4_SUPPORTED) ||
              !(_vmx_ept_vpid_cap & VMX_EPT_INVEPT_ALL_CONTEXT) )
-            _vmx_secondary_exec_control &= ~SECONDARY_EXEC_ENABLE_EPT;
+            caps.secondary_exec_control &= ~SECONDARY_EXEC_ENABLE_EPT;
 
         /*
          * the CPU must support INVVPID all context invalidation, because we
@@ -401,14 +399,14 @@ static int vmx_init_vmcs_config(bool bsp
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
@@ -421,25 +419,25 @@ static int vmx_init_vmcs_config(bool bsp
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
@@ -454,7 +452,7 @@ static int vmx_init_vmcs_config(bool bsp
      * delivery" and "acknowledge interrupt on exit" is set. For the latter
      * is a minimal requirement, only check the former, which is optional.
      */
-    if ( !(_vmx_secondary_exec_control & SECONDARY_EXEC_VIRTUAL_INTR_DELIVERY) )
+    if ( !(caps.secondary_exec_control & SECONDARY_EXEC_VIRTUAL_INTR_DELIVERY) )
         caps.pin_based_exec_control &= ~PIN_BASED_POSTED_INTERRUPT;
 
     if ( iommu_intpost &&
@@ -466,7 +464,7 @@ static int vmx_init_vmcs_config(bool bsp
     }
 
     /* The IA32_VMX_VMFUNC MSR exists only when VMFUNC is available */
-    if ( _vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_VM_FUNCTIONS )
+    if ( caps.secondary_exec_control & SECONDARY_EXEC_ENABLE_VM_FUNCTIONS )
     {
         rdmsrl(MSR_IA32_VMX_VMFUNC, _vmx_vmfunc);
 
@@ -476,12 +474,12 @@ static int vmx_init_vmcs_config(bool bsp
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
@@ -496,7 +494,6 @@ static int vmx_init_vmcs_config(bool bsp
     {
         /* First time through. */
         vmx_caps = caps;
-        vmx_secondary_exec_control = _vmx_secondary_exec_control;
         vmx_tertiary_exec_control  = _vmx_tertiary_exec_control;
         vmx_ept_vpid_cap           = _vmx_ept_vpid_cap;
         vmx_vmexit_control         = _vmx_vmexit_control;
@@ -531,7 +528,7 @@ static int vmx_init_vmcs_config(bool bsp
             vmx_caps.cpu_based_exec_control, caps.cpu_based_exec_control);
         mismatch |= cap_check(
             "Secondary Exec Control",
-            vmx_secondary_exec_control, _vmx_secondary_exec_control);
+            vmx_caps.secondary_exec_control, caps.secondary_exec_control);
         mismatch |= cap_check(
             "Tertiary Exec Control",
             vmx_tertiary_exec_control, _vmx_tertiary_exec_control);
@@ -1112,7 +1109,7 @@ static int construct_vmcs(struct vcpu *v
     if ( d->arch.vtsc && !cpu_has_vmx_tsc_scaling )
         v->arch.hvm.vmx.exec_control |= CPU_BASED_RDTSC_EXITING;
 
-    v->arch.hvm.vmx.secondary_exec_control = vmx_secondary_exec_control;
+    v->arch.hvm.vmx.secondary_exec_control = vmx_caps.secondary_exec_control;
     v->arch.hvm.vmx.tertiary_exec_control  = vmx_tertiary_exec_control;
 
     /*
@@ -2211,7 +2208,6 @@ int __init vmx_vmcs_init(void)
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
@@ -297,13 +296,14 @@ struct vmx_caps {
     uint64_t basic_msr;
     uint32_t pin_based_exec_control;
     uint32_t cpu_based_exec_control;
+    uint32_t secondary_exec_control;
 };
 extern struct vmx_caps vmx_caps;
 
 #define cpu_has_wbinvd_exiting \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_WBINVD_EXITING)
+    (vmx_caps.secondary_exec_control & SECONDARY_EXEC_WBINVD_EXITING)
 #define cpu_has_vmx_virtualize_apic_accesses \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES)
+    (vmx_caps.secondary_exec_control & SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES)
 #define cpu_has_vmx_tpr_shadow \
     (vmx_caps.cpu_based_exec_control & CPU_BASED_TPR_SHADOW)
 #define cpu_has_vmx_vnmi \
@@ -315,13 +315,13 @@ extern struct vmx_caps vmx_caps;
 #define cpu_has_vmx_tertiary_exec_control \
     (vmx_caps.cpu_based_exec_control & CPU_BASED_ACTIVATE_TERTIARY_CONTROLS)
 #define cpu_has_vmx_ept \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_EPT)
+    (vmx_caps.secondary_exec_control & SECONDARY_EXEC_ENABLE_EPT)
 #define cpu_has_vmx_dt_exiting \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_DESCRIPTOR_TABLE_EXITING)
+    (vmx_caps.secondary_exec_control & SECONDARY_EXEC_DESCRIPTOR_TABLE_EXITING)
 #define cpu_has_vmx_rdtscp \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_RDTSCP)
+    (vmx_caps.secondary_exec_control & SECONDARY_EXEC_ENABLE_RDTSCP)
 #define cpu_has_vmx_vpid \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_VPID)
+    (vmx_caps.secondary_exec_control & SECONDARY_EXEC_ENABLE_VPID)
 #define cpu_has_monitor_trap_flag \
     (vmx_caps.cpu_based_exec_control & CPU_BASED_MONITOR_TRAP_FLAG)
 #define cpu_has_vmx_pat \
@@ -329,41 +329,41 @@ extern struct vmx_caps vmx_caps;
 #define cpu_has_vmx_efer \
     (vmx_vmentry_control & VM_ENTRY_LOAD_GUEST_EFER)
 #define cpu_has_vmx_unrestricted_guest \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_UNRESTRICTED_GUEST)
+    (vmx_caps.secondary_exec_control & SECONDARY_EXEC_UNRESTRICTED_GUEST)
 #define vmx_unrestricted_guest(v)               \
     ((v)->arch.hvm.vmx.secondary_exec_control & \
      SECONDARY_EXEC_UNRESTRICTED_GUEST)
 #define cpu_has_vmx_ple \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_PAUSE_LOOP_EXITING)
+    (vmx_caps.secondary_exec_control & SECONDARY_EXEC_PAUSE_LOOP_EXITING)
 #define cpu_has_vmx_invpcid \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_INVPCID)
+    (vmx_caps.secondary_exec_control & SECONDARY_EXEC_ENABLE_INVPCID)
 #define cpu_has_vmx_apic_reg_virt \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_APIC_REGISTER_VIRT)
+    (vmx_caps.secondary_exec_control & SECONDARY_EXEC_APIC_REGISTER_VIRT)
 #define cpu_has_vmx_virtual_intr_delivery \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_VIRTUAL_INTR_DELIVERY)
+    (vmx_caps.secondary_exec_control & SECONDARY_EXEC_VIRTUAL_INTR_DELIVERY)
 #define cpu_has_vmx_virtualize_x2apic_mode \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_VIRTUALIZE_X2APIC_MODE)
+    (vmx_caps.secondary_exec_control & SECONDARY_EXEC_VIRTUALIZE_X2APIC_MODE)
 #define cpu_has_vmx_posted_intr_processing \
     (vmx_caps.pin_based_exec_control & PIN_BASED_POSTED_INTERRUPT)
 #define cpu_has_vmx_vmcs_shadowing \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_VMCS_SHADOWING)
+    (vmx_caps.secondary_exec_control & SECONDARY_EXEC_ENABLE_VMCS_SHADOWING)
 #define cpu_has_vmx_vmfunc \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_VM_FUNCTIONS)
+    (vmx_caps.secondary_exec_control & SECONDARY_EXEC_ENABLE_VM_FUNCTIONS)
 #define cpu_has_vmx_virt_exceptions \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS)
+    (vmx_caps.secondary_exec_control & SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS)
 #define cpu_has_vmx_pml \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_PML)
+    (vmx_caps.secondary_exec_control & SECONDARY_EXEC_ENABLE_PML)
 #define cpu_has_vmx_mpx \
     ((vmx_vmexit_control & VM_EXIT_CLEAR_BNDCFGS) && \
      (vmx_vmentry_control & VM_ENTRY_LOAD_BNDCFGS))
 #define cpu_has_vmx_xsaves \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_XSAVES)
+    (vmx_caps.secondary_exec_control & SECONDARY_EXEC_XSAVES)
 #define cpu_has_vmx_tsc_scaling \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_TSC_SCALING)
+    (vmx_caps.secondary_exec_control & SECONDARY_EXEC_TSC_SCALING)
 #define cpu_has_vmx_bus_lock_detection \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_BUS_LOCK_DETECTION)
+    (vmx_caps.secondary_exec_control & SECONDARY_EXEC_BUS_LOCK_DETECTION)
 #define cpu_has_vmx_notify_vm_exiting \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_NOTIFY_VM_EXITING)
+    (vmx_caps.secondary_exec_control & SECONDARY_EXEC_NOTIFY_VM_EXITING)
 
 #define VMCS_RID_TYPE_MASK              0x80000000U
 


