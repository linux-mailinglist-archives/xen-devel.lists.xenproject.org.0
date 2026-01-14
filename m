Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7534D1F243
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 14:45:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1203126.1518422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg1Bp-0003aE-64; Wed, 14 Jan 2026 13:45:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1203126.1518422; Wed, 14 Jan 2026 13:45:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg1Bp-0003YE-3O; Wed, 14 Jan 2026 13:45:37 +0000
Received: by outflank-mailman (input) for mailman id 1203126;
 Wed, 14 Jan 2026 13:45:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81wl=7T=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vg1Bn-0003Y4-TB
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 13:45:35 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c6afde3-f14f-11f0-9ccf-f158ae23cfc8;
 Wed, 14 Jan 2026 14:45:33 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-47ee4539adfso7440755e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jan 2026 05:45:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47ee2814548sm20222905e9.9.2026.01.14.05.45.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 05:45:32 -0800 (PST)
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
X-Inumbo-ID: 4c6afde3-f14f-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768398333; x=1769003133; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yMOMn2HwlqhXC4/C9EIMmJoujrYjFnjM4Ioz872BrNM=;
        b=FehmLS4bUEtjgH9gNEodwVnD+ZwOuik0nbgU3RVWgNwpRgerkEW0YOwdSfA6iiv8+1
         aqkjB8HO+yjB5v6t/gA0CbmCmkgHGZ9ssxIvoHm6UlT8lVKwI4MdUSjg/rQ9ZASGznHv
         C+iLRM+CdhJzEx98YFtU+VFRExSnUSmeO0lOkagBTGzuEFaJXubqsMgrtuVhI5zhZC/T
         Kbo8GP6bvNummto1+Eu+5q9kpyfZvhVe6NJJYMqUP/iaeBBpxBY1URnRcejHNB+bwwP3
         S94aTwj17Pzb6Yw+0eNbI0VjPyQmvhdM5CZohEuugrWzocZkQb2U95GqzqpyP78GIEw1
         LEzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768398333; x=1769003133;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yMOMn2HwlqhXC4/C9EIMmJoujrYjFnjM4Ioz872BrNM=;
        b=gsMewopM9RjPpZdCwgg7R/rFc+jFlETyejkA6ixQ3MBgoxS7uD/EGfuaq7HOjt9W3Y
         B7R5YMQf7lrIf/WAq9bUbGw+0l76zATIxbnnjyO4a/4xS2NT99RYpYbihevctgeobAOx
         jyKIsoXP22LbLga+V4/7HIwjfW7DJS5jOuzykLOccW4VUfjnOXnwYUwnliypGpruYyJp
         gYbVsfU5hvSF8hMC8f7zHgccElqBemPXbSCgnO5Hu4tsuKLxpi77ljJ0mtSerl5NVo3A
         T6YcGFSGMWZFENVcpL38JPsp1k+4jkafyGcXKpSJlGUtqJAvLynhQLPbR/7l6x/RgwPy
         e/mw==
X-Gm-Message-State: AOJu0YxNKEI3c9uXJxoCKkUras1r7YodqfASyH+UIujMJBEm/htXhhJt
	nzLcVYjBrrBHLul2X8hyrqFWn2Np0Mofwdmx1XJMEDk2MEPS40UDxPT2ubIkEu9uWROgUnHNbOP
	Pgug=
X-Gm-Gg: AY/fxX4HeQxukKLnbSwZs4CW3PKQpvGCr5kmnqzW/ZrK7QxGE7rsRxd7iA9ZDf0o8/1
	IxoH5FIM4hzi3aseNfAywhmgCF2aDuFpKipHmB6EM3TCg1EeufMz6kBaIWMtYFTNShSIcS0u4Ca
	HFrKr7cNHoO8rMcz3ElD6rcTwhr2Hmwaz757hrydjt3ikGpY/zYGlucXUiVzC+prxuC4YK0xug1
	ob6WQsKpl9nrz57gYwZ2Hym8JGE3Dp5Hv5VakMmArqJhAdBpD23Z+eWzXcYLDbEP12Dx8gNKsZ9
	blcC7L/0bQ4o17X9m4aMGvWjfsVGro4/gOGqYCr2VQPkN0I/LGIg5VorkP3cuLg47e7ZCvwFY+o
	0J7knpH2Y5hCuo5C3WFoyGie0oE5ucUNsl9L+uqahpJ5FRVvedWj6kBMquiZ+bW4CVTP25VgfQ0
	z4JkkB7AxFXqj6+Iwlz+JDe1bSY7YdMWpdDVd6DQzpxdlXn4iJ2Bu6IK3N8AykWzbF6qYB6twli
	j8/AR2ZtUJHaw==
X-Received: by 2002:a05:600c:a51:b0:477:7bca:8b34 with SMTP id 5b1f17b1804b1-47ee32e5cd3mr34451775e9.6.1768398333076;
        Wed, 14 Jan 2026 05:45:33 -0800 (PST)
Message-ID: <a92b07f9-5775-4197-a470-5393e9e8a580@suse.com>
Date: Wed, 14 Jan 2026 14:45:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 5/6] x86/cpufreq: use host CPU policy for Turbo checking
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

There's no need to invoke CPUID yet another time - we assume symmetry
anyway. With symmetry assumed, logging per-CPU also isn't very useful.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
v3: Re-base over naming changes.

--- a/xen/arch/x86/acpi/cpufreq/acpi.c
+++ b/xen/arch/x86/acpi/cpufreq/acpi.c
@@ -220,14 +220,11 @@ static unsigned int cf_check get_cur_fre
 
 void intel_feature_detect(struct cpufreq_policy *policy)
 {
-    unsigned int eax;
-
-    eax = cpuid_eax(6);
-    if (eax & 0x2) {
+    if ( cpu_has_turbo_boost )
+    {
         policy->turbo = CPUFREQ_TURBO_ENABLED;
-        if (cpufreq_verbose)
-            printk(XENLOG_INFO "CPU%u: Turbo Mode detected and enabled\n",
-                   smp_processor_id());
+        if ( cpufreq_verbose )
+            printk_once(XENLOG_INFO "Turbo Mode detected and enabled\n");
     }
 }
 
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -177,6 +177,7 @@ static inline bool boot_cpu_has(unsigned
 #define cpu_has_tbm             boot_cpu_has(X86_FEATURE_TBM)
 
 /* CPUID level 0x00000006.eax */
+#define cpu_has_turbo_boost     host_cpu_policy.basic.turbo_boost
 #define cpu_has_arat            host_cpu_policy.basic.arat
 
 /* CPUID level 0x00000006.ecx */


