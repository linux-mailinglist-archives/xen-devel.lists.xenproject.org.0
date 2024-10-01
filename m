Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CD098C160
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 17:16:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808248.1220124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svebx-0007oS-AB; Tue, 01 Oct 2024 15:16:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808248.1220124; Tue, 01 Oct 2024 15:16:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svebx-0007mL-6p; Tue, 01 Oct 2024 15:16:25 +0000
Received: by outflank-mailman (input) for mailman id 808248;
 Tue, 01 Oct 2024 15:16:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svebv-000652-84
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 15:16:23 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d7b5849-8008-11ef-99a2-01e77a169b0f;
 Tue, 01 Oct 2024 17:16:21 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a8d3cde1103so787256666b.2
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 08:16:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c277726asm740564466b.10.2024.10.01.08.16.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Oct 2024 08:16:20 -0700 (PDT)
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
X-Inumbo-ID: 1d7b5849-8008-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727795781; x=1728400581; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:cc:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BX0i4gwb1cYoJ/9L+SuI1WkYU5iQtnN3mUAMKMP97s4=;
        b=RCkpJqD4xIV3qoz9o5TYKwjnm6t33RQWWkza3RWRzEF1hQcxJU9wTthbP6YanWda+t
         +V8pilSc/1PqCXhxfGdMStfqQugAm4Gatm2juCzebHNb8fjicE4aovikizZHlDXbHk9X
         MtI+D24URGl9Q6yiP3T201EQXVRIJGCVt4CJVHGwQEUwQuxZ/5ZsjgAQ2FbIcQ5rsiEh
         cfj7yYJytA8lGJ82N68cT4+RKruAhOEBRTf6TRt3dhCkTw7rP5dveDs+tvcStNjClkkY
         VI5ziaf6mUMFHzltTpeHW44onGSy37zbp6mr1JpNrGjcZrfQR1DBc0nEDILyRGWpDpm2
         g6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727795781; x=1728400581;
        h=content-transfer-encoding:in-reply-to:autocrypt:cc:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BX0i4gwb1cYoJ/9L+SuI1WkYU5iQtnN3mUAMKMP97s4=;
        b=H6zTR5fVCdmBRuwwcTHV88QmJZ1LKt5IKopOHp3PwZ3uYLKKONSw9XWRlKJAzlnnHM
         cJVThlzwkdVgcsjOF+5Sw9rFFVeJlfduexoGZzMLp2GHzmHEVzjeBZ9Ho4LKtDHQvOJc
         jv9KKwZGC2aBjOw/clUmzWAesmWNOCFCwRtUZJv5VR3RBPUu1NkgjzjmcOGUBvoTG8nQ
         VJgebEyPSy3sIkU8Zv5FaAT7TmgFNCFo2uEDEer4JsyomDQwJ6GFwewgFVaVbAwsfizy
         MrVXN6ifpeF7zqGLBIi95KQwzjxbdqVsRTaS2WqphV0aO4qsu4FEJkFJaNneXl2dVAFg
         OjMQ==
X-Gm-Message-State: AOJu0Yxm+4DMmvdeSe0qrc8CC0LCZ3Mtb9lykVj8iBsIeilZws1tJ/7w
	1YbbC8BtQ4lvC5LJXHpvUudyIm7QHMhIrXS/FaJp+aRessRYn/u7571HevxU0X4XQXuR4ujqsc4
	=
X-Google-Smtp-Source: AGHT+IGSYutHKb4XFDRcmSZy3Dt2qYEdryrw5csvUvdUfLvAN9tiw5+P5gaQxuPH47XeibDLk3EvaA==
X-Received: by 2002:a17:907:1c17:b0:a90:13b6:3ece with SMTP id a640c23a62f3a-a93c49044a8mr1865128966b.15.1727795780961;
        Tue, 01 Oct 2024 08:16:20 -0700 (PDT)
Message-ID: <658f0a05-742e-44ed-bf3f-bd6bb8c694a7@suse.com>
Date: Tue, 1 Oct 2024 17:16:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v7 07/11] Arm32: use new-style entry annotations for library
 code
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <98590a41-cee7-4ba3-a723-4e3ee3b55357@suse.com>
Content-Language: en-US
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
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
In-Reply-To: <98590a41-cee7-4ba3-a723-4e3ee3b55357@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

No functional change, albeit all globals now become hidden, and aliasing
symbols (__aeabi_{u,}idiv) as well as __memzero lose their function-ness
and size.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
If the function-ness is important, some new construct would need
inventing. Not setting size for the aliases may even be desirable, as
I'm uncertain whether it is really legal in ELF that two entities
overlap in space.

I fear I'm breaking __memzero(), as I don't understand the purpose of
the ".word 0" next to where the FUNC_LOCAL() appears.
---
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
--- a/xen/arch/arm/arm32/lib/memzero.S
+++ b/xen/arch/arm/arm32/lib/memzero.S
@@ -10,7 +10,7 @@
 #include "assembler.h"
 
 	.text
-	.align	5
+FUNC_LOCAL(_memzero_, 32)
 	.word	0
 /*
  * Align the pointer in r0.  r3 contains the number of bytes that we are
@@ -29,7 +29,7 @@
  * memzero again.
  */
 
-ENTRY(__memzero)
+LABEL(__memzero)
 	mov	r2, #0			@ 1
 	ands	r3, r0, #3		@ 1 unaligned?
 	bne	1b			@ 1
@@ -121,4 +121,4 @@ ENTRY(__memzero)
 	tst	r1, #1			@ 1 a byte left over
 	strneb	r2, [r0], #1		@ 1
 	mov	pc, lr			@ 1
-ENDPROC(__memzero)
+END(_memzero_)
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


