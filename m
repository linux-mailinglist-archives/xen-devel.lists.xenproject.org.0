Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 510F2C6A39E
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 16:09:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164945.1491799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLNKO-00043H-DY; Tue, 18 Nov 2025 15:09:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164945.1491799; Tue, 18 Nov 2025 15:09:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLNKO-000409-A1; Tue, 18 Nov 2025 15:09:08 +0000
Received: by outflank-mailman (input) for mailman id 1164945;
 Tue, 18 Nov 2025 15:09:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=maYy=52=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vLNKN-000403-7V
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 15:09:07 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85ecb686-c490-11f0-980a-7dc792cee155;
 Tue, 18 Nov 2025 16:09:05 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b735487129fso887276166b.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Nov 2025 07:09:05 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fd809fasm1377008966b.45.2025.11.18.07.09.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 07:09:04 -0800 (PST)
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
X-Inumbo-ID: 85ecb686-c490-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763478544; x=1764083344; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GTDHw2weO1AUBfmHmJK8dwo4mfz5EckyJJgzqO2xOwA=;
        b=NBIP8Qkp3P+7Apoye79IAKEtBeHU9UNkIJivOGO3YU2QZNCOTFuEFsc9SrOekLtujG
         GcAVzjauRXeULfkGJA/4dEibNVpg2Ezo4Z83M95IskGmYGGnOVbETaCaV4VkMU1A05Kj
         4khHDhqi2vV7G58f8LghBiUcUJb0lsbuxdCBKj0CHcY3ZctZDDIS/JcPQQK6JoX9hcKT
         R4/bksgeJ/trkLKYLKP7edt0LGErksDpNb61ejtMM/8DckaY9DN7E1elAxykAB5Kla3a
         3uiyScDLq8l1W4/6qcbohqP68dTkwYovGjGxnvjm0zLyALR9lHVTH0D6ddamM+hZdGyC
         hVQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763478544; x=1764083344;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GTDHw2weO1AUBfmHmJK8dwo4mfz5EckyJJgzqO2xOwA=;
        b=PpxkAIy+/xsPrfWJMWq7LkZ2HkoAXiRXekf1xxwAOnPyQQn9xk0ZlV2q4l95Xa9tqw
         qlyPjIV7pIN0BnAJ1I3b9Hdjd5kFO22XjNWury8HSmEcEMoL6dZJKFufcj49Kj4GHfCJ
         7CI/tMdPl/lJYiIzBvOiWOr12UwDttgvfwygLu2PDl+sH5XOTPGwlbrEjrQ5yfoboQBM
         oihkSu4IEVCH63Zo1MPfp1WsQgSH021mRXuID/pf8UKp2NJnINM073zbb9uX8/rB2Mom
         JW0PX4vOh4ajblThFZblsd3N8fjlJXX5S2H3/vfaX2l6+7vWuB/gJW0rhnAC7Oz8iTC6
         dV2A==
X-Gm-Message-State: AOJu0Yxugq930fAbm/8Pzyb7e8n0vnDKesJ5nRwgVBXnnvoW4lVsHZOs
	lJfZUpIL8nJRC5PXqeQaoaxe2PYWgy66Hf9gLpk8/l2YyRqUB4gM8+pBKk4IVH+NqE1XQIZ6AAn
	rW1g=
X-Gm-Gg: ASbGncs3U1QXuToBKaOfR2vVQs6YLjaqMWxdOG1XqF+40fMJgT7y5U2ZI1UgwclyMC7
	106D3vnMJbj1dBAxvdiB7fP+iYlY85E3z0dDSlzHSfrVbRKuoL6P1QeEOKBk75nRFteaEMMQSkN
	2JONW/IqxR2Kaj/92R/FYpz+ZejE3Nz8Awq33vei8865H20lbi7ZtEaqeDtj0CUlBVHmge9Dm+X
	WvpIOqT6qT4x+1WX4R7yMCXOxBi/evnSorUf8rcX0RL6ZzIJulbq3WfTlfd8OdAbe6Wls+cPI9/
	ZNcgTIHdYOTecuGCWk1R+r82/O7bX7B7ppXsa4ZIV8ewNZ2AqWcEp19GvKnTp28L2Vl3tB44zVf
	EkUOb+pVB2y/Yp3jkNgLxsqRRfsR5NJNTvul4F3hMtSEef6UEsUYQ+fxwBH6WyYyhElZF8t6e3Z
	YXum3VgxxcByqEfpkwk419W+YcNLzfhjoiLEooA7i8BHLuCoB5uy3/kKjGcbtI7AGCBd4GODytY
	QFL5IsIXERBcw==
X-Google-Smtp-Source: AGHT+IG3BCZghm7TEjUUuD1BxyRHTbjbFWeuzyTzfuwgLhtPozzm+QKLrPoqRE7cBld2KTh8wnJTKw==
X-Received: by 2002:a17:907:7eaa:b0:b76:2d96:6c28 with SMTP id a640c23a62f3a-b762d966d88mr158348966b.24.1763478544425;
        Tue, 18 Nov 2025 07:09:04 -0800 (PST)
Message-ID: <c0ed26a0-6e34-4aab-ad7d-44b9f596b1e9@suse.com>
Date: Tue, 18 Nov 2025 16:09:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 8/8] x86/cpufreq: use host CPU policy in HWP driver
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>
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

There's no need to invoke CPUID yet another time. This way two of the
static booleans can also go away.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

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
@@ -183,29 +178,25 @@ static bool __init hwp_available(void)
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
+                host_cpu_policy.basic.pm.hwp,
+                host_cpu_policy.basic.pm.hwp_notification,
+                host_cpu_policy.basic.pm.hwp_activity_window,
+                host_cpu_policy.basic.pm.hwp_epp,
+                host_cpu_policy.basic.pm.hwp_plr,
+                host_cpu_policy.basic.pm.hwp_peci);
 
-    if ( !(eax & CPUID6_EAX_HWP) )
+    if ( !host_cpu_policy.basic.pm.hwp )
         return false;
 
-    if ( !(eax & CPUID6_EAX_HWP_ENERGY_PERFORMANCE_PREFERENCE) )
+    if ( !host_cpu_policy.basic.pm.hwp_epp )
     {
         hwp_verbose("disabled: No energy/performance preference available");
 
         return false;
     }
 
-    feature_hwp_notification    = eax & CPUID6_EAX_HWP_NOTIFICATION;
-    feature_hwp_activity_window = eax & CPUID6_EAX_HWP_ACTIVITY_WINDOW;
-    feature_hdc                 = eax & CPUID6_EAX_HDC;
+    feature_hdc                 = host_cpu_policy.basic.pm.hdc;
 
     hwp_verbose("Hardware Duty Cycling (HDC) %ssupported%s\n",
                 feature_hdc ? "" : "not ",
@@ -213,7 +204,7 @@ static bool __init hwp_available(void)
                             : "");
 
     hwp_verbose("HW_FEEDBACK %ssupported\n",
-                (eax & CPUID6_EAX_HW_FEEDBACK) ? "" : "not ");
+                host_cpu_policy.basic.pm.hw_feedback ? "" : "not ");
 
     hwp_in_use = true;
 
@@ -226,7 +217,8 @@ static int cf_check hwp_cpufreq_verify(s
 {
     struct hwp_drv_data *data = per_cpu(hwp_drv_data, policy->cpu);
 
-    if ( !feature_hwp_activity_window && data->activity_window )
+    if ( !host_cpu_policy.basic.pm.hwp_activity_window &&
+         data->activity_window )
     {
         hwp_verbose("HWP activity window not supported\n");
 
@@ -268,7 +260,7 @@ static int cf_check hwp_cpufreq_target(s
     hwp_req.max_perf = data->maximum;
     hwp_req.desired = data->desired;
     hwp_req.energy_perf = data->energy_perf;
-    if ( feature_hwp_activity_window )
+    if ( host_cpu_policy.basic.pm.hwp_activity_window )
         hwp_req.activity_window = data->activity_window;
 
     if ( hwp_req.raw == data->curr_req.raw )
@@ -365,7 +357,7 @@ static void cf_check hwp_init_msrs(void
     }
 
     /* Ensure we don't generate interrupts */
-    if ( feature_hwp_notification )
+    if ( host_cpu_policy.basic.pm.hwp_notification )
         wrmsr_safe(MSR_HWP_INTERRUPT, 0);
 
     if ( !(val & PM_ENABLE_HWP_ENABLE) )
@@ -537,7 +529,8 @@ int get_hwp_para(unsigned int cpu,
         return -ENODATA;
 
     cppc_para->features         =
-        (feature_hwp_activity_window ? XEN_SYSCTL_CPPC_FEAT_ACT_WINDOW : 0);
+        (host_cpu_policy.basic.pm.hwp_activity_window
+         ? XEN_SYSCTL_CPPC_FEAT_ACT_WINDOW : 0);
     cppc_para->lowest           = data->hw.lowest;
     cppc_para->lowest_nonlinear = data->hw.most_efficient;
     cppc_para->nominal          = data->hw.guaranteed;
@@ -585,7 +578,7 @@ int set_hwp_para(struct cpufreq_policy *
 
     /* Clear out activity window if lacking HW supported. */
     if ( (set_cppc->set_params & XEN_SYSCTL_CPPC_SET_ACT_WINDOW) &&
-         !feature_hwp_activity_window )
+         !host_cpu_policy.basic.pm.hwp_activity_window )
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


