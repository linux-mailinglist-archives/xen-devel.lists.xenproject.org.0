Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B29983025D
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jan 2024 10:33:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668314.1040407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ2I6-0004Lb-Vb; Wed, 17 Jan 2024 09:32:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668314.1040407; Wed, 17 Jan 2024 09:32:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ2I6-0004JL-SA; Wed, 17 Jan 2024 09:32:58 +0000
Received: by outflank-mailman (input) for mailman id 668314;
 Wed, 17 Jan 2024 09:32:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yGoF=I3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rQ2I4-0004Iu-Ua
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2024 09:32:57 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 648cb47f-b51b-11ee-98f2-6d05b1d4d9a1;
 Wed, 17 Jan 2024 10:32:55 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40e60e135a7so50873605e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jan 2024 01:32:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fa6-20020a05600c518600b0040e861ad5d2sm3904323wmb.0.2024.01.17.01.32.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jan 2024 01:32:54 -0800 (PST)
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
X-Inumbo-ID: 648cb47f-b51b-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705483975; x=1706088775; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RtlXf3QLKiIdchH2atleU3qQRRjIu99YEXalKK/8Bak=;
        b=hClzWmlFJyIRGNRwjIkAlp9oDuD+3XDuziDV5+XEOI8hymncCbqpCHjKsN74jHgsbN
         gluvdDiKb3go0hzuV+df05uXVAWbmuj9Gs7wix5W2YevwEupua/zyQxfhyy4XNLWjV+2
         eyHUKWvkIKUM8bDIMZ2aesWF80DygnSrI4I8HLvjscmzbsbK2PUMPOzxTbqG4vuNR+5S
         aIGR9oDI7DUaEabeDYH3ZJ9mwRD3aIsTrwwzft3YWp9oqul3TZlVK6ts3hytaXNC5uX/
         plI7ZCP6QEWKhS0V0JnWcsrL3jBU8OSsCB1KdshLoIjPvpHJP59s7pmoBg5M5SzQeGQ4
         lZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705483975; x=1706088775;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RtlXf3QLKiIdchH2atleU3qQRRjIu99YEXalKK/8Bak=;
        b=SHKL2o8IoYbHwwISl4CJ7tMhlYCh1Zy5oITuEGdBP25Qrpx7ABwXr4eYzDbFMElKcg
         sDg5e6ZS/W9VYjTPXUwQOmhn8V77vA6FnCzJkOOTr2PlayhIYoSbUbsPFfLcSha/Ov3o
         vG3rm2G/+NutkeO8PDWnZcaNf19e1AkYkiGrOJolx63jj61wE4/reQDZ3eDS9DGg8vpC
         rIm3qzT4V9UbOsfdxmsmznDLgCsJFo/UQboNBxdjz5/k08eQJExs8nK2oP2YyVymBLGo
         Sct/O4HXQIRyM90awRal7l5Ih5Ae4beWic2HicPsam39+8AyKSMperE082YbdZJhoC6v
         pckw==
X-Gm-Message-State: AOJu0Yy0NAlQRL9MigeAGEyB8waXawBI6IjukdK+nnND/yANlg6oHis3
	Z0wkVCqQXswtKUkM6YZklHCa5W0Wdni2KhOshcuTi5fB1g==
X-Google-Smtp-Source: AGHT+IHSc7ajaTsFLUTdTznqL3hsdsnxwzM2c6JfxGkaV4jJRdniRIXHdzOrsJ9rfWEg6s3tmawXaA==
X-Received: by 2002:a05:600c:198c:b0:40e:7734:ead4 with SMTP id t12-20020a05600c198c00b0040e7734ead4mr2824050wmq.123.1705483974871;
        Wed, 17 Jan 2024 01:32:54 -0800 (PST)
Message-ID: <f5c8e38c-66cb-4f21-b66b-056061e37383@suse.com>
Date: Wed, 17 Jan 2024 10:32:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/MTRR: avoid several indirect calls
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

The use of (supposedly) vendor-specific hooks is a relic from the days
when Xen was still possible to build as 32-bit binary. There's no
expectation that a new need for such an abstraction would arise. Convert
mttr_if to a mere boolean and all prior calls through it to direct ones,
thus allowing to eliminate 6 ENDBR from .text.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Strictly speaking mtrr_if could go apparently away as well, for
effectively mirroring cpu_has_mtrr now (once mtrr_bp_init() has run).
Replacing the variable uses would be further code churn, though.

--- a/xen/arch/x86/cpu/mtrr/generic.c
+++ b/xen/arch/x86/cpu/mtrr/generic.c
@@ -287,7 +287,7 @@ static void set_fixed_range(int msr, boo
 	}
 }
 
-int cf_check generic_get_free_region(
+int mtrr_get_free_region(
     unsigned long base, unsigned long size, int replace_reg)
 /*  [SUMMARY] Get a free MTRR.
     <base> The starting (base) address of the region.
@@ -303,14 +303,14 @@ int cf_check generic_get_free_region(
 	if (replace_reg >= 0 && replace_reg < max)
 		return replace_reg;
 	for (i = 0; i < max; ++i) {
-		mtrr_if->get(i, &lbase, &lsize, &ltype);
+		mtrr_get(i, &lbase, &lsize, &ltype);
 		if (lsize == 0)
 			return i;
 	}
 	return -ENOSPC;
 }
 
-static void cf_check generic_get_mtrr(
+void mtrr_get(
     unsigned int reg, unsigned long *base, unsigned long *size, mtrr_type *type)
 {
 	uint64_t _mask, _base;
@@ -500,7 +500,7 @@ static void post_set(bool pge)
 	spin_unlock(&set_atomicity_lock);
 }
 
-static void cf_check generic_set_all(void)
+void mtrr_set_all(void)
 {
 	unsigned long mask, count;
 	unsigned long flags;
@@ -523,7 +523,7 @@ static void cf_check generic_set_all(voi
 	}
 }
 
-static void cf_check generic_set_mtrr(
+void mtrr_set(
     unsigned int reg, unsigned long base, unsigned long size, mtrr_type type)
 /*  [SUMMARY] Set variable MTRR register on the local CPU.
     <reg> The register to set.
@@ -567,7 +567,7 @@ static void cf_check generic_set_mtrr(
 	local_irq_restore(flags);
 }
 
-int cf_check generic_validate_add_page(
+int mtrr_validate_add_page(
     unsigned long base, unsigned long size, unsigned int type)
 {
 	unsigned long lbase, last;
@@ -586,21 +586,9 @@ int cf_check generic_validate_add_page(
 }
 
 
-static int cf_check generic_have_wrcomb(void)
+bool mtrr_have_wrcomb(void)
 {
 	unsigned long config;
 	rdmsrl(MSR_MTRRcap, config);
 	return (config & (1ULL << 10));
 }
-
-/* generic structure...
- */
-const struct mtrr_ops generic_mtrr_ops = {
-	.use_intel_if      = true,
-	.set_all	   = generic_set_all,
-	.get               = generic_get_mtrr,
-	.get_free_region   = generic_get_free_region,
-	.set               = generic_set_mtrr,
-	.validate_add_page = generic_validate_add_page,
-	.have_wrcomb       = generic_have_wrcomb,
-};
--- a/xen/arch/x86/cpu/mtrr/main.c
+++ b/xen/arch/x86/cpu/mtrr/main.c
@@ -57,7 +57,7 @@ static DEFINE_MUTEX(mtrr_mutex);
 u64 __read_mostly size_or_mask;
 u64 __read_mostly size_and_mask;
 
-const struct mtrr_ops *__read_mostly mtrr_if = NULL;
+static bool __ro_after_init mtrr_if;
 
 static void set_mtrr(unsigned int reg, unsigned long base,
 		     unsigned long size, mtrr_type type);
@@ -78,23 +78,12 @@ static const char *mtrr_attrib_to_str(in
 	return (x <= 6) ? mtrr_strings[x] : "?";
 }
 
-/*  Returns non-zero if we have the write-combining memory type  */
-static int have_wrcomb(void)
-{
-	return (mtrr_if->have_wrcomb ? mtrr_if->have_wrcomb() : 0);
-}
-
 /*  This function returns the number of variable MTRRs  */
 static void __init set_num_var_ranges(void)
 {
-	unsigned long config = 0;
+	unsigned long config;
 
-	if (use_intel()) {
-		rdmsrl(MSR_MTRRcap, config);
-	} else if (is_cpu(AMD))
-		config = 2;
-	else if (is_cpu(CENTAUR))
-		config = 8;
+	rdmsrl(MSR_MTRRcap, config);
 	num_var_ranges = MASK_EXTR(config, MTRRcap_VCNT);
 }
 
@@ -149,10 +138,10 @@ static void cf_check ipi_handler(void *i
 	if (data->smp_reg == ~0U) /* update all mtrr registers */
 		/* At the cpu hot-add time this will reinitialize mtrr 
  		 * registres on the existing cpus. It is ok.  */
-		mtrr_if->set_all();
+		mtrr_set_all();
 	else /* single mtrr register update */
-		mtrr_if->set(data->smp_reg, data->smp_base, 
-			     data->smp_size, data->smp_type);
+		mtrr_set(data->smp_reg, data->smp_base,
+			 data->smp_size, data->smp_type);
 
 	atomic_dec(&data->count);
 	while(atomic_read(&data->gate))
@@ -198,10 +187,9 @@ static inline int types_compatible(mtrr_
  * of CPUs. As each CPU disables interrupts, it'll decrement it once. We wait
  * until it hits 0 and proceed. We set the data.gate flag and reset data.count.
  * Meanwhile, they are waiting for that flag to be set. Once it's set, each 
- * CPU goes through the transition of updating MTRRs. The CPU vendors may each do it 
- * differently, so we call mtrr_if->set() callback and let them take care of it.
- * When they're done, they again decrement data->count and wait for data.gate to 
- * be reset. 
+ * CPU goes through the transition of updating MTRRs.
+ * When mtrr_set() is done, they again decrement data->count and wait for
+ * data.gate to be reset.
  * When we finish, we wait for data.count to hit 0 and toggle the data.gate flag.
  * Everyone then enables interrupts and we all continue on.
  *
@@ -251,9 +239,9 @@ static void set_mtrr(unsigned int reg, u
 	if (reg == ~0U)  /* update all mtrr registers */
 		/* at boot or resume time, this will reinitialize the mtrrs on 
 		 * the bp. It is ok. */
-		mtrr_if->set_all();
+		mtrr_set_all();
 	else /* update the single mtrr register */
-		mtrr_if->set(reg,base,size,type);
+		mtrr_set(reg, base, size, type);
 
 	/* wait for the others */
 	while (atomic_read(&data.count))
@@ -319,7 +307,7 @@ int mtrr_add_page(unsigned long base, un
 	if (!mtrr_if)
 		return -ENXIO;
 		
-	if ((error = mtrr_if->validate_add_page(base,size,type)))
+	if ((error = mtrr_validate_add_page(base, size, type)))
 		return error;
 
 	if (type >= MTRR_NUM_TYPES) {
@@ -328,7 +316,7 @@ int mtrr_add_page(unsigned long base, un
 	}
 
 	/*  If the type is WC, check that this processor supports it  */
-	if ((type == X86_MT_WC) && !have_wrcomb()) {
+	if ((type == X86_MT_WC) && mtrr_have_wrcomb()) {
 		printk(KERN_WARNING
 		       "mtrr: your processor doesn't support write-combining\n");
 		return -EOPNOTSUPP;
@@ -350,7 +338,7 @@ int mtrr_add_page(unsigned long base, un
 	/*  Search for existing MTRR  */
 	mutex_lock(&mtrr_mutex);
 	for (i = 0; i < num_var_ranges; ++i) {
-		mtrr_if->get(i, &lbase, &lsize, &ltype);
+		mtrr_get(i, &lbase, &lsize, &ltype);
 		if (!lsize || base > lbase + lsize - 1 || base + size - 1 < lbase)
 			continue;
 		/*  At this point we know there is some kind of overlap/enclosure  */
@@ -385,7 +373,7 @@ int mtrr_add_page(unsigned long base, un
 		goto out;
 	}
 	/*  Search for an empty MTRR  */
-	i = mtrr_if->get_free_region(base, size, replace);
+	i = mtrr_get_free_region(base, size, replace);
 	if (i >= 0) {
 		set_mtrr(i, base, size, type);
 		if (likely(replace < 0))
@@ -494,7 +482,7 @@ int mtrr_del_page(int reg, unsigned long
 	if (reg < 0) {
 		/*  Search for existing MTRR  */
 		for (i = 0; i < max; ++i) {
-			mtrr_if->get(i, &lbase, &lsize, &ltype);
+			mtrr_get(i, &lbase, &lsize, &ltype);
 			if (lbase == base && lsize == size) {
 				reg = i;
 				break;
@@ -510,7 +498,7 @@ int mtrr_del_page(int reg, unsigned long
 		printk(KERN_WARNING "mtrr: register: %d too big\n", reg);
 		goto out;
 	}
-	mtrr_if->get(reg, &lbase, &lsize, &ltype);
+	mtrr_get(reg, &lbase, &lsize, &ltype);
 	if (lsize < 1) {
 		printk(KERN_WARNING "mtrr: MTRR %d not used\n", reg);
 		goto out;
@@ -568,7 +556,7 @@ struct mtrr_value {
 void __init mtrr_bp_init(void)
 {
 	if (cpu_has_mtrr) {
-		mtrr_if = &generic_mtrr_ops;
+		mtrr_if = true;
 		size_or_mask = ~((1ULL << (paddr_bits - PAGE_SHIFT)) - 1);
 		size_and_mask = ~size_or_mask & 0xfffff00000ULL;
 	}
@@ -576,14 +564,13 @@ void __init mtrr_bp_init(void)
 	if (mtrr_if) {
 		set_num_var_ranges();
 		init_table();
-		if (use_intel())
-			get_mtrr_state();
+		get_mtrr_state();
 	}
 }
 
 void mtrr_ap_init(void)
 {
-	if (!mtrr_if || !use_intel() || hold_mtrr_updates_on_aps)
+	if (!mtrr_if || hold_mtrr_updates_on_aps)
 		return;
 	/*
 	 * Ideally we should hold mtrr_mutex here to avoid mtrr entries changed,
@@ -612,32 +599,25 @@ void mtrr_save_state(void)
 
 void mtrr_aps_sync_begin(void)
 {
-	if (!use_intel())
-		return;
 	hold_mtrr_updates_on_aps = 1;
 }
 
 void mtrr_aps_sync_end(void)
 {
-	if (!use_intel())
-		return;
 	set_mtrr(~0U, 0, 0, 0);
 	hold_mtrr_updates_on_aps = 0;
 }
 
 void mtrr_bp_restore(void)
 {
-	if (!use_intel())
-		return;
-	mtrr_if->set_all();
+	mtrr_set_all();
 }
 
 static int __init cf_check mtrr_init_finialize(void)
 {
 	if (!mtrr_if)
 		return 0;
-	if (use_intel())
-		mtrr_state_warn();
+	mtrr_state_warn();
 	return 0;
 }
 __initcall(mtrr_init_finialize);
--- a/xen/arch/x86/cpu/mtrr/mtrr.h
+++ b/xen/arch/x86/cpu/mtrr/mtrr.h
@@ -6,40 +6,21 @@
 #define MTRR_CHANGE_MASK_VARIABLE  0x02
 #define MTRR_CHANGE_MASK_DEFTYPE   0x04
 
-
-struct mtrr_ops {
-	u32	vendor;
-	bool	use_intel_if;
-//	void	(*init)(void);
-	void	(*set)(unsigned int reg, unsigned long base,
-		       unsigned long size, mtrr_type type);
-	void	(*set_all)(void);
-
-	void	(*get)(unsigned int reg, unsigned long *base,
-		       unsigned long *size, mtrr_type * type);
-	int	(*get_free_region)(unsigned long base, unsigned long size,
-				   int replace_reg);
-	int	(*validate_add_page)(unsigned long base, unsigned long size,
-				     unsigned int type);
-	int	(*have_wrcomb)(void);
-};
-
-int cf_check generic_get_free_region(
+void mtrr_get(
+    unsigned int reg, unsigned long *base, unsigned long *size,
+    mtrr_type *type);
+void mtrr_set(
+    unsigned int reg, unsigned long base, unsigned long size, mtrr_type type);
+void mtrr_set_all(void);
+int mtrr_get_free_region(
     unsigned long base, unsigned long size, int replace_reg);
-int cf_check generic_validate_add_page(
+int mtrr_validate_add_page(
     unsigned long base, unsigned long size, unsigned int type);
-
-extern const struct mtrr_ops generic_mtrr_ops;
+bool mtrr_have_wrcomb(void);
 
 void get_mtrr_state(void);
 
-extern void set_mtrr_ops(const struct mtrr_ops *);
-
 extern u64 size_or_mask, size_and_mask;
-extern const struct mtrr_ops *mtrr_if;
-
-#define is_cpu(vnd)	(mtrr_if && mtrr_if->vendor == X86_VENDOR_##vnd)
-#define use_intel()	(mtrr_if && mtrr_if->use_intel_if)
 
 extern unsigned int num_var_ranges;
 
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -295,7 +295,7 @@ ret_t do_platform_op(
         ret = -EINVAL;
         if ( op->u.read_memtype.reg < num_var_ranges )
         {
-            mtrr_if->get(op->u.read_memtype.reg, &mfn, &nr_mfns, &type);
+            mtrr_get(op->u.read_memtype.reg, &mfn, &nr_mfns, &type);
             op->u.read_memtype.mfn     = mfn;
             op->u.read_memtype.nr_mfns = nr_mfns;
             op->u.read_memtype.type    = type;

