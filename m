Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FBEA057C1
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 11:13:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867084.1278509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVT3b-00063r-9x; Wed, 08 Jan 2025 10:12:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867084.1278509; Wed, 08 Jan 2025 10:12:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVT3b-00060z-7E; Wed, 08 Jan 2025 10:12:59 +0000
Received: by outflank-mailman (input) for mailman id 867084;
 Wed, 08 Jan 2025 10:12:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=svEr=UA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tVT3Z-00060Z-Ja
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 10:12:57 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20d6701e-cda9-11ef-99a4-01e77a169b0f;
 Wed, 08 Jan 2025 11:12:55 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43635796b48so4144095e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 02:12:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c89e2dfsm53176882f8f.74.2025.01.08.02.12.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jan 2025 02:12:54 -0800 (PST)
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
X-Inumbo-ID: 20d6701e-cda9-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736331175; x=1736935975; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SJd+n7gK2V+zAKy/YovEFCBG4RViNaVaa+G5JynvQ0Y=;
        b=SESG5Vs/5FZmznDi7R5LHCl3gImG7lF2Ag1GCvBE4uO2x9+qPwT0THxKRjQ6ZgI2Ln
         12kzoGzgF2en5gBeBmkTPrS8j0QLJTueM/PYbfPOS1njF7z82BXTI7DqBdCCT4DFDRER
         moISej7JbftmYfwfYWqcNwDL+jzdCadKPcDtYfsKOdkfG3Kkv5XmOHKgaSp05aIFjzzx
         Hg/5cA21yAjSsrCcnT6kbk6/IxfJZHb3sk9ZSkEIGFDbF9oJn36rongCgjRuvQff/IYm
         WGLWQWueaANDLHSp6f39pRShlIS4fU6Ii81T/nokVO0s3EusheFkPpzOoRLyyTCPGVBx
         MblQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736331175; x=1736935975;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SJd+n7gK2V+zAKy/YovEFCBG4RViNaVaa+G5JynvQ0Y=;
        b=fQyRJWgyWabYRkUo14bPJhk+Kh5sz++VLbJwS7iRLu0/Ek+Wc5kWF+kAzsOzu3rCki
         F7SaZc2552ns1PdkoMbLg9ZUq2CAthYZSKWU3JEdtS/WjBPdL6MR/Tnv+B/RVQ37PCit
         ZWOA7pQMLT7D7oYeuScWq6MUKgqFxZsQ8/GsbJcb7zz6Oi+vazvraxALc+3nYfs9wZYe
         hZy35yGzKHXaesvSV9ABp4VtZKRjmULUph4mHaTBi9JpHPLBq0Vw3F8jPnhS1/kCudhw
         hqg9jrSECQRuwl4Fp2ADaMjthW5rN8vKSMUao8PCxMF4PQwiA+Uz8G3Uam9UyHdjU8F2
         bTNg==
X-Gm-Message-State: AOJu0YzSLZTbAJ6TR5PYmPAij/XoqnVT1l8r8xfe1k2efHzJCYzgRWda
	o+DS8A8u4HpkIC/HvrCk1aqT+jBLTXvRpm67XjSK0WFP14FEgjGqKpSJjL9UL316IcQqP+wQgJc
	=
X-Gm-Gg: ASbGncty0pdkf2VqvgC2HHHJ0fPQubkI9mYJgRdvxPPglniwNlPF/rdaJDGlmmuQ9Zm
	ACyvzHYwVdE+Dqe89WWycWOdFcR+Z8S2v2GmotLDP0zZldFzp5iOSDJBOh80l2Rr5iP0rY+/0po
	C8sGWQo4Br3hpK5yiP4P+JU7xyo880+nztGl8qLdXm4Cpr4Ic0R1eXHyg9w8qh5viVW275jqQEL
	YgrcDQ9iwOSitand9D96pWbE4ihATyXKXZr5hlH+A0w4DtpmxG1nMnCN7q4O306g/ZlHoMNs7qA
	Hx15yiodB0OSbxjj0+PGq418qVXpR52ag+BxfH0uLA==
X-Google-Smtp-Source: AGHT+IE8V4ACYrMlmEfpW17iXFZZTNXBv8g9V7pBQrCMzefmxeej1rCQP71NCdCYerf/ji2U05v0fQ==
X-Received: by 2002:a05:600c:3b94:b0:436:185f:dfae with SMTP id 5b1f17b1804b1-436dc1c213emr54693925e9.6.1736331175138;
        Wed, 08 Jan 2025 02:12:55 -0800 (PST)
Message-ID: <4dfc23f8-3fd5-4814-9d0d-5fbbe4c3e9c8@suse.com>
Date: Wed, 8 Jan 2025 11:12:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 3/6] x86: re-work memcpy()
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
v4: Use CR2 write as serializing insn, and limit its use to boot time.
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
@@ -153,12 +153,16 @@ void init_or_livepatch add_nops(void *in
  * executing.
  *
  * "noinline" to cause control flow change and thus invalidate I$ and
- * cause refetch after modification.
+ * cause refetch after modification.  While the SDM continues to suggest this
+ * is sufficient, it may not be - issue a serializing insn afterwards as well,
+ * unless this is for live-patching.
  */
 static void init_or_livepatch noinline
 text_poke(void *addr, const void *opcode, size_t len)
 {
     memcpy(addr, opcode, len);
+    if ( system_state < SYS_STATE_active )
+        asm volatile ( "mov %%rax, %%cr2" ::: "memory" );
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


