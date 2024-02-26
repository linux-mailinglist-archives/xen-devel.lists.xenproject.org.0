Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C6D867C55
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 17:45:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685654.1066733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ree5s-0001xc-M7; Mon, 26 Feb 2024 16:44:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685654.1066733; Mon, 26 Feb 2024 16:44:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ree5s-0001ut-I8; Mon, 26 Feb 2024 16:44:44 +0000
Received: by outflank-mailman (input) for mailman id 685654;
 Mon, 26 Feb 2024 16:44:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPQ6=KD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ree5r-0000BK-Qh
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 16:44:43 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57887c6a-d4c6-11ee-8a58-1f161083a0e0;
 Mon, 26 Feb 2024 17:44:43 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-512ed314881so3157563e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 08:44:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d18-20020a056402401200b005640022af58sm2509237eda.83.2024.02.26.08.44.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 08:44:42 -0800 (PST)
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
X-Inumbo-ID: 57887c6a-d4c6-11ee-8a58-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708965883; x=1709570683; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DpCtM4zMbfCyBbShI+77WKapeO/xVJwq7zqsqI2VmFg=;
        b=fm8GVAolL6nMFJaAUUU2MWPYmWxqQEPe6O0WQcAVCcQYu1br5shPzIu47AlPKTvaT4
         mHG0qJErEQF+VlikQu6TmFO8LZJ3uuah+ch/iYw/YLI14Gl4WO70ZAe9Iqz6/F985oLB
         69OA6tKSElezHC5AwcWDEQzxZhHy4QeaQe7bQJHQEjLMATkX4rx0deKUyLPYJRW1W3qf
         7x+SRWjvkqyTV1icDeBsvjlvtXOL7IWxXIEZSmBi9tJL29EODIiIIdpqYlHIQY56qzEB
         qkw/2e4ZECznMVR7RhMGKhhloY/3TvevQSfOgw5nqnOXTut6YvWQF6mdbEufVatDPoA2
         z8nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708965883; x=1709570683;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DpCtM4zMbfCyBbShI+77WKapeO/xVJwq7zqsqI2VmFg=;
        b=thdkJ/v/ybchkbTjzzcEg+7s/h9OaBpvM7aA1waPRi450QbZUWcbTAIQ6dF1nJgz9l
         968H2QwGH+JFt04+q2M1AmutS8B1GLs/6uxBj3N/wwHysqvEsA0cOyYvuqWtgWIJEtqS
         PRnlorppMr9mlu/NkC8S9T5HetbxRuRyzNbsoS0K7YfH2iLK5TvWbKOnIoymeSXGNvBT
         QTxevarNvk7Gr1QeHuKdwKHEoNQBopfnGvACu5Po7YsySXH+ZA9vs+VXf5Vp8v4e2EF1
         JUIn8x5sVZsF6weG63Cqm4rbnfIoHfvdz7Tt0Wnnx9Qgm1DU3ghJpGzr3v/gC3wfROm+
         HuUA==
X-Gm-Message-State: AOJu0YxR3S+0+AFkqiECSbtL512rpyV72LusZvt7sk9XIJ5jsM8zpYvE
	xPjOaIlTgBqLp/YXlpmNN+9LBwVx/cUT3syLuRawVWGqWkcPDuTAUQfh+skYJL7k9SFNhuvGOCA
	=
X-Google-Smtp-Source: AGHT+IGWMVZE6sGhplj0N1999L5E25vxWGu25pGEjmTVpzLVMIlUPUrCU2rcZGKQHzeM/4seWwncuQ==
X-Received: by 2002:a05:6512:159e:b0:512:fda7:2789 with SMTP id bp30-20020a056512159e00b00512fda72789mr2686709lfb.51.1708965882899;
        Mon, 26 Feb 2024 08:44:42 -0800 (PST)
Message-ID: <2bdfb8c2-c5ef-4631-9754-147310f18507@suse.com>
Date: Mon, 26 Feb 2024 17:44:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 08/12] VMX: convert vmx_tertiary_exec_control
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
v3: New.

--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -162,7 +162,6 @@ static int cf_check parse_ept_param_runt
 
 /* Dynamic (run-time adjusted) execution control flags. */
 struct vmx_caps __ro_after_init vmx_caps;
-uint64_t vmx_tertiary_exec_control __read_mostly;
 u32 vmx_vmexit_control __read_mostly;
 u32 vmx_vmentry_control __read_mostly;
 u64 vmx_ept_vpid_cap __read_mostly;
@@ -259,7 +258,6 @@ static int vmx_init_vmcs_config(bool bsp
 {
     u32 vmx_basic_msr_low, vmx_basic_msr_high, min, opt;
     struct vmx_caps caps = {};
-    uint64_t _vmx_tertiary_exec_control = 0;
     u64 _vmx_ept_vpid_cap = 0;
     u64 _vmx_misc_cap = 0;
     u32 _vmx_vmexit_control;
@@ -362,7 +360,7 @@ static int vmx_init_vmcs_config(bool bsp
     {
         uint64_t opt = 0;
 
-        _vmx_tertiary_exec_control = adjust_vmx_controls2(
+        caps.tertiary_exec_control = adjust_vmx_controls2(
             "Tertiary Exec Control", 0, opt,
             MSR_IA32_VMX_PROCBASED_CTLS3, &mismatch);
     }
@@ -494,7 +492,6 @@ static int vmx_init_vmcs_config(bool bsp
     {
         /* First time through. */
         vmx_caps = caps;
-        vmx_tertiary_exec_control  = _vmx_tertiary_exec_control;
         vmx_ept_vpid_cap           = _vmx_ept_vpid_cap;
         vmx_vmexit_control         = _vmx_vmexit_control;
         vmx_vmentry_control        = _vmx_vmentry_control;
@@ -531,7 +528,7 @@ static int vmx_init_vmcs_config(bool bsp
             vmx_caps.secondary_exec_control, caps.secondary_exec_control);
         mismatch |= cap_check(
             "Tertiary Exec Control",
-            vmx_tertiary_exec_control, _vmx_tertiary_exec_control);
+            vmx_caps.tertiary_exec_control, caps.tertiary_exec_control);
         mismatch |= cap_check(
             "VMExit Control",
             vmx_vmexit_control, _vmx_vmexit_control);
@@ -1110,7 +1107,7 @@ static int construct_vmcs(struct vcpu *v
         v->arch.hvm.vmx.exec_control |= CPU_BASED_RDTSC_EXITING;
 
     v->arch.hvm.vmx.secondary_exec_control = vmx_caps.secondary_exec_control;
-    v->arch.hvm.vmx.tertiary_exec_control  = vmx_tertiary_exec_control;
+    v->arch.hvm.vmx.tertiary_exec_control  = vmx_caps.tertiary_exec_control;
 
     /*
      * Disable features which we don't want active by default:
@@ -2208,7 +2205,6 @@ int __init vmx_vmcs_init(void)
          * Make sure all dependent features are off as well.
          */
         memset(&vmx_caps, 0, sizeof(vmx_caps));
-        vmx_tertiary_exec_control  = 0;
         vmx_vmexit_control         = 0;
         vmx_vmentry_control        = 0;
         vmx_ept_vpid_cap           = 0;
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -265,7 +265,6 @@ extern u32 vmx_vmentry_control;
 #define TERTIARY_EXEC_GUEST_PAGING_VERIFY       BIT(3, UL)
 #define TERTIARY_EXEC_IPI_VIRT                  BIT(4, UL)
 #define TERTIARY_EXEC_VIRT_SPEC_CTRL            BIT(7, UL)
-extern uint64_t vmx_tertiary_exec_control;
 
 #define VMX_EPT_EXEC_ONLY_SUPPORTED                         0x00000001
 #define VMX_EPT_WALK_LENGTH_4_SUPPORTED                     0x00000040
@@ -297,6 +296,7 @@ struct vmx_caps {
     uint32_t pin_based_exec_control;
     uint32_t cpu_based_exec_control;
     uint32_t secondary_exec_control;
+    uint64_t tertiary_exec_control;
 };
 extern struct vmx_caps vmx_caps;
 


