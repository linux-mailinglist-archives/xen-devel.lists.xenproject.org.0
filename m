Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BCDA43DE8
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 12:41:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895731.1304399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmtJI-0000LP-SW; Tue, 25 Feb 2025 11:41:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895731.1304399; Tue, 25 Feb 2025 11:41:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmtJI-0000KF-PT; Tue, 25 Feb 2025 11:41:12 +0000
Received: by outflank-mailman (input) for mailman id 895731;
 Tue, 25 Feb 2025 11:41:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wvcP=VQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tmtI1-0002yH-EY
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 11:39:53 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a4c33f9-f36d-11ef-9aae-95dc52dad729;
 Tue, 25 Feb 2025 12:39:52 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43aac0390e8so11863175e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2025 03:39:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ab156a199sm23037925e9.39.2025.02.25.03.39.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 03:39:51 -0800 (PST)
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
X-Inumbo-ID: 3a4c33f9-f36d-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740483592; x=1741088392; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YTW4tUcMEeYNCm7ZKKGx4hPpDCz3H5iQewiKwcDe8Qg=;
        b=fgEKdDA3Etc3Zbz78H11Wf+ZVDH2YEDljja5A59U6TjGo0kfoZuxbXj5bUnyAaqTk5
         hLGkvwAK0Qm1v6eZaXXJFkuwXzD9aJjZr37lx2S3B+/NmWpfXcxuJBKWBW5qsVm8IORW
         muwDtbl3CMp0BdQ0u8hDQ9fHrkDFs3GiwRp3kEubFqu8Me8mjKhgd5LHF/RNbMror5Wf
         53tRRgVRM9/Uwtnz1MYtvkPgXokBwnwte2rpdusFmCXjXC8keH/nXRZ+k1umbsC8Wi4L
         tusHOGIaM3Mw8+iMitBtcpfJhfkQhBqqAlWKJFuyJHUCNT+rC1U28J6Z3wbCGclMdsk5
         ckJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740483592; x=1741088392;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YTW4tUcMEeYNCm7ZKKGx4hPpDCz3H5iQewiKwcDe8Qg=;
        b=pyVUvXjH16+//o6ygP7E4nteI6FBcfH28+Jdq5ThzjP90skJAc4oXmw68mOBgxXseV
         P5kNXmzaIGuHcFhZNW6LXIvkmdEV6UsbA52S46UT2sfLyCeHBvaTugrtq8Pqha6r3z2n
         r9SGG5dD35+wVknkxnLOv1nOCU69/gvZ9as02h49GimXpzvWxjMTfQbosG/axCIzvLn7
         00PcRxwffjzrvWICR+SM7VL/6dDhZH86iOs+sVw5du+U+RJMCx/Q7pLfshddtrmVkihg
         g6SiyKmuecb2EtV+kdp3LbFYUKKHZsXoIRzxvpluh3g3csm4uJkdnb/L1i/TJ539/SjQ
         7JzA==
X-Gm-Message-State: AOJu0YwDkaIXk33BIKL7KoEQKvzteX9dxQ2mg6dcj8dEvVXxUYzOCYf0
	zHqhH3OZWwac53Xs93jAnFa5S9Cx7N2e33EeVRj7cB+7j4Q/k6YWdWZQhBUaKWcLKy8OUYkKVbI
	=
X-Gm-Gg: ASbGncsr9teO4TSMnDa3dmD/DJzuEPCdWC8z5nVP6KDhDS6FpdengwZIIsr+MnJo0OP
	/+C1/ybuokyJIurOFAliSEMECybEn4w3we7CAw81piR7b5D1tjv7XTyqxHcplY2zIqoQkFgnWH6
	d1UEOi0YkZHc/wIvu61tiJmc01y64KCqVM5a3EHeAcZ/poIRS7vceU7Lu3xfcax+teFrpZqwcZK
	1X+jdn8K1uj+/RJjcyjq/3mTeEBXd/D5lGRMZXmLuGVo05/l1vQVKYgCgN+2ReXIbq2WK9D8vQ5
	Nt7pkzFnrwQ6wi35N1UST0mGEVrenAC0vPpjZadLCIneTeUmICDPYUVe6ugeo7goMin5YTY7Cvv
	jpy6DZxFGU4g=
X-Google-Smtp-Source: AGHT+IHdLVMUsozeU3HwST5JE+KQHGUlLbbb3yNRnRrtybFgKwVMEvGmc8jfpcovkbzkhqs8oAFtUQ==
X-Received: by 2002:a05:600c:19c9:b0:439:9a5b:87d4 with SMTP id 5b1f17b1804b1-439ae1f3a3dmr137983165e9.13.1740483592218;
        Tue, 25 Feb 2025 03:39:52 -0800 (PST)
Message-ID: <9c956657-4498-412c-b28b-c0005c105f1a@suse.com>
Date: Tue, 25 Feb 2025 12:39:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 07/11] VMX: convert vmx_tertiary_exec_control
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
@@ -261,7 +260,6 @@ static int vmx_init_vmcs_config(bool bsp
 {
     u32 vmx_basic_msr_low, vmx_basic_msr_high, min, opt;
     struct vmx_caps caps = {};
-    uint64_t _vmx_tertiary_exec_control = 0;
     u64 _vmx_ept_vpid_cap = 0;
     u64 _vmx_misc_cap = 0;
     u32 _vmx_vmexit_control;
@@ -365,7 +363,7 @@ static int vmx_init_vmcs_config(bool bsp
         uint64_t opt = (TERTIARY_EXEC_VIRT_SPEC_CTRL |
                         TERTIARY_EXEC_EPT_PAGING_WRITE);
 
-        _vmx_tertiary_exec_control = adjust_vmx_controls2(
+        caps.tertiary_exec_control = adjust_vmx_controls2(
             "Tertiary Exec Control", 0, opt,
             MSR_IA32_VMX_PROCBASED_CTLS3, &mismatch);
     }
@@ -497,7 +495,6 @@ static int vmx_init_vmcs_config(bool bsp
     {
         /* First time through. */
         vmx_caps = caps;
-        vmx_tertiary_exec_control  = _vmx_tertiary_exec_control;
         vmx_ept_vpid_cap           = _vmx_ept_vpid_cap;
         vmx_vmexit_control         = _vmx_vmexit_control;
         vmx_vmentry_control        = _vmx_vmentry_control;
@@ -534,7 +531,7 @@ static int vmx_init_vmcs_config(bool bsp
             vmx_caps.secondary_exec_control, caps.secondary_exec_control);
         mismatch |= cap_check(
             "Tertiary Exec Control",
-            vmx_tertiary_exec_control, _vmx_tertiary_exec_control);
+            vmx_caps.tertiary_exec_control, caps.tertiary_exec_control);
         mismatch |= cap_check(
             "VMExit Control",
             vmx_vmexit_control, _vmx_vmexit_control);
@@ -1113,7 +1110,7 @@ static int construct_vmcs(struct vcpu *v
         v->arch.hvm.vmx.exec_control |= CPU_BASED_RDTSC_EXITING;
 
     v->arch.hvm.vmx.secondary_exec_control = vmx_caps.secondary_exec_control;
-    v->arch.hvm.vmx.tertiary_exec_control  = vmx_tertiary_exec_control;
+    v->arch.hvm.vmx.tertiary_exec_control  = vmx_caps.tertiary_exec_control;
 
     /*
      * Disable features which we don't want active by default:
@@ -2222,7 +2219,6 @@ int __init vmx_vmcs_init(void)
          * Make sure all dependent features are off as well.
          */
         memset(&vmx_caps, 0, sizeof(vmx_caps));
-        vmx_tertiary_exec_control  = 0;
         vmx_vmexit_control         = 0;
         vmx_vmentry_control        = 0;
         vmx_ept_vpid_cap           = 0;
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -265,13 +265,12 @@ extern u32 vmx_vmentry_control;
 #define TERTIARY_EXEC_GUEST_PAGING_VERIFY       BIT(3, UL)
 #define TERTIARY_EXEC_IPI_VIRT                  BIT(4, UL)
 #define TERTIARY_EXEC_VIRT_SPEC_CTRL            BIT(7, UL)
-extern uint64_t vmx_tertiary_exec_control;
 
 #define cpu_has_vmx_virt_spec_ctrl \
-     (vmx_tertiary_exec_control & TERTIARY_EXEC_VIRT_SPEC_CTRL)
+     (vmx_caps.tertiary_exec_control & TERTIARY_EXEC_VIRT_SPEC_CTRL)
 
 #define cpu_has_vmx_ept_paging_write \
-     (vmx_tertiary_exec_control & TERTIARY_EXEC_EPT_PAGING_WRITE)
+     (vmx_caps.tertiary_exec_control & TERTIARY_EXEC_EPT_PAGING_WRITE)
 
 #define VMX_EPT_EXEC_ONLY_SUPPORTED                         0x00000001
 #define VMX_EPT_WALK_LENGTH_4_SUPPORTED                     0x00000040
@@ -303,6 +302,7 @@ struct vmx_caps {
     uint32_t pin_based_exec_control;
     uint32_t cpu_based_exec_control;
     uint32_t secondary_exec_control;
+    uint64_t tertiary_exec_control;
 };
 extern struct vmx_caps vmx_caps;
 


