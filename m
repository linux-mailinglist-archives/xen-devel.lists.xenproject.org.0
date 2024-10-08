Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDEF995296
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 16:57:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813217.1226060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syBdS-0005gz-Ed; Tue, 08 Oct 2024 14:56:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813217.1226060; Tue, 08 Oct 2024 14:56:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syBdS-0005fO-Aj; Tue, 08 Oct 2024 14:56:26 +0000
Received: by outflank-mailman (input) for mailman id 813217;
 Tue, 08 Oct 2024 14:56:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vy9o=RE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1syBdR-0005SR-3Z
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 14:56:25 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c459433-8585-11ef-a0bc-8be0dac302b0;
 Tue, 08 Oct 2024 16:56:23 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a7aa086b077so662655566b.0
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2024 07:56:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9940fd1c8csm431811766b.128.2024.10.08.07.56.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Oct 2024 07:56:22 -0700 (PDT)
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
X-Inumbo-ID: 7c459433-8585-11ef-a0bc-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728399383; x=1729004183; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1bBzizEXVlhacuzkk9KpCDJysZs/CovklXHjtslN3Go=;
        b=Wjo+3nqkpwX9yI346ddPrOpuqDyI0/wDzCCNjYDfrAFwkBbv4Q+WF+di+pAvVfjfen
         M0v4/QV46+aVOBh6OlJJPSoeQFqOr2i7zNeXCPeQnQlGyDTPPYArllbCmIxwAkdUp2tY
         BhextSl3eAqnrQrdpFXnJ5l6LLu9iE6ZRrAaBlkRdsq77XkL5CEIiHnNYP212JJ56pvn
         L8gwWUtnd9F6+VrftuI0EWrz0UrvWFvZ41qm2Z1NQi4PaR3VC3LSrHtV8QZNysE6FUaR
         AjKBP1im6T6Vipey5Epd/QN5X2B0QXvOt52GTrli9JV5+HdGIv/xYSUsmaXulWaUEjmV
         Noqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728399383; x=1729004183;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1bBzizEXVlhacuzkk9KpCDJysZs/CovklXHjtslN3Go=;
        b=DR+6XRvcR3q9P6hEY+fWYWwMQdrerjw/iU+f6A926ozportvjuUqfRu7B9R8YRUQga
         teqkTB8hlTz2XUgouN2RqSsdREfgOdZrxLjfM+SeCLlt7zCcdVCrhjW1Djfogde/mnYG
         1+6ey9/HX0jPdYNS6Jd9inIreMlaxsZh5JTZVmxGzFOUNZV7wD8VOyysyUn90tZe0nnP
         yZToiD/OYIwlxfrlG5+6Yjmimz9Uwz4U1fkzrw0Md42Fw/lpSiVQtssjnFq9etYEvJRR
         5g40aEBGZz5oIcOhFcUrW48JPCstiVSB7gJwiTGqsMQVyO5RSdoATCeUzhigTN2Oq047
         8heA==
X-Gm-Message-State: AOJu0YyHBJINWeI/kJaxOy0hPfGz7SCcs2zSMWOFI4FD8X+wG85vGXQS
	fKuA9FSEhgIynmEF+vfgZA9AFRbRAV7ui+PCHkjOyc6VEsb4lyZcQvgdrWi1xROkW5uGiJcU3o4
	=
X-Google-Smtp-Source: AGHT+IFQ9IfilNXTKDhNjdSc5rIoCGt1azwX3PlVLMO+Y3bLsQy4XciqlThV6UbDio8nRWvjZq79fw==
X-Received: by 2002:a17:907:97cf:b0:a99:408c:6a10 with SMTP id a640c23a62f3a-a99408c6d29mr1107435966b.16.1728399382849;
        Tue, 08 Oct 2024 07:56:22 -0700 (PDT)
Message-ID: <cfaf8df7-e78e-46be-b6d4-499dd96e0f66@suse.com>
Date: Tue, 8 Oct 2024 16:56:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4] types: replace remaining uses of s64
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

... and move the type itself to linux-compat.h. An exception being
arch/arm/arm64/cpufeature.c and arch/arm/include/asm/arm64/cpufeature.h,
which are to use linux-compat.h instead (the former by including the
latter).

While doing so
- correct the type of union uu's uq field in lib/divmod.c,
- switch a few adjacent types as well, for (a little bit of)
  consistency.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
v4: Use linux-compat.h in arch/arm/include/asm/arm64/cpufeature.h.
v3: Use linux-compat.h in arch/arm/arm64/cpufeature.c.
v2: Split off ubsan.[ch] adjustments. Re-base.

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
@@ -1,6 +1,8 @@
 #ifndef __ASM_ARM_ARM64_CPUFEATURES_H
 #define __ASM_ARM_ARM64_CPUFEATURES_H
 
+#include <xen/linux-compat.h>
+
 /*
  * CPU feature register tracking
  *
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
 

