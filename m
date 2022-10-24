Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B08EC60A1EA
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 13:36:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429014.679748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omvk1-0001dH-FD; Mon, 24 Oct 2022 11:35:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429014.679748; Mon, 24 Oct 2022 11:35:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omvk1-0001bQ-Aa; Mon, 24 Oct 2022 11:35:37 +0000
Received: by outflank-mailman (input) for mailman id 429014;
 Mon, 24 Oct 2022 11:35:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QvrT=2Z=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1omvjz-0001bF-O9
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 11:35:35 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9338446-538f-11ed-8fd0-01056ac49cbb;
 Mon, 24 Oct 2022 13:35:34 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id m16so29939930edc.4
 for <xen-devel@lists.xenproject.org>; Mon, 24 Oct 2022 04:35:34 -0700 (PDT)
Received: from [192.168.1.93] (adsl-235.109.242.224.tellas.gr.
 [109.242.224.235]) by smtp.gmail.com with ESMTPSA id
 p6-20020a05640243c600b0045b4b67156fsm18307202edc.45.2022.10.24.04.35.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 04:35:33 -0700 (PDT)
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
X-Inumbo-ID: f9338446-538f-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U0/xnVi7XSgR0494vg1vVMMuMGoGpBezzObnlHLZFRg=;
        b=lefRXcmT9E4U0tczUmleIthZ+WsAcoVrZh/KNdf+r6ZyuMSAAIseRPyFdR1GNwxO+S
         D3gue5ruOa+WPmcNpMavWeZQjO2U1wn/Xeb5+RhutPhC9WAF8DPLkvD7A4NDUQIszK+L
         ihqXmERU2HDB6fOzzw2jSEyX0eHdkx1TRJa9bx6isPwMnMZEdauOel7WT5AiO1+my3ls
         Q4SFwqotZzQhyPCmxNa/BlK/uBoomH7pjgO7KBq0CXp15kzMFvDTvztg6t5soGyH/f12
         mtOpIIMz1P48uNqZmaNQ5tYHUI+ZRmvPkgAaOx5th4Vg3t1LOc8NHOYagEuppLvkUoUK
         KieQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U0/xnVi7XSgR0494vg1vVMMuMGoGpBezzObnlHLZFRg=;
        b=p3Ma6CUZi44kx8/NQOfJTJSvJZjBSLrpICHBEoAaUJF3appwltr8GcT8ouUcjGwwGb
         Y+CMixt11DCaspUtCbG00cVSAdSyjKsTcZ8jGeCoazXEgHZ05LWj4W9qV3x368DYUuVm
         abTuV1L6aDakJrvo+xkSp4eLIZVhKU25bzsKTj5IX1StasK9YsykGnrwk58b1Kbg686G
         aC8bkeaddyAnfyIhmChL/4Aoqo1GUJttlaLMsNJDMoQnlODfDxoUDDnh+2b9wkT/Zdox
         4W5Ot0yqjU3aQ4axDARhj2CkmjiofZlo/bHyH/T7tcgC9SCu/xrE4U2UvnOwtGb8A2g4
         otuA==
X-Gm-Message-State: ACrzQf1OLGOWxWZEWmNOTImBUQ7v8tzzahNWIPJd0jz02egvWvV/bW/a
	Q5dzQ/3qZqdEfQONbSgVSoc=
X-Google-Smtp-Source: AMsMyM6+C2Fv+w92c2oFiNyKqV5fvaty6weFFFxpUjwPuKCxTMhIDny0HgGsKDIXw5RRxNZCbuPYYw==
X-Received: by 2002:a17:907:2ceb:b0:78d:b765:c50d with SMTP id hz11-20020a1709072ceb00b0078db765c50dmr27049888ejc.73.1666611334022;
        Mon, 24 Oct 2022 04:35:34 -0700 (PDT)
Message-ID: <78306c56-7cdd-a705-f8af-0cae4e359336@gmail.com>
Date: Mon, 24 Oct 2022 14:35:31 +0300
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
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <e0183387-8556-5fcc-2f18-003832d5cd70@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ayan,

On 10/24/22 14:00, Ayan Kumar Halder wrote:
> 
> On 21/10/2022 22:18, Xenia Ragiadakou wrote:
>> On 10/21/22 18:31, Ayan Kumar Halder wrote:
>> Hi Ayan
> Hi Xenia,
>>
>>> Refer https://elixir.bootlin.com/linux/v6.1-rc1/source/arch/arm64/ \
>>> include/asm/cputype.h#L14 , these macros are specific for arm64.
>>>
>>> When one computes MPIDR_LEVEL_SHIFT(3), it crosses the width of a 32
>>> bit register.
>>>
>>> Refer 
>>> https://elixir.bootlin.com/linux/v6.1-rc1/source/arch/arm/include/ \
>>> asm/cputype.h#L54  , these macros are specific for arm32.
>>>
>>> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
>>> ---
>>>   xen/arch/arm/include/asm/arm32/processor.h | 10 ++++++++++
>>>   xen/arch/arm/include/asm/arm64/processor.h | 13 +++++++++++++
>>>   xen/arch/arm/include/asm/processor.h       | 14 --------------
>>>   3 files changed, 23 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/include/asm/arm32/processor.h 
>>> b/xen/arch/arm/include/asm/arm32/processor.h
>>> index 4e679f3273..3e03ce78dc 100644
>>> --- a/xen/arch/arm/include/asm/arm32/processor.h
>>> +++ b/xen/arch/arm/include/asm/arm32/processor.h
>>> @@ -56,6 +56,16 @@ struct cpu_user_regs
>>>       uint32_t pad1; /* Doubleword-align the user half of the frame */
>>>   };
>>>   +/*
>>> + * Macros to extract affinity level. Picked from kernel
>>> + */
>>> +
>>> +#define MPIDR_LEVEL_MASK ((1 << MPIDR_LEVEL_BITS) - 1)
>>> +#define MPIDR_LEVEL_SHIFT(level) (MPIDR_LEVEL_BITS * level)
>>> +
>>> +#define MPIDR_AFFINITY_LEVEL(mpidr, level) \
>>> +    ((mpidr >> (MPIDR_LEVEL_BITS * level)) & MPIDR_LEVEL_MASK)
>>> +

Above, since
#define MPIDR_LEVEL_SHIFT(level) (MPIDR_LEVEL_BITS * level)
you can replace (MPIDR_LEVEL_BITS * level) with MPIDR_LEVEL_SHIFT(level) 
in the definition of MPIDR_AFFINITY_LEVEL.
You will see that it is identical to the arm64 definition
#define MPIDR_AFFINITY_LEVEL(mpidr, level) \
         ((mpidr >> MPIDR_LEVEL_SHIFT(level)) & MPIDR_LEVEL_MASK)

>>>   #endif
>>>     #endif /* __ASM_ARM_ARM32_PROCESSOR_H */
>>> diff --git a/xen/arch/arm/include/asm/arm64/processor.h 
>>> b/xen/arch/arm/include/asm/arm64/processor.h
>>> index c749f80ad9..c026334eec 100644
>>> --- a/xen/arch/arm/include/asm/arm64/processor.h
>>> +++ b/xen/arch/arm/include/asm/arm64/processor.h
>>> @@ -84,6 +84,19 @@ struct cpu_user_regs
>>>       uint64_t sp_el1, elr_el1;
>>>   };
>>>   +/*
>>> + * Macros to extract affinity level. picked from kernel
>>> + */
>>> +
>>> +#define MPIDR_LEVEL_BITS_SHIFT  3
>>> +#define MPIDR_LEVEL_MASK        ((1 << MPIDR_LEVEL_BITS) - 1)
>>> +
>>> +#define MPIDR_LEVEL_SHIFT(level) \
>>> +         (((1 << level) >> 1) << MPIDR_LEVEL_BITS_SHIFT)
>>> +
>>> +#define MPIDR_AFFINITY_LEVEL(mpidr, level) \
>>> +         ((mpidr >> MPIDR_LEVEL_SHIFT(level)) & MPIDR_LEVEL_MASK)
>>> +
>>>   #undef __DECL_REG
>>>     #endif /* __ASSEMBLY__ */
>>> diff --git a/xen/arch/arm/include/asm/processor.h 
>>> b/xen/arch/arm/include/asm/processor.h
>>> index 1dd81d7d52..7d90c3b5f2 100644
>>> --- a/xen/arch/arm/include/asm/processor.h
>>> +++ b/xen/arch/arm/include/asm/processor.h
>>> @@ -118,20 +118,6 @@
>>>   #define MPIDR_INVALID       (~MPIDR_HWID_MASK)
>>>   #define MPIDR_LEVEL_BITS    (8)
>>>   -
>>> -/*
>>> - * Macros to extract affinity level. picked from kernel
>>> - */
>>> -
>>> -#define MPIDR_LEVEL_BITS_SHIFT  3
>>> -#define MPIDR_LEVEL_MASK        ((1 << MPIDR_LEVEL_BITS) - 1)
>>> -
>>> -#define MPIDR_LEVEL_SHIFT(level) \
>>> -         (((1 << (level)) >> 1) << MPIDR_LEVEL_BITS_SHIFT)
>>> -
>>> -#define MPIDR_AFFINITY_LEVEL(mpidr, level) \
>>> -         (((mpidr) >> MPIDR_LEVEL_SHIFT(level)) & MPIDR_LEVEL_MASK)
>>> -
>>>   #define AFFINITY_MASK(level)    ~((_AC(0x1,UL) << 
>>> MPIDR_LEVEL_SHIFT(level)) - 1)
>>>     /* TTBCR Translation Table Base Control Register */
>>
>> Since only the definition of the MPIDR_AFFINITY_LEVEL() differs, maybe 
>> you could add only this one to the arch specific headers e.g
>> for arm64:
>> #define MPIDR_LEVEL_SHIFT(level) \
>>     (((1 << (level)) >> 1) << MPIDR_LEVEL_BITS_SHIFT)
>> for arm32:
>> #define MPIDR_LEVEL_SHIFT(level) \
>>     ((level) << MPIDR_LEVEL_BITS_SHIFT)
> 
> Also, MPIDR_AFFINITY_LEVEL needs to be defined in arch specific headers 
> as it differs between arm32 and arm64.

As I point out above, there is no difference between arm32 and arm64 
regarding the definition of MPIDR_AFFINITY_LEVEL(level).

> 
> However, MPIDR_LEVEL_MASK can be defined in the common header (as it is 
> same for arm32 and arm64).
> 
> Please let me know if it makes sense.
> 
>>
>> But in any case don't forget to add parentheses around the macro 
>> parameters when an operator acts on them to avoid trouble with 
>> operator precedence (MISRA-C Rule 20.7 :))
> 
> Thanks for pointing it out. Yes, this is a mistake in my patches.
> 
> - Ayan
> 

-- 
Xenia

