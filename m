Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC65D1F294
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 14:47:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1203141.1518443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg1DV-0004iP-Nt; Wed, 14 Jan 2026 13:47:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1203141.1518443; Wed, 14 Jan 2026 13:47:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg1DV-0004f1-Kg; Wed, 14 Jan 2026 13:47:21 +0000
Received: by outflank-mailman (input) for mailman id 1203141;
 Wed, 14 Jan 2026 13:47:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81wl=7T=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vg1BV-0001vr-Qe
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 13:45:17 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42529160-f14f-11f0-b15e-2bf370ae4941;
 Wed, 14 Jan 2026 14:45:16 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-47ee301a06aso8479145e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jan 2026 05:45:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47ee119aa2asm22125615e9.4.2026.01.14.05.45.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 05:45:16 -0800 (PST)
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
X-Inumbo-ID: 42529160-f14f-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768398316; x=1769003116; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ShrMN6y1f3Pp4MjOmW8owsNUITc4IfDLUGq6mur2Md0=;
        b=WRUsMAEQ24+uZq5stpEjAJLj4Zy4PImKVyFloe2w+43veGxlyNenK/iSAylovGiztr
         bQfQMF1FQ1ESONm+7Hn0vFkgHZG6iD6v03p2ZDY52rKd1ytrBi0D/5Upb89Bvtd71dLF
         FrfFNjjgBjymGWwRB9gktmEmsz3oeTr++t1m2+hn1BuxMsR5Xv2R8B2Su4YV/fmw2YGv
         TBoLPddK1++nTiNN1k6iUkDbNaLcW3d+t9r5ySSD1P+301P+I98AkudIe0HrZlE4dYVw
         EPuD6ZIPLoFG776DmWwkgKI3zvt1TraES2dgtSA+CtuJO/6aocSZEkMKLbDj3TetCC7M
         i38g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768398316; x=1769003116;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ShrMN6y1f3Pp4MjOmW8owsNUITc4IfDLUGq6mur2Md0=;
        b=cuF5XHnd7accBGArKNilQg7yLKfVywetaaIaTuKkLTsTHSPY6GW81b7HcZG2mHML5G
         CQSLBPko4FYLxdmF6Wrz87gXWolNe526Tt0FkLK/2IjflRIu2G9XEcbjb96y07BM1EBj
         xxRA2o5QuVWh7cWIh9+wSIb25CbR93W3acw5MK/4wFvDPKW4Ap/QgpSzCPbl+TO4fvmM
         EvMdVfDV5Dp4eTQtTNpvnrmw/Hl/4oHB1Q2WGANAIKz97kzKxOPn0T3m8mWVD49qEbnQ
         rqEPWG7bpxX/bZz/aN/F7xN7vGpAPpl/fpqR1ss1atIx+QPa2TXaDnpqFinJnI3mVhM4
         g9jw==
X-Gm-Message-State: AOJu0Ywq1TtT7bOYMtZWnG59qLrRCuA45VC8FX8LNXu31PYJxnqB+LhB
	aJrt9Qm4qknZZvrNACNRpokVUi4bYMvhFVN2R1HOL2XSMJbQ3ISYvX/xmaT1qkXGo5TFOB0ZBlZ
	dA6Q=
X-Gm-Gg: AY/fxX69gz/xiLn/G8uenB/Nn2jIsSNEn+pZUFpqCAv2EhlrVssrS3aEL1GIDunzhzs
	V3XE+nuNPFVmkx0TlhtrGlGPN07QIFfHVGUIjcWZ1PFxqgUDXypNblpz1b3is58/QLzf+rkEG0G
	ZHk8cvlnjF16SL1tLhclY6tb2oJn2N7ljAW6BNEoWb/MOOtWAPz8n5moRsSaUAfpelzshLJCHHP
	IcfgZQZputUBma98ldtQF+oGT2xhZgKrFAqI1BYBsd5Vs18XIIrGr87gArDKB4ATDwTFDcIYkbz
	MCnSuOIkqHDLogoYyUi3Df43C4t+dLIbi2apLO2Xe6HrQRmW2VlRxAVjtamH4agqR+9FeobZ1d6
	89dVf1OZcSbswEGsjmNHwkhSIw72R0+LMSHKdgmX1l2ev+i7pcuIAAsZcELzTAkbaFT7E4qeChL
	u/NLpRUo6OyX47QtB1cbd98p9kowWKsiuzRUhbWQdZvojzamf2v3wlRjxAKGKxdOye/b0Ek5yJp
	xdpE9PIwVjxng==
X-Received: by 2002:a05:600c:c8d:b0:46e:59bd:f7d3 with SMTP id 5b1f17b1804b1-47ee33768c9mr30700245e9.20.1768398316425;
        Wed, 14 Jan 2026 05:45:16 -0800 (PST)
Message-ID: <cbd64113-621a-409a-ab05-f593999e67a9@suse.com>
Date: Wed, 14 Jan 2026 14:45:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 4/6] x86/Intel: use host CPU policy for ARAT checking
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

There's no need to invoke CPUID yet another time. However, as the host CPU
policy is set up only shortly after init_intel() ran on the BSP, defer the
logic to a pre-SMP initcall. This can't be (a new) one in cpu/intel.c
though, as that's linked after acpi/cpu_idle.c (which is where we already
need the feature set). Since opt_arat is local to the cpu/ subtree,
introduce a new Intel-specific helper to hold the code needed.

Further, as we assume symmetry anyway, use setup_force_cpu_cap() and hence
limit the checking to the boot CPU.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
The need to move where cpu_has_arat is checked would go away if we did
away with opt_arat (as mentioned in the previous patch), and hence could
use cpu_has_arat directly where right now XEN_ARAT is checked.
---
v3: Re-base over naming changes.

--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -1666,6 +1666,9 @@ static int __init cf_check cpuidle_presm
 {
     void *cpu = (void *)(long)smp_processor_id();
 
+    if ( boot_cpu_data.vendor == X86_VENDOR_INTEL )
+        intel_init_arat();
+
     if ( !xen_cpuidle )
         return 0;
 
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -665,10 +665,6 @@ static void cf_check init_intel(struct c
 		__set_bit(X86_FEATURE_NONSTOP_TSC, c->x86_capability);
 		__set_bit(X86_FEATURE_TSC_RELIABLE, c->x86_capability);
 	}
-	if ( opt_arat &&
-	     ( c->cpuid_level >= 0x00000006 ) &&
-	     ( cpuid_eax(0x00000006) & (1u<<2) ) )
-		__set_bit(X86_FEATURE_XEN_ARAT, c->x86_capability);
 
 	if ((opt_cpu_info && !(c->apicid & (c->x86_num_siblings - 1))) ||
 	    c == &boot_cpu_data )
@@ -693,3 +689,9 @@ const struct cpu_dev __initconst_cf_clob
 	.c_early_init	= early_init_intel,
 	.c_init		= init_intel,
 };
+
+void __init intel_init_arat(void)
+{
+    if ( opt_arat && cpu_has_arat )
+        setup_force_cpu_cap(X86_FEATURE_XEN_ARAT);
+}
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -176,6 +176,9 @@ static inline bool boot_cpu_has(unsigned
 #define cpu_has_fma4            boot_cpu_has(X86_FEATURE_FMA4)
 #define cpu_has_tbm             boot_cpu_has(X86_FEATURE_TBM)
 
+/* CPUID level 0x00000006.eax */
+#define cpu_has_arat            host_cpu_policy.basic.arat
+
 /* CPUID level 0x00000006.ecx */
 #define cpu_has_hw_feedback_cap host_cpu_policy.basic.hw_feedback_cap
 
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -102,6 +102,7 @@ extern void setup_force_cpu_cap(unsigned
 extern bool is_forced_cpu_cap(unsigned int cap);
 extern void print_cpu_info(unsigned int cpu);
 extern void init_intel_cacheinfo(struct cpuinfo_x86 *c);
+extern void intel_init_arat(void);
 
 #define cpu_to_core(_cpu)   (cpu_data[_cpu].cpu_core_id)
 #define cpu_to_socket(_cpu) (cpu_data[_cpu].phys_proc_id)


