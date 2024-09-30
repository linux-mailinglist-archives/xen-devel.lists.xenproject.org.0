Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 162E398A825
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 17:09:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807431.1218876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svI0e-00024m-Hv; Mon, 30 Sep 2024 15:08:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807431.1218876; Mon, 30 Sep 2024 15:08:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svI0e-00022z-FA; Mon, 30 Sep 2024 15:08:24 +0000
Received: by outflank-mailman (input) for mailman id 807431;
 Mon, 30 Sep 2024 15:08:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1QIX=Q4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svI0c-00022q-BI
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 15:08:22 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3749afa-7f3d-11ef-99a2-01e77a169b0f;
 Mon, 30 Sep 2024 17:08:19 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2fad6de2590so5847751fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 08:08:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c882494863sm4536246a12.92.2024.09.30.08.08.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Sep 2024 08:08:17 -0700 (PDT)
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
X-Inumbo-ID: d3749afa-7f3d-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727708898; x=1728313698; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iI9UhhIP46ohbqpT7wPLqw3ghHjlTKT7Zx5OV6H10J8=;
        b=Gx/DGs4aksPihJG73KRCqwlhvNPBz3rUtitnflYkIADoxTTzOC/sAu/ohFFbZ+DV+b
         JyoSiw41N4qxP2SsPNePdyTrA7OTXFTAXIYi29rHY2h0HXXk3tT4Kf3KnFGaaHc5J9Gj
         Arl50MCQ2W7CIRUdMnajWDtNu2GTA7Lxt77aMYjQgDM3Z+Lnkei/rSxH+k4RUfqCVBvb
         7hlgSnRpPV7ZP+6ACZY7L1pF9A7rkdSTR2wwLLU9hmiyq536VL8dEubnSK2vRqSJs+Bp
         MV+4XiADtUJ92oeyq8A2YRYrLWI1Q3RYA5eQUqs+1fEJqxEO+axeCZdPjUn6ACFRjuby
         2RDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727708898; x=1728313698;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iI9UhhIP46ohbqpT7wPLqw3ghHjlTKT7Zx5OV6H10J8=;
        b=ntBu0Xd6oKz6Xg2YMXuXxRH3UMVDOMLfe2ijBchL893ywn535ZOeAoNNcN1mvdiX1j
         DnYH1wh4GQtZT4BsRFIMKwVoJxtpvwNuXxXNvstf2D0ccyqfC/gJkQ5kz3LW4hNLfInn
         9s9i7dBRflYDEYL0jOHJvmi0z+5D/AZ6/MDEtfjNXSCncY1CwfttIV11DVJBUKtELo+N
         EVS6ZIys8xRt3bZ/kPPBFvr2ettWzWVLNmrGXU93ba8giCtO+a+iTOOynudJrqQFpmkk
         OAbjGCYAsOK5CT3ztNnRJsG8zz0p5P7cm+p49LySH5hQKaxAZr4NJf+/iDdjmn6V5xPl
         R9KQ==
X-Gm-Message-State: AOJu0YzcIar8IjYSwjMFC7SsCUXl4FAM8wrMQTEZ9MTiSJ6mLx4Z89Oi
	L2cq+iAR92ju1wcPnqfx7FdW7os7V6s9mfy9cYSyXLihDABFpfymO8bArksUscjztwjcVshLX6g
	=
X-Google-Smtp-Source: AGHT+IFrnI3xsbgon9Ga4ryiqyTMdH9+aIS4v4fWBkwVtcQ+4Z1RJ59HDLgI+YV+M9Hy/CYG+iSwpw==
X-Received: by 2002:a2e:be1c:0:b0:2fa:cd3d:4a76 with SMTP id 38308e7fff4ca-2facd3d4c8fmr30686311fa.43.1727708898203;
        Mon, 30 Sep 2024 08:08:18 -0700 (PDT)
Message-ID: <cae006a7-c1be-4608-a011-dda1fb4a0312@suse.com>
Date: Mon, 30 Sep 2024 17:08:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: prefer RDTSCP in rdtsc_ordered()
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

If available, its use is supposed to be cheaper than LFENCE+RDTSC, and
is virtually guaranteed to be cheaper than MFENCE+RDTSC.

Unlike in rdtsc() use 64-bit local variables, eliminating the need for
the compiler to emit a zero-extension insn for %eax (that's a cheap MOV,
yet still pointless to have).

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -108,18 +108,30 @@ static inline uint64_t rdtsc(void)
 
 static inline uint64_t rdtsc_ordered(void)
 {
-	/*
-	 * The RDTSC instruction is not ordered relative to memory access.
-	 * The Intel SDM and the AMD APM are both vague on this point, but
-	 * empirically an RDTSC instruction can be speculatively executed
-	 * before prior loads.  An RDTSC immediately after an appropriate
-	 * barrier appears to be ordered as a normal load, that is, it
-	 * provides the same ordering guarantees as reading from a global
-	 * memory location that some other imaginary CPU is updating
-	 * continuously with a time stamp.
-	 */
-	alternative("lfence", "mfence", X86_FEATURE_MFENCE_RDTSC);
-	return rdtsc();
+    uint64_t low, high, aux;
+
+    /*
+     * The RDTSC instruction is not ordered relative to memory access.
+     * The Intel SDM and the AMD APM are both vague on this point, but
+     * empirically an RDTSC instruction can be speculatively executed
+     * before prior loads.  An RDTSC immediately after an appropriate
+     * barrier appears to be ordered as a normal load, that is, it
+     * provides the same ordering guarantees as reading from a global
+     * memory location that some other imaginary CPU is updating
+     * continuously with a time stamp.
+     *
+     * RDTSCP, otoh, "does wait until all previous instructions have
+     * executed and all previous loads are globally visible" (SDM) /
+     * "forces all older instructions to retire before reading the
+     * timestamp counter" (APM)
+     */
+    alternative_io_2("lfence; rdtsc",
+                     "mfence; rdtsc", X86_FEATURE_MFENCE_RDTSC,
+                     "rdtscp",        X86_FEATURE_RDTSCP,
+                     ASM_OUTPUT2("=a" (low), "=d" (high), "=c" (aux)),
+                     /* no inputs */);
+
+    return (high << 32) | low;
 }
 
 #define __write_tsc(val) wrmsrl(MSR_IA32_TSC, val)

