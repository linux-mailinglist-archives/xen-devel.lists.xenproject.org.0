Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD09D1F24C
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 14:46:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1203130.1518432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg1C7-0003xU-Dw; Wed, 14 Jan 2026 13:45:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1203130.1518432; Wed, 14 Jan 2026 13:45:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg1C7-0003v4-Aa; Wed, 14 Jan 2026 13:45:55 +0000
Received: by outflank-mailman (input) for mailman id 1203130;
 Wed, 14 Jan 2026 13:45:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81wl=7T=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vg1C5-0003Y4-H7
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 13:45:53 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 573dba35-f14f-11f0-9ccf-f158ae23cfc8;
 Wed, 14 Jan 2026 14:45:51 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-47d5e021a53so65472905e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jan 2026 05:45:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47ee578d12fsm29552315e9.3.2026.01.14.05.45.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 05:45:50 -0800 (PST)
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
X-Inumbo-ID: 573dba35-f14f-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768398351; x=1769003151; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=of3ZVzYQS2KutMf+Jt2/4ruObRoSOuVu1pCONx6TmkE=;
        b=Slw/0h70M85bzja7GTIVRNiN6bIjcYjrlJsCJJk/n7Kdf64HSYH2VOVeAzuRo1D9ev
         xc+YVI1NlTNGnYe4euRRG417IKoG0Y/zcJe4lPUvkbhcFB27Q1/rLaKbs6MtIXAkJv+k
         Pgh1wr9K1dSppKrTy2ECsompahoniLMmPrj95Y3f/T9RXpYUucs3AgH9bdw9m63rnwha
         zT/3V2tgIXxK6U0fZ0+7CkkBzZT8ZU8btmP04kYJmUvEnk/c7BMFoD5oYuKcmUbUKflI
         CKkn2I5+R3wkfs/IaOB3KdqSkxvyhxmDiXysncbQ+0OMAy5h/M92hS3lnROqZBvPI1/7
         c3Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768398351; x=1769003151;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=of3ZVzYQS2KutMf+Jt2/4ruObRoSOuVu1pCONx6TmkE=;
        b=l0ndaU+k/YM+E8tm5dwGsM/I3RjJdliCkpnGwXAi/CQzZOOsRfsQ2HhoHbBYWBbJlO
         0QnCuOlUYZc1tirqUCJpWC1y3GavSOrHILuqF2mVApwShFJJmKsnb5xzbFo/O8sgJaqk
         jtbilnEFzBBhd8AmnMACj0/yGN2fYdMLUfGd+GNZltVX5Lx01TGsN8PkQadazrJl1oOR
         mAG6UkjYexBF6Q6MaLf+s++r0z8z9rMHgGy9xjPbk4vm6z3WygK+oI/8aIUm4xwkpX8u
         +MhfsT8S+RIYEKAMOu8Zfmufnwz7oMh0SlLH2KzVV01zLisSdfau1CwOY0OlIZKIfi3Y
         wSxQ==
X-Gm-Message-State: AOJu0Yzk0tGqMuj8oFacrIh62jS/2cFqK5hpYwpjeSM6fKwgaqjDAjij
	K3a2A0PZxmElbYv6Yf9QJLkLafDJaHaD6oRUzs7UxOKsLK80N9ixwUrGRdX9g6aS19nbtxEFT/m
	PrLw=
X-Gm-Gg: AY/fxX6Uz7W7/KvuE6iUI+qpr+pwfQF0/6DYiSF2iul7B80OGXyDkb4QBSTNVI8xur9
	2UkAQfX23cmtyRnAUvO3B21Y/g9CxHMM9/RQ49NI5bX1RG4UZ4ydwpOce9fZWxb5eFms5M15HZX
	sSxwSLIblcxW9z95HaOf5JdVHzmPS8CA7xUOE1iZrORHUVPuZ8bu+W7kgzG4NL/EXdJFO7XiNn+
	Bf4RHNPhpf5CJsM87MbtutGOKAk/wKTdDwB0gU8FY9y5HD4JelS+tMDxWZB5GPBuF1Ta/4ahs2Z
	58ndIpbe1VqXZrTyzQue+6c+a389dbdMPooP4Vux6gLlgbLTaOZJD1lNUQkslSnnE3pC+TdvIzb
	Gj1G0Kcmj6xhps6ONED//IwJZAkN6F2JdG44jXiLSm2LS4NUglm4IDz2AgicNjLqBZtBwqXFZsn
	6xX0sKYGMu5dNlxHS101wWb5mrVxEQTTwj1EdIpwDkEcbxdDPcxaM4PUwGRvgH/jlrlD9cyNDV5
	CDl8bZD2UMMdg==
X-Received: by 2002:a05:600c:4f0b:b0:477:9392:8557 with SMTP id 5b1f17b1804b1-47ee4819824mr24243505e9.18.1768398351202;
        Wed, 14 Jan 2026 05:45:51 -0800 (PST)
Message-ID: <7d52c0cf-c097-4c32-9af6-5044727c3ef8@suse.com>
Date: Wed, 14 Jan 2026 14:45:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 6/6] x86/cpufreq: use host CPU policy in HWP driver
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

There's no need to invoke CPUID yet another time. This way two of the
static booleans can also go away.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: Undo some line wrapping. Correct padding in asm/cpufeature.h. Re-base
    over naming changes.
v2: Introduce cpu_has_*.

--- a/xen/arch/x86/acpi/cpufreq/hwp.c
+++ b/xen/arch/x86/acpi/cpufreq/hwp.c
@@ -18,9 +18,6 @@
 
 static bool __ro_after_init hwp_in_use;
 
-static bool __ro_after_init feature_hwp_notification;
-static bool __ro_after_init feature_hwp_activity_window;
-
 static bool __read_mostly feature_hdc;
 
 static bool __ro_after_init opt_cpufreq_hdc = true;
@@ -165,8 +162,6 @@ bool hwp_active(void)
 
 static bool __init hwp_available(void)
 {
-    unsigned int eax;
-
     if ( boot_cpu_data.cpuid_level < CPUID_PM_LEAF )
     {
         hwp_verbose("cpuid_level (%#x) lacks HWP support\n",
@@ -183,29 +178,22 @@ static bool __init hwp_available(void)
         return false;
     }
 
-    eax = cpuid_eax(CPUID_PM_LEAF);
-
     hwp_verbose("%d notify: %d act-window: %d energy-perf: %d pkg-level: %d peci: %d\n",
-                !!(eax & CPUID6_EAX_HWP),
-                !!(eax & CPUID6_EAX_HWP_NOTIFICATION),
-                !!(eax & CPUID6_EAX_HWP_ACTIVITY_WINDOW),
-                !!(eax & CPUID6_EAX_HWP_ENERGY_PERFORMANCE_PREFERENCE),
-                !!(eax & CPUID6_EAX_HWP_PACKAGE_LEVEL_REQUEST),
-                !!(eax & CPUID6_EAX_HWP_PECI));
+                cpu_has_hwp, cpu_has_hwp_interrupt,
+                cpu_has_hwp_activity_window, cpu_has_hwp_epp,
+                cpu_has_hwp_request_pkg, cpu_has_hwp_peci_override);
 
-    if ( !(eax & CPUID6_EAX_HWP) )
+    if ( !cpu_has_hwp )
         return false;
 
-    if ( !(eax & CPUID6_EAX_HWP_ENERGY_PERFORMANCE_PREFERENCE) )
+    if ( !cpu_has_hwp_epp )
     {
         hwp_verbose("disabled: No energy/performance preference available");
 
         return false;
     }
 
-    feature_hwp_notification    = eax & CPUID6_EAX_HWP_NOTIFICATION;
-    feature_hwp_activity_window = eax & CPUID6_EAX_HWP_ACTIVITY_WINDOW;
-    feature_hdc                 = eax & CPUID6_EAX_HDC;
+    feature_hdc = cpu_has_hdc;
 
     hwp_verbose("Hardware Duty Cycling (HDC) %ssupported%s\n",
                 feature_hdc ? "" : "not ",
@@ -213,7 +201,7 @@ static bool __init hwp_available(void)
                             : "");
 
     hwp_verbose("HW_FEEDBACK %ssupported\n",
-                (eax & CPUID6_EAX_HW_FEEDBACK) ? "" : "not ");
+                cpu_has_hw_feedback ? "" : "not ");
 
     hwp_in_use = true;
 
@@ -226,7 +214,7 @@ static int cf_check hwp_cpufreq_verify(s
 {
     struct hwp_drv_data *data = per_cpu(hwp_drv_data, policy->cpu);
 
-    if ( !feature_hwp_activity_window && data->activity_window )
+    if ( !cpu_has_hwp_activity_window && data->activity_window )
     {
         hwp_verbose("HWP activity window not supported\n");
 
@@ -268,7 +256,7 @@ static int cf_check hwp_cpufreq_target(s
     hwp_req.max_perf = data->maximum;
     hwp_req.desired = data->desired;
     hwp_req.energy_perf = data->energy_perf;
-    if ( feature_hwp_activity_window )
+    if ( cpu_has_hwp_activity_window )
         hwp_req.activity_window = data->activity_window;
 
     if ( hwp_req.raw == data->curr_req.raw )
@@ -365,7 +353,7 @@ static void cf_check hwp_init_msrs(void
     }
 
     /* Ensure we don't generate interrupts */
-    if ( feature_hwp_notification )
+    if ( cpu_has_hwp_interrupt )
         wrmsr_safe(MSR_HWP_INTERRUPT, 0);
 
     if ( !(val & PM_ENABLE_HWP_ENABLE) )
@@ -537,7 +525,7 @@ int get_hwp_para(unsigned int cpu,
         return -ENODATA;
 
     cppc_para->features         =
-        (feature_hwp_activity_window ? XEN_SYSCTL_CPPC_FEAT_ACT_WINDOW : 0);
+        (cpu_has_hwp_activity_window ? XEN_SYSCTL_CPPC_FEAT_ACT_WINDOW : 0);
     cppc_para->lowest           = data->hw.lowest;
     cppc_para->lowest_nonlinear = data->hw.most_efficient;
     cppc_para->nominal          = data->hw.guaranteed;
@@ -585,7 +573,7 @@ int set_hwp_para(struct cpufreq_policy *
 
     /* Clear out activity window if lacking HW supported. */
     if ( (set_cppc->set_params & XEN_SYSCTL_CPPC_SET_ACT_WINDOW) &&
-         !feature_hwp_activity_window )
+         !cpu_has_hwp_activity_window )
     {
         set_cppc->set_params &= ~XEN_SYSCTL_CPPC_SET_ACT_WINDOW;
         cleared_act_window = true;
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -115,14 +115,6 @@ static inline bool boot_cpu_has(unsigned
 }
 
 #define CPUID_PM_LEAF                                6
-#define CPUID6_EAX_HWP                               BIT(7, U)
-#define CPUID6_EAX_HWP_NOTIFICATION                  BIT(8, U)
-#define CPUID6_EAX_HWP_ACTIVITY_WINDOW               BIT(9, U)
-#define CPUID6_EAX_HWP_ENERGY_PERFORMANCE_PREFERENCE BIT(10, U)
-#define CPUID6_EAX_HWP_PACKAGE_LEVEL_REQUEST         BIT(11, U)
-#define CPUID6_EAX_HDC                               BIT(13, U)
-#define CPUID6_EAX_HWP_PECI                          BIT(16, U)
-#define CPUID6_EAX_HW_FEEDBACK                       BIT(19, U)
 
 /* CPUID level 0x00000001.edx */
 #define cpu_has_fpu             1
@@ -179,6 +171,14 @@ static inline bool boot_cpu_has(unsigned
 /* CPUID level 0x00000006.eax */
 #define cpu_has_turbo_boost     host_cpu_policy.basic.turbo_boost
 #define cpu_has_arat            host_cpu_policy.basic.arat
+#define cpu_has_hwp             host_cpu_policy.basic.hwp
+#define cpu_has_hwp_interrupt   host_cpu_policy.basic.hwp_interrupt
+#define cpu_has_hwp_activity_window host_cpu_policy.basic.hwp_activity_window
+#define cpu_has_hwp_epp         host_cpu_policy.basic.hwp_epp
+#define cpu_has_hwp_request_pkg host_cpu_policy.basic.hwp_request_pkg
+#define cpu_has_hdc             host_cpu_policy.basic.hdc
+#define cpu_has_hwp_peci_override host_cpu_policy.basic.hwp_peci_override
+#define cpu_has_hw_feedback     host_cpu_policy.basic.hw_feedback
 
 /* CPUID level 0x00000006.ecx */
 #define cpu_has_hw_feedback_cap host_cpu_policy.basic.hw_feedback_cap


