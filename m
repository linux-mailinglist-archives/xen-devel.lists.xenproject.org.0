Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A777AA43DDB
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 12:40:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895694.1304360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmtIP-0006AD-Q3; Tue, 25 Feb 2025 11:40:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895694.1304360; Tue, 25 Feb 2025 11:40:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmtIP-000673-Ml; Tue, 25 Feb 2025 11:40:17 +0000
Received: by outflank-mailman (input) for mailman id 895694;
 Tue, 25 Feb 2025 11:40:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wvcP=VQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tmtIO-00066u-LL
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 11:40:16 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47569899-f36d-11ef-9897-31a8f345e629;
 Tue, 25 Feb 2025 12:40:14 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-388cae9eb9fso2881033f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2025 03:40:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd86cca1sm1990957f8f.24.2025.02.25.03.40.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 03:40:13 -0800 (PST)
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
X-Inumbo-ID: 47569899-f36d-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740483614; x=1741088414; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mjdsrvYcKbS0IupcXcbfAMDfAYGI8EXf5PWUxNV1fao=;
        b=YgCUi9SLVewzseeWMvoEPstJ52hg62fsQXTbCMzvL8MykRFS2zZppRETr/Fh4X+T2s
         GRG6qb/zQr+Zj5CuR3lpMDsFXvdJhKXplje78ZSC7+LgOOwqe1uEF8AGMNCT7hLpACF4
         yXAYmvooFRIrqmNfrYsVWkyen25Uw1naFTG2wJ7u2UeKizg6uoSM4eDWXm7oet9S3qXU
         B1pH/d4lgqirVM+/M8I+z2hZEshd3ir/+y1EHap3g3k/ovVcy4H0Fc+EDX8hyc840XVD
         UGqUbSomHNJKgT5FM9ECpCtvn0ej7i4E0J0WDu+2omgXoraYv2oy+uSbFTdwv9h7LnfD
         zjlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740483614; x=1741088414;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mjdsrvYcKbS0IupcXcbfAMDfAYGI8EXf5PWUxNV1fao=;
        b=aqVdXgv9MGbxKtf1/bqKbvJ3B6h++KP9oGe8/Jk359SARiKmYXPVogLjY9tMNLAgd8
         AChdcqFu6ek9sd+5NKeBDsm2g/6V/pqlSWfGEl11zlmSjqpnmVR6BoclTV6VwDd/f5DX
         8Nk5zIfwsmUJ+6xbFpjCisyjf/5JCRvcy+rbdcfVvtZf4ypQmeu8tiDB3drAAL8SyoVo
         GVjz4+x5i/j9EpOSQAXZSm90OPXD0KGkeNawFH7UUmhc6Q9xlgBL9n92+UEe11ql0YJw
         eWgBaJXNaWxej4aFoQCC5AedwLx4GnAQjfi4XO7A+ft6ILQWXlR+4ROd/7C/fHRSYU2B
         N/bQ==
X-Gm-Message-State: AOJu0YxZz8habx4ptBb7je8sVLB9qwzI6iVjPnRvrDjUqehc41HSelK/
	pf1GN+17EToI+J95dvxE9icfQVihEB9kyYdVg+Mdf6paJgH1fObNdaVkRGpd3sNexmlbZxoe4UQ
	=
X-Gm-Gg: ASbGncudOKN3dRdpN4nXLbW+w0y8htRKk9H32gHiVfjA9NH8FQmhF1z299cziu3R0gs
	SlTevTVnONiC5rNC/HzDxQfLfV9WWHZshSJ1wqQ6fccniw9SYYRbJeWNre2flybQLUyYK4pr82p
	XUzWrpLwiZe+K+9Zd8xpXwZ+n9/mqFmpWuQhuM1/jajM46+Trr7x7kSclnEO23nhobmN0OS0tBB
	9Ndk3tHlEyw1y8sbOHNR6O6XxZjXXYEN/jvVjlY6ljQp48fa+sy0L1fh7Z2vxV2NUi0TlX2oCE0
	sZX1Go1e6TTbQZVbOezM1g4yg0RjKYhrsmCnAr/fzshWxbrd5OCCnROAZmKIofGijQl4Jxx1jkq
	zSFJS94PZQ9E=
X-Google-Smtp-Source: AGHT+IFt89i5r2V9tX7MHUL32UXkZxA7ioHDMKodKPH8keCwOxpCP+9bcoBMwk6SWdapBsvOWxoHwQ==
X-Received: by 2002:a5d:47a3:0:b0:38d:b610:190b with SMTP id ffacd0b85a97d-390cc63cc18mr2309744f8f.46.1740483614069;
        Tue, 25 Feb 2025 03:40:14 -0800 (PST)
Message-ID: <bc911dde-7673-4116-b6ec-53c332453f94@suse.com>
Date: Tue, 25 Feb 2025 12:40:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 08/11] VMX: convert vmx_vmexit_control
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
-u32 vmx_vmexit_control __read_mostly;
 u32 vmx_vmentry_control __read_mostly;
 u64 vmx_ept_vpid_cap __read_mostly;
 static uint64_t __read_mostly vmx_vmfunc;
@@ -262,7 +261,6 @@ static int vmx_init_vmcs_config(bool bsp
     struct vmx_caps caps = {};
     u64 _vmx_ept_vpid_cap = 0;
     u64 _vmx_misc_cap = 0;
-    u32 _vmx_vmexit_control;
     u32 _vmx_vmentry_control;
     u64 _vmx_vmfunc = 0;
     bool mismatch = false;
@@ -445,7 +443,7 @@ static int vmx_init_vmcs_config(bool bsp
     opt = (VM_EXIT_SAVE_GUEST_PAT | VM_EXIT_LOAD_HOST_PAT |
            VM_EXIT_LOAD_HOST_EFER | VM_EXIT_CLEAR_BNDCFGS);
     min |= VM_EXIT_IA32E_MODE;
-    _vmx_vmexit_control = adjust_vmx_controls(
+    caps.vmexit_control = adjust_vmx_controls(
         "VMExit Control", min, opt, MSR_IA32_VMX_EXIT_CTLS, &mismatch);
 
     /*
@@ -496,7 +494,6 @@ static int vmx_init_vmcs_config(bool bsp
         /* First time through. */
         vmx_caps = caps;
         vmx_ept_vpid_cap           = _vmx_ept_vpid_cap;
-        vmx_vmexit_control         = _vmx_vmexit_control;
         vmx_vmentry_control        = _vmx_vmentry_control;
         vmx_caps.basic_msr = ((uint64_t)vmx_basic_msr_high << 32) |
                              vmx_basic_msr_low;
@@ -534,7 +531,7 @@ static int vmx_init_vmcs_config(bool bsp
             vmx_caps.tertiary_exec_control, caps.tertiary_exec_control);
         mismatch |= cap_check(
             "VMExit Control",
-            vmx_vmexit_control, _vmx_vmexit_control);
+            vmx_caps.vmexit_control, caps.vmexit_control);
         mismatch |= cap_check(
             "VMEntry Control",
             vmx_vmentry_control, _vmx_vmentry_control);
@@ -1096,7 +1093,7 @@ void nocall vmx_asm_vmexit_handler(void)
 static int construct_vmcs(struct vcpu *v)
 {
     struct domain *d = v->domain;
-    u32 vmexit_ctl = vmx_vmexit_control;
+    uint32_t vmexit_ctl = vmx_caps.vmexit_control;
     u32 vmentry_ctl = vmx_vmentry_control;
     int rc = 0;
 
@@ -2219,7 +2216,6 @@ int __init vmx_vmcs_init(void)
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
@@ -303,6 +302,7 @@ struct vmx_caps {
     uint32_t cpu_based_exec_control;
     uint32_t secondary_exec_control;
     uint64_t tertiary_exec_control;
+    uint32_t vmexit_control;
 };
 extern struct vmx_caps vmx_caps;
 
@@ -386,7 +386,7 @@ extern struct vmx_caps vmx_caps;
      (vmx_caps.secondary_exec_control & SECONDARY_EXEC_ENABLE_PML))
 #define cpu_has_vmx_mpx \
     (IS_ENABLED(CONFIG_INTEL_VMX) && \
-     (vmx_vmexit_control & VM_EXIT_CLEAR_BNDCFGS) && \
+     (vmx_caps.vmexit_control & VM_EXIT_CLEAR_BNDCFGS) && \
      (vmx_vmentry_control & VM_ENTRY_LOAD_BNDCFGS))
 #define cpu_has_vmx_xsaves \
     (IS_ENABLED(CONFIG_INTEL_VMX) && \


