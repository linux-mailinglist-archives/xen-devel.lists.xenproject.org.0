Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91448A5ED93
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 09:07:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911336.1317784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsdam-0002RF-FG; Thu, 13 Mar 2025 08:07:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911336.1317784; Thu, 13 Mar 2025 08:07:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsdam-0002PV-Ca; Thu, 13 Mar 2025 08:07:00 +0000
Received: by outflank-mailman (input) for mailman id 911336;
 Thu, 13 Mar 2025 08:06:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tsdak-0002PI-Lh
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 08:06:58 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2237ef2a-ffe2-11ef-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 09:06:57 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-391342fc148so399774f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 01:06:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a8d0ab1sm44657825e9.34.2025.03.13.01.06.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 01:06:55 -0700 (PDT)
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
X-Inumbo-ID: 2237ef2a-ffe2-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741853217; x=1742458017; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7619zjoO2xByYDNkGfqdj7sygU5oz+pkl2wMtVZ3RHY=;
        b=MayZ0brQPLbMwJZVcU587A7qyGnO7m+v1fjMvSGYo3UwRlpje9nFHY5YqQoUUfXfQP
         UziLZipGMw8swgDIvS6BM4rXZ7FerFidBAWiJ0gVQh9dcXbSc2nTYRrlYWF4K+KZXOKj
         islPyeznqrU2/tcI4ubWrj5Z34Nh4jwjW7pv0H54WtkicALNO/ycJWyc1BYonAZGCKUy
         2Y0HqFbQwqa4BYow4vU+t3BIeehSFE520zA6NHZVGZWBB1YXV9yycKIvJj9msxLmX3cX
         BRA95a79AI5eZ14ixbpJ4C8mX+blpRt+KGe6+wizAzAIAdQ8FYaoNhycXHdQg66u9iyH
         HAcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741853217; x=1742458017;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7619zjoO2xByYDNkGfqdj7sygU5oz+pkl2wMtVZ3RHY=;
        b=gzpKcPT7Kj0XOkp+I8mEIoMqSFmD6gbPbYQ84WwwN637fuhM/8BSTYSagXoHbGM13u
         W+ue22W3jEzLzxxHfhRCRby7APRScgaJat9lfeAHv4iRmLGTFvLfqCM6YWebOdRPcQn1
         nPGvzpyH5Vo7xx8vsZPgvm44XmGgvh7mwwQ7mOqmmac1pl7bvhACEss+hlbxul2u3gVD
         2gRAK46EJo0qJL6ns1GqxeKvg7feIDo2tEwtYYULeHtwGVk3y4H2lQuLtaOZrE7lFYcs
         ViERzAeVZwsA+BzMpbTNR4k3esmCNvnOvBXkvASnKc4liIrPrO1yW/cySm9bID8rVz2Q
         Ygwg==
X-Gm-Message-State: AOJu0YySA1z3V8wD7sr56oKQxtFLuo4xOwtlGHk5HzI4g/IoQvLwLTIS
	6uvyhBcJ8LARPEduuu/PCt1UmLnHjYwEC0eWQPx6P1efyZUY711aN9A6Db9wz/Nj6xSfmNrj0Tk
	=
X-Gm-Gg: ASbGncs7eddKbp/U8EPObYZedR9GB/PkRMNoaYf1ta0TKY7HBC86zEVdEOtBpR1WrNp
	nTGRN1wFpb7CYqUOXrMh68WCCSqj60oSkK7uDiK7QyjdVuRIPqu4CFXAogiRHe0wk22Lo9yRQdk
	3rYREX/uRAJOmsAlZE07kKWn71weoSq3JQWNDdbTvPpd7dWnNnweh3D/p07DUOjGQvZnvp3auoz
	64tLR+qhw1gjzHD5sb2jUn1GvKQWmawdvOypbXryvvyoK2TTQAloQXqdzakJaigv/sR5IfN0ie+
	Y/1773RCirhxuvrBb/VY3cj/CCTkLhoHczrQhvjgIyn5aiP3YFpdLxCM7YnqQAdm2tpwYtQsxNS
	DDUafLT1p0Y+UTJKSznSHtiK5ReGW3w==
X-Google-Smtp-Source: AGHT+IEo1IQ9uoEizqtAsPBqTlrWlQljwbYaHMwlndpgBGDZcWP6V8gULeLoTzD2HCpCF/fW/TARCw==
X-Received: by 2002:a5d:47cd:0:b0:390:f902:f973 with SMTP id ffacd0b85a97d-39263b006d0mr7634331f8f.8.1741853216878;
        Thu, 13 Mar 2025 01:06:56 -0700 (PDT)
Message-ID: <6c071ddd-1e9b-44ea-a07c-3d049abefaa3@suse.com>
Date: Thu, 13 Mar 2025 09:06:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v8 RESEND 1/6] Arm32: use new-style entry annotations for
 library code
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <ebc98ba6-4ced-4e74-baa6-089240465eca@suse.com>
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
In-Reply-To: <ebc98ba6-4ced-4e74-baa6-089240465eca@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

No functional change, albeit all globals now become hidden, and aliasing
symbols (__aeabi_{u,}idiv) lose their function-ness and size.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Tested-by: Luca Fancellu <luca.fancellu@arm.com> # arm
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


