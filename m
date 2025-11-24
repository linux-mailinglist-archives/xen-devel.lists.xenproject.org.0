Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 302FEC80793
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 13:32:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170531.1495598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVjj-0008RG-EF; Mon, 24 Nov 2025 12:32:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170531.1495598; Mon, 24 Nov 2025 12:32:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVjj-0008Pk-Ad; Mon, 24 Nov 2025 12:32:07 +0000
Received: by outflank-mailman (input) for mailman id 1170531;
 Mon, 24 Nov 2025 12:32:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNVcn-0001k4-Mn
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 12:24:57 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95c80395-c930-11f0-980a-7dc792cee155;
 Mon, 24 Nov 2025 13:24:55 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-477563e28a3so28785215e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 04:24:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477a9e051d8sm152580145e9.5.2025.11.24.04.24.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 04:24:55 -0800 (PST)
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
X-Inumbo-ID: 95c80395-c930-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763987095; x=1764591895; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1XcpEuyq7I/RcIRhR0rcpzEEX5hVnSggdYKamo6kWLA=;
        b=X+g6dkq0B8ba7rTY3ORtLxnek7yKfMLuESCav8L/GrY+unXXmiruGR4ipp7TrYGyhO
         +o5V1l04xrhTEpVLS5+OmqaMUjbLT0UaeiOTKHYdC5SA0tvh391XQsPX3QNNvlheY6Et
         2ntV5h9C/w5Z7mWXqNiI8IhwaFJ0nn3iTIfYsAWdQvqtiYzmotmcZGyoA6ZrpwwmrzSR
         BDHsRvNhs7sY5naUQvY0PQ9REGh6xzWCwKJsikUVyN5oUXaBwTWMaNdBkuqt8VhdfIsV
         hzn9ofVSMp4TDoiO5+ZWkyf+st04b99yvFUCW0ewAZSGUSbOoOmsfLhhAyRd+F/V1xuq
         uBBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763987095; x=1764591895;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1XcpEuyq7I/RcIRhR0rcpzEEX5hVnSggdYKamo6kWLA=;
        b=R5nGQumWbpdp7cGlKB5AJvILRKkhYCi8cxuJ1UfyaDP1a9Py04kiGpbgK6DhQaVV2h
         kBEVhL40JfFzL/qorN4pV2598Ge5lfHnwNpzyrtYJMCROywAj5vv/YiDTC6LuIWBPMyr
         4bi4hg2iigvyQ8wAEckYyfStKm62BjDPIC1h5LILm4hIAaylJt5V/oGUtOECcVaSdzYd
         1V5W2hYybMRDUvfq6xhxxzVbSUNSVz83dEix+aa1MWha8wtB3pudI0e8jXcLMAXu17d2
         H7bXsau/ydIn7qiF7+R8Hels7QmAr5hygtKAzjbkID6b+bd/x+pCoNP8XoEK6vg0Xc9i
         BI9g==
X-Gm-Message-State: AOJu0YzXEWRKg2uC2+EYbAaIv7qQLlsiKx3Fd+fo/GquDJUl/rEW3i2w
	H4OT8+O84YTeLhv7g9TqC92wEG+YWrlOee6UKQoIqxwhzPOWanA2mQaWFopDZur+zEJsn1magAL
	T1Bg=
X-Gm-Gg: ASbGncsQCbWKdSZ1e62Y2fmZvceJSneetZcVlnWZwakiGLdThOekE9MZqA70iHBMpay
	6N7ksfXSfHjEMSuWZFAJrKvLxdfuu50x9lKo0ASEEtHaee1DmBM3SupOb1ICpKsYK7mTSAQE+bs
	fnxguanIwVKiHoq4YE8uxkhAyhJ3BQ8ROIGNjUobbhdFJTfRWMhVuqFIrgAPC3W/5csQmLwVJhQ
	MeEYE2SsvVRxciyx/3eTj3+PAHycLFGAoFWeOH+h833OUdybtGzxm0eUReaFZ6ZlfzW2uP5GjXl
	YKsppKHhmXXorNlwUAa9jxeMZ69JPxJFSxTjOsmtZdC4ntUnH0ugZE57tjF8X6WiXWP9dfK5KFk
	ePf9/V7xNaGlWJVGumF3aaJ9KBGzj2BS/2tM+CzYaJ3ToIL5XiDWk7xnSeWW3hvX6MEc1VVzfG2
	eb49jFU3YEOQhn5DyZcXOKFur1u27Us+avN2GMYAfPsWs1X2i/7eoKjEG9PjCINCgIqgTntjREU
	tI=
X-Google-Smtp-Source: AGHT+IEhoUys/5YoCehFDJB85Azw48BWOB2bzoMrzEb3G0ZMOMPXZ+CY/LZCV8vBna5lVpSUbk1MRA==
X-Received: by 2002:a05:600c:154e:b0:46e:2815:8568 with SMTP id 5b1f17b1804b1-477c05137f4mr114025495e9.10.1763987095260;
        Mon, 24 Nov 2025 04:24:55 -0800 (PST)
Message-ID: <27f467a9-a507-4832-850e-190aff8c04aa@suse.com>
Date: Mon, 24 Nov 2025 13:24:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 5/6] x86/cpufreq: use host CPU policy for Turbo checking
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <f0ac75c8-5d65-43ef-aeeb-78d34f1da470@suse.com>
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
In-Reply-To: <f0ac75c8-5d65-43ef-aeeb-78d34f1da470@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

There's no need to invoke CPUID yet another time - we assume symmetry
anyway. With symmetry assumed, logging per-CPU also isn't very useful.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

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
+#define cpu_has_turbo           host_cpu_policy.basic.turbo
 #define cpu_has_arat            host_cpu_policy.basic.arat
 
 /* CPUID level 0x00000006.ecx */


