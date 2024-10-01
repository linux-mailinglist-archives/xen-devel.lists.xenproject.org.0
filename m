Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7419098B69C
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 10:16:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807800.1219460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svY35-0007dK-Uq; Tue, 01 Oct 2024 08:15:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807800.1219460; Tue, 01 Oct 2024 08:15:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svY35-0007bd-Ri; Tue, 01 Oct 2024 08:15:59 +0000
Received: by outflank-mailman (input) for mailman id 807800;
 Tue, 01 Oct 2024 08:15:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svY34-0007bX-Ii
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 08:15:58 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 624beb2a-7fcd-11ef-99a2-01e77a169b0f;
 Tue, 01 Oct 2024 10:15:56 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5c5bca59416so6391686a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 01:15:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c297a2ffsm664129266b.157.2024.10.01.01.15.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Oct 2024 01:15:55 -0700 (PDT)
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
X-Inumbo-ID: 624beb2a-7fcd-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727770556; x=1728375356; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=a4gMfIFPUAaK2nqbir6IXSjpJskN0iJBMl8Ep6+D95o=;
        b=CNtVr4IjQBNzO2N0+aII+ussugw+vOQGTs5+FxYS8BV6f+mhiQSDrDVJMXTbJBo5Vx
         9DU6uuMkaycycZJnbTKUT5AF3HbB0zsmzih9bAgRQiGzzC3BnO07fi87morxJo98zpH+
         86Y73N/M1u59VIcWvVhxAszFWLDLzjDGE7VUIg5xIGshwIq+hdcTlc7nBJ6SIuGvHRwn
         ZngjOrTHd9stZtJPd3YM8eTIxZRN2v4QPJ5SGMy7a9EzhT/cxaes08ZToORfDN103bRg
         yHvLVjvzMeyLPHn4EBQlUWOfDfUY91THOSort4hTJzMZM5Yxdkn1VyfmhUYNKTKS4Ewq
         RbCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727770556; x=1728375356;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a4gMfIFPUAaK2nqbir6IXSjpJskN0iJBMl8Ep6+D95o=;
        b=RX/Io4YKDi7prQfyhWYxBoMrQRMPSTgAUglDY1uyn6Y+BYed0WprUQu1aYNfhOkYVj
         7Mgz5iyTh8karDqz3c5/yraeIV5jEcf/Lb0Viz3U3CoNFfmTpd/X3TAtEP53OLXCfsN/
         Ywt+h3slgIPhkmiPHxb6DC9kwuHPwN77can84wwOwgOc5xqApnCQ0xYIUhP9zkalYh2I
         yUbI2cr/txeaX7Ku/45Tnw03EBl3T4TALGtxZZCHSrW32PuxyDvmdRIlBKP5IRmFAy1U
         Hae8CTTNC8dQqbRe9d9D1gtm6gHTuG4dji3NoWOcvGRLL9s+ckQ1Ctt7Rz7Z9oEjw3ww
         u3Aw==
X-Gm-Message-State: AOJu0YzokSJyzbIhoMEHq73h6DvE+jXcneHllvERtrvtWUSrP7u7iAm5
	cbvfYk4eYkVb6kuf9T6HTTC7ZRaIWvh+DMLQXM4Zwg23twRbgrOVYD5KCiaCwZqW3q9hkkWyprc
	=
X-Google-Smtp-Source: AGHT+IGtdvRwTtTL1Xzfs8DVctFj6Tmsn7Mq9t9PLMvIgunZfoB/fDzcq3OeO58+QrKeOochSazeDQ==
X-Received: by 2002:a17:907:7d93:b0:a8d:2faf:d333 with SMTP id a640c23a62f3a-a93c4967988mr1351988366b.35.1727770556138;
        Tue, 01 Oct 2024 01:15:56 -0700 (PDT)
Message-ID: <7d60fb7a-8db2-49cc-b7ba-bab023c6ed1f@suse.com>
Date: Tue, 1 Oct 2024 10:15:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86: prefer RDTSCP in rdtsc_ordered()
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

If available, its use is supposed to be cheaper than LFENCE+RDTSC, and
is virtually guaranteed to be cheaper than MFENCE+RDTSC.

Update commentary (and indentation) while there.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Replace original part of the comment with more up-to-date info.

--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -108,18 +108,24 @@ static inline uint64_t rdtsc(void)
 
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
+     * The RDTSC instruction is not serializing.  Make it dispatch serializing
+     * for the purposes here by issuing LFENCE (or MFENCE if necessary) ahead
+     * of it.
+     *
+     * RDTSCP, otoh, "does wait until all previous instructions have executed
+     * and all previous loads are globally visible" (SDM) / "forces all older
+     * instructions to retire before reading the timestamp counter" (APM).
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

