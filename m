Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 589A3AF1534
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 14:17:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031010.1404690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWwOO-0000lF-DW; Wed, 02 Jul 2025 12:16:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031010.1404690; Wed, 02 Jul 2025 12:16:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWwOO-0000j9-9b; Wed, 02 Jul 2025 12:16:48 +0000
Received: by outflank-mailman (input) for mailman id 1031010;
 Wed, 02 Jul 2025 12:16:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FQsZ=ZP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWwOM-0000Fz-QS
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 12:16:46 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b6acd79-573e-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 14:16:45 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a5257748e1so2937044f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 05:16:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af56ceb74sm14601400b3a.135.2025.07.02.05.16.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 05:16:43 -0700 (PDT)
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
X-Inumbo-ID: 6b6acd79-573e-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751458604; x=1752063404; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SE8xoyNdEL534537qH4i+x2FYrDmfoG9y/hWuSaiBfU=;
        b=Ux7RmnKmw1pg52xb6xd0wH+fzSk+vRKFsjkT01mQyzojeqmIEzTbYrM4sGwL0OEyIP
         J7n3QESkdYJdl9ualB/G0DqB+DzreE2+FnuxOvj9opSvnNZB63I1/1R+k0RRaEm7tNGB
         3gXBkbQ3ktTnI0czp/btLzcKnabiIW11jnncdKn+mqskWaqnNtoDXyUQGR30oh+cfm1d
         41GbiSpspKJC4yYrv0pjm2LRrIhGrfzlCo533dQ38MlSI7mzHm+DqnEjE/NkHN0yo+d8
         YagB318AxwvTqgjaDK1YmK1v59VGrUVIyNSRl4Ea/xUOJrbbBLNsowdzxOaxgGrqyuKu
         2Pyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751458604; x=1752063404;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SE8xoyNdEL534537qH4i+x2FYrDmfoG9y/hWuSaiBfU=;
        b=bphFQVsru2zxCTvxcastkEpCsu51Susr6pcxvAqe+e52GuNqWq4qh4wQFkikoqZYcF
         sWDXQ+c+kgUnFdmEfwAfQaXvxxye/AC3Pv5hfgxLLtJ/w5yMOjb7tdh/ZZqatAikVsP8
         dtY17zy5SYuUtdOhkRHakIV6eQZ/hoEVksF4pVlUNpyNsgGS7QpOW5DK+c+WV5k9IvjI
         enKoP5wiYJQSdp7kQWPxtebxSbvC0T9zA/UlhfOz1ODSAzn3AuMd/aKNsmD9hRvlwv2D
         kHUYcq/LjETH8yGVkHGfFwQYeP8AW2Yt6fzOASrhKz6YsayeWBcvGG5/p8gitz5uLKFA
         0tAA==
X-Gm-Message-State: AOJu0Yww7hHgsvppzjOa3Fz+w4aLIAkEdXZBq1DCFUeV1+K/AL8BpyIt
	izHrwGlaVolZdobsfT3EMV3F8ibnSZATQbkSfp/6/xx7lVOTo+W18ZZj//2Do2DMs/kI7KMzcYC
	c/ds=
X-Gm-Gg: ASbGncv1P60UOIwkQ244+uGjw3pNFaqCnB/EkYKFPeOPXoDVLe1qvasdRP436tHnSPG
	Dcy8mUVJ1yX0ywiacNahSBqt7BV8yc6N3gp/xOUh9AuD5Vb5ALnT8GtfHGEsKsq1ONrJGikbjqs
	BT/WaMUiWlqfYUXt/kIFfl04nWHWfVQgCNcWa9URdTptJt+m2564jrIVFa3iQM12kukta/dhkjb
	eW02U6r3yTfy8+56YsvJLgsO66ZZunfmaZUF0NBOA0jCxsyCyOG/I09Ec4ViZ4KKC/mnBp09i9W
	2gJio5TnnFzquC5miQzliWEkUX8w9icnDyqpMtUrFp1TIcc9KbhYkBeIm70r6rImPk3JUHqX3GB
	QASU8u7xqz4d+YTxOtaE9twLfbH1rsXp3MYS9Hmelz9psUus=
X-Google-Smtp-Source: AGHT+IGhy45QJk1iqOLx0KbGMNzCiLI49h3C97l8MTWZf3BXAB4e8yTx+ULA3+l2/Ex/QZ20D6NZWw==
X-Received: by 2002:a5d:5888:0:b0:3a4:d0ed:257b with SMTP id ffacd0b85a97d-3b1ff42f9b6mr2096512f8f.22.1751458604454;
        Wed, 02 Jul 2025 05:16:44 -0700 (PDT)
Message-ID: <cc7d705f-b5cd-481b-bc9b-e0b3f4a3e73a@suse.com>
Date: Wed, 2 Jul 2025 14:16:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v7 3/7] x86: re-work memset()
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

For RET to be usable in an alternative's replacement code, extend the
CALL/JMP patching to cover the case of "JMP __x86_return_thunk" coming
last in replacement code.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
We may want to consider branching over the REP STOSQ as well, if the
number of qwords turns out to be zero.
We may also want to consider using non-REP STOS{L,W,B} for the tail.
---
v5: Re-base.
v4: Use %r8 instead of %rsi in a few places.
v3: Re-base.

--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -47,6 +47,7 @@ obj-$(CONFIG_RETURN_THUNK) += indirect-t
 obj-$(CONFIG_PV) += ioport_emulate.o
 obj-y += irq.o
 obj-$(CONFIG_KEXEC) += machine_kexec.o
+obj-y += memset.o
 obj-y += mm.o x86_64/mm.o
 obj-$(CONFIG_VM_EVENT) += monitor.o
 obj-y += mpparse.o
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -351,6 +351,12 @@ static int init_or_livepatch _apply_alte
         /* 0xe8/0xe9 are relative branches; fix the offset. */
         if ( a->repl_len >= 5 && (*buf & 0xfe) == 0xe8 )
             *(int32_t *)(buf + 1) += repl - orig;
+        else if ( IS_ENABLED(CONFIG_RETURN_THUNK) &&
+                  a->repl_len > 5 && buf[a->repl_len - 5] == 0xe9 &&
+                  ((long)repl + a->repl_len +
+                   *(int32_t *)(buf + a->repl_len - 4) ==
+                   (long)__x86_return_thunk) )
+            *(int32_t *)(buf + a->repl_len - 4) += repl - orig;
 
         a->priv = 1;
 
--- /dev/null
+++ b/xen/arch/x86/memset.S
@@ -0,0 +1,30 @@
+#include <asm/asm_defns.h>
+
+.macro memset
+        and     $7, %edx
+        shr     $3, %rcx
+        movzbl  %sil, %esi
+        mov     $0x0101010101010101, %rax
+        imul    %rsi, %rax
+        mov     %rdi, %r8
+        rep stosq
+        or      %edx, %ecx
+        jz      0f
+        rep stosb
+0:
+        mov     %r8, %rax
+        RET
+.endm
+
+.macro memset_erms
+        mov     %esi, %eax
+        mov     %rdi, %r8
+        rep stosb
+        mov     %r8, %rax
+        RET
+.endm
+
+FUNC(memset)
+        mov     %rdx, %rcx
+        ALTERNATIVE memset, memset_erms, X86_FEATURE_ERMS
+END(memset)
--- a/xen/arch/x86/string.c
+++ b/xen/arch/x86/string.c
@@ -22,19 +22,6 @@ void *(memcpy)(void *dest, const void *s
     return dest;
 }
 
-void *(memset)(void *s, int c, size_t n)
-{
-    long d0, d1;
-
-    asm volatile (
-        "rep stosb"
-        : "=&c" (d0), "=&D" (d1)
-        : "a" (c), "1" (s), "0" (n)
-        : "memory");
-
-    return s;
-}
-
 void *(memmove)(void *dest, const void *src, size_t n)
 {
     long d0, d1, d2;


