Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8A4C6A36F
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 16:07:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164935.1491787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLNIl-0003N5-Sy; Tue, 18 Nov 2025 15:07:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164935.1491787; Tue, 18 Nov 2025 15:07:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLNIl-0003L9-QI; Tue, 18 Nov 2025 15:07:27 +0000
Received: by outflank-mailman (input) for mailman id 1164935;
 Tue, 18 Nov 2025 15:07:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=maYy=52=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vLNIk-00033y-04
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 15:07:26 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a805d05-c490-11f0-9d18-b5c5bf9af7f9;
 Tue, 18 Nov 2025 16:07:25 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b73b24f1784so272297966b.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Nov 2025 07:07:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fa81296sm1393799666b.6.2025.11.18.07.07.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 07:07:24 -0800 (PST)
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
X-Inumbo-ID: 4a805d05-c490-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763478445; x=1764083245; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UcLxhIrNXaMN+dEZIS/JAOfVnBILwCijMp1B3XCEPJ8=;
        b=EoyIwBqaKYIu7aNm2p71Lczqz+xj/H2j6+ZwolZH8Q1MyUf1OnV79wb5hXjhFJRAW2
         Lk6aD+QocT9o3KPhnq1ORlp39YouNnqUQhXrVJweYkGE1bvpaeoOV5qwq29kLSbOpV3X
         Z4xjMUiFyJWrEmDxLYxFAh7XD/S/brcEn5k/qqC+riSIU90DNMV9ASueWwNmIIuvctS4
         oTTCbP3sBrRbalOfmhQJLOG0SkkrDdJGFxL3rakOfJcalfDNyIMscOUkki4/sx/Qhkl6
         9agYf5f4C929YxOShyHG8HcwuigyFxp/KZSgO6DJ4l3OvrDFxYyXu+kW5LfT7AnqeA2s
         Ysgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763478445; x=1764083245;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UcLxhIrNXaMN+dEZIS/JAOfVnBILwCijMp1B3XCEPJ8=;
        b=PCNxfoyvwQYHETA6XOYhr6RalWJnX1bWba0YPCHro7epv/CXkwMUrtoxnPsL7YmuOc
         l/KuIP6TdFf7J6REOf8yyLt7u+8UWH1C89sfet89/AhA9eEicK7OcT2kpYnjPNftW+OO
         DpKfuJFBaFHsKL9TN/FP1lZEJSAxqQ6r0ZbjJH2S+R+i/RiBN1zT9uBvRrgQbnLoHtTH
         01w7we2t+gE4B6yum2920Un6EJhPoM7VNwyaj4cZe12y8ZfBWz1TYklIoAtaPsA9QMbS
         RobvgH+Q+qJ23xo+ZFeBCxrRTodtNbIsc8LlYIcM/7jSIA82vFQvWh+HeXo1nOvJbJeW
         5y1A==
X-Gm-Message-State: AOJu0Yw8r0s+n71NY805jhK8XR65k2M+MBMJYXr1UiA3w6roNwwbxqXi
	R3LV7b9UbrjPHhLCZKu94dp5xZ2J7yUkeRpt9V/awiywGxogPVd3siB9y6vCwL7JjJTTN3EXCQ9
	ODaQ=
X-Gm-Gg: ASbGncs/Sb5lfM0n7kFEmleMcG0qkqXpok4h7kjhREXpRJy366D4uxIOI/6k8dXr4dB
	KQDO3VJ5irArGzgpcnhT0t1k8JdMkXOy/C9MfHiUfK0Vu8joq14DVpGmEJHlWIiJYnoDfZCKTI2
	8uvV4tepwZc1XghTPaOf9oBqRkid7mRFiZMnYaEocYGURGK5YBFAHS3j49/Du69RZfPfYw0bivv
	cW9afuDUERzyBRt7Oj4mF4i4rzDrwgNsC80PUi+gxQObOwwZs+G7MSdfsbg5GaYuGzQzIps3ujZ
	f+QBZrz5CHnhVYDJ1OpSIu6ifYPwmP21WzIwPwN+Afvk0/yeTDyxQA60Sx260S0ZZyW+snA27O5
	OMyHciNTpXWepRrOkCaDPVOPt8O+7My51QBvmtZDnQPY5JS5xDn83LzPMbU9IYcRfl1i7H5YbzK
	fIu5PiHfq/vPWaYE7LX6Uq0rYayoMdyKagsiZBU026SKmxWYDaThmaCwCC4a48vSfBCqf/HmpR3
	RIoAvxS/2lpag==
X-Google-Smtp-Source: AGHT+IE2AMQszacX3K1IzrjUWAeT0RvSIr8T9X7hWthAm+aZ3Z96afG5mCWt0bR5QdrEXk8PAbchzA==
X-Received: by 2002:a17:907:2d87:b0:b6d:3456:14b3 with SMTP id a640c23a62f3a-b75a0a546b7mr365066466b.20.1763478444409;
        Tue, 18 Nov 2025 07:07:24 -0800 (PST)
Message-ID: <505029ff-cb2e-425c-bf5c-3ac364f32140@suse.com>
Date: Tue, 18 Nov 2025 16:07:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 4/8] x86: replace APERFMPERF synthetic feature bit
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <53ef6c9a-1115-4bb4-bb7f-e2595ab9d0b6@suse.com>
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
In-Reply-To: <53ef6c9a-1115-4bb4-bb7f-e2595ab9d0b6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Use the respective host CPU policy bit instead.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -523,10 +523,6 @@ static void generic_identify(struct cpui
 	if ( cpu_has(c, X86_FEATURE_CLFLUSH) )
 		c->x86_clflush_size = ((ebx >> 8) & 0xff) * 8;
 
-	if ( (c->cpuid_level >= CPUID_PM_LEAF) &&
-	     (cpuid_ecx(CPUID_PM_LEAF) & CPUID6_ECX_APERFMPERF_CAPABILITY) )
-		__set_bit(X86_FEATURE_APERFMPERF, c->x86_capability);
-
 	/* AMD-defined flags: level 0x80000001 */
 	if (c->extended_cpuid_level >= 0x80000001)
 		cpuid(0x80000001, &tmp, &tmp,
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -11,7 +11,9 @@
 #include <xen/macros.h>
 
 #ifndef __ASSEMBLY__
+#include <asm/cpu-policy.h>
 #include <asm/cpuid.h>
+#include <xen/lib/x86/cpu-policy.h>
 #else
 #include <asm/cpufeatureset.h>
 #endif
@@ -121,7 +123,6 @@ static inline bool boot_cpu_has(unsigned
 #define CPUID6_EAX_HDC                               BIT(13, U)
 #define CPUID6_EAX_HWP_PECI                          BIT(16, U)
 #define CPUID6_EAX_HW_FEEDBACK                       BIT(19, U)
-#define CPUID6_ECX_APERFMPERF_CAPABILITY             BIT(0, U)
 
 /* CPUID level 0x00000001.edx */
 #define cpu_has_fpu             1
@@ -175,6 +176,9 @@ static inline bool boot_cpu_has(unsigned
 #define cpu_has_fma4            boot_cpu_has(X86_FEATURE_FMA4)
 #define cpu_has_tbm             boot_cpu_has(X86_FEATURE_TBM)
 
+/* CPUID level 0x00000006.ecx */
+#define cpu_has_aperfmperf      host_cpu_policy.basic.pm.aperfmperf
+
 /* CPUID level 0x0000000D:1.eax */
 #define cpu_has_xsaveopt        boot_cpu_has(X86_FEATURE_XSAVEOPT)
 #define cpu_has_xsavec          boot_cpu_has(X86_FEATURE_XSAVEC)
@@ -292,7 +296,6 @@ static inline bool boot_cpu_has(unsigned
 /* Synthesized. */
 #define cpu_has_arch_perfmon    boot_cpu_has(X86_FEATURE_ARCH_PERFMON)
 #define cpu_has_cpuid_faulting  boot_cpu_has(X86_FEATURE_CPUID_FAULTING)
-#define cpu_has_aperfmperf      boot_cpu_has(X86_FEATURE_APERFMPERF)
 #define cpu_has_xen_lbr         boot_cpu_has(X86_FEATURE_XEN_LBR)
 #define cpu_has_xen_shstk       (IS_ENABLED(CONFIG_XEN_SHSTK) && \
                                  boot_cpu_has(X86_FEATURE_XEN_SHSTK))
--- a/xen/arch/x86/include/asm/cpufeatures.h
+++ b/xen/arch/x86/include/asm/cpufeatures.h
@@ -19,7 +19,7 @@ XEN_CPUFEATURE(TSC_RELIABLE,      X86_SY
 XEN_CPUFEATURE(XTOPOLOGY,         X86_SYNTH( 5)) /* cpu topology enum extensions */
 XEN_CPUFEATURE(CPUID_FAULTING,    X86_SYNTH( 6)) /* cpuid faulting */
 XEN_CPUFEATURE(XEN_FRED,          X86_SYNTH( 7)) /* Xen uses FRED */
-XEN_CPUFEATURE(APERFMPERF,        X86_SYNTH( 8)) /* APERFMPERF */
+/* Bit 8 unused */
 XEN_CPUFEATURE(MFENCE_RDTSC,      X86_SYNTH( 9)) /* MFENCE synchronizes RDTSC */
 XEN_CPUFEATURE(XEN_SMEP,          X86_SYNTH(10)) /* SMEP gets used by Xen itself */
 XEN_CPUFEATURE(XEN_SMAP,          X86_SYNTH(11)) /* SMAP gets used by Xen itself */


