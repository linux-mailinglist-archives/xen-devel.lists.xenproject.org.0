Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4D283AD46
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 16:27:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671099.1044252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSf9r-0007Td-MZ; Wed, 24 Jan 2024 15:27:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671099.1044252; Wed, 24 Jan 2024 15:27:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSf9r-0007Ra-JJ; Wed, 24 Jan 2024 15:27:19 +0000
Received: by outflank-mailman (input) for mailman id 671099;
 Wed, 24 Jan 2024 15:27:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bgOV=JC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSf9q-0007RT-JN
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 15:27:18 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e2c3da8-bacd-11ee-9b0f-b553b5be7939;
 Wed, 24 Jan 2024 16:27:16 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2cf1fd1cc5bso9360421fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2024 07:27:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bz6-20020a056e02268600b003619a43268asm2288009ilb.34.2024.01.24.07.27.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jan 2024 07:27:14 -0800 (PST)
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
X-Inumbo-ID: 0e2c3da8-bacd-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706110036; x=1706714836; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zzXHmr1qvA0UdSLvnaXumfuQjNmGkhE1FDpYmZ+o+Cg=;
        b=E3OnNoDM5WYad4xohgd/jQ7A/tp+T01Qd7EgTOO7/y6c4zgsl6JqVO6gBe5Iy65vnA
         +fynKVGszp0/9Gb2HBl/BKidaPXepnCczY0cVCMCAPfeZZdH54qhiENh+vXYIFrLT+Iw
         8lhDO0GlNg5b5EAgu6P38fECXauNw3glzuZWy3yIUPuNnVSlaEBp9LucHRFxPBUPh0dD
         vHskjmu/0ozrLQIzD+tf0gxIzUih+Eu5BqPDBhHer6jkEWgcVoTpueFbNRdvETCCsnCu
         SkTw2TnHX5a3DZgO7jrUM8fLbHPiVKwbbWEyL4Jymd4qP9sUWzhFAT231yVprQb3SxKx
         BcQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706110036; x=1706714836;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zzXHmr1qvA0UdSLvnaXumfuQjNmGkhE1FDpYmZ+o+Cg=;
        b=IeS1kBoYouYLam8QuNAbOJ5Rrt8ZnDussGFhNNPIGcaAcHgWyXpccYBbmbNWejmvtE
         tgBZWJh4E4L4FD5s63xdMSFhlyRsg5MI/CDmzGiB2uMERdwaJ0ojI4gZjfn7xgUkFT1K
         yBFU46K2SLS4upc0Ew6jRq/pOic8+ycC8PqCXIMuTMnjnlCN02uDRPkba8i6fZVs2dQe
         5Xu39Fnxnhgyg5JBq/m3olyn8WPmuKLlfvB8jpXlLVihHb6d3xCnQ35yhpYfcD+eLILk
         y9JqGdBAA3UtYT8zsB8bKSnity/f7FkH5ldcanfMyW9tzHoPpXMGKmGF/gth+RXaA7Fq
         a1hw==
X-Gm-Message-State: AOJu0YzLH9iHuaDhB2h/bIfK/BdO1iHkTwMw2viNgGnRm2zByt+jRaOZ
	1Wrtb0Dpj/+m1VmGScmD4/nHyR2jjJaXAmpfc9y5r0UOLeNSVYQVoJ8RDCRB+b+tU93gDE8nx+g
	=
X-Google-Smtp-Source: AGHT+IER3uXpZGaS8FSK8Bp7CJgbAR7fB3/HfCvQH3Miq8/g98au1H0X0DSyL3JiNT2HnQ+NquKcVw==
X-Received: by 2002:a2e:8199:0:b0:2cd:d7eb:4fce with SMTP id e25-20020a2e8199000000b002cdd7eb4fcemr1060786ljg.80.1706110036039;
        Wed, 24 Jan 2024 07:27:16 -0800 (PST)
Message-ID: <50978ef4-9f11-4c70-952b-94107616f265@suse.com>
Date: Wed, 24 Jan 2024 16:27:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: amend 'n' debug-key output with SMI count
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

... if available only, of course.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -406,9 +406,15 @@ void __init early_cpu_init(bool verbose)
 		paddr_bits -= (ebx >> 6) & 0x3f;
 	}
 
-	if (!(c->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)))
+	if (!(c->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON))) {
+		uint64_t smi_count;
+
 		park_offline_cpus = opt_mce;
 
+		if (!verbose && !rdmsr_safe(MSR_SMI_COUNT, smi_count))
+			setup_force_cpu_cap(X86_FEATURE_SMI_COUNT);
+	}
+
 	initialize_cpu_data(0);
 }
 
--- a/xen/arch/x86/include/asm/cpufeatures.h
+++ b/xen/arch/x86/include/asm/cpufeatures.h
@@ -24,7 +24,7 @@ XEN_CPUFEATURE(APERFMPERF,        X86_SY
 XEN_CPUFEATURE(MFENCE_RDTSC,      X86_SYNTH( 9)) /* MFENCE synchronizes RDTSC */
 XEN_CPUFEATURE(XEN_SMEP,          X86_SYNTH(10)) /* SMEP gets used by Xen itself */
 XEN_CPUFEATURE(XEN_SMAP,          X86_SYNTH(11)) /* SMAP gets used by Xen itself */
-/* Bit 12 unused. */
+XEN_CPUFEATURE(SMI_COUNT,         X86_SYNTH(12)) /* MSR_SMI_COUNT exists */
 XEN_CPUFEATURE(IND_THUNK_LFENCE,  X86_SYNTH(13)) /* Use IND_THUNK_LFENCE */
 XEN_CPUFEATURE(IND_THUNK_JMP,     X86_SYNTH(14)) /* Use IND_THUNK_JMP */
 XEN_CPUFEATURE(SC_NO_BRANCH_HARDEN, X86_SYNTH(15)) /* (Disable) Conditional branch hardening */
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -28,6 +28,8 @@
 #define  TEST_CTRL_SPLITLOCK_DETECT         (_AC(1, ULL) << 29)
 #define  TEST_CTRL_SPLITLOCK_DISABLE        (_AC(1, ULL) << 31)
 
+#define MSR_SMI_COUNT                       0x00000034
+
 #define MSR_INTEL_CORE_THREAD_COUNT         0x00000035
 #define  MSR_CTC_THREAD_MASK                0x0000ffff
 #define  MSR_CTC_CORE_MASK                  _AC(0xffff0000, U)
--- a/xen/arch/x86/nmi.c
+++ b/xen/arch/x86/nmi.c
@@ -589,9 +589,20 @@ static void cf_check do_nmi_stats(unsign
     unsigned int cpu;
     bool pend, mask;
 
-    printk("CPU\tNMI\n");
+    printk("CPU\tNMI%s\n", boot_cpu_has(X86_FEATURE_SMI_COUNT) ? "\tSMI" : "");
     for_each_online_cpu ( cpu )
-        printk("%3u\t%3u\n", cpu, per_cpu(nmi_count, cpu));
+    {
+        printk("%3u\t%3u", cpu, per_cpu(nmi_count, cpu));
+        if ( boot_cpu_has(X86_FEATURE_SMI_COUNT) )
+        {
+            unsigned int smi_count, dummy;
+
+            rdmsr(MSR_SMI_COUNT, smi_count, dummy);
+            printk("\t%3u\n", smi_count);
+        }
+        else
+            printk("\n");
+    }
 
     if ( !hardware_domain || !(v = domain_vcpu(hardware_domain, 0)) )
         return;

