Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FBE98B8FD
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 12:10:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807962.1219729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svZpz-0007aO-21; Tue, 01 Oct 2024 10:10:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807962.1219729; Tue, 01 Oct 2024 10:10:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svZpy-0007Y3-Vd; Tue, 01 Oct 2024 10:10:34 +0000
Received: by outflank-mailman (input) for mailman id 807962;
 Tue, 01 Oct 2024 10:10:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svZpx-0007Xx-15
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 10:10:33 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6414bf63-7fdd-11ef-a0ba-8be0dac302b0;
 Tue, 01 Oct 2024 12:10:31 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a90188ae58eso679089366b.1
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 03:10:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c297c2d2sm681559266b.183.2024.10.01.03.10.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Oct 2024 03:10:30 -0700 (PDT)
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
X-Inumbo-ID: 6414bf63-7fdd-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727777431; x=1728382231; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=atOslSW3AtxX2me6x5sBuob6Y4+ZjY9ICKjrMew4/uw=;
        b=DUDxzIJXBrdZjTUCypgv29yEzM2yyEU26fQE97pp4JyYqwHYFN2KtFHYveFl5Vj8AR
         nWSFA+CSDUYGdmV8V2gEEOANaff90YYIC1vRdIFzYVFliyLvGClJ4RsMIuY/1quahQiT
         ykmCBOqYC6lQJhrK3acgp+z8vbwzK1mtn3L8yqncBc8lyakQDBchPtzaWbMrBOoru0ZO
         TXfak9jhmSjJjDf2K4wirCiw9ROLxidbPPMuA6w4sdvywcWtp7H6GmAoVAQSiyCSJ0os
         6zWebRReNS3pF4PdA9GPPYiX/FNWw9bxVA5snUcXMvsEG/bbARbWTyUaL9YICr+GEiM7
         4PYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727777431; x=1728382231;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=atOslSW3AtxX2me6x5sBuob6Y4+ZjY9ICKjrMew4/uw=;
        b=dV65iOhlKvR5f06tRrIt4VBwPRcfhNSyTseT6cP3fRy1AGIVsSnE1uccB3sfRaIGMG
         FdB8Y1nNUjZJLvFtghzT8j+FsU5MAhIf5TXZfYQai0l0lpQdcDFiy/7FHSr1E74KW2mz
         pvawwpVgiarEeac7WoLGLGiDjA4E/Ew+j35i2Vssh9orC8qaQn3YWKWrDYXntTuhmGS8
         OXDzqb/WLAwh4pkw3OGz927wabVrF8Y8ikxkm1/EZ3B9WX7ubzxtTR11fbbHjW5E2Hfw
         tcsVhbC2UHk/lpWbmltNWhvTrJ+9UGWNvdzZmadqx0BNKxKR0DeQ0nta+1CkEX9UghLp
         gFEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZh9iAu9SwP+FEqaJxR/YzCkWk3M0RIZIkT/2NH5ZU06NuQaunY6fiNHA1UvUQpk6+yW2qUchA7C4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyDhfEEUxmHnJKfrFRUT25E6HLdPdChAIZfL9WHrGijZZUqzg9B
	jGSfKKLU6Q2Oh9fOWTFeGoSWX7OOvVoWqsaRFnvW+6lNDFObQGyfWo2CW1I/Zw==
X-Google-Smtp-Source: AGHT+IGtKAJQiZOtQl7EHpRDFj7csdz0MZxIUW8EKHW1OWdg5WUKZ/2zKwNyTqjXt4rYMbepLy4FEQ==
X-Received: by 2002:a17:907:7283:b0:a8d:2faf:d33d with SMTP id a640c23a62f3a-a93c48f1d0dmr1356728166b.9.1727777431138;
        Tue, 01 Oct 2024 03:10:31 -0700 (PDT)
Message-ID: <7bb25b6d-3905-4d5a-a8df-6d258ce7b001@suse.com>
Date: Tue, 1 Oct 2024 12:10:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: prefer RDTSCP in rdtsc_ordered()
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cae006a7-c1be-4608-a011-dda1fb4a0312@suse.com>
 <14ab2f50-e58c-4cb4-b976-4cb5ec14d908@citrix.com>
 <90f1dda1-b06e-40e6-be6b-ea99acba875f@suse.com>
 <07699749-f9b6-4d78-874c-ff61d76810dc@citrix.com>
 <a1b772bb-113b-4bb3-b58a-09bda98f5c2b@suse.com>
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
In-Reply-To: <a1b772bb-113b-4bb3-b58a-09bda98f5c2b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.10.2024 12:02, Jan Beulich wrote:
> On 01.10.2024 11:45, Andrew Cooper wrote:
>> On 01/10/2024 9:12 am, Jan Beulich wrote:
>>> On 30.09.2024 18:40, Andrew Cooper wrote:
>>>> On 30/09/2024 4:08 pm, Jan Beulich wrote:
>>>>> --- a/xen/arch/x86/include/asm/msr.h
>>>>> +++ b/xen/arch/x86/include/asm/msr.h
>>>>> @@ -108,18 +108,30 @@ static inline uint64_t rdtsc(void)
>>>>>  
>>>>>  static inline uint64_t rdtsc_ordered(void)
>>>>>  {
>>>>> -	/*
>>>>> -	 * The RDTSC instruction is not ordered relative to memory access.
>>>>> -	 * The Intel SDM and the AMD APM are both vague on this point, but
>>>>> -	 * empirically an RDTSC instruction can be speculatively executed
>>>>> -	 * before prior loads.  An RDTSC immediately after an appropriate
>>>>> -	 * barrier appears to be ordered as a normal load, that is, it
>>>>> -	 * provides the same ordering guarantees as reading from a global
>>>>> -	 * memory location that some other imaginary CPU is updating
>>>>> -	 * continuously with a time stamp.
>>>>> -	 */
>>>>> -	alternative("lfence", "mfence", X86_FEATURE_MFENCE_RDTSC);
>>>>> -	return rdtsc();
>>>>> +    uint64_t low, high, aux;
>>>>> +
>>>>> +    /*
>>>>> +     * The RDTSC instruction is not ordered relative to memory access.
>>>>> +     * The Intel SDM and the AMD APM are both vague on this point, but
>>>>> +     * empirically an RDTSC instruction can be speculatively executed
>>>>> +     * before prior loads.
>>>> This part of the comment is stale now.  For RDTSC, AMD state:
>>>>
>>>> "This instruction is not serializing. Therefore, there is no guarantee
>>>> that all instructions have completed at the time the time-stamp counter
>>>> is read."
>>>>
>>>> and for RDTSCP:
>>>>
>>>> "Unlike the RDTSC instruction, RDTSCP forces all older instructions to
>>>> retire before reading the time-stamp counter."
>>>>
>>>> i.e. it's dispatch serialising, given our new post-Spectre terminology.
>>> I don't read that as truly "dispatch serializing";
>>
>> That is precisely what dispatch serialising is and means.
>>
>> Both LFENCE and RDTSCP wait at dispatch until they're the only
>> instruction in the pipeline.  That is how they get the property of
>> waiting for all older instructions to retire before executing.
>>
>>> both Intel and AMD
>>> leave open whether subsequent insns would also be affected, or whether
>>> those could pass the RDTSCP.
>>
>> Superscalar pipelines which can dispatch more than one uop per cycle can
>> issue LFENCE/RDTSCP concurrently with younger instructions.
>>
>> This is why LFENCE; JMP * was retracted as safe alternative to
>> retpoline, and why the Intel docs call out explicitly that you need
>> LFENCE following the RDTSC(P) if you want it to complete before
>> subsequent instructions start.
> 
> Yet what you describe still only puts in place a relationship between
> RDTSCP and what follows. What I was saying is that there's no guarantee
> that insns following RDTSCP can't actually execute not only in parallel
> with RDTSCP, but also in parallel with / ahead of earlier insns. Aiui
> LFENCE makes this guarantee. IOW in
> 
> 	ADD ...; LFENCE; SUB ...
> 
> the SUB is guaranteed to dispatch only after the ADD, whereas in
> 
> 	ADD ...; RDTSCP; SUB ...
> 
> there doesn't appear to be such a guarantee; the only guarantee here is
> for RDTSCP to dispatch after the ADD.

And btw, if there wasn't this difference, why would RDTSCP be any better
than LFENCE; RDTSC?

Jan

