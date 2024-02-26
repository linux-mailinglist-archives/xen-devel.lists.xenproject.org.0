Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA57867C5A
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 17:45:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685655.1066742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ree6C-0002Ru-Sd; Mon, 26 Feb 2024 16:45:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685655.1066742; Mon, 26 Feb 2024 16:45:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ree6C-0002Pr-Pw; Mon, 26 Feb 2024 16:45:04 +0000
Received: by outflank-mailman (input) for mailman id 685655;
 Mon, 26 Feb 2024 16:45:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPQ6=KD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ree6B-0000BK-7r
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 16:45:03 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 630a19a5-d4c6-11ee-8a58-1f161083a0e0;
 Mon, 26 Feb 2024 17:45:02 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-55a8fd60af0so4313635a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 08:45:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d18-20020a056402401200b005640022af58sm2509237eda.83.2024.02.26.08.45.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 08:45:01 -0800 (PST)
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
X-Inumbo-ID: 630a19a5-d4c6-11ee-8a58-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708965902; x=1709570702; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qlvyaBxTJU8IjuZfhNaBPKvna3qwUHhOtqZ6G2oyic0=;
        b=Y2w1x6CUqI9wE/GfptBvw1f/ZbhfcI/IyaqOnCX1nQAwwKv0wRZzNcJ8m3sWZu5Vgl
         vOiNHprok6ftTbCBvJT1SxqhW1ALm0S2iPR12cIIJNuQWHRSf5f3CwqE7YVKE+9ohfP4
         T+m8pgDO/MErGLu/XnEKbPoQ4T8zUnVFREoTI50KXWSdbPxNyoVMxD4BAnX6HUwYHDyu
         zit1XrojLOLL+y6fQ5cuUUCe97h/rAd44CMMG2faPzILzckwGpsYVyoeKXE3bt7pJKGW
         tMKs6kK4dP7u+U1iAAJoEGkyXq/9IOp4Xft9OhIAJV7UhyDe3EW6DExiHPItd1CPNqiY
         PRLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708965902; x=1709570702;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qlvyaBxTJU8IjuZfhNaBPKvna3qwUHhOtqZ6G2oyic0=;
        b=vGyXS1VCk1H69KgYsgKcF5iS6AHhzjAi4hbIeWm0NDG+lXlskgPRO9AGEk3X1xFsaV
         T1YkC2LWoFuIseP7u3s0JdjL+QWPL7ior4bdi8mieTjM3CKfKBzoTK/2FZ/DcTBIX9Sw
         Rz4t/BMjUqvommSc1rxSQV6eZXLMSPenxmq+IVnymn8HHGxquAsOnpCJQ9h/Fu87MGGN
         ljNG1rYR6RKcbpNfr3exlgJdN3IeLlXYmcfc7hsGSK3dn8t1gLmhZ92UusrX6sEytQhz
         9WDk4tkiFe1vF3Q+QobE9xvEEauwRzRwWBW17SCcprlsz7Z3iadTOchYPtijC90pOGlW
         ZywA==
X-Gm-Message-State: AOJu0YydpZS3XVmrsi8A2uu/tzVuKN99dqubFdOXl7jIG2vjom8lUfSD
	DqKd9JYidJr5LqNjiFbWaEqPp/3b4UFucND8rzijDPzXQ/nMaBToCoLEa4km7/B2I+3gzfGsSIM
	=
X-Google-Smtp-Source: AGHT+IGmLDwC13pcsL6fhS7ZmCc853YcZ4+1dBnx0uXrFWGkrq1vusQsnSjUr1bG8naqR66JU1KvCw==
X-Received: by 2002:aa7:df93:0:b0:565:e294:5119 with SMTP id b19-20020aa7df93000000b00565e2945119mr2370985edy.18.1708965902142;
        Mon, 26 Feb 2024 08:45:02 -0800 (PST)
Message-ID: <6c273891-8232-4de3-97e1-8f39a174ba32@suse.com>
Date: Mon, 26 Feb 2024 17:45:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 09/12] VMX: convert vmx_vmexit_control
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
-u32 vmx_vmexit_control __read_mostly;
 u32 vmx_vmentry_control __read_mostly;
 u64 vmx_ept_vpid_cap __read_mostly;
 static uint64_t __read_mostly vmx_vmfunc;
@@ -260,7 +259,6 @@ static int vmx_init_vmcs_config(bool bsp
     struct vmx_caps caps = {};
     u64 _vmx_ept_vpid_cap = 0;
     u64 _vmx_misc_cap = 0;
-    u32 _vmx_vmexit_control;
     u32 _vmx_vmentry_control;
     u64 _vmx_vmfunc = 0;
     bool mismatch = false;
@@ -442,7 +440,7 @@ static int vmx_init_vmcs_config(bool bsp
     opt = (VM_EXIT_SAVE_GUEST_PAT | VM_EXIT_LOAD_HOST_PAT |
            VM_EXIT_LOAD_HOST_EFER | VM_EXIT_CLEAR_BNDCFGS);
     min |= VM_EXIT_IA32E_MODE;
-    _vmx_vmexit_control = adjust_vmx_controls(
+    caps.vmexit_control = adjust_vmx_controls(
         "VMExit Control", min, opt, MSR_IA32_VMX_EXIT_CTLS, &mismatch);
 
     /*
@@ -493,7 +491,6 @@ static int vmx_init_vmcs_config(bool bsp
         /* First time through. */
         vmx_caps = caps;
         vmx_ept_vpid_cap           = _vmx_ept_vpid_cap;
-        vmx_vmexit_control         = _vmx_vmexit_control;
         vmx_vmentry_control        = _vmx_vmentry_control;
         vmx_caps.basic_msr = ((uint64_t)vmx_basic_msr_high << 32) |
                              vmx_basic_msr_low;
@@ -531,7 +528,7 @@ static int vmx_init_vmcs_config(bool bsp
             vmx_caps.tertiary_exec_control, caps.tertiary_exec_control);
         mismatch |= cap_check(
             "VMExit Control",
-            vmx_vmexit_control, _vmx_vmexit_control);
+            vmx_caps.vmexit_control, caps.vmexit_control);
         mismatch |= cap_check(
             "VMEntry Control",
             vmx_vmentry_control, _vmx_vmentry_control);
@@ -1093,7 +1090,7 @@ void nocall vmx_asm_vmexit_handler(void)
 static int construct_vmcs(struct vcpu *v)
 {
     struct domain *d = v->domain;
-    u32 vmexit_ctl = vmx_vmexit_control;
+    uint32_t vmexit_ctl = vmx_caps.vmexit_control;
     u32 vmentry_ctl = vmx_vmentry_control;
     int rc = 0;
 
@@ -2205,7 +2202,6 @@ int __init vmx_vmcs_init(void)
          * Make sure all dependent features are off as well.
          */
         memset(&vmx_caps, 0, sizeof(vmx_caps));
-        vmx_vmexit_control         = 0;
         vmx_vmentry_control        = 0;
         vmx_ept_vpid_cap           = 0;
         vmx_vmfunc                 = 0;
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -1060,7 +1060,7 @@ static void load_shadow_control(struct v
     nvmx_update_pin_control(v, vmx_caps.pin_based_exec_control);
     vmx_update_cpu_exec_control(v);
     vmx_update_secondary_exec_control(v);
-    nvmx_update_exit_control(v, vmx_vmexit_control);
+    nvmx_update_exit_control(v, vmx_caps.vmexit_control);
     nvmx_update_entry_control(v);
     vmx_update_exception_bitmap(v);
     nvmx_update_apic_access_address(v);
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -227,7 +227,6 @@ void vmx_vmcs_reload(struct vcpu *v);
 #define VM_EXIT_LOAD_HOST_EFER          0x00200000
 #define VM_EXIT_SAVE_PREEMPT_TIMER      0x00400000
 #define VM_EXIT_CLEAR_BNDCFGS           0x00800000
-extern u32 vmx_vmexit_control;
 
 #define VM_ENTRY_IA32E_MODE             0x00000200
 #define VM_ENTRY_SMM                    0x00000400
@@ -297,6 +296,7 @@ struct vmx_caps {
     uint32_t cpu_based_exec_control;
     uint32_t secondary_exec_control;
     uint64_t tertiary_exec_control;
+    uint32_t vmexit_control;
 };
 extern struct vmx_caps vmx_caps;
 
@@ -354,7 +354,7 @@ extern struct vmx_caps vmx_caps;
 #define cpu_has_vmx_pml \
     (vmx_caps.secondary_exec_control & SECONDARY_EXEC_ENABLE_PML)
 #define cpu_has_vmx_mpx \
-    ((vmx_vmexit_control & VM_EXIT_CLEAR_BNDCFGS) && \
+    ((vmx_caps.vmexit_control & VM_EXIT_CLEAR_BNDCFGS) && \
      (vmx_vmentry_control & VM_ENTRY_LOAD_BNDCFGS))
 #define cpu_has_vmx_xsaves \
     (vmx_caps.secondary_exec_control & SECONDARY_EXEC_XSAVES)


