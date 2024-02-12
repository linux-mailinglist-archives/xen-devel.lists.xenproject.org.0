Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 138FB8513D6
	for <lists+xen-devel@lfdr.de>; Mon, 12 Feb 2024 13:53:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679568.1057047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZVoY-0003HM-CG; Mon, 12 Feb 2024 12:53:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679568.1057047; Mon, 12 Feb 2024 12:53:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZVoY-0003FP-9Y; Mon, 12 Feb 2024 12:53:38 +0000
Received: by outflank-mailman (input) for mailman id 679568;
 Mon, 12 Feb 2024 12:53:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6iVD=JV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rZVoX-0003FJ-5Q
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2024 12:53:37 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb41ee4b-c9a5-11ee-98f5-efadbce2ee36;
 Mon, 12 Feb 2024 13:53:34 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-33b960e3b8fso51397f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Feb 2024 04:53:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v9-20020a5d4b09000000b0033b843786e1sm1973101wrq.51.2024.02.12.04.53.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Feb 2024 04:53:34 -0800 (PST)
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
X-Inumbo-ID: bb41ee4b-c9a5-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707742414; x=1708347214; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gnaXKYsqx4CnSa2eo1JbWiq89d/Jw0i23q5wGyWRgbc=;
        b=KeJf1p5pfk9h8ebY9OnKDYvFrjgj6zx7bho1RQnE30Y5gTP7CBbdhDGekv3EqaWU/6
         7p4OKrxnqRXoZG0ni8PgrA+hBQ1HzUbxKml+KDRJLHkVDiNYXTyCdUN/NByufEgWwuPp
         umF5BQ+2RS29+ON9HDZnX5SDsY4I6W1F35KJy+mU/4p+0Qu7c4GaRRN6n7SAItw8j3NS
         LTcciUdAWkwbzA/3Yw9WqE/MIJo3QnliW4elrrmPduOw3dQjbqzCu2HuAirOteklLXtb
         vbyJTjbatDyVCuizu08WlhemCk3A5HLXA/2VeH1U/Y3GSNg2PAd/cyfwGoP/IG+HVmNJ
         uM7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707742414; x=1708347214;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gnaXKYsqx4CnSa2eo1JbWiq89d/Jw0i23q5wGyWRgbc=;
        b=H/JxARpgCQWM8R0GOfao2mVLm004pFMoihf9QhIosVuwqmN2H/CPJY0FunjQmf4+9k
         Y6ujhnwPUosvrLGsSAfcahANxHa5GJRKSk8hw/a3Fpg/H0zfy0W98OETeeoiPg7uei+z
         Lqqn2rYVoR+Vqh7IdV0Zt1RlQroJ0z61jN13MP0uXjfFGPwoumJhSdJEPiTjXM9Qd44n
         6gBVhn7x9rQHw8UwM0Qdm2Apmj37y0nq/G6WY4lYOZe771P2CQd6XyTSRPw6T+wKkE14
         prCmoBkp1R0YYsfTD2cKD5l8a6UGC/hj3pBfJdVsrwzbO0spg1e0gvbRRF8N2Ft+VQvD
         39uQ==
X-Gm-Message-State: AOJu0YxQP0HM+sun7Lz9QFMrPAopdg9uTATcrhN09x9ROqd601lbW86w
	nyRjTs8P8XJZ9BFRKwxNN3WW+I2ayLbFvCRlS37S5sxDGbBKxR688CSdJS9fP65WLaiwkDecOP0
	=
X-Google-Smtp-Source: AGHT+IH9e8X3xpPzR5iMc18oxKPa1rgHP4+2e41uFq18jBhg4QQQjj0sEJ7GicSTGEPvifwctQ8Fmg==
X-Received: by 2002:a05:6000:12ce:b0:33b:14f8:7331 with SMTP id l14-20020a05600012ce00b0033b14f87331mr4359069wrx.4.1707742414367;
        Mon, 12 Feb 2024 04:53:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWs+UAElik26OQ7RClJIH1gUUq4z4NF/7jYzfGkiaLL0aUky03fnC69655YmBGr1vT5WBMIQboJp06qd7HPH2R+mCLTHrvGDD1WQUjCT6UZOw==
Message-ID: <f89d1c20-1967-451e-a6dc-510421604427@suse.com>
Date: Mon, 12 Feb 2024 13:53:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/2] x86/CPU: re-work populating of cpu_data[]
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <4c4ff91e-ce66-428f-a360-6ffc55659e79@suse.com>
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
In-Reply-To: <4c4ff91e-ce66-428f-a360-6ffc55659e79@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Forever since its introduction x86_mc_get_cpu_info() has been checking a
structure field against BAD_APICID which would never have been set to
that particular value. Arrange for this to actually be true ahead of
CPU detection having run, which then also includes pruning after CPU
removal.

For this,
- introduce a new helper function splitting reset logic out of
  identify_cpu(), and going slightly farther than the original code to
  achieve consistent results,
- introduce a new helper macro for both initializing and resetting
  various fields.

For boot_cpu_data this in particular means that cpuid_level will no
longer be set to the bogus value of -1. Even before removal of 32-bit
support we already assumed basic CPUID leaves to be available.

Furthermore make sure initialize_cpu_data() doesn't populate fields with
BSP's values which clearly aren't going to be applicable to APs.

Fixes: e16fc5ba591c ("x86: mce: Provide extended physical CPU info")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -413,6 +413,19 @@ void __init early_cpu_init(bool verbose)
 	initialize_cpu_data(0);
 }
 
+void reset_cpuinfo(struct cpuinfo_x86 *c, bool keep_basic)
+{
+	if (!keep_basic) {
+		c->x86 = c->x86_vendor = 0;	/* So far unknown... */
+		c->x86_model = c->x86_mask = 0;	/* So far unknown... */
+		memset(&c->x86_capability, 0, sizeof(c->x86_capability));
+		memset(&c->x86_vendor_id, 0, sizeof(c->x86_vendor_id));
+		memset(&c->x86_model_id, 0, sizeof(c->x86_model_id));
+	}
+
+	CPU_DATA_INIT((*c));
+}
+
 static void generic_identify(struct cpuinfo_x86 *c)
 {
 	u32 eax, ebx, ecx, edx, tmp;
@@ -518,16 +531,7 @@ void identify_cpu(struct cpuinfo_x86 *c)
 {
 	int i;
 
-	c->x86_cache_size = -1;
-	c->x86_model = c->x86_mask = 0;	/* So far unknown... */
-	c->x86_model_id[0] = '\0';  /* Unset */
-	c->x86_max_cores = 1;
-	c->x86_num_siblings = 1;
-	c->x86_clflush_size = 0;
-	c->cpu_core_id = XEN_INVALID_CORE_ID;
-	c->compute_unit_id = INVALID_CUID;
-	memset(&c->x86_capability, 0, sizeof c->x86_capability);
-
+	reset_cpuinfo(c, false);
 	generic_identify(c);
 
 #ifdef NOISY_CAPS
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -40,6 +40,24 @@ struct cpuinfo_x86 {
     unsigned short x86_clflush_size;
 } __cacheline_aligned;
 
+#define CPU_DATA_INIT(what...)                     \
+        what.cpuid_level = 1,                      \
+        what.extended_cpuid_level = 0,             \
+        what.x86_cache_size = -1,                  \
+        what.x86_max_cores = 1,                    \
+        what.x86_num_siblings = 1,                 \
+        what.apicid = BAD_APICID,                  \
+        what.phys_proc_id = XEN_INVALID_SOCKET_ID, \
+        what.cpu_core_id = XEN_INVALID_CORE_ID,    \
+        what.compute_unit_id = INVALID_CUID
+
+/*
+ * @keep_basic set to true retains data firmly assumed to be symmetric
+ * across all CPUs.  With it set to false only CPU_DATA_INIT() will be
+ * invoked on the passed structure.
+ */
+void reset_cpuinfo(struct cpuinfo_x86 *c, bool keep_basic);
+
 extern struct cpuinfo_x86 boot_cpu_data;
 
 static inline bool cpu_has(const struct cpuinfo_x86 *info, unsigned int feat)
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -157,7 +157,7 @@ void *stack_start = cpu0_stack + STACK_S
 /* Used by the boot asm to stash the relocated multiboot info pointer. */
 unsigned int asmlinkage __initdata multiboot_ptr;
 
-struct cpuinfo_x86 __read_mostly boot_cpu_data = { 0, 0, 0, 0, -1 };
+struct cpuinfo_x86 __read_mostly boot_cpu_data = { CPU_DATA_INIT() };
 
 unsigned long __read_mostly mmu_cr4_features = XEN_MINIMAL_CR4;
 
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -61,7 +61,8 @@ unsigned int __read_mostly nr_sockets;
 cpumask_t **__read_mostly socket_cpumask;
 static cpumask_t *secondary_socket_cpumask;
 
-struct cpuinfo_x86 cpu_data[NR_CPUS];
+struct cpuinfo_x86 __read_mostly cpu_data[NR_CPUS] =
+    { [0 ... NR_CPUS - 1] = { CPU_DATA_INIT() } };
 
 u32 x86_cpu_to_apicid[NR_CPUS] __read_mostly =
 	{ [0 ... NR_CPUS-1] = BAD_APICID };
@@ -81,7 +82,12 @@ void *stack_base[NR_CPUS];
 
 void initialize_cpu_data(unsigned int cpu)
 {
-    cpu_data[cpu] = boot_cpu_data;
+    struct cpuinfo_x86 c = boot_cpu_data;
+
+    /* Must not partially clear the BSP's collected data. */
+    if ( cpu || system_state > SYS_STATE_smp_boot )
+        reset_cpuinfo(&c, true);
+    cpu_data[cpu] = c;
 }
 
 static bool smp_store_cpu_info(unsigned int id)
@@ -954,7 +960,6 @@ static void cleanup_cpu_root_pgt(unsigne
 static void cpu_smpboot_free(unsigned int cpu, bool remove)
 {
     unsigned int socket = cpu_to_socket(cpu);
-    struct cpuinfo_x86 *c = cpu_data;
 
     if ( cpumask_empty(socket_cpumask[socket]) )
     {
@@ -966,9 +971,7 @@ static void cpu_smpboot_free(unsigned in
 
     if ( remove )
     {
-        c[cpu].phys_proc_id = XEN_INVALID_SOCKET_ID;
-        c[cpu].cpu_core_id = XEN_INVALID_CORE_ID;
-        c[cpu].compute_unit_id = INVALID_CUID;
+        reset_cpuinfo(&cpu_data[cpu], false);
 
         FREE_CPUMASK_VAR(per_cpu(cpu_sibling_mask, cpu));
         FREE_CPUMASK_VAR(per_cpu(cpu_core_mask, cpu));


