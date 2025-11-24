Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4317DC80733
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 13:24:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170444.1495518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVcU-0002vY-1n; Mon, 24 Nov 2025 12:24:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170444.1495518; Mon, 24 Nov 2025 12:24:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVcT-0002rs-TE; Mon, 24 Nov 2025 12:24:37 +0000
Received: by outflank-mailman (input) for mailman id 1170444;
 Mon, 24 Nov 2025 12:24:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNVcT-0000wa-41
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 12:24:37 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a3bdcfb-c930-11f0-9d18-b5c5bf9af7f9;
 Mon, 24 Nov 2025 13:24:36 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-47774d3536dso32672085e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 04:24:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7f2e556sm27720292f8f.5.2025.11.24.04.24.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 04:24:35 -0800 (PST)
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
X-Inumbo-ID: 8a3bdcfb-c930-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763987076; x=1764591876; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9yIW4G90REKYw1NybA2TBgWfxi68QMrBUK7Kmuc3ASs=;
        b=ORqA0Z2RVGGvkSwVbedbb/ikff+bZKjrarW1y1N+wEav21jxybqffsgSdNhI5yCtWg
         od6CmVQnm+mG85R5HqA9PqKtgqtusYnMLahraZA/i78ZJj6cJ8DO8ztzbcVBARVlC+Bx
         jASeclJm0+OfXpxRLZF0DKhkeBo3FxHuExhmUtmlyqu+iIKAnI8LFxIk3WV0LBs8fy5q
         XLr9CiGxL+J9Hb6LBN5RzsTmke8GgwD6tIdyoSp/hev1lL6/MxP2qwFlfKDuJHtSxKLe
         blST03fzAUIZPRQz0Zp4FgnHbDXjDJc1GGWjVIz95dqXIKDKKNwXqDRAzIziguweJeA3
         jiQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763987076; x=1764591876;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9yIW4G90REKYw1NybA2TBgWfxi68QMrBUK7Kmuc3ASs=;
        b=WLAZqfzSA5/6rG6f9dHj5y89/Q70VPgA60iUWDCUCxlTeBIjnLVh1J+PDUjDYXHpCM
         8akSeTpyCPEkFpt3krlZ/lmB4OJgOaTjXOd5EVUNS2Jah1XNki1vR3WcDVK24H+o4m7W
         hS3iq9sxMM47JrMD2U8IyAVUfXIcgwd0zP8dOHguN4ek22Mkh0W6LH3R0N2QT/wZi7oG
         NeCMQLkk4SOlujRLde2VvPvqFBtncSlsk+d3e8+hrWtgl2+qYWERBFIJjY6m7PyKGIoN
         KCyrA8vwJNghCAWjoQyQqNS8H2SxGfRxn7rC173hGiIyFEzwkukTjKvZdv99roJFDwgf
         xN5g==
X-Gm-Message-State: AOJu0YyuTD3yy04ftW4vFohRxBMq/sTue3U05gqc0wJlGnwcsds1ZkWE
	iNe5G1IYMM4+rWxLfjA+UoN77mFzYA6FN3sBCrZI4xQ0NVCquEf/bwrTJ8g/EvThaTRElD4rqSE
	1YaY=
X-Gm-Gg: ASbGncvct5X/ojR/0sLUiU63tQrB6B6F35miHEpMXKI3QrSJJSN6LNF50msvKf5m/VY
	HlU8Irqza9XPQ0JpakYtwGDwkCm/+SRNLFIuCRuLNhnru3k0miW/IKqtmYdki/JEo+BYb8JLlPW
	3sIQO+GA5v6GyoJyNXyvJnQTLSLkyyqsKMk8Eaz3On0/u6srOccOYkf/nyrJXcetgOO2rnGKUdH
	za2qaEvFg3IQL7TIg3lrgFvpSEbIHZUNb/XKUszTVHCRwxnaFZviagkkV6w+JkCWilbG2dFFd92
	yxxGyoDg2DgdmStxDIJWLADc17hl31vY6cxQTheYasMsIuFd53SQJK1FmfuU+ITvE0xYnCxHDow
	KilAdKcrT6FH6iWbQaWqB8TpmOqffXc4e4ELLdI28+T6TxMy06XDICKHBdYM9RwW5FRxAGF/gQT
	ijIUkWZWAA++4nXNl7hZjvkn6zvh7z/+XgRGF5SqhEFhNJhrOWZ35Tod45FKbdz2w6lhTivoLG4
	naoHrVq3jMeDA==
X-Google-Smtp-Source: AGHT+IH41QTQw2pCn1UpNPVpa4BHxFAXWv91/AGuQ7Ll8pTEN8Zse4uO2jhH1mnG0Rsd32WP4RRn+A==
X-Received: by 2002:a05:600c:4515:b0:477:7a5c:6a8e with SMTP id 5b1f17b1804b1-477c0513800mr102536885e9.9.1763987075752;
        Mon, 24 Nov 2025 04:24:35 -0800 (PST)
Message-ID: <bb5fef0f-a2a9-49ab-97bc-871486a44f89@suse.com>
Date: Mon, 24 Nov 2025 13:24:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 4/6] x86/Intel: use host CPU policy for ARAT checking
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
+#define cpu_has_arat            host_cpu_policy.basic.arat
+
 /* CPUID level 0x00000006.ecx */
 #define cpu_has_aperfmperf      host_cpu_policy.basic.aperfmperf
 
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -102,6 +102,7 @@ extern void setup_force_cpu_cap(unsigned
 extern bool is_forced_cpu_cap(unsigned int cap);
 extern void print_cpu_info(unsigned int cpu);
 extern void init_intel_cacheinfo(struct cpuinfo_x86 *c);
+extern void intel_init_arat(void);
 
 #define cpu_to_core(_cpu)   (cpu_data[_cpu].cpu_core_id)
 #define cpu_to_socket(_cpu) (cpu_data[_cpu].phys_proc_id)


