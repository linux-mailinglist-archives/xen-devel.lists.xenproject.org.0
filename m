Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 757F9AF15A9
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 14:30:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031054.1404751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWwbY-0006VR-SU; Wed, 02 Jul 2025 12:30:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031054.1404751; Wed, 02 Jul 2025 12:30:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWwbY-0006TX-O7; Wed, 02 Jul 2025 12:30:24 +0000
Received: by outflank-mailman (input) for mailman id 1031054;
 Wed, 02 Jul 2025 12:30:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FQsZ=ZP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWwbX-0006TN-9w
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 12:30:23 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51bdf692-5740-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 14:30:21 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-451d3f72391so46114865e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 05:30:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb2f218esm136526035ad.78.2025.07.02.05.30.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 05:30:19 -0700 (PDT)
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
X-Inumbo-ID: 51bdf692-5740-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751459420; x=1752064220; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0xffzu65I/atowSpaxcMJ0a0tt+gzRBJ7hqwjmQvCmI=;
        b=VW6n/Ij58txYY5RNj9oBzzJcSHTXK9Z+NV0kToq5WvshIaxdy27mfj+2x1WG9ppkSB
         jFUGwSatKAzCai6mC94KqmQkQUy0CXEsZmSnQd7MiEbY92/9utqycI74tIxC1bb0uBQM
         nELEVsxZcBTliAzQG5SdfH6DZwlxqWCCnzfu2n/6MbXd+e0TJ6e9lqpiuMs1hRLpepFI
         G5Y24dPuKoee++9wJWmh3wMuZptqz6DuDFw4HKRQchjsygZSurF9pn9ySr9WjAetUVH2
         1W+jzvNefYB9xbHSJ0SuwPbteXrYwqDBE9QVC7PP+wtV3b6xy1HR7KiB8ITrVjx33UrB
         pd7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751459420; x=1752064220;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0xffzu65I/atowSpaxcMJ0a0tt+gzRBJ7hqwjmQvCmI=;
        b=HkLpmlV0KCo/lmkxxXyoQGQKxkXoniNCQqlXhiTK7Dty09ZcWdJJnI52jcTMziDmga
         POdywm3T9AOz83Ld+oo6X970coz1qYtNTpfQqCAotC0EmSqCq1FmQsziuvrtYYWSmVDd
         hqmFogcZHZhuUhkD8FwrqbCLHfdeoB9toOVRz4CwUm6OH9jPuX5b3+el12f2mLcDQ+Jg
         naRDDmT2NRLeDKCSqmzSBfI4pNZe4k6n2hfHSbalKyARlRaj1apIgRgDS6nS6iEfmBoQ
         FOcZVyc7iQ4tOYApQIobZyG+3ydOREAX/ewRtfD0/Zu/YjRe4Ns/R8W+fn5cvL18Mz8z
         7b+A==
X-Gm-Message-State: AOJu0Yx3pSEE1VC9Ag2U3pzxXh6a09ABd0EWyg34Pc1NonuwQl//rEJy
	oxSzM4vUGaNY4/QmekdsJvll5OZRgL/uwpsf9qPxE/BmUBV3AaQUMfo5in06cm15pRNJ5Mpu69M
	e5Js=
X-Gm-Gg: ASbGncvqMFuxVxZ3ZIGP4GfLO+rbg/uaWg6ME080EkIyExW08+9IxWsSdudvvbFLT//
	6yvNvdN7hH8uhAZdJfA0XkFwTegueDtSc3wNwm6q12w/CbcOp8YjRWoNABfnyJD44KeWrdzff5N
	zeyBMLw5T+9/eOE64sF5ULmqFkPwiJ60g5eBAPY9RIcvZzliOLeVyUXqDPjMUYT6EFcUSKBk6HQ
	cVbLOY8Je5Pkpciy52UuRFy7bebGxgZ+jwTeWZ8PzEqiOHCFt7VXXucYD+3BtL4mUgaOvgtEzPA
	pMvL2XyV3e7vN+pW6EkmIHnvaBx4MZps7rJaAXfpU3y8WVOb8gLSYAfORirz66lcoTKBTWev0+f
	YtO8oGZh5Z2O2Dv066KsHJjfFbX6toeNRPKts43ajT+q9RuhYGGJW/UgCrg==
X-Google-Smtp-Source: AGHT+IGNOyogfKgM8VJIKec+gjlisOhFAIQlYHs/xu2ASyZw6v2+uD6sfEZaLJ63932GFe/ng8cGCQ==
X-Received: by 2002:a05:6000:440b:b0:3a4:d4cd:b06 with SMTP id ffacd0b85a97d-3b2001ac9fdmr1369591f8f.34.1751459420202;
        Wed, 02 Jul 2025 05:30:20 -0700 (PDT)
Message-ID: <8a6b3e8c-5f0a-4f84-9004-406dce4f1c1d@suse.com>
Date: Wed, 2 Jul 2025 14:30:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH RFC] x86: re-inline RET used in assembly code
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

Going through return thunks is unnecessary cost on hardware unaffected
by ITS. Furthermore even on affected hardware, RET is fine to have in
the upper halves of cachelines. To focus on the machinery here, start
with merely amending RET, as is used in assembly files.

memcpy() once again is special. For one, one of the RETs there is in an
alternative, the address of which doesn't matter when determining whether
re-inlining is safe on ITS-affected hardware. And then we also can't use
stringification there anymore, as that converts double quotes to
backslash-escaped forms. Those are left intact though when the assembler
parses macro operands; a sequence of two double quotes is the escaping
for what should result in a single remaining one. Fall back to the macro
approach used elsewhere.

memset() and clear_page_*() are also slightly special, in that we want
to avoid a RET to be overwritten by alternatives patching.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
NOTE: While technically separate, this touches quite a few of the
      places the ERMS series (v7 just sent) also touches. Therefore
      this patch is assumed to go on top of that series.
---
Is conditionally re-inlining (based on address) really a good idea? This
way we'll almost certainly have imbalances in RSB more often than not.

CS prefixes are used for pre-padding following what apply_alt_calls()
uses. Since "REP RET" is a known idiom, maybe we'd better use REP?

Using prefixes there is based on the assumption that the last byte of
the insn is what matters. If that was wrong, a NOP would need inserting
instead.

Not being able to re-inline some instance isn't really a fatal issue.
Would re_inline_ret() better return void? Or should we at least not
panic when it fails? (In either case the present error return(s) there
would need to become continue(s).)

Emitting the "re-inlined ... out of ... RETs" multiple times isn't nice,
but options I could think of didn't look very nice either.

The name of the helper macro in memset.S isn't great. Suggestions
welcome.

How to hook up the livepatch function isn't quite clear to me: Other
architectures may not have the need to do any re-inlining, yet using a
CONFIG_X86 conditional in common/livepatch.c also doesn't look very
attractive.

The changes to _apply_alternatives() could in principle be split out to
a subsequent patch (alternatives simply could retain their JMPs to
the return thunk until then). It seemed better to me though to have
everything together.

--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -249,6 +249,76 @@ static void __init seal_endbr64(void)
     printk("altcall: Optimised away %u endbr64 instructions\n", clobbered);
 }
 
+#define RE_INLINE_PTR(r) ((void *)(r) + *(r))
+
+static int init_or_livepatch re_inline_ret(
+    const int32_t *start, const int32_t *end)
+{
+    const int32_t *r;
+    unsigned int done = 0;
+    bool its_no = boot_cpu_data.x86_vendor != X86_VENDOR_INTEL ||
+                  cpu_has_its_no;
+
+    if ( !IS_ENABLED(CONFIG_RETURN_THUNK) )
+    {
+        ASSERT(start == end);
+        return 0;
+    }
+
+    /*
+     * If we're virtualised and can't see ITS_NO, do nothing.  We are or may
+     * migrate somewhere unsafe.
+     */
+    if ( cpu_has_hypervisor && !its_no )
+        return 0;
+
+    for ( r = start; r < end; r++ )
+    {
+        uint8_t *orig = RE_INLINE_PTR(r);
+        unsigned long offs;
+        uint8_t buf[5];
+
+        if ( *orig != 0xe9 ||
+             (long)orig + 5 + *(int32_t*)(orig + 1) !=
+             (long)__x86_return_thunk )
+            return -EILSEQ;
+
+        /* RET in .altinstr_replacement is handled elsewhere */
+        if ( orig >= (const uint8_t *)_einittext )
+            continue;
+
+        if ( its_no || ((unsigned long)orig & 0x20) )
+        {
+            /*
+             * Patching independent of address is easy: Put a RET there,
+             * followed by 4 INT3s.
+             */
+            buf[0] = 0xc3;
+            memset(buf + 1, 0xcc, 4);
+        }
+        else if ( ((unsigned long)orig & 0x3f) < 0x1c )
+            continue;
+        else
+        {
+            /*
+             * In the 5-byte area we have, shift the RET enough to be in the
+             * 2nd half of the cacheline.  Pad with CS prefixes.
+             */
+            offs = 0x20 - ((unsigned long)orig & 0x3f);
+            memset(buf, 0x2e, offs);
+            buf[offs] = 0xc3;
+            memset(buf + offs + 1, 0xcc, 4 - offs);
+        }
+
+        text_poke(orig, buf, 5);
+        ++done;
+    }
+
+    printk(XENLOG_INFO "re-inlined %u out of %zu RETs\n", done, end - start);
+
+    return 0;
+}
+
 /*
  * Replace instructions with better alternatives for this CPU type.
  * This runs before SMP is initialized to avoid SMP problems with
@@ -279,6 +349,11 @@ static int init_or_livepatch _apply_alte
         unsigned int total_len = a->orig_len + a->pad_len;
         unsigned int feat = a->cpuid & ~ALT_FLAG_NOT;
         bool inv = a->cpuid & ALT_FLAG_NOT, replace;
+        /*
+         * Re-inlined RET occurring in alternative code needs to be handled
+         * here.  This variable is set to the respective JMP, if found.
+         */
+        const void *where = NULL;
 
         if ( a->repl_len > total_len )
         {
@@ -350,18 +425,37 @@ static int init_or_livepatch _apply_alte
 
         /* 0xe8/0xe9 are relative branches; fix the offset. */
         if ( a->repl_len >= 5 && (*buf & 0xfe) == 0xe8 )
+        {
             *(int32_t *)(buf + 1) += repl - orig;
+            if ( IS_ENABLED(CONFIG_RETURN_THUNK) &&
+                 *buf == 0xe9 &&
+                 ((long)repl + 5 + *(int32_t *)(buf + 1) ==
+                  (long)__x86_return_thunk) )
+                where = orig;
+        }
         else if ( IS_ENABLED(CONFIG_RETURN_THUNK) &&
                   a->repl_len > 5 && buf[a->repl_len - 5] == 0xe9 &&
                   ((long)repl + a->repl_len +
                    *(int32_t *)(buf + a->repl_len - 4) ==
                    (long)__x86_return_thunk) )
+        {
             *(int32_t *)(buf + a->repl_len - 4) += repl - orig;
+            where = orig + a->repl_len - 5;
+        }
 
         a->priv = 1;
 
         add_nops(buf + a->repl_len, total_len - a->repl_len);
         text_poke(orig, buf, total_len);
+
+        if ( where )
+        {
+            int32_t rel = where - (void *)&rel;
+            int rc = re_inline_ret(&rel, &rel + 1);
+
+            if ( rc )
+                return rc;
+        }
     }
 
     return 0;
@@ -459,6 +553,11 @@ int apply_alternatives(struct alt_instr
     return _apply_alternatives(start, end);
 }
 
+int livepatch_re_inline(const int32_t *ret_start, const int32_t *ret_end)
+{
+    return re_inline_ret(ret_start, ret_end);
+}
+
 int livepatch_apply_alt_calls(const struct alt_call *start,
                               const struct alt_call *end)
 {
@@ -473,6 +572,7 @@ static unsigned int __initdata alt_done;
 
 extern struct alt_instr __alt_instructions[], __alt_instructions_end[];
 extern struct alt_call __alt_call_sites_start[], __alt_call_sites_end[];
+extern const int32_t __ret_thunk_sites_start[], __ret_thunk_sites_end[];
 
 /*
  * At boot time, we patch alternatives in NMI context.  This means that the
@@ -508,6 +608,10 @@ static int __init cf_check nmi_apply_alt
                                      __alt_instructions_end);
             if ( rc )
                 panic("Unable to apply alternatives: %d\n", rc);
+
+            rc = re_inline_ret(__ret_thunk_sites_start, __ret_thunk_sites_end);
+            if ( rc )
+                panic("Unable to re-inline RETs: %d\n", rc);
         }
 
         if ( alt_todo & ALT_CALLS )
--- a/xen/arch/x86/clear_page.S
+++ b/xen/arch/x86/clear_page.S
@@ -16,9 +16,6 @@
         add     $32, %rdi
         sub     $1, %ecx
         jnz     0b
-
-        sfence
-        RET
         .endm
 
         .macro clear_page_clzero
@@ -33,13 +30,23 @@ clear_page_clzero_post_count:
 clear_page_clzero_post_neg_size:
         sub     $1, %ecx
         jnz     0b
-
+        /*
+         * Have a (seemingly redundant) RET (and the accompanying SFENCE) here
+         * to avoid executing a longer (sequence of) NOP(s).
+         */
         sfence
         RET
         .endm
 
 FUNC(clear_page_cold)
         ALTERNATIVE clear_page_sse2, clear_page_clzero, X86_FEATURE_CLZERO
+        /*
+         * Having the RET (and the accompanying SFENCE) here instead of in the
+         * clear_page_sse2 macro above makes sure it won't be overwritten with
+         * a NOP by alternatives patching.
+         */
+        sfence
+        RET
 END(clear_page_cold)
 
         .macro clear_page_stosb
--- a/xen/arch/x86/include/asm/asm-defns.h
+++ b/xen/arch/x86/include/asm/asm-defns.h
@@ -41,7 +41,10 @@
 .endm
 
 #ifdef CONFIG_RETURN_THUNK
-# define RET jmp __x86_return_thunk
+# define RET 1: jmp __x86_return_thunk;                     \
+             .pushsection .ret_thunk_sites, "a", @progbits; \
+             .long 1b - .;                                  \
+             .popsection
 #else
 # define RET ret
 #endif
--- a/xen/arch/x86/memcpy.S
+++ b/xen/arch/x86/memcpy.S
@@ -1,5 +1,10 @@
 #include <asm/asm_defns.h>
 
+        .macro rep_movsb_ret
+        rep movsb
+        RET
+        .endm
+
 FUNC(memcpy)
         mov     %rdx, %rcx
         mov     %rdi, %rax
@@ -10,7 +15,7 @@ FUNC(memcpy)
          * precautions were taken).
          */
         ALTERNATIVE "and $7, %edx; shr $3, %rcx", \
-                    STR(rep movsb; RET), X86_FEATURE_ERMS
+                    rep_movsb_ret, X86_FEATURE_ERMS
         rep movsq
         or      %edx, %ecx
         jz      1f
--- a/xen/arch/x86/memset.S
+++ b/xen/arch/x86/memset.S
@@ -13,7 +13,6 @@
         rep stosb
 0:
         mov     %r8, %rax
-        RET
 .endm
 
 .macro memset_erms
@@ -21,10 +20,19 @@
         mov     %rdi, %r8
         rep stosb
         mov     %r8, %rax
+        /*
+         * Have a (seemingly redundant) RET here to avoid executing
+         * a longer (sequence of) NOP(s).
+         */
         RET
 .endm
 
 FUNC(memset)
         mov     %rdx, %rcx
         ALTERNATIVE memset, memset_erms, X86_FEATURE_ERMS
+        /*
+         * Having the RET here instead of in the memset macro above makes
+         * sure it won't be overwritten with a NOP by alternatives patching.
+         */
+        RET
 END(memset)
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -267,6 +267,11 @@ SECTIONS
         *(.alt_call_sites)
         __alt_call_sites_end = .;
 
+        . = ALIGN(4);
+        __ret_thunk_sites_start = .;
+        *(.ret_thunk_sites)
+        __ret_thunk_sites_end = .;
+
        LOCK_PROFILE_DATA
 
        . = ALIGN(8);

