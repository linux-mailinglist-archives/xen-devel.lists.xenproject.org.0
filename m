Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53645C8071B
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 13:24:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170423.1495498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVbp-0001pq-Hq; Mon, 24 Nov 2025 12:23:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170423.1495498; Mon, 24 Nov 2025 12:23:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVbp-0001ne-EY; Mon, 24 Nov 2025 12:23:57 +0000
Received: by outflank-mailman (input) for mailman id 1170423;
 Mon, 24 Nov 2025 12:23:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNVbn-0000wa-SZ
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 12:23:55 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7183907e-c930-11f0-9d18-b5c5bf9af7f9;
 Mon, 24 Nov 2025 13:23:55 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4775ae77516so42538895e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 04:23:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477bf1df3d5sm193468095e9.2.2025.11.24.04.23.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 04:23:54 -0800 (PST)
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
X-Inumbo-ID: 7183907e-c930-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763987034; x=1764591834; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6vmubra/7p/KMumCP8wGDTSWTzldfYnULy/EwhAsbaU=;
        b=Vu90DpdwawXdrJ+7LliekHDMU6Eka6vuFP67k17cbwdYLApj79e0LMEMiGc+Ya2Had
         wzof6EwjhtYpSgjp2nDuoKSlcmCcRGnTUIFqBOB8EAyfQy08X0eXlYoE4yb4nTo9dz4K
         rHIHtlRlh4SEegMeaEsq2wwhj/0bJwUGt7P/P56X+WyXAdB6uDIdZBxICMyGsh3IqMCD
         8YuX+V3GmdU2mIppMaDOG+e/d2OMi50MYFcDSPlKadXTwFQKMYCZFUorx7Sq3ESojU7v
         H4W9sIYs1vnT5y9uqmsRDLun4eUEhdxueWllCPfXjLhFFMfBsaQ3seGawnV5iIrcXc4v
         2ZvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763987034; x=1764591834;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6vmubra/7p/KMumCP8wGDTSWTzldfYnULy/EwhAsbaU=;
        b=AADAUykTbGMjR77f/QwUyR9JqSZyeweqyGxFTrO+bW0bCAQ1tBDD2SxxtxqmLhQRlM
         NLwOQmGASexxcNNXnelNhTR5jhzs8t7T7cXUZcCYurcUKEnecUdLpEzyb1hBzoeaYi0h
         d5AzI0uIckTvPZkXQbxq41cF7i034JzaK+M9OqEiH8aPNZ0UJfxe4kt9CHZHHZfogL8a
         0gnzEcChKst1Hl+Us4FswDxPV02ZSzCXhX++eNMSvNoV6zBOCVWMHr3eCXVYR+8SDII0
         52iN811AfGp7uw+RnRRYpGGvMwNKwSZ5c9GmXRbO5h9QlWbZBZQ/mrbmL5NfEGyHvwM6
         9Acw==
X-Gm-Message-State: AOJu0Yz/1lBo6iVtRF1juhYz8neKuqthkT7zTpZc0pMRw29FKMNhXSbs
	GXPWsCgtThbZe6M81SGdoMb/rINda0ztR9TX3ioX5iVq7bVJZPM79K0R220KoYocXlpfEx4p/2O
	iLho=
X-Gm-Gg: ASbGncu1ynAuMuCLs4RJbh2nTppCafDODxTULGMoEQuJwmYDvdGC56XTQNF0a6mSPEI
	8joWubE9LA3dBffnlJAcGolrOTRY6/6XfXCOcWlkTRyj1kl3Bghnn4sske36Ad5uiu8vOzaSeyI
	f1pGLaJg+NeRrbINKZZTxTh+o1L4np99z6niWgTWR8V+H6PBammu8901rV2b6DwDysxT7O9lHM3
	S/IgxY+iJiYQEly+TJwGp1MLze+UZgsEt5/qch1s8k6Y8PhFhwF2Cgdf+MH8FqbaJM865YcpXBF
	B5qptbAUSuj4xQn1ny7huriGmxU1wXsy/Yn9t3WkxS0EbsuTZH1f/O4qO6zLtqxvswZWgWugLC/
	oL5gFweiQzHyfb84Pj2MDFaV4q0xOdm49T6gwqL48QU10gvGtoVySV99y6CtSxzLVGhpSz2Xcnm
	6/ywAOYeSDecVYocDG6sGgi7T2AtBdcanbiSZE4I2gwWs9Ak6rH0kSQdRvx4PEyYxXr4BRfDxMR
	Gc=
X-Google-Smtp-Source: AGHT+IEgRGqKvdZisWoeFS6OT5uX7pWX9yiYiD498Wwkm5FffvTMhbxKVTgW6YvSF+b9MuLbRiYZEQ==
X-Received: by 2002:a05:600c:1c29:b0:477:639d:bca2 with SMTP id 5b1f17b1804b1-477c10c85e2mr128308815e9.4.1763987034312;
        Mon, 24 Nov 2025 04:23:54 -0800 (PST)
Message-ID: <80a6e497-bde6-4c5b-ade8-850abf0046ad@suse.com>
Date: Mon, 24 Nov 2025 13:23:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 2/6] x86: replace APERFMPERF synthetic feature bit
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <f0ac75c8-5d65-43ef-aeeb-78d34f1da470@suse.com>
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
In-Reply-To: <f0ac75c8-5d65-43ef-aeeb-78d34f1da470@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Use the respective host CPU policy bit instead. This has the (tolerable,
as we generally assume symmetry anyway) effect of using the BSP's
(unleveled) setting, rather than the result of leveling (as is done by
identify_cpu() on boot_cpu_data, rendering the variable name somewhat
misleading).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The leveling of boot_cpu_data is problematic anyway, as that way features
can in principle disappear post-boot (as CPUs are being brought online;
just that we don't think anymore that we really support physical CPU
hotplug).
---
v2: Extend description.

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
+#define cpu_has_aperfmperf      host_cpu_policy.basic.aperfmperf
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


