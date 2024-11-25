Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6889D87E9
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 15:28:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842625.1258306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFa4Q-0002MP-QI; Mon, 25 Nov 2024 14:28:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842625.1258306; Mon, 25 Nov 2024 14:28:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFa4Q-0002IX-N6; Mon, 25 Nov 2024 14:28:10 +0000
Received: by outflank-mailman (input) for mailman id 842625;
 Mon, 25 Nov 2024 14:28:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mqqh=SU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tFa4P-0001uB-D7
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 14:28:09 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c3d527f-ab39-11ef-99a3-01e77a169b0f;
 Mon, 25 Nov 2024 15:28:05 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3823cae4be1so2786470f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 25 Nov 2024 06:28:05 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433b464320csm193000285e9.38.2024.11.25.06.28.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2024 06:28:05 -0800 (PST)
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
X-Inumbo-ID: 7c3d527f-ab39-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MzEiLCJoZWxvIjoibWFpbC13cjEteDQzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjdjM2Q1MjdmLWFiMzktMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNTQ0ODg1Ljk2OTY3OSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732544885; x=1733149685; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rBm6En5vnfhn1uyQpWAd/QeNo0+rMT72pPFEcsiUxNw=;
        b=UOrB6dBXraaXtjHSACHcDR+eNcvF2cSlwv/YU6Hn9qoW9F9ILXaRA+df0DwIshKR0l
         lGL2VE9JucjsvWAB/vB+o1D8SHItpLCs4vPHcF1XittvU+Dctyami4nC8Ha7x8r7j0nS
         JyBIwuF2h8o6QyrFYp4k7uwRmGLvHkEQ8uj8jA/RBTygBSkC/jrlhGBsAKgf4jmW8RZ1
         sFSVTNjiv6KqydzkcvO3O6xKfRYyDBgoP3bruEqUGuauqa1YdqfKXo4ICEFuMrTGlqSz
         j3liXD/IasoiNlbxeZBNLDThGpkCtPkO/65yDxwxnf0zeBoBdUBtmOMkqV4NpQ2sHpS4
         3SRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732544885; x=1733149685;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rBm6En5vnfhn1uyQpWAd/QeNo0+rMT72pPFEcsiUxNw=;
        b=rRt9tSPq9XkieKPxlf7dhToQzMotxxhLhVinUWdrHTaXXKHCRr2GRUVf0OU6AOWB0t
         ab82tPk1F1ne0brkxRNT5EqL4p8lNEnWKIvMSvzVH7mtgxKJFcJ2rC1XssKPATDa6HZZ
         tJv/tbcA+ztWFSjQoN+hIHkKENP4pGaqGxlP/Kxi+azSpJpl47iGIKg01lkNdY8L+jAa
         /PdM0puF0JlnFT9BUPF/FxwQme8r7dL5Y3WueKsN0hzmTMcrd/pbnoqRWi8ge6hSQJR8
         bjDcEWNGAipCvbL9aMVkoQ2g6DXvWSi+9wdnpqeeV0jMDs+ip1QU49Bp95DkT12yhBMC
         StMg==
X-Gm-Message-State: AOJu0YzLIHRlWW/Fa4w1rKKqpGVWpZ+blPfeLoEav+xxQ2Y/oT8ca4Yl
	Q3znycmoxtGbOQyud+uOQeV4ii50vUFq1VzGDv20W0yH53HyEsgyrjfs3AqNhL2Zp5jaJl2PkKA
	=
X-Gm-Gg: ASbGncteal7aRHslrnsqkBXRRGSpAItfKZxdxh8ey+QCm3llhv8sHDf7L1kEnDWKoJC
	Z4phHpTdewoO/ET7kQOIsy0kJ/Xn2wt9C9rR54ZTj3Ai5ePBciEHIaDAMnjIxw13g9DEgluS3nQ
	l0CkqIskXbgOmUjx2qjc4DWHNYp/R6qB1dbF7BmFDxFE850xAditkixFjsgphoLmhmiRPmrGhVf
	+LMFblhFPr6ko9fqkfNyPsE3Pa1K79PAcnx6dXWpRxaKtEzG7vcD8OOHnG6pTJVf7IA8zptqDcP
	nuh+Q2skTtd7nDkD5JoTCFbaLoWGsQKrmfg=
X-Google-Smtp-Source: AGHT+IHvwjLd5kmzGRQkoFoMcHYIYh6Q+DJWXj9akEU7qg/AZ4TkwT5HYdaZYSe5itUO6AvXuuQLQA==
X-Received: by 2002:a05:6000:4028:b0:382:31a2:17fd with SMTP id ffacd0b85a97d-38260be5360mr11353125f8f.55.1732544885400;
        Mon, 25 Nov 2024 06:28:05 -0800 (PST)
Message-ID: <62b3403f-3800-4c1e-a7a2-165ebfac04c0@suse.com>
Date: Mon, 25 Nov 2024 15:28:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 2/7] x86: re-work memset()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
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

Move the function to its own assembly file. Having it in C just for the
entire body to be an asm() isn't really helpful. Then have two flavors:
A "basic" version using qword steps for the bulk of the operation, and an
ERMS version for modern hardware, to be substituted in via alternatives
patching.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
We may want to consider branching over the REP STOSQ as well, if the
number of qwords turns out to be zero.
We may also want to consider using non-REP STOS{L,W,B} for the tail.
---
v3: Re-base.

--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -48,6 +48,7 @@ obj-$(CONFIG_INDIRECT_THUNK) += indirect
 obj-$(CONFIG_PV) += ioport_emulate.o
 obj-y += irq.o
 obj-$(CONFIG_KEXEC) += machine_kexec.o
+obj-y += memset.o
 obj-y += mm.o x86_64/mm.o
 obj-$(CONFIG_HVM) += monitor.o
 obj-y += mpparse.o
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
+        mov     %rdi, %rsi
+        rep stosq
+        or      %edx, %ecx
+        jz      0f
+        rep stosb
+0:
+        mov     %rsi, %rax
+        ret
+.endm
+
+.macro memset_erms
+        mov     %esi, %eax
+        mov     %rdi, %rsi
+        rep stosb
+        mov     %rsi, %rax
+        ret
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


