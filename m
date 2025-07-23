Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1960B0F217
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 14:21:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053919.1422698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueYSr-0005UX-5y; Wed, 23 Jul 2025 12:20:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053919.1422698; Wed, 23 Jul 2025 12:20:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueYSr-0005Sz-39; Wed, 23 Jul 2025 12:20:53 +0000
Received: by outflank-mailman (input) for mailman id 1053919;
 Wed, 23 Jul 2025 12:20:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFh9=2E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ueYSp-0005St-4c
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 12:20:51 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 781d50c9-67bf-11f0-a31d-13f23c93f187;
 Wed, 23 Jul 2025 14:20:50 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a522224582so3277029f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jul 2025 05:20:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31e519ce390sm1592459a91.4.2025.07.23.05.20.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 05:20:49 -0700 (PDT)
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
X-Inumbo-ID: 781d50c9-67bf-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753273249; x=1753878049; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CNXEeGmhVHqaqiKvR38NuAL13BAB2MsF+k5sBNedfJI=;
        b=RTPHrvI7YTh7c0+Co4jh3k+4IHXl+twL4X8STdgtvRrE/HoUPmKZSYXK2ThW13Kqtg
         x5WterZmIpQotnVhQj1U/+gRc4z1F8QGJJhl2DA5h5XyQhZmItbwI3+30EA1E0wLJ8U5
         iiVYxyAMUNgqhMFrCgNVAWq6WnVtQ3Hc8jq/OH0iezD3miFcSpuhELQh4k2tmmxZzHwa
         sEnXzzOwXRnwq85bwkWN3/B6uyX0UBxvfj+YONX0v1I8Q/4vQZrkGcFcDjsYONgHEroM
         DrdaDi1osewEVjFS1AnBJIVQWZKLUEYn+D0JYTalXe+pxBTTbFccdZ6S1NT/SeYG6M1s
         nNUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753273249; x=1753878049;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CNXEeGmhVHqaqiKvR38NuAL13BAB2MsF+k5sBNedfJI=;
        b=MSkvu3ddNMSPp83resQDRxfIRfrpbYGdDIstdWsFEOu31eCnlMV+cvzNMhKRfLKb55
         DDrPU6vQ++MPDAHjJeDDmQBJHHKrKbuOhbg3e4llHtARbouF9y2waSSTldUtkVP0qi9G
         tI4w4Wd+kihrLbWe/OpTw/sg3jGBcr4C2rPwfwd5psYJ7UfkdMoT/TauoufnWZ5p+U44
         SVU4gS4b77jqRxtlp2V0wDaSykFDYr7+kP6xjxMJ9dQ0q/s/W+KsSpnGp7XSNUl9EBsL
         5TLM3/tohsOZl27TF3fOFpJ3lnhYkWyBN161xgOx3nclj106BEEpIGgC9oTbJt9/iDcC
         Jhnw==
X-Gm-Message-State: AOJu0YzSqcFTGB8yJPos8DxReiJQmhhko3PCUKPgnk5PBhxQhNrwSq1F
	K8ABFCo7IaH9gCYu+ZcuI06HaymXE4f0S6njsXz8pmngUEImteZV0M1hjBqwEp1cqa8wnYGUN5H
	xqB8=
X-Gm-Gg: ASbGnctAbFGBw4xePI0Zku/+oH1wrFxa+OehRmAc6AZDuifginaKn04T9z6j/Pvi9CQ
	TQtiTrZEPhc917+OenwR0QS0wGvJfVlP3Tovi6ycmacFOSjct6jIMTljyx7M1628c848/P2ETcI
	NLN7+8pe4HVYhkXaYlCS3c/laIkR8IFgU67VfERpoWssj2iW4huvWGUG9cd288E14GYRy26Bkjj
	rnoxX2bMBgMd+9gLip9vTv3An3CVWbx0otLBjatRu/0zjgZJD5WBBQHf9JT5QfC/q16ZnspwKB9
	ywVSEQp4DGb9vbSfP7vZZ/LshdsMlPDo4AsxQKRNM64TyKLQdUcFOnoa90ZfgTdoHcl+kumM0Dd
	DEhAQBi+pNSjIJIYauGsKLEYYLQPVsKTIQ5DW89CeS/GcBSCXLvd0ycmsC/MYHt5ZB+SpZslJjB
	jjRUKB6zc=
X-Google-Smtp-Source: AGHT+IFn3fkk5IXzp0SmTpL2o7GiOE1yeoKF/lHDmoDXSxjvJ/+6Vwlnbzsm8QWEHApyfDC9dXoXQA==
X-Received: by 2002:a05:6000:2209:b0:3a5:2182:bd17 with SMTP id ffacd0b85a97d-3b768caa43emr2394377f8f.19.1753273249512;
        Wed, 23 Jul 2025 05:20:49 -0700 (PDT)
Message-ID: <1e0a8808-4594-4574-819b-1a75d104294d@suse.com>
Date: Wed, 23 Jul 2025 14:20:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/MCE: adjust S3 resume handling
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

The BSP resume path calls mcheck_init() with the address of
boot_cpu_data, thus rendering comparisons against that pointer
ineffective. The additional "bsp" boolean needs to be used (and
propagated as necessary) instead.

While touching intel_init_thermal(), constify its 1st parameter, which
in turn requires touching intel_thermal_supported() as well.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
While I'm pretty sure about the change for the first of the printk()s in
intel_init_thermal(), the 2nd one there is less clear. IOW there could
be an argument for keeping the conditional as is there.

--- a/xen/arch/x86/cpu/mcheck/mce_amd.c
+++ b/xen/arch/x86/cpu/mcheck/mce_amd.c
@@ -318,7 +318,7 @@ amd_mcheck_init(const struct cpuinfo_x86
         mcequirk_amd_apply(quirkflag);
 
     if ( cpu_has(c, X86_FEATURE_AMD_PPIN) &&
-         (c == &boot_cpu_data || ppin_msr) )
+         (bsp || ppin_msr) )
     {
         uint64_t val;
 
@@ -333,7 +333,7 @@ amd_mcheck_init(const struct cpuinfo_x86
 
         if ( !(val & PPIN_ENABLE) )
             ppin_msr = 0;
-        else if ( c == &boot_cpu_data )
+        else if ( bsp )
             ppin_msr = MSR_AMD_PPIN;
     }
 
--- a/xen/arch/x86/cpu/mcheck/mce_intel.c
+++ b/xen/arch/x86/cpu/mcheck/mce_intel.c
@@ -85,7 +85,7 @@ static void cf_check intel_thermal_inter
 }
 
 /* Thermal monitoring depends on APIC, ACPI and clock modulation */
-static bool intel_thermal_supported(struct cpuinfo_x86 *c)
+static bool intel_thermal_supported(const struct cpuinfo_x86 *c)
 {
     if ( !cpu_has_apic )
         return false;
@@ -108,7 +108,7 @@ static void __init mcheck_intel_therm_in
 }
 
 /* P4/Xeon Thermal regulation detect and init */
-static void intel_init_thermal(struct cpuinfo_x86 *c)
+static void intel_init_thermal(const struct cpuinfo_x86 *c, bool bsp)
 {
     uint64_t msr_content;
     uint32_t val;
@@ -141,7 +141,7 @@ static void intel_init_thermal(struct cp
     if ( (msr_content & (1ULL<<3))
          && (val & APIC_DM_MASK) == APIC_DM_SMI )
     {
-        if ( c == &boot_cpu_data )
+        if ( bsp )
             printk(KERN_DEBUG "Thermal monitoring handled by SMI\n");
         return; /* -EBUSY */
     }
@@ -152,7 +152,7 @@ static void intel_init_thermal(struct cp
     /* check whether a vector already exists, temporarily masked? */
     if ( val & APIC_VECTOR_MASK )
     {
-        if ( c == &boot_cpu_data )
+        if ( bsp )
             printk(KERN_DEBUG "Thermal LVT vector (%#x) already installed\n",
                    val & APIC_VECTOR_MASK);
         return; /* -EBUSY */
@@ -850,7 +850,7 @@ static void intel_init_mce(bool bsp)
     mce_uhandler_num = ARRAY_SIZE(intel_mce_uhandlers);
 }
 
-static void intel_init_ppin(const struct cpuinfo_x86 *c)
+static void intel_init_ppin(const struct cpuinfo_x86 *c, bool bsp)
 {
     /*
      * Even if testing the presence of the MSR would be enough, we don't
@@ -878,7 +878,7 @@ static void intel_init_ppin(const struct
     case 0x6c: /* Icelake D */
     case 0x8f: /* Sapphire Rapids X */
 
-        if ( (c != &boot_cpu_data && !ppin_msr) ||
+        if ( (!bsp && !ppin_msr) ||
              rdmsr_safe(MSR_PPIN_CTL, val) )
             return;
 
@@ -891,7 +891,7 @@ static void intel_init_ppin(const struct
 
         if ( !(val & PPIN_ENABLE) )
             ppin_msr = 0;
-        else if ( c == &boot_cpu_data )
+        else if ( bsp )
             ppin_msr = MSR_PPIN;
 
         break;
@@ -992,9 +992,9 @@ enum mcheck_type intel_mcheck_init(struc
 
     intel_init_cmci(c);
 
-    intel_init_thermal(c);
+    intel_init_thermal(c, bsp);
 
-    intel_init_ppin(c);
+    intel_init_ppin(c, bsp);
 
     return mcheck_intel;
 }

