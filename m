Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CA9A057B9
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 11:11:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867072.1278488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVT2N-00050l-M8; Wed, 08 Jan 2025 10:11:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867072.1278488; Wed, 08 Jan 2025 10:11:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVT2N-0004z9-JV; Wed, 08 Jan 2025 10:11:43 +0000
Received: by outflank-mailman (input) for mailman id 867072;
 Wed, 08 Jan 2025 10:11:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=svEr=UA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tVT2M-0004yz-He
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 10:11:42 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4171666-cda8-11ef-99a4-01e77a169b0f;
 Wed, 08 Jan 2025 11:11:40 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4361e89b6daso113925375e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 02:11:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2dc1763sm15465765e9.12.2025.01.08.02.11.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jan 2025 02:11:39 -0800 (PST)
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
X-Inumbo-ID: f4171666-cda8-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736331100; x=1736935900; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jiq6XWslhxdWPp8jdeQUdb+1Oh9S+Y/2AWgC7Fw0yEI=;
        b=PTm/g8gO4fYfyn6Qm6kOieCnGoxjGEY5MORxCrffXqExy/vnl9adwDKzwnkhbokMQL
         6y8QU02OxSy0zPYIcK8xzARuij1UX8axA7715T5o4upNHZZOn/lNsrGUOvsJFWG8oi2+
         T5CdQWSf3AcP7fgHQIW1PvhaHvX4dkK7U2ftpyVjplo/3Hqf0uvtRvQ8Al30H8ka//Ei
         W8OqNtAOmFyNPozshUWUd6cK2oS15IOwt8iZCMEtPJ3ecxJBL4CyiHlQ6Cumy4piyuGb
         hm/5QqGCspC1M16clU5pr8KZxGR306iuSkMFDtLJT2wAgQ8pwKUhVZ0Dbu3gecyNk8gD
         KG/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736331100; x=1736935900;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jiq6XWslhxdWPp8jdeQUdb+1Oh9S+Y/2AWgC7Fw0yEI=;
        b=CAmydWSMiwaO2XyDKKiRozSCbE7An4LqUz1zKCEoP98l2pcSFIYOZJWyfNkJSSdyOE
         gN+uCZFKNHKQwScYGccrK4f8BT7is6/wwLX2PWKD1U7IB31hznxFsetLQYqHFlb+1TSN
         dsWAq3Uj8LdpieGjjVcNzOEgD/YSEJyLhi6wqnNvYhe1Ov15bYuBo/Vvgb2J/lG9ljLF
         YBeNx40G5IUI5vuBGu3ex7BSi4eDStPiRytDNhBfEGPZaiQyFL9F4Ic9GGfZaciE0Z2b
         eMLUKqsdTipMxt7+nb/OeKnW2ULU1AX4j4V+GKcfdK7zaofPNEcVS9Tvx66nlSj/IvR4
         n57g==
X-Gm-Message-State: AOJu0Yx/wq9JnjGpzAAWsekhX348JPm+TQwD1zmSd6kXISdqxdEWiOwY
	DSO1KZH6l0qxJGmT2E6BXodXz1VuM07dSTmkqeo/ErLxj4nDj9EGrHZqJg9XJsnxHVPTkhKZPWw
	=
X-Gm-Gg: ASbGnctuKTbpqKGuFv5A+jwDxQ/qGX4WPjmlSFIiJs3oczZatPa8zd/RYoeMJCqttM5
	B+nx8BhF52cNBBZRIfGbyIc5EZCUDADWi5Aq7Ln5FLTZtbuEHZyk+9NEL2lmmBBoTZS0WOAPHnd
	52KufjC6quLQ1QRY5VjsuTEINqJGR6KQxR2IgGBKzqbZt55S4xr4zPhXdB1dXmS0wD7ioYdjZgo
	ukytm8q4rB550wyb703D7ImS+Lf1UzBkXxlfqY+OuzG3vEYPkUFdmoim46tSEn/1Zq0BU1rmUjW
	W8CBT3ZjtBNaqeHIb8vsdh6mepWZmcZD9RPEjTTPXg==
X-Google-Smtp-Source: AGHT+IHxkzldPvFinqhqJsbizyW1OS7RrjlG9Mzgl6WpJKyH8mvMAFUwuvncRARsZ++CFHhtD9WYNA==
X-Received: by 2002:a05:600c:a09:b0:434:f1e9:afb3 with SMTP id 5b1f17b1804b1-436e267863emr15417995e9.3.1736331100027;
        Wed, 08 Jan 2025 02:11:40 -0800 (PST)
Message-ID: <2e61ad8d-3b1f-49bb-bc93-61c820d6caf3@suse.com>
Date: Wed, 8 Jan 2025 11:11:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 1/6] x86: suppress ERMS for internal use when
 MISC_ENABLE.FAST_STRING is clear
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <14b65231-b83b-43fb-bbcf-dec5c07d285b@suse.com>
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
In-Reply-To: <14b65231-b83b-43fb-bbcf-dec5c07d285b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Before we start actually adjusting behavior when ERMS is available,
follow Linux commit 161ec53c702c ("x86, mem, intel: Initialize Enhanced
REP MOVSB/STOSB") and zap the CPUID-derived feature flag when the MSR
bit is clear. Don't extend the artificial clearing to guest view,
though: Guests can take their own decision in this regard, as they can
read (most of) MISC_ENABLE.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
TBD: Would be nice if "cpuid=no-erms" propagated to guest view (for
     "cpuid=" generally meaning to affect guests as well as Xen), but
     since both disabling paths use setup_clear_cpu_cap() they're
     indistinguishable in guest_common_feature_adjustments(). A separate
     boolean could take care of this, but would look clumsy to me.
---
v4: Also adjust guest_common_max_feature_adjustments().
v3: New.

--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -337,8 +337,18 @@ static void cf_check early_init_intel(st
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
+     * We expose MISC_ENABLE to guests, so our internal clearing of ERMS when
+     * FAST_STRING is not set should not affect the view of migrating-in guests.
+     */
+    __set_bit(X86_FEATURE_ERMS, fs);
 }
 
 static void __init guest_common_default_feature_adjustments(uint32_t *fs)
@@ -591,6 +597,15 @@ static void __init guest_common_feature_
      */
     if ( host_cpu_policy.feat.ibrsb )
         __set_bit(X86_FEATURE_IBPB, fs);
+
+    /*
+     * We expose MISC_ENABLE to guests, so our internal clearing of ERMS when
+     * FAST_STRING is not set should not propagate to guest view.  Guests can
+     * judge on their own whether to ignore the CPUID bit when the MSR bit is
+     * clear.
+     */
+    if ( raw_cpu_policy.feat.erms )
+        __set_bit(X86_FEATURE_ERMS, fs);
 }
 
 static void __init calculate_pv_max_policy(void)
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -490,6 +490,7 @@
 #define MSR_IA32_THERM_INTERRUPT	0x0000019b
 #define MSR_IA32_THERM_STATUS		0x0000019c
 #define MSR_IA32_MISC_ENABLE		0x000001a0
+#define MSR_IA32_MISC_ENABLE_FAST_STRING  (1<<0)
 #define MSR_IA32_MISC_ENABLE_PERF_AVAIL   (1<<7)
 #define MSR_IA32_MISC_ENABLE_BTS_UNAVAIL  (1<<11)
 #define MSR_IA32_MISC_ENABLE_PEBS_UNAVAIL (1<<12)


