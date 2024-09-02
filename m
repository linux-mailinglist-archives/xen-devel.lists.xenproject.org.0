Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A69A9968780
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 14:28:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.787853.1197330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl6Af-0000d3-GD; Mon, 02 Sep 2024 12:28:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 787853.1197330; Mon, 02 Sep 2024 12:28:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl6Af-0000ae-Cg; Mon, 02 Sep 2024 12:28:37 +0000
Received: by outflank-mailman (input) for mailman id 787853;
 Mon, 02 Sep 2024 12:28:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uQw9=QA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sl6Ad-0000aW-CR
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 12:28:35 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id def7833c-6926-11ef-a0b2-8be0dac302b0;
 Mon, 02 Sep 2024 14:28:34 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5334c4d6829so5194625e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 05:28:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89891db42fsm548965566b.184.2024.09.02.05.28.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Sep 2024 05:28:33 -0700 (PDT)
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
X-Inumbo-ID: def7833c-6926-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725280114; x=1725884914; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T5CLsFwA9fs3A0ES9c4HfrRr7sFZI/9MKKdmJ0LCFsw=;
        b=g+tAObVTx+EO31yPUN6s88eSo/RPa4QKE2DAuiqNkUJxEpB0aQPo0KxLTyJm3zmLMt
         8bex+Ezw3U0CghuQst0+lCVBTsNl4MPSTOxNEp56pMYLHX/U+9sx0awFYVgRFHTmWpsX
         o0ajBlOpsmaBYN9T5FcaE4ref09wycx5rDMcujVDuZuz6gK3qiibDWlJ7+Sg2W7xsraT
         eVUxxFdNaSHJ97/apC0s92gi37ruUB0CZoIBEJ1UjzgzGnjEMezA3Xu/FDEnuy5Yk2aq
         egaXCmupOgTG92jNDUXVE4wxtsi/et6Mlw8TQ2L/ERadsZ+kvI8Jt0U9FsW52x0uQm9g
         Kthg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725280114; x=1725884914;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T5CLsFwA9fs3A0ES9c4HfrRr7sFZI/9MKKdmJ0LCFsw=;
        b=d4LYEjGx1mfaRcBy6Rkb6CEFarv311RfxLb15K+br2CV+FFcmC5BFz9VJZ3Vknh3Vv
         bMz8SD3KlHChc6IP5kd1LaDRVZ8VZxnVWToD6ZvmbBXOa5LKXR22Ykx8KAb2BmFYM+wr
         tcd6gFh3ZMhheDiL3HQEmOZzKmuLO168mg1xILccMPVRRifkg/Tj1k4zn7IOHUObjmeA
         8k7tyo/iKDNxkvf0bQWmgyPNawpsOEkYbU44+CwFSiZpw8u0L78s9wqudHJ3zeKPRLky
         9bqaqS3safK2BxDTjs0Sbf2q2GbbtJRFjfU7TK1adwOWVJJl5maYeklZ2vj0Jiat6id2
         WbmA==
X-Gm-Message-State: AOJu0YzclsrwZQgFfl3+k1kF/vX8ZxV2JaGZlnai/vD5/FyWPqQ3izFM
	T/MwCawurRHsE6cUn2rUMMF13AMQMQwukIAN8KiUuFTFcBpuQu1j/IFe/KqJQJSP+NkRmNQMXLc
	=
X-Google-Smtp-Source: AGHT+IGYBTFJ1LyTFGS1aR++iYuGYImMFoIpZQ0PTaa4KoQYWD82RCHmEKYC1I5i7T2UKmYu/GEakQ==
X-Received: by 2002:a05:6512:3a8a:b0:530:c1fb:5192 with SMTP id 2adb3069b0e04-53546b335b3mr7228615e87.16.1725280113409;
        Mon, 02 Sep 2024 05:28:33 -0700 (PDT)
Message-ID: <3c1a7eee-7909-4b18-9497-1d0a6ee4f17d@suse.com>
Date: Mon, 2 Sep 2024 14:28:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/PV: simplify (and thus correct) guest accessor functions
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Taking a fault on a non-byte-granular insn means that the "number of
bytes not handled" return value would need extra care in calculating, if
we want callers to be able to derive e.g. exception context (to be
injected to the guest) - CR2 for #PF in particular - from the value. To
simplify things rather than complicating them, reduce inline assembly to
just byte-granular string insns. On recent CPUs that's also supposed to
be more efficient anyway.

For singular element accessors, however, alignment checks are added,
hence slightly complicating the code. Misaligned (user) buffer accesses
will now be forwarded to copy_{from,to}_guest_ll().

Naturally copy_{from,to}_unsafe_ll() accessors end up being adjusted the
same way, as they're produced by mere re-processing of the same code.
Otoh copy_{from,to}_unsafe() aren't similarly adjusted, but have their
comments made match reality; down the road we may want to change their
return types, e.g. to bool.

Fixes: 76974398a63c ("Added user-memory accessing functionality for x86_64")
Fixes: 7b8c36701d26 ("Introduce clear_user and clear_guest")
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/include/asm/uaccess.h
+++ b/xen/arch/x86/include/asm/uaccess.h
@@ -251,7 +251,8 @@ do {
 static always_inline unsigned long
 __copy_to_guest_pv(void __user *to, const void *from, unsigned long n)
 {
-    if (__builtin_constant_p(n)) {
+    if ( __builtin_constant_p(n) && !((unsigned long)to & (n - 1)) )
+    {
         unsigned long ret;
 
         switch (n) {
@@ -291,7 +292,8 @@ __copy_to_guest_pv(void __user *to, cons
 static always_inline unsigned long
 __copy_from_guest_pv(void *to, const void __user *from, unsigned long n)
 {
-    if (__builtin_constant_p(n)) {
+    if ( __builtin_constant_p(n) && !((unsigned long)from & (n - 1)) )
+    {
         unsigned long ret;
 
         switch (n) {
@@ -321,8 +323,7 @@ __copy_from_guest_pv(void *to, const voi
  *
  * Copy data from hypervisor space to a potentially unmapped area.
  *
- * Returns number of bytes that could not be copied.
- * On success, this will be zero.
+ * Returns zero on success and non-zero if some bytes could not be copied.
  */
 static always_inline unsigned int
 copy_to_unsafe(void __user *to, const void *from, unsigned int n)
@@ -358,8 +359,7 @@ copy_to_unsafe(void __user *to, const vo
  *
  * Copy data from a potentially unmapped area space to hypervisor space.
  *
- * Returns number of bytes that could not be copied.
- * On success, this will be zero.
+ * Returns zero on success and non-zero if some bytes could not be copied.
  *
  * If some data could not be copied, this function will pad the copied
  * data to the requested size using zero bytes.
--- a/xen/arch/x86/usercopy.c
+++ b/xen/arch/x86/usercopy.c
@@ -16,42 +16,19 @@
 
 unsigned int copy_to_guest_ll(void __user *to, const void *from, unsigned int n)
 {
-    unsigned dummy;
+    GUARD(unsigned dummy);
 
     stac();
     asm volatile (
         GUARD(
         "    guest_access_mask_ptr %[to], %q[scratch1], %q[scratch2]\n"
         )
-        "    cmp  $"STR(2*BYTES_PER_LONG-1)", %[cnt]\n"
-        "    jbe  1f\n"
-        "    mov  %k[to], %[cnt]\n"
-        "    neg  %[cnt]\n"
-        "    and  $"STR(BYTES_PER_LONG-1)", %[cnt]\n"
-        "    sub  %[cnt], %[aux]\n"
-        "4:  rep movsb\n" /* make 'to' address aligned */
-        "    mov  %[aux], %[cnt]\n"
-        "    shr  $"STR(LONG_BYTEORDER)", %[cnt]\n"
-        "    and  $"STR(BYTES_PER_LONG-1)", %[aux]\n"
-        "    .align 2,0x90\n"
-        "0:  rep movs"__OS"\n" /* as many words as possible... */
-        "    mov  %[aux],%[cnt]\n"
-        "1:  rep movsb\n" /* ...remainder copied as bytes */
+        "1:  rep movsb\n"
         "2:\n"
-        ".section .fixup,\"ax\"\n"
-        "5:  add %[aux], %[cnt]\n"
-        "    jmp 2b\n"
-        "3:  lea (%q[aux], %q[cnt], "STR(BYTES_PER_LONG)"), %[cnt]\n"
-        "    jmp 2b\n"
-        ".previous\n"
-        _ASM_EXTABLE(4b, 5b)
-        _ASM_EXTABLE(0b, 3b)
         _ASM_EXTABLE(1b, 2b)
-        : [cnt] "+c" (n), [to] "+D" (to), [from] "+S" (from),
-          [aux] "=&r" (dummy)
+        : [cnt] "+c" (n), [to] "+D" (to), [from] "+S" (from)
           GUARD(, [scratch1] "=&r" (dummy), [scratch2] "=&r" (dummy))
-        : "[aux]" (n)
-        : "memory" );
+        :: "memory" );
     clac();
 
     return n;
@@ -66,25 +43,9 @@ unsigned int copy_from_guest_ll(void *to
         GUARD(
         "    guest_access_mask_ptr %[from], %q[scratch1], %q[scratch2]\n"
         )
-        "    cmp  $"STR(2*BYTES_PER_LONG-1)", %[cnt]\n"
-        "    jbe  1f\n"
-        "    mov  %k[to], %[cnt]\n"
-        "    neg  %[cnt]\n"
-        "    and  $"STR(BYTES_PER_LONG-1)", %[cnt]\n"
-        "    sub  %[cnt], %[aux]\n"
-        "4:  rep movsb\n" /* make 'to' address aligned */
-        "    mov  %[aux],%[cnt]\n"
-        "    shr  $"STR(LONG_BYTEORDER)", %[cnt]\n"
-        "    and  $"STR(BYTES_PER_LONG-1)", %[aux]\n"
-        "    .align 2,0x90\n"
-        "0:  rep movs"__OS"\n" /* as many words as possible... */
-        "    mov  %[aux], %[cnt]\n"
-        "1:  rep movsb\n" /* ...remainder copied as bytes */
+        "1:  rep movsb\n"
         "2:\n"
         ".section .fixup,\"ax\"\n"
-        "5:  add  %[aux], %[cnt]\n"
-        "    jmp 6f\n"
-        "3:  lea  (%q[aux], %q[cnt], "STR(BYTES_PER_LONG)"), %[cnt]\n"
         "6:  mov  %[cnt], %k[from]\n"
         "    xchg %%eax, %[aux]\n"
         "    xor  %%eax, %%eax\n"
@@ -93,14 +54,11 @@ unsigned int copy_from_guest_ll(void *to
         "    mov  %k[from], %[cnt]\n"
         "    jmp 2b\n"
         ".previous\n"
-        _ASM_EXTABLE(4b, 5b)
-        _ASM_EXTABLE(0b, 3b)
         _ASM_EXTABLE(1b, 6b)
         : [cnt] "+c" (n), [to] "+D" (to), [from] "+S" (from),
           [aux] "=&r" (dummy)
           GUARD(, [scratch1] "=&r" (dummy), [scratch2] "=&r" (dummy))
-        : "[aux]" (n)
-        : "memory" );
+        :: "memory" );
     clac();
 
     return n;
@@ -145,20 +103,12 @@ unsigned int clear_guest_pv(void __user
         stac();
         asm volatile (
             "    guest_access_mask_ptr %[to], %[scratch1], %[scratch2]\n"
-            "0:  rep stos"__OS"\n"
-            "    mov  %[bytes], %[cnt]\n"
             "1:  rep stosb\n"
             "2:\n"
-            ".section .fixup,\"ax\"\n"
-            "3:  lea  (%q[bytes], %q[longs], "STR(BYTES_PER_LONG)"), %[cnt]\n"
-            "    jmp  2b\n"
-            ".previous\n"
-            _ASM_EXTABLE(0b,3b)
             _ASM_EXTABLE(1b,2b)
-            : [cnt] "=&c" (n), [to] "+D" (to), [scratch1] "=&r" (dummy),
+            : [cnt] "+c" (n), [to] "+D" (to), [scratch1] "=&r" (dummy),
               [scratch2] "=&r" (dummy)
-            : [bytes] "r" (n & (BYTES_PER_LONG - 1)),
-              [longs] "0" (n / BYTES_PER_LONG), "a" (0) );
+            : "a" (0) );
         clac();
     }
 

