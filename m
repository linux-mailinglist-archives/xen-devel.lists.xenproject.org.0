Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1BCA057BF
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 11:12:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867081.1278500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVT3E-0005cY-2p; Wed, 08 Jan 2025 10:12:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867081.1278500; Wed, 08 Jan 2025 10:12:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVT3D-0005ZM-Vc; Wed, 08 Jan 2025 10:12:35 +0000
Received: by outflank-mailman (input) for mailman id 867081;
 Wed, 08 Jan 2025 10:12:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=svEr=UA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tVT3C-0005HN-W9
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 10:12:34 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1426599a-cda9-11ef-a0df-8be0dac302b0;
 Wed, 08 Jan 2025 11:12:34 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-436281c8a38so118367475e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 02:12:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2e2275bsm15384075e9.40.2025.01.08.02.12.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jan 2025 02:12:33 -0800 (PST)
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
X-Inumbo-ID: 1426599a-cda9-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736331154; x=1736935954; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zXvyugoFvnrztoDgpMNB+n4/oYBCMLezGO47d4RFcqU=;
        b=fjfIQI/cnumDqT+WSZKABaamHRqvX6UjGpbx96t36LPTrVsa7IvVpIkBu6+7i9pX4P
         1ykbz4uFHJdayztqxd3TjI+YWJ5YYeFf/h0Gzcir1ePIOQg4qSZtQXUHdzI3+gFhhRck
         N+OpizFpXGasmxJYkndLYSa8KwnGgOM6B38tzlWn69rgoRnADJnh0qZgHrs5BXL9V+1G
         Gmyno3fqlgGL5InQFyVB/NO/OXZyuN33E8tb1k+JQDK0ep4m7ZkOPqohfx5gVdc5qLUx
         YjowV0HsbEO5B6MhOV3d6gsv6Y1EdcC/1vZiXAG5/d940HBBwI5MKFgo99CUQZvJgiNj
         uIgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736331154; x=1736935954;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zXvyugoFvnrztoDgpMNB+n4/oYBCMLezGO47d4RFcqU=;
        b=fT2ZU612SwOGgdJnnlUsAZOPxf/YOhGgoPbhlX7JBySYGs7AUB+oib4/AXjXw/sh0B
         S4eBTWOEx78WKhNPUG5zgiY7/h4XIBG7LMks8QZ6vwQtri59K2HcgTuBoFyrpkIQfOG0
         +79Po3fYciI1ncPXr7c+JwQII2a6Vv1I6WFiW4sqynHXw8+85kwbGXgKS5UXldVEpiqb
         3Ztw2n8CbFFX15m9n9ANhl2vfcXa0AC5Ja2hHFceb7cM39DAeZPtqVD4eCeWgLMW7Ah8
         y9QH22zvCcOVBwwak4hurdbSGehP/h2jvSl6HOjq5eb+csUKYEaPSvV4TGlIA6nhp2FD
         6XXw==
X-Gm-Message-State: AOJu0Yzw8BqOsHIrtpP2K6sICKJCvqHJ0Mw7aCu0AIta7LUWoeKN3T+Y
	wIAj7+L/QvHryvCxHukadt1ASDd3aPjZzVjZ+gxI3mTjnnTRPjD8Ue9GxxtwdUj8JyhqhsMJ5p4
	=
X-Gm-Gg: ASbGncsRhztJNn3IZfA+J54KzYssMe3qXZ4stfsYEyEdiJGgQeRv2E9JJ4DPiTjpe4J
	o8kxnpwmpub6PnCZCL2eyySgmo7tIw6GR04agKmm0AMhkKJ5ieqSrPLrieub/dr5RS8gO7VBwNs
	hsfdQlGo6BwcJZSY2yLY0CItus911Pt7Zu6b0gJam1MFH4Gg1LHaRRDJJxJ9ByeJSgM8rN6IuD8
	eSpIJtQv/Kt6tbl2/7vAW57a21lqTQTvZO2SXhkKZhu+75UbwJvt+Eg7EbrRIbQx/5p7xen7BcD
	UQHkacizyLopZ21tYziwb6PGkXw361k1usM4sjIy3Q==
X-Google-Smtp-Source: AGHT+IGpICQp2GOtzcPok35p9XGlX2+7mlNFLT5fzZUxMkTA6mcxQ3KXOuSr1lc6ZaZkjJjN0i72NA==
X-Received: by 2002:a05:600c:198c:b0:435:306:e5dd with SMTP id 5b1f17b1804b1-436e26f47e0mr14638435e9.22.1736331153856;
        Wed, 08 Jan 2025 02:12:33 -0800 (PST)
Message-ID: <b401177a-0189-4dc0-adfd-5832e7ddfd35@suse.com>
Date: Wed, 8 Jan 2025 11:12:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 2/6] x86: re-work memset()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <14b65231-b83b-43fb-bbcf-dec5c07d285b@suse.com>
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
In-Reply-To: <14b65231-b83b-43fb-bbcf-dec5c07d285b@suse.com>
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
v4: Use %r8 instead of %rsi in a few places.
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
+        mov     %rdi, %r8
+        rep stosq
+        or      %edx, %ecx
+        jz      0f
+        rep stosb
+0:
+        mov     %r8, %rax
+        ret
+.endm
+
+.macro memset_erms
+        mov     %esi, %eax
+        mov     %rdi, %r8
+        rep stosb
+        mov     %r8, %rax
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


