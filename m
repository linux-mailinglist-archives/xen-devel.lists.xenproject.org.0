Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 872A1ACED88
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 12:26:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006554.1385760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN7nI-0004q6-V8; Thu, 05 Jun 2025 10:25:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006554.1385760; Thu, 05 Jun 2025 10:25:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN7nI-0004nw-Rm; Thu, 05 Jun 2025 10:25:56 +0000
Received: by outflank-mailman (input) for mailman id 1006554;
 Thu, 05 Jun 2025 10:25:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qREP=YU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uN7nH-00043g-5j
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 10:25:55 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75ab4638-41f7-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 12:25:53 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-451dbe494d6so8992725e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 03:25:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747afeabc2dsm12994333b3a.65.2025.06.05.03.25.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 03:25:52 -0700 (PDT)
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
X-Inumbo-ID: 75ab4638-41f7-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749119153; x=1749723953; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Kzfk8kOPjucUBtuwDsuMCecezBv2uHiBq7/jphCJyvE=;
        b=BT9XNNNh3KTFaXwaAfAArbWCTKHWj3wOoT9qXhcfedbcLmkvq8ZKmRnt2HeQzNHdBo
         lyP7xMOZhEK5vPzj0HBH726Oo/jA32U/yLRag5A2O5Tc8LdWZp6sEc3DLGnvc8mo0R5t
         cgaU158UxQ2+br+T69Ud3Up6wD3lDXZGk6QICszGqqlowa43XVbCPjBn3nnbzQ28C4k8
         fid5n3/8lXSFT1IZCOYAtWCyCOJbwztQUtpC2hkghWAuVzV3P7CcHWfDuPvx2jwc6gXA
         vpqrVXBj5sCyyA/Q/JxJ3B0qPsfRYovichzZ4cMRL3AJDjgcbln2y8Yb7aCclUWVsgLx
         F7WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749119153; x=1749723953;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kzfk8kOPjucUBtuwDsuMCecezBv2uHiBq7/jphCJyvE=;
        b=MTfQiFYNXGUrkSfexAWTSaEQNf5lezHIkzSXFnuWwJHGwqd3625k0MUvK1YuG9sqiv
         V9XZX4badaA3tmpkHsL6gDiXqWYQ0z6dM3C8Qoqm6vaid3DN1xScC4DDAzokV6vuwh0e
         8ehDoEtbuo0qbYfS/u9SeHDlCW2uM8YvtNpOyF5PSHVfHtkS9Emj20N5oiNr9MAcocWk
         bGEDJpsquamOtx1xDgneJEIt/MI8wNv8NSb0LK0H3dKpj5a6Zm9P9RfjFWsrNcrz6A8Q
         3F7duoyXhDgvUhdB1Q3kuz4Nppa9WfSZVytrSlb0cOw7NkVa5wKnmpDv3qCGo8ZAZMnS
         m5vg==
X-Gm-Message-State: AOJu0Yx8YWsdYpkf7C5IkO5vnLENvSMU/bUCzwxee4b7/qJTerTndb0O
	JJN3xAWc0RDgsksNjllUoOzQyQGTi411ABCgSFIt952PRHz6gFP3K1S8ZkgPCVL1FNPwduX3ro/
	5vK8=
X-Gm-Gg: ASbGncusAN3NPng1/5BoUQ8GQ277hKgeDCA0X83XzZl00qLtJhdhYy20DQj/5HkGCQh
	YToORmTG1e3VbzQcYf6X3D1x8lZhWvI27nrZSVpBrddfsoily/2LILa6mHPhOemc661YxqrQS0+
	NxMQ1qvrYaH8HUk9MC2wUcRNIEeAZinTz1HoSZQzMUeDtcXiaqsSm5C60rDVlxw/KeRna5YoPW2
	duJ6dHAffQ7ZEK8d6oaR4gS5XUvYAU+9RFxA53w5GFz53xVOgdPlrR4U4cNB0K4ni6JlyBR+kGo
	yOazApC+Z91q5s2apMmC4zHgpv3JKEluXF/e1T1jz0/GuLXaDQSfd8C7hvMQNcLd7CoMcOnQulg
	jEh9iuRoWa0mCw9UPYJy1iZncve1i/9V8NWkq1/hNWmuL1Uc=
X-Google-Smtp-Source: AGHT+IE6OiHLhwrRi590UFvEmq1U+3Yvi/OE0meUH/K8SbPo9CJPv30sHVwgWqAXwtobtk/mFAF5gg==
X-Received: by 2002:a05:6000:4387:b0:3a5:276b:1ec7 with SMTP id ffacd0b85a97d-3a5276b2066mr2200737f8f.7.1749119152974;
        Thu, 05 Jun 2025 03:25:52 -0700 (PDT)
Message-ID: <017e689a-41a2-4722-a5e7-19ffef27500f@suse.com>
Date: Thu, 5 Jun 2025 12:25:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 3/6] x86: re-work memcpy()
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

TBD: Some older AMD CPUs have an issue with REP MOVS when source and
     destination are misaligned with one another (modulo 32?), which may
     require a separate memcpy() flavor.
---
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
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -195,12 +195,16 @@ void *place_ret(void *ptr)
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


