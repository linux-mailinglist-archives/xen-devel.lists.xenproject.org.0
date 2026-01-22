Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDeBMRbxcWlKZwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 10:42:46 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F2D64B36
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 10:42:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210605.1522252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1virD1-0000qC-Uu; Thu, 22 Jan 2026 09:42:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210605.1522252; Thu, 22 Jan 2026 09:42:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1virD1-0000nJ-Qe; Thu, 22 Jan 2026 09:42:35 +0000
Received: by outflank-mailman (input) for mailman id 1210605;
 Thu, 22 Jan 2026 09:42:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1virD1-0000n5-6R
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 09:42:35 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac6b6b62-f776-11f0-b15e-2bf370ae4941;
 Thu, 22 Jan 2026 10:42:32 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-435a517be33so472792f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jan 2026 01:42:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4356997e664sm39449748f8f.30.2026.01.22.01.42.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jan 2026 01:42:31 -0800 (PST)
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
X-Inumbo-ID: ac6b6b62-f776-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769074951; x=1769679751; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9YAbpFp0YVR8E7C5PwaC48OUfTxt5vy1yYtA+A0DwVE=;
        b=NWG42c/AGxEXOQb/sedzm9pwIcypv9/oZBbQlAU+M++XKeWD0LVrKpTi4T8HXyG+bu
         VzyMLfz0t1Xga+eGeb/3AMEyH5tNAjWCf7wZHfCunQ6I3gf6ba293p9YKVc7VgjNBJs4
         JWjE+huUVpBiH38UCHdO8PMQO5it9U2eSA/tXuljzwm5019avzuQXiTrpiV8KNvLF+k6
         ZNL3Z61186UFmYLWpi6+KsVaeCR+kQq33V6PDW/hBgA9lZUEerRBi+FZQvDaH2eTu/SN
         /8YEipnQfiefmRH5OMcTwzVw+RgfE167DCBPRPzwtxW9p1YcTlmaH2OiM9WH/LASIJnv
         lpnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769074951; x=1769679751;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9YAbpFp0YVR8E7C5PwaC48OUfTxt5vy1yYtA+A0DwVE=;
        b=mr5oEXhGYcIQ2UfO44TF/BKIDjAnk6NxUOoTraqPlkJ3R+saNfKutZmvW1bQcfFTco
         vF1RNXn8Nv76Nu3dtIC5T/0gcK4qXkjcOEMG1DV1QWra+HMJW6MBCCiH+3/bnxghlJkQ
         5QnOsqGj0cVvf8LRD1vdswZ/pIPwY/MwtUDPfEFEshdLyHYqD9qPVwYm0J3rHffkwbEl
         pyBottSfLAKrbzdx5yh/9cgjr7woeI5H2a0Uo7tzC+hL3/3DO55a03/sma6siKstLHEr
         AdiIt6C3FKvrTF8flA6Z0MDQd4mIG1Z2jnpOQCH73zncMHympHX83EeS+YCRDr/CSoUz
         KjuA==
X-Gm-Message-State: AOJu0YwMugu+OZYl17S8GZmTx2CP6LeRbx7eBTD3ra76kyMrfghlyUcH
	7AAKEPGzfdEjNDAKQGiB9cIQ6DZJOItxaN/9wRV2DIcMWZ7HW8PXmQnOAxo1c9eeXhBXlpOAtaB
	KZLI=
X-Gm-Gg: AZuq6aKTbZkTRcUK+fJfUI/yeAhXSukA9a071r2dM5dvwr6jhNW/81PgLEuLR/h6/ks
	Ovf1CUSb6rJw4F4kBEHDLCql3tmOj27r4OSLa27x4lM8/ZO8u6Fm70l0JO3SmJMDFwuKUQG6HcO
	VceEjwBcXz/Mnn1ZR+G546GfSp7rrCLelFUUHhp6UqSKcFseU7H3JkXTWFaL8zm/nw2LoAu/8Af
	X7fF4FTvCwhPC4WBsCMpLPEEeKTTiqfo52CBAcIk/uLQ4dk6F8gBMEFBS/6aDgYPx5h/5ESmB3L
	3S7H0+OHTLIEkcmIclz4Fk6BM5HVD8Oahan05vqneN5nxLG2UhLTxLHjbeokpiaYfEwnyYy5DQB
	QRZFAbJ8YtqVd48RrcXjFclv2Tsm35dd4gGDDEz++mWCyInpI9rcQwz4E7oFn+sZXMBEf/NpKf0
	F3xaDGxzSaxwF2G+3H5qk9wwsht8oZIy33XAMowUPEE3/43smD09J64yznnJK1mzX12zI1MOl4G
	5Vn68QFWAEU+g==
X-Received: by 2002:a05:6000:40ce:b0:435:9612:2d3b with SMTP id ffacd0b85a97d-43596122f2amr12716492f8f.44.1769074951391;
        Thu, 22 Jan 2026 01:42:31 -0800 (PST)
Message-ID: <8441ada5-e2ed-4d79-822c-ecf1ce3c9484@suse.com>
Date: Thu, 22 Jan 2026 10:42:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/5] cpufreq/hwp: move driver data into policy
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,s:lists@lfdr.de];
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
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 33F2D64B36
X-Rspamd-Action: no action

Share space with the ACPI and powernow drivers, avoiding a separate
allocation for each CPU. Except for get_hwp_para() all use sites already
have the policy available, and this one function can simply be brought
closer to its sibling set_hwp_para().

This then also eliminates the concern over hwp_cpufreq_cpu_init() being
called for all CPUs, or a CPU going offline that's recorded in
policy->cpu (which would result in accesses of per-CPU data of offline
CPUs).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
hwp_cpufreq_target() still requires policy->cpu to be online, though.

--- a/xen/arch/x86/acpi/cpufreq/hwp.c
+++ b/xen/arch/x86/acpi/cpufreq/hwp.c
@@ -22,50 +22,6 @@ static bool __read_mostly feature_hdc;
 
 static bool __ro_after_init opt_cpufreq_hdc = true;
 
-union hwp_request
-{
-    struct
-    {
-        unsigned int min_perf:8;
-        unsigned int max_perf:8;
-        unsigned int desired:8;
-        unsigned int energy_perf:8;
-        unsigned int activity_window:10;
-        bool package_control:1;
-        unsigned int :16;
-        bool activity_window_valid:1;
-        bool energy_perf_valid:1;
-        bool desired_valid:1;
-        bool max_perf_valid:1;
-        bool min_perf_valid:1;
-    };
-    uint64_t raw;
-};
-
-struct hwp_drv_data
-{
-    union
-    {
-        uint64_t hwp_caps;
-        struct
-        {
-            unsigned int highest:8;
-            unsigned int guaranteed:8;
-            unsigned int most_efficient:8;
-            unsigned int lowest:8;
-            unsigned int :32;
-        } hw;
-    };
-    union hwp_request curr_req;
-    int ret;
-    uint16_t activity_window;
-    uint8_t minimum;
-    uint8_t maximum;
-    uint8_t desired;
-    uint8_t energy_perf;
-};
-static DEFINE_PER_CPU_READ_MOSTLY(struct hwp_drv_data *, hwp_drv_data);
-
 #define hwp_err(cpu, fmt, args...) \
     printk(XENLOG_ERR "HWP: CPU%u error: " fmt, cpu, ## args)
 #define hwp_info(fmt, args...)    printk(XENLOG_INFO "HWP: " fmt, ## args)
@@ -212,7 +168,7 @@ static bool __init hwp_available(void)
 
 static int cf_check hwp_cpufreq_verify(struct cpufreq_policy *policy)
 {
-    struct hwp_drv_data *data = per_cpu(hwp_drv_data, policy->cpu);
+    struct hwp_drv_data *data = &policy->drv_data.hwp;
 
     if ( !cpu_has_hwp_activity_window && data->activity_window )
     {
@@ -226,8 +182,8 @@ static int cf_check hwp_cpufreq_verify(s
 
 static void cf_check hwp_write_request(void *info)
 {
-    const struct cpufreq_policy *policy = info;
-    struct hwp_drv_data *data = this_cpu(hwp_drv_data);
+    struct cpufreq_policy *policy = info;
+    struct hwp_drv_data *data = &policy->drv_data.hwp;
     union hwp_request hwp_req = data->curr_req;
 
     data->ret = 0;
@@ -247,7 +203,7 @@ static int cf_check hwp_cpufreq_target(s
                                        unsigned int relation)
 {
     unsigned int cpu = policy->cpu;
-    struct hwp_drv_data *data = per_cpu(hwp_drv_data, cpu);
+    struct hwp_drv_data *data = &policy->drv_data.hwp;
     /* Zero everything to ensure reserved bits are zero... */
     union hwp_request hwp_req = { .raw = 0 };
 
@@ -338,7 +294,7 @@ static void hwp_get_cpu_speeds(struct cp
 static void cf_check hwp_init_msrs(void *info)
 {
     struct cpufreq_policy *policy = info;
-    struct hwp_drv_data *data = this_cpu(hwp_drv_data);
+    struct hwp_drv_data *data = &policy->drv_data.hwp;
     uint64_t val;
 
     /*
@@ -406,23 +362,15 @@ static int cf_check hwp_cpufreq_cpu_init
     static bool __read_mostly first_run = true;
     static union hwp_request initial_req;
     unsigned int cpu = policy->cpu;
-    struct hwp_drv_data *data;
-
-    data = xzalloc(struct hwp_drv_data);
-    if ( !data )
-        return -ENOMEM;
+    struct hwp_drv_data *data = &policy->drv_data.hwp;
 
     policy->governor = &cpufreq_gov_hwp;
 
-    per_cpu(hwp_drv_data, cpu) = data;
-
     on_selected_cpus(cpumask_of(cpu), hwp_init_msrs, policy, 1);
 
     if ( data->curr_req.raw == -1 )
     {
         hwp_err(cpu, "Could not initialize HWP properly\n");
-        per_cpu(hwp_drv_data, cpu) = NULL;
-        xfree(data);
         return -ENODEV;
     }
 
@@ -450,11 +398,6 @@ static int cf_check hwp_cpufreq_cpu_init
 
 static int cf_check hwp_cpufreq_cpu_exit(struct cpufreq_policy *policy)
 {
-    struct hwp_drv_data *data = per_cpu(hwp_drv_data, policy->cpu);
-
-    per_cpu(hwp_drv_data, policy->cpu) = NULL;
-    xfree(data);
-
     return 0;
 }
 
@@ -467,8 +410,8 @@ static int cf_check hwp_cpufreq_cpu_exit
  */
 static void cf_check hwp_set_misc_turbo(void *info)
 {
-    const struct cpufreq_policy *policy = info;
-    struct hwp_drv_data *data = per_cpu(hwp_drv_data, policy->cpu);
+    struct cpufreq_policy *policy = info;
+    struct hwp_drv_data *data = &policy->drv_data.hwp;
     uint64_t msr;
 
     data->ret = 0;
@@ -499,7 +442,7 @@ static int cf_check hwp_cpufreq_update(u
 {
     on_selected_cpus(cpumask_of(cpu), hwp_set_misc_turbo, policy, 1);
 
-    return per_cpu(hwp_drv_data, cpu)->ret;
+    return policy->drv_data.hwp.ret;
 }
 #endif /* CONFIG_PM_OP */
 
@@ -516,12 +459,12 @@ hwp_cpufreq_driver = {
 };
 
 #ifdef CONFIG_PM_OP
-int get_hwp_para(unsigned int cpu,
+int get_hwp_para(const struct cpufreq_policy *policy,
                  struct xen_get_cppc_para *cppc_para)
 {
-    const struct hwp_drv_data *data = per_cpu(hwp_drv_data, cpu);
+    const struct hwp_drv_data *data = &policy->drv_data.hwp;
 
-    if ( data == NULL )
+    if ( !data->maximum )
         return -ENODATA;
 
     cppc_para->features         =
@@ -542,11 +485,10 @@ int get_hwp_para(unsigned int cpu,
 int set_hwp_para(struct cpufreq_policy *policy,
                  struct xen_set_cppc_para *set_cppc)
 {
-    unsigned int cpu = policy->cpu;
-    struct hwp_drv_data *data = per_cpu(hwp_drv_data, cpu);
+    struct hwp_drv_data *data = &policy->drv_data.hwp;
     bool cleared_act_window = false;
 
-    if ( data == NULL )
+    if ( !data->maximum )
         return -ENOENT;
 
     /* Validate all parameters - Disallow reserved bits. */
--- a/xen/drivers/acpi/pm-op.c
+++ b/xen/drivers/acpi/pm-op.c
@@ -80,10 +80,12 @@ static int read_scaling_available_govern
 static int get_cpufreq_cppc(unsigned int cpu,
                             struct xen_get_cppc_para *cppc_para)
 {
+    const struct cpufreq_policy *policy =
+        per_cpu(cpufreq_cpu_policy, cpu);
     int ret = -ENODEV;
 
-    if ( hwp_active() )
-        ret = get_hwp_para(cpu, cppc_para);
+    if ( policy && hwp_active() )
+        ret = get_hwp_para(policy, cppc_para);
 
     return ret;
 }
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -38,6 +38,42 @@ struct acpi_cpufreq_data {
     unsigned int arch_cpu_flags;
 };
 
+struct hwp_drv_data {
+    union {
+        uint64_t hwp_caps;
+        struct {
+            unsigned int highest:8;
+            unsigned int guaranteed:8;
+            unsigned int most_efficient:8;
+            unsigned int lowest:8;
+            unsigned int :32;
+        } hw;
+    };
+    union hwp_request {
+        struct {
+            unsigned int min_perf:8;
+            unsigned int max_perf:8;
+            unsigned int desired:8;
+            unsigned int energy_perf:8;
+            unsigned int activity_window:10;
+            bool package_control:1;
+            unsigned int :16;
+            bool activity_window_valid:1;
+            bool energy_perf_valid:1;
+            bool desired_valid:1;
+            bool max_perf_valid:1;
+            bool min_perf_valid:1;
+        };
+        uint64_t raw;
+    } curr_req;
+    int ret;
+    uint16_t activity_window;
+    uint8_t minimum;
+    uint8_t maximum;
+    uint8_t desired;
+    uint8_t energy_perf;
+};
+
 struct cpufreq_cpuinfo {
     unsigned int        max_freq;
     unsigned int        second_max_freq;    /* P1 if Turbo Mode is on */
@@ -83,6 +119,7 @@ struct cpufreq_policy {
 
     union {
         struct acpi_cpufreq_data acpi;
+        struct hwp_drv_data hwp;
     }                   drv_data;
 };
 DECLARE_PER_CPU(struct cpufreq_policy *, cpufreq_cpu_policy);
@@ -286,7 +323,7 @@ bool hwp_active(void);
 static inline bool hwp_active(void) { return false; }
 #endif
 
-int get_hwp_para(unsigned int cpu,
+int get_hwp_para(const struct cpufreq_policy *policy,
                  struct xen_get_cppc_para *cppc_para);
 int set_hwp_para(struct cpufreq_policy *policy,
                  struct xen_set_cppc_para *set_cppc);


