Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2355598B69A
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 10:13:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807793.1219449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svY08-00070T-DM; Tue, 01 Oct 2024 08:12:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807793.1219449; Tue, 01 Oct 2024 08:12:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svY08-0006yL-Ad; Tue, 01 Oct 2024 08:12:56 +0000
Received: by outflank-mailman (input) for mailman id 807793;
 Tue, 01 Oct 2024 08:12:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svY07-0006yF-0l
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 08:12:55 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4a16134-7fcc-11ef-99a2-01e77a169b0f;
 Tue, 01 Oct 2024 10:12:52 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5398f3be400so2605008e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 01:12:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2777214sm656684866b.36.2024.10.01.01.12.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Oct 2024 01:12:51 -0700 (PDT)
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
X-Inumbo-ID: f4a16134-7fcc-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727770372; x=1728375172; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ptyCDjr08E7ZLdtcQ9d416q/EwigsEhh/l8BdRITrf0=;
        b=eiD13FL22jsLvontiiQqkwKDoZEuUQSRhI/SHcZ88HVQHvDqPyM+hNaF8qbQtgFoJV
         IPDGWtL3IZqgE4QkZQusGvM7IhJEv1gz7CZCBO2XSBJhusPbT4drKmOhNGu1n77ATUFN
         VuQb6YSlfV0FEIbzYYo5SHQk40/EJ62XZp+R3bqy0VKbuyvpkW+tnphIrM+U+MpK3FTM
         SS6y6OscHEfIu8vR/F4+CR258/hsnzWJhQ70TZOhHY3Ft/atA5x+B44zCBDXY3c+1CTq
         mMVmp+Udwegg0rdb5nZw/6V7PMO/v/i3k0AXPkbgPs8SWJFGaDgFZZZX4LqWfQdG9aXt
         jCbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727770372; x=1728375172;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ptyCDjr08E7ZLdtcQ9d416q/EwigsEhh/l8BdRITrf0=;
        b=nKEPlpJfriYpbhG3UcZtHcBE4U5YysjJWuvFBsn5hZ8BzN3L9lxha/uUN/Z+s/Kz5P
         3emTMzd32SCAnR2juRC9PBOq/wsNAlDWun//rvC+sUMCxoZFUPBBcLYES94t78nrbnMk
         2Zz0iQ2B3acTgh+J4DJr4teO3Vd3+l3UCo9Zv+wg2RDAKZRlGn6zDD/+cJdeOgELQ7bh
         iIuQhA5OV4Z3xMXGssyTG97dxdgnVc79twssAUyeuHtF4KuJY96wF+/x07GqXfZ4tfwA
         bhbdFwhjpdJgi0I/41w7zCpBBbq0zoTvxGMKzlXVZ9Q/Fd2iE7UerqHDWBPQ6ShYamCc
         D1Zg==
X-Forwarded-Encrypted: i=1; AJvYcCV+wiMkAE48rrQjHIqLyr7WmaJXZe2o9ZGrvpbfZfFhxqgQvSg+77rkA647GvqSikt/gOlA6nenDNk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz4oNVbhW0MAPqBl28Bwh9eWAwa7NTFtJucQbkQYNuXlGaFLX0h
	HPnSQFIHcT1i2dFSY0a0Ia5GIdK7V9IpOfiPCbo27Jk8V7oYfactjcPEVyDFi+Q4ZAIFkNq2hj0
	=
X-Google-Smtp-Source: AGHT+IGGl389rAG28jfC+ZRJfduYAi2fLPRxQNFmYBy+W9JHoN9xRooMyqwVJk/OjSKWcj03/lZbRQ==
X-Received: by 2002:a05:6512:3f0d:b0:52e:7656:a0f4 with SMTP id 2adb3069b0e04-5389fc643a0mr8634091e87.41.1727770371965;
        Tue, 01 Oct 2024 01:12:51 -0700 (PDT)
Message-ID: <90f1dda1-b06e-40e6-be6b-ea99acba875f@suse.com>
Date: Tue, 1 Oct 2024 10:12:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: prefer RDTSCP in rdtsc_ordered()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cae006a7-c1be-4608-a011-dda1fb4a0312@suse.com>
 <14ab2f50-e58c-4cb4-b976-4cb5ec14d908@citrix.com>
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
In-Reply-To: <14ab2f50-e58c-4cb4-b976-4cb5ec14d908@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.09.2024 18:40, Andrew Cooper wrote:
> On 30/09/2024 4:08 pm, Jan Beulich wrote:
>> If available, its use is supposed to be cheaper than LFENCE+RDTSC, and
>> is virtually guaranteed to be cheaper than MFENCE+RDTSC.
>>
>> Unlike in rdtsc() use 64-bit local variables, eliminating the need for
> 
> I'd drop this reference to rdtsc() seeing as you adjust it in a parallel
> patch.

Already done, with that other commit now having gone in. When I wrote this,
I wasn't finally decided yet whether to also make that other adjustment.

>> --- a/xen/arch/x86/include/asm/msr.h
>> +++ b/xen/arch/x86/include/asm/msr.h
>> @@ -108,18 +108,30 @@ static inline uint64_t rdtsc(void)
>>  
>>  static inline uint64_t rdtsc_ordered(void)
>>  {
>> -	/*
>> -	 * The RDTSC instruction is not ordered relative to memory access.
>> -	 * The Intel SDM and the AMD APM are both vague on this point, but
>> -	 * empirically an RDTSC instruction can be speculatively executed
>> -	 * before prior loads.  An RDTSC immediately after an appropriate
>> -	 * barrier appears to be ordered as a normal load, that is, it
>> -	 * provides the same ordering guarantees as reading from a global
>> -	 * memory location that some other imaginary CPU is updating
>> -	 * continuously with a time stamp.
>> -	 */
>> -	alternative("lfence", "mfence", X86_FEATURE_MFENCE_RDTSC);
>> -	return rdtsc();
>> +    uint64_t low, high, aux;
>> +
>> +    /*
>> +     * The RDTSC instruction is not ordered relative to memory access.
>> +     * The Intel SDM and the AMD APM are both vague on this point, but
>> +     * empirically an RDTSC instruction can be speculatively executed
>> +     * before prior loads.
> 
> This part of the comment is stale now.  For RDTSC, AMD state:
> 
> "This instruction is not serializing. Therefore, there is no guarantee
> that all instructions have completed at the time the time-stamp counter
> is read."
> 
> and for RDTSCP:
> 
> "Unlike the RDTSC instruction, RDTSCP forces all older instructions to
> retire before reading the time-stamp counter."
> 
> i.e. it's dispatch serialising, given our new post-Spectre terminology.

I don't read that as truly "dispatch serializing"; both Intel and AMD
leave open whether subsequent insns would also be affected, or whether
those could pass the RDTSCP. Either form is fine for our purposes here
aiui.

> Intel OTOH have much more extensive information.  For RDTSC:
> 
> The RDTSC instruction is not a serializing instruction. It does not
> necessarily wait until all previous instructions have been executed
> before reading the counter. Similarly, subsequent instructions may begin
> execution before the read operation is performed. The following items
> may guide software seeking to order executions of RDTSC:
> 
> •If software requires RDTSC to be executed only after all previous
> instructions have executed and all previous loads are globally visible,1
> it can execute LFENCE immediately before RDTSC.
> 
> •If software requires RDTSC to be executed only after all previous
> instructions have executed and all previous loads and stores are
> globally visible, it can execute the sequence MFENCE;LFENCE immediately
> before RDTSC.
> 
> •If software requires RDTSC to be executed prior to execution of any
> subsequent instruction (including any memory accesses), it can execute
> the sequence LFENCE immediately after RDTSC.
> 
> Similarly, for RDTSCP:
> 
> The RDTSCP instruction is not a serializing instruction, but it does
> wait until all previous instructions have executed and all previous
> loads are globally visible.  But it does not wait for previous stores to
> be globally visible, and subsequent instructions may begin execution
> before the read operation is performed. The following items may guide
> software seeking to order executions of RDTSCP:
> 
> •If software requires RDTSCP to be executed only after all previous
> stores are globally visible, it can execute MFENCE immediately before
> RDTSCP.
> 
> •If software requires RDTSCP to be executed prior to execution of any
> subsequent instruction (including any memory accesses), it can execute
> LFENCE immediately after RDTSCP.
> 
> 
> 
> I'd delete most of the paragraph, and just state the recommendation to
> use LFENCE.

I was in fact wondering whether to. I'll send a v2 with updated (and
shortened) commentary. I think I will want to keep mentioning MFENCE
there though, ...

> In truth, X86_FEATURE_MFENCE_RDTSC is useless now that we unilaterally
> activate LFENCE_DISPATCH on CPUs where it's optional.  Linux went as far
> as removing the case entirely, because if you're running under a
> hypervisor which hasn't set LFENCE_DISPATCH, then the misbehaviour of
> lfence;rdtsc is the least of your problems.

... despite this (orthogonal) observation. We can independently decide
whether to drop MFENCE_RDTSC.

Jan

