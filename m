Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65899906668
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2024 10:19:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739688.1146630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHfgF-0008US-4f; Thu, 13 Jun 2024 08:19:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739688.1146630; Thu, 13 Jun 2024 08:19:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHfgF-0008Rv-1v; Thu, 13 Jun 2024 08:19:35 +0000
Received: by outflank-mailman (input) for mailman id 739688;
 Thu, 13 Jun 2024 08:19:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mvQ+=NP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sHfgD-0008Rl-Mc
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2024 08:19:33 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9a417d3-295d-11ef-90a3-e314d9c70b13;
 Thu, 13 Jun 2024 10:19:32 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a6f1da33826so109889466b.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jun 2024 01:19:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56ed3590sm45571666b.98.2024.06.13.01.19.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jun 2024 01:19:31 -0700 (PDT)
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
X-Inumbo-ID: a9a417d3-295d-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718266772; x=1718871572; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N8LlFuRQgnRz0O9t1OBsogqAF1aAI8bFLWduLEN2M4c=;
        b=UWZMsdy5DaNRAfqGgJnKFNQp5FYAUz0I0a5urzm9Hbvta8ktF0JeWn8QyNF+B/qYZo
         dGsY6LG0oFy9OdqTbBBkOtAsKIDxOxShjqNrfEAR6MEB1bsa5comKSjd8+o4MxlMqGMe
         pIZvSR+dEpItUEdy1IZ8SABtO+dMYTVgQ7oA5/gPN2a8923V+IUZzFGgaz1Fymft5nsX
         iuZKQGE+N8e9lrkOIf8k2pW0nnpNKLOvZQqrOSoJ7XpE432cm+cTxvtUp+bbqg/BPIy0
         L81696XZeUQAZtVlneCJe8aXlYYIzOoZeFzpOboDsz21LQcTQrExRya2t4jrxMWF+9zZ
         ZYjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718266772; x=1718871572;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N8LlFuRQgnRz0O9t1OBsogqAF1aAI8bFLWduLEN2M4c=;
        b=GhcE5LEgicuJxCNwkrnSmGKVkHZ0I0ggCRYCI3+B+e1IDq/JdQe7TQ2fOeL79sl6wG
         b4VLRqdmLH8ySYw+Pu6xtAkXY/rnTFF2s13QIQts3voUF17CfLPGqjjIq2vdm2zmrxne
         wZT3qfyIJRwsKPRQUhq/byongYnUsPXBwD9b5+98srBsyzLntJU1OCPMOSRzkeXH8cGK
         BGK7q82FBY14je9UlU++llr6Oi8lR4UyKSr/qCFRTK43sXLStwRlDEMgfowVN0ndMOlC
         Sd3Z57cWJdekWfpK2NtIlfQjMPIordjX0vqLRDWjP5jXDXD6wz7K4iXbYpbwqqhu+LAm
         Ag+Q==
X-Gm-Message-State: AOJu0YzkBbeenn+BtshTCH3DJMRwVBVnaGKsBr25c2cR6hRPGMQQIGZk
	U4fz9VkSbzhQzrwQFRFquyOwIslEBWLh+CYlf+OvOSj9mwcE7DAB02MpPY4N8PulS351SFKUn2g
	=
X-Google-Smtp-Source: AGHT+IERydvPM3D/32D++x4lvjvmilGv2w915HTQhdNwSpmX0Ga4CU/rKGOL5SRt7VND7dMAerfgxg==
X-Received: by 2002:a17:907:9407:b0:a6f:535e:77f1 with SMTP id a640c23a62f3a-a6f535e79d3mr167427166b.56.1718266771791;
        Thu, 13 Jun 2024 01:19:31 -0700 (PDT)
Message-ID: <82277592-ea96-47c8-a991-7afd97d7a7bc@suse.com>
Date: Thu, 13 Jun 2024 10:19:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH for 4.19?] x86/Intel: unlock CPUID earlier for the BSP
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

Intel CPUs have a MSR bit to limit CPUID enumeration to leaf two. If
this bit is set by the BIOS then CPUID evaluation does not work when
data from any leaf greater than two is needed; early_cpu_init() in
particular wants to collect leaf 7 data.

Cure this by unlocking CPUID right before evaluating anything which
depends on the maximum CPUID leaf being greater than two.

Inspired by (and description cloned from) Linux commit 0c2f6d04619e
("x86/topology/intel: Unlock CPUID before evaluating anything").

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
While I couldn't spot anything, it kind of feels as if I'm overlooking
further places where we might be inspecting in particular leaf 7 yet
earlier.

No Fixes: tag(s), as imo it would be too many that would want
enumerating.

--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -336,7 +336,8 @@ void __init early_cpu_init(bool verbose)
 
 	c->x86_vendor = x86_cpuid_lookup_vendor(ebx, ecx, edx);
 	switch (c->x86_vendor) {
-	case X86_VENDOR_INTEL:    actual_cpu = intel_cpu_dev;    break;
+	case X86_VENDOR_INTEL:    intel_unlock_cpuid_leaves(c);
+				  actual_cpu = intel_cpu_dev;    break;
 	case X86_VENDOR_AMD:      actual_cpu = amd_cpu_dev;      break;
 	case X86_VENDOR_CENTAUR:  actual_cpu = centaur_cpu_dev;  break;
 	case X86_VENDOR_SHANGHAI: actual_cpu = shanghai_cpu_dev; break;
--- a/xen/arch/x86/cpu/cpu.h
+++ b/xen/arch/x86/cpu/cpu.h
@@ -24,3 +24,5 @@ void amd_init_lfence(struct cpuinfo_x86
 void amd_init_ssbd(const struct cpuinfo_x86 *c);
 void amd_init_spectral_chicken(void);
 void detect_zen2_null_seg_behaviour(void);
+
+void intel_unlock_cpuid_leaves(struct cpuinfo_x86 *c);
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -303,10 +303,24 @@ static void __init noinline intel_init_l
 		ctxt_switch_masking = intel_ctxt_switch_masking;
 }
 
-static void cf_check early_init_intel(struct cpuinfo_x86 *c)
+/* Unmask CPUID levels if masked. */
+void intel_unlock_cpuid_leaves(struct cpuinfo_x86 *c)
 {
-	u64 misc_enable, disable;
+	uint64_t misc_enable, disable;
+
+	rdmsrl(MSR_IA32_MISC_ENABLE, misc_enable);
+
+	disable = misc_enable & MSR_IA32_MISC_ENABLE_LIMIT_CPUID;
+	if (disable) {
+		wrmsrl(MSR_IA32_MISC_ENABLE, misc_enable & ~disable);
+		bootsym(trampoline_misc_enable_off) |= disable;
+		c->cpuid_level = cpuid_eax(0);
+		printk(KERN_INFO "revised cpuid level: %u\n", c->cpuid_level);
+	}
+}
 
+static void cf_check early_init_intel(struct cpuinfo_x86 *c)
+{
 	/* Netburst reports 64 bytes clflush size, but does IO in 128 bytes */
 	if (c->x86 == 15 && c->x86_cache_alignment == 64)
 		c->x86_cache_alignment = 128;
@@ -315,16 +329,7 @@ static void cf_check early_init_intel(st
 	    bootsym(trampoline_misc_enable_off) & MSR_IA32_MISC_ENABLE_XD_DISABLE)
 		printk(KERN_INFO "re-enabled NX (Execute Disable) protection\n");
 
-	/* Unmask CPUID levels and NX if masked: */
-	rdmsrl(MSR_IA32_MISC_ENABLE, misc_enable);
-
-	disable = misc_enable & MSR_IA32_MISC_ENABLE_LIMIT_CPUID;
-	if (disable) {
-		wrmsrl(MSR_IA32_MISC_ENABLE, misc_enable & ~disable);
-		bootsym(trampoline_misc_enable_off) |= disable;
-		printk(KERN_INFO "revised cpuid level: %d\n",
-		       cpuid_eax(0));
-	}
+	intel_unlock_cpuid_leaves(c);
 
 	/* CPUID workaround for Intel 0F33/0F34 CPU */
 	if (boot_cpu_data.x86 == 0xF && boot_cpu_data.x86_model == 3 &&

