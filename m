Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB20A43DE5
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 12:41:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895709.1304389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmtIw-0007WU-LC; Tue, 25 Feb 2025 11:40:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895709.1304389; Tue, 25 Feb 2025 11:40:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmtIw-0007Uo-IC; Tue, 25 Feb 2025 11:40:50 +0000
Received: by outflank-mailman (input) for mailman id 895709;
 Tue, 25 Feb 2025 11:40:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wvcP=VQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tmtIu-00066u-OJ
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 11:40:48 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5aabd93f-f36d-11ef-9897-31a8f345e629;
 Tue, 25 Feb 2025 12:40:47 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-38f2f783e4dso4683745f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2025 03:40:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b02ce740sm137411855e9.4.2025.02.25.03.40.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 03:40:46 -0800 (PST)
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
X-Inumbo-ID: 5aabd93f-f36d-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740483646; x=1741088446; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=103JF9XcPrdRjYfu4uKdsEuP2Y/h+9+4HyktI+TGsw8=;
        b=VCySyXQnOMAeU0f5F3/WExsaH9OtpJCb7ClmXEB7CJtnsADsAOC5AtBjthSDhZJNoW
         rNfzssugGgjEQRxLTupNZhwadL/GnoMFB2DnTU+0WOBD56Q/1LwwF89Yy7ipJWXD0sPQ
         kEbFmj+chnTtewBRWWXHLocWDoEldA8bqQcfCJh9e6c97Ee0bhLtjVfbA6PlklOz/Hhr
         ti/wzs2WrM9r2z9a1de3TSZNBsyJ0j7p3tE9qUxNYFqs+OcwGxrS8nn+VTE1S228eZki
         Sufujcd9Dnbkv0q1NVj9KzQdARRr8/gXgXn8x7/iuoQ87AwTdNpFGKnNVtljL7YSw+kA
         iR5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740483646; x=1741088446;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=103JF9XcPrdRjYfu4uKdsEuP2Y/h+9+4HyktI+TGsw8=;
        b=QWj40v9R3/i3CHyDL4CSt1CUF8jPZReKgIzfZUXoiuR7AkVjsiuzKqSHBGE92q+MM0
         gcLWKwAKS78vB6zKA7wWR5G7kxTChkT7IbVKJoFbYcwYe0zS7XdTtEYGUubcqjBSRw9W
         sNgztiYde3bLgjwA+V/DAAjoJa0RondYXcA4TDlgB2iNOrdAGmrG9R8LQqdxIXs0gfx6
         5IMozETzhk2fBh4gOnXn3JuAAJOpe4xoVHz7crhWsXcxZt3MN/85xIOGCiCbFS4dtbke
         R+fcDN5WvIhZMtwrF17Z7X9DfK2HjoqWYtLQ26eY7KFmxhJKbry++cbbHIU1CH+/Oe/M
         iTgQ==
X-Gm-Message-State: AOJu0YxE3SiT0hBdE9kuFVN22GP1hzhQ00VAlgj8bIhAGk9fZP31GBEZ
	CsedXfV0tWk4egsz/P+b8GAAG1n72yy9TGu1N1f24TJCtM6sPURADiiF2tTNu570S0IyVNlHK3s
	=
X-Gm-Gg: ASbGncuI14MIwIj92oCPU4uq9EOHMdt9DYPCBERPy6UVLignit9mDCwJlYeZTG96nI+
	Aph3G6AIkdVZZHoAhlCy1LLoStcYC3Mn0a8h2I9v+SoFyvWxaaWTVUC31IXQCX7bDNKReQXv7cO
	fU0G9kXp5vzSl1Ar9v4Q3MTnIPcbvCapPnhZ+67uYTCOJRQrBsGfW0Cy/IDKr5wpvgMTd+1DiyW
	HipOk6+Zo5RhEmFyehOt0m7/6aNfc2fEtl+A+8KHagb8xiJFRG3TzPeEKp0X4ZCM9s2fob2swG7
	ZnkQn06GmcaFoGjt7TIG0wMxkidN9BD12YcuSidtuC1bNgBgCfbm6DVup6ujZWk6ZjcWIj20ESl
	kkP76xnB0i0M=
X-Google-Smtp-Source: AGHT+IG2FAzhQDQrONs7lDcpy0cXXVblKlyVjrPi8b8HDi1ROWY6qQwGi92DqMpQDtNj3mBSR4ugBw==
X-Received: by 2002:a05:6000:2c6:b0:38f:23ed:2c7 with SMTP id ffacd0b85a97d-38f6e95af22mr16015589f8f.14.1740483646526;
        Tue, 25 Feb 2025 03:40:46 -0800 (PST)
Message-ID: <7f9c88d3-7b1e-4ade-a1c3-e127b0416c89@suse.com>
Date: Tue, 25 Feb 2025 12:40:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 09/11] VMX: convert vmx_vmentry_control
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
-u32 vmx_vmentry_control __read_mostly;
 u64 vmx_ept_vpid_cap __read_mostly;
 static uint64_t __read_mostly vmx_vmfunc;
 
@@ -261,7 +260,6 @@ static int vmx_init_vmcs_config(bool bsp
     struct vmx_caps caps = {};
     u64 _vmx_ept_vpid_cap = 0;
     u64 _vmx_misc_cap = 0;
-    u32 _vmx_vmentry_control;
     u64 _vmx_vmfunc = 0;
     bool mismatch = false;
 
@@ -483,7 +481,7 @@ static int vmx_init_vmcs_config(bool bsp
     min = 0;
     opt = (VM_ENTRY_LOAD_GUEST_PAT | VM_ENTRY_LOAD_GUEST_EFER |
            VM_ENTRY_LOAD_BNDCFGS);
-    _vmx_vmentry_control = adjust_vmx_controls(
+    caps.vmentry_control = adjust_vmx_controls(
         "VMEntry Control", min, opt, MSR_IA32_VMX_ENTRY_CTLS, &mismatch);
 
     if ( mismatch )
@@ -494,7 +492,6 @@ static int vmx_init_vmcs_config(bool bsp
         /* First time through. */
         vmx_caps = caps;
         vmx_ept_vpid_cap           = _vmx_ept_vpid_cap;
-        vmx_vmentry_control        = _vmx_vmentry_control;
         vmx_caps.basic_msr = ((uint64_t)vmx_basic_msr_high << 32) |
                              vmx_basic_msr_low;
         vmx_vmfunc                 = _vmx_vmfunc;
@@ -534,7 +531,7 @@ static int vmx_init_vmcs_config(bool bsp
             vmx_caps.vmexit_control, caps.vmexit_control);
         mismatch |= cap_check(
             "VMEntry Control",
-            vmx_vmentry_control, _vmx_vmentry_control);
+            vmx_caps.vmentry_control, caps.vmentry_control);
         mismatch |= cap_check(
             "EPT and VPID Capability",
             vmx_ept_vpid_cap, _vmx_ept_vpid_cap);
@@ -1094,7 +1091,7 @@ static int construct_vmcs(struct vcpu *v
 {
     struct domain *d = v->domain;
     uint32_t vmexit_ctl = vmx_caps.vmexit_control;
-    u32 vmentry_ctl = vmx_vmentry_control;
+    u32 vmentry_ctl = vmx_caps.vmentry_control;
     int rc = 0;
 
     vmx_vmcs_enter(v);
@@ -2216,7 +2213,6 @@ int __init vmx_vmcs_init(void)
          * Make sure all dependent features are off as well.
          */
         memset(&vmx_caps, 0, sizeof(vmx_caps));
-        vmx_vmentry_control        = 0;
         vmx_ept_vpid_cap           = 0;
         vmx_vmfunc                 = 0;
     }
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -235,7 +235,6 @@ void vmx_vmcs_reload(struct vcpu *v);
 #define VM_ENTRY_LOAD_GUEST_PAT         0x00004000
 #define VM_ENTRY_LOAD_GUEST_EFER        0x00008000
 #define VM_ENTRY_LOAD_BNDCFGS           0x00010000
-extern u32 vmx_vmentry_control;
 
 #define SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES 0x00000001U
 #define SECONDARY_EXEC_ENABLE_EPT               0x00000002U
@@ -303,6 +302,7 @@ struct vmx_caps {
     uint32_t secondary_exec_control;
     uint64_t tertiary_exec_control;
     uint32_t vmexit_control;
+    uint32_t vmentry_control;
 };
 extern struct vmx_caps vmx_caps;
 
@@ -344,10 +344,10 @@ extern struct vmx_caps vmx_caps;
      (vmx_caps.cpu_based_exec_control & CPU_BASED_MONITOR_TRAP_FLAG))
 #define cpu_has_vmx_pat \
     (IS_ENABLED(CONFIG_INTEL_VMX) && \
-     vmx_vmentry_control & VM_ENTRY_LOAD_GUEST_PAT)
+     (vmx_caps.vmentry_control & VM_ENTRY_LOAD_GUEST_PAT))
 #define cpu_has_vmx_efer \
     (IS_ENABLED(CONFIG_INTEL_VMX) && \
-     vmx_vmentry_control & VM_ENTRY_LOAD_GUEST_EFER)
+     (vmx_caps.vmentry_control & VM_ENTRY_LOAD_GUEST_EFER))
 #define cpu_has_vmx_unrestricted_guest \
     (IS_ENABLED(CONFIG_INTEL_VMX) && \
      (vmx_caps.secondary_exec_control & SECONDARY_EXEC_UNRESTRICTED_GUEST))
@@ -387,7 +387,7 @@ extern struct vmx_caps vmx_caps;
 #define cpu_has_vmx_mpx \
     (IS_ENABLED(CONFIG_INTEL_VMX) && \
      (vmx_caps.vmexit_control & VM_EXIT_CLEAR_BNDCFGS) && \
-     (vmx_vmentry_control & VM_ENTRY_LOAD_BNDCFGS))
+     (vmx_caps.vmentry_control & VM_ENTRY_LOAD_BNDCFGS))
 #define cpu_has_vmx_xsaves \
     (IS_ENABLED(CONFIG_INTEL_VMX) && \
      (vmx_caps.secondary_exec_control & SECONDARY_EXEC_XSAVES))


