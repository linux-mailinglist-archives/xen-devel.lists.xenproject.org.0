Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEC99D87F3
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 15:28:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842636.1258316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFa4t-0002vQ-5f; Mon, 25 Nov 2024 14:28:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842636.1258316; Mon, 25 Nov 2024 14:28:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFa4t-0002t5-2K; Mon, 25 Nov 2024 14:28:39 +0000
Received: by outflank-mailman (input) for mailman id 842636;
 Mon, 25 Nov 2024 14:28:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mqqh=SU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tFa4r-0002BZ-9S
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 14:28:37 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d555639-ab39-11ef-a0cd-8be0dac302b0;
 Mon, 25 Nov 2024 15:28:34 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-434a1833367so3685865e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 25 Nov 2024 06:28:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433cde98b4dsm131217735e9.43.2024.11.25.06.28.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2024 06:28:33 -0800 (PST)
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
X-Inumbo-ID: 8d555639-ab39-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzIiLCJoZWxvIjoibWFpbC13bTEteDMzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjhkNTU1NjM5LWFiMzktMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNTQ0OTE0LjcyMTI0MSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732544914; x=1733149714; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vwlIgFVepcsl+wzf8H/Zlc/IIxMm7m4dGrhI8Xxv5zE=;
        b=M5hXbPDRh7iyHm+X3wDjyTvi9xwBjTqdrePUnjtUsFEEwprNE0h51MAaiP6pp9JVSt
         FCy88yeW/Ip6NrSYmDhMLAX5Q3wwOXw12ZFLQGVEJXJhDAxPnjqk7OLZNA8vhJptAjq4
         WUm8lhLn2QPhrYb4g55JjjHi9PTTHepy0DQjML8syfS+fVuZyvplISTdxPbS21ZOEoVF
         D5edL+tU7mwyjf/Opf2aA0gDaOtUzTkqPJUzno0PFOR6XCfgQ0JmTE5v31LI2i05CcsN
         VXS3PICm9zrjS4L5QdsNBQ9euAeBIFj2B6tQ+1oG0UFC0Pa7P44dkIcSbu4+TdE5NA4U
         sp/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732544914; x=1733149714;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vwlIgFVepcsl+wzf8H/Zlc/IIxMm7m4dGrhI8Xxv5zE=;
        b=Ux23qgZiGaocMPDwjTX7RKLTPoSBUtjj6ki6fRiNu5gI0Vg+qgPNJAq72ARbD/ru7s
         lXp8X5+48TLgVVlROhEmB+XRmc+y63RB7eLkSsVvdlkn7xDrxrG8VgcbxVneDNrIWF3a
         weQe026THYF1XKrL+8jzmnhR0ng2WVi+QInDzNUnL3couWvsjJLs4Oo5SPnKFeVjT4c8
         k/jjNJElMvuX1zj1F3iMBK/y+Ddc22EWsPbqPksr0xwC7IUyXIF9AD0YOKyG5EgtdtD3
         gQCOnEuu02KafAHmMbYnZzP3vzlz9AA3t65Y1Cj8p82cK47GhJWgmQw2DzvXf/+WfyCF
         AlLQ==
X-Gm-Message-State: AOJu0YxbcacRb7Xn23HmIrUoE5Fp3EKZKiVUuSJFlxv8Evst6NVeRMnv
	tSfVJ9uC2sYIV1F/ZKjDUQEejEcN7R699Vh6QtCbpwQ37Gm2B6kyB3SQIp5r9Y1fUsKKwaRIKcQ
	=
X-Gm-Gg: ASbGncvKoH3ug/jeLdwD5i7gB3aSarC/6iGtyGE8H6jE+2Ji6un+oGR+EaOp5MtJgpR
	yLhxObEUooP7TZMI/31vidOUU0BizeybLqHZgMrNfcxjnO5fgRsAHRNHjAI8b4+/JkGD1eP71LX
	TAU4caJGjxxOrJ5V3DqY6fTbgNl69OEvbH42i4wXMP/iOyEIxqiiXBlYiXmqFBLEs+XR22FOy+N
	oRaN48IVgxhREhuP+Xm645abTQ9LrNmlQ1wEEkEZeN4gO9v091UWwlHFvqKE78vBJNKvilfhXHp
	PvLK6LfrqctHbvCpddP/+YSYCowpC2Fhg4E=
X-Google-Smtp-Source: AGHT+IHPn1srSHSV7z2sj7na7mK2217CiVbc+5xmZIdsmUArj24h1U7+RKTrIR8v9j85uE3ZZ14vZw==
X-Received: by 2002:a05:600c:3ace:b0:431:57cf:f13d with SMTP id 5b1f17b1804b1-433cda09dbcmr110868235e9.3.1732544913895;
        Mon, 25 Nov 2024 06:28:33 -0800 (PST)
Message-ID: <c2aa4307-230b-4287-b9e4-6d7d84dba490@suse.com>
Date: Mon, 25 Nov 2024 15:28:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 3/7] x86: re-work memcpy()
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

Alternatives patching, however, requires an extra precaution: It uses
memcpy() itself, and hence the function may patch itself. Luckily the
patched-in code only replaces the prolog of the original function. Make
sure this remains this way.

Additionally alternatives patching, while supposedly safe via enforcing
a control flow change when modifying already prefetched code, may not
really be. Afaict a request is pending to drop the first of the two
options in the SDM's "Handling Self- and Cross-Modifying Code" section.
Insert a serializing instruction there.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
We may want to consider branching over the REP MOVSQ as well, if the
number of qwords turns out to be zero.
We may also want to consider using non-REP MOVS{L,W,B} for the tail.

TBD: We may further need a workaround similar to Linux'es 8ca97812c3c8
     ("x86/mce: Work around an erratum on fast string copy
     instructions").
---
v3: Re-base.

--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -48,6 +48,7 @@ obj-$(CONFIG_INDIRECT_THUNK) += indirect
 obj-$(CONFIG_PV) += ioport_emulate.o
 obj-y += irq.o
 obj-$(CONFIG_KEXEC) += machine_kexec.o
+obj-y += memcpy.o
 obj-y += memset.o
 obj-y += mm.o x86_64/mm.o
 obj-$(CONFIG_HVM) += monitor.o
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -153,12 +153,14 @@ void init_or_livepatch add_nops(void *in
  * executing.
  *
  * "noinline" to cause control flow change and thus invalidate I$ and
- * cause refetch after modification.
+ * cause refetch after modification.  While the SDM continues to suggest this
+ * is sufficient, it may not be - issue a serializing insn afterwards as well.
  */
 static void init_or_livepatch noinline
 text_poke(void *addr, const void *opcode, size_t len)
 {
     memcpy(addr, opcode, len);
+    cpuid_eax(0);
 }
 
 extern void *const __initdata_cf_clobber_start[];
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
+                    "rep movsb; ret", X86_FEATURE_ERMS
+        rep movsq
+        or      %edx, %ecx
+        jz      1f
+        rep movsb
+1:
+        ret
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


