Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F08CC6A3DA
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 16:11:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164972.1491838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLNMo-0006ld-J5; Tue, 18 Nov 2025 15:11:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164972.1491838; Tue, 18 Nov 2025 15:11:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLNMo-0006jS-FP; Tue, 18 Nov 2025 15:11:38 +0000
Received: by outflank-mailman (input) for mailman id 1164972;
 Tue, 18 Nov 2025 15:11:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=maYy=52=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vLNJV-00026P-I6
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 15:08:13 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 662e9a63-c490-11f0-980a-7dc792cee155;
 Tue, 18 Nov 2025 16:08:11 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6417313bddaso9029704a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Nov 2025 07:08:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fa80afbsm1350070166b.11.2025.11.18.07.08.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 07:08:10 -0800 (PST)
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
X-Inumbo-ID: 662e9a63-c490-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763478491; x=1764083291; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=W86zTLEXpDpklYi+GcoFltRiRTg9CcQOeSAaFkrNf28=;
        b=buihZib3bkytVULX1qWJ16BSNmfek/ewWT8+waWnCQEbdE90P2cRGX1gATkO32KtdG
         eARg4UZV2Q+/F6rOXuSsqVApXVvcpl3VrbquG0XWuQM25DboVbJyuLghqcdyqf9eHgS2
         tAeObkmiq0HUzmIcCDiFwtovIzV/6H7SCzxipGmQBOKxubzvEuayGZzG0B+bfATuRX32
         tJJqeI9f41oGkPzz1a3aaDz16xBFrVFAPS2GoOPQ5fpdwSlPFjVnbPGJT5ZkpREVDH74
         DinjHIBrdrW6kNecmCWar7KD4yFjbGKgt7j5uwNu1yOhyWt5/FllTQsQxtmnoCoKONpl
         +nRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763478491; x=1764083291;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W86zTLEXpDpklYi+GcoFltRiRTg9CcQOeSAaFkrNf28=;
        b=QLpNO5OxO4qliODQUrq3E7I1raKjIWT9aH4ZViR8NbtBMXq4VvytcUz0hbhe7bHNa9
         OLwu5okYpthpq3I1f2j3I2KCGRzNbUSUEEJbp8A3Qh+C5Kvga7i1q0Wh5oyO63KPnVem
         aBaqEDNMwCTBWLZ3cjHXpW9z8wmaHyznx3qeAJp6dSjoNOX6TjxUdzsYjuxitNlGYFXb
         5BSkwFEl/XGTKG+hZ6nfocrYm0G5pXTkaYpEkhgnOEBaspqqg+W0CV+AEXt2sE8MDkbt
         +pSA7tozJOpChfeV9RhdykH4lZ39TQxiQM9FNaHw/DK60UyzNogW9jF96PWw6auMOUVo
         ZM7w==
X-Gm-Message-State: AOJu0YyJNb4AR8fOgdtLnZWpAQGAcFD7mZN7wfwx4zciZyAnfWXElBX+
	JLIpHWFb0rcQQ/Sf3ommaaBuO6S9WbO8yfknGFeFm5w/V8Oc2EvHrBvi3bLAX9UT+U0Py1nxndc
	OsuA=
X-Gm-Gg: ASbGncufTdA2eSIhZaTDPB/8bGkQFSgT8y9iW2zOtf2QfDC7sm2qBVFkknjIVuG5zT4
	YmaaAonLH7a6LkwCPXJt5qki9hNjocKJwrZlH3sKUSgAVBsozK1/ntuSPwdY62MX3kOq7VQFix3
	UzrTB3ihqltzE7CCsuRO6HbTQR3BhL/atFjeIhaceuN6jYts0tz9Z4oZpgaKUoUiJXzh07q/PT7
	9sZIe8z3pZS46f6EF+vd/2YoO+QAERAm65kfkav5tXVOl8rqP0fNCQzlyrOBTVnbgkAnfqfG6oP
	WDrOhyjxm7NOKB1026DjBPF9NDWXBzm3KqDMA85mClAtyNVtGDGkp4bJScpnDXzPPT7KDKKnosr
	WTOvWdXv0CfMJf1MkELWfBQrXDgeQLi8eeTRaiKX4sTiGFOzUAdNgrndiqebNVB2uYQpWvznd21
	S5tsxrq1Nh+h/IlCGPnlaOdrLdiUqOKuTt+tBgnQ3s8AR5T8XVYIl9OlAxV3FC2XGikeivicvBF
	iQ=
X-Google-Smtp-Source: AGHT+IEczz1Xgz1tWQgteHlheUhiJDKhuAQVZpHPlpECj+Ngb7vc1kuYcwHlMZr0Z8Drt989UCT1rQ==
X-Received: by 2002:a17:906:4786:b0:b73:5131:c45b with SMTP id a640c23a62f3a-b73678293b3mr1437014566b.22.1763478491035;
        Tue, 18 Nov 2025 07:08:11 -0800 (PST)
Message-ID: <65cb802c-922d-4bee-9dee-566367bec6ed@suse.com>
Date: Tue, 18 Nov 2025 16:08:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 6/8] x86/Intel: use host CPU policy for ARAT checking
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

There's no need to invoke CPUID yet another time. However, as the host CPU
policy is set up only shortly after init_intel() ran on the BSP, defer the
logic to a pre-SMP initcall. This can't be (a new) one in cpu/intel.c
though, as that's linked after acpi/cpu_idle.c (which is where we already
need the feature set). Since opt_arat is local to the cpu/ subtree,
introduce a new Intel-specific helper to hold the code needed.

Further, as we assume symmetry anyway, use setup_force_cpu_cap() and hence
limit the checking to the boot CPU.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The need to move where cpu_has_arat is checked would go away if we did
away with opt_arat (as mentioned in the previous patch), and hence could
use cpu_has_arat directly where right now XEN_ARAT is checked.

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
@@ -690,3 +686,9 @@ const struct cpu_dev __initconst_cf_clob
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
+#define cpu_has_arat            host_cpu_policy.basic.pm.arat
+
 /* CPUID level 0x00000006.ecx */
 #define cpu_has_aperfmperf      host_cpu_policy.basic.pm.aperfmperf
 
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -102,6 +102,7 @@ extern void setup_force_cpu_cap(unsigned
 extern bool is_forced_cpu_cap(unsigned int cap);
 extern void print_cpu_info(unsigned int cpu);
 extern void init_intel_cacheinfo(struct cpuinfo_x86 *c);
+extern void intel_init_arat(void);
 
 #define cpu_to_core(_cpu)   (cpu_data[_cpu].cpu_core_id)
 #define cpu_to_socket(_cpu) (cpu_data[_cpu].phys_proc_id)


