Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9515F82DD12
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 17:10:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667507.1038843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPPXl-00032O-2M; Mon, 15 Jan 2024 16:10:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667507.1038843; Mon, 15 Jan 2024 16:10:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPPXk-0002zu-Vf; Mon, 15 Jan 2024 16:10:32 +0000
Received: by outflank-mailman (input) for mailman id 667507;
 Mon, 15 Jan 2024 16:10:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jLm1=IZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rPPXk-0002zm-2E
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 16:10:32 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ae09a34-b3c0-11ee-98f1-6d05b1d4d9a1;
 Mon, 15 Jan 2024 17:10:31 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40e80046275so3534555e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jan 2024 08:10:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 w4-20020a05600c474400b0040d5ae2906esm20362467wmo.30.2024.01.15.08.10.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jan 2024 08:10:30 -0800 (PST)
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
X-Inumbo-ID: 9ae09a34-b3c0-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705335030; x=1705939830; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=456YmwaT9Rl3xgCUF6lbVnWv3VMNT1WQ1BadiNTovWw=;
        b=Yf59KvUWgkLxjKcwvlHwCMPH5zbYpbLdpPFtA+50Up4s9zAP3WItyQPm/pgFPQWYDr
         7RbDvL/602wrfiqZv6HnWsSRVCx47QP2bsEI6v66xPUaXyP0qc52TeYCQpiObepJXsg9
         moCk1RltgdzoJHl8Eb3RYDJd9yi057BueElci3hbbFif0r2dAJI/cTRN7avezDuqATao
         ZcJ3Zg1aBxblLtiFREbum1FV8kl/ODgOET35lSR6JI5pOcGBK8uqhbg4vH3cYBcO3SUO
         jZEisua5BM2sda5RuNtEuIQ/ULEqmQMniZru/c/HqLnkwgw+xjwX2fduujuE0QgpsJK3
         0gZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705335030; x=1705939830;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=456YmwaT9Rl3xgCUF6lbVnWv3VMNT1WQ1BadiNTovWw=;
        b=Kox2QNsjXQE0leE/ioXtnPBPTq8B6eJzm5mFRI/RLZBd3aKjPAh/hJTYKfX9qb3YkV
         1AriZqilfH67st5xu+YNd8K0lF27BYgkkHDBtHI6K2zpSTUda3lt8uhpV+GFPu7fxsNt
         nhjUX+WVM6WHjicY8xcGE9BS8hyoteoFu9vnlLOONKnhtxyFYbKnzybWef+Ck+asbfXs
         +2FOYOrMFzqxvq1rz0UqkXNt7733BVkqsg3A0b/Vw4CU/FpGwX2jMGDHWO0bhrSUVFY1
         qmJ+AcM72dzKdpNGeCsKL+XoqL7KTsY1ZQGebSmntoQPbzDb6ijg6kuHOQoR7Em2dRCL
         whog==
X-Gm-Message-State: AOJu0YzKuNA92zbLZkxUroRoeXatMv4vZuOGR+kcSrqTVpR1f7Y+/Ogz
	/SxUHOt8+ZadgrP/yMvcqFAqveDl2tB4zq0lYxaDXLG8dA==
X-Google-Smtp-Source: AGHT+IHl/ew3hmE1ckXT5XY+62em/zIbhXOxeOcQsNGB/uZVgd6z/OmdqKjwK4hs/u9I3X+/VQE4qg==
X-Received: by 2002:a7b:c457:0:b0:40e:6703:cfb1 with SMTP id l23-20020a7bc457000000b0040e6703cfb1mr3196617wmi.15.1705335030476;
        Mon, 15 Jan 2024 08:10:30 -0800 (PST)
Message-ID: <7da816ba-f5bd-491c-a6a8-b750e3ff2222@suse.com>
Date: Mon, 15 Jan 2024 17:10:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] cpufreq: finish genapic conversion to altcall
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Even functions used on infrequently executed paths want converting: This
way all pre-filled struct cpufreq_driver instances can become
__initconst_cf_clobber, thus allowing to eliminate another 15 ENDBR
during the 2nd phase of alternatives patching.

For acpi-cpufreq's optionally populated .get hook make sure alternatives
patching can actually see the pointer. See also the code comment.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Instead of adjusting the call site, we could also purge the .setpolicy
hook: None of the three drivers actually implements it.

--- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
+++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
@@ -625,12 +625,14 @@ static int cf_check acpi_cpufreq_cpu_exi
     return 0;
 }
 
-static const struct cpufreq_driver __initconstrel acpi_cpufreq_driver = {
+static const struct cpufreq_driver __initconst_cf_clobber
+acpi_cpufreq_driver = {
     .name   = "acpi-cpufreq",
     .verify = acpi_cpufreq_verify,
     .target = acpi_cpufreq_target,
     .init   = acpi_cpufreq_cpu_init,
     .exit   = acpi_cpufreq_cpu_exit,
+    .get    = get_cur_freq_on_cpu,
 };
 
 static int __init cf_check cpufreq_driver_init(void)
@@ -675,6 +677,19 @@ static int __init cf_check cpufreq_drive
 }
 presmp_initcall(cpufreq_driver_init);
 
+static int __init cf_check cpufreq_driver_late_init(void)
+{
+    /*
+     * While acpi_cpufreq_driver wants to unconditionally have all hooks
+     * populated for __initconst_cf_clobber to have as much of an effect as
+     * possible, zap the .get hook here (but not in cpufreq_driver_init()),
+     * until acpi_cpufreq_cpu_init() knows whether it's wanted / needed.
+     */
+    cpufreq_driver.get = NULL;
+    return 0;
+}
+__initcall(cpufreq_driver_late_init);
+
 int cpufreq_cpu_init(unsigned int cpuid)
 {
     int ret;
--- a/xen/arch/x86/acpi/cpufreq/hwp.c
+++ b/xen/arch/x86/acpi/cpufreq/hwp.c
@@ -513,8 +513,8 @@ static int cf_check hwp_cpufreq_update(i
     return per_cpu(hwp_drv_data, cpuid)->ret;
 }
 
-static const struct cpufreq_driver __initconstrel hwp_cpufreq_driver =
-{
+static const struct cpufreq_driver __initconst_cf_clobber
+hwp_cpufreq_driver = {
     .name   = XEN_HWP_DRIVER_NAME,
     .verify = hwp_cpufreq_verify,
     .target = hwp_cpufreq_target,
--- a/xen/arch/x86/acpi/cpufreq/powernow.c
+++ b/xen/arch/x86/acpi/cpufreq/powernow.c
@@ -317,7 +317,8 @@ static int cf_check powernow_cpufreq_cpu
     return 0;
 }
 
-static const struct cpufreq_driver __initconstrel powernow_cpufreq_driver = {
+static const struct cpufreq_driver __initconst_cf_clobber
+powernow_cpufreq_driver = {
     .name   = "powernow",
     .verify = powernow_cpufreq_verify,
     .target = powernow_cpufreq_target,
--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -240,7 +240,8 @@ static int get_cpufreq_para(struct xen_s
         return ret;
 
     op->u.get_para.cpuinfo_cur_freq =
-        cpufreq_driver.get ? cpufreq_driver.get(op->cpuid) : policy->cur;
+        cpufreq_driver.get ? alternative_call(cpufreq_driver.get, op->cpuid)
+                           : policy->cur;
     op->u.get_para.cpuinfo_max_freq = policy->cpuinfo.max_freq;
     op->u.get_para.cpuinfo_min_freq = policy->cpuinfo.min_freq;
     op->u.get_para.turbo_enabled = cpufreq_get_turbo_status(op->cpuid);
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -278,7 +278,7 @@ int cpufreq_add_cpu(unsigned int cpu)
         policy->cpu = cpu;
         per_cpu(cpufreq_cpu_policy, cpu) = policy;
 
-        ret = cpufreq_driver.init(policy);
+        ret = alternative_call(cpufreq_driver.init, policy);
         if (ret) {
             free_cpumask_var(policy->cpus);
             xfree(policy);
@@ -337,7 +337,7 @@ err1:
     cpumask_clear_cpu(cpu, cpufreq_dom->map);
 
     if (cpumask_empty(policy->cpus)) {
-        cpufreq_driver.exit(policy);
+        alternative_call(cpufreq_driver.exit, policy);
         free_cpumask_var(policy->cpus);
         xfree(policy);
     }
@@ -401,7 +401,7 @@ int cpufreq_del_cpu(unsigned int cpu)
     cpumask_clear_cpu(cpu, cpufreq_dom->map);
 
     if (cpumask_empty(policy->cpus)) {
-        cpufreq_driver.exit(policy);
+        alternative_call(cpufreq_driver.exit, policy);
         free_cpumask_var(policy->cpus);
         xfree(policy);
     }
--- a/xen/drivers/cpufreq/utility.c
+++ b/xen/drivers/cpufreq/utility.c
@@ -413,7 +413,7 @@ int cpufreq_update_turbo(int cpuid, int
     policy->turbo = new_state;
     if (cpufreq_driver.update)
     {
-        ret = cpufreq_driver.update(cpuid, policy);
+        ret = alternative_call(cpufreq_driver.update, cpuid, policy);
         if (ret)
             policy->turbo = curr_state;
     }
@@ -449,7 +449,7 @@ int __cpufreq_set_policy(struct cpufreq_
         return -EINVAL;
 
     /* verify the cpu speed can be set within this limit */
-    ret = cpufreq_driver.verify(policy);
+    ret = alternative_call(cpufreq_driver.verify, policy);
     if (ret)
         return ret;
 
@@ -457,7 +457,7 @@ int __cpufreq_set_policy(struct cpufreq_
     data->max = policy->max;
     data->limits = policy->limits;
     if (cpufreq_driver.setpolicy)
-        return cpufreq_driver.setpolicy(data);
+        return alternative_call(cpufreq_driver.setpolicy, data);
 
     if (policy->governor != data->governor) {
         /* save old, working values */

