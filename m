Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB42698BDAA
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 15:31:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808175.1220019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svcxn-0003y8-Qt; Tue, 01 Oct 2024 13:30:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808175.1220019; Tue, 01 Oct 2024 13:30:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svcxn-0003wd-Nk; Tue, 01 Oct 2024 13:30:51 +0000
Received: by outflank-mailman (input) for mailman id 808175;
 Tue, 01 Oct 2024 13:30:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svcxm-0003uV-Py
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 13:30:50 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5efe9cf7-7ff9-11ef-99a2-01e77a169b0f;
 Tue, 01 Oct 2024 15:30:49 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a8d56155f51so709880066b.2
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 06:30:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2948231sm715824766b.99.2024.10.01.06.30.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Oct 2024 06:30:47 -0700 (PDT)
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
X-Inumbo-ID: 5efe9cf7-7ff9-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727789448; x=1728394248; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S5WuTphazNZYZ0CgrYRJBRQ/yCKD6Pl2sAhjVGoogdQ=;
        b=g9Eo62umjCgTTyR37b/2S4qetKG1ySr21IOUj1zE7TJeRRiagGRk0VuVu9zq+s8bkQ
         n/OSJ8dsfDUV1Udwwd41ogOBX0TnGI/8/vhB0f+QuZEs8JFihOcd8DjRTKR+LUZMl7fY
         pe7tvX/IWjT+JKgRAB91moZeOPaPKhIvzKO7CnCCnW5ttlSHng0F4QCgmAJE+l2+41uC
         JAcgQK0VtksAmKgWJMKPB2Xc7YlhUxgOoopQN1IlENc+8hf8XgSB2lMArriVCS02yuDp
         /P8Qh2pYwcbgCHLRbIrt5ILsrreMv14fe9W7bzBxADEZWjuSf2GqCG9mbjrOf3X+5Waa
         UYaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727789448; x=1728394248;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S5WuTphazNZYZ0CgrYRJBRQ/yCKD6Pl2sAhjVGoogdQ=;
        b=gUDzrB+gGuusbJ0NRIVO52NilFm7H6l8sRtuAVEwESwn7PfX9OcPtx1p06wckax2mt
         gpFRG+FY/bJVy45BTKh+FDqXns3Wg5Qu3L0/pW81XPlu7tkFt6ZTTYmMOa5tK2oFXwnN
         4t/sfq+kH9W2I3APxo7qWi/6cQx57XG0F07WB+YfKz99/slAO80dyO6oPu3h4FktOZrF
         5au2QB4JhnzxxkKJLIrpuOVjyp+1uMCcOeg98pTRwzAoDCjS3k1OlJfEttLdX8b7Fg9K
         8xv0ERB0tah/bs1+HQhK73k68PQ/EpKSVlOMN07X7koPLWfRd+bBKit5A1qryQv0RG45
         hVtw==
X-Gm-Message-State: AOJu0YxjUqVM1k51YT4BtMvDNOKr7o+m8heLXApqGydInXOMlv1zA8qV
	JfNLvqBKN0LUM/saeLQbQnUWnMK+5TxSe0eqVZrY2lIFGboB5ypw+4vyph1GILoQnoYPqv+Bw7o
	=
X-Google-Smtp-Source: AGHT+IGouu6gIMK8rlU06Z13YdQrYPPpL8KYQyFMX697AYjdT8Va0+HSXUQMN0TNJWZ8RRyS4kxiog==
X-Received: by 2002:a17:907:7fa9:b0:a8d:4db8:9edf with SMTP id a640c23a62f3a-a93c4ae1292mr1832424466b.42.1727789448314;
        Tue, 01 Oct 2024 06:30:48 -0700 (PDT)
Message-ID: <e3ba27ee-1534-40c1-b635-17ff89f50a6b@suse.com>
Date: Tue, 1 Oct 2024 15:30:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3] types: replace remaining uses of s64
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

... and move the type itself to linux-compat.h. An exception being
arch/arm/arm64/cpufeature.c, which is to use linux-compat.h instead.

While doing so
- correct the type of union uu's uq field in lib/divmod.c,
- switch a few adjacent types as well, for (a little bit of)
  consistency.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
v3: Use linux-compat.h in arch/arm/arm64/cpufeature.c.
v2: Split off ubsan.[ch] adjustments. Re-base.

--- a/xen/arch/arm/arm64/cpufeature.c
+++ b/xen/arch/arm/arm64/cpufeature.c
@@ -72,6 +72,7 @@
 #include <xen/bug.h>
 #include <xen/types.h>
 #include <xen/kernel.h>
+#include <xen/linux-compat.h>
 #include <asm/sysregs.h>
 #include <asm/cpufeature.h>
 #include <asm/arm64/cpufeature.h>
--- a/xen/arch/arm/arm64/livepatch.c
+++ b/xen/arch/arm/arm64/livepatch.c
@@ -119,7 +119,7 @@ static u64 do_reloc(enum aarch64_reloc_o
 
 static int reloc_data(enum aarch64_reloc_op op, void *place, u64 val, int len)
 {
-    s64 sval = do_reloc(op, place, val);
+    int64_t sval = do_reloc(op, place, val);
 
     switch ( len )
     {
@@ -136,7 +136,7 @@ static int reloc_data(enum aarch64_reloc
         break;
 
     case 64:
-        *(s64 *)place = sval;
+        *(int64_t *)place = sval;
         break;
 
     default:
@@ -155,9 +155,9 @@ enum aarch64_insn_movw_imm_type {
 static int reloc_insn_movw(enum aarch64_reloc_op op, void *dest, u64 val,
                            int lsb, enum aarch64_insn_movw_imm_type imm_type)
 {
-    u64 imm;
-    s64 sval;
-    u32 insn = *(u32 *)dest;
+    uint64_t imm;
+    int64_t sval;
+    uint32_t insn = *(uint32_t *)dest;
 
     sval = do_reloc(op, dest, val);
     imm = sval >> lsb;
@@ -200,9 +200,9 @@ static int reloc_insn_movw(enum aarch64_
 static int reloc_insn_imm(enum aarch64_reloc_op op, void *dest, u64 val,
                           int lsb, int len, enum aarch64_insn_imm_type imm_type)
 {
-    u64 imm, imm_mask;
-    s64 sval;
-    u32 insn = *(u32 *)dest;
+    uint64_t imm, imm_mask;
+    int64_t sval;
+    uint32_t insn = *(uint32_t *)dest;
 
     /* Calculate the relocation value. */
     sval = do_reloc(op, dest, val);
@@ -220,7 +220,7 @@ static int reloc_insn_imm(enum aarch64_r
      * Extract the upper value bits (including the sign bit) and
      * shift them to bit 0.
      */
-    sval = (s64)(sval & ~(imm_mask >> 1)) >> (len - 1);
+    sval = (int64_t)(sval & ~(imm_mask >> 1)) >> (len - 1);
 
     /*
      * Overflow has occurred if the upper bits are not all equal to
--- a/xen/arch/arm/include/asm/arm64/cpufeature.h
+++ b/xen/arch/arm/include/asm/arm64/cpufeature.h
@@ -39,15 +39,15 @@ struct arm64_ftr_bits {
 	bool		visible;
 	bool		strict;	/* CPU Sanity check: strict matching required ? */
 	enum ftr_type	type;
-	u8		shift;
-	u8		width;
-	s64		safe_val; /* safe value for FTR_EXACT features */
+	uint8_t		shift;
+	uint8_t		width;
+	int64_t		safe_val; /* safe value for FTR_EXACT features */
 };
 
 static inline int attr_const
 cpuid_feature_extract_signed_field_width(u64 features, int field, int width)
 {
-	return (s64)(features << (64 - width - field)) >> (64 - width);
+	return (int64_t)(features << (64 - width - field)) >> (64 - width);
 }
 
 static inline int attr_const
@@ -87,9 +87,12 @@ cpuid_feature_extract_field(u64 features
 	return cpuid_feature_extract_field_width(features, field, 4, sign);
 }
 
-static inline s64 arm64_ftr_value(const struct arm64_ftr_bits *ftrp, u64 val)
+static inline int64_t arm64_ftr_value(const struct arm64_ftr_bits *ftrp,
+                                      uint64_t val)
 {
-	return (s64)cpuid_feature_extract_field_width(val, ftrp->shift, ftrp->width, ftrp->sign);
+	return (int64_t)cpuid_feature_extract_field_width(val, ftrp->shift,
+							  ftrp->width,
+							  ftrp->sign);
 }
 
 #endif /* _ASM_ARM_ARM64_CPUFEATURES_H */
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -1223,7 +1223,7 @@ void vlapic_tdt_msr_set(struct vlapic *v
     if ( value > guest_tsc )
     {
         uint64_t delta = gtsc_to_gtime(v->domain, value - guest_tsc);
-        delta = max_t(s64, delta, 0);
+        delta = max_t(int64_t, delta, 0);
 
         HVM_DBG_LOG(DBG_LEVEL_VLAPIC_TIMER, "delta[0x%016"PRIx64"]", delta);
 
--- a/xen/arch/x86/include/asm/hvm/vcpu.h
+++ b/xen/arch/x86/include/asm/hvm/vcpu.h
@@ -134,8 +134,8 @@ struct hvm_vcpu {
     unsigned long       hw_cr[5];
 
     struct vlapic       vlapic;
-    s64                 cache_tsc_offset;
-    u64                 guest_time;
+    int64_t             cache_tsc_offset;
+    uint64_t            guest_time;
 
     /* Lock and list for virtual platform timers. */
     spinlock_t          tm_lock;
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -66,10 +66,10 @@ struct cpu_time {
 struct platform_timesource {
     const char *id;
     const char *name;
-    u64 frequency;
+    uint64_t frequency;
     /* Post-init this hook may only be invoked via the read_counter() wrapper! */
-    u64 (*read_counter)(void);
-    s64 (*init)(struct platform_timesource *);
+    uint64_t (*read_counter)(void);
+    int64_t (*init)(struct platform_timesource *);
     void (*resume)(struct platform_timesource *);
     int counter_bits;
 };
@@ -368,7 +368,7 @@ static u64 cf_check read_pit_count(void)
     return count32;
 }
 
-static s64 __init cf_check init_pit(struct platform_timesource *pts)
+static int64_t __init cf_check init_pit(struct platform_timesource *pts)
 {
     u8 portb = inb(0x61);
     u64 start, end;
@@ -610,7 +610,7 @@ static u64 cf_check read_pmtimer_count(v
     return inl(pmtmr_ioport);
 }
 
-static s64 __init cf_check init_pmtimer(struct platform_timesource *pts)
+static int64_t __init cf_check init_pmtimer(struct platform_timesource *pts)
 {
     if ( !pmtmr_ioport || (pmtmr_width != 24 && pmtmr_width != 32) )
         return 0;
@@ -655,7 +655,7 @@ static unsigned int __initdata tsc_flags
  * Called in verify_tsc_reliability() under reliable TSC conditions
  * thus reusing all the checks already performed there.
  */
-static s64 __init cf_check init_tsc(struct platform_timesource *pts)
+static int64_t __init cf_check init_tsc(struct platform_timesource *pts)
 {
     u64 ret = pts->frequency;
 
@@ -1034,9 +1034,9 @@ static void __init reset_platform_timer(
     spin_unlock_irq(&platform_timer_lock);
 }
 
-static s64 __init try_platform_timer(struct platform_timesource *pts)
+static int64_t __init try_platform_timer(struct platform_timesource *pts)
 {
-    s64 rc = pts->init(pts);
+    int64_t rc = pts->init(pts);
 
     if ( rc <= 0 )
         return rc;
@@ -1070,7 +1070,7 @@ static u64 __init init_platform_timer(vo
 
     struct platform_timesource *pts = NULL;
     unsigned int i;
-    s64 rc = -1;
+    int64_t rc = -1;
 
     /* clocksource=tsc is initialized via __initcalls (when CPUs are up). */
     if ( (opt_clocksource[0] != '\0') && strcmp(opt_clocksource, "tsc") )
@@ -1923,7 +1923,7 @@ static void cf_check local_time_calibrat
      * Weirdness can happen if we lose sync with the platform timer.
      * We could be smarter here: resync platform timer with local timer?
      */
-    if ( ((s64)stime_elapsed64 < (EPOCH / 2)) )
+    if ( ((int64_t)stime_elapsed64 < (EPOCH / 2)) )
         goto out;
 
     /*
@@ -2398,7 +2398,7 @@ static void __init tsc_check_writability
 
         write_tsc(tsc | (1ULL << 32));
         tmp = rdtsc();
-        if ( ABS((s64)tmp - (s64)tmp2) < (1LL << 31) )
+        if ( ABS((int64_t)tmp - (int64_t)tmp2) < (1LL << 31) )
             what = "only partially";
     }
     else
--- a/xen/drivers/acpi/apei/erst.c
+++ b/xen/drivers/acpi/apei/erst.c
@@ -105,7 +105,7 @@ static inline int erst_errno(int command
 
 static int erst_timedout(u64 *t, u64 spin_unit)
 {
-	if ((s64)*t < spin_unit) {
+	if ((int64_t)*t < spin_unit) {
 		printk(XENLOG_WARNING "Firmware does not respond in time\n");
 		return 1;
 	}
--- a/xen/include/acpi/actypes.h
+++ b/xen/include/acpi/actypes.h
@@ -147,8 +147,8 @@ typedef int INT32;
 
 /*! [End] no source code translation !*/
 
-typedef u64 acpi_native_uint;
-typedef s64 acpi_native_int;
+typedef uint64_t acpi_native_uint;
+typedef int64_t acpi_native_int;
 
 typedef u64 acpi_io_address;
 typedef u64 acpi_physical_address;
--- a/xen/include/xen/linux-compat.h
+++ b/xen/include/xen/linux-compat.h
@@ -15,7 +15,7 @@ typedef int8_t  s8, __s8;
 typedef uint8_t __u8;
 typedef int16_t s16, __s16;
 typedef int32_t s32, __s32;
-typedef int64_t __s64;
+typedef int64_t s64, __s64;
 
 typedef paddr_t phys_addr_t;
 
--- a/xen/include/xen/time.h
+++ b/xen/include/xen/time.h
@@ -29,7 +29,7 @@ struct vcpu;
  * of real time into system time 
  */
 
-typedef s64 s_time_t;
+typedef int64_t s_time_t;
 #define PRI_stime PRId64
 
 s_time_t get_s_time_fixed(u64 at_tick);
--- a/xen/include/xen/types.h
+++ b/xen/include/xen/types.h
@@ -8,7 +8,6 @@
 typedef uint8_t u8;
 typedef uint16_t u16, __u16;
 typedef uint32_t u32, __u32;
-typedef int64_t s64;
 typedef uint64_t u64, __u64;
 
 #include <asm/types.h>
--- a/xen/lib/divmod.c
+++ b/xen/lib/divmod.c
@@ -46,8 +46,8 @@
  * one or more of the following formats.
  */
 union uu {
-    s64            q;              /* as a (signed) quad */
-    s64            uq;             /* as an unsigned quad */
+    int64_t        q;              /* as a (signed) quad */
+    uint64_t       uq;             /* as an unsigned quad */
     long           sl[2];          /* as two signed longs */
     unsigned long  ul[2];          /* as two unsigned longs */
 };
@@ -72,7 +72,7 @@ union uu {
  * and assembly.
  */
 #define CHAR_BIT        8               /* number of bits in a char */
-#define QUAD_BITS       (sizeof(s64) * CHAR_BIT)
+#define QUAD_BITS       (sizeof(int64_t) * CHAR_BIT)
 #define LONG_BITS       (sizeof(long) * CHAR_BIT)
 #define HALF_BITS       (sizeof(long) * CHAR_BIT / 2)
 
@@ -324,7 +324,7 @@ u64 __qdivrem(u64 uq, u64 vq, u64 *arq)
  * Divide two signed quads.
  * Truncates towards zero, as required by C99.
  */
-s64 __divdi3(s64 a, s64 b)
+int64_t __divdi3(int64_t a, int64_t b)
 {
     u64 ua, ub, uq;
     int neg = (a < 0) ^ (b < 0);
@@ -361,7 +361,7 @@ u64 __umoddi3(u64 a, u64 b)
  *  11 % -5 =  1
  * -11 % -5 = -1
  */
-s64 __moddi3(s64 a, s64 b)
+int64_t __moddi3(int64_t a, int64_t b)
 {
     u64 ua, ub, urem;
     int neg = (a < 0);
@@ -374,7 +374,7 @@ s64 __moddi3(s64 a, s64 b)
 /*
  * Quotient and remainder of unsigned long long division
  */
-s64 __ldivmod_helper(s64 a, s64 b, s64 *r)
+int64_t __ldivmod_helper(int64_t a, int64_t b, int64_t *r)
 {
     u64 ua, ub, rem, quot;
 

