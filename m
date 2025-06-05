Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C409ACED82
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 12:25:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006548.1385750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN7mq-0004In-J8; Thu, 05 Jun 2025 10:25:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006548.1385750; Thu, 05 Jun 2025 10:25:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN7mq-0004GZ-Fa; Thu, 05 Jun 2025 10:25:28 +0000
Received: by outflank-mailman (input) for mailman id 1006548;
 Thu, 05 Jun 2025 10:25:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qREP=YU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uN7mo-00043g-N2
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 10:25:26 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64a44cf5-41f7-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 12:25:25 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a375888297so533036f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 03:25:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506bc8b26sm116434025ad.9.2025.06.05.03.25.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 03:25:24 -0700 (PDT)
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
X-Inumbo-ID: 64a44cf5-41f7-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749119124; x=1749723924; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ODTNNGIVtgxD+7IVtLkWN/Ewp9sfVPUojE1+ozek4qQ=;
        b=a5qugSiNPUXk/XrjAYZnN+37X449OrmlTgSSnntCsc0hWPVL4eTTvvl3xnH/29yLAc
         HMoHOx+acffFA+P545esOq8Gy8X2SLsfa1AGXkzZDhmqS7G3QfS3bEjUnI0nhVrUGGpv
         NGupieYowRJmWWbjVk4zfyfh14GVxA2Y13qiOHMSUgYENQViwsShNw6PXnAZoZEo+PbL
         cWQ2nQeBg7NBfrKhrNGLgC+/Jezm0pVEKxKGNr/lhrbM0Isdth900g0ClH+W1CN0Ixmh
         t0okw58DHZo2ckYYI/og63dq8ORv1d9xFa2/VUm7iqMU1Xq1J9aO3+rloKdCIsEJsiSI
         jOkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749119124; x=1749723924;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ODTNNGIVtgxD+7IVtLkWN/Ewp9sfVPUojE1+ozek4qQ=;
        b=TMl0X8MkEvm3TxvU9r3eEkB900mLow2gXVvVFS86Q21vOmCNAmivB8DVdSqqIuECfb
         76TYzwPHj/co4/xt9NBzhAcujSHlALkqLEqikDQHDPO4iQiST+KUK/2BZ1fiTynC289z
         zDJfLOIZbNqoTgJnlLA6T8cJ/1mG6mll7X9A81fUG8xIW2/SxHWEqcPoEQvgRhSi6Ttl
         vjL5r+eSEKoDYEoF/5yEG31SHb6dGhjHP761kHjmK2zervkoRqy5dw7DwXXNzZJYedQG
         8YjLRLsRyeH3DThFzE+eoPzKYBQUgZHKtmSYSy2MZ5NClZSTnS9wE9ywdoQS8U2+sUKB
         wOMQ==
X-Gm-Message-State: AOJu0YxCF2ydK8wDHgTocJxmti4alz1yNr63eSYYUNv+dXLVYth5SnRw
	FOSbckKsHLfKGr8AojCFpH6vgbl3rVu11B1nJ5qdZNyIVSM7n6W5rHYSF7TOe5ZOwo9qCuoSwgz
	GQyA=
X-Gm-Gg: ASbGnctF92kNcLhjJ4EcNNh68T5YJjKwaL5aFxS2EwYyAjtmH0d4TwrLAFNE6S+i/pz
	KliLU2fandFyM9J9PyCxNKabg8nLP71zVgtI3K8EhWCalSG17wFrPSQ5pmegKL7Z/BTmIuIcZ0h
	oyEYfZy0vgzoW0cmRvSnIqUOGsJrBbjsl/4uDqEgyXUiRweCkLo0FbDLNz9x/xQa6R2AM4DPULd
	weju4KJZrcZ/yl7e0e7+/aYqHhy4DaF0FF51XcknyBBS50shIdaWk+ZOt02CzQRzytUUBsX0R+7
	Z7DYGsK+EW2JEXYYVWQ7fjkagFib5IsW27mhoTdeYzvUOWnq2tZpvp+7bsFFbt/cM+6yk0fAAXf
	4/7sUYPKzvXwl8WugnxNPG7UkyoTRJOrgQqCl
X-Google-Smtp-Source: AGHT+IH/iUBcOUGxo/kZ1XOmLorzJ659k/mRMtiOrAHY23tAraBTACOClPoWtUOpiNH7ekY6pa8chQ==
X-Received: by 2002:a05:6000:2890:b0:3a4:e603:3d2 with SMTP id ffacd0b85a97d-3a526a84717mr2559856f8f.0.1749119124473;
        Thu, 05 Jun 2025 03:25:24 -0700 (PDT)
Message-ID: <4592a702-acf3-4229-9069-d5b639151657@suse.com>
Date: Thu, 5 Jun 2025 12:25:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 2/6] x86: re-work memset()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <73481cbf-337f-4e85-81d2-3487366cd822@suse.com>
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
In-Reply-To: <73481cbf-337f-4e85-81d2-3487366cd822@suse.com>
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
@@ -346,6 +346,12 @@ static int init_or_livepatch _apply_alte
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


