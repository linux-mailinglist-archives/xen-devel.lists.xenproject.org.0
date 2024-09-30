Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC3898A847
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 17:15:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807470.1218965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svI7W-0007q4-Fa; Mon, 30 Sep 2024 15:15:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807470.1218965; Mon, 30 Sep 2024 15:15:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svI7W-0007o1-Cy; Mon, 30 Sep 2024 15:15:30 +0000
Received: by outflank-mailman (input) for mailman id 807470;
 Mon, 30 Sep 2024 15:15:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1QIX=Q4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svI7V-0007nv-J2
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 15:15:29 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d38a118d-7f3e-11ef-a0ba-8be0dac302b0;
 Mon, 30 Sep 2024 17:15:28 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2facf48157dso12772741fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 08:15:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c882405b3bsm4615526a12.20.2024.09.30.08.15.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Sep 2024 08:15:27 -0700 (PDT)
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
X-Inumbo-ID: d38a118d-7f3e-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727709328; x=1728314128; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BUEvGmUbLl9Xu5HOzdd8BnTUCVg2AIbSq59ZEl0em3M=;
        b=SsAdb8JYNKVQcAmSnTgQ6w2d53atarLanWHocAWiYuYgJv4tVItVYAnBNixlUnbcHd
         OcJkQ7mtaiL2LLQhoPbV8k1/uDFnIEdywaepm1YgGKMobTsPxf/r2SiH6VRGNWGBgprr
         U83ail0S8jddcd+M9nuN+5cP9FEy9KBiNKKno4rYMQzuooP1qO8O5Yn2DPP9Pjm2YNCL
         fM5ckR3KQgYOwdeHpr0CmWy7b/RysxqRbEqd1T8y/0fpkL9Z0boGMVW8eIACnTQzX4GV
         Xfji+R8wkHWzqdDS3VOZMoRGfQEViCigKQnkAi3/yyTIJYXAEN0g4Rmm2KFViBESsL1F
         +U6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727709328; x=1728314128;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BUEvGmUbLl9Xu5HOzdd8BnTUCVg2AIbSq59ZEl0em3M=;
        b=B/JjRqXp6Gtz1GSswev3Umyy2o6ugE0uehOW+6TdhoMIiLmx8bCO+EPxXs4gxPx6ev
         0TuMaY7RpXuwgEbMYixenc+F92cd6aAwc98MDpcme1c4wArjgBjOfYNb8xRUIjVtdNuH
         3TXFcGMZBMjCWqjNDOjel4xV1Q0SSXakCumxGoK3+lT9rW+OwoscX/JpDP1kZkHyPo2G
         eX2mRThvNUy9J0tkEBpX4DxlNyOOquoU39l4o1sVFupzp2uw9isU1mF13McvHA9tXEB/
         JkEL0u5EbnyPnfMe/uQr6IVg/DEAZyiwrlVzkMiVAt5sYvdVZ313oQFFCSktqiovexxM
         5R9g==
X-Gm-Message-State: AOJu0Yxoxtd8r7SefQiIiZhvBBdymUnTXQb14yUc2Os1HKOT/wiKnAtI
	b5yZNqsoCQmXczbuAWpp9UusUF0g9DiNsi8N4eOlYZMXodyOtezCFlEnuh8BkiohA2oFWCvE/OM
	=
X-Google-Smtp-Source: AGHT+IGhIo49eR4FBa0vR8AG74a1NE4NIaRkpzEhvxlSo5E+oEe0v/nanSMb+AiowEsYNd/rCoFy9A==
X-Received: by 2002:a2e:a99d:0:b0:2fa:c57a:3b19 with SMTP id 38308e7fff4ca-2fac57a3f49mr32519011fa.12.1727709328038;
        Mon, 30 Sep 2024 08:15:28 -0700 (PDT)
Message-ID: <e379a005-a9ee-41ae-a797-9768c6aeb52e@suse.com>
Date: Mon, 30 Sep 2024 17:15:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/MSR: improve code gen for rdmsr_safe() and rdtsc()
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

To fold two 32-bit outputs from the asm()-s into a single 64-bit value
the compiler needs to emit a zero-extension insn for the low half. Both
RDMSR and RDTSC clear the upper halves of their output registers anyway,
though. So despite that zero-extending insn (a simple MOV) being cheap,
we can do better: Without one, by declaring the local variables as 64-
bit ones.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -54,17 +54,17 @@ static inline void wrmsr_ns(uint32_t msr
 /* rdmsr with exception handling */
 #define rdmsr_safe(msr,val) ({\
     int rc_; \
-    uint32_t lo_, hi_; \
+    uint64_t lo_, hi_; \
     __asm__ __volatile__( \
         "1: rdmsr\n2:\n" \
         ".section .fixup,\"ax\"\n" \
-        "3: xorl %0,%0\n; xorl %1,%1\n" \
+        "3: xorl %k0,%k0\n; xorl %k1,%k1\n" \
         "   movl %5,%2\n; jmp 2b\n" \
         ".previous\n" \
         _ASM_EXTABLE(1b, 3b) \
         : "=a" (lo_), "=d" (hi_), "=&r" (rc_) \
         : "c" (msr), "2" (0), "i" (-EFAULT)); \
-    val = lo_ | ((uint64_t)hi_ << 32); \
+    val = lo_ | (hi_ << 32); \
     rc_; })
 
 /* wrmsr with exception handling */
@@ -99,11 +99,11 @@ static inline void weak_wrmsr_fence(bool
 
 static inline uint64_t rdtsc(void)
 {
-    uint32_t low, high;
+    uint64_t low, high;
 
     __asm__ __volatile__("rdtsc" : "=a" (low), "=d" (high));
 
-    return ((uint64_t)high << 32) | low;
+    return (high << 32) | low;
 }
 
 static inline uint64_t rdtsc_ordered(void)

