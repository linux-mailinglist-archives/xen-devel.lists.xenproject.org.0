Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A75E2AF1528
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 14:16:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031000.1404671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWwNI-0008I9-T7; Wed, 02 Jul 2025 12:15:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031000.1404671; Wed, 02 Jul 2025 12:15:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWwNI-0008Fv-Q9; Wed, 02 Jul 2025 12:15:40 +0000
Received: by outflank-mailman (input) for mailman id 1031000;
 Wed, 02 Jul 2025 12:15:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FQsZ=ZP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWwNG-0008Fp-RK
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 12:15:38 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4343259f-573e-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 14:15:37 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a4e742dc97so4916687f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 05:15:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb39bb7dsm129018995ad.90.2025.07.02.05.15.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 05:15:36 -0700 (PDT)
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
X-Inumbo-ID: 4343259f-573e-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751458537; x=1752063337; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xpn+GdDf2K4bj6rIROuU+aZcZQNprzBWNDxRLEP7f28=;
        b=Gpu1UEZXlhjYMb+w3oawZeaqW2nqeRcCtQDTlT6CjeZqOOjpMuxL9NMyVuDMBGGL7p
         cXoBC9EHhkcskElfEf9psHmjCdY1GkFx5K42apQFYx7McQfR8Ann9sKDHeQGhcnDRSqU
         Rr1k2GG5vAyKcm9sqPw70uFdAVsWNz1B+UxtVlZZgYggqxTyiW3WW+/Jj3i5jzwIIBWU
         kjPqWf63hCM9hHpQ2NlZtoThYIY39hUKNBqaqApwBtkDDMQUA41Kzsl1c7oPkbR5/vXD
         PP10Nv30NtraT+ard48ozuRPCjd+8iqKskfJ1/+C6shoWA4LsaU5C96YHYah9WJvPvHb
         hvoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751458537; x=1752063337;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xpn+GdDf2K4bj6rIROuU+aZcZQNprzBWNDxRLEP7f28=;
        b=KZuaYWhSMRRQZ19/v3XsPa9Qwq8VA+dY675HNzM/8kWJCrwr5GjPMz0757qKxps+Sy
         DTqxndy3tdLOTOvpt4EvxVBiEDCRdkc8Si3cOhA7bUcMXc1R+b6EfX+8eqsAdO5On59s
         KspGoVZxE93NOApZGSWSXs8ShlJgwypDBatxWzkVM/LcXQdQOIbrF72zcFu/mDDenXEu
         Au6z7ivUrycc5bpCSaRofWEn99lE1uu1S6bgvb7xskzcAILPu0pdFB4lEqiDK+N+YEcO
         GSMUKaQ/iNfiHdAW77jKwzqOHfgtvAXkMD70apsBeZgdUq/baXzxg8JPfONII3vOcM5c
         S1EQ==
X-Gm-Message-State: AOJu0YygvzRGg3WFwUsej5g3nisFMbEaANGMqEonbWcBSOdp9DZ5Kqd+
	CeVONAKz5kNI40SxnJh8eErthDLyzEhazAWhm5/pv5WKINZAnFXpZpSXPh0MvyechJ6o4tM+WMh
	P/XI=
X-Gm-Gg: ASbGnctp6MWMvtpqPEXiDofIView197cgcdKNWk+EqSf87kXytEICvJzDgsAfdrD8h8
	d3nlJ/b/KGxQD0X4o8AAu5z0jm6eO1Oa7dmrqzSh6KeE7mOJRHaz0CVyQ9vFbDB70qxJ22hluRd
	+3lGBq9blo3c1OAtCWHAbB4ykQ/puw06fpu4m62M+YMkzIIR77T8YBwcRHUXYZ12QD87JLFkaH9
	APn7mLxNTbXTdII0IXG9btvs4QSaPX61bRfKe/gNrXR0oh8F52dlYhAyO2z6Z208NYvUu1NSmZJ
	EOBKhQ4S4EEyF980PjjHixhibUJsBG4i565LHo8tWc/ufNaG++7YVCwQisPgYJxCflta7yWDaNm
	9Knr4ScEtrZ8AqZ1Z5bXPGhboIxPWm0upkR2izz2DSYQgLg4=
X-Google-Smtp-Source: AGHT+IGBfQRE5Qh4HUKgB9D1SjowhCPEFI2kOXdBpuXWIuAwOxvDaV9t5sfoxhZ/SxW45YDAWWN+fw==
X-Received: by 2002:a05:6000:481b:b0:3a4:f607:a5ad with SMTP id ffacd0b85a97d-3b1f7ff7a30mr1662570f8f.19.1751458537111;
        Wed, 02 Jul 2025 05:15:37 -0700 (PDT)
Message-ID: <ebe250c1-d2bd-4b4e-8f2b-484c6cc08a22@suse.com>
Date: Wed, 2 Jul 2025 14:15:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v7 1/7] x86: suppress ERMS for internal use when
 MISC_ENABLE.FAST_STRING is clear
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <0b57c6f0-9fd0-4f8a-93f8-dc494a1e952c@suse.com>
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
In-Reply-To: <0b57c6f0-9fd0-4f8a-93f8-dc494a1e952c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Before we start actually adjusting behavior when ERMS is available,
follow Linux commit 161ec53c702c ("x86, mem, intel: Initialize Enhanced
REP MOVSB/STOSB") and zap the CPUID-derived feature flag when the MSR
bit is clear.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
TBD: While with the use of host_cpu_policy "cpuid=no-erms" now
     propagates to guest view, we've now lost the earlier "Don't extend
     the artificial clearing to guest view, though: Guests can take
     their own decision in this regard, as they can read (most of)
     MISC_ENABLE.".
---
v7: Use host_cpu_policy in guest_common_default_feature_adjustments().
    Change commentary.
v5: Correct guest_common_max_feature_adjustments() addition.
v4: Also adjust guest_common_max_feature_adjustments().
v3: New.

--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -366,8 +366,18 @@ static void cf_check early_init_intel(st
 		paddr_bits = 36;
 
 	if (c == &boot_cpu_data) {
+		uint64_t misc_enable;
+
 		check_memory_type_self_snoop_errata();
 
+		/*
+		 * If fast string is not enabled in IA32_MISC_ENABLE for any reason,
+		 * clear the enhanced fast string CPU capability.
+		 */
+		rdmsrl(MSR_IA32_MISC_ENABLE, misc_enable);
+		if (!(misc_enable & MSR_IA32_MISC_ENABLE_FAST_STRING))
+			setup_clear_cpu_cap(X86_FEATURE_ERMS);
+
 		intel_init_levelling();
 	}
 
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -487,6 +487,12 @@ static void __init guest_common_max_feat
      */
     if ( test_bit(X86_FEATURE_RTM, fs) )
         __set_bit(X86_FEATURE_RTM_ALWAYS_ABORT, fs);
+
+    /*
+     * ERMS is a performance hint.  A VM which previously saw ERMS will
+     * function correctly when migrated here, even if ERMS isn't available.
+     */
+    __set_bit(X86_FEATURE_ERMS, fs);
 }
 
 static void __init guest_common_default_feature_adjustments(uint32_t *fs)
@@ -562,6 +568,13 @@ static void __init guest_common_default_
         __clear_bit(X86_FEATURE_RTM, fs);
         __set_bit(X86_FEATURE_RTM_ALWAYS_ABORT, fs);
     }
+
+    /*
+     * ERMS is a performance hint, so is set unconditionally in the max
+     * policy.  However, guests should default to the host setting.
+     */
+    if ( !host_cpu_policy.feat.erms )
+        __clear_bit(X86_FEATURE_ERMS, fs);
 }
 
 static void __init guest_common_feature_adjustments(uint32_t *fs)
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -493,6 +493,7 @@
 #define MSR_IA32_THERM_INTERRUPT	0x0000019b
 #define MSR_IA32_THERM_STATUS		0x0000019c
 #define MSR_IA32_MISC_ENABLE		0x000001a0
+#define MSR_IA32_MISC_ENABLE_FAST_STRING  (1<<0)
 #define MSR_IA32_MISC_ENABLE_PERF_AVAIL   (1<<7)
 #define MSR_IA32_MISC_ENABLE_BTS_UNAVAIL  (1<<11)
 #define MSR_IA32_MISC_ENABLE_PEBS_UNAVAIL (1<<12)


