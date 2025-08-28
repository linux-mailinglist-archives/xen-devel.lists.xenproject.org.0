Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D57FCB39B6D
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 13:23:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098463.1452515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uraiN-0005zo-Hr; Thu, 28 Aug 2025 11:22:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098463.1452515; Thu, 28 Aug 2025 11:22:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uraiN-0005yK-ET; Thu, 28 Aug 2025 11:22:47 +0000
Received: by outflank-mailman (input) for mailman id 1098463;
 Thu, 28 Aug 2025 11:22:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pYI3=3I=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uraiM-0005yE-Gf
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 11:22:46 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51044f91-8401-11f0-ae26-e363de0e7a9e;
 Thu, 28 Aug 2025 13:22:44 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-afcb7ace3baso138158066b.3
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 04:22:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afef7ae440dsm9984066b.15.2025.08.28.04.22.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 04:22:42 -0700 (PDT)
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
X-Inumbo-ID: 51044f91-8401-11f0-ae26-e363de0e7a9e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756380163; x=1756984963; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nBCVT5U94Er3pg7O9/74HcAnrt+R1bIOSOvLf3bbG8Y=;
        b=dJ3UwlmHvj5YKg6mJPycPR4DmP92gm2u6ulsY3RkEPeBE0MjhpkHZB8w+iVjkFR/uu
         0CNx6N7gGt2+1T0+ob40a1sX2u/1nqsUll6gCrcE6xboai1VpgU/fOTUw1/gdoHmp4gd
         qPV+zlU5+v0bGVJ8IoWkyBGVKgJJAvp9xOrcoHYz6XT3spWYx8UrviS4ValyTIX0BzkR
         qXAJrUoOuyQUEY708t2kAI9G56QBWRi+JoxEQzHCVMyYd7sKCreP7HeZ/Nsm0t58C8e6
         +u7qxtqQaDyGrug7eXaqO3yjk5JmXTQaLWnNaEw4Gok81Up5WAVGNQXLPN4Tj/Phr+n7
         SiNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756380163; x=1756984963;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nBCVT5U94Er3pg7O9/74HcAnrt+R1bIOSOvLf3bbG8Y=;
        b=QRRWpM2hjY5aIqclvyqlfEHY2bqGR5Kl8vdGVbxlIk+JHf/QTuojcQdoQlgyy11tnC
         zRqvdSGffILvwO5gyxnW2oJT49ACzjbEDM5opXEph7/CGYctXRQqkJMprCbYRd+xtJ80
         74Vw8m0LjYnQk+XF0Z5wklWqRdEJQbrigSGuGTPLIgnu2t32G6uYcWh3LHFXcxDv+rqh
         3f3YK7s2HSoMm6L/KrmdhJJrHcphJN5r1R6TzYymILiVP4JwdyPIOPL1JDK8b1a0RDvB
         vkhSbx0iMUWT4Ei6rOvHAP1BXtredVTlxkdV1isxE0G/jKcgtQ5piaAHuYRwpaRhr5dk
         Jv9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXET1olI9I9EsBJr4g5ISObUWVG243hOhC4cuMPql1q1vveYRtmtXGHTXF3pBuUD7+gWnmpG91AELk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyseIE19Cj2uUOtHIQzbmd+ikjchLFSj0/0ie1axImxcCoQbCXK
	NZi0xuj4lslfEDdHKSnbeM0MlYCaHKC67jG5P5z63C0n3KGdDhbudHh0elTWot+pHw==
X-Gm-Gg: ASbGncsEjlr2o4mseOazZpGdJvStnZG6hb8cNVUdAFWxtf1DWYaMN3sBvRLsVv6aeFQ
	tGHfVXfweey0gQCCP/C6NU6dGeb0YEVp0Yg8GNtcKuHH2WtTm8KNK+zdYAFtpIu+DaaTwhAJxtU
	KNl40GCcALghhWJwO2QRAVw0m3fcxOUhkGKTpZwA61Bol9zvaHcrEL8mb0y6UV/aFup8XQtOvZe
	sbjn9njeJnPHC0wEAwiNicjlK4k4TJSD63O1v1yNHX1ZbrIgVsHKckQiCUFo3w5o2kJmUW0IlS6
	5gl/4LnHTe4YXF0HRSNqNdg6CgidA0HFmafn1wq5qBzbcEjucEBCeGqhQ1O2dEQxKG6iuC91Cee
	YHlD7qmq3hJaadJ7YHAV43z/MMQSy8kLnKXSnsN4QLwfJxpsX5kPg3ePe/zB5HKD0q3L4jTmIww
	a1l2zpDROCyUxQaKfidw==
X-Google-Smtp-Source: AGHT+IF35LgoQS/DsKAz81cTp6qGwPeqvNkwfHW3rl0rODbDgb6AwoEfsXyeLbYaXgeiWIspwWKJbA==
X-Received: by 2002:a17:907:805:b0:afd:d993:9f2b with SMTP id a640c23a62f3a-afe29638000mr2174948666b.65.1756380163143;
        Thu, 28 Aug 2025 04:22:43 -0700 (PDT)
Message-ID: <b2712815-97c2-4473-bcf6-aae8517aad37@suse.com>
Date: Thu, 28 Aug 2025 13:22:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/8] xen/cpufreq: implement amd-cppc driver for CPPC in
 passive mode
To: Penny Zheng <Penny.Zheng@amd.com>, Jason Andryuk <jason.andryuk@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250828100306.1776031-1-Penny.Zheng@amd.com>
 <20250828100306.1776031-4-Penny.Zheng@amd.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <20250828100306.1776031-4-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.08.2025 12:03, Penny Zheng wrote:
> +static int cf_check amd_cppc_cpufreq_target(struct cpufreq_policy *policy,
> +                                            unsigned int target_freq,
> +                                            unsigned int relation)
> +{
> +    unsigned int cpu = policy->cpu;
> +    const struct amd_cppc_drv_data *data = per_cpu(amd_cppc_drv_data, cpu);

I fear there's a problem here that I so far overlooked. As it happens, just
yesterday I made a patch to eliminate cpufreq_drv_data[] global. In the
course of doing so it became clear that in principle the CPU denoted by
policy->cpu can be offline. Hence its per-CPU data is also unavailable. See
cpufreq_add_cpu()'s invocation of .init() and cpufreq_del_cpu()'s invocation
of .exit(). Is there anything well-hidden (and likely lacking some suitable
comment) which guarantees that no two CPUs (threads) will be in the same
domain? If not, I fear you simply can't use per-CPU data here.

Since initially I was thinking of using per-CPU data also in my patch, I'm
reproducing this in raw form below, for your reference. It's generally only
4.22 material now, of course. Yet in turn for your driver the new drv_data
field may want to become a union, with an "acpi" and a "cppc" sub-struct.
And possibly a "hwp" one: Jason, looks like the HWP driver has a similar
issue (unless again something guarantees that no two CPUs / threads will
be in the same domain).

Jan

cpufreq: eliminate cpufreq_drv_data[]

Possibly many slots of it may be unused (all of them when the HWP or CPPC
drivers are in use), as it's always strictly associated with the CPU
recorded in a policy (irrespective of that CPU intermediately being taken
offline). It is shared by all CPUs sharing a policy. We could therefore
put the respective pointers in struct cpufreq_policy, but even that level
of indirection is pointless. Embed the driver data structure directly in
the policy one.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/acpi/cpufreq/acpi.c
+++ b/xen/arch/x86/acpi/cpufreq/acpi.c
@@ -174,17 +174,18 @@ static u32 get_cur_val(const cpumask_t *
         return 0;
 
     policy = per_cpu(cpufreq_cpu_policy, cpu);
-    if (!policy || !cpufreq_drv_data[policy->cpu])
+    if ( !policy )
         return 0;
 
-    switch (cpufreq_drv_data[policy->cpu]->arch_cpu_flags) {
+    switch ( policy->drv_data.arch_cpu_flags )
+    {
     case SYSTEM_INTEL_MSR_CAPABLE:
         cmd.type = SYSTEM_INTEL_MSR_CAPABLE;
         cmd.addr.msr.reg = MSR_IA32_PERF_STATUS;
         break;
     case SYSTEM_IO_CAPABLE:
         cmd.type = SYSTEM_IO_CAPABLE;
-        perf = cpufreq_drv_data[policy->cpu]->acpi_data;
+        perf = policy->drv_data.acpi_data;
         cmd.addr.io.port = perf->control_register.address;
         cmd.addr.io.bit_width = perf->control_register.bit_width;
         break;
@@ -210,9 +211,8 @@ static unsigned int cf_check get_cur_fre
     if (!policy)
         return 0;
 
-    data = cpufreq_drv_data[policy->cpu];
-    if (unlikely(data == NULL ||
-        data->acpi_data == NULL || data->freq_table == NULL))
+    data = &policy->drv_data;
+    if ( !data->acpi_data || !data->freq_table )
         return 0;
 
     return extract_freq(get_cur_val(cpumask_of(cpu)), data);
@@ -255,7 +255,7 @@ static int cf_check acpi_cpufreq_target(
     struct cpufreq_policy *policy,
     unsigned int target_freq, unsigned int relation)
 {
-    struct acpi_cpufreq_data *data = cpufreq_drv_data[policy->cpu];
+    struct acpi_cpufreq_data *data = &policy->drv_data;
     struct processor_performance *perf;
     struct cpufreq_freqs freqs;
     cpumask_t online_policy_cpus;
@@ -265,10 +265,8 @@ static int cf_check acpi_cpufreq_target(
     unsigned int j;
     int result = 0;
 
-    if (unlikely(data == NULL ||
-        data->acpi_data == NULL || data->freq_table == NULL)) {
+    if ( !data->acpi_data || !data->freq_table )
         return -ENODEV;
-    }
 
     if (policy->turbo == CPUFREQ_TURBO_DISABLED)
         if (target_freq > policy->cpuinfo.second_max_freq)
@@ -334,11 +332,9 @@ static int cf_check acpi_cpufreq_target(
 
 static int cf_check acpi_cpufreq_verify(struct cpufreq_policy *policy)
 {
-    struct acpi_cpufreq_data *data;
     struct processor_performance *perf;
 
-    if (!policy || !(data = cpufreq_drv_data[policy->cpu]) ||
-        !processor_pminfo[policy->cpu])
+    if ( !policy || !processor_pminfo[policy->cpu] )
         return -EINVAL;
 
     perf = &processor_pminfo[policy->cpu]->perf;
@@ -346,7 +342,7 @@ static int cf_check acpi_cpufreq_verify(
     cpufreq_verify_within_limits(policy, 0,
         perf->states[perf->platform_limit].core_frequency * 1000);
 
-    return cpufreq_frequency_table_verify(policy, data->freq_table);
+    return cpufreq_frequency_table_verify(policy, policy->drv_data.freq_table);
 }
 
 static unsigned long
@@ -382,17 +378,11 @@ static int cf_check acpi_cpufreq_cpu_ini
     unsigned int i;
     unsigned int valid_states = 0;
     unsigned int cpu = policy->cpu;
-    struct acpi_cpufreq_data *data;
+    struct acpi_cpufreq_data *data = &policy->drv_data;
     unsigned int result = 0;
     struct cpuinfo_x86 *c = &cpu_data[policy->cpu];
     struct processor_performance *perf;
 
-    data = xzalloc(struct acpi_cpufreq_data);
-    if (!data)
-        return -ENOMEM;
-
-    cpufreq_drv_data[cpu] = data;
-
     data->acpi_data = &processor_pminfo[cpu]->perf;
 
     perf = data->acpi_data;
@@ -409,23 +399,18 @@ static int cf_check acpi_cpufreq_cpu_ini
         if (cpufreq_verbose)
             printk("xen_pminfo: @acpi_cpufreq_cpu_init,"
                    "HARDWARE addr space\n");
-        if (!cpu_has(c, X86_FEATURE_EIST)) {
-            result = -ENODEV;
-            goto err_unreg;
-        }
+        if ( !cpu_has(c, X86_FEATURE_EIST) )
+            return -ENODEV;
         data->arch_cpu_flags = SYSTEM_INTEL_MSR_CAPABLE;
         break;
     default:
-        result = -ENODEV;
-        goto err_unreg;
+        return -ENODEV;
     }
 
     data->freq_table = xmalloc_array(struct cpufreq_frequency_table,
                                     (perf->state_count+1));
-    if (!data->freq_table) {
-        result = -ENOMEM;
-        goto err_unreg;
-    }
+    if ( !data->freq_table )
+        return -ENOMEM;
 
     /* detect transition latency */
     policy->cpuinfo.transition_latency = 0;
@@ -483,23 +468,14 @@ static int cf_check acpi_cpufreq_cpu_ini
     return result;
 
 err_freqfree:
-    xfree(data->freq_table);
-err_unreg:
-    xfree(data);
-    cpufreq_drv_data[cpu] = NULL;
+    XFREE(data->freq_table);
 
     return result;
 }
 
 static int cf_check acpi_cpufreq_cpu_exit(struct cpufreq_policy *policy)
 {
-    struct acpi_cpufreq_data *data = cpufreq_drv_data[policy->cpu];
-
-    if (data) {
-        cpufreq_drv_data[policy->cpu] = NULL;
-        xfree(data->freq_table);
-        xfree(data);
-    }
+    XFREE(policy->drv_data.freq_table);
 
     return 0;
 }
--- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
+++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
@@ -35,8 +35,6 @@
 
 #include <acpi/cpufreq/cpufreq.h>
 
-struct acpi_cpufreq_data *cpufreq_drv_data[NR_CPUS];
-
 struct perf_pair {
     union {
         struct {
--- a/xen/arch/x86/acpi/cpufreq/powernow.c
+++ b/xen/arch/x86/acpi/cpufreq/powernow.c
@@ -84,16 +84,14 @@ static int cf_check powernow_cpufreq_tar
     struct cpufreq_policy *policy,
     unsigned int target_freq, unsigned int relation)
 {
-    struct acpi_cpufreq_data *data = cpufreq_drv_data[policy->cpu];
+    struct acpi_cpufreq_data *data = &policy->drv_data;
     struct processor_performance *perf;
     unsigned int next_state; /* Index into freq_table */
     unsigned int next_perf_state; /* Index into perf table */
     int result;
 
-    if (unlikely(data == NULL ||
-        data->acpi_data == NULL || data->freq_table == NULL)) {
+    if ( !data->acpi_data || !data->freq_table )
         return -ENODEV;
-    }
 
     perf = data->acpi_data;
     result = cpufreq_frequency_table_target(policy,
@@ -185,11 +183,9 @@ static void cf_check get_cpu_data(void *
 
 static int cf_check powernow_cpufreq_verify(struct cpufreq_policy *policy)
 {
-    struct acpi_cpufreq_data *data;
     struct processor_performance *perf;
 
-    if (!policy || !(data = cpufreq_drv_data[policy->cpu]) ||
-        !processor_pminfo[policy->cpu])
+    if ( !policy || !processor_pminfo[policy->cpu] )
         return -EINVAL;
 
     perf = &processor_pminfo[policy->cpu]->perf;
@@ -197,7 +193,7 @@ static int cf_check powernow_cpufreq_ver
     cpufreq_verify_within_limits(policy, 0, 
         perf->states[perf->platform_limit].core_frequency * 1000);
 
-    return cpufreq_frequency_table_verify(policy, data->freq_table);
+    return cpufreq_frequency_table_verify(policy, policy->drv_data.freq_table);
 }
 
 static int cf_check powernow_cpufreq_cpu_init(struct cpufreq_policy *policy)
@@ -205,18 +201,12 @@ static int cf_check powernow_cpufreq_cpu
     unsigned int i;
     unsigned int valid_states = 0;
     unsigned int cpu = policy->cpu;
-    struct acpi_cpufreq_data *data;
+    struct acpi_cpufreq_data *data = &policy->drv_data;
     unsigned int result = 0;
     struct processor_performance *perf;
     struct amd_cpu_data info;
     struct cpuinfo_x86 *c = &cpu_data[policy->cpu];
 
-    data = xzalloc(struct acpi_cpufreq_data);
-    if (!data)
-        return -ENOMEM;
-
-    cpufreq_drv_data[cpu] = data;
-
     data->acpi_data = &processor_pminfo[cpu]->perf;
 
     info.perf = perf = data->acpi_data;
@@ -228,8 +218,7 @@ static int cf_check powernow_cpufreq_cpu
         if (cpumask_weight(policy->cpus) != 1) {
             printk(XENLOG_WARNING "Unsupported sharing type %d (%u CPUs)\n",
                    policy->shared_type, cpumask_weight(policy->cpus));
-            result = -ENODEV;
-            goto err_unreg;
+            return -ENODEV;
         }
     } else {
         cpumask_copy(policy->cpus, cpumask_of(cpu));
@@ -238,21 +227,16 @@ static int cf_check powernow_cpufreq_cpu
     /* capability check */
     if (perf->state_count <= 1) {
         printk("No P-States\n");
-        result = -ENODEV;
-        goto err_unreg;
+        return -ENODEV;
     }
 
-    if (perf->control_register.space_id != perf->status_register.space_id) {
-        result = -ENODEV;
-        goto err_unreg;
-    }
+    if ( perf->control_register.space_id != perf->status_register.space_id )
+        return -ENODEV;
 
     data->freq_table = xmalloc_array(struct cpufreq_frequency_table, 
                                     (perf->state_count+1));
-    if (!data->freq_table) {
-        result = -ENOMEM;
-        goto err_unreg;
-    }
+    if ( !data->freq_table )
+        return -ENOMEM;
 
     /* detect transition latency */
     policy->cpuinfo.transition_latency = 0;
@@ -298,23 +282,14 @@ static int cf_check powernow_cpufreq_cpu
     return result;
 
 err_freqfree:
-    xfree(data->freq_table);
-err_unreg:
-    xfree(data);
-    cpufreq_drv_data[cpu] = NULL;
+    XFREE(data->freq_table);
 
     return result;
 }
 
 static int cf_check powernow_cpufreq_cpu_exit(struct cpufreq_policy *policy)
 {
-    struct acpi_cpufreq_data *data = cpufreq_drv_data[policy->cpu];
-
-    if (data) {
-        cpufreq_drv_data[policy->cpu] = NULL;
-        xfree(data->freq_table);
-        xfree(data);
-    }
+    XFREE(policy->drv_data.freq_table);
 
     return 0;
 }
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -37,8 +37,6 @@ struct acpi_cpufreq_data {
     unsigned int arch_cpu_flags;
 };
 
-extern struct acpi_cpufreq_data *cpufreq_drv_data[NR_CPUS];
-
 struct cpufreq_cpuinfo {
     unsigned int        max_freq;
     unsigned int        second_max_freq;    /* P1 if Turbo Mode is on */
@@ -80,6 +78,8 @@ struct cpufreq_policy {
     int8_t              turbo;  /* tristate flag: 0 for unsupported
                                  * -1 for disable, 1 for enabled
                                  * See CPUFREQ_TURBO_* below for defines */
+
+    struct acpi_cpufreq_data drv_data;
 };
 DECLARE_PER_CPU(struct cpufreq_policy *, cpufreq_cpu_policy);
 


