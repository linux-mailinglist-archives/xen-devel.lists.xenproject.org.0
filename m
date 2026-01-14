Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D29E7D1F1F8
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 14:44:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1203103.1518403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg1A9-0002NK-HB; Wed, 14 Jan 2026 13:43:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1203103.1518403; Wed, 14 Jan 2026 13:43:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg1A9-0002KS-E1; Wed, 14 Jan 2026 13:43:53 +0000
Received: by outflank-mailman (input) for mailman id 1203103;
 Wed, 14 Jan 2026 13:43:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81wl=7T=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vg1A8-0002Ig-9G
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 13:43:52 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ea617b9-f14f-11f0-9ccf-f158ae23cfc8;
 Wed, 14 Jan 2026 14:43:50 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-47775fb6c56so83045085e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jan 2026 05:43:50 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47ee562df81sm27997295e9.10.2026.01.14.05.43.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 05:43:49 -0800 (PST)
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
X-Inumbo-ID: 0ea617b9-f14f-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768398229; x=1769003029; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KQ36zvjxXpDCUHe0Pi5BKTF7mvA6vIQwzP/JbYlUIEI=;
        b=Ro7hU4DXl919NDp45CQPplGNokxbzFUWKRswashXYdd0tfsvGcuGV9+N6zezxzGcSm
         jEUH3VqYWPXvuhsqHHmSt4x6vgjorod9agDUf0X3e+dFPw0skcIpVCtDcSwj7xqTu2fs
         BqriMXw8GXmyQui6/3+0xc0UxBo5p5lS6ZINBMh+P7HngEhV65wXfzws6dS+Qag1equl
         L96SFn3CzLs79Gkwvd0vHZks8JhjrahgfaJxnH480Hmn+OTK5d268wTRCY6VvoJXyH1E
         T8XRh8XG1OQd+D1zR8Zd+ykS8jBd+QCocWCtmo7AS1HCyiuJRIdgBLfc+7y9jAfYqUGp
         8zbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768398229; x=1769003029;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KQ36zvjxXpDCUHe0Pi5BKTF7mvA6vIQwzP/JbYlUIEI=;
        b=gAi6KZkVTsA+WnIv4alBEXrX7GKroRCHH6UExUamG2HasRGIL44Dw6SkhTDoIqiqcg
         pOB6fqHCEzwkgIXX7PrQSzUaIwlCOrjK13rU/0Su+cBOE1ghupo1UGtofE7hEFbOMcCC
         J1ozOBE46FYWPY7GS/i48Y9h27vFJzAyrQ8DLffvhXZSgjX3nqVq4X3VTnw5gMZucavk
         Tij+0JGwygXMHrkM9pRgjMuhYTsFJC8KmoZPU82ipG3oQPYpCXEzY14VwSLAIIZEHE2A
         4rhYXmNb6xnAOUAanHgT0F93AHJI6k2c4BcZhqRBWJl9uUQtAGqfR/u7ZlEMe/Kr1D+O
         P0Rw==
X-Gm-Message-State: AOJu0YwdU732uRs+vhbhb1ISFHV1rH4uVNp4+fQgYESfX1KUk/1MnYxf
	/ArZIA9WCxWEIRcsa1Z6lagu4qv9yIV/3q2Hj+gyY7PEhr/XTCBF1+Ef43mHRKFI8H6TKGveIL2
	atYo=
X-Gm-Gg: AY/fxX7P8/0407zQxTwMDlcRioiPK2dgJZ16kYZqP9D7gDRGRoohSbBIDNm6+IVTVux
	OgJDiMtk8tpqgJ94epaRZTwdfgTYwRxVsnplW0bkUEe6D6RPic86EI/t5lhtCyqChUt2sOEQUND
	nUlx7GTh+NZ6DS8+lMo7OPNmrmJ/41Yz9J4tBmSHLoIuhEeEukhWMQ3+Uxvk53uKpjTM6Wou4iU
	Qe7+lJK7RAnlEKDqYgALB2mS0QnWt7nMmjgoYThnoKSv6drnGZTBm5Dpt9J/lALcXXc3HklalER
	w/CkNGnNH3qDB2KqIUu6tumrpVTp3xgPYe3EucbtFAGxLBS+YLteYypYUkqnSEywEDFm4rZ4Lt6
	23L4avGNHoafJ5e+4maETBmYD4eI5gD7mu/DgHWpncjW+fsVFxLhE4mR/qtApvNdCH9ICkJZLAN
	h9ZweDkNF4BH9g3JsJx40sdqGz4fB0ir06Ubu/Mzd4WKOhRSQT7tyE+Lyw0afXdcoZRRSXVChd3
	gg=
X-Received: by 2002:a05:600c:698c:b0:47e:dddc:3369 with SMTP id 5b1f17b1804b1-47ee339984cmr32093635e9.35.1768398229408;
        Wed, 14 Jan 2026 05:43:49 -0800 (PST)
Message-ID: <29eb0997-bf74-4cde-ba7b-6977223c3829@suse.com>
Date: Wed, 14 Jan 2026 14:43:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 2/6] x86: replace APERFMPERF synthetic feature bit
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <4d3a3576-2d3c-42ec-8551-18f1f0982e17@suse.com>
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
In-Reply-To: <4d3a3576-2d3c-42ec-8551-18f1f0982e17@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Use the respective host CPU policy bit instead. This has the (tolerable,
as we generally assume symmetry anyway) effect of using the BSP's
(unleveled) setting, rather than the result of leveling (as is done by
identify_cpu() on boot_cpu_data, rendering the variable name somewhat
misleading).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
The leveling of boot_cpu_data is problematic anyway, as that way features
can in principle disappear post-boot (as CPUs are being brought online;
just that we don't think anymore that we really support physical CPU
hotplug).
---
v3: Re-base over naming changes.
v2: Extend description.

--- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
+++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
@@ -80,7 +80,7 @@ unsigned int get_measured_perf(unsigned
         return 0;
 
     policy = per_cpu(cpufreq_cpu_policy, cpu);
-    if ( !policy || !cpu_has_aperfmperf )
+    if ( !policy || !cpu_has_hw_feedback_cap )
         return 0;
 
     switch (flag)
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
 
 #ifndef __ASSEMBLER__
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
+#define cpu_has_hw_feedback_cap host_cpu_policy.basic.hw_feedback_cap
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


