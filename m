Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE1EADB0D3
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 15:00:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017217.1394191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR9Rw-0005kT-Gm; Mon, 16 Jun 2025 13:00:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017217.1394191; Mon, 16 Jun 2025 13:00:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR9Rw-0005j1-Dq; Mon, 16 Jun 2025 13:00:32 +0000
Received: by outflank-mailman (input) for mailman id 1017217;
 Mon, 16 Jun 2025 13:00:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jh7D=Y7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uR9Rv-0005HG-2k
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 13:00:31 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1a5f503-4ab1-11f0-a309-13f23c93f187;
 Mon, 16 Jun 2025 15:00:30 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a575a988f9so1326015f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Jun 2025 06:00:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2fe164ca5fsm6787021a12.34.2025.06.16.06.00.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jun 2025 06:00:29 -0700 (PDT)
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
X-Inumbo-ID: e1a5f503-4ab1-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750078830; x=1750683630; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pl2MdiB+kJYOREm+k9B0Yw8rIzN4HAkJgHoxKayTGVI=;
        b=NOlU31PpwkAnjBx12zZ7FxFoJ5lxRy345s0PPceqfm7A7hpIODhSdF+AztBnFN+DzZ
         5KEbYvDgNyMBHc//w7OO9Ao4QEDSDPER69Ux5wbAXcP+5ZimofXQ1OLt20ERCZnz6Zg3
         O5a8+zUqGRQhtgyCQllF7LMfGm8cH6vHjhAOh3i5jUDmmzqQzHe9i7GjRh2beXC4s8rE
         ajWpQ9k3W+BGj1pAPUzJVJYi2yvOFlfSSUaPq6HT2RB/dBXAvWHIpkvTKBICpA0v+QEr
         Bi8NQvMNK3oBohNs2Hi/Dvyb0HX1VCvI4pAo1NLUES/fBPv9mICFcyeTOZHskeln7/lT
         YfXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750078830; x=1750683630;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pl2MdiB+kJYOREm+k9B0Yw8rIzN4HAkJgHoxKayTGVI=;
        b=TNHnCKT2HKhZOWTB+IMQaeCejnm174V4co9oHOScw/iHdV08bsqCKbg/fsJ+SeP3IJ
         IhAxD1c0/F9ECG+vgTNLmw7XdTJTajG9wwvuf6G+ML72lK7MrdMZborcGn/9zen/paXK
         Mo3yBxHlvJ6lBDG8H0q0igVID+RjwOtMigguJtDdCQgSC1TbERY9Mxntw9XRZpM+WbbO
         EFU/eSKkGUdyPAqPJNMC1Wble4bUMTaoPifsN1tKeEuJ/fA5dgP1IY5EkxEFBs2BxJQ+
         uIRMhX7lyCwgldUeVTdrvNgNYu1xMYtIxIpWSmYvRJlkWVvsRMSt1jgKBsA0XJAPaInU
         JWZg==
X-Gm-Message-State: AOJu0YwbdUjxUnKWG4EXMuxVVdqV0Tt8lF/EFq7gC7MkpIFAIs8m469O
	v4YW3/6wGbTVfdb7kb9eVEr1NH9hWxrPYsqtF8C/QpLCRaOnnIFOmyu7+73/qwfq0k9QrFRuG2o
	5Kzc=
X-Gm-Gg: ASbGncsCqIPwgxInVnqWR4OAbxZczu2/ty935OfvezKOOtqDL9uaSVzKzo4kiY5C1aV
	nallxkXEvG6Xgbfz5/2uuyTrwh7J7lEVsI++qyF+opRd7xjE/jRXv3Iz4XklwJNSc9XHdawPvXE
	/dnaUrAAWVf+a8mxO5DnqmCqWHDuZrc/wu/lzPyj5+tRJbDbKybm9UNm3oSnxj8GnZQHLdQZmW6
	8R6fgb1fsOgMpFBWSlbyP5H4ttSsakepggj06bWdL6qpaulBsSWxQqKm6AlwQMwb+iu4MitmXT9
	KwmIT1HXyUQlJfWflLrUd4ze9xB4pNCb6adY+QURuAhXGYneMEauwfoJPknliErmxaYgJSkYib/
	tI8YcaTrj++UKJcSrkhL1oRsBraNRSnD2x9Ycj/U0hGM7ktU=
X-Google-Smtp-Source: AGHT+IGq3KMYoJsXLu0qEqM3HhiyH8Fd/f20KFa779MiA8R/Ui7xgF7YCvdIS6kLCWefSfxrnkPBjg==
X-Received: by 2002:a05:6000:2881:b0:3a4:eef5:ae26 with SMTP id ffacd0b85a97d-3a572e9e42dmr5544178f8f.55.1750078829855;
        Mon, 16 Jun 2025 06:00:29 -0700 (PDT)
Message-ID: <f8bbc74d-aad4-4e4c-8680-009a21f11da1@suse.com>
Date: Mon, 16 Jun 2025 15:00:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v6 3/7] x86: re-work memset()
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

Move the function to its own assembly file. Having it in C just for the
entire body to be an asm() isn't really helpful. Then have two flavors:
A "basic" version using qword steps for the bulk of the operation, and an
ERMS version for modern hardware, to be substituted in via alternatives
patching.

For RET to be usable in an alternative's replacement code, extend the
CALL/JMP patching to cover the case of "JMP __x86_return_thunk" coming
last in replacement code.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
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


