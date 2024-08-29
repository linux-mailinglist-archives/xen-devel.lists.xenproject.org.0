Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE8A9643E9
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 14:07:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785760.1195265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjdw4-00050Q-N9; Thu, 29 Aug 2024 12:07:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785760.1195265; Thu, 29 Aug 2024 12:07:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjdw4-0004xu-JX; Thu, 29 Aug 2024 12:07:32 +0000
Received: by outflank-mailman (input) for mailman id 785760;
 Thu, 29 Aug 2024 12:07:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ImPG=P4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sjdqg-00013g-Ca
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 12:01:58 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7cda3871-65fe-11ef-99a0-01e77a169b0f;
 Thu, 29 Aug 2024 14:01:56 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5bec4fc82b0so2954829a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 29 Aug 2024 05:01:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226ccff65sm632354a12.72.2024.08.29.05.01.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Aug 2024 05:01:55 -0700 (PDT)
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
X-Inumbo-ID: 7cda3871-65fe-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724932916; x=1725537716; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LVMQIK1HgZzB/1b4Keq1JOlb+ZRrdFY+OKkfoX3Sk94=;
        b=aJcG0ag+xkB3aS6rqV2wl9gs2OYrf7IAoyE3v8Th9ocrtGpjcGarncYGZ+SrubOlBI
         fvNhot61uflOrWy6NlMcPk6r+w1fxUkIZ7zmBjfRkIHEzh7yhVVHztBq2T86PTOrDr0A
         04sdjmwdSKM7g4FtkiDbsHupQ3+E4fw9dU77MKTlpdBG2vSm00OUHY3Hf+K0q1wRy899
         zIJZNALudeJ2Qhruv4TDA+2Xs5zPGg0Qyl7jHQE4S0k98fYp6742tPqq1J2y8be2VhW1
         yhYMfv7x+AgsyKjcXtqejLuZ8mz0z/CaPt9MJQB26BMcnSB9E4/lhsy6ZOSdeF11UY/N
         8ong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724932916; x=1725537716;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LVMQIK1HgZzB/1b4Keq1JOlb+ZRrdFY+OKkfoX3Sk94=;
        b=qoWsKDR8EI7GUkP5NQo5HA44jLXqMM5sj7Tde+pF7JWfQKBpZNehKqSef4ZEnCPdGp
         rRHDG0kk01PQ6PcTfOji+TlOYzneCnTCE6oSERKuA1qQnctTsYfV8Wz3ZUtvtLsl6crV
         mjMeoI+oQg2NYJPEUyWpfOIAkqRAEiCn2pMrUJ6vAHl49rtK3h+r4fyy7EmeN98TOa3P
         pTe+nya5HRn+7OkbzbPVR5EAfcz0bz9GBv0SWMY17agXJD0RHMs1P88cR8QvBY2y51G5
         xxRbABpBGE0w1qgFqmeV1dVNVXR+wxNfXdCyNHVeeqO/T/l4aYosfLO74e3QjcIpByWz
         tygg==
X-Gm-Message-State: AOJu0YyNlpYSgIzt4NUMij3JzFk+ep2Jl+p0rdyGEuoPMzL3FwZFPsP1
	6p6BPAJEVBeTAki7IsnabJBKM3XMa979+3PqjBu7e3cdConWvU8s+OCpBNspUrRwxxO6f2aDmcw
	=
X-Google-Smtp-Source: AGHT+IEMbX4Gx0u3ZfACfhCdEe3hRZf+ALTTX5bNiZi2rsGmVbQ8JV9oH7a3wLErwAaXMwQ1/IYpfQ==
X-Received: by 2002:a05:6402:5186:b0:5c2:1014:295a with SMTP id 4fb4d7f45d1cf-5c2200de37dmr2349860a12.2.1724932915719;
        Thu, 29 Aug 2024 05:01:55 -0700 (PDT)
Message-ID: <50ffc0e1-ff3d-421f-a703-295541357e17@suse.com>
Date: Thu, 29 Aug 2024 14:01:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 5/5] types: replace remaining uses of s64
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <b1ded557-63b8-4999-98ca-de80488ebad1@suse.com>
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
In-Reply-To: <b1ded557-63b8-4999-98ca-de80488ebad1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

... and move the type itself to linux-compat.h.

While doing so
- correct the type of union uu's uq field in lib/divmod.c,
- switch a few adjacent types as well, for (a little bit of)
  consistency.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/arm/arm64/cpufeature.c
+++ b/xen/arch/arm/arm64/cpufeature.c
@@ -484,8 +484,8 @@ static const struct arm64_ftr_bits ftr_r
 	ARM64_FTR_END,
 };
 
-static u64 arm64_ftr_set_value(const struct arm64_ftr_bits *ftrp, s64 reg,
-			       s64 ftr_val)
+static uint64_t arm64_ftr_set_value(const struct arm64_ftr_bits *ftrp,
+				    int64_t reg, int64_t ftr_val)
 {
 	u64 mask = arm64_ftr_mask(ftrp);
 
@@ -494,10 +494,10 @@ static u64 arm64_ftr_set_value(const str
 	return reg;
 }
 
-static s64 arm64_ftr_safe_value(const struct arm64_ftr_bits *ftrp, s64 new,
-				s64 cur)
+static int64_t arm64_ftr_safe_value(const struct arm64_ftr_bits *ftrp,
+				    int64_t new, int64_t cur)
 {
-	s64 ret = 0;
+	int64_t ret = 0;
 
 	switch (ftrp->type) {
 	case FTR_EXACT:
@@ -532,8 +532,8 @@ static void sanitize_reg(u64 *cur_reg, u
 
 	for (;ftrp->width != 0;ftrp++)
 	{
-		s64 cur_field = arm64_ftr_value(ftrp, *cur_reg);
-		s64 new_field = arm64_ftr_value(ftrp, new_reg);
+		int64_t cur_field = arm64_ftr_value(ftrp, *cur_reg);
+		int64_t new_field = arm64_ftr_value(ftrp, new_reg);
 
 		if (cur_field == new_field)
 			continue;
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
 
 static inline int __attribute_const__
 cpuid_feature_extract_signed_field_width(u64 features, int field, int width)
 {
-	return (s64)(features << (64 - width - field)) >> (64 - width);
+	return (int64_t)(features << (64 - width - field)) >> (64 - width);
 }
 
 static inline int __attribute_const__
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
@@ -1206,7 +1206,7 @@ void vlapic_tdt_msr_set(struct vlapic *v
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
 
@@ -1010,9 +1010,9 @@ static void __init reset_platform_timer(
     spin_unlock_irq(&platform_timer_lock);
 }
 
-static s64 __init try_platform_timer(struct platform_timesource *pts)
+static int64_t __init try_platform_timer(struct platform_timesource *pts)
 {
-    s64 rc = pts->init(pts);
+    int64_t rc = pts->init(pts);
 
     if ( rc <= 0 )
         return rc;
@@ -1046,7 +1046,7 @@ static u64 __init init_platform_timer(vo
 
     struct platform_timesource *pts = NULL;
     unsigned int i;
-    s64 rc = -1;
+    int64_t rc = -1;
 
     /* clocksource=tsc is initialized via __initcalls (when CPUs are up). */
     if ( (opt_clocksource[0] != '\0') && strcmp(opt_clocksource, "tsc") )
@@ -1837,7 +1837,7 @@ static void cf_check local_time_calibrat
      * Weirdness can happen if we lose sync with the platform timer.
      * We could be smarter here: resync platform timer with local timer?
      */
-    if ( ((s64)stime_elapsed64 < (EPOCH / 2)) )
+    if ( ((int64_t)stime_elapsed64 < (EPOCH / 2)) )
         goto out;
 
     /*
@@ -2312,7 +2312,7 @@ static void __init tsc_check_writability
 
         write_tsc(tsc | (1ULL << 32));
         tmp = rdtsc();
-        if ( ABS((s64)tmp - (s64)tmp2) < (1LL << 31) )
+        if ( ABS((int64_t)tmp - (int64_t)tmp2) < (1LL << 31) )
             what = "only partially";
     }
     else
--- a/xen/common/ubsan/ubsan.c
+++ b/xen/common/ubsan/ubsan.c
@@ -21,7 +21,6 @@ static DEFINE_PER_CPU(struct xen_ubsan[1
 #define current this_cpu(in_ubsan)
 #define dump_stack dump_execution_state
 #define u64 long long unsigned int
-#define s64 long long int
 
 #include "ubsan.h"
 
@@ -102,7 +101,7 @@ static s_max get_signed_val(struct type_
 	}
 
 	if (type_bit_width(type) == 64)
-		return *(s64 *)val;
+		return *(int64_t *)val;
 
 	return *(s_max *)val;
 }
@@ -141,10 +140,11 @@ static void val_to_string(char *str, siz
 #endif
 		} else if (type_is_signed(type)) {
 			scnprintf(str, size, "%lld",
-				(s64)get_signed_val(type, value));
+				  (long long)get_signed_val(type, value));
 		} else {
 			scnprintf(str, size, "%llu",
-				(u64)get_unsigned_val(type, value));
+				  (unsigned long long)get_unsigned_val(type,
+								       value));
 		}
 	}
 }
--- a/xen/common/ubsan/ubsan.h
+++ b/xen/common/ubsan/ubsan.h
@@ -97,8 +97,8 @@ enum {
 typedef __int128 s_max;
 typedef unsigned __int128 u_max;
 #else
-typedef s64 s_max;
-typedef u64 u_max;
+typedef int64_t s_max;
+typedef uint64_t u_max;
 #endif
 
 #endif
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
 


