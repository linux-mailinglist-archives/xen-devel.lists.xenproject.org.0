Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LkzKjDxcWlKZwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 10:43:12 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BF564B4C
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 10:43:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210618.1522261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1virDU-0001QG-6O; Thu, 22 Jan 2026 09:43:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210618.1522261; Thu, 22 Jan 2026 09:43:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1virDU-0001Ol-1w; Thu, 22 Jan 2026 09:43:04 +0000
Received: by outflank-mailman (input) for mailman id 1210618;
 Thu, 22 Jan 2026 09:43:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1virDS-0000n5-Pp
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 09:43:02 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be0b3283-f776-11f0-b15e-2bf370ae4941;
 Thu, 22 Jan 2026 10:43:01 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-432d256c2e6so672963f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jan 2026 01:43:01 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4358e24cef3sm18577240f8f.0.2026.01.22.01.43.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jan 2026 01:43:00 -0800 (PST)
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
X-Inumbo-ID: be0b3283-f776-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769074981; x=1769679781; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uV5LcusP8Do+2RUwQ8ia4mLDrNFGaesbuxHKzbM03Ek=;
        b=WbezmzfJQrEaY/fpVT29xyQOe8m1VPRviGyI1i5lES6K4MRad4/EOxmTBoTw+3F+px
         aKBJHlXw90NpOots4NuFMbodaOEKp3jJpFfJZd+Rz/+8v6M9zRezm2FyhRvckO0ILD2C
         HPiCATrX9+LDuoC1MWB8tpCphbdqYGmld7173saCGaCZVXc7kV8uKggL4H81vBE68QMY
         mIkUpV9Ev6MTTitSFSa1AgFQi+u0LgP64QegzPe5QGmjtdyFSBmakgdZwGSqRcuFbtcY
         xsGREcAteU1TjQ3fZeYHnRO7HHrRNHY1JQk/Os4zlq7Ot8lcr/vpYOadf2RT2zGdqWDz
         YF7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769074981; x=1769679781;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uV5LcusP8Do+2RUwQ8ia4mLDrNFGaesbuxHKzbM03Ek=;
        b=muhkaso9OkzSrQKs+zJUROm2OBQ0jHh/b3pu3G+RV2812FwUKuDDTcLz5LwtqvKaR6
         KucxDn7skMtZW3x7sZslcekCFPXwpkDqk3kes9KNcEQBIEttF0ipdGuRvTNbekxaF6Yl
         cffZ/HcFPgrIhG8gUvjDeXmMoKPDYxTsTTfHuNc5X0o6l9Dyd8ySWqwUlSR2pLi6KerU
         CELXAZyaJTtZGstfAkewrcMJy3YfjFerSwKwN0Usv7fKCYq04xykPiDUFvRkeDGTeweo
         rr1Crnxk+ivHCSV/jwIywGA5+iTj+2BC036XvGLUGwGWQlovGyDGfA/cPecKqo4BSEyU
         Recg==
X-Gm-Message-State: AOJu0Yzs0DwxziR3HrcqFXK4wRFOch6d31U4S59Jtj5AmEDEphpBdvgf
	ndqC2tvMjjwEbqJz6lSBytxzeVLg4gjOL2bgrp+sAxshys5QWHDJkzGei+evXyPYo/x0LLhE47g
	o5Vw=
X-Gm-Gg: AZuq6aKAMfUGbM20nMwWZdiwgZQYXIrqWfspQZrwWexVuylEnZ3805eRN4XFOrGjYwa
	ty2dMEzpdlvVtS2d6DkcQAht7jyw0usL8yiljWa9hf91cbeavmiuc+zapWC6tKoGRP1YpKMwq/q
	CpCLlqtobOXtSp59qnQq8+s7cOyNRgtToEjdV9AN0qlHQp4vquTMn6Xw+SNZ/RTvm3z6wD5JEe1
	wp6t0KrA2FImXSTH1i6uXyf5OO6ZzYLwOfFF0SsItJmhIrQdqpuBfzMdtOQZwxlcDcvwHz+gNKY
	clTgto9kPkg5zXBKWeUPgnT9Rt+VrYzNJZcu0usKrUsQT7AVerKnB9qq4gyYG8Au3q0erWirUsi
	5rzvDqJTU/gzt0H9W0ZlsFXG9JdG0tJxdud2w+K494Jv10mQtBWfY2SPkYkoDCJpt88V0Ec0vhO
	HL2Z/PbyjrHfjBguiP61aN0uSzzbZcEL1XFDmNVM3uQVsts/gLrlyk7sJTQHiir1CRdUiP9ZjrE
	MY=
X-Received: by 2002:a5d:5cca:0:b0:435:9691:d525 with SMTP id ffacd0b85a97d-4359691d56amr11311318f8f.13.1769074980896;
        Thu, 22 Jan 2026 01:43:00 -0800 (PST)
Message-ID: <519e16df-150a-4336-95dc-b26b8332a884@suse.com>
Date: Thu, 22 Jan 2026 10:42:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 3/5] cpufreq/amd-cppc: move driver data into policy
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Penny Zheng <Penny.Zheng@amd.com>
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:Penny.Zheng@amd.com,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 36BF564B4C
X-Rspamd-Action: no action

Share space with the ACPI, powernow, and HWP drivers, avoiding a separate
allocation for each CPU.

This then also reduces the concern over amd_cppc_cpufreq_cpu_init() being
called for all CPUs, or a CPU going offline that's recorded in policy->cpu
(which would result in accesses of per-CPU data of offline CPUs).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
amd_cppc_cpufreq_target() (together with amd_cppc_write_request()) still
requires policy->cpu to be online, though.

--- a/xen/arch/x86/acpi/cpufreq/amd-cppc.c
+++ b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
@@ -31,81 +31,6 @@
 })
 
 /*
- * Field highest_perf, nominal_perf, lowest_nonlinear_perf, and lowest_perf
- * contain the values read from CPPC capability MSR. They represent the limits
- * of managed performance range as well as the dynamic capability, which may
- * change during processor operation
- * Field highest_perf represents highest performance, which is the absolute
- * maximum performance an individual processor may reach, assuming ideal
- * conditions. This performance level may not be sustainable for long
- * durations and may only be achievable if other platform components
- * are in a specific state; for example, it may require other processors be
- * in an idle state. This would be equivalent to the highest frequencies
- * supported by the processor.
- * Field nominal_perf represents maximum sustained performance level of the
- * processor, assuming ideal operating conditions. All cores/processors are
- * expected to be able to sustain their nominal performance state
- * simultaneously.
- * Field lowest_nonlinear_perf represents Lowest Nonlinear Performance, which
- * is the lowest performance level at which nonlinear power savings are
- * achieved. Above this threshold, lower performance levels should be
- * generally more energy efficient than higher performance levels. So in
- * traditional terms, this represents the P-state range of performance levels.
- * Field lowest_perf represents the absolute lowest performance level of the
- * platform. Selecting it may cause an efficiency penalty but should reduce
- * the instantaneous power consumption of the processor. So in traditional
- * terms, this represents the T-state range of performance levels.
- *
- * Field max_perf, min_perf, des_perf store the values for CPPC request MSR.
- * Software passes performance goals through these fields.
- * Field max_perf conveys the maximum performance level at which the platform
- * may run. And it may be set to any performance value in the range
- * [lowest_perf, highest_perf], inclusive.
- * Field min_perf conveys the minimum performance level at which the platform
- * may run. And it may be set to any performance value in the range
- * [lowest_perf, highest_perf], inclusive but must be less than or equal to
- * max_perf.
- * Field des_perf conveys performance level Xen governor is requesting. And it
- * may be set to any performance value in the range [min_perf, max_perf],
- * inclusive. In active mode, des_perf must be zero.
- * Field epp represents energy performance preference, which only has meaning
- * when active mode is enabled. The EPP is used in the CCLK DPM controller
- * to drive the frequency that a core is going to operate during short periods
- * of activity, called minimum active frequency, It could contatin a range of
- * values from 0 to 0xff. An EPP of zero sets the min active frequency to
- * maximum frequency, while an EPP of 0xff sets the min active frequency to
- * approxiately Idle frequency.
- */
-struct amd_cppc_drv_data
-{
-    const struct xen_processor_cppc *cppc_data;
-    union {
-        uint64_t raw;
-        struct {
-            unsigned int lowest_perf:8;
-            unsigned int lowest_nonlinear_perf:8;
-            unsigned int nominal_perf:8;
-            unsigned int highest_perf:8;
-            unsigned int :32;
-        };
-    } caps;
-    union {
-        uint64_t raw;
-        struct {
-            unsigned int max_perf:8;
-            unsigned int min_perf:8;
-            unsigned int des_perf:8;
-            unsigned int epp:8;
-            unsigned int :32;
-        };
-    } req;
-
-    int err;
-};
-
-static DEFINE_PER_CPU_READ_MOSTLY(struct amd_cppc_drv_data *,
-                                  amd_cppc_drv_data);
-/*
  * Core max frequency read from PstateDef as anchor point
  * for freq-to-perf transition
  */
@@ -279,11 +204,11 @@ static void cf_check amd_cppc_write_requ
     wrmsrl(MSR_AMD_CPPC_REQ, data->req.raw);
 }
 
-static void amd_cppc_write_request(unsigned int cpu, uint8_t min_perf,
-                                   uint8_t des_perf, uint8_t max_perf,
-                                   uint8_t epp)
+static void amd_cppc_write_request(struct cpufreq_policy *policy,
+                                   uint8_t min_perf, uint8_t des_perf,
+                                   uint8_t max_perf, uint8_t epp)
 {
-    struct amd_cppc_drv_data *data = per_cpu(amd_cppc_drv_data, cpu);
+    struct amd_cppc_drv_data *data = &policy->drv_data.amd_cppc;
     uint64_t prev = data->req.raw;
 
     data->req.min_perf = min_perf;
@@ -295,15 +220,15 @@ static void amd_cppc_write_request(unsig
     if ( prev == data->req.raw )
         return;
 
-    on_selected_cpus(cpumask_of(cpu), amd_cppc_write_request_msrs, data, 1);
+    on_selected_cpus(cpumask_of(policy->cpu), amd_cppc_write_request_msrs,
+                     data, 1);
 }
 
 static int cf_check amd_cppc_cpufreq_target(struct cpufreq_policy *policy,
                                             unsigned int target_freq,
                                             unsigned int relation)
 {
-    unsigned int cpu = policy->cpu;
-    const struct amd_cppc_drv_data *data = per_cpu(amd_cppc_drv_data, cpu);
+    const struct amd_cppc_drv_data *data = &policy->drv_data.amd_cppc;
     uint8_t des_perf;
     int res;
 
@@ -320,7 +245,7 @@ static int cf_check amd_cppc_cpufreq_tar
      * may actually cause an efficiency penalty, So when deciding the min_perf
      * value, we prefer lowest nonlinear performance over lowest performance.
      */
-    amd_cppc_write_request(policy->cpu, data->caps.lowest_nonlinear_perf,
+    amd_cppc_write_request(policy, data->caps.lowest_nonlinear_perf,
                            des_perf, data->caps.highest_perf,
                            /* Pre-defined BIOS value for passive mode */
                            per_cpu(epp_init, policy->cpu));
@@ -330,7 +255,7 @@ static int cf_check amd_cppc_cpufreq_tar
 static void cf_check amd_cppc_init_msrs(void *info)
 {
     struct cpufreq_policy *policy = info;
-    struct amd_cppc_drv_data *data = this_cpu(amd_cppc_drv_data);
+    struct amd_cppc_drv_data *data = &policy->drv_data.amd_cppc;
     uint64_t val;
     unsigned int min_freq = 0, nominal_freq = 0, max_freq;
 
@@ -431,24 +356,16 @@ static void amd_cppc_boost_init(struct c
 
 static int cf_check amd_cppc_cpufreq_cpu_exit(struct cpufreq_policy *policy)
 {
-    XVFREE(per_cpu(amd_cppc_drv_data, policy->cpu));
-
     return 0;
 }
 
 static int amd_cppc_cpufreq_init_perf(struct cpufreq_policy *policy)
 {
     unsigned int cpu = policy->cpu;
-    struct amd_cppc_drv_data *data;
-
-    data = xvzalloc(struct amd_cppc_drv_data);
-    if ( !data )
-        return -ENOMEM;
+    struct amd_cppc_drv_data *data = &policy->drv_data.amd_cppc;
 
     data->cppc_data = &processor_pminfo[cpu]->cppc_data;
 
-    per_cpu(amd_cppc_drv_data, cpu) = data;
-
     on_selected_cpus(cpumask_of(cpu), amd_cppc_init_msrs, policy, 1);
 
     /*
@@ -506,8 +423,7 @@ static void amd_cppc_prepare_policy(stru
                                     uint8_t *max_perf, uint8_t *min_perf,
                                     uint8_t *epp)
 {
-    const struct amd_cppc_drv_data *data = per_cpu(amd_cppc_drv_data,
-                                                   policy->cpu);
+    const struct amd_cppc_drv_data *data = &policy->drv_data.amd_cppc;
 
     /*
      * On default, set min_perf with lowest_nonlinear_perf, and max_perf
@@ -560,7 +476,7 @@ static int cf_check amd_cppc_epp_set_pol
 
     amd_cppc_prepare_policy(policy, &max_perf, &min_perf, &epp);
 
-    amd_cppc_write_request(policy->cpu, min_perf,
+    amd_cppc_write_request(policy, min_perf,
                            0 /* no des_perf in active mode */,
                            max_perf, epp);
     return 0;
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -74,6 +74,78 @@ struct hwp_drv_data {
     uint8_t energy_perf;
 };
 
+/*
+ * Field highest_perf, nominal_perf, lowest_nonlinear_perf, and lowest_perf
+ * contain the values read from CPPC capability MSR. They represent the limits
+ * of managed performance range as well as the dynamic capability, which may
+ * change during processor operation
+ * Field highest_perf represents highest performance, which is the absolute
+ * maximum performance an individual processor may reach, assuming ideal
+ * conditions. This performance level may not be sustainable for long
+ * durations and may only be achievable if other platform components
+ * are in a specific state; for example, it may require other processors be
+ * in an idle state. This would be equivalent to the highest frequencies
+ * supported by the processor.
+ * Field nominal_perf represents maximum sustained performance level of the
+ * processor, assuming ideal operating conditions. All cores/processors are
+ * expected to be able to sustain their nominal performance state
+ * simultaneously.
+ * Field lowest_nonlinear_perf represents Lowest Nonlinear Performance, which
+ * is the lowest performance level at which nonlinear power savings are
+ * achieved. Above this threshold, lower performance levels should be
+ * generally more energy efficient than higher performance levels. So in
+ * traditional terms, this represents the P-state range of performance levels.
+ * Field lowest_perf represents the absolute lowest performance level of the
+ * platform. Selecting it may cause an efficiency penalty but should reduce
+ * the instantaneous power consumption of the processor. So in traditional
+ * terms, this represents the T-state range of performance levels.
+ *
+ * Field max_perf, min_perf, des_perf store the values for CPPC request MSR.
+ * Software passes performance goals through these fields.
+ * Field max_perf conveys the maximum performance level at which the platform
+ * may run. And it may be set to any performance value in the range
+ * [lowest_perf, highest_perf], inclusive.
+ * Field min_perf conveys the minimum performance level at which the platform
+ * may run. And it may be set to any performance value in the range
+ * [lowest_perf, highest_perf], inclusive but must be less than or equal to
+ * max_perf.
+ * Field des_perf conveys performance level Xen governor is requesting. And it
+ * may be set to any performance value in the range [min_perf, max_perf],
+ * inclusive. In active mode, des_perf must be zero.
+ * Field epp represents energy performance preference, which only has meaning
+ * when active mode is enabled. The EPP is used in the CCLK DPM controller
+ * to drive the frequency that a core is going to operate during short periods
+ * of activity, called minimum active frequency, It could contatin a range of
+ * values from 0 to 0xff. An EPP of zero sets the min active frequency to
+ * maximum frequency, while an EPP of 0xff sets the min active frequency to
+ * approxiately Idle frequency.
+ */
+struct amd_cppc_drv_data {
+    const struct xen_processor_cppc *cppc_data;
+    union {
+        uint64_t raw;
+        struct {
+            unsigned int lowest_perf:8;
+            unsigned int lowest_nonlinear_perf:8;
+            unsigned int nominal_perf:8;
+            unsigned int highest_perf:8;
+            unsigned int :32;
+        };
+    } caps;
+    union {
+        uint64_t raw;
+        struct {
+            unsigned int max_perf:8;
+            unsigned int min_perf:8;
+            unsigned int des_perf:8;
+            unsigned int epp:8;
+            unsigned int :32;
+        };
+    } req;
+
+    int err;
+};
+
 struct cpufreq_cpuinfo {
     unsigned int        max_freq;
     unsigned int        second_max_freq;    /* P1 if Turbo Mode is on */
@@ -120,6 +192,7 @@ struct cpufreq_policy {
     union {
         struct acpi_cpufreq_data acpi;
         struct hwp_drv_data hwp;
+        struct amd_cppc_drv_data amd_cppc;
     }                   drv_data;
 };
 DECLARE_PER_CPU(struct cpufreq_policy *, cpufreq_cpu_policy);


