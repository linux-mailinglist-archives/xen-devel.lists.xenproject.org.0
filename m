Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 043D7951731
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 10:58:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776972.1187179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1se9pb-0000TJ-Gf; Wed, 14 Aug 2024 08:58:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776972.1187179; Wed, 14 Aug 2024 08:58:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1se9pb-0000RH-D1; Wed, 14 Aug 2024 08:58:11 +0000
Received: by outflank-mailman (input) for mailman id 776972;
 Wed, 14 Aug 2024 08:58:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NhoJ=PN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1se9kt-0003yE-OB
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 08:53:19 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a684e2b0-5a1a-11ef-8776-851b0ebba9a2;
 Wed, 14 Aug 2024 10:53:18 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a7a8553db90so756743566b.2
 for <xen-devel@lists.xenproject.org>; Wed, 14 Aug 2024 01:53:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80f3f4981dsm149376566b.18.2024.08.14.01.53.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Aug 2024 01:53:16 -0700 (PDT)
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
X-Inumbo-ID: a684e2b0-5a1a-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723625598; x=1724230398; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=D2/zh/bchaIimR3ZyxsWSS2VxTLjlJtCdjnQQPFRqsU=;
        b=H8sp6iE16iq4oO+XVI9PfmMfNjOTT5eluwBGWOsHUtS09QxEWQhuTPFWqp9+kkkop+
         whTTInR+T6T6C6r2QliK7KqQHy34eopKF2gLt8dCVLfaeBvO49JRwqQvonn0fIR8Po3r
         woOHYCQZqcWUYHrkNxkrfF5+UqjHH8LNvX9U8O0zkvUTGBiPwVLdIIMYkERAA4XJeerX
         +6L6D4GiGtb46ezUvQXLK4eGmVtN7h4PWCNW9CT5xVasNgwn4AMoX8FeRwVi0OHitWlZ
         xSBbShN/IFVonFbo4L5v6v5EpK47PVmddymCUHxGTQYRXjzxbNEfSWko6xSZwbKIUujP
         UVcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723625598; x=1724230398;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D2/zh/bchaIimR3ZyxsWSS2VxTLjlJtCdjnQQPFRqsU=;
        b=RHjYUcVFwmixC9smjJR/5HB4jqzWCSGTY6BgYg+7n3Ked7fa2Zy49b5jnQeXyd05LT
         q5M5SnDuPqRroAzGPencay22hPH4FoRhfbEYbQGh+0VzUXE0njVDcCDC5AopipzVqNvc
         kgovv28E53JsK9i4t/hFhiQBkU6+HJ2BJ41XWaPW+TNjfH2KP12ZVjsGAORVCEkngp0S
         x0V5KybXS4G2QYe9F7+I7wuJInPaZZmcsmZg87xh0lc/b3zvWJhzSptOTaw+UZPBEhh/
         wI0/Jzs0KOe8LvLg/fIk/6R29fKLtJulVsRgmJLZTgvNLblMVdMDrkp3mp2r8XXMohza
         xkMQ==
X-Gm-Message-State: AOJu0YxzTwpkU7cbld4Wj3Vm/t7WCZyM7y3TVOnRjyYYQ5u6YM47Jhnt
	2RLr6b32tnGrmiIF6yRv6l4TlC/gC5jWVE+N5deWrMITz6Bi2GzzrR2NLlar6is5pfwWTC9pvKY
	=
X-Google-Smtp-Source: AGHT+IFgKj7V+kkgDhundAx9tQO+8VFSUIZ1P2ZCmJTPRhypVFYeDCV/UpjyI6VC3XW0M+lR87vQgg==
X-Received: by 2002:a17:907:e20f:b0:a7a:9144:e256 with SMTP id a640c23a62f3a-a8366c388bamr133984966b.6.1723625597464;
        Wed, 14 Aug 2024 01:53:17 -0700 (PDT)
Message-ID: <4480c5c4-9b97-4fee-b086-22fc1006b7ac@suse.com>
Date: Wed, 14 Aug 2024 10:53:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 6/9] x86emul/test: drop cpu_has_avx512vl
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <bcfea345-57c1-43d9-82b3-240b685486cc@suse.com>
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
In-Reply-To: <bcfea345-57c1-43d9-82b3-240b685486cc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

AVX512VL not being a standalone feature anyway, but always needing
to be combined with some other AVX512*, replace uses of
cpu_has_avx512vl by just the feature bit check.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Re-base over dropping of Xeon Phi support.

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -1000,7 +1000,8 @@ static void test_group(const struct test
     {
         for ( j = 0; j < nr_vl; ++j )
         {
-            if ( vl[0] == VL_512 && vl[j] != VL_512 && !cpu_has_avx512vl )
+            if ( vl[0] == VL_512 && vl[j] != VL_512 &&
+                 !cpu_policy.feat.avx512vl )
                 continue;
 
             switch ( tests[i].esz )
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -131,7 +131,7 @@ static bool simd_check_avx512f(void)
 
 static bool simd_check_avx512f_vl(void)
 {
-    return cpu_has_avx512f && cpu_has_avx512vl;
+    return cpu_has_avx512f && cpu_policy.feat.avx512vl;
 }
 #define simd_check_avx512vl_sg simd_check_avx512f_vl
 
@@ -143,7 +143,7 @@ static bool simd_check_avx512dq(void)
 
 static bool simd_check_avx512dq_vl(void)
 {
-    return cpu_has_avx512dq && cpu_has_avx512vl;
+    return cpu_has_avx512dq && cpu_policy.feat.avx512vl;
 }
 
 static bool simd_check_avx512bw(void)
@@ -154,7 +154,7 @@ static bool simd_check_avx512bw(void)
 
 static bool simd_check_avx512bw_vl(void)
 {
-    return cpu_has_avx512bw && cpu_has_avx512vl;
+    return cpu_has_avx512bw && cpu_policy.feat.avx512vl;
 }
 
 static bool simd_check_avx512vbmi(void)
@@ -164,7 +164,7 @@ static bool simd_check_avx512vbmi(void)
 
 static bool simd_check_avx512vbmi_vl(void)
 {
-    return cpu_has_avx512_vbmi && cpu_has_avx512vl;
+    return cpu_has_avx512_vbmi && cpu_policy.feat.avx512vl;
 }
 
 static bool simd_check_avx512vbmi2(void)
@@ -260,7 +260,7 @@ static bool simd_check_avx512fp16(void)
 
 static bool simd_check_avx512fp16_vl(void)
 {
-    return cpu_has_avx512_fp16 && cpu_has_avx512vl;
+    return cpu_has_avx512_fp16 && cpu_policy.feat.avx512vl;
 }
 
 static void simd_set_regs(struct cpu_user_regs *regs)
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -159,7 +159,6 @@ void wrpkru(unsigned int val);
 #define cpu_has_avx512cd  (cpu_policy.feat.avx512cd && xcr0_mask(0xe6))
 #define cpu_has_sha        cpu_policy.feat.sha
 #define cpu_has_avx512bw  (cpu_policy.feat.avx512bw && xcr0_mask(0xe6))
-#define cpu_has_avx512vl  (cpu_policy.feat.avx512vl && xcr0_mask(0xe6))
 #define cpu_has_avx512_vbmi (cpu_policy.feat.avx512_vbmi && xcr0_mask(0xe6))
 #define cpu_has_avx512_vbmi2 (cpu_policy.feat.avx512_vbmi2 && xcr0_mask(0xe6))
 #define cpu_has_gfni       cpu_policy.feat.gfni


