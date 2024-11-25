Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C25939D8800
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 15:29:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842648.1258335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFa5u-00041I-KD; Mon, 25 Nov 2024 14:29:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842648.1258335; Mon, 25 Nov 2024 14:29:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFa5u-0003yz-He; Mon, 25 Nov 2024 14:29:42 +0000
Received: by outflank-mailman (input) for mailman id 842648;
 Mon, 25 Nov 2024 14:29:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mqqh=SU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tFa5t-0002BZ-R1
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 14:29:41 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3c14311-ab39-11ef-a0cd-8be0dac302b0;
 Mon, 25 Nov 2024 15:29:39 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3824709ee03so3233939f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 25 Nov 2024 06:29:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fb25d74sm10672707f8f.47.2024.11.25.06.29.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2024 06:29:38 -0800 (PST)
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
X-Inumbo-ID: b3c14311-ab39-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MmMiLCJoZWxvIjoibWFpbC13cjEteDQyYy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImIzYzE0MzExLWFiMzktMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNTQ0OTc5LjA5ODQ1OCwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732544978; x=1733149778; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Bo1b/k71KJVmsVTKGv+xBBoI5XLp0eOf8O7yEx73nPg=;
        b=gIeUyoxZiSDAkarMXGors94wUDeoN2odcO7sZOsqCLCXBe7GcH/4pj8x1PfH3kI+yg
         s5CCQBVSk6lnue5IZZuvqB/j2aaYq7TySXb0DPoxisqJ6jAJONPuvcGFQVNty3h4lxWO
         wnLdnF8s+Qok+PVYaEc1i4meRyXawvCPpln1xEo8SkS4rGOCWsSfSx9ugR7Bq3EpbcoC
         oN2qOaTLpDhMWLqpSxtDu7nNsgWAgNT7kPQd6P1Ew5hm/fBWRoESJzWdoPN9bVPZ28Az
         qJ+stMyXm1vhTrbeR5WPAXRSb2cJ1UBO/a1uP6vH6N83JQFvxTfNv8Sp6ziYHK5/FQMs
         LPcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732544978; x=1733149778;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bo1b/k71KJVmsVTKGv+xBBoI5XLp0eOf8O7yEx73nPg=;
        b=SaZKCjeP3S4E3mKgi3xXOf2BKezXatMYRRLnG/XPi2dJL4IJemf1qKnkiJKbF3vsry
         eDQN10isnCaKtczzyG/eewgWPDeZy77fRK4TPejpBfIAecv36LGiSBEG+8P+0D0RLchW
         w7uAnY1fmrojV8srD4RQPS4Rw7wgK8RdiCVp8d5O0wIfpoU1NUqjg0zIpOESmKK62yEK
         nWFVjd+kmxEEqco4tpcfjXO+EtY5Wv4n8F51blln4PqnSVmRpU3+Uvk540cZ7QvMRLt3
         j774g1rrKxXlCibth7wBMgT6E29zrqbnqU2mM45bPv09mdmKJRTWlk9YD98DUq9kBrc7
         sOiQ==
X-Gm-Message-State: AOJu0YzT1UCjWXSHj90jjTcAzObXQ3mRGcaRFkirNUQRGByJ4FSVU5+Y
	tKLJ7/wvgVPFo4DhXf6n3EbvpRtnhZ4D+79BrtRpmONl8vXjPcURnvPwbA+AlpmhCSO37jSst70
	=
X-Gm-Gg: ASbGncsawxuG4umbXFSOVjqk9HzMJ6snXU3AA50TLlFY+09i1l/CWmfAkzKuxH5ou5d
	PAdV3mPxUeZ+VQbOhtb3VakbXAxJFty8FDWv03+QSN6Bk6uYEKs+AkGWEPZPJSklv/ezr3+FeuJ
	cWS41xTEJQagZZx+QNCH/sQkcofxUrSjEG3UJvvpI15CoSnNI4tFJMHlukRpbf/AwnyPED/kLeV
	eO3pJevK9TNEbLCWp9PuDNA9t72+ZfBb1T2ffoQEFtBDzQOjomkraE6I0VZxPbT56xzT5X5KmRS
	fguTWrOZ7mg6lIaf9Fd9reMuoUXMDAOkp0M=
X-Google-Smtp-Source: AGHT+IGhPzzgGIa5DYDvO52WnZ8bAedlRMF9/46N7NpobcNH5E5vqf1siOpkme2EfIvBbgirB/+gYg==
X-Received: by 2002:a05:6000:156b:b0:382:2e9e:d68c with SMTP id ffacd0b85a97d-38260bcd9c3mr12875662f8f.38.1732544978522;
        Mon, 25 Nov 2024 06:29:38 -0800 (PST)
Message-ID: <250d879a-2e2e-4283-b943-0ae4835c55f0@suse.com>
Date: Mon, 25 Nov 2024 15:29:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 5/7] x86: introduce "hot" and "cold" page clearing
 functions
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <e7314ac8-ed09-4da8-b915-09409b01fe77@suse.com>
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
In-Reply-To: <e7314ac8-ed09-4da8-b915-09409b01fe77@suse.com>
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
v3: Re-base.
v2: New.
---
Note: Ankur indicates that for ~L3-size or larger regions MOVNT/CLZERO
      is better even latency-wise.

--- a/xen/arch/x86/clear_page.S
+++ b/xen/arch/x86/clear_page.S
@@ -1,9 +1,9 @@
         .file __FILE__
 
-#include <xen/linkage.h>
-#include <asm/page.h>
+#include <xen/page-size.h>
+#include <asm/asm_defns.h>
 
-FUNC(clear_page_sse2)
+        .macro clear_page_sse2
         mov     $PAGE_SIZE/32, %ecx
         xor     %eax,%eax
 
@@ -17,4 +17,43 @@ FUNC(clear_page_sse2)
 
         sfence
         ret
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
+        ret
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
+        ret
+        .endm
+
+        .macro clear_page_stosq
+        mov     $PAGE_SIZE/8, %ecx
+        xor     %eax, %eax
+        rep stosq
+        ret
+        .endm
+
+FUNC(clear_page_hot)
+        ALTERNATIVE clear_page_stosq, clear_page_stosb, X86_FEATURE_ERMS
+END(clear_page_hot)
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -58,6 +58,9 @@ DEFINE_PER_CPU(bool, full_gdt_loaded);
 
 DEFINE_PER_CPU(uint32_t, pkrs);
 
+extern uint32_t clear_page_clzero_post_count[];
+extern int8_t clear_page_clzero_post_neg_size[];
+
 void __init setup_clear_cpu_cap(unsigned int cap)
 {
 	const uint32_t *dfs;
@@ -355,8 +358,38 @@ void __init early_cpu_init(bool verbose)
 
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
@@ -20,6 +20,10 @@
     .byte 0x0f, 0x01, 0xdd
 .endm
 
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
 


