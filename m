Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DECF867C5D
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 17:45:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685658.1066753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ree6p-00035d-71; Mon, 26 Feb 2024 16:45:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685658.1066753; Mon, 26 Feb 2024 16:45:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ree6p-00032Z-2n; Mon, 26 Feb 2024 16:45:43 +0000
Received: by outflank-mailman (input) for mailman id 685658;
 Mon, 26 Feb 2024 16:45:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPQ6=KD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ree6n-0002xA-GV
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 16:45:41 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79128c5f-d4c6-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 17:45:39 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-563bb51c36eso3454948a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 08:45:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d18-20020a056402401200b005640022af58sm2509237eda.83.2024.02.26.08.45.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 08:45:38 -0800 (PST)
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
X-Inumbo-ID: 79128c5f-d4c6-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708965939; x=1709570739; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MWVzS/z9C2M+MglkZ5k6DSCrcfyy95qeh7mUQUnz0es=;
        b=eYgL0tHH4HNv4aJwdyuBfYsA38P86jydDmCgdFI47eEc1mnmFPWbM7sTiBhh/CwQLC
         sXL1njilJl5sER618ME1FUNXzGuwgCX+d/uiUpI+1bhE74Zj/8DhQDyyAbp+/lWmU9Oq
         52R0QnKbpR4a6z8dGnIV19L8IWFdgX/Njht5KHnYgzVPXkEAjRi0huIGN8ybNhJVsZ8u
         Z8QDisAl7jGwGTLrICR13UAmf4ELgYWyEa/6Zht9E398CbvS4iuBPGCwKSqb7et3jKGx
         9oQwri9qqk1FMzVuBJVZs6vDCP/NeYL1kk1Nrik89FS0CoPuU4bN50Yni1Pqk62J6uIG
         ZvQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708965939; x=1709570739;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MWVzS/z9C2M+MglkZ5k6DSCrcfyy95qeh7mUQUnz0es=;
        b=JAdeL6H8tydfcayWVH1yMRjNS7982WJ0499qbM1j2vtsv7ntm8SWPV+myThNEXzm/d
         OmP96AZs0CcnS0gXkzuyOIKzWh5jqYVfgM0D3cdvx17Ef7nH/KDJR3kchK5MJyeFnYxi
         XtoObexJYbQ67SXm1aiZbJjuRyto4aCH3hk4f/rrfNW8LQLT2T90VymE3IJ1cRObs0z9
         9hOAISxDiYWJ4mL8oopmbEqUVpvdXGXel1C+SuTWv1qzuWK4KB9GSRFyXtf5r6NkeZ9c
         MEiV0IsAMUAkADAc3u0tnb9xfragYaPoH7Bs/wG5FVU7ASnMWGE7y0erxizDt6Uj7v3W
         /ARg==
X-Gm-Message-State: AOJu0YxyBphGkKOJsL3sNMzLoibwuILJ75Ju69kU+yO4+k3brGWJYPc0
	ULT31JcjbEyGQnHZloYAKJOYwAbemzGMzTG16qGi2IMhkviycxGwDFOZrYBxZDD1Gkbo+yNSlzc
	=
X-Google-Smtp-Source: AGHT+IFaiW5EwwFtgffnDVKX8BnLEM5/5qyGYEMeDX9Hsb4btZCx+5AHYu7RF9I4onhIURplq6pWLA==
X-Received: by 2002:aa7:c389:0:b0:566:137e:e076 with SMTP id k9-20020aa7c389000000b00566137ee076mr1201621edq.19.1708965939148;
        Mon, 26 Feb 2024 08:45:39 -0800 (PST)
Message-ID: <edce4800-e1fc-43d7-b7ed-ed7e1be43bcb@suse.com>
Date: Mon, 26 Feb 2024 17:45:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 11/12] VMX: convert vmx_ept_vpid_cap
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

... to fields in the capability/controls struct: Take the opportunity
and split the two halves into separate EPT and VPID fields.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: Re-base.
v2: New.

--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -162,7 +162,6 @@ static int cf_check parse_ept_param_runt
 
 /* Dynamic (run-time adjusted) execution control flags. */
 struct vmx_caps __ro_after_init vmx_caps;
-u64 vmx_ept_vpid_cap __read_mostly;
 static uint64_t __read_mostly vmx_vmfunc;
 
 static DEFINE_PER_CPU_READ_MOSTLY(paddr_t, vmxon_region);
@@ -256,7 +255,6 @@ static int vmx_init_vmcs_config(bool bsp
 {
     u32 vmx_basic_msr_low, vmx_basic_msr_high, min, opt;
     struct vmx_caps caps = {};
-    u64 _vmx_ept_vpid_cap = 0;
     u64 _vmx_misc_cap = 0;
     u64 _vmx_vmfunc = 0;
     bool mismatch = false;
@@ -365,10 +363,10 @@ static int vmx_init_vmcs_config(bool bsp
     if ( caps.secondary_exec_control & (SECONDARY_EXEC_ENABLE_EPT |
                                         SECONDARY_EXEC_ENABLE_VPID) )
     {
-        rdmsrl(MSR_IA32_VMX_EPT_VPID_CAP, _vmx_ept_vpid_cap);
+        rdmsr(MSR_IA32_VMX_EPT_VPID_CAP, caps.ept, caps.vpid);
 
         if ( !opt_ept_ad )
-            _vmx_ept_vpid_cap &= ~VMX_EPT_AD_BIT;
+            caps.ept &= ~VMX_EPT_AD_BIT;
 
         /*
          * Additional sanity checking before using EPT:
@@ -381,9 +379,9 @@ static int vmx_init_vmcs_config(bool bsp
          *
          * Or we just don't use EPT.
          */
-        if ( !(_vmx_ept_vpid_cap & VMX_EPT_MEMORY_TYPE_WB) ||
-             !(_vmx_ept_vpid_cap & VMX_EPT_WALK_LENGTH_4_SUPPORTED) ||
-             !(_vmx_ept_vpid_cap & VMX_EPT_INVEPT_ALL_CONTEXT) )
+        if ( !(caps.ept & VMX_EPT_MEMORY_TYPE_WB) ||
+             !(caps.ept & VMX_EPT_WALK_LENGTH_4_SUPPORTED) ||
+             !(caps.ept & VMX_EPT_INVEPT_ALL_CONTEXT) )
             caps.secondary_exec_control &= ~SECONDARY_EXEC_ENABLE_EPT;
 
         /*
@@ -392,11 +390,11 @@ static int vmx_init_vmcs_config(bool bsp
          *
          * Or we just don't use VPID.
          */
-        if ( !(_vmx_ept_vpid_cap & VMX_VPID_INVVPID_ALL_CONTEXT) )
+        if ( !(caps.vpid & VMX_VPID_INVVPID_ALL_CONTEXT) )
             caps.secondary_exec_control &= ~SECONDARY_EXEC_ENABLE_VPID;
 
         /* EPT A/D bits is required for PML */
-        if ( !(_vmx_ept_vpid_cap & VMX_EPT_AD_BIT) )
+        if ( !(caps.ept & VMX_EPT_AD_BIT) )
             caps.secondary_exec_control &= ~SECONDARY_EXEC_ENABLE_PML;
     }
 
@@ -488,7 +486,6 @@ static int vmx_init_vmcs_config(bool bsp
     {
         /* First time through. */
         vmx_caps = caps;
-        vmx_ept_vpid_cap           = _vmx_ept_vpid_cap;
         vmx_caps.basic_msr = ((uint64_t)vmx_basic_msr_high << 32) |
                              vmx_basic_msr_low;
         vmx_vmfunc                 = _vmx_vmfunc;
@@ -529,9 +526,8 @@ static int vmx_init_vmcs_config(bool bsp
         mismatch |= cap_check(
             "VMEntry Control",
             vmx_caps.vmentry_control, caps.vmentry_control);
-        mismatch |= cap_check(
-            "EPT and VPID Capability",
-            vmx_ept_vpid_cap, _vmx_ept_vpid_cap);
+        mismatch |= cap_check("EPT Capability", vmx_caps.ept, caps.ept);
+        mismatch |= cap_check("VPID Capability", vmx_caps.vpid, caps.vpid);
         mismatch |= cap_check(
             "VMFUNC Capability",
             vmx_vmfunc, _vmx_vmfunc);
@@ -2199,7 +2195,6 @@ int __init vmx_vmcs_init(void)
          * Make sure all dependent features are off as well.
          */
         memset(&vmx_caps, 0, sizeof(vmx_caps));
-        vmx_ept_vpid_cap           = 0;
         vmx_vmfunc                 = 0;
     }
 
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -274,12 +274,11 @@ void vmx_vmcs_reload(struct vcpu *v);
 #define VMX_EPT_AD_BIT                                      0x00200000
 #define VMX_EPT_INVEPT_SINGLE_CONTEXT                       0x02000000
 #define VMX_EPT_INVEPT_ALL_CONTEXT                          0x04000000
-#define VMX_VPID_INVVPID_INSTRUCTION                     0x00100000000ULL
-#define VMX_VPID_INVVPID_INDIVIDUAL_ADDR                 0x10000000000ULL
-#define VMX_VPID_INVVPID_SINGLE_CONTEXT                  0x20000000000ULL
-#define VMX_VPID_INVVPID_ALL_CONTEXT                     0x40000000000ULL
-#define VMX_VPID_INVVPID_SINGLE_CONTEXT_RETAINING_GLOBAL 0x80000000000ULL
-extern u64 vmx_ept_vpid_cap;
+#define VMX_VPID_INVVPID_INSTRUCTION                        0x00000001
+#define VMX_VPID_INVVPID_INDIVIDUAL_ADDR                    0x00000100
+#define VMX_VPID_INVVPID_SINGLE_CONTEXT                     0x00000200
+#define VMX_VPID_INVVPID_ALL_CONTEXT                        0x00000400
+#define VMX_VPID_INVVPID_SINGLE_CONTEXT_RETAINING_GLOBAL    0x00000800
 
 #define VMX_MISC_ACTIVITY_MASK                  0x000001c0
 #define VMX_MISC_PROC_TRACE                     0x00004000
@@ -297,6 +296,8 @@ struct vmx_caps {
     uint64_t tertiary_exec_control;
     uint32_t vmexit_control;
     uint32_t vmentry_control;
+    uint32_t ept;
+    uint32_t vpid;
 };
 extern struct vmx_caps vmx_caps;
 
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -279,17 +279,17 @@ typedef union cr_access_qual {
 extern uint8_t posted_intr_vector;
 
 #define cpu_has_vmx_ept_exec_only_supported        \
-    (vmx_ept_vpid_cap & VMX_EPT_EXEC_ONLY_SUPPORTED)
+    (vmx_caps.ept & VMX_EPT_EXEC_ONLY_SUPPORTED)
 
 #define cpu_has_vmx_ept_wl4_supported           \
-    (vmx_ept_vpid_cap & VMX_EPT_WALK_LENGTH_4_SUPPORTED)
-#define cpu_has_vmx_ept_mt_uc (vmx_ept_vpid_cap & VMX_EPT_MEMORY_TYPE_UC)
-#define cpu_has_vmx_ept_mt_wb (vmx_ept_vpid_cap & VMX_EPT_MEMORY_TYPE_WB)
-#define cpu_has_vmx_ept_2mb   (vmx_ept_vpid_cap & VMX_EPT_SUPERPAGE_2MB)
-#define cpu_has_vmx_ept_1gb   (vmx_ept_vpid_cap & VMX_EPT_SUPERPAGE_1GB)
-#define cpu_has_vmx_ept_ad    (vmx_ept_vpid_cap & VMX_EPT_AD_BIT)
+    (vmx_caps.ept & VMX_EPT_WALK_LENGTH_4_SUPPORTED)
+#define cpu_has_vmx_ept_mt_uc (vmx_caps.ept & VMX_EPT_MEMORY_TYPE_UC)
+#define cpu_has_vmx_ept_mt_wb (vmx_caps.ept & VMX_EPT_MEMORY_TYPE_WB)
+#define cpu_has_vmx_ept_2mb   (vmx_caps.ept & VMX_EPT_SUPERPAGE_2MB)
+#define cpu_has_vmx_ept_1gb   (vmx_caps.ept & VMX_EPT_SUPERPAGE_1GB)
+#define cpu_has_vmx_ept_ad    (vmx_caps.ept & VMX_EPT_AD_BIT)
 #define cpu_has_vmx_ept_invept_single_context   \
-    (vmx_ept_vpid_cap & VMX_EPT_INVEPT_SINGLE_CONTEXT)
+    (vmx_caps.ept & VMX_EPT_INVEPT_SINGLE_CONTEXT)
 
 #define EPT_2MB_SHIFT     16
 #define EPT_1GB_SHIFT     17
@@ -300,11 +300,11 @@ extern uint8_t posted_intr_vector;
 #define INVEPT_ALL_CONTEXT      2
 
 #define cpu_has_vmx_vpid_invvpid_individual_addr                    \
-    (vmx_ept_vpid_cap & VMX_VPID_INVVPID_INDIVIDUAL_ADDR)
+    (vmx_caps.vpid & VMX_VPID_INVVPID_INDIVIDUAL_ADDR)
 #define cpu_has_vmx_vpid_invvpid_single_context                     \
-    (vmx_ept_vpid_cap & VMX_VPID_INVVPID_SINGLE_CONTEXT)
+    (vmx_caps.vpid & VMX_VPID_INVVPID_SINGLE_CONTEXT)
 #define cpu_has_vmx_vpid_invvpid_single_context_retaining_global    \
-    (vmx_ept_vpid_cap & VMX_VPID_INVVPID_SINGLE_CONTEXT_RETAINING_GLOBAL)
+    (vmx_caps.vpid & VMX_VPID_INVVPID_SINGLE_CONTEXT_RETAINING_GLOBAL)
 
 #define INVVPID_INDIVIDUAL_ADDR                 0
 #define INVVPID_SINGLE_CONTEXT                  1


