Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AA5C80796
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 13:32:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170544.1495608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVkF-0000gL-MH; Mon, 24 Nov 2025 12:32:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170544.1495608; Mon, 24 Nov 2025 12:32:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVkF-0000e4-Ia; Mon, 24 Nov 2025 12:32:39 +0000
Received: by outflank-mailman (input) for mailman id 1170544;
 Mon, 24 Nov 2025 12:32:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNVd8-0001k4-S3
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 12:25:18 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a23dc6ec-c930-11f0-980a-7dc792cee155;
 Mon, 24 Nov 2025 13:25:16 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-477b91680f8so33790345e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 04:25:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477bf1df392sm195782005e9.1.2025.11.24.04.25.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 04:25:15 -0800 (PST)
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
X-Inumbo-ID: a23dc6ec-c930-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763987116; x=1764591916; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HiOO8E0uxvBIuOYrUtu7nBmWTtZUQ4qC/F+v+mwsDJs=;
        b=dMBHF/39TAzk+DYofAIPS8dM6e+gZpTb6bw3S0QnpvuTRTSh6p+aDZUPXjVekI+U05
         K0o7OS33eXnhznZpTY8uu8zMMG4P/tM1owFjxodrmEovF4MqVtRFtWdqeM42M42Pqx5g
         0bkeajs1GocyDHdNQcTatLbjE3KoWEEo4fvhBT1kVZx+nj1v41NfoaN2BGl/oU3YsQV2
         EJ/w/hVIfldMizjhF7AB0N0HwyyCZ8kfIULrNZRDpMUiA/SC/mxyXdez+CLBNzW59H0T
         3qnkFq2PDo9MCzzUxiBvWU/PK2JpMth4U4Du62iIowG1m5l5SMBSXzJVm/UOXKKIiZM+
         FcAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763987116; x=1764591916;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HiOO8E0uxvBIuOYrUtu7nBmWTtZUQ4qC/F+v+mwsDJs=;
        b=QtYpcI/cadp6Gi+qoVQHo03gMj2IgMOwZzzmzP5+mwgZUI1Tcd4skrEdSvqx7zmTfk
         3vQ1GoN+wN2eSNqBFX74p5KnoBXP4QPS+aV927TAkUTNgBlz9gZ37sAW+temYNnblvME
         m3MEAY+adlnMS4H2D6xb7NyoRBTQMpN6fsysDIGV7UWClh8hx5+mkMRonRbIWVz1Goku
         IfBTdZ0HFAoxkJcgY38QXb6xb2ayyJwp3klFVrHn/NFtArknhflb7bMFxuh6IukMitXO
         IE5j3O/bEzwXkGGCkHhEqyvXAiVpbRfVR4VZ8mJ/+LG9s7tNIEcoXdg7NDkypg+Xk0q2
         Jadw==
X-Gm-Message-State: AOJu0Yylchbll0PneZYxRb2HPaVt+ZZWy/CQofugJPEVgMYOkUTGWBhP
	WMhk2TXQxhPE+qiknj8G0wiKwdq94FsFoYunk1kuoTENHQ2xX5/nYyaNdCk7wBPxNbMzKQymb2n
	NPyM=
X-Gm-Gg: ASbGncuoWVkPkLCnGCnDRNwLjXLcjTstTYCinE05Zq9rgl6VzudMKfPNH1qjq+1KR3r
	8nhqc7+EzMyKfnqgdZtaeYuQcXwkBVcUlSdHNv/NFMucw8mu/kdTljXN1RBGgTigR16gO1I1+zD
	RNjuomNOwDjZNrm7csyCAR6Fg8NxTVBp+xTeEncQxOCPJNigQOpRdkbZwhz+z8wCSPdZo+4FsN/
	L4mpHiOexbsyMG27SqQrMThvzFBw9LzqCCJLmI14VrfrswSiHBFbaCVlnUTJf6mSPgSldv5b6do
	/1hwzgOuliHQgIqqmmVmn+IZtgICWSO4tEDiRd69W4Ke3F7/0qC8vIumrdmVzdUEhensCpSwHj2
	k1oFB8UOsg+ktE0nAgp14PBoB58myVo7VScGNtURA8Z69Agt2o5qjmApleiUajfP+Qd6ugMhVYk
	h8ZNJSa0eTmdiMb7S6cwZF6pyjrZtyuz9tIi69V6lgtVxmceJuGGYiOl5VqiWFQlLbWJ/gL/LCy
	eGYguZ2UZqiOA==
X-Google-Smtp-Source: AGHT+IER1zqoIJny1pLILhNWvB7gTTC8sA2UNU0+uGH3XryZH002d0/wFxW7pSX4N+kLBmIsOfliSg==
X-Received: by 2002:a05:600c:46cd:b0:475:dc5c:3a89 with SMTP id 5b1f17b1804b1-477c1136b7fmr100522755e9.34.1763987116126;
        Mon, 24 Nov 2025 04:25:16 -0800 (PST)
Message-ID: <bacee005-8ba3-468e-8de4-681af1cc4856@suse.com>
Date: Mon, 24 Nov 2025 13:25:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 6/6] x86/cpufreq: use host CPU policy in HWP driver
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>
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

There's no need to invoke CPUID yet another time. This way two of the
static booleans can also go away.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
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
+                cpu_has_hwp, cpu_has_hwp_notification,
+                cpu_has_hwp_activity_window, cpu_has_hwp_epp,
+                cpu_has_hwp_plr, cpu_has_hwp_peci);
 
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
 
@@ -226,7 +214,8 @@ static int cf_check hwp_cpufreq_verify(s
 {
     struct hwp_drv_data *data = per_cpu(hwp_drv_data, policy->cpu);
 
-    if ( !feature_hwp_activity_window && data->activity_window )
+    if ( !cpu_has_hwp_activity_window &&
+         data->activity_window )
     {
         hwp_verbose("HWP activity window not supported\n");
 
@@ -268,7 +257,7 @@ static int cf_check hwp_cpufreq_target(s
     hwp_req.max_perf = data->maximum;
     hwp_req.desired = data->desired;
     hwp_req.energy_perf = data->energy_perf;
-    if ( feature_hwp_activity_window )
+    if ( cpu_has_hwp_activity_window )
         hwp_req.activity_window = data->activity_window;
 
     if ( hwp_req.raw == data->curr_req.raw )
@@ -365,7 +354,7 @@ static void cf_check hwp_init_msrs(void
     }
 
     /* Ensure we don't generate interrupts */
-    if ( feature_hwp_notification )
+    if ( cpu_has_hwp_notification )
         wrmsr_safe(MSR_HWP_INTERRUPT, 0);
 
     if ( !(val & PM_ENABLE_HWP_ENABLE) )
@@ -537,7 +526,8 @@ int get_hwp_para(unsigned int cpu,
         return -ENODATA;
 
     cppc_para->features         =
-        (feature_hwp_activity_window ? XEN_SYSCTL_CPPC_FEAT_ACT_WINDOW : 0);
+        (cpu_has_hwp_activity_window
+         ? XEN_SYSCTL_CPPC_FEAT_ACT_WINDOW : 0);
     cppc_para->lowest           = data->hw.lowest;
     cppc_para->lowest_nonlinear = data->hw.most_efficient;
     cppc_para->nominal          = data->hw.guaranteed;
@@ -585,7 +575,7 @@ int set_hwp_para(struct cpufreq_policy *
 
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
 #define cpu_has_turbo           host_cpu_policy.basic.turbo
 #define cpu_has_arat            host_cpu_policy.basic.arat
+#define cpu_has_hwp             host_cpu_policy.basic.hwp
+#define cpu_has_hwp_notification host_cpu_policy.basic.hwp_notification
+#define cpu_has_hwp_activity_window host_cpu_policy.basic.hwp_activity_window
+#define cpu_has_hwp_epp        host_cpu_policy.basic.hwp_epp
+#define cpu_has_hwp_plr        host_cpu_policy.basic.hwp_plr
+#define cpu_has_hdc            host_cpu_policy.basic.hdc
+#define cpu_has_hwp_peci       host_cpu_policy.basic.hwp_peci
+#define cpu_has_hw_feedback    host_cpu_policy.basic.hw_feedback
 
 /* CPUID level 0x00000006.ecx */
 #define cpu_has_aperfmperf      host_cpu_policy.basic.aperfmperf


