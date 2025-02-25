Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A43A43F4E
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 13:21:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895764.1304420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmtwI-0007r5-8l; Tue, 25 Feb 2025 12:21:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895764.1304420; Tue, 25 Feb 2025 12:21:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmtwI-0007oI-5O; Tue, 25 Feb 2025 12:21:30 +0000
Received: by outflank-mailman (input) for mailman id 895764;
 Tue, 25 Feb 2025 12:21:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wvcP=VQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tmtJj-00066u-T6
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 11:41:39 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7941444e-f36d-11ef-9897-31a8f345e629;
 Tue, 25 Feb 2025 12:41:38 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-438a3216fc2so52054995e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2025 03:41:38 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b02f24acsm139068795e9.21.2025.02.25.03.41.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 03:41:37 -0800 (PST)
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
X-Inumbo-ID: 7941444e-f36d-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740483698; x=1741088498; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MC0QH5fDEc6DdpYxn+3u5oeTofK6VmSDjHR9KmOWsFg=;
        b=YEe0C1ziYhfBjNWxGstckLUiCjnwSgEJB7JvUz8H2vuM+0Xs1ZNM5L1lhzKpcE2nY9
         8PyCVXx8d05YcGmDgZpB46+CUgO/BSXeBOD62fP/RZ5ITeVx8i/2h34+xhN5leQcaKgo
         1x4dXijUMlrEiFMv+KxfGgMFjjLxHpohplsRrJaVDahzY6PRN5QS7deTOJZ8iWVwkHw7
         GOxUpfdWNXGuQ0hLGZhPqmf0G70EfmQwLrAUFxiIpXE3XCTHg0YAtcLOVr9vTB1OA7O0
         NVS9cGkBMJHegivuN11Wt5GTF7uSNKJcrRh+N/pokxbRnu23JT8OjfxALxvo/lSKNqSv
         6YVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740483698; x=1741088498;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MC0QH5fDEc6DdpYxn+3u5oeTofK6VmSDjHR9KmOWsFg=;
        b=bIyWpiGWwU4G7qupJ5Ld0XLqZf6fE2FD1Uf3gZPaUWnjbeKunJcajdvqeqw0dLMCy5
         SGrXphniM6S7iY95UbsaPaiZX7K9i10In6K7aC4NB0aJAVbuAOngJvHKO56EOESEE3LC
         GtaKM9OS4gKZG4drKtAmejJuKr56G4Ki08KD5kTA48jPi1WJXGfJrgvrXn3kOmjks+Pw
         XnjJ42+CyyCsMhv0qsYinjYjYA65YkrphqjImm3VIRB2/fxPS+3rcHxx6EZp9PZKoyqo
         W3j9NNrnQRgceNH5RUhELYBdZXXmLRgNCmVocs1gCCOeXvBxTRGn8aMq0DT6CYLuSzY8
         RwmQ==
X-Gm-Message-State: AOJu0Yyalko1Xhkbsf+nrW0Q8QGuVPoDJasL5rVfR+Yo0FhN3/RKGdgu
	9IX5+p+gmG5wQE3gFe97WPR30vgv41r25AmMu6T738OyCPH6JCFwW832ld8tGQ6nn/Xve/3E4uM
	=
X-Gm-Gg: ASbGncvfVmU0Dm//VJ6+3XTAwys/M3WNiAWQnov03WtvoV1NxYR3EHxc0WHUIg4/HLj
	/P3sRCJ7od2svcUUOocRlmerj6G7NpVy1zGsRF456merlyIDKsX4gXuUWhVNz70T5qtby4zre3i
	qNsvCD+54EBADCulFhGef9Ajio07OqrACNtIozgb+WUlFqKPSnCPQWBQD41gLSzTXuUZmtn16gI
	f8mig8t+B8P8wpZjHchmtJknmB7IpNDui+zap+cxvdNbj8mqpK+luxPIKaGlKPMMDRR8nJNjXsO
	A0PS7rhGAwszrc+V2oXvvWAHtpXE7f/J5uWXe0SAPFDxMKBPvcZ/OsnnJmo9bpWlcapmF8U675p
	ngMMnPiMvOv8=
X-Google-Smtp-Source: AGHT+IFpUHCr9koZ9eSiSPAbfY1uuhk7KWmSrGDYEpC8InxNEsDDcfgcbtaSh2jDUimKcJMvb7nMfQ==
X-Received: by 2002:a5d:6d8f:0:b0:38f:2111:f5ac with SMTP id ffacd0b85a97d-38f707b0941mr14456590f8f.31.1740483697810;
        Tue, 25 Feb 2025 03:41:37 -0800 (PST)
Message-ID: <ee64499b-8dac-4df8-bfc2-564c7f4c1554@suse.com>
Date: Tue, 25 Feb 2025 12:41:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 11/11] VMX: convert vmx_vmfunc
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
v2: New.

--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -162,7 +162,6 @@ static int cf_check parse_ept_param_runt
 
 /* Dynamic (run-time adjusted) execution control flags. */
 struct vmx_caps __ro_after_init vmx_caps;
-static uint64_t __read_mostly vmx_vmfunc;
 
 static DEFINE_PER_CPU_READ_MOSTLY(paddr_t, vmxon_region);
 static DEFINE_PER_CPU(paddr_t, current_vmcs);
@@ -258,7 +257,6 @@ static int vmx_init_vmcs_config(bool bsp
     u32 vmx_basic_msr_low, vmx_basic_msr_high, min, opt;
     struct vmx_caps caps = {};
     u64 _vmx_misc_cap = 0;
-    u64 _vmx_vmfunc = 0;
     bool mismatch = false;
 
     rdmsr(MSR_IA32_VMX_BASIC, vmx_basic_msr_low, vmx_basic_msr_high);
@@ -461,14 +459,14 @@ static int vmx_init_vmcs_config(bool bsp
     /* The IA32_VMX_VMFUNC MSR exists only when VMFUNC is available */
     if ( caps.secondary_exec_control & SECONDARY_EXEC_ENABLE_VM_FUNCTIONS )
     {
-        rdmsrl(MSR_IA32_VMX_VMFUNC, _vmx_vmfunc);
+        rdmsrl(MSR_IA32_VMX_VMFUNC, caps.vmfunc);
 
         /*
          * VMFUNC leaf 0 (EPTP switching) must be supported.
          *
          * Or we just don't use VMFUNC.
          */
-        if ( !(_vmx_vmfunc & VMX_VMFUNC_EPTP_SWITCHING) )
+        if ( !(caps.vmfunc & VMX_VMFUNC_EPTP_SWITCHING) )
             caps.secondary_exec_control &= ~SECONDARY_EXEC_ENABLE_VM_FUNCTIONS;
     }
 
@@ -491,7 +489,6 @@ static int vmx_init_vmcs_config(bool bsp
         vmx_caps = caps;
         vmx_caps.basic_msr = ((uint64_t)vmx_basic_msr_high << 32) |
                              vmx_basic_msr_low;
-        vmx_vmfunc                 = _vmx_vmfunc;
 
         vmx_display_features();
 
@@ -533,7 +530,7 @@ static int vmx_init_vmcs_config(bool bsp
         mismatch |= cap_check("VPID Capability", vmx_caps.vpid, caps.vpid);
         mismatch |= cap_check(
             "VMFUNC Capability",
-            vmx_vmfunc, _vmx_vmfunc);
+            vmx_caps.vmfunc, caps.vmfunc);
         if ( cpu_has_vmx_ins_outs_instr_info !=
              !!(vmx_basic_msr_high & (VMX_BASIC_INS_OUT_INFO >> 32)) )
         {
@@ -2209,7 +2206,6 @@ int __init vmx_vmcs_init(void)
          * Make sure all dependent features are off as well.
          */
         memset(&vmx_caps, 0, sizeof(vmx_caps));
-        vmx_vmfunc                 = 0;
     }
 
     return ret;
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -304,6 +304,7 @@ struct vmx_caps {
     uint32_t vmentry_control;
     uint32_t ept;
     uint32_t vpid;
+    uint64_t vmfunc;
 };
 extern struct vmx_caps vmx_caps;
 


