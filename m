Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F51C6A3D1
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 16:11:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164970.1491818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLNMg-0006AN-VU; Tue, 18 Nov 2025 15:11:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164970.1491818; Tue, 18 Nov 2025 15:11:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLNMg-00068z-Sb; Tue, 18 Nov 2025 15:11:30 +0000
Received: by outflank-mailman (input) for mailman id 1164970;
 Tue, 18 Nov 2025 15:11:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=maYy=52=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vLNJo-00026P-Bz
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 15:08:32 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 716e96de-c490-11f0-980a-7dc792cee155;
 Tue, 18 Nov 2025 16:08:30 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b7277324054so780203266b.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Nov 2025 07:08:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a3f8e6dsm12962919a12.10.2025.11.18.07.08.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 07:08:29 -0800 (PST)
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
X-Inumbo-ID: 716e96de-c490-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763478510; x=1764083310; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EaxTfRibb0WV/8D0hz8O8sCazTK04DB2X0gZg+rQ2po=;
        b=LuibiqdlColTs3PtBpB7QESVQzwFR7g4nvr08wAnTNIs/n03ujuuqbdy1zJo1j64Vw
         iQfpnwdKF+eX2BgSNqYkL5lE97hIUYAjVkbqWboy4hBUK2sLZ6nxsGtllo42aFnxp2ru
         xxuAHHfi5wa6g9EHApt2l2goFWEu1XRMoC3LyX5A/sbe3XtR7KqW9ABv9T8JLga3rMV6
         K+txCbcXTFUY8GaIbG+cPNxL1YWw3KeADSbdAmqTh1w9StgI+Hxv0LnW/5zO8CeuAjHv
         4UxQG/Ex0Yk39DT8uCcKbwzxHgHARBjbJS1xKYyTXIJFajQ6DifKXJ8hq16+hKfDObMq
         Zspw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763478510; x=1764083310;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EaxTfRibb0WV/8D0hz8O8sCazTK04DB2X0gZg+rQ2po=;
        b=wEjp0ki5xYCofsfOPSloUxAu88bxRPUOK6njwyy52nGEQBt/cu1BEb1VqTeyaOHkqe
         geb9XWIoq4NzE6VuIAYuMpN75kqx5uMfLrIdr6/H7QQ4qF5M0fmOyeILMqOdXOyCLUf4
         qP9KsH9hhRy5+7ZAA7kfjJqtO9gxkPSINuQXQXuHZAeX8N4ex8TlEGNoFHIFAptQxeCZ
         iljitpV4sbjJZo2SWsxY88QhO7RLHTd/8TJZP9Tpb/HvypX0cCtTvWN4mqfa7OaIE9q/
         wUUPx8YhHiqAO1y8483SEYMCdZuWpIkVgebxI1n42WsMeUT4gblgG/abtArqdDItBBQk
         Wvrw==
X-Gm-Message-State: AOJu0Yy5UOkZKfvl6DHJs6uYTcLLorI5JZxbW2f0Qy8aU8ERnLE0Oow6
	TVxWyFtmoS/IveDJO3YaDILzz8lDdy1bL2aJpisaxA4vCDmK5ISLaW4M3L51S8fj6UZmD3fZ3MF
	6sPw=
X-Gm-Gg: ASbGncvfVpoqTcln7TDCkyPDFUhaBTPPoFHpnz8pfLS60sa+JqlX0TKUpb77tgBt2e8
	zcFK1PN4zTHcHfFIyz9oPt+uyBTeERgGntzbUHg8EENqnzEVaLN2h7cSGibrdGe6JVwLgaZFqUr
	yQBEfxlnHGjFEB//amR8ySz1kZjiM1bjM/Hj3y3YVAb+CTKFdDbqKAOM7DF18/KT55IATWQlUY9
	DA4vGa8JeIulc+TJFBsy43xNxpsJ52B9twd7I5CahyIMsc3I2QZZ9QvPzeLNwGt0Cnq5QkUdAFk
	QgV06MTlMdfZemQ/LRHRgXqu58RbHsC3bzlMtsIssSHplnDU2LRU9Qu780SFEy0DznSbltdMBgi
	a8xjxm2A1UkqXWWVwU+B/7Z3/dQdMC09bBuVosh+X1EndIH9hbeZJ6Qhp/GA14Ff8f0ntLt6L+r
	6gslNdbYZ4it4OxF8WW1zSO0jNdKc0uDq+0mxGFaiaXnB5myufYa7J06UEWDcCWRQRiUUKkQS9s
	eqjEUv4ygON8DLJBzNuauTC
X-Google-Smtp-Source: AGHT+IF9K+r8GqRKCQE8yRN/NEsAGLmYIOctpAT8+1Dotrt3AMrqEBoosrWzfJtNzDqIBLUsN78mPg==
X-Received: by 2002:a17:906:7304:b0:b72:a899:168d with SMTP id a640c23a62f3a-b73677edba0mr1701170166b.13.1763478510059;
        Tue, 18 Nov 2025 07:08:30 -0800 (PST)
Message-ID: <c187188a-bb00-4dca-9ec6-7a3862a65bfd@suse.com>
Date: Tue, 18 Nov 2025 16:08:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 7/8] x86/cpufreq: use host CPU policy for Turbo checking
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

There's no need to invoke CPUID yet another time - we assume symmetry
anyway. With symmetry assumed, logging per-CPU also isn't very useful.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/acpi/cpufreq/acpi.c
+++ b/xen/arch/x86/acpi/cpufreq/acpi.c
@@ -220,14 +220,11 @@ static unsigned int cf_check get_cur_fre
 
 void intel_feature_detect(struct cpufreq_policy *policy)
 {
-    unsigned int eax;
-
-    eax = cpuid_eax(6);
-    if (eax & 0x2) {
+    if ( cpu_has_turbo )
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
+#define cpu_has_turbo           host_cpu_policy.basic.pm.turbo
 #define cpu_has_arat            host_cpu_policy.basic.pm.arat
 
 /* CPUID level 0x00000006.ecx */


