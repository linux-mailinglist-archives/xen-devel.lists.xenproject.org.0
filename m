Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D467660A97F
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 15:21:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429120.679968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omxOM-000705-9N; Mon, 24 Oct 2022 13:21:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429120.679968; Mon, 24 Oct 2022 13:21:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omxOM-0006xJ-6G; Mon, 24 Oct 2022 13:21:22 +0000
Received: by outflank-mailman (input) for mailman id 429120;
 Mon, 24 Oct 2022 13:21:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QvrT=2Z=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1omxOK-0006x8-QV
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 13:21:20 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf31c4f3-539e-11ed-91b5-6bf2151ebd3b;
 Mon, 24 Oct 2022 15:21:19 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id a67so31140322edf.12
 for <xen-devel@lists.xenproject.org>; Mon, 24 Oct 2022 06:21:19 -0700 (PDT)
Received: from [192.168.1.93] (adsl-67.109.242.136.tellas.gr. [109.242.136.67])
 by smtp.gmail.com with ESMTPSA id
 dk24-20020a0564021d9800b0045b910b0542sm18362632edb.15.2022.10.24.06.21.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 06:21:18 -0700 (PDT)
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
X-Inumbo-ID: bf31c4f3-539e-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bu11lnAeABjv2oJyt1x12pNcwXirk7pNFh3seWOOQjY=;
        b=SqUnt5lr8t07Qq796sxIeAkp1sAPI8dZsgAVH5YG7I/UroBeKg4NtHEhxBZC+5efZy
         Wbu+jZwD5pz6E0qaJyjJ5ZoZO8RR1kzcWtf81huL2/ei3Pq5OHcUZdQLsnkH/xZV+UdA
         viHnqddrnWGc7470Y+VosRKQ4fOntHKYusd7KLd5e93MjfVze8gyAdsrx9nzVVPgrR46
         mEXO5lP2CWqT/lBFReiRfZGnsMGoW3JF3Gyo4Yo1tw2HqQw/0IRahyYkdye9kUZEW2vm
         Ze4WbvEGPRvwP1NTVKIBU/IgAiffl1WUt9wvtwROt7+ETj/j5GDepE1kQFk/E11E4hgC
         JLpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bu11lnAeABjv2oJyt1x12pNcwXirk7pNFh3seWOOQjY=;
        b=4Gix5GXDpHrrS1gr+z6B+yDc6tjH3HbPkkLV9WZzWZus9ZTYC9zruhA+a6J5/G2ogB
         HhBrgmi+3jo2SYBN4TegfVcPNDGqKCYGXq5q/iJrZU1PrpOx6KSvdxlxSPVPzozIFtH1
         DisiUDyUgm2g3AeMsXYvq6HFhgg/gxS/x2heEVRxicoAna/NfcLHXUxNbcBUriD3q8Se
         GqVeXeuiUZuAVHTA12zdN656KYff7+NvOxIE67xVxun7MLaKkL8FP4Lgh6FDYnKLm9LK
         P5iawqA7l9EQ+TpqpCuX0RyxQOqJlzkZZATkycyt/KfeWTdFmuflAogMu4mov9JHgYqf
         gDhw==
X-Gm-Message-State: ACrzQf0vc0L/UxsteTM9DWJ1pvQZCGiApi6ZcGaa3FZHf8JcwzgXqirX
	UbljMSe/QGhIRSsjgBOZ0UY=
X-Google-Smtp-Source: AMsMyM7EZ09WYgSQBnjEQa3/C6WStUHBK9s/tiUuEdJ2G2BaNArmsZJENzW6wmK5yQ8ppfRq/jOMIw==
X-Received: by 2002:a05:6402:50cd:b0:45d:109d:676c with SMTP id h13-20020a05640250cd00b0045d109d676cmr31868606edb.344.1666617679092;
        Mon, 24 Oct 2022 06:21:19 -0700 (PDT)
Message-ID: <e03fad8b-daf8-b91f-cc1f-bf1450ecb924@gmail.com>
Date: Mon, 24 Oct 2022 16:21:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC PATCH v1 02/12] Arm: GICv3: Move the macros to compute the
 affnity level to arm64/arm32
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20221021153128.44226-1-ayankuma@amd.com>
 <20221021153128.44226-3-ayankuma@amd.com>
 <cb67c768-1a05-e5d5-efed-9a282c6a8c2a@gmail.com>
 <e0183387-8556-5fcc-2f18-003832d5cd70@amd.com>
 <78306c56-7cdd-a705-f8af-0cae4e359336@gmail.com>
 <76f1b4fc-90bd-f55f-5624-f5d011bdaa9f@amd.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <76f1b4fc-90bd-f55f-5624-f5d011bdaa9f@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/24/22 16:01, Ayan Kumar Halder wrote:
> 
> On 24/10/2022 12:35, Xenia Ragiadakou wrote:
>> Hi Ayan,
> Hi Xenia,
>>
>> On 10/24/22 14:00, Ayan Kumar Halder wrote:
>>>
>>> On 21/10/2022 22:18, Xenia Ragiadakou wrote:
>>>> On 10/21/22 18:31, Ayan Kumar Halder wrote:
>>>> Hi Ayan
>>> Hi Xenia,
>>>>
>>>>> Refer https://elixir.bootlin.com/linux/v6.1-rc1/source/arch/arm64/ \
>>>>> include/asm/cputype.h#L14 , these macros are specific for arm64.
>>>>>
>>>>> When one computes MPIDR_LEVEL_SHIFT(3), it crosses the width of a 32
>>>>> bit register.
>>>>>
>>>>> Refer 
>>>>> https://elixir.bootlin.com/linux/v6.1-rc1/source/arch/arm/include/ \
>>>>> asm/cputype.h#L54  , these macros are specific for arm32.
>>>>>
>>>>> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
>>>>> ---
>>>>>   xen/arch/arm/include/asm/arm32/processor.h | 10 ++++++++++
>>>>>   xen/arch/arm/include/asm/arm64/processor.h | 13 +++++++++++++
>>>>>   xen/arch/arm/include/asm/processor.h       | 14 --------------
>>>>>   3 files changed, 23 insertions(+), 14 deletions(-)
>>>>>
>>>>> diff --git a/xen/arch/arm/include/asm/arm32/processor.h 
>>>>> b/xen/arch/arm/include/asm/arm32/processor.h
>>>>> index 4e679f3273..3e03ce78dc 100644
>>>>> --- a/xen/arch/arm/include/asm/arm32/processor.h
>>>>> +++ b/xen/arch/arm/include/asm/arm32/processor.h
>>>>> @@ -56,6 +56,16 @@ struct cpu_user_regs
>>>>>       uint32_t pad1; /* Doubleword-align the user half of the frame */
>>>>>   };
>>>>>   +/*
>>>>> + * Macros to extract affinity level. Picked from kernel
>>>>> + */
>>>>> +
>>>>> +#define MPIDR_LEVEL_MASK ((1 << MPIDR_LEVEL_BITS) - 1)
>>>>> +#define MPIDR_LEVEL_SHIFT(level) (MPIDR_LEVEL_BITS * level)
>>>>> +
>>>>> +#define MPIDR_AFFINITY_LEVEL(mpidr, level) \
>>>>> +    ((mpidr >> (MPIDR_LEVEL_BITS * level)) & MPIDR_LEVEL_MASK)
>>>>> +
>>
>> Above, since
>> #define MPIDR_LEVEL_SHIFT(level) (MPIDR_LEVEL_BITS * level)
>> you can replace (MPIDR_LEVEL_BITS * level) with 
>> MPIDR_LEVEL_SHIFT(level) in the definition of MPIDR_AFFINITY_LEVEL.
>> You will see that it is identical to the arm64 definition
>> #define MPIDR_AFFINITY_LEVEL(mpidr, level) \
>>         ((mpidr >> MPIDR_LEVEL_SHIFT(level)) & MPIDR_LEVEL_MASK)
> 
> Currently, MPIDR_AFFINITY_LEVEL(mpidr, 3) differs between arm32 and arm64:-
> 
> In arm32 :- (mpidr >> 24) & 0xff
> 
> In arm64 :- (mpidr >> 32) & 0xff

Correct. This is the case because the MPIDR_LEVEL_SHIFT(level) differs 
between arm32 and arm64.
The definition of MPIDR_AFFINITY_LEVEL is common in both.
More specifically, for level 3,
#define MPIDR_LEVEL_SHIFT(level) \
     ((level) << MPIDR_LEVEL_BITS_SHIFT)
#define MPIDR_AFFINITY_LEVEL(mpidr, level) \

     (((mpidr) >> MPIDR_LEVEL_SHIFT(level)) & MPIDR_LEVEL_MASK)
gives (mpidr >> 24) & 0xff
While
#define MPIDR_LEVEL_SHIFT(level) \

     (((1 << (level)) >> 1) << MPIDR_LEVEL_BITS_SHIFT)
#define MPIDR_AFFINITY_LEVEL(mpidr, level) \
     (((mpidr) >> MPIDR_LEVEL_SHIFT(level)) & MPIDR_LEVEL_MASK)
gives (mpidr >> 32) & 0xff

> 
> I think this is what is expected. See xen/arch/arm/gic-v3.c ,
> 
> static inline uint64_t gicv3_mpidr_to_affinity(int cpu)
> {
>       uint64_t mpidr = cpu_logical_map(cpu);
>       return (MPIDR_AFFINITY_LEVEL(mpidr, 3) << 32 |
>               MPIDR_AFFINITY_LEVEL(mpidr, 2) << 16 |
>               MPIDR_AFFINITY_LEVEL(mpidr, 1) << 8  |
>               MPIDR_AFFINITY_LEVEL(mpidr, 0));
> }
> 
>>
>>>>>   #endif
>>>>>     #endif /* __ASM_ARM_ARM32_PROCESSOR_H */
>>>>> diff --git a/xen/arch/arm/include/asm/arm64/processor.h 
>>>>> b/xen/arch/arm/include/asm/arm64/processor.h
>>>>> index c749f80ad9..c026334eec 100644
>>>>> --- a/xen/arch/arm/include/asm/arm64/processor.h
>>>>> +++ b/xen/arch/arm/include/asm/arm64/processor.h
>>>>> @@ -84,6 +84,19 @@ struct cpu_user_regs
>>>>>       uint64_t sp_el1, elr_el1;
>>>>>   };
>>>>>   +/*
>>>>> + * Macros to extract affinity level. picked from kernel
>>>>> + */
>>>>> +
>>>>> +#define MPIDR_LEVEL_BITS_SHIFT  3
>>>>> +#define MPIDR_LEVEL_MASK        ((1 << MPIDR_LEVEL_BITS) - 1)
>>>>> +
>>>>> +#define MPIDR_LEVEL_SHIFT(level) \
>>>>> +         (((1 << level) >> 1) << MPIDR_LEVEL_BITS_SHIFT)
>>>>> +
>>>>> +#define MPIDR_AFFINITY_LEVEL(mpidr, level) \
>>>>> +         ((mpidr >> MPIDR_LEVEL_SHIFT(level)) & MPIDR_LEVEL_MASK)
>>>>> +
>>>>>   #undef __DECL_REG
>>>>>     #endif /* __ASSEMBLY__ */
>>>>> diff --git a/xen/arch/arm/include/asm/processor.h 
>>>>> b/xen/arch/arm/include/asm/processor.h
>>>>> index 1dd81d7d52..7d90c3b5f2 100644
>>>>> --- a/xen/arch/arm/include/asm/processor.h
>>>>> +++ b/xen/arch/arm/include/asm/processor.h
>>>>> @@ -118,20 +118,6 @@
>>>>>   #define MPIDR_INVALID       (~MPIDR_HWID_MASK)
>>>>>   #define MPIDR_LEVEL_BITS    (8)
>>>>>   -
>>>>> -/*
>>>>> - * Macros to extract affinity level. picked from kernel
>>>>> - */
>>>>> -
>>>>> -#define MPIDR_LEVEL_BITS_SHIFT  3
>>>>> -#define MPIDR_LEVEL_MASK        ((1 << MPIDR_LEVEL_BITS) - 1)
>>>>> -
>>>>> -#define MPIDR_LEVEL_SHIFT(level) \
>>>>> -         (((1 << (level)) >> 1) << MPIDR_LEVEL_BITS_SHIFT)
>>>>> -
>>>>> -#define MPIDR_AFFINITY_LEVEL(mpidr, level) \
>>>>> -         (((mpidr) >> MPIDR_LEVEL_SHIFT(level)) & MPIDR_LEVEL_MASK)
>>>>> -
>>>>>   #define AFFINITY_MASK(level)    ~((_AC(0x1,UL) << 
>>>>> MPIDR_LEVEL_SHIFT(level)) - 1)
>>>>>     /* TTBCR Translation Table Base Control Register */
>>>>
>>>> Since only the definition of the MPIDR_AFFINITY_LEVEL() differs, 
>>>> maybe you could add only this one to the arch specific headers e.g
>>>> for arm64:
>>>> #define MPIDR_LEVEL_SHIFT(level) \
>>>>     (((1 << (level)) >> 1) << MPIDR_LEVEL_BITS_SHIFT)
>>>> for arm32:
>>>> #define MPIDR_LEVEL_SHIFT(level) \
>>>>     ((level) << MPIDR_LEVEL_BITS_SHIFT)
>>>
>>> Also, MPIDR_AFFINITY_LEVEL needs to be defined in arch specific 
>>> headers as it differs between arm32 and arm64.
>>
>> As I point out above, there is no difference between arm32 and arm64 
>> regarding the definition of MPIDR_AFFINITY_LEVEL(level).
> 
> Please see above and let me know if it makes sense.
> 
> - Ayan
> 
>>
>>>
>>> However, MPIDR_LEVEL_MASK can be defined in the common header (as it 
>>> is same for arm32 and arm64).
>>>
>>> Please let me know if it makes sense.
>>>
>>>>
>>>> But in any case don't forget to add parentheses around the macro 
>>>> parameters when an operator acts on them to avoid trouble with 
>>>> operator precedence (MISRA-C Rule 20.7 :))
>>>
>>> Thanks for pointing it out. Yes, this is a mistake in my patches.
>>>
>>> - Ayan
>>>
>>

-- 
Xenia

