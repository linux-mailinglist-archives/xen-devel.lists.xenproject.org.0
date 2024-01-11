Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AF582B19F
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 16:21:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666370.1036966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNwrs-00049W-HX; Thu, 11 Jan 2024 15:21:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666370.1036966; Thu, 11 Jan 2024 15:21:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNwrs-00047i-EC; Thu, 11 Jan 2024 15:21:16 +0000
Received: by outflank-mailman (input) for mailman id 666370;
 Thu, 11 Jan 2024 15:21:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFj+=IV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNwrr-00045k-Gf
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 15:21:15 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e502da4-b095-11ee-9b0f-b553b5be7939;
 Thu, 11 Jan 2024 16:21:13 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40e6275e9beso1903275e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2024 07:21:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fk10-20020a05600c0cca00b0040e5a0ebabesm4245126wmb.21.2024.01.11.07.21.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jan 2024 07:21:12 -0800 (PST)
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
X-Inumbo-ID: 0e502da4-b095-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704986473; x=1705591273; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8sR9iUBPyjz56T+rdvEviN3viyV4gNB0vCMZ4vWiszw=;
        b=Mg52yzYZdAj3I6B7CunlDCHvVAUVCfnP2kiw9O0cBp4b3XHya2W9dwBhweXn5IctN+
         ktyAbbF2rnGYrWcmxyD45ynFQ9o3YjpomnIyEMXsh0mQK9qNWaYjRPn+3FQeBSZrg8L6
         5yjap0XBLrZFGDqdwHhClfiWy7LubTUhvegRnzDUnNRWSaUxTrLgyw1+9YDZlTUzeicY
         NbIS9N8q7HuoAP6qeP+NTzS5JM7rVQzHZGDAGeYpIdypx93UyBAQZl3Ojm/f7NvTZ3NP
         NExY+3uaQsFphZPkK9D0cSE3W2ytON4J03MyTw9fotYq57p9M5TQCMDRfmXBUS1mHBik
         8fEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704986473; x=1705591273;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8sR9iUBPyjz56T+rdvEviN3viyV4gNB0vCMZ4vWiszw=;
        b=UGix0E4MB4V0z6SnyOBhRQByoLW4v0mXMs/rP+lqcWZ6PKI2LXZKi+0uj2iVWIfqVV
         CmUqlOLzEpqwGcdl1N6mNLYC/Fo4Tjj+a1UAKhRiXhtoY21QXPdGNqYMISRICEskBQAB
         8exsYeV+HGLCxCkuWGzdV3SCAmuOIdEX8IoAc/dG4EY/piK7Vx+jHEymErgt6SAIJcvV
         PNXiArCf0utvbENuhgerZXemMmSj53cvMf93xvG2u6USTmpYUcMRhabonbfWN3ntfoLw
         0iigWe/fXkGcf4tJ/Zhlk2M2CsJFkGNoy5CmcdUWo6UdErewzWFQ8aC0Hf5tegA7ipl/
         ZpNw==
X-Gm-Message-State: AOJu0Yw7bzVDSwXYaNG0ScQ0rVgJoQ6BkJ7zJh33n48D0EHSlE7Y/HwT
	djAs7nWjt/hOninJlZfGpO4d9AOsCd3urVxJ2+VpqmWLbA==
X-Google-Smtp-Source: AGHT+IEWxG+4nihFy66b0rZ4Uo9HIECs04qLXYWSQxj8Y2dUzgDrE6aK8ZVc8qNWtP/wJS/HLl3hmw==
X-Received: by 2002:a05:600c:384e:b0:40e:5660:c796 with SMTP id s14-20020a05600c384e00b0040e5660c796mr541012wmr.73.1704986472945;
        Thu, 11 Jan 2024 07:21:12 -0800 (PST)
Message-ID: <b44201a5-ff65-4ceb-9e54-04255bff781b@suse.com>
Date: Thu, 11 Jan 2024 16:21:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 6/8] x86emul/test: drop cpu_has_avx512vl
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <298db76f-d0ee-4d47-931f-1baa1a7546cf@suse.com>
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
In-Reply-To: <298db76f-d0ee-4d47-931f-1baa1a7546cf@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

AVX512VL not being a standalone feature anyway, but always needing
to be combined with some other AVX512*, replace uses of
cpu_has_avx512vl by just the feature bit check.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -1031,7 +1031,8 @@ static void test_group(const struct test
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
@@ -132,7 +132,7 @@ static bool simd_check_avx512f(void)
 
 static bool simd_check_avx512f_vl(void)
 {
-    return cpu_has_avx512f && cpu_has_avx512vl;
+    return cpu_has_avx512f && cpu_policy.feat.avx512vl;
 }
 #define simd_check_avx512vl_sg simd_check_avx512f_vl
 
@@ -144,7 +144,7 @@ static bool simd_check_avx512dq(void)
 
 static bool simd_check_avx512dq_vl(void)
 {
-    return cpu_has_avx512dq && cpu_has_avx512vl;
+    return cpu_has_avx512dq && cpu_policy.feat.avx512vl;
 }
 
 static bool simd_check_avx512er(void)
@@ -160,7 +160,7 @@ static bool simd_check_avx512bw(void)
 
 static bool simd_check_avx512bw_vl(void)
 {
-    return cpu_has_avx512bw && cpu_has_avx512vl;
+    return cpu_has_avx512bw && cpu_policy.feat.avx512vl;
 }
 
 static bool simd_check_avx512vbmi(void)
@@ -170,7 +170,7 @@ static bool simd_check_avx512vbmi(void)
 
 static bool simd_check_avx512vbmi_vl(void)
 {
-    return cpu_has_avx512_vbmi && cpu_has_avx512vl;
+    return cpu_has_avx512_vbmi && cpu_policy.feat.avx512vl;
 }
 
 static bool simd_check_avx512vbmi2(void)
@@ -266,7 +266,7 @@ static bool simd_check_avx512fp16(void)
 
 static bool simd_check_avx512fp16_vl(void)
 {
-    return cpu_has_avx512_fp16 && cpu_has_avx512vl;
+    return cpu_has_avx512_fp16 && cpu_policy.feat.avx512vl;
 }
 
 static void simd_set_regs(struct cpu_user_regs *regs)
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -160,7 +160,6 @@ void wrpkru(unsigned int val);
 #define cpu_has_avx512cd  (cpu_policy.feat.avx512cd && xcr0_mask(0xe6))
 #define cpu_has_sha        cpu_policy.feat.sha
 #define cpu_has_avx512bw  (cpu_policy.feat.avx512bw && xcr0_mask(0xe6))
-#define cpu_has_avx512vl  (cpu_policy.feat.avx512vl && xcr0_mask(0xe6))
 #define cpu_has_avx512_vbmi (cpu_policy.feat.avx512_vbmi && xcr0_mask(0xe6))
 #define cpu_has_avx512_vbmi2 (cpu_policy.feat.avx512_vbmi2 && xcr0_mask(0xe6))
 #define cpu_has_gfni       cpu_policy.feat.gfni


