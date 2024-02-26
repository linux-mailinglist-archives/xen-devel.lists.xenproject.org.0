Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A77867C49
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 17:43:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685644.1066692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ree4b-0008Gc-CO; Mon, 26 Feb 2024 16:43:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685644.1066692; Mon, 26 Feb 2024 16:43:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ree4b-0008Ef-9g; Mon, 26 Feb 2024 16:43:25 +0000
Received: by outflank-mailman (input) for mailman id 685644;
 Mon, 26 Feb 2024 16:43:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPQ6=KD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ree4Z-000739-Tg
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 16:43:23 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2723a141-d4c6-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 17:43:22 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-55a179f5fa1so3890892a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 08:43:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d18-20020a056402401200b005640022af58sm2509237eda.83.2024.02.26.08.43.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 08:43:21 -0800 (PST)
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
X-Inumbo-ID: 2723a141-d4c6-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708965801; x=1709570601; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LkkYKIciLpGXm67Xsu4H8V04SVbEw+0lUvEF+5IhLIk=;
        b=XXfDVeaXDw+1DjizdDZpyg46sz3YYfuN8o7Hvkuui0aj9Gm10sOgli6uE0v1FKCbvj
         Ry9EAne5Xu1V64WXrKaem62KKyVG83dIJvAIRS1kOXs5J2O62YwoncSvpm6nQ2MyBUbs
         TkPu4VG2sC5IqnhW22GYZz9Oo4TD4kQSFDhEWKXneiQ9rW8Bwy5QH7xTin5HRymkqKmj
         2FlpFYAo5k2MQtdubxQq8WA7Sk3OrYf6XrWBWM1Y6oGyE5TBhjvl6w8OFqG+PKCwFxif
         OzsPQgo/5EuYuAzCFoynsIxYTOf0ffB1AOHVS2Op+O2kMvSyjofVtNlYq37KCkmcTVDy
         OPjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708965801; x=1709570601;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LkkYKIciLpGXm67Xsu4H8V04SVbEw+0lUvEF+5IhLIk=;
        b=E1QzGJt8vrJBRS8N7BPkKPom+sgndLRGyNium8Fh+Bdjy2XpJJ2vuvOgx/piPLSCZN
         Vg8eQ7mhRo1jzcfzHG0roQEFqSaBAvaWqKmSURu2NRO9pdg0ELFOUhUHJn4gmvGQ7miF
         EzgwRm/8I7bigBeeEbTWzBbOXlir603sFbINyzjYO/7l5enBsTAS4E2yorvG5m4qpUEe
         PWMYdMZotcMGQzgt3kBFwxP2wwAE8kdXKZGgTTORfiXm2bc/tYhO3rgq2EbMUqp11czU
         TfEwNShRGFknSrHIlABgivIehIA24ntYv2/w4RrvxwtV+Plaz5QnGflwxB2nFQnF1Qmj
         R73w==
X-Gm-Message-State: AOJu0Yz7pKaCklTI/oKDIYb9UwFNcSvqdmdAovQ8tWQP2pX7Fl7oS8/Z
	XerRsnh07eHgYhvde8SrzLjrxJtPEFU5Iprajz0i0yOF/A2LNSiKnsx5J1XQEqsAQbJvZoqar54
	=
X-Google-Smtp-Source: AGHT+IE66fn6sd7RGWxgxOc52YFINHv/3XxkEA1CzC+GF36RQh6W0nd1PBlnpyG6b+0X8mqAOeueZw==
X-Received: by 2002:aa7:d912:0:b0:564:a62e:dad with SMTP id a18-20020aa7d912000000b00564a62e0dadmr5156319edr.34.1708965801706;
        Mon, 26 Feb 2024 08:43:21 -0800 (PST)
Message-ID: <eb9874c7-a392-49c2-a610-cf7ff45a3e3b@suse.com>
Date: Mon, 26 Feb 2024 17:43:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 04/12] VMX: convert vmx_basic_msr
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
Content-Transfer-Encoding: 8bit

... to a struct field, which is then going to be accompanied by other
capability/control data presently living in individual variables. As
this structure isn't supposed to be altered post-boot, put it in
.data.ro_after_init right away.

Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
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
@@ -505,8 +505,8 @@ static int vmx_init_vmcs_config(bool bsp
         vmx_ept_vpid_cap           = _vmx_ept_vpid_cap;
         vmx_vmexit_control         = _vmx_vmexit_control;
         vmx_vmentry_control        = _vmx_vmentry_control;
-        vmx_basic_msr              = ((u64)vmx_basic_msr_high << 32) |
-                                     vmx_basic_msr_low;
+        vmx_caps.basic_msr = ((uint64_t)vmx_basic_msr_high << 32) |
+                             vmx_basic_msr_low;
         vmx_vmfunc                 = _vmx_vmfunc;
 
         vmx_display_features();
@@ -560,7 +560,7 @@ static int vmx_init_vmcs_config(bool bsp
             mismatch = 1;
         }
         if ( (vmx_basic_msr_high & (VMX_BASIC_VMCS_SIZE_MASK >> 32)) !=
-             ((vmx_basic_msr & VMX_BASIC_VMCS_SIZE_MASK) >> 32) )
+             ((vmx_caps.basic_msr & VMX_BASIC_VMCS_SIZE_MASK) >> 32) )
         {
             printk("VMX: CPU%d unexpected VMCS size %Lu\n",
                    smp_processor_id(),
@@ -2214,7 +2214,7 @@ int __init vmx_vmcs_init(void)
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
@@ -294,6 +294,12 @@ extern u64 vmx_ept_vpid_cap;
 
 #define VMX_TSC_MULTIPLIER_MAX                  0xffffffffffffffffULL
 
+/* Capabilities and dynamic (run-time adjusted) execution control flags. */
+struct vmx_caps {
+    uint64_t basic_msr;
+};
+extern struct vmx_caps vmx_caps;
+
 #define cpu_has_wbinvd_exiting \
     (vmx_secondary_exec_control & SECONDARY_EXEC_WBINVD_EXITING)
 #define cpu_has_vmx_virtualize_apic_accesses \
@@ -379,9 +385,8 @@ extern u64 vmx_ept_vpid_cap;
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
@@ -2192,7 +2192,7 @@ int nvmx_msr_read_intercept(unsigned int
     case MSR_IA32_VMX_TRUE_PROCBASED_CTLS:
     case MSR_IA32_VMX_TRUE_EXIT_CTLS:
     case MSR_IA32_VMX_TRUE_ENTRY_CTLS:
-        if ( !(vmx_basic_msr & VMX_BASIC_DEFAULT1_ZERO) )
+        if ( !(vmx_caps.basic_msr & VMX_BASIC_DEFAULT1_ZERO) )
             return 0;
         break;
 


