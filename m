Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1419B98BBA7
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 13:57:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808037.1219829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svbU9-00045N-04; Tue, 01 Oct 2024 11:56:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808037.1219829; Tue, 01 Oct 2024 11:56:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svbU8-00043k-Tj; Tue, 01 Oct 2024 11:56:08 +0000
Received: by outflank-mailman (input) for mailman id 808037;
 Tue, 01 Oct 2024 11:56:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+oTF=Q5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1svbU7-00043e-C4
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 11:56:07 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22201205-7fec-11ef-a0ba-8be0dac302b0;
 Tue, 01 Oct 2024 13:56:03 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a8d56155f51so695984866b.2
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 04:56:03 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c27776fasm716429866b.13.2024.10.01.04.56.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Oct 2024 04:56:02 -0700 (PDT)
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
X-Inumbo-ID: 22201205-7fec-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727783763; x=1728388563; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UXICX8vPOUGxDg+RsPLQAK9gx4jRn3grIFvjbXWpwIg=;
        b=T7B5Ng3Pbw7NMWEqQMf7NVW7DgU8Pp204VWAk1V3kseJmihiO2EZxcWuj78i1m/Jeo
         GN2B460AydRteIz6jVxsevkUJmW3q7a/FjuKP24I6UTcQ7dpKho8mKqpoZiRczCmSEAC
         RuwYvJdJ69ajsU+VA2vG9PXDy/Pop8gm8jpQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727783763; x=1728388563;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UXICX8vPOUGxDg+RsPLQAK9gx4jRn3grIFvjbXWpwIg=;
        b=QTLW6OtYgztRPhvYu+5fpV0MV6rdy39mvVDQbZ9IdpcEbwA1OMNwPWTb6o5eiKylc9
         Kr3aN0Qs+nUN+OYaFzPQHLBIXIkUx1EZ/y7p23oPcVrz7TXeFBExEH0WG5D2hRMjcTLi
         DllRUEH5R5uM/pQYQJn7YcyKVzr1Dwsep/jEjiHd/NeLS88s2UopjpvDXf6iah/thhji
         5vCFMx2EKsJbbE3KxA/v9wJTucEZB/ujCfsbiFaVD2zkC8rQvMbPBXmMPh5dEKWQYQn+
         t1m3VxZs4uFkkXycI188zzFmVrBHp3g+K/SkO2fyMfR/K9ZprdwAXBTZhm8bC3RkXmpO
         DtDg==
X-Forwarded-Encrypted: i=1; AJvYcCXovE7OoY8Yv41ipr3FK8hve9SkSmHUjKvnlcQrekHUc+fR0NMw7XQ4RnONuMM/xEo4JT+j2YwupOY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwKwkvH8LGZ8fwjDRd530my+1b3a7wWK8A1h0Gv9DDZ4RAfkyGi
	57wEoJRBXe1jBLpRc8Bwjow1h0LWxeXAu0vHeZ18ynYY0Q2GQdRtiL7cESDFfVg=
X-Google-Smtp-Source: AGHT+IEjnjOCPl54cTwym5nrpi2Fn6xMahfhDrnVITAqN7CwEtxJhB3Xkqj/ct3YB5byuzJ8rJoA6A==
X-Received: by 2002:a17:906:7946:b0:a8a:7897:c043 with SMTP id a640c23a62f3a-a93c4ae12c7mr1800813466b.43.1727783762833;
        Tue, 01 Oct 2024 04:56:02 -0700 (PDT)
Message-ID: <f0ea6ed8-642e-49b7-914d-33e112c3ee10@citrix.com>
Date: Tue, 1 Oct 2024 12:56:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: prefer RDTSCP in rdtsc_ordered()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cae006a7-c1be-4608-a011-dda1fb4a0312@suse.com>
 <14ab2f50-e58c-4cb4-b976-4cb5ec14d908@citrix.com>
 <90f1dda1-b06e-40e6-be6b-ea99acba875f@suse.com>
 <07699749-f9b6-4d78-874c-ff61d76810dc@citrix.com>
 <a1b772bb-113b-4bb3-b58a-09bda98f5c2b@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <a1b772bb-113b-4bb3-b58a-09bda98f5c2b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/10/2024 11:02 am, Jan Beulich wrote:
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
>> That is precisely what dispatch serialising is and means.
>>
>> Both LFENCE and RDTSCP wait at dispatch until they're the only
>> instruction in the pipeline.  That is how they get the property of
>> waiting for all older instructions to retire before executing.
>>
>>> both Intel and AMD
>>> leave open whether subsequent insns would also be affected, or whether
>>> those could pass the RDTSCP.
>> Superscalar pipelines which can dispatch more than one uop per cycle can
>> issue LFENCE/RDTSCP concurrently with younger instructions.
>>
>> This is why LFENCE; JMP * was retracted as safe alternative to
>> retpoline, and why the Intel docs call out explicitly that you need
>> LFENCE following the RDTSC(P) if you want it to complete before
>> subsequent instructions start.
> Yet what you describe still only puts in place a relationship between
> RDTSCP and what follows. What I was saying is that there's no guarantee
> that insns following RDTSCP can't actually execute not only in parallel
> with RDTSCP, but also in parallel with / ahead of earlier insns.

I think you're reading too much into the fact that these passages aren't
identical.

They were written years apart, most likely by different authors.

>  Aiui
> LFENCE makes this guarantee. IOW in
>
> 	ADD ...; LFENCE; SUB ...
>
> the SUB is guaranteed to dispatch only after the ADD, 

The guarantee made is that ADD has retired before LFENCE executes.

SDM: "Specifically, LFENCE does not execute until all prior instructions
have completed locally, and no later instruction begins execution until
LFENCE completes."

"completed locally" == "retired".

The APM doesn't have a description of "dispatch serialising" attached to
LFENCE.  However, the Managing Speculation whitepaper does state:

"Set an MSR in the processor so that LFENCE is a dispatch serializing
instruction and then use LFENCE in code streams to serialize dispatch
(LFENCE is faster than RDTSCP which is also dispatch serializing)."

which also doesn't define dispatch serialising, but does make the
statement which started this debate.

That said, the LFENCE_DISPATCH chicken really was AMD's "behave like
Intel" bit.

> whereas in
>
> 	ADD ...; RDTSCP; SUB ...
>
> there doesn't appear to be such a guarantee; the only guarantee here is
> for RDTSCP to dispatch after the ADD.

SDM: "The RDTSCP instruction is not a serializing instruction, but it
does wait until all previous instructions have executed and all previous
loads are globally visible."

APM: "RDTSCP forces all older instructions to retire before reading the
timestamp counter."

Both have an explicit written guarantee that the ADD retires before
RDTSCP starts.


The thing which neither manual states, probably because the authors
thought it was too obvious to mention, is that dispatch is always in
(predicted) program order.  Consider the implications on dependency
tracking if the CPUs were to dispatch uops out of program order.

~Andrew

