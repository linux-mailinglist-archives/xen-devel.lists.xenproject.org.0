Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CA9A43DCD
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 12:38:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895676.1304340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmtGI-0003jc-3i; Tue, 25 Feb 2025 11:38:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895676.1304340; Tue, 25 Feb 2025 11:38:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmtGI-0003gX-0b; Tue, 25 Feb 2025 11:38:06 +0000
Received: by outflank-mailman (input) for mailman id 895676;
 Tue, 25 Feb 2025 11:38:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wvcP=VQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tmtGG-0002Ya-6H
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 11:38:04 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f894fc5d-f36c-11ef-9897-31a8f345e629;
 Tue, 25 Feb 2025 12:38:02 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-38f1e8efe84so1981452f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2025 03:38:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ab153a7bcsm22704945e9.13.2025.02.25.03.38.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 03:38:01 -0800 (PST)
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
X-Inumbo-ID: f894fc5d-f36c-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740483482; x=1741088282; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iUxyt5/5cykRkoN9EO7EYK+xTR64sHX+xHHUuTpi9b4=;
        b=DClVWKZRCtX+YF67a8rDkxb+e7JjYm5CFA8fAs7UfnHF3e2qNKeUQ8Nqz3OLLZPux2
         HG4V05fOIzzD0FEzt5/Hv3C3hUY3vnh7t0n5w1JAaopSLgT0ZKxUqF93K0mVBdLJXaLq
         ZQbXL52rNJn7F3eo/JP9J5075VCF7BaEPtmM5cGIK8We+VOKB4Z6M4dNXZyIhD+5ALn7
         7K7D8ljBUYqkO3p6laIx7cCAnbSc5AkZ0XF2CH+YkXTPqGNI8MJ+qWm4+Wh7J6SJQs6H
         Wxj2VYEsYNNK0gwD0Q+8mwvENZVSkfeG7NhG/EKn7TV2JHPPOJ6DihJAXh1cht/P6UZl
         BULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740483482; x=1741088282;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iUxyt5/5cykRkoN9EO7EYK+xTR64sHX+xHHUuTpi9b4=;
        b=V0gNGDRnLJpzLfbNZGD9AJJGo07ciC9ca4e7L2MSvg+nNZwunZ9RYLaGXLyeZgd2Zq
         UDauxE+z/hM02QnC3oeDl4LfFrhih2OG2TUXbOVgNTSQW8YRQHfmjkFqxixHr6V7IrV0
         /wOoqdvBaiWzlNercreVcljJhGz3bolKMwMBVolNTN2At/b0Wtj4lyS7QYjTXkI+a827
         jP9yZnmZlpIf1cgvReWwgdHFRJl7UZeTi4IyylVg1JQObWYomd07mmDI3DQL519dxkBF
         DX2MZYjiHDEa6/rP879HJgp82iexIeWwFeXy2jRpwXN7CCPmhSJKMd0QoY5erTO7FHWE
         XV+g==
X-Gm-Message-State: AOJu0Yxs7Sb9i4U4lIfQJbBYjo2U4m5HBPIz/JESpFbP+MbcnwVMRSW3
	57nWpxUArVAFaLxxcAx2xVd/VdOrZofcJ3iimUHVDG4FRbmhpltLoGGpMNi0n4PR7PqOGuuV/Co
	=
X-Gm-Gg: ASbGncsUV8JHgNfcVzngtK0R5ZGypeIJCTY6Xn9GBKgi6DhABnoPULoegSU/CIgAfXm
	ytv4ldKup/PvPOhPV+v6kF7cmrL8e0u17RT5/D1H1CAQJCTafCCfKULtFJTEmVidKronOjqycam
	Gz02Vo+wXmb8cwPv5GGW4NEtGsTBSDU8R7xB4hUaMOnhseKgG4U37h1RtqUBRgfzq2V99M6eMJW
	HB6UjWH5KJXuvPsMRaHdRcZNXo9RLnQaOXPLwF6Ey20CGbZMQwzmG0VByX1YYdbftl17hBRHa4+
	iqcqPlpjXLxeUD7JGt5Ycd3qsAmyGdDxnl8CLeMYowNohRJKePaSrbZwID51QuNP0/2CYOTRZyX
	pnNp0scbbS0g=
X-Google-Smtp-Source: AGHT+IEsxX1fDXfAGaFhwRnk5/L7rTjXfueuflTpSl/3otAUrpbLZYcSFGpSZSOeYMt80XQKsJj9yw==
X-Received: by 2002:a05:6000:1fae:b0:38d:cbc2:29f6 with SMTP id ffacd0b85a97d-38f6e947434mr12850815f8f.17.1740483481932;
        Tue, 25 Feb 2025 03:38:01 -0800 (PST)
Message-ID: <b7ba0c8a-daf6-4cc2-adda-2f0f51bc88a1@suse.com>
Date: Tue, 25 Feb 2025 12:38:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 03/11] VMX: convert vmx_basic_msr
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

... to a struct field, which is then going to be accompanied by other
capability/control data presently living in individual variables. As
this structure isn't supposed to be altered post-boot, put it in
.data.ro_after_init right away.

Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
---
v4: Re-base.
v2: New.

--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -161,6 +161,7 @@ static int cf_check parse_ept_param_runt
 #endif
 
 /* Dynamic (run-time adjusted) execution control flags. */
+struct vmx_caps __ro_after_init vmx_caps;
 u32 vmx_pin_based_exec_control __read_mostly;
 u32 vmx_cpu_based_exec_control __read_mostly;
 u32 vmx_secondary_exec_control __read_mostly;
@@ -175,8 +176,7 @@ static DEFINE_PER_CPU(paddr_t, current_v
 static DEFINE_PER_CPU(struct list_head, active_vmcs_list);
 DEFINE_PER_CPU(bool, vmxon);
 
-#define vmcs_revision_id (vmx_basic_msr & VMX_BASIC_REVISION_MASK)
-u64 __read_mostly vmx_basic_msr;
+#define vmcs_revision_id (vmx_caps.basic_msr & VMX_BASIC_REVISION_MASK)
 
 static void __init vmx_display_features(void)
 {
@@ -508,8 +508,8 @@ static int vmx_init_vmcs_config(bool bsp
         vmx_ept_vpid_cap           = _vmx_ept_vpid_cap;
         vmx_vmexit_control         = _vmx_vmexit_control;
         vmx_vmentry_control        = _vmx_vmentry_control;
-        vmx_basic_msr              = ((u64)vmx_basic_msr_high << 32) |
-                                     vmx_basic_msr_low;
+        vmx_caps.basic_msr = ((uint64_t)vmx_basic_msr_high << 32) |
+                             vmx_basic_msr_low;
         vmx_vmfunc                 = _vmx_vmfunc;
 
         vmx_display_features();
@@ -563,7 +563,7 @@ static int vmx_init_vmcs_config(bool bsp
             mismatch = 1;
         }
         if ( (vmx_basic_msr_high & (VMX_BASIC_VMCS_SIZE_MASK >> 32)) !=
-             ((vmx_basic_msr & VMX_BASIC_VMCS_SIZE_MASK) >> 32) )
+             ((vmx_caps.basic_msr & VMX_BASIC_VMCS_SIZE_MASK) >> 32) )
         {
             printk("VMX: CPU%d unexpected VMCS size %Lu\n",
                    smp_processor_id(),
@@ -2228,7 +2228,7 @@ int __init vmx_vmcs_init(void)
          * _vmx_vcpu_up() may have made it past feature identification.
          * Make sure all dependent features are off as well.
          */
-        vmx_basic_msr              = 0;
+        memset(&vmx_caps, 0, sizeof(vmx_caps));
         vmx_pin_based_exec_control = 0;
         vmx_cpu_based_exec_control = 0;
         vmx_secondary_exec_control = 0;
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -300,6 +300,12 @@ extern u64 vmx_ept_vpid_cap;
 
 #define VMX_TSC_MULTIPLIER_MAX                  0xffffffffffffffffULL
 
+/* Capabilities and dynamic (run-time adjusted) execution control flags. */
+struct vmx_caps {
+    uint64_t basic_msr;
+};
+extern struct vmx_caps vmx_caps;
+
 #define cpu_has_wbinvd_exiting \
     (IS_ENABLED(CONFIG_INTEL_VMX) && \
      vmx_secondary_exec_control & SECONDARY_EXEC_WBINVD_EXITING)
@@ -415,9 +421,8 @@ extern u64 vmx_ept_vpid_cap;
  */
 #define VMX_BASIC_DEFAULT1_ZERO		(1ULL << 55)
 
-extern u64 vmx_basic_msr;
 #define cpu_has_vmx_ins_outs_instr_info \
-    (!!(vmx_basic_msr & VMX_BASIC_INS_OUT_INFO))
+    (!!(vmx_caps.basic_msr & VMX_BASIC_INS_OUT_INFO))
 
 /* Guest interrupt status */
 #define VMX_GUEST_INTR_STATUS_SUBFIELD_BITMASK  0x0FF
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -1561,7 +1561,7 @@ static int nvmx_handle_vmxon(struct cpu_
     rc = hvm_copy_from_guest_phys(&nvmcs_revid, gpa, sizeof(nvmcs_revid));
     if ( rc != HVMTRANS_okay ||
          (nvmcs_revid & ~VMX_BASIC_REVISION_MASK) ||
-         ((nvmcs_revid ^ vmx_basic_msr) & VMX_BASIC_REVISION_MASK) )
+         ((nvmcs_revid ^ vmx_caps.basic_msr) & VMX_BASIC_REVISION_MASK) )
     {
         vmfail_invalid(regs);
         return X86EMUL_OKAY;
@@ -1799,7 +1799,7 @@ static int nvmx_handle_vmptrld(struct cp
             {
                 struct vmcs_struct *vvmcs = vvmcx;
 
-                if ( ((vvmcs->revision_id ^ vmx_basic_msr) &
+                if ( ((vvmcs->revision_id ^ vmx_caps.basic_msr) &
                       VMX_BASIC_REVISION_MASK) ||
                      (!cpu_has_vmx_vmcs_shadowing &&
                       (vvmcs->revision_id & ~VMX_BASIC_REVISION_MASK)) )
@@ -2193,7 +2193,7 @@ int nvmx_msr_read_intercept(unsigned int
     case MSR_IA32_VMX_TRUE_PROCBASED_CTLS:
     case MSR_IA32_VMX_TRUE_EXIT_CTLS:
     case MSR_IA32_VMX_TRUE_ENTRY_CTLS:
-        if ( !(vmx_basic_msr & VMX_BASIC_DEFAULT1_ZERO) )
+        if ( !(vmx_caps.basic_msr & VMX_BASIC_DEFAULT1_ZERO) )
             return 0;
         break;
 


