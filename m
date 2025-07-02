Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14152AF1536
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 14:17:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031016.1404701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWwOl-0001Gw-Q2; Wed, 02 Jul 2025 12:17:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031016.1404701; Wed, 02 Jul 2025 12:17:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWwOl-0001Eg-Mb; Wed, 02 Jul 2025 12:17:11 +0000
Received: by outflank-mailman (input) for mailman id 1031016;
 Wed, 02 Jul 2025 12:17:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FQsZ=ZP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWwOk-0000ib-9f
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 12:17:10 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a1f8bb7-573e-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 14:17:09 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a54690d369so4118814f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 05:17:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb2f1b25sm134818915ad.63.2025.07.02.05.17.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 05:17:08 -0700 (PDT)
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
X-Inumbo-ID: 7a1f8bb7-573e-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751458629; x=1752063429; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RZeSTtfnims00cJDfKtOlaDsz46iqIOaCHm3irCBO80=;
        b=SWhJfc10Sumelm55jwcMTVo2F1jW6/CU/KttdypzDbEdJfiXOzfLapmwzZ3wSMqn0j
         NgnCOkkY7jWKvKjeDk0w6/dEHN6OHUwU8D8HHHh3bRGqe4vhEOpL7tagJhrCnp8HuFQ1
         JwwCfUy3UeA09hiBHqfaHXKujcNOfF3ClszI8TM5FOK/X7VZWP/LrqyrSvBmI2J574Yb
         J7TYpSCa3pnfV/uQd0qaQnVatQhMJC/4fDrtjc2yAccrvl3/lN9+QcjaIB4WvsyaRaba
         zjz2hfECTwLtYw5w2MSw2atMHa4ja5+X3Xas2hAFerilwQJsvlUtvwFgPZicoCptmh/w
         UDUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751458629; x=1752063429;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RZeSTtfnims00cJDfKtOlaDsz46iqIOaCHm3irCBO80=;
        b=qOFQ8+Q1GtUGVgfWwo3t5ZRaugzZZGGj6ljP79pBKPfM/tm2Usvb+wOpJS2VFqa+FJ
         7wbid0fbF1V13ORn/5yVG8BPdDkSgTVOdJabSnUrG3Ml9vQAGo9mCLITs0/2ut2m7iOv
         OsWpzAFBs3c3BABW7QlJjlecY4biIcP5NM2mmI8kdbEl/9JSLZLV/HZxJll+2Fz/JscL
         f6l1AGHtm8rdvyE+5GwJ66RpnOglHT7ydN7g0MGgeYnia+C9km8Vwb4WZxPZ+TfFOddf
         WVyU3qRszv9Jh91qnYXcVw9VBMbQ1kzl444YxhsF4ikYQvMsg9Wcv3VjJrVdsVjs4peP
         dRBg==
X-Gm-Message-State: AOJu0Yx4sRgaaBipe/Np0n0Ot3hsCqc0Z4dQ8uZyfymjKHjRBvNkt0RV
	/UIa/mpTAnRdZA78ptFBmBrT/X1qZqRSa9YuJA/EQw0iYxrRxHJAZfX7IbpylWDbVp9+ZOpQuuc
	Quko=
X-Gm-Gg: ASbGncvhGLbGlVa1MdahshW/JnLIGUXOziegaewl7U7pNsoQSiuL/744MRzuDSxwVEz
	aJCQMc1QfmVgR6doiKUxnhsqJb7cNykF0xVtjO/gK+zEvT4iWYWy/s+h+hDVg9E9g9Om4LtYXbF
	qYQRdcnTj+rjYygs3M1Bg7WGpEBR5mzHj0j+JcwH9bUGsQjsik3kkKaHuaOKlaCId/qm+GLfoZK
	SDFJHIzH1VRqeT9E4KlArXdvP5yE+EFEIy4ElUeJ5at4h9pDTrfaVAG94ClOosgpOrI2F81p/85
	R9zKMdqItmvxA8JYu4VdKFOHPnaR5VAFRUF4PpetLSHhqz9IScOU2ybN2cQVdGrJyLmmIO6VkpP
	qtvMWbBxMU5jdXsyLxQ7VIkMMweKu1UbRIjiER+IB7g61H7k=
X-Google-Smtp-Source: AGHT+IG8uZko8oI04YwbwWvUjWY/Ph7lnYNq6Zzw8cMIdBVS54rMdAaYNmvgkh5Tr8T9zGuQPmkOpg==
X-Received: by 2002:a05:6000:310b:b0:3a6:e2d5:f14c with SMTP id ffacd0b85a97d-3b20048e696mr1860341f8f.30.1751458629160;
        Wed, 02 Jul 2025 05:17:09 -0700 (PDT)
Message-ID: <e749ecd0-9b9a-413d-8a7a-4f4e36487511@suse.com>
Date: Wed, 2 Jul 2025 14:17:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v7 4/7] x86: re-work memcpy()
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

Move the function to its own assembly file. Having it in C just for the
entire body to be an asm() isn't really helpful. Then have two flavors:
A "basic" version using qword steps for the bulk of the operation, and an
ERMS version for modern hardware, to be substituted in via alternatives
patching.

Alternatives patching, however, requires an extra precaution: It uses
memcpy() itself, and hence the function may patch itself. Luckily the
patched-in code only replaces the prolog of the original function. Make
sure this remains this way.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Teddy Astie <teddy.astie@vates.tech>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
We may want to consider branching over the REP MOVSQ as well, if the
number of qwords turns out to be zero.
We may also want to consider using non-REP MOVS{L,W,B} for the tail.

TBD: We may further need a workaround similar to Linux'es 8ca97812c3c8
     ("x86/mce: Work around an erratum on fast string copy
     instructions").

TBD: Some older AMD CPUs have an issue with REP MOVS when source and
     destination are misaligned with one another (modulo 32?), which may
     require a separate memcpy() flavor.
---
v6: Move alternatives.c change to a separate patch.
v5: Re-base.
v4: Use CR2 write as serializing insn, and limit its use to boot time.
v3: Re-base.

--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -47,6 +47,7 @@ obj-$(CONFIG_RETURN_THUNK) += indirect-t
 obj-$(CONFIG_PV) += ioport_emulate.o
 obj-y += irq.o
 obj-$(CONFIG_KEXEC) += machine_kexec.o
+obj-y += memcpy.o
 obj-y += memset.o
 obj-y += mm.o x86_64/mm.o
 obj-$(CONFIG_VM_EVENT) += monitor.o
--- /dev/null
+++ b/xen/arch/x86/memcpy.S
@@ -0,0 +1,20 @@
+#include <asm/asm_defns.h>
+
+FUNC(memcpy)
+        mov     %rdx, %rcx
+        mov     %rdi, %rax
+        /*
+         * We need to be careful here: memcpy() is involved in alternatives
+         * patching, so the code doing the actual copying (i.e. past setting
+         * up registers) may not be subject to patching (unless further
+         * precautions were taken).
+         */
+        ALTERNATIVE "and $7, %edx; shr $3, %rcx", \
+                    STR(rep movsb; RET), X86_FEATURE_ERMS
+        rep movsq
+        or      %edx, %ecx
+        jz      1f
+        rep movsb
+1:
+        RET
+END(memcpy)
--- a/xen/arch/x86/string.c
+++ b/xen/arch/x86/string.c
@@ -7,21 +7,6 @@
 
 #include <xen/lib.h>
 
-void *(memcpy)(void *dest, const void *src, size_t n)
-{
-    long d0, d1, d2;
-
-    asm volatile (
-        "   rep ; movs"__OS" ; "
-        "   mov %k4,%k3      ; "
-        "   rep ; movsb        "
-        : "=&c" (d0), "=&D" (d1), "=&S" (d2)
-        : "0" (n/BYTES_PER_LONG), "r" (n%BYTES_PER_LONG), "1" (dest), "2" (src)
-        : "memory" );
-
-    return dest;
-}
-
 void *(memmove)(void *dest, const void *src, size_t n)
 {
     long d0, d1, d2;


