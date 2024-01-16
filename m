Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8A582EAFD
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 09:41:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667663.1039145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPf0Q-0000WB-I2; Tue, 16 Jan 2024 08:41:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667663.1039145; Tue, 16 Jan 2024 08:41:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPf0Q-0000TO-FC; Tue, 16 Jan 2024 08:41:10 +0000
Received: by outflank-mailman (input) for mailman id 667663;
 Tue, 16 Jan 2024 08:41:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MjSB=I2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rPf0P-0000TI-Hv
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 08:41:09 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe349fe3-b44a-11ee-98f1-6d05b1d4d9a1;
 Tue, 16 Jan 2024 09:41:08 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40e7065b7bdso24736935e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jan 2024 00:41:08 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l22-20020a05600c4f1600b0040d6b91efd9sm22293931wmq.44.2024.01.16.00.41.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jan 2024 00:41:07 -0800 (PST)
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
X-Inumbo-ID: fe349fe3-b44a-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705394467; x=1705999267; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IUIR6jhBeaCWm4WLuVInZHdrkJh9OVonMA+8LwOnY14=;
        b=fywtD0L4joAXfGIs0FVQxVCdyqDinW8x8MGrnPj/V5aEu9OAk9vVdATkb4j2ZKl3Or
         mNkXoY0Zj1ecS3PRthvCIxuPyPPmzW0q0LDnlzfpsRueeYkS6+XrIF1GOsFofiQ9lb1S
         6twr/RpIGKwZsS2NRkNiHWpEhLSbyEtnEwr+wL8U1hMzZXLBe+xrkECjWccit3tXxB7D
         ZX8DtYnBug1FxXvPA1xP6WC7Pb1Jt89oITKvy8O0WQriEiUIySkXPEG8Hj7XjSgOyOME
         tZ8vlo+PnwPYsf489Sqrk1uk5vpN9wjSW+xPm+pUQmRH0GiLZxDNuSsdFzM5BnvbXquh
         7B4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705394467; x=1705999267;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IUIR6jhBeaCWm4WLuVInZHdrkJh9OVonMA+8LwOnY14=;
        b=EhNkG4G3pt6ComOaFee73zec6ruLPs0EY/LO0KnByf5Jk98+WsExpCf6Cp9TLh1wJ4
         sFuCD2WoHkJmDyCR2e+e5tL2IyNzwOwHHb4JxtCcwQrK1aYVYGGgDGPU4ArMFq4qzkJj
         F70BwW9iImkuCd7cWrz7+Qb7SopWb36YKRQix7wOPPIEpNQctgEXCzObIRMGnxoacEUP
         KxM0PHgfrxUkSNMWo8P8HQRk466o+r+V2Od7VsYNbKvonUCjHLwYBifDu7QpffadNoAV
         clWejWeNsJNV9UmNthB/X+EHOvF+xnOCmOFQN5epob9ElYkAX2OZ/z+DS/Ivh92AzMb9
         AW8A==
X-Gm-Message-State: AOJu0YwML1WGUb36PNfk9plW1Okdfe1R917yv5jpsylBkP49zMYAWx5o
	f/67coMbiRSaNUHw058GvrYKXgoMLiwj+UcBG+yfGaed3w==
X-Google-Smtp-Source: AGHT+IFaVq5SrdEEPnIWWlpGPantLyRt238Hl6kcFOvKpCOKrBRO6HRWnBT1oYa2GSA2suBh0W5MlQ==
X-Received: by 2002:a05:600c:5101:b0:40e:76b5:1973 with SMTP id o1-20020a05600c510100b0040e76b51973mr1085046wms.48.1705394467714;
        Tue, 16 Jan 2024 00:41:07 -0800 (PST)
Message-ID: <ece45cf6-51c8-413e-9963-21144fe64f2a@suse.com>
Date: Tue, 16 Jan 2024 09:41:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/CPU: convert vendor hook invocations to altcall
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

While not performance critical, these hook invocations still want
converting: This way all pre-filled struct cpu_dev instances can become
__initconst_cf_clobber, thus allowing to eliminate further 8 ENDBR
during the 2nd phase of alternatives patching (besides moving previously
resident data to .init.*).

Since all use sites need touching anyway, take the opportunity and also
address a Misra C:2012 Rule 5.5 violation: Rename the this_cpu static
variable.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
With LTO it might end up necessary to tag as __used more than just
"default_cpu".

--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -1302,7 +1302,7 @@ static void cf_check init_amd(struct cpu
 	amd_log_freq(c);
 }
 
-const struct cpu_dev amd_cpu_dev = {
+const struct cpu_dev __initconst_cf_clobber amd_cpu_dev = {
 	.c_early_init	= early_init_amd,
 	.c_init		= init_amd,
 };
--- a/xen/arch/x86/cpu/centaur.c
+++ b/xen/arch/x86/cpu/centaur.c
@@ -54,6 +54,6 @@ static void cf_check init_centaur(struct
 		init_c3(c);
 }
 
-const struct cpu_dev centaur_cpu_dev = {
+const struct cpu_dev __initconst_cf_clobber centaur_cpu_dev = {
 	.c_init		= init_centaur,
 };
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -113,10 +113,10 @@ static void cf_check default_init(struct
 	__clear_bit(X86_FEATURE_SEP, c->x86_capability);
 }
 
-static const struct cpu_dev default_cpu = {
+static const struct cpu_dev __initconst_cf_clobber default_cpu = {
 	.c_init	= default_init,
 };
-static const struct cpu_dev *this_cpu = &default_cpu;
+static struct cpu_dev __ro_after_init actual_cpu;
 
 static DEFINE_PER_CPU(uint64_t, msr_misc_features);
 void (* __read_mostly ctxt_switch_masking)(const struct vcpu *next);
@@ -336,12 +336,13 @@ void __init early_cpu_init(bool verbose)
 
 	c->x86_vendor = x86_cpuid_lookup_vendor(ebx, ecx, edx);
 	switch (c->x86_vendor) {
-	case X86_VENDOR_INTEL:	  this_cpu = &intel_cpu_dev;    break;
-	case X86_VENDOR_AMD:	  this_cpu = &amd_cpu_dev;      break;
-	case X86_VENDOR_CENTAUR:  this_cpu = &centaur_cpu_dev;  break;
-	case X86_VENDOR_SHANGHAI: this_cpu = &shanghai_cpu_dev; break;
-	case X86_VENDOR_HYGON:    this_cpu = &hygon_cpu_dev;    break;
+	case X86_VENDOR_INTEL:	  actual_cpu = intel_cpu_dev;    break;
+	case X86_VENDOR_AMD:	  actual_cpu = amd_cpu_dev;      break;
+	case X86_VENDOR_CENTAUR:  actual_cpu = centaur_cpu_dev;  break;
+	case X86_VENDOR_SHANGHAI: actual_cpu = shanghai_cpu_dev; break;
+	case X86_VENDOR_HYGON:    actual_cpu = hygon_cpu_dev;    break;
 	default:
+		actual_cpu = default_cpu;
 		if (!verbose)
 			break;
 		printk(XENLOG_ERR
@@ -448,8 +449,8 @@ static void generic_identify(struct cpui
 	if (c->extended_cpuid_level >= 0x80000021)
 		c->x86_capability[FEATURESET_e21a] = cpuid_eax(0x80000021);
 
-	if (this_cpu->c_early_init)
-		this_cpu->c_early_init(c);
+	if (actual_cpu.c_early_init)
+		alternative_vcall(actual_cpu.c_early_init, c);
 
 	/* c_early_init() may have adjusted cpuid levels/features.  Reread. */
 	c->cpuid_level = cpuid_eax(0);
@@ -546,9 +547,8 @@ void identify_cpu(struct cpuinfo_x86 *c)
 	 * At the end of this section, c->x86_capability better
 	 * indicate the features this CPU genuinely supports!
 	 */
-	if (this_cpu->c_init)
-		this_cpu->c_init(c);
-
+	if (actual_cpu.c_init)
+		alternative_vcall(actual_cpu.c_init, c);
 
 	/*
 	 * The vendor-specific functions might have changed features.  Now
--- a/xen/arch/x86/cpu/hygon.c
+++ b/xen/arch/x86/cpu/hygon.c
@@ -87,7 +87,7 @@ static void cf_check init_hygon(struct c
 	amd_log_freq(c);
 }
 
-const struct cpu_dev hygon_cpu_dev = {
+const struct cpu_dev __initconst_cf_clobber hygon_cpu_dev = {
 	.c_early_init	= early_init_amd,
 	.c_init		= init_hygon,
 };
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -577,7 +577,7 @@ static void cf_check init_intel(struct c
 		setup_clear_cpu_cap(X86_FEATURE_CLWB);
 }
 
-const struct cpu_dev intel_cpu_dev = {
+const struct cpu_dev __initconst_cf_clobber intel_cpu_dev = {
 	.c_early_init	= early_init_intel,
 	.c_init		= init_intel,
 };
--- a/xen/arch/x86/cpu/shanghai.c
+++ b/xen/arch/x86/cpu/shanghai.c
@@ -15,6 +15,6 @@ static void cf_check init_shanghai(struc
     init_intel_cacheinfo(c);
 }
 
-const struct cpu_dev shanghai_cpu_dev = {
+const struct cpu_dev __initconst_cf_clobber shanghai_cpu_dev = {
     .c_init     = init_shanghai,
 };

