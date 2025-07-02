Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C300AAF154A
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 14:18:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031032.1404721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWwPh-0002Ka-98; Wed, 02 Jul 2025 12:18:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031032.1404721; Wed, 02 Jul 2025 12:18:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWwPh-0002It-5G; Wed, 02 Jul 2025 12:18:09 +0000
Received: by outflank-mailman (input) for mailman id 1031032;
 Wed, 02 Jul 2025 12:18:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FQsZ=ZP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWwPf-0000ib-Jw
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 12:18:07 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c28960d-573e-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 14:18:07 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-451d54214adso48220795e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 05:18:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb3c6e09sm128147445ad.227.2025.07.02.05.18.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 05:18:05 -0700 (PDT)
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
X-Inumbo-ID: 9c28960d-573e-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751458686; x=1752063486; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gDGtlTyrnPjFWjh7qBWn4eYhkW3UxiX63jCVI/KDses=;
        b=HBhrQT//sXU0Hdxmz/9yS157KJ118AKM39ImRcN/fK4RaU8hIw9x+5Z4u8F6NwCzS3
         7hTVjxit+PgJlAFAPK2PPh/km8XZ+CoLt0mKTtH6iTeJDcz0ku9/FV60oVW3wS3LXUnQ
         mssVj2kt/sKdi95ltZlGd+Um3lZzTzvDsNXZVat00n8VszpNxhJ7WtvBdJXDJvAO/Eud
         ut5cqPdPGc4eGWLjiR0Z0obk34DdEmCm+CHZmNkB3goLb1Xvh90kvDZEd3368TqD9u1c
         McFcmzzvavU+oCeBfvRvjVsJla00+HgOl28r5zP0T3B0XPtFSl6utFsFT02tAnFeTftp
         60Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751458686; x=1752063486;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gDGtlTyrnPjFWjh7qBWn4eYhkW3UxiX63jCVI/KDses=;
        b=M7WrHm7pZkm8Upornx3n5kaKnyVEPVojj7jsvKwFN43Z86ZOWlajs3wSW8fHyBYCll
         sKWcWhk1vRge9N2GpHWxZ3qYuBoqZCv1dEn8DhwTo3KRyGBx5gtnIh523VOKF9yZmRvX
         BODExEuo0gcYbyQu1l049kyFtrAxmBNBtUxt75b05QP1iBxqUQz65FCkmU8SHmgficoy
         eiZPv1V2tyou30tv/VR4yflqTvsD8pixJt7K94r3jOODlG10H3viG3QBxnmP0DZsj0J5
         /xvokWuGMmzAJRK6AeAmpN1b95OqRbMHocIJNxBcSxpQzSP1GkTV3t2gViyvFDVNowZ7
         7+OA==
X-Gm-Message-State: AOJu0Yy/y4cCTIYV6JwpGJ+YlX2O25JBK6tyL1H/yqaPsFoX6KB/naAT
	8XoGwIRYBeEm24y/+svFr4rzWuUAYyAWepGQwV0EyrOynefEfpD06G/yl4plhBDeQJdPhh8hPSD
	fOfU=
X-Gm-Gg: ASbGnct2xXYmpriVun87MJI8GCL5jIGhE17QQdNjpXgB603m+mumLKwIltrNXE93KIs
	qeIrhYkR8YTNewDBGtHXzhRE2A51kkK+XZDpazkFqP0XObcioU9R8Ybwkfj/rFjzFQwxJFkjvN3
	AOrIE6x6Aqj7kxAzN0Qlpr66E65ADwnnigHVX/ZVyW69HHoZK8ETUe47d9oathfiCt/1Z1IeJlW
	8nrQRyClAQd1X3hVCzTl2unhOOb6zshpN55tYd/CUg9iZGkNs6fMCK+72/1zG54kA3DBOJVpzLn
	n1wlzXhaNo0qoED+PIIuv4Sm4XboODn9yqG2c5YoLEoqaX3pXUbkvWXcWOqCnLg5CvgbO9AE6Z3
	JiigAwRQSdrssfdEqiW+vpxvbZhtlyzsttt+FhMkA7ayp2pE=
X-Google-Smtp-Source: AGHT+IEhGfU8kcE5jNxKKY4ZypA5Juy+BK8XfGut3MtTZLHyMcTKN56mhm0UsETKXDKYgFuEYSJrXA==
X-Received: by 2002:a5d:5f81:0:b0:3a4:c2e4:11b with SMTP id ffacd0b85a97d-3b20095cf64mr2118462f8f.51.1751458686134;
        Wed, 02 Jul 2025 05:18:06 -0700 (PDT)
Message-ID: <65db1bac-7f37-44f5-a727-cc5e344eb320@suse.com>
Date: Wed, 2 Jul 2025 14:17:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v7 6/7] x86: introduce "hot" and "cold" page clearing
 functions
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <0b57c6f0-9fd0-4f8a-93f8-dc494a1e952c@suse.com>
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
In-Reply-To: <0b57c6f0-9fd0-4f8a-93f8-dc494a1e952c@suse.com>
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
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
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
 


