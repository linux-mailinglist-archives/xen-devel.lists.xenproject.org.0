Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F7140DAB0
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 15:08:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188458.337618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQr6X-0005Rd-4g; Thu, 16 Sep 2021 13:07:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188458.337618; Thu, 16 Sep 2021 13:07:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQr6X-0005PP-0e; Thu, 16 Sep 2021 13:07:05 +0000
Received: by outflank-mailman (input) for mailman id 188458;
 Thu, 16 Sep 2021 13:07:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Js+i=OG=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mQr6V-0005NG-GK
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 13:07:03 +0000
Received: from mail-ed1-x52f.google.com (unknown [2a00:1450:4864:20::52f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ab720410-eff5-440e-836c-510d35c83a5e;
 Thu, 16 Sep 2021 13:07:01 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id h17so16585621edj.6
 for <xen-devel@lists.xenproject.org>; Thu, 16 Sep 2021 06:07:01 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id u11sm1363059edo.65.2021.09.16.06.06.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Sep 2021 06:06:59 -0700 (PDT)
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
X-Inumbo-ID: ab720410-eff5-440e-836c-510d35c83a5e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=1uhc8rR7lqyoe4rea7HKEmyIL/RfLEv22UTvPB6Y8VA=;
        b=SLgatQPrhcWyfL8lHASEpXJcNhRxuQTo7/VKZCMt1UYvBvseu4IO+5hYlpYZx0tDEl
         k/PgbXbHsD8LXJL9n4IKBNEIA/hHh4CGoampDyYorEraTbFAw3hdj5G7EKFA2liJMDf1
         7Q15hrSqKWUTyUO/ubo45ILD58vldfEFbX7QHEWGDLThQJrD4mT3Xp6YIH/TC3YCG/MB
         aWbITwu7CffDct+y6H75pGo5gvy/I8oytAM650rNx6wWizfvC+lyMveY8LVBDdj5EI/B
         h0RFUrU67FzCQIDYwnxN1qn6uWHruvwHbXnjIS6M3OjiZtpG9jy2fEOYHt88cqobtTV9
         hWFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=1uhc8rR7lqyoe4rea7HKEmyIL/RfLEv22UTvPB6Y8VA=;
        b=Vo1PTLFJNehPNwn4Ze+c2nYW3Y5D9KQXoLETqGCl8lGj8g9J/2dth3T2m+FJWHD9qn
         SyCd0zX6s7efgf4WOLvCSq90XJrT2hFvMPt/1i2kvLKU8V8pIb1hs+VMRFNRACx836nO
         SSS2jHv6c89SiaWU7YSeYAJu3JldQuH8OjRLXs1SSLVMBGBBa2/JQYi5IqJGRNjjd/Vp
         1psnGDObJQY2vr+/1nYNF3/TPbgnwphYrveaTDdmk8o3s4JBTTXTDB4TpPZgIHnVBdXq
         MT61IDNPsMeKa+zh+z2h1i9OQRVtl0lw7OP3Z4k26TY9QTrAwxL5u6IRdZZNq9tggamI
         Lsgw==
X-Gm-Message-State: AOAM530IGbuGoFVfyhdBuupw+EoHVcuxHZzmEcsUi9okRGHSxNbL+kyC
	1CJG2jceHlb5BI5YxrthfGGH8RE98/tjl9D7
X-Google-Smtp-Source: ABdhPJxbcn/9cMa5b76RPbPQ6iFb84YoyuR9DGNQkebXVFHklrZKHCXbvC4+z65RMXDLKGUHtdEYFA==
X-Received: by 2002:a05:6402:697:: with SMTP id f23mr6202839edy.253.1631797619996;
        Thu, 16 Sep 2021 06:06:59 -0700 (PDT)
Subject: Re: [RFC PATCH V2] xen/gnttab: Store frame GFN in struct page_info on
 Arm
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <1631652245-30746-1-git-send-email-olekstysh@gmail.com>
 <b6744333-4d43-ef24-0f9b-b5cd54680660@suse.com>
 <86cdc577-7085-48cd-c417-85b20afc9bf1@gmail.com>
 <647bccf5-1d1e-1f21-fb7c-c338bc5119b6@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <95071891-7b04-5dd7-2f39-9c7c4cefec43@gmail.com>
Date: Thu, 16 Sep 2021 16:06:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <647bccf5-1d1e-1f21-fb7c-c338bc5119b6@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 16.09.21 09:38, Jan Beulich wrote:

Hi Jan

> On 16.09.2021 00:13, Oleksandr wrote:
>> On 15.09.21 13:06, Jan Beulich wrote:
>>> On 14.09.2021 22:44, Oleksandr Tyshchenko wrote:
>>>> --- a/xen/include/asm-arm/mm.h
>>>> +++ b/xen/include/asm-arm/mm.h
>>>> @@ -98,9 +98,18 @@ struct page_info
>>>>    #define PGT_writable_page PG_mask(1, 1)  /* has writable mappings?         */
>>>>    #define PGT_type_mask     PG_mask(1, 1)  /* Bits 31 or 63.                 */
>>>>    
>>>> - /* Count of uses of this frame as its current type. */
>>>> -#define PGT_count_width   PG_shift(2)
>>>> -#define PGT_count_mask    ((1UL<<PGT_count_width)-1)
>>>> + /* 3-bit count of uses of this frame as its current type. */
>>>> +#define PGT_count_base    PG_shift(4)
>>>> +#define PGT_count_mask    PG_mask(7, 4)
>>>> +
>>>> +/*
>>>> + * Stored in bits [27:0] or [59:0] GFN if page is used for grant table frame.
>>> I don't know enough Arm details to tell whether this is properly
>>> one bit more than the maximum number of physical address bits.
>>> Without the extra bit you wouldn't be able to tell apart a
>>> guest specified GFN matching the value of PGT_INVALID_FRAME_GFN
>>> from an entry which was set from INVALID_GFN.
>> Really good point.
>>
>> 1. On Arm64 the p2m_ipa_bits could (theoretically) be 64-bit which, I
>> assume, corresponds to the maximum guest physical address (1 << 64) - 1
>> = 0xFFFFFFFFFFFFFFFF.
>> To store that GFN we need 52-bit. But, we provide 60-bit field which is
>> more than enough, I think. Practically, the maximum supported
>> p2m_ipa_bits is 48-bit, so the maximum supported GFN will occupy 36-bit
>> only. Everything is ok here.
>> 2. On Arm32 the p2m_ipa_bits is 40-bit which, I assume, corresponds to
>> the maximum guest physical address (1 << 40) - 1 = 0xFFFFFFFFFF. To
>> store that GFN we need 28-bit. If I did the calculation correctly, what
>> we have on Arm32 is that PGT_INVALID_FRAME_GFN == maximum guest physical
>> address and it looks like we need and extra bit on Arm32. Do you think
>> we need to borrow one more bit from the count portion to stay on the
>> safe side?
> I think so, unless there are further restrictions on the GFN range
> that I'm unaware of.

ok, thank you.


>
> For 64-bit, if you only need 52 bits, why do you make the field 60
> bits wide? I'd recommend against "wasting" bits. Better keep the
> count field as wide as possible.
Well, the reason almost the same as I already provided for why not using 
PG_mask for PGT_gfn_mask.
Although we waste some bits on Arm64, having the same amount of bits for 
count on Arm32 and Arm64 let us avoid introducing an extra #ifdef to 
that header
(if we go with maximum possible bits for count on each configuration we 
would need to have a set of PGT_count_*/PGT_gfn_*).
I was thinking that if there was indeed a lack of bits for count then an 
extra #ifdef wouldn't be an argument at all. If I am not mistaken, the 
code which deals with count (where only 1 bit is used) is one and the 
same on both Arm32 and Arm64, so what is the point of diverging here (I 
mean to provide more bits for count on Arm64 because simply there is a 
reserve).
But, if the reason I provided is weak I will update header to keep the 
count as wide as possible.


>
>>>> + * This only valid for the xenheap pages.
>>>> + */
>>>> +#define PGT_gfn_width     PG_shift(4)
>>>> +#define PGT_gfn_mask      ((1UL<<PGT_gfn_width)-1)
>>> Any reason you don't use PG_mask() here? Any open-coding is prone
>>> to people later making mistakes.
>> I failed to come up with idea how to do that without #ifdef. As GFN
>> starts at bit 0 different first parameter would be needed for PG_mask on
>> 32-bit and 64-bit systems.
>> I wonder whether PGC_count_mask/PGT_count_mask are open-coded on Arm/x86
>> because of the same reason.
> Hmm, that pre-existing open-coding isn't nice, but is perhaps a
> good enough reason to keep what you have. (Personally I wouldn't
> be afraid of adding an #ifdef here, but I realize views there may
> differ.)
>
> Jan
>
-- 
Regards,

Oleksandr Tyshchenko


