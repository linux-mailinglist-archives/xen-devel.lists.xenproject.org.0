Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E97449643B3
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 14:01:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785736.1195226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjdqI-0001z6-Aw; Thu, 29 Aug 2024 12:01:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785736.1195226; Thu, 29 Aug 2024 12:01:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjdqI-0001vv-7t; Thu, 29 Aug 2024 12:01:34 +0000
Received: by outflank-mailman (input) for mailman id 785736;
 Thu, 29 Aug 2024 12:01:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ImPG=P4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sjdqG-0001r9-Gi
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 12:01:32 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e257fa5-65fe-11ef-a0b0-8be0dac302b0;
 Thu, 29 Aug 2024 14:01:31 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-371c5187198so369644f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Aug 2024 05:01:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8989195e6bsm70881066b.99.2024.08.29.05.01.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Aug 2024 05:01:17 -0700 (PDT)
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
X-Inumbo-ID: 6e257fa5-65fe-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724932891; x=1725537691; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+4LOghClr9pcCZnA2NN/G4bl/sIzTUpbHkgkt6Fava0=;
        b=TGsctMu5re9Oqv+b0mHjU2t8aQs4RGergG8iZqrDRKD/HRd9oJkAWZW9A9OcY+em3n
         oT2WpBSpUPgTiiQm55BZjD53HghpwT3RFfvyXAn3fGnW2UCBUqzt05DYeuXA16BIssZ9
         jdznbF7VOR5EFExdURYJ0UARRWGrAml99BTTlI69UMe5eXpKNwV6AAkYd+2mZ4hEn5E/
         EtSfZzyrjYH7ui3G9NO3rM5xCWwQT/d6qBJmspArQW4EBx3fQANzdPQYUcCdeErpTSEp
         rcQfxtjmM9STrNENbrxc7pVQeKy0BhnEmj6TqTMaFPHqmTLi3/i0ZBPOjmiQfEMGMDXB
         Uw3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724932891; x=1725537691;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+4LOghClr9pcCZnA2NN/G4bl/sIzTUpbHkgkt6Fava0=;
        b=hWL8ira12u44jwe03HTvVXX/chl2EmMAGeTN36dWGE9TtSpJAWnNtV3CXKnlF0/uNz
         SEb9PeCDpNVQCGBmkLWFZuG0BPV+0egMshYjnzj2Z/SV1J8+xdS3MM6A877fYMJnJpHf
         gXhrMBGN2Oe8efeV4YVLQaxWbee2YeLl+C7NTN8i9eFt1+8z9IvtnPxRj0IxqhpXxcq1
         aHmwQFjHU22MH6/5hdwfJcr4kmn4fk/eWxjCbpZx75fysAn2SOq14r61KnQab8R1lucr
         xFFDeG7vRa8garRWZmNvfagKXfeA2jSD/WddeuqMxJjVePX6WIqSr+0w2GpDWcTPbOCy
         HKGw==
X-Gm-Message-State: AOJu0YzkTYzmNuewN+kzWqXtrTFM8Tydf9BjktudI7TRBXMPaF5dBY/+
	wRxmumjqj3i/tdGXhgZgycu3jBX5Vp9ZN9RwI7jddJHIJEbgkNU/KxLCweB1Dz5K+XscbCDMd3A
	=
X-Google-Smtp-Source: AGHT+IEvLlF8ZJ8CbFSkkYTZDmk95WzWrtVzRn2FHuOXgjbGqIvzpfuo2fXRt2C4mgYMqW1moRw16w==
X-Received: by 2002:a05:6402:2552:b0:5c0:aa04:2342 with SMTP id 4fb4d7f45d1cf-5c21ed56617mr2252531a12.22.1724932878643;
        Thu, 29 Aug 2024 05:01:18 -0700 (PDT)
Message-ID: <0e6b7685-e061-4ace-88fd-86728d765e5a@suse.com>
Date: Thu, 29 Aug 2024 14:01:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 4/5] types: replace remaining uses of s32
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>
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

While doing so switch a few adjacent types as well, for (a little bit
of) consistency.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/arm/alternative.c
+++ b/xen/arch/arm/alternative.c
@@ -63,7 +63,7 @@ static u32 get_alt_insn(const struct alt
 
     if ( insn_is_branch_imm(insn) )
     {
-        s32 offset = insn_get_branch_offset(insn);
+        int32_t offset = insn_get_branch_offset(insn);
         unsigned long target;
 
         target = (unsigned long)altinsnptr + offset;
--- a/xen/arch/arm/arm32/livepatch.c
+++ b/xen/arch/arm/arm32/livepatch.c
@@ -32,7 +32,7 @@ void arch_livepatch_apply(const struct l
 
     if ( func->new_addr )
     {
-        s32 delta;
+        int32_t delta;
 
         /*
          * PC is current address (old_addr) + 8 bytes. The semantics for a
@@ -41,11 +41,11 @@ void arch_livepatch_apply(const struct l
          * ARM DDI 0406C.c, see A2.3 (pg 45) and A8.8.18 pg (pg 334,335)
          *
          */
-        delta = (s32)func->new_addr - (s32)(func->old_addr + 8);
+        delta = (int32_t)func->new_addr - (int32_t)(func->old_addr + 8);
 
         /* The arch_livepatch_symbol_ok should have caught it. */
-        ASSERT(delta >= -(s32)ARCH_LIVEPATCH_RANGE ||
-               delta < (s32)ARCH_LIVEPATCH_RANGE);
+        ASSERT(delta >= -(int32_t)ARCH_LIVEPATCH_RANGE ||
+               delta < (int32_t)ARCH_LIVEPATCH_RANGE);
 
         /* CPU shifts by two (left) when decoding, so we shift right by two. */
         delta = delta >> 2;
@@ -113,9 +113,9 @@ bool arch_livepatch_symbol_deny(const st
     return false;
 }
 
-static s32 get_addend(unsigned char type, void *dest)
+static int32_t get_addend(unsigned char type, void *dest)
 {
-    s32 addend = 0;
+    int32_t addend = 0;
 
     switch ( type ) {
     case R_ARM_NONE:
@@ -149,7 +149,8 @@ static s32 get_addend(unsigned char type
     return addend;
 }
 
-static int perform_rel(unsigned char type, void *dest, uint32_t val, s32 addend)
+static int perform_rel(unsigned char type, void *dest, uint32_t val,
+                       int32_t addend)
 {
 
     switch ( type ) {
@@ -203,8 +204,8 @@ static int perform_rel(unsigned char typ
          * arch_livepatch_verify_distance can't account of addend so we have
          * to do the check here as well.
          */
-        if ( (s32)val < -(s32)ARCH_LIVEPATCH_RANGE ||
-             (s32)val >= (s32)ARCH_LIVEPATCH_RANGE )
+        if ( (int32_t)val < -(int32_t)ARCH_LIVEPATCH_RANGE ||
+             (int32_t)val >= (int32_t)ARCH_LIVEPATCH_RANGE )
             return -EOVERFLOW;
 
         /* CPU always shifts insn by two, so complement it. */
@@ -234,7 +235,7 @@ int arch_livepatch_perform(struct livepa
         uint32_t val;
         void *dest;
         unsigned char type;
-        s32 addend;
+        int32_t addend;
 
         if ( use_rela )
         {
--- a/xen/arch/arm/arm64/insn.c
+++ b/xen/arch/arm/arm64/insn.c
@@ -223,9 +223,9 @@ u32 __kprobes aarch64_insn_gen_nop(void)
  * signed value (so it can be used when computing a new branch
  * target).
  */
-s32 aarch64_get_branch_offset(u32 insn)
+int32_t aarch64_get_branch_offset(uint32_t insn)
 {
-	s32 imm;
+	int32_t imm;
 
 	if (aarch64_insn_is_b(insn) || aarch64_insn_is_bl(insn)) {
 		imm = aarch64_insn_decode_immediate(AARCH64_INSN_IMM_26, insn);
@@ -251,7 +251,7 @@ s32 aarch64_get_branch_offset(u32 insn)
  * Encode the displacement of a branch in the imm field and return the
  * updated instruction.
  */
-u32 aarch64_set_branch_offset(u32 insn, s32 offset)
+uint32_t aarch64_set_branch_offset(uint32_t insn, int32_t offset)
 {
 	if (aarch64_insn_is_b(insn) || aarch64_insn_is_bl(insn))
 		return aarch64_insn_encode_immediate(AARCH64_INSN_IMM_26, insn,
--- a/xen/arch/arm/arm64/livepatch.c
+++ b/xen/arch/arm/arm64/livepatch.c
@@ -130,7 +130,7 @@ static int reloc_data(enum aarch64_reloc
         break;
 
     case 32:
-        *(s32 *)place = sval;
+        *(int32_t *)place = sval;
         if ( sval < INT32_MIN || sval > UINT32_MAX )
 	        return -EOVERFLOW;
         break;
--- a/xen/arch/arm/include/asm/alternative.h
+++ b/xen/arch/arm/include/asm/alternative.h
@@ -12,11 +12,11 @@
 #include <xen/stringify.h>
 
 struct alt_instr {
-	s32 orig_offset;	/* offset to original instruction */
-	s32 repl_offset;	/* offset to replacement instruction */
-	u16 cpufeature;		/* cpufeature bit set for replacement */
-	u8  orig_len;		/* size of original instruction(s) */
-	u8  repl_len;		/* size of new instruction(s), <= orig_len */
+	int32_t  orig_offset;	/* offset to original instruction */
+	int32_t  repl_offset;	/* offset to replacement instruction */
+	uint16_t cpufeature;	/* cpufeature bit set for replacement */
+	uint8_t  orig_len;	/* size of original instruction(s) */
+	uint8_t  repl_len;	/* size of new instruction(s), <= orig_len */
 };
 
 /* Xen: helpers used by common code. */
--- a/xen/arch/arm/include/asm/arm64/insn.h
+++ b/xen/arch/arm/include/asm/arm64/insn.h
@@ -75,8 +75,8 @@ u64 aarch64_insn_decode_immediate(enum a
 u32 aarch64_insn_encode_immediate(enum aarch64_insn_imm_type type,
 				  u32 insn, u64 imm);
 
-s32 aarch64_get_branch_offset(u32 insn);
-u32 aarch64_set_branch_offset(u32 insn, s32 offset);
+int32_t aarch64_get_branch_offset(uint32_t insn);
+uint32_t aarch64_set_branch_offset(uint32_t insn, int32_t offset);
 
 u32 aarch64_insn_gen_branch_imm(unsigned long pc, unsigned long addr,
 				enum aarch64_insn_branch_type type);
@@ -89,12 +89,12 @@ static inline bool insn_is_branch_imm(u3
     return aarch64_insn_is_branch_imm(insn);
 }
 
-static inline s32 insn_get_branch_offset(u32 insn)
+static inline int32_t insn_get_branch_offset(uint32_t insn)
 {
     return aarch64_get_branch_offset(insn);
 }
 
-static inline u32 insn_set_branch_offset(u32 insn, s32 offset)
+static inline uint32_t insn_set_branch_offset(uint32_t insn, int32_t offset)
 {
     return aarch64_set_branch_offset(insn, offset);
 }
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -101,12 +101,12 @@ static void __init efi_arch_relocate_ima
     }
 }
 
-extern const s32 __trampoline_rel_start[], __trampoline_rel_stop[];
-extern const s32 __trampoline_seg_start[], __trampoline_seg_stop[];
+extern const int32_t __trampoline_rel_start[], __trampoline_rel_stop[];
+extern const int32_t __trampoline_seg_start[], __trampoline_seg_stop[];
 
 static void __init relocate_trampoline(unsigned long phys)
 {
-    const s32 *trampoline_ptr;
+    const int32_t *trampoline_ptr;
 
     trampoline_phys = phys;
 
--- a/xen/arch/x86/include/asm/uaccess.h
+++ b/xen/arch/x86/include/asm/uaccess.h
@@ -406,7 +406,7 @@ copy_from_unsafe(void *to, const void __
 
 struct exception_table_entry
 {
-	s32 addr, cont;
+	int32_t addr, cont;
 };
 extern struct exception_table_entry __start___ex_table[];
 extern struct exception_table_entry __stop___ex_table[];
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1859,8 +1859,8 @@ static void cf_check local_time_calibrat
      * This allows us to binary shift a 32-bit tsc_elapsed such that:
      * stime_elapsed < tsc_elapsed <= 2*stime_elapsed
      */
-    while ( ((u32)stime_elapsed64 != stime_elapsed64) ||
-            ((s32)stime_elapsed64 < 0) )
+    while ( ((uint32_t)stime_elapsed64 != stime_elapsed64) ||
+            ((int32_t)stime_elapsed64 < 0) )
     {
         stime_elapsed64 >>= 1;
         tsc_elapsed64   >>= 1;
--- a/xen/common/trace.c
+++ b/xen/common/trace.c
@@ -459,8 +459,8 @@ static inline bool bogus(u32 prod, u32 c
 
 static inline u32 calc_unconsumed_bytes(const struct t_buf *buf)
 {
-    u32 prod = buf->prod, cons = buf->cons;
-    s32 x;
+    uint32_t prod = buf->prod, cons = buf->cons;
+    int32_t x;
 
     barrier(); /* must read buf->prod and buf->cons only once */
     if ( bogus(prod, cons) )
@@ -478,8 +478,8 @@ static inline u32 calc_unconsumed_bytes(
 
 static inline u32 calc_bytes_to_wrap(const struct t_buf *buf)
 {
-    u32 prod = buf->prod, cons = buf->cons;
-    s32 x;
+    uint32_t prod = buf->prod, cons = buf->cons;
+    int32_t x;
 
     barrier(); /* must read buf->prod and buf->cons only once */
     if ( bogus(prod, cons) )
--- a/xen/include/acpi/actypes.h
+++ b/xen/include/acpi/actypes.h
@@ -186,8 +186,8 @@ typedef int INT32;
 
 /*! [End] no source code translation !*/
 
-typedef u32 acpi_native_uint;
-typedef s32 acpi_native_int;
+typedef uint32_t acpi_native_uint;
+typedef int32_t acpi_native_int;
 
 typedef u32 acpi_io_address;
 typedef u32 acpi_physical_address;
--- a/xen/include/xen/linux-compat.h
+++ b/xen/include/xen/linux-compat.h
@@ -14,7 +14,7 @@
 typedef int8_t  s8, __s8;
 typedef uint8_t __u8;
 typedef int16_t s16, __s16;
-typedef int32_t __s32;
+typedef int32_t s32, __s32;
 typedef int64_t __s64;
 
 typedef paddr_t phys_addr_t;
--- a/xen/include/xen/types.h
+++ b/xen/include/xen/types.h
@@ -7,7 +7,6 @@
 /* Linux inherited types which are being phased out */
 typedef uint8_t u8;
 typedef uint16_t u16, __u16;
-typedef int32_t s32;
 typedef uint32_t u32, __u32;
 typedef int64_t s64;
 typedef uint64_t u64, __u64;


