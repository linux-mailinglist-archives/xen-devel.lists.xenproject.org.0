Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F019ECA34
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 11:21:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854369.1267599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLJqA-0001lQ-Sk; Wed, 11 Dec 2024 10:21:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854369.1267599; Wed, 11 Dec 2024 10:21:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLJqA-0001jj-Pm; Wed, 11 Dec 2024 10:21:10 +0000
Received: by outflank-mailman (input) for mailman id 854369;
 Wed, 11 Dec 2024 10:21:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2HaM=TE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tLJi8-0003z3-H0
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 10:12:52 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 778aacfc-b7a8-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 11:12:46 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-385ed7f6605so2929507f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 02:12:50 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-216281f45a2sm73565155ad.250.2024.12.11.02.12.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 02:12:49 -0800 (PST)
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
X-Inumbo-ID: 778aacfc-b7a8-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733911970; x=1734516770; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PydLQvHGoQVq8w5xg8EGioPd9dUoTx6VVtqXrfukRCE=;
        b=B0KGl3zOeF6/BNdIQe/oizfe0wxJdGCTAHmbGhW1zjZv1tJs5h/nClSnqzfykpSNi1
         bI63XkqmEGmAj6ijAcEQXha06dHnJKTEvKgHX3fBtzy8GVOIwS/BIgUlblsOL9tU/LFm
         c2ghapV6ov70RdmLZsjzcpDf3PCHwjpXGicuC5h0YSwOnmRZdm9zWQcwbH99Az1muJX6
         h015GBFDnTgRkqvb4J95wIysPb2yfKsLrDFVEby8RzCmIQEVwlQa0xUkKPfAdEgDJoyZ
         KJVEVK+H2KAGG0djWajpT3cFk227TTPVIe0e7UmgV0C4AvudnF/qvMinXRnMfCG3bpZs
         wJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733911970; x=1734516770;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PydLQvHGoQVq8w5xg8EGioPd9dUoTx6VVtqXrfukRCE=;
        b=vy90BgtRV2GcxVxWn2DViZeZBjDeXva0s3so297HZZG7EnvP6uLCkAarv0CwLL5yqW
         CDHP0i1r9Nxlj/rSycn+0uD82xX8JCu6jl/9sJV/rAh3/Lhb7h1LkhAeD67SZ9lGVZic
         Z+X/TKsvM8BBLSVp1S61K2hM8k+xGbgNhQRUQr7HQBnmCpEFxqDpv63/GfnThd8/pGyg
         74nCzp7xFIRA9jHLImlHjfEtW/wAyTs6+P7TkdvM8+1wf3A7K7PT+Lbr0pjUyvBaPIao
         Za/+rUgnm/vV721qq84Inj9jUkpFmuHNFnJMBXTOqqsmYPVTRtjlHFDscKSc41ws+7k0
         iK/w==
X-Gm-Message-State: AOJu0Yx+JpKoj3bdKn/+YbyNqc9N5HkQhtjCco83AuMBFeiXvq4Tq7lh
	RVpMap8bp6kawbLfJ1D8OkW8SCCYFu4nmR8J/J23TLB/M9IHiutQri6Rk0/iarTWzuYMhKxR4hY
	=
X-Gm-Gg: ASbGnctVAmmj5m+osKKRC8r+/xMSbhUuiV5w5kcAd7KTmOXZEyrASDJ3W6y0GjGf3qs
	syvTcAiK2/D7owmFLBt9XsKTF60zzKIhGKS9cP1O/YcQhSzVM5AkldRhvSDaq6XSw6YRUPO7UIH
	sReldD3DjcALFzy4Cbn9cd36pSwV7Mc0bWZgEhER8RNWGCrBADbvDRJc3mLYnw5sewMYJUoeEaX
	cyZk9s6ttxW4DZEqITlAN/RUUv+MONB0P0xe8CZm0AavXMcMa6hb/Ub1bCqq3T3giTdPQ5OvbDX
	yT2mpI46ZAcojsV8Vr/9DYhC1DI771nBWuLbJ+E=
X-Google-Smtp-Source: AGHT+IEro+kMo0mF+/+xCqXl0B2cpDKIo4tuw+YhiyKniL4zHBG5DCm6pWtj55giIqFS3fR3cndu5Q==
X-Received: by 2002:a5d:6dab:0:b0:385:f909:eb28 with SMTP id ffacd0b85a97d-3864ce985a5mr1647222f8f.45.1733911970348;
        Wed, 11 Dec 2024 02:12:50 -0800 (PST)
Message-ID: <35109b64-87bb-435a-b3e9-2c5b378532e9@suse.com>
Date: Wed, 11 Dec 2024 11:12:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 04/16] x86emul/test: drop cpu_has_avx512vl
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <516b7f9a-048e-409d-8a4e-89aeb8ffacc4@suse.com>
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
In-Reply-To: <516b7f9a-048e-409d-8a4e-89aeb8ffacc4@suse.com>
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
@@ -998,7 +998,8 @@ static void test_group(const struct test
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
@@ -173,8 +173,6 @@ void wrpkru(unsigned int val);
 #define cpu_has_sha                  cpu_policy.feat.sha
 #define cpu_has_avx512bw            (cpu_policy.feat.avx512bw && \
                                      xcr0_mask(0xe6))
-#define cpu_has_avx512vl            (cpu_policy.feat.avx512vl && \
-                                     xcr0_mask(0xe6))
 #define cpu_has_avx512_vbmi         (cpu_policy.feat.avx512_vbmi && \
                                      xcr0_mask(0xe6))
 #define cpu_has_avx512_vbmi2        (cpu_policy.feat.avx512_vbmi2 && \


