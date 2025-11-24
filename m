Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF5AC81367
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 16:01:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171308.1496349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNY3i-000108-Sv; Mon, 24 Nov 2025 15:00:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171308.1496349; Mon, 24 Nov 2025 15:00:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNY3i-0000xN-Pv; Mon, 24 Nov 2025 15:00:54 +0000
Received: by outflank-mailman (input) for mailman id 1171308;
 Mon, 24 Nov 2025 15:00:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNY3h-0000er-47
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 15:00:53 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e0239c8-c946-11f0-980a-7dc792cee155;
 Mon, 24 Nov 2025 16:00:51 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4777771ed1aso29240225e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 07:00:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477bf3558d5sm199595655e9.1.2025.11.24.07.00.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 07:00:50 -0800 (PST)
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
X-Inumbo-ID: 5e0239c8-c946-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763996451; x=1764601251; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bwdrUF7Qt5a3jIV50vAgjaIvWr+Pw8if2w3syBZ4RbI=;
        b=PsI5jAz/ZYE1mk8UT3Mgw0GzNn2D0s/BE33TqGljDhEHHCKmXxpXJKueeSha4WH3w+
         cKS8OW/Ku6+kR74ca0fddj/vfL7xW2aAwpH8V/UjzmmJur1smSqXT06INzgl5Xl5FtEl
         oxrsKMVUUeu3KG8WcYKa8gKmlvYKubiFD7WiVGmMeswRByRjKsxoFafKR54cBehrZdWD
         RJs/V2ZmGRo64suMDfsr0SZ4XFqMwBB+W9fQJZLEq8gQWGP6L4CsKTTR4aZ1EqbZK+Xf
         NnJsWj+3U78A+ZCJ1tFLKRn9siB+HiSO5qOVK4nOZpCAiJ79kjhRlBI+ebuwI1pvDb5y
         5nYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763996451; x=1764601251;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bwdrUF7Qt5a3jIV50vAgjaIvWr+Pw8if2w3syBZ4RbI=;
        b=S1nYEIgP1aje/XMSFTe6hVw1Q8eyo3pJBwi57ddybDdlD2URPKASyPafESv6XnGpHw
         9RlP62vw9fJrVJ08aRb0xQuIE/tm7szHxk72cAkYQDQQk8E/ngLznjrhJVHr3nkxP67m
         92dEZWi/n+IToKzmrGFVYdSpaA3SbjQA4aHWYxHef8ByLstu7XhduYQuyrjPtvsXd2L/
         lqnkyJh5s7H9+Ch6mvyNhqGA7L+honGX2w1kWdy9TI2NrgPZRyyZ3Io9ydb4iYh/1rA4
         ugz4yNKbv+DqIyyGiOr902EcZ7tldmhbm79RaPXngDUbEW+HxbtDe0uIc8PcQAFKjVDS
         UfFw==
X-Gm-Message-State: AOJu0YyQMw6Ro9Hqai4OkOqUfdbiqJPl2Tfc97RVXeiP+l1y/c+WKuRY
	D3HFPyyLcmu4CwQ1WrrHsyKeLyfBR3S+4Ia5I+3lC0hdKFLIKZ375AmFcbJ3iozIxwT5EBN8Ay5
	JDL0=
X-Gm-Gg: ASbGncuDeVaA18rPYRrb08Yhg30birJ2+ZSuTL/5v74xBBTAVLbjtOwULztx3t8hEUB
	mSeR1EKsLJMnCaZJ2Qe7abQ3WeCnYnQEoMfMprPynGt6lo3d1Z8mEGWmqncqHTBADs6xMCBkzyS
	oMBEINFkNxwkUMEjfuMKyhrgDs9EBGae4qOUG7yUynPqn9OAt4idUzo/eKh2NvtAH1d5cncLrKd
	NU5qYfhE4X9JH9EiBBT7B15AH4aS9WYX4BtSab/Z8oeXILPQ/IhsgRuRrV4askLjM/ibdnYP4ed
	ukWKXLlRdOtcUzGICmmCx7rEMpLq39F42dAjX1jf4uJUBUCJg99w1XrBCOkOaHZ20Bx2703CHkI
	hcsRdari+gaWAhZ9qwBO7UL7uyAeIGxRXf2IvpxxKkwE4+gRJyX1HPyYIQ/1hNJ3zfvN2EiD2S4
	Lvoej5TsH4j7MjDjiVFz8xZYiDF+AbCl+6goBinlbTmntWvX1Q7ipG/0hYt6xTNSNvdHCX/krBb
	Dw=
X-Google-Smtp-Source: AGHT+IH7Vei12SZE7pccPIho+8UtnUSr4u/87hbPl1o++WV8gO2CT0ThG8aHRxfrhv9tBAWRmI0jeA==
X-Received: by 2002:a05:600c:1906:b0:471:1774:3003 with SMTP id 5b1f17b1804b1-477c01e23bamr115951345e9.29.1763996450430;
        Mon, 24 Nov 2025 07:00:50 -0800 (PST)
Message-ID: <1404b901-0821-4e8d-82c7-1eebd8ed4daa@suse.com>
Date: Mon, 24 Nov 2025 16:00:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v9 07/10] VMX: support MSR-IMM
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <926a2315-a2b7-4aad-87e6-d686c9da9e3a@suse.com>
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
In-Reply-To: <926a2315-a2b7-4aad-87e6-d686c9da9e3a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hook up the new VM exit codes and handle guest uses of the insns.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v9: New.
---
The lack of an enable bit is concerning; at least for the nested case
that's a security issue afaict (when L0 isn't aware of the insns, or more
specifically the exit codes).

--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -352,7 +352,7 @@ XEN_CPUFEATURE(MCDT_NO,            13*32
 XEN_CPUFEATURE(UC_LOCK_DIS,        13*32+ 6) /*   UC-lock disable */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:1.ecx, word 14 */
-XEN_CPUFEATURE(MSR_IMM,            14*32+ 5) /*   RDMSR/WRMSRNS with immediate operand */
+XEN_CPUFEATURE(MSR_IMM,            14*32+ 5) /*s  RDMSR/WRMSRNS with immediate operand */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:1.edx, word 15 */
 XEN_CPUFEATURE(AVX_VNNI_INT8,      15*32+ 4) /*A  AVX-VNNI-INT8 Instructions */
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -823,10 +823,11 @@ static void __init calculate_hvm_max_pol
         __clear_bit(X86_FEATURE_PKS, fs);
 
         /*
-         * Don't expose USER-MSR until it is known how (if at all) it is
-         * virtualized on SVM.
+         * Don't expose USER-MSR and MSR-IMM until it is known how (if at all)
+         * they are virtualized on SVM.
          */
         __clear_bit(X86_FEATURE_USER_MSR, fs);
+        __clear_bit(X86_FEATURE_MSR_IMM, fs);
     }
 
     if ( !cpu_has_vmx_msrlist )
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -453,7 +453,7 @@ void domain_cpu_policy_changed(struct do
     }
 
     /* Nested doesn't have the necessary processing, yet. */
-    if ( nestedhvm_enabled(d) && p->feat.user_msr )
+    if ( nestedhvm_enabled(d) && (p->feat.user_msr || p->feat.msr_imm) )
         return /* -EINVAL */;
 
     for_each_vcpu ( d, v )
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -4762,6 +4762,7 @@ void asmlinkage vmx_vmexit_handler(struc
         break;
 
     case EXIT_REASON_URDMSR:
+    case EXIT_REASON_RDMSR_IMM:
     {
         uint64_t msr_content = 0;
 
@@ -4770,7 +4771,7 @@ void asmlinkage vmx_vmexit_handler(struc
         {
         case X86EMUL_OKAY:
             *decode_gpr(regs, msr_imm_gpr()) = msr_content;
-            update_guest_eip(); /* Safe: URDMSR */
+            update_guest_eip(); /* Safe: URDMSR / RDMSR <imm> */
             break;
 
         case X86EMUL_EXCEPTION:
@@ -4781,13 +4782,14 @@ void asmlinkage vmx_vmexit_handler(struc
     }
 
     case EXIT_REASON_UWRMSR:
+    case EXIT_REASON_WRMSRNS_IMM:
         __vmread(EXIT_QUALIFICATION, &exit_qualification);
         switch ( hvm_msr_write_intercept(exit_qualification,
                                          *decode_gpr(regs, msr_imm_gpr()),
                                          true) )
         {
         case X86EMUL_OKAY:
-            update_guest_eip(); /* Safe: UWRMSR */
+            update_guest_eip(); /* Safe: UWRMSR / WRMSRNS <imm> */
             break;
 
         case X86EMUL_EXCEPTION:
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -205,6 +205,8 @@ static inline void pi_clear_sn(struct pi
 #define EXIT_REASON_WRMSRLIST           79
 #define EXIT_REASON_URDMSR              80
 #define EXIT_REASON_UWRMSR              81
+#define EXIT_REASON_RDMSR_IMM           84
+#define EXIT_REASON_WRMSRNS_IMM         85
 /* Remember to also update VMX_PERF_EXIT_REASON_SIZE! */
 
 /*
--- a/xen/arch/x86/include/asm/perfc_defn.h
+++ b/xen/arch/x86/include/asm/perfc_defn.h
@@ -6,7 +6,7 @@ PERFCOUNTER_ARRAY(exceptions,
 
 #ifdef CONFIG_HVM
 
-#define VMX_PERF_EXIT_REASON_SIZE 82
+#define VMX_PERF_EXIT_REASON_SIZE 86
 #define VMEXIT_NPF_PERFC 143
 #define SVM_PERF_EXIT_REASON_SIZE (VMEXIT_NPF_PERFC + 1)
 PERFCOUNTER_ARRAY(vmexits,              "vmexits",


