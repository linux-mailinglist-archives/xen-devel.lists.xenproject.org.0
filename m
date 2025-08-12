Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB28B2204D
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 10:08:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078375.1439359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulk3E-0000to-Uz; Tue, 12 Aug 2025 08:08:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078375.1439359; Tue, 12 Aug 2025 08:08:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulk3E-0000rI-Ry; Tue, 12 Aug 2025 08:08:08 +0000
Received: by outflank-mailman (input) for mailman id 1078375;
 Tue, 12 Aug 2025 08:08:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pr65=2Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ulk3D-0000r8-Gj
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 08:08:07 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a3c7ac2-7753-11f0-a327-13f23c93f187;
 Tue, 12 Aug 2025 10:08:06 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-af9618282a5so989161866b.2
 for <xen-devel@lists.xenproject.org>; Tue, 12 Aug 2025 01:08:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af938aa8275sm1928395566b.57.2025.08.12.01.08.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Aug 2025 01:08:05 -0700 (PDT)
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
X-Inumbo-ID: 7a3c7ac2-7753-11f0-a327-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754986086; x=1755590886; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tikZqxniQEeCxvq1AdcRoaG4v/+IN2vdkpwVHqucwKE=;
        b=gsWQiodrVreMVkwQ2HNPaXx+lD/Wt7Jb0+/b4iA/oJD5RqODJ1sDSV+ljgOrcO/I/x
         Q5nvK7VJODr7HuZpPTL7Pz8aYRVRZQLi+s8dZdc5HdRz1sZkFWOeAr1wP1Kz68JlYSzR
         JdBuKQI3zNzhUJukPflzsbkS7+Q6U852zk+TYvMpQjcskjIEWHZ7Rv6VYc/zNNzjQUjV
         8Gdz95jON9XXy/T1cHtRx9/jiwkE2oSy6hUl4DBe95NIKa5FbzzuZdcdzCuuAzkbMl2R
         xh9RYThpnq7SCdur6qb0aisJqtAcbr4WirpdmAg2ohdtYPgta+NRm54flTat5Z5gTbV1
         6CJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754986086; x=1755590886;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tikZqxniQEeCxvq1AdcRoaG4v/+IN2vdkpwVHqucwKE=;
        b=hGvHgFdQLXW+Sxex17/cwLsga35neyELz+OHHrVSMufGUXGozXYVskHH/i7PTEuWH7
         P0sz3GAuAJvsVoIpdbb06dcd9+Gn4Mkdpa8sXLSST5tib3abEX+dzT+FK63ulvZGvLgK
         8r1MqEx2u+Oo0tfsA1tmuEONIn/a4bztzs/TiMnPyyGTUfxNgSs6o/npxTT75yAUTnmq
         XkFPAgN60K4+cUpEQ5n1E31o/2uPtxTC4yn4snvs0BtoIKXZxIa+w19T5ghvPbYZNh8Y
         M7OWzB0B6EJ1pDltjkRX25njFe2Smi6cJ+JK39mT9MwHC6+06t68xvNPQ8C14jDBSvjK
         XxPg==
X-Forwarded-Encrypted: i=1; AJvYcCXBNn6nc7i+meRj4Dqdu3lLmSm/bY0RfpgGUSUcz2oc4tCD4IWOlpZArKWmMzNGd6K+1Q1ffthRF3s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzLQuuTx5fkUCaYUXcZNPr0DyuLzaVEfPVUjW57HgmN4/9Jh+Wk
	/ZhKo8XBMM005bz3+lTeD7KEAWt/nU//KjfgIcBmv7JsqGDbwFov1OWTvxZkbMoJ/g==
X-Gm-Gg: ASbGncsEoaDHHDj9quOnPo9XQDWJYRGmLiPN3RACJbW87Xk/nXr3LSMBTP64n2VFm2j
	HmVN0pTIHGyzZxzA/yu8cjjCSM+j40K6ZEvL4o5t+xgLAp6PCOcxdAkQHupwPNPcpzsf6PBFuK8
	GlMVCydHdfYYIo1db6w2calschOXmthJIB/z9o3CJuKAGdh3N5MgMQl5NBi3M4CGWKpZIUyJSH2
	fCNpJbNs8EBNwbiAf1isdI9+hnL9VbcG9CLebm6D+IgEuoVn10/dQaM2f3uHuyuVZXvYQ83YVhl
	U8xRNxpASN4lZlixTATnmmgkE9TKhHg38xwFnnAFCyLoxivEixlQ/wg+3Yjvssc9hGPJClrjoW2
	H9BMGM7mWkDZYUGiPtV6IAWxeSOiTaF0fr5k9RNjdfq1+fsSZOLrgTOfUBq6nrTbBFzTZyKh/FQ
	zWeXFxAUA=
X-Google-Smtp-Source: AGHT+IHjx4ALgaGg8V07LRx+k3imaWuyQWVd9NvF2AhjyVKaxrJRGlY7Cat3GQ+WoXJouvO8p0YXPg==
X-Received: by 2002:a17:906:9f91:b0:af9:e3d3:a43f with SMTP id a640c23a62f3a-afa1e129125mr224942266b.47.1754986085938;
        Tue, 12 Aug 2025 01:08:05 -0700 (PDT)
Message-ID: <18bf1a4d-5af9-44a4-8c51-3a0bf6e69e20@suse.com>
Date: Tue, 12 Aug 2025 10:08:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/22] x86/msr: Rename wrmsr_ns() to wrmsrns(), and take
 64bit value
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-3-andrew.cooper3@citrix.com>
 <be2b70cc-11ba-4f3a-b0b8-0ead6d14934f@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <be2b70cc-11ba-4f3a-b0b8-0ead6d14934f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.08.2025 08:36, Andrew Cooper wrote:
> On 08/08/2025 9:22 pm, Andrew Cooper wrote:
>> In hindsight, having the wrapper name not be the instruction mnemonic was a
>> poor choice.  Also, PKS turns out to be quite rare in wanting a split value.
>>
>> Switch to using a single 64bit value in preparation for new users.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> ---
>>  xen/arch/x86/include/asm/msr.h      | 4 ++--
>>  xen/arch/x86/include/asm/prot-key.h | 4 ++--
>>  2 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
>> index 4c4f18b3a54d..b6b85b04c3fd 100644
>> --- a/xen/arch/x86/include/asm/msr.h
>> +++ b/xen/arch/x86/include/asm/msr.h
>> @@ -39,7 +39,7 @@ static inline void wrmsrl(unsigned int msr, uint64_t val)
>>  }
>>  
>>  /* Non-serialising WRMSR, when available.  Falls back to a serialising WRMSR. */
>> -static inline void wrmsr_ns(uint32_t msr, uint32_t lo, uint32_t hi)
>> +static inline void wrmsrns(uint32_t msr, uint64_t val)
>>  {
>>      /*
>>       * WRMSR is 2 bytes.  WRMSRNS is 3 bytes.  Pad WRMSR with a redundant CS
>> @@ -47,7 +47,7 @@ static inline void wrmsr_ns(uint32_t msr, uint32_t lo, uint32_t hi)
>>       */
>>      alternative_input(".byte 0x2e; wrmsr",
>>                        ".byte 0x0f,0x01,0xc6", X86_FEATURE_WRMSRNS,
>> -                      "c" (msr), "a" (lo), "d" (hi));
>> +                      "c" (msr), "a" (val), "d" (val >> 32));
>>  }
> 
> It turns out this is the case poor code generation for MSR_STAR.
> 
> I've adjusted it to:
> 
> @@ -39,8 +39,10 @@ static inline void wrmsrl(unsigned int msr, uint64_t val)
>  }
>  
>  /* Non-serialising WRMSR, when available.  Falls back to a serialising WRMSR. */
> -static inline void wrmsr_ns(uint32_t msr, uint32_t lo, uint32_t hi)
> +static inline void wrmsrns(uint32_t msr, uint64_t val)
>  {
> +    uint32_t lo = val, hi = val >> 32;
> +
>      /*
>       * WRMSR is 2 bytes.  WRMSRNS is 3 bytes.  Pad WRMSR with a redundant CS
>       * prefix to avoid a trailing NOP.
> 
> 
> which stops the compiler from loading the high half of %rax too.

Acked-by: Jan Beulich <jbeulich@suse.com>


