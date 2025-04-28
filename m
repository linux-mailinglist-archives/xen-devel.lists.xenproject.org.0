Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4103BA9EE9E
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 13:10:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970537.1359204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9MN8-0000ZW-8u; Mon, 28 Apr 2025 11:10:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970537.1359204; Mon, 28 Apr 2025 11:10:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9MN8-0000WD-5J; Mon, 28 Apr 2025 11:10:02 +0000
Received: by outflank-mailman (input) for mailman id 970537;
 Mon, 28 Apr 2025 11:10:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5hYN=XO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u9MN7-0000NS-9V
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 11:10:01 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53a0e357-2421-11f0-9eb4-5ba50f476ded;
 Mon, 28 Apr 2025 13:10:00 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43cfe574976so31603085e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 28 Apr 2025 04:10:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4409d2a2e59sm151410985e9.16.2025.04.28.04.09.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 04:09:59 -0700 (PDT)
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
X-Inumbo-ID: 53a0e357-2421-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745838600; x=1746443400; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dcJj5RrOoVKLc2Qw1zHCCpi3RJlCZMbrAmQlhoeKf5Q=;
        b=BNrG8oLY353Rt0rND6PXS7ecc9CKvJGetkRZv7FGcepfAov3C/x11jEo7DdnZ0K1Bn
         SNVFWPfzONJQDJ1f8pCPMTCxzX3zzLeHAUagEA/VPRhvO9mBPy7WLaU2Pxj5QxDuaFSA
         aTjyvD/PaBl4s9dW1exdoMS/jVRKtF7wnK/WQCJh6bh7I7ZLM/Qg5RQvr2BI6NU6GpUY
         rl/wscE5yET3eAbFe1RIU+COKvSjUduVjYWbmapmhj0hTyAY8bNvFHZ7Ck2lKh+y6l45
         72FU6YKtwoMo+MosPtBEbFKjlWd5tm9lTFFRIP8O2t7O/CmeBRxfXl0A/o2fQWGal+Hs
         XO4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745838600; x=1746443400;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dcJj5RrOoVKLc2Qw1zHCCpi3RJlCZMbrAmQlhoeKf5Q=;
        b=lNI/cwI4/2w4RQ8zz1r5OLyR+DnJgszY0WNwYxfHtW/uOWdarJdmAqtl2xLW3rfAk7
         +GFx+hOaGBmIERoGadIZqBqHhJKFBap1KoaE94P4bF0OWYoHfNlQHmt0xXQD4240flHo
         13lc59nHmXZvPQzREhPYyNnSGiT+LBeVV5Q8B5UpYewuweBRmW11vT20HQJsWZaxl0cV
         O58X6kVFet8i5nJNlrfiAFNzcEXvecLS4RKkbQ1YYA9ct9WjA6Bbn5c7yHc8bOIeeEg5
         ZBJjfFqYBW/tfgwKsjyXVcZb5/BrFDTKvZ8d7EgAso72ehLh4oIGxokA/Aw6NtSPL044
         9KIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWgEd8pm9Dpb91W5NPjSe8UgYKnXEEhBYqWRBVC57+KmKzx/Xm7q1U+JHPkV1lhjaIj5zNj6WKHo8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxWczpJlByjHbgSx2r8v7dTq0pwx/NeXi3p1/P36oMzYnbWA3ga
	OqMIvzel76IdSCoFE8JUfrvDFjJb1FPbQw/jsk74qIvVVipCHA3Gi+4n+w0RkA==
X-Gm-Gg: ASbGncvYBjMASKNo5JdsMcFI57GnGPpTKA4E5/6F9NV+AdZ7JahW4z3UFZ44rvav+BC
	rV04LecnDxqwX3Uwb90bU4D9KndOPV6/Fj0/YuPLHXavI+9b9ZB8poeNDKBeV19IdVuaaXZkov3
	XcSBgx45nbGV2B3ebhGNvLPmGpzHom2dNG1YD7MqdnvUp5hEtsi9ujS9ozh1mww/mvfEpFzzWjp
	9EBk6KEQWLscsD44Bkml4dVWAwzhm8iMqAeXZ9eEfC2zuxXP1XAqjPwy1LAUqNkaGiYPsEP5UpQ
	yI1rCFKVJ1hQBy23rAH1Rwha23yaxJOhffjDW+44XE1dlYC7m3R79mUpRk0z8uoSi125BFASgok
	jenrZ9cf5kWPR4r3LK931McclmQ==
X-Google-Smtp-Source: AGHT+IFC4rIw9p4zSnEwKJMEW8la2Mu4f+fe1EMSGzEvV8QS90VqL9HNO4yOyQsMtfsnV6qjzer4zQ==
X-Received: by 2002:a05:600c:1d15:b0:43c:fa24:8721 with SMTP id 5b1f17b1804b1-440a660b293mr103883065e9.17.1745838599906;
        Mon, 28 Apr 2025 04:09:59 -0700 (PDT)
Message-ID: <69ac6840-7dc1-4e88-a12d-43fe295ac7a8@suse.com>
Date: Mon, 28 Apr 2025 13:09:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 06/14] xen/riscv: riscv_of_processor_hartid()
 implementation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
 <ab592d50ad161ffed3950bdf58ade49ae90a3c0e.1744126720.git.oleksii.kurochko@gmail.com>
 <65f5952a-8d2a-499c-bd66-53e9e2fbfa9c@suse.com>
 <d10323b7-d95d-4b96-9bf1-7ae8edda153e@gmail.com>
 <859d0c87-dc90-44c2-ab30-5164eec0705c@suse.com>
 <83fc1566-ad4f-489d-a432-01ec638cbc21@gmail.com>
 <39f0a475-6eea-4c08-abb1-f3de25c5a549@suse.com>
 <e5884aac-1b55-44c8-aa51-c275f6eed828@gmail.com>
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
In-Reply-To: <e5884aac-1b55-44c8-aa51-c275f6eed828@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.04.2025 12:43, Oleksii Kurochko wrote:
> 
> On 4/28/25 8:31 AM, Jan Beulich wrote:
>> On 25.04.2025 19:07, Oleksii Kurochko wrote:
>>> On 4/15/25 3:45 PM, Jan Beulich wrote:
>>>> On 15.04.2025 15:39, Oleksii Kurochko wrote:
>>>>> On 4/10/25 5:53 PM, Jan Beulich wrote:
>>>>>> On 08.04.2025 17:57, Oleksii Kurochko wrote:
>>>>>>> +{
>>>>>>> +    const __be32 *cell;
>>>>>>> +    int ac;
>>>>>>> +    uint32_t len;
>>>>>>> +
>>>>>>> +    ac = dt_n_addr_cells(cpun);
>>>>>>> +    cell = dt_get_property(cpun, "reg", &len);
>>>>>>> +    if ( !cell || !ac || ((sizeof(*cell) * ac * (thread + 1)) > len) )
>>>>>>> +        return ~0ULL;
>>>>>> I'm sorry for my lack of DT knowledge, but what's "thread" representing here?
>>>>>> You only pass in 0 below, so it's unclear whether it's what one might expect
>>>>>> (the thread number on a multi-threaded core).
>>>>> Based on the DT specification alone, the|`reg`| value could refer to either a CPU or a thread ID:
>>>>> ```
>>>>> The value of reg is a <prop-encoded-array> that defines a unique CPU/thread id for
>>>>> the CPU/threads represented by the CPU node. If a CPU supports more than one thread
>>>>> (i.e. multiple streams of execution) the reg prop-erty is an array with 1 element
>>>>> per thread.
>>>>> ```
>>>>>
>>>>> My understanding is that the term/thread/ was used in the Linux kernel to cover both
>>>>> cases.
>>>>> When SMT isn't supported, the CPU can be considered to have a single thread.
>>>>> For example, RISC-V uses the term/hardware thread/ to describe a hart (i.e., a CPU).
>> Note the terminology ("CPU") you used here.
>>
>>>>> Interestingly, the Linux kernel always uses|thread = 0|.
>>>>>
>>>>> We could potentially drop this ambiguity and introduce an|ASSERT()| to check that
>>>>> the|`reg`| property contains only one entry, representing the HART (CPU) ID:
>>>>> ```
>>>>>      Software can determine the number of threads by dividing the size of reg by the parent
>>>>>      node’s #address-cells. If `|reg`| has more than one entry, it would simply SMT support
>>>>>      is required.
>>>>> ```
>>>>>
>>>>> Does that approach make sense, or should we stick with the current implementation?
>>>> If extra enabling is required to make multi-thread CPUs work, then panic()ing
>>>> (not so much ASSERT()ing) may make sense, for the time being. Better would be
>>>> if we could use all threads in a system right away.
>>> Actually, this function is ready to be used for multi-thread CPUs. A caller can request hardware id
>>> by passing `thread` argument (`thread` -> the local thread number to get the hardware ID for).
>>> So by calling:
>>>    dt_get_cpu_hwid(cpu0, 0) -> it will return hardware id of thread 0 of cpu0
>>>    dt_get_cpu_hwid(cpu0, 1) -> it will return hardware id of thread 1 of cpu0
>>>    ...
>>>
>>> In our case we assume that SMP isn't supported so that is why it is used only dt_get_cpu_hwid(cpu0, 0).
>>>
>>> If one day, SMP will be enabled then it will be needed to change a callers of dt_get_cpu_hwid().
>> I assume you meant SMT in both places you wrote SMP?
> 
> Yes, it should be SMT.
> 
>>   But my main point here is:
>> If enumeration gives you "thread <N> of core <M>" (using x86 terminology), you
>> need to be quite careful with what you call "CPU". Things need to be entirely
>> unambiguous, taking into account what internally in (common code) Xen we call a
>> "CPU". You certainly may call "CPU" what is a collection of threads / harts,
>> but you then need to clarify this in a prominent comment somewhere, and you
>> need to be entirely consistent throughout the RISC-V sub-tree.
> 
> ╭────────────────────╮
> │        CPU          │  ← 1 physical processor (chip)
> │ ┌───────┬─────────┐ │
> │ │ Core 0│ Core 1  │ │  ← 2 cores (for example)
> │ │ ┌──┬──┐ ┌──┬──┐ │ │
> │ │Thr0 Thr1 Thr0 Thr1│ ← 2 threads on each core (SMT)
> │ └───────┴─────────┘ │
> ╰────────────────────╯
> I want to double check what Xen call a "CPU". I thought that Xen uses word
> CPU to describe a core, right?

No, see e.g. cpumask.h - it's a hart (as per below) that we internally describe
as CPU (leaving aside potentially ambiguous comments here and there, which is
what I'd like to prevent from the start for RISC-V).

> What you wrote above "thread <N> of core <M> (using x86 terminology)" is also correlated
> with RISC-V terminology:
>    A component is termed a core if it contains an independent instruction fetch unit.
>    A RISC-V-compatible core might support multiple RISC-V-compatible hardware threads,
>    or harts, through multithreading
> 
> I checked RISC-V's DTS binding and it seems it is a little bit contradictory to DTS spec,
> where it is mentioned that reg property is used to describe how many threads a cpu  has
> when SMP is used, but in RISC-V's dts binding they are describing a hardware execution
> context:
>    This document uses some terminology common to the RISC-V community
>    that is not widely used, the definitions of which are listed here:
> 
>    hart: A hardware execution context, which contains all the state
>    mandated by the RISC-V ISA: a PC and some registers.  This
>    terminology is designed to disambiguate software's view of execution
>    contexts from any particular microarchitectural implementation
>    strategy.  For example, an Intel laptop containing one socket with
>    two cores, each of which has two hyperthreads, could be described as
>    having four harts.
> 
> So in RISC-V's DTS binding they are describing only hardware threads what makes things more
> confusing in terms what kind terminology from Xen point of view should be used.
> 
> And based on what is written in RISC-V's dts binding:
>   For example, an Intel laptop containing one socket with
>   two cores, each of which has two hyperthreads, could be described as
>   having four harts.
> It would be more logical to drop 'thread' argument of riscv_of_get_cpu_hwid(const struct dt_device_node *cpun).
> And then the question is what to do with the name of variable cpun? As it could be still confusing. Or, at least,
> I can add the comment that CPUn in terms of RISC-V means hart (hardware thread).

If it's the normal thing you call a CPU, I don't think much commentary is
necessary. Then please just make sure you don't call anything else "CPU",
especially in identifiers.

> And then will it be needed to
> add such comment for each usage of word "CPU"?

No, that would go too far in any event. Hence why I said "clarify this in
a prominent comment somewhere".

Jan

