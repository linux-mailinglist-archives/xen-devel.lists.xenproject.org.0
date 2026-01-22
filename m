Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBiQDADxcWlKZwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 10:42:24 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A019064B21
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 10:42:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210599.1522240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1virCg-0000P2-HS; Thu, 22 Jan 2026 09:42:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210599.1522240; Thu, 22 Jan 2026 09:42:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1virCg-0000NJ-ET; Thu, 22 Jan 2026 09:42:14 +0000
Received: by outflank-mailman (input) for mailman id 1210599;
 Thu, 22 Jan 2026 09:42:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1virCe-0000Cq-BI
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 09:42:12 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f1d9ebf-f776-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 10:42:10 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-42fed090e5fso489641f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jan 2026 01:42:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43569921dddsm45228367f8f.6.2026.01.22.01.42.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jan 2026 01:42:08 -0800 (PST)
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
X-Inumbo-ID: 9f1d9ebf-f776-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769074929; x=1769679729; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+LBvT2kvUK3KCeIm+D2kNPm3jZj59Qe7BGo6Y0fvc0k=;
        b=ZQ7RTcvJWN/9IWjMf0le5/e1893FOvXUdmt6HIq+6SeBW0bcNFkojfNvnlLoAjIPNs
         Fz1WyR9eb1oR2d7NRUEOABbgcDgs5E5fSWT1rDmgjHsAL3ta2stdzT/Cja/GQxH2+Qze
         Ho9NyaXP4VU5GzIkBNCi4mDTxRfywJSAJgVxlK7YsWmOcnz3LfhYvAvQfHzmvYfFnKFY
         txCcxp+7WQdUCdnw9BFaI2WHxAqW2VwXmY9B+dGMVAxxwOuV7Nz7Yiw48oCSXubqLNLo
         iGHsjoH+pIV+73AHsaKrCbsWQzsJ+W5hZIz9+xFa34rfspZwL7Z2HsQCr3lrwWw9jwJA
         0NHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769074929; x=1769679729;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+LBvT2kvUK3KCeIm+D2kNPm3jZj59Qe7BGo6Y0fvc0k=;
        b=KjC+RjN2t+h1Lhn8hs5dLlHuJl3IusPHGJZPnI6tvC0BlhtuCHLWyrZLRGbqI3hENf
         vPyr9/oNGa/3GqVoaAQfUnTR5w2V6+Mkps/ZheA+i11XVxcmafjnDbF99FBXVuYdYbgM
         4Pe9UzfkxT45h1Bt1YtueVWsEzeaTmzLknk5LGpKb8YisN+pTd9Gg5Uz722gXeJgW9sq
         2gTnFNRWGj6f2BdqVvRKc6a5/dfwJVX96a4SJIXeAAhowv2+RVwekLmFZ7H7QK0k6E8L
         XjVkTA52jjqCz/X6BOdGb+AGpitJ7gI9qknbfZXy/r4J4jU6YAEL3feNIqpVj4gukeDl
         e2Zw==
X-Gm-Message-State: AOJu0YyLFmOh6aZtWzutGDWjM8LQsLlMP1DZsCaCdoqESB/k5EZxv5Oh
	itRHZtF64yicd9l/22UAL0cmrTYgPQEhu2w4pR5dbUmZnOUSibVEZwim5sKNfE+64M/P/GxVaRH
	OSnY=
X-Gm-Gg: AZuq6aISpUGEvU/hDxWdK5cyErne06KZ18GDbK7qbpnOYgLRmwHkljY0qzKmgHUhgdd
	AB2xJWis44ZSXYWe896GaOGwy/DQu7EKQBsLWBjgI6M4WeB3fxORZBmhOqowjHUtxXvS5V75rnZ
	lcyMKvGqzCXvTNYTP2ckuObkBWV8VaikxMGh1R/467gqZdOWZK1gba/tW0ri25utUT7pu9xML+4
	7zUJjBJEe3KcdVJqskDlJQ4BSkQ9WyL9fCMKF+EtdUu++ABBXkT545BPLZ6CQAPgnxf3dPY3Keb
	lTQ+qjPRZ4v1tFyIyBNs8c3X9ckfMIWedxlbxWRzPFqRxYVRBraxEJJ6eitWOqLRQI/3jRfJ0Q9
	SJwdpcN6ZQO1R95VqZbtK5DIjvRC1iZ0JjPg7VHyfS7E6IudyDaa6fDU4PkCo5Cf6CYNB2+s8Uh
	MBcjaL/rNtAJBYoVHgoU7uiDY110PkkQ8z8/J3CzP2m8IifzXKjj9G+sQCoAPz9uFhnkvoqmtfk
	uQ=
X-Received: by 2002:a05:6000:430d:b0:435:95dc:b8ca with SMTP id ffacd0b85a97d-43595dcbaacmr11899384f8f.40.1769074929068;
        Thu, 22 Jan 2026 01:42:09 -0800 (PST)
Message-ID: <d242f611-b91e-4cfa-b4d6-bebf11b282df@suse.com>
Date: Thu, 22 Jan 2026 10:42:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/5] cpufreq: eliminate cpufreq_drv_data[]
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <ac56e199-7c03-4e97-8238-91d23b0391e2@suse.com>
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
In-Reply-To: <ac56e199-7c03-4e97-8238-91d23b0391e2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,suse.com:dkim,suse.com:mid];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: A019064B21
X-Rspamd-Action: no action

Possibly many slots of it may be unused (all of them when the HWP or CPPC
drivers are in use), as it's always strictly associated with the CPU
recorded in a policy (irrespective of that CPU intermediately being taken
offline). It is shared by all CPUs sharing a policy. We could therefore
put the respective pointers in struct cpufreq_policy, but even that level
of indirection is pointless. Embed the driver data structure directly in
the policy one.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Re-base, use union.

--- a/xen/arch/x86/acpi/cpufreq/acpi.c
+++ b/xen/arch/x86/acpi/cpufreq/acpi.c
@@ -174,17 +174,18 @@ static u32 get_cur_val(const cpumask_t *
         return 0;
 
     policy = per_cpu(cpufreq_cpu_policy, cpu);
-    if (!policy || !cpufreq_drv_data[policy->cpu])
+    if ( !policy )
         return 0;
 
-    switch (cpufreq_drv_data[policy->cpu]->arch_cpu_flags) {
+    switch ( policy->drv_data.acpi.arch_cpu_flags )
+    {
     case SYSTEM_INTEL_MSR_CAPABLE:
         cmd.type = SYSTEM_INTEL_MSR_CAPABLE;
         cmd.addr.msr.reg = MSR_IA32_PERF_STATUS;
         break;
     case SYSTEM_IO_CAPABLE:
         cmd.type = SYSTEM_IO_CAPABLE;
-        perf = cpufreq_drv_data[policy->cpu]->acpi_data;
+        perf = policy->drv_data.acpi.acpi_data;
         cmd.addr.io.port = perf->control_register.address;
         cmd.addr.io.bit_width = perf->control_register.bit_width;
         break;
@@ -210,9 +211,8 @@ static unsigned int cf_check get_cur_fre
     if (!policy)
         return 0;
 
-    data = cpufreq_drv_data[policy->cpu];
-    if (unlikely(data == NULL ||
-        data->acpi_data == NULL || data->freq_table == NULL))
+    data = &policy->drv_data.acpi;
+    if ( !data->acpi_data || !data->freq_table )
         return 0;
 
     return extract_freq(get_cur_val(cpumask_of(cpu)), data);
@@ -252,7 +252,7 @@ static int cf_check acpi_cpufreq_target(
     struct cpufreq_policy *policy,
     unsigned int target_freq, unsigned int relation)
 {
-    struct acpi_cpufreq_data *data = cpufreq_drv_data[policy->cpu];
+    struct acpi_cpufreq_data *data = &policy->drv_data.acpi;
     struct processor_performance *perf;
     struct cpufreq_freqs freqs;
     cpumask_t online_policy_cpus;
@@ -262,10 +262,8 @@ static int cf_check acpi_cpufreq_target(
     unsigned int j;
     int result = 0;
 
-    if (unlikely(data == NULL ||
-        data->acpi_data == NULL || data->freq_table == NULL)) {
+    if ( !data->acpi_data || !data->freq_table )
         return -ENODEV;
-    }
 
     if (policy->turbo == CPUFREQ_TURBO_DISABLED)
         if (target_freq > policy->cpuinfo.second_max_freq)
@@ -331,11 +329,9 @@ static int cf_check acpi_cpufreq_target(
 
 static int cf_check acpi_cpufreq_verify(struct cpufreq_policy *policy)
 {
-    struct acpi_cpufreq_data *data;
     struct processor_performance *perf;
 
-    if (!policy || !(data = cpufreq_drv_data[policy->cpu]) ||
-        !processor_pminfo[policy->cpu])
+    if ( !policy || !processor_pminfo[policy->cpu] )
         return -EINVAL;
 
     perf = &processor_pminfo[policy->cpu]->perf;
@@ -343,7 +339,8 @@ static int cf_check acpi_cpufreq_verify(
     cpufreq_verify_within_limits(policy, 0,
         perf->states[perf->platform_limit].core_frequency * 1000);
 
-    return cpufreq_frequency_table_verify(policy, data->freq_table);
+    return cpufreq_frequency_table_verify(policy,
+                                          policy->drv_data.acpi.freq_table);
 }
 
 static unsigned long
@@ -379,17 +376,11 @@ static int cf_check acpi_cpufreq_cpu_ini
     unsigned int i;
     unsigned int valid_states = 0;
     unsigned int cpu = policy->cpu;
-    struct acpi_cpufreq_data *data;
+    struct acpi_cpufreq_data *data = &policy->drv_data.acpi;
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
@@ -406,23 +397,18 @@ static int cf_check acpi_cpufreq_cpu_ini
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
@@ -480,23 +466,14 @@ static int cf_check acpi_cpufreq_cpu_ini
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
+    XFREE(policy->drv_data.acpi.freq_table);
 
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
+    struct acpi_cpufreq_data *data = &policy->drv_data.acpi;
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
@@ -187,11 +185,9 @@ static void cf_check get_cpu_data(void *
 
 static int cf_check powernow_cpufreq_verify(struct cpufreq_policy *policy)
 {
-    struct acpi_cpufreq_data *data;
     struct processor_performance *perf;
 
-    if (!policy || !(data = cpufreq_drv_data[policy->cpu]) ||
-        !processor_pminfo[policy->cpu])
+    if ( !policy || !processor_pminfo[policy->cpu] )
         return -EINVAL;
 
     perf = &processor_pminfo[policy->cpu]->perf;
@@ -199,7 +195,8 @@ static int cf_check powernow_cpufreq_ver
     cpufreq_verify_within_limits(policy, 0, 
         perf->states[perf->platform_limit].core_frequency * 1000);
 
-    return cpufreq_frequency_table_verify(policy, data->freq_table);
+    return cpufreq_frequency_table_verify(policy,
+                                          policy->drv_data.acpi.freq_table);
 }
 
 static int cf_check powernow_cpufreq_cpu_init(struct cpufreq_policy *policy)
@@ -207,18 +204,12 @@ static int cf_check powernow_cpufreq_cpu
     unsigned int i;
     unsigned int valid_states = 0;
     unsigned int cpu = policy->cpu;
-    struct acpi_cpufreq_data *data;
+    struct acpi_cpufreq_data *data = &policy->drv_data.acpi;
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
@@ -230,8 +221,7 @@ static int cf_check powernow_cpufreq_cpu
         if (cpumask_weight(policy->cpus) != 1) {
             printk(XENLOG_WARNING "Unsupported sharing type %d (%u CPUs)\n",
                    policy->shared_type, cpumask_weight(policy->cpus));
-            result = -ENODEV;
-            goto err_unreg;
+            return -ENODEV;
         }
     } else {
         cpumask_copy(policy->cpus, cpumask_of(cpu));
@@ -240,21 +230,16 @@ static int cf_check powernow_cpufreq_cpu
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
@@ -300,23 +285,14 @@ static int cf_check powernow_cpufreq_cpu
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
+    XFREE(policy->drv_data.acpi.freq_table);
 
     return 0;
 }
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -38,8 +38,6 @@ struct acpi_cpufreq_data {
     unsigned int arch_cpu_flags;
 };
 
-extern struct acpi_cpufreq_data *cpufreq_drv_data[NR_CPUS];
-
 struct cpufreq_cpuinfo {
     unsigned int        max_freq;
     unsigned int        second_max_freq;    /* P1 if Turbo Mode is on */
@@ -82,6 +80,10 @@ struct cpufreq_policy {
                                  * -1 for disable, 1 for enabled
                                  * See CPUFREQ_TURBO_* below for defines */
     unsigned int        policy; /* CPUFREQ_POLICY_* */
+
+    union {
+        struct acpi_cpufreq_data acpi;
+    }                   drv_data;
 };
 DECLARE_PER_CPU(struct cpufreq_policy *, cpufreq_cpu_policy);
 


