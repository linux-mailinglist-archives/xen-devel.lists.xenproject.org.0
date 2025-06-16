Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF43ADB0F3
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 15:02:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017235.1394212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR9TL-00076F-28; Mon, 16 Jun 2025 13:01:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017235.1394212; Mon, 16 Jun 2025 13:01:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR9TK-00073B-VP; Mon, 16 Jun 2025 13:01:58 +0000
Received: by outflank-mailman (input) for mailman id 1017235;
 Mon, 16 Jun 2025 13:01:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jh7D=Y7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uR9TK-00072w-9k
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 13:01:58 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1578a124-4ab2-11f0-a309-13f23c93f187;
 Mon, 16 Jun 2025 15:01:57 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-553be4d2fbfso1375852e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Jun 2025 06:01:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-748900b0d07sm6718883b3a.114.2025.06.16.06.01.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jun 2025 06:01:53 -0700 (PDT)
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
X-Inumbo-ID: 1578a124-4ab2-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750078917; x=1750683717; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uAx+h4vdQMnFmuPeDTCptQ0FqB53/bxqCnS75yppj5g=;
        b=WZ0SPab/uQmIKxX5ZZRbfrI/v6cqQ1TP2w15L+7hmDvYdhSGCy+XTmOaAWH/hQ2ue7
         w+Iftj5wgLNCZQgnr8LJhA14RW7fNWLUvC56RTOtNayx3gEbDxhu8rOHw4TAqpNWUVvS
         lJL5CmcyE08DczrxF4VOcqmSZBEwMXww1PLFqOw5kOpqpTSmSqOTPw6vKByra4ym8p+z
         qkhxb2L3NJmqbOGPP3zKW/RnvEzFppeBYvFfoqRxYj5Vn9pV0R+V1D6+g29XJU1CuBTS
         dNfxUON7tpl+Bw/+MCzyEXuYpOdT3YXlDjwvMrWu4IXZQq8T5Q4tsAmEuY1jdzieX84S
         KcRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750078917; x=1750683717;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uAx+h4vdQMnFmuPeDTCptQ0FqB53/bxqCnS75yppj5g=;
        b=C8yyh7NXQQ7AyapY7r4pHMapzWIjD8zas0VL+lbBwvOuvh0Vt38p6uvMDU5cIaajNf
         +v+lEt7rvDS4sTeLy6BRp8FhsGV0f5cxVBmC8MtIOiq03icTnZCjN+ewOSyP/n3/Auge
         POnV57ByLrI6sndkZ2SBuky+Bh2cs0UZt8WCdL+O3+yE0GTLqIITzgrI5PJapFaU+nWP
         B8VIH/Q6+Sz81U/JksFS1Wg1XTeaNbtASE9yu8yhlPBMzA4+ZdRRgti9Uz+fFvef24k2
         ILIgdiL9QaTTMYhPnw4kqUOM1V9Mh0ec5e+VT9x8yNaDjrWZ6C/1f+YI3uSPz9VsU4/1
         ShmA==
X-Gm-Message-State: AOJu0Yzto8meqCdu/EUiXrOIHEwGrbVA7PgmnHzUpHXUZG4/wVyxeW71
	ZeP/VDJlAMgOWuSZMWup4ZbNevhKEAKTjIUPVLNJlnh8yDrU4S0BWwJggRSLVG91Fqd5TtbXZQO
	lAQI=
X-Gm-Gg: ASbGnctVF8CVO3oImWFrfybn9HS3uHI04NqmGnoXjiRSTORcyuHPtWYHgWOjUbjyJk7
	6XjihcFjic96kuWrSYK+uXuxhz7ostqqSHUUqAPlc1PBLFTpXGnX9TDpfSr0o3pMeRDWc3tsO8v
	XZZRmcu5B3x/joj2cXUTk88uMy8D1+nRrIEL5yGv7DhwsK17IFvawnOyC+G5wq94La7I2uYZJJ7
	jgSfkgyKUbhgE1Mle9Ei/9PDnG90R8Ud/iwh3NhHfB8zfnCbjGxWYzRSfSkKV/ebU21+SbNd1YZ
	0yhHUnDcTBOH6+cp8QOJfbif78UF9ON/SyNnx4hYSdOqe9T2GC3lRDyrxgeS1xvNuUHoHcj0v7C
	1kTnh6TT82Iii6t459Hv8wJe0HlZMi6+OdKMZiSowupZ5WctwB21F7fA12w==
X-Google-Smtp-Source: AGHT+IH/LQefGMLIyKc9oY2HjcKqXbVrCil1vf/R5BUo8lps01W8HAeW7Hf3ZcEI6+G7CvfD74aofA==
X-Received: by 2002:a05:6512:308b:b0:553:2438:8d02 with SMTP id 2adb3069b0e04-553b6f32e7emr2019776e87.47.1750078914340;
        Mon, 16 Jun 2025 06:01:54 -0700 (PDT)
Message-ID: <da50f208-74a4-41dc-ad6a-978c42e6b28b@suse.com>
Date: Mon, 16 Jun 2025 15:01:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v6 6/7] x86: introduce "hot" and "cold" page clearing
 functions
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <c5e1e7e0-a295-4028-b003-152b861ee14f@suse.com>
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
In-Reply-To: <c5e1e7e0-a295-4028-b003-152b861ee14f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The present clear_page_sse2() is useful in case a page isn't going to
get touched again soon, or if we want to limit churn on the caches.
Amend it by alternatively using CLZERO, which has been found to be quite
a bit faster on Zen2 hardware at least. Note that to use CLZERO, we need
to know the cache line size, and hence a feature dependency on CLFLUSH
gets introduced.

For cases where latency is the most important aspect, or when it is
expected that sufficiently large parts of a page will get accessed again
soon after the clearing, introduce a "hot" alternative. Again use
alternatives patching to select between a "legacy" and an ERMS variant.

Don't switch any callers just yet - this will be the subject of
subsequent changes.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v5: Re-base.
v3: Re-base.
v2: New.
---
Note: Ankur indicates that for ~L3-size or larger regions MOVNT/CLZERO
      is better even latency-wise.

--- a/xen/arch/x86/clear_page.S
+++ b/xen/arch/x86/clear_page.S
@@ -5,7 +5,7 @@
 #include <asm/asm_defns.h>
 #include <asm/page.h>
 
-FUNC(clear_page_sse2)
+        .macro clear_page_sse2
         mov     $PAGE_SIZE/32, %ecx
         xor     %eax,%eax
 
@@ -19,4 +19,42 @@ FUNC(clear_page_sse2)
 
         sfence
         RET
-END(clear_page_sse2)
+        .endm
+
+        .macro clear_page_clzero
+        mov     %rdi, %rax
+        mov     $PAGE_SIZE/64, %ecx
+        .globl clear_page_clzero_post_count
+clear_page_clzero_post_count:
+
+0:      clzero
+        sub     $-64, %rax
+        .globl clear_page_clzero_post_neg_size
+clear_page_clzero_post_neg_size:
+        sub     $1, %ecx
+        jnz     0b
+
+        sfence
+        RET
+        .endm
+
+FUNC(clear_page_cold)
+        ALTERNATIVE clear_page_sse2, clear_page_clzero, X86_FEATURE_CLZERO
+END(clear_page_cold)
+
+        .macro clear_page_stosb
+        mov     $PAGE_SIZE, %ecx
+        xor     %eax,%eax
+        rep stosb
+        .endm
+
+        .macro clear_page_stosq
+        mov     $PAGE_SIZE/8, %ecx
+        xor     %eax, %eax
+        rep stosq
+        .endm
+
+FUNC(clear_page_hot)
+        ALTERNATIVE clear_page_stosq, clear_page_stosb, X86_FEATURE_ERMS
+        RET
+END(clear_page_hot)
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -60,6 +60,9 @@ DEFINE_PER_CPU(bool, full_gdt_loaded);
 
 DEFINE_PER_CPU(uint32_t, pkrs);
 
+extern uint32_t clear_page_clzero_post_count[];
+extern int8_t clear_page_clzero_post_neg_size[];
+
 void __init setup_clear_cpu_cap(unsigned int cap)
 {
 	const uint32_t *dfs;
@@ -357,8 +360,38 @@ void __init early_cpu_init(bool verbose)
 
 	edx &= ~cleared_caps[FEATURESET_1d];
 	ecx &= ~cleared_caps[FEATURESET_1c];
-	if (edx & cpufeat_mask(X86_FEATURE_CLFLUSH))
-		c->x86_cache_alignment = ((ebx >> 8) & 0xff) * 8;
+	if (edx & cpufeat_mask(X86_FEATURE_CLFLUSH)) {
+		unsigned int size = ((ebx >> 8) & 0xff) * 8;
+
+		c->x86_cache_alignment = size;
+
+		/*
+		 * Patch in parameters of clear_page_cold()'s CLZERO
+		 * alternative. Note that for now we cap this at 128 bytes.
+		 * Larger cache line sizes would still be dealt with
+		 * correctly, but would cause redundant work done.
+		 */
+		if (size > 128)
+			size = 128;
+		if (size && !(size & (size - 1))) {
+			/*
+			 * Need to play some games to keep the compiler from
+			 * recognizing the negative array index as being out
+			 * of bounds. The labels in assembler code really are
+			 * _after_ the locations to be patched, so the
+			 * negative index is intentional.
+			 */
+			uint32_t *pcount = clear_page_clzero_post_count;
+			int8_t *neg_size = clear_page_clzero_post_neg_size;
+
+			OPTIMIZER_HIDE_VAR(pcount);
+			OPTIMIZER_HIDE_VAR(neg_size);
+			pcount[-1] = PAGE_SIZE / size;
+			neg_size[-1] = -size;
+		}
+		else
+			setup_clear_cpu_cap(X86_FEATURE_CLZERO);
+	}
 	/* Leaf 0x1 capabilities filled in early for Xen. */
 	c->x86_capability[FEATURESET_1d] = edx;
 	c->x86_capability[FEATURESET_1c] = ecx;
--- a/xen/arch/x86/include/asm/asm-defns.h
+++ b/xen/arch/x86/include/asm/asm-defns.h
@@ -1,5 +1,9 @@
 #include <asm/page-bits.h>
 
+.macro clzero
+    .byte 0x0f, 0x01, 0xfc
+.endm
+
 /*
  * Call a noreturn function.  This could be JMP, but CALL results in a more
  * helpful backtrace.  BUG is to catch functions which do decide to return...
--- a/xen/arch/x86/include/asm/page.h
+++ b/xen/arch/x86/include/asm/page.h
@@ -219,10 +219,11 @@ typedef struct { u64 pfn; } pagetable_t;
 #define pagetable_from_paddr(p) pagetable_from_pfn((p)>>PAGE_SHIFT)
 #define pagetable_null()        pagetable_from_pfn(0)
 
-void clear_page_sse2(void *pg);
+void clear_page_hot(void *pg);
+void clear_page_cold(void *pg);
 void copy_page_sse2(void *to, const void *from);
 
-#define clear_page(_p)      clear_page_sse2(_p)
+#define clear_page(_p)      clear_page_cold(_p)
 #define copy_page(_t, _f)   copy_page_sse2(_t, _f)
 
 /* Convert between Xen-heap virtual addresses and machine addresses. */
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -212,6 +212,10 @@ def crunch_numbers(state):
         # the first place.
         APIC: [X2APIC, TSC_DEADLINE, EXTAPIC],
 
+        # The CLZERO insn requires a means to determine the cache line size,
+        # which is tied to the CLFLUSH insn.
+        CLFLUSH: [CLZERO],
+
         # AMD built MMXExtentions and 3DNow as extentions to MMX.
         MMX: [MMXEXT, _3DNOW],
 


