Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F3EA465D9
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 17:00:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896911.1305657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnJps-0002fF-Cl; Wed, 26 Feb 2025 16:00:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896911.1305657; Wed, 26 Feb 2025 16:00:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnJps-0002ca-9m; Wed, 26 Feb 2025 16:00:36 +0000
Received: by outflank-mailman (input) for mailman id 896911;
 Wed, 26 Feb 2025 16:00:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J4Ti=VR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tnJpr-0002Py-8q
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 16:00:35 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf5604f3-f45a-11ef-9897-31a8f345e629;
 Wed, 26 Feb 2025 17:00:33 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43aac0390e8so22836495e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 08:00:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390d6a32299sm2535350f8f.55.2025.02.26.08.00.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 08:00:32 -0800 (PST)
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
X-Inumbo-ID: cf5604f3-f45a-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740585633; x=1741190433; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=D+CKkR+j2M4Mqv5dlSHtbrORp59DxnwtcFhQ1DGX4dY=;
        b=aSk4FK2X9nVadXNAyDapDmErtkHiwf2bJf5E1G5NONo52wccgppjKd5wMpyLOxX8rl
         TfXJaQFehWbIYva9jPsvH1PsBCihHKYp7cVO3RnV6f3ld6km28eCwXn4yV6+Y9D1smWT
         GsleXiU3NRhFeXNooLF3NAvN+xrx1OgeO8v0s3YAM7ys29C1cJhAhDbKtVKdQrq+7OLl
         sevsqhTg3+xWBF8cb0hlnQiqvh5nyNegH7rgg2ICSIjezUouSva3jhYs0KpveawlF3ZW
         lCiy3mTslUbkoRrE66XoXzzcktA340fAcTv1CKgqzltk4c8GDMHQnsKWbiJuRdPq7U8H
         kmBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740585633; x=1741190433;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D+CKkR+j2M4Mqv5dlSHtbrORp59DxnwtcFhQ1DGX4dY=;
        b=D73TpiPjRqQWhYN6SPVZREkaxzcUllz0ZcUGjTwyBvyZAHROHF9YdsGVUbD/D3zueq
         aOXWxWhR+2dF+GPL/x6rCF5eWm7O51DKAu7qHJOo++5dtvvQnD1Aj7y0M5sIPfkIlPZo
         knAUgTLWLldKuAofqH3EdYd+iizWLnOvsIhZKeCjPzX41bzfvgXuMniN73nNK1rX5qEV
         7F4BQXE4o/5wg5uHBQul+KA6mLMd7rL6n+0SSb2Yha5p9KbnOmjkzy8Fosw3xr9tHUNk
         +E4gaQ11AYSjZWY94B2tHwPF4d1es+vh6U4QTOoiYPptYjNk+hZabRleBYRwUN4a+7Nq
         zPbA==
X-Gm-Message-State: AOJu0YzOlIqfXiJD6balWkBMjw/kR05JwXLxxr9GNNQczE1K3wFQE2rx
	I3o4+9fG92w/zUzyuiJGxP/q20QHTNg/llV8vazXAoqYPDAFL1ZbNFD0OPMEKybowtbU1JzYxHQ
	=
X-Gm-Gg: ASbGncvp5LZHyPXllXKgoNjkyzTHZYnzx8CLmKwp4HsnnImMOexUGrP2O1GKxJa/BjB
	btbrovGzxF2u0/teZ20CdpLQPIPwHU19P/LLRA1ji+OMij92XuP4EfPGY0/EafbDAAl/bBv3kf5
	lWiUtLHQKsGo1iieA5hqsD0qRVZBJlmWjKk+nw8TKQBIyEHpplnVzDYStjTm0QklCf3/JBH+FGo
	c0u2dQU35TgjL3r5y9qNZNHAvpTxOmQ5AhBftoFMQbtrvft+BTaOPjizxkh91hp84MgUSHZZhhb
	LlEHbsb5a9OBn0dV6kAEUqp0aVXiXmM6rtZAqcrt52wjMaP/MINm9U0ndbjw2JjTLqQHeeTLQ9K
	gwsXmJN8rKAQ=
X-Google-Smtp-Source: AGHT+IEKIlzc8rxwtOF/N70JPmQ+kQjQvUJqinOlbiwFlp63x3okziHNobjIx5EPm96Uors/lLdk9Q==
X-Received: by 2002:a05:6000:2c2:b0:38f:503c:ad80 with SMTP id ffacd0b85a97d-38f6e74f395mr18118189f8f.5.1740585632843;
        Wed, 26 Feb 2025 08:00:32 -0800 (PST)
Message-ID: <58dcc724-5a61-40d3-82f9-67d1c9b2f69c@suse.com>
Date: Wed, 26 Feb 2025 17:00:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v8 1/6] Arm32: use new-style entry annotations for library
 code
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <e09dacac-b673-43fa-9a1c-3a3a5b5d802a@suse.com>
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
In-Reply-To: <e09dacac-b673-43fa-9a1c-3a3a5b5d802a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

No functional change, albeit all globals now become hidden, and aliasing
symbols (__aeabi_{u,}idiv) lose their function-ness and size.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
If the function-ness was important (Julien says it likely isn't), some
new construct would need inventing. Not setting size for the aliases may
even be desirable, as I'm uncertain whether it is really legal in ELF
that two entities overlap in space.
---
v8: Re-base.
v7: New.

--- a/xen/arch/arm/arm32/lib/findbit.S
+++ b/xen/arch/arm/arm32/lib/findbit.S
@@ -20,7 +20,7 @@
  * Purpose  : Find a 'zero' bit
  * Prototype: int find_first_zero_bit(void *addr, unsigned int maxbit);
  */
-ENTRY(_find_first_zero_bit_le)
+FUNC(_find_first_zero_bit_le)
 		teq	r1, #0	
 		beq	3f
 		mov	r2, #0
@@ -35,13 +35,13 @@ ENTRY(_find_first_zero_bit_le)
 		blo	1b
 3:		mov	r0, r1			@ no free bits
 		mov	pc, lr
-ENDPROC(_find_first_zero_bit_le)
+END(_find_first_zero_bit_le)
 
 /*
  * Purpose  : Find next 'zero' bit
  * Prototype: int find_next_zero_bit(void *addr, unsigned int maxbit, int offset)
  */
-ENTRY(_find_next_zero_bit_le)
+FUNC(_find_next_zero_bit_le)
 		cmp	r1, r2
 		bls	3b
 		ands	ip, r2, #7
@@ -55,13 +55,13 @@ ENTRY(_find_next_zero_bit_le)
 		orr	r2, r2, #7		@ if zero, then no bits here
 		add	r2, r2, #1		@ align bit pointer
 		b	2b			@ loop for next bit
-ENDPROC(_find_next_zero_bit_le)
+END(_find_next_zero_bit_le)
 
 /*
  * Purpose  : Find a 'one' bit
  * Prototype: int find_first_bit(const unsigned long *addr, unsigned int maxbit);
  */
-ENTRY(_find_first_bit_le)
+FUNC(_find_first_bit_le)
 		teq	r1, #0	
 		beq	3f
 		mov	r2, #0
@@ -76,13 +76,13 @@ ENTRY(_find_first_bit_le)
 		blo	1b
 3:		mov	r0, r1			@ no free bits
 		mov	pc, lr
-ENDPROC(_find_first_bit_le)
+END(_find_first_bit_le)
 
 /*
  * Purpose  : Find next 'one' bit
  * Prototype: int find_next_zero_bit(void *addr, unsigned int maxbit, int offset)
  */
-ENTRY(_find_next_bit_le)
+FUNC(_find_next_bit_le)
 		cmp	r1, r2
 		bls	3b
 		ands	ip, r2, #7
@@ -95,11 +95,11 @@ ENTRY(_find_next_bit_le)
 		orr	r2, r2, #7		@ if zero, then no bits here
 		add	r2, r2, #1		@ align bit pointer
 		b	2b			@ loop for next bit
-ENDPROC(_find_next_bit_le)
+END(_find_next_bit_le)
 
 #ifdef __ARMEB__
 
-ENTRY(_find_first_zero_bit_be)
+FUNC(_find_first_zero_bit_be)
 		teq	r1, #0
 		beq	3f
 		mov	r2, #0
@@ -114,9 +114,9 @@ ENTRY(_find_first_zero_bit_be)
 		blo	1b
 3:		mov	r0, r1			@ no free bits
 		mov	pc, lr
-ENDPROC(_find_first_zero_bit_be)
+END(_find_first_zero_bit_be)
 
-ENTRY(_find_next_zero_bit_be)
+FUNC(_find_next_zero_bit_be)
 		cmp	r1, r2
 		bls	3b
 		ands	ip, r2, #7
@@ -131,9 +131,9 @@ ENTRY(_find_next_zero_bit_be)
 		orr	r2, r2, #7		@ if zero, then no bits here
 		add	r2, r2, #1		@ align bit pointer
 		b	2b			@ loop for next bit
-ENDPROC(_find_next_zero_bit_be)
+END(_find_next_zero_bit_be)
 
-ENTRY(_find_first_bit_be)
+FUNC(_find_first_bit_be)
 		teq	r1, #0
 		beq	3f
 		mov	r2, #0
@@ -148,9 +148,9 @@ ENTRY(_find_first_bit_be)
 		blo	1b
 3:		mov	r0, r1			@ no free bits
 		mov	pc, lr
-ENDPROC(_find_first_bit_be)
+END(_find_first_bit_be)
 
-ENTRY(_find_next_bit_be)
+FUNC(_find_next_bit_be)
 		cmp	r1, r2
 		bls	3b
 		ands	ip, r2, #7
@@ -164,7 +164,7 @@ ENTRY(_find_next_bit_be)
 		orr	r2, r2, #7		@ if zero, then no bits here
 		add	r2, r2, #1		@ align bit pointer
 		b	2b			@ loop for next bit
-ENDPROC(_find_next_bit_be)
+END(_find_next_bit_be)
 
 #endif
 
--- a/xen/arch/arm/arm32/lib/lib1funcs.S
+++ b/xen/arch/arm/arm32/lib/lib1funcs.S
@@ -201,8 +201,8 @@ along with this program; see the file CO
 .endm
 
 
-ENTRY(__udivsi3)
-ENTRY(__aeabi_uidiv)
+FUNC(__udivsi3)
+LABEL(__aeabi_uidiv)
 UNWIND(.fnstart)
 
 	subs	r2, r1, #1
@@ -228,10 +228,9 @@ UNWIND(.fnstart)
 	mov	pc, lr
 
 UNWIND(.fnend)
-ENDPROC(__udivsi3)
-ENDPROC(__aeabi_uidiv)
+END(__udivsi3)
 
-ENTRY(__umodsi3)
+FUNC(__umodsi3)
 UNWIND(.fnstart)
 
 	subs	r2, r1, #1			@ compare divisor with 1
@@ -247,10 +246,10 @@ UNWIND(.fnstart)
 	mov	pc, lr
 
 UNWIND(.fnend)
-ENDPROC(__umodsi3)
+END(__umodsi3)
 
-ENTRY(__divsi3)
-ENTRY(__aeabi_idiv)
+FUNC(__divsi3)
+LABEL(__aeabi_idiv)
 UNWIND(.fnstart)
 
 	cmp	r1, #0
@@ -289,10 +288,9 @@ UNWIND(.fnstart)
 	mov	pc, lr
 
 UNWIND(.fnend)
-ENDPROC(__divsi3)
-ENDPROC(__aeabi_idiv)
+END(__divsi3)
 
-ENTRY(__modsi3)
+FUNC(__modsi3)
 UNWIND(.fnstart)
 
 	cmp	r1, #0
@@ -314,11 +312,11 @@ UNWIND(.fnstart)
 	mov	pc, lr
 
 UNWIND(.fnend)
-ENDPROC(__modsi3)
+END(__modsi3)
 
 #ifdef CONFIG_AEABI
 
-ENTRY(__aeabi_uidivmod)
+FUNC(__aeabi_uidivmod)
 UNWIND(.fnstart)
 UNWIND(.save {r0, r1, ip, lr}	)
 
@@ -330,9 +328,9 @@ UNWIND(.save {r0, r1, ip, lr}	)
 	mov	pc, lr
 
 UNWIND(.fnend)
-ENDPROC(__aeabi_uidivmod)
+END(__aeabi_uidivmod)
 
-ENTRY(__aeabi_idivmod)
+FUNC(__aeabi_idivmod)
 UNWIND(.fnstart)
 UNWIND(.save {r0, r1, ip, lr}	)
 	stmfd	sp!, {r0, r1, ip, lr}
@@ -343,9 +341,9 @@ UNWIND(.save {r0, r1, ip, lr}	)
 	mov	pc, lr
 
 UNWIND(.fnend)
-ENDPROC(__aeabi_idivmod)
+END(__aeabi_idivmod)
 
-ENTRY(__aeabi_uldivmod)
+FUNC(__aeabi_uldivmod)
 UNWIND(.fnstart)
 UNWIND(.save {lr}	)
 	sub sp, sp, #8
@@ -357,9 +355,9 @@ UNWIND(.save {lr}	)
 	mov	pc, lr
 
 UNWIND(.fnend)
-ENDPROC(__aeabi_uldivmod)
+END(__aeabi_uldivmod)
 
-ENTRY(__aeabi_ldivmod)
+FUNC(__aeabi_ldivmod)
 UNWIND(.fnstart)
 UNWIND(.save {lr}	)
 	sub sp, sp, #16
@@ -371,10 +369,10 @@ UNWIND(.save {lr}	)
 	mov	pc, lr
 	
 UNWIND(.fnend)
-ENDPROC(__aeabi_ldivmod)
+END(__aeabi_ldivmod)
 #endif
 
-Ldiv0:
+FUNC_LOCAL(Ldiv0)
 UNWIND(.fnstart)
 UNWIND(.pad #4)
 UNWIND(.save {lr})
@@ -383,4 +381,4 @@ UNWIND(.save {lr})
 	mov	r0, #0			@ About as wrong as it could be.
 	ldr	pc, [sp], #8
 UNWIND(.fnend)
-ENDPROC(Ldiv0)
+END(Ldiv0)
--- a/xen/arch/arm/arm32/lib/lshrdi3.S
+++ b/xen/arch/arm/arm32/lib/lshrdi3.S
@@ -34,8 +34,8 @@ along with this program; see the file CO
 #define ah r1
 #endif
 
-ENTRY(__lshrdi3)
-ENTRY(__aeabi_llsr)
+FUNC(__lshrdi3)
+LABEL(__aeabi_llsr)
 
 	subs	r3, r2, #32
 	rsb	ip, r2, #32
@@ -47,5 +47,4 @@ ENTRY(__aeabi_llsr)
 	mov	ah, ah, lsr r2
 	mov	pc, lr
 
-ENDPROC(__lshrdi3)
-ENDPROC(__aeabi_llsr)
+END(__lshrdi3)
--- a/xen/arch/arm/arm32/lib/memchr.S
+++ b/xen/arch/arm/arm32/lib/memchr.S
@@ -12,8 +12,7 @@
 #include "assembler.h"
 
 	.text
-	.align	5
-ENTRY(memchr)
+FUNC(memchr, 32)
 	and	r1, r1, #0xff
 1:	subs	r2, r2, #1
 	bmi	2f
@@ -23,4 +22,4 @@ ENTRY(memchr)
 	sub	r0, r0, #1
 2:	movne	r0, #0
 	mov	pc, lr
-ENDPROC(memchr)
+END(memchr)
--- a/xen/arch/arm/arm32/lib/memcpy.S
+++ b/xen/arch/arm/arm32/lib/memcpy.S
@@ -54,8 +54,8 @@
 
 /* Prototype: void *memcpy(void *dest, const void *src, size_t n); */
 
-ENTRY(memcpy)
+FUNC(memcpy)
 
 #include "copy_template.S"
 
-ENDPROC(memcpy)
+END(memcpy)
--- a/xen/arch/arm/arm32/lib/memmove.S
+++ b/xen/arch/arm/arm32/lib/memmove.S
@@ -24,7 +24,7 @@
  * occurring in the opposite direction.
  */
 
-ENTRY(memmove)
+FUNC(memmove)
 
 		subs	ip, r0, r1
 		cmphi	r2, ip
@@ -194,4 +194,4 @@ ENTRY(memmove)
 
 18:		backward_copy_shift	push=24	pull=8
 
-ENDPROC(memmove)
+END(memmove)
--- a/xen/arch/arm/arm32/lib/memset.S
+++ b/xen/arch/arm/arm32/lib/memset.S
@@ -12,9 +12,8 @@
 #include "assembler.h"
 
 	.text
-	.align	5
 
-ENTRY(memset)
+FUNC(memset, 32)
 	and	r1, r1, #0xff
 	ands	r3, r0, #3		@ 1 unaligned?
 	mov	ip, r0			@ preserve r0 as return value
@@ -120,4 +119,4 @@ ENTRY(memset)
 	strb	r1, [ip], #1		@ 1
 	add	r2, r2, r3		@ 1 (r2 = r2 - (4 - r3))
 	b	1b
-ENDPROC(memset)
+END(memset)
--- a/xen/arch/arm/arm32/lib/strchr.S
+++ b/xen/arch/arm/arm32/lib/strchr.S
@@ -14,8 +14,7 @@
 #include "assembler.h"
 
 		.text
-		.align	5
-ENTRY(strchr)
+FUNC(strchr, 32)
 		and	r1, r1, #0xff
 1:		ldrb	r2, [r0], #1
 		teq	r2, r1
@@ -25,4 +24,4 @@ ENTRY(strchr)
 		movne	r0, #0
 		subeq	r0, r0, #1
 		mov	pc, lr
-ENDPROC(strchr)
+END(strchr)
--- a/xen/arch/arm/arm32/lib/strrchr.S
+++ b/xen/arch/arm/arm32/lib/strrchr.S
@@ -12,8 +12,7 @@
 #include "assembler.h"
 
 		.text
-		.align	5
-ENTRY(strrchr)
+FUNC(strrchr, 32)
 		and	r1, r1, #0xff
 		mov	r3, #0
 1:		ldrb	r2, [r0], #1
@@ -23,4 +22,4 @@ ENTRY(strrchr)
 		bne	1b
 		mov	r0, r3
 		mov	pc, lr
-ENDPROC(strrchr)
+END(strrchr)


