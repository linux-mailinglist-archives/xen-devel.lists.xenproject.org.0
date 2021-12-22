Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0D547D24E
	for <lists+xen-devel@lfdr.de>; Wed, 22 Dec 2021 13:44:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250821.431969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n00yV-0002cN-00; Wed, 22 Dec 2021 12:44:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250821.431969; Wed, 22 Dec 2021 12:44:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n00yU-0002aI-Sj; Wed, 22 Dec 2021 12:44:06 +0000
Received: by outflank-mailman (input) for mailman id 250821;
 Wed, 22 Dec 2021 12:44:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/qRA=RH=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1n00yT-0002aC-Ix
 for xen-devel@lists.xenproject.org; Wed, 22 Dec 2021 12:44:05 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d882f0a3-6324-11ec-9e60-abaf8a552007;
 Wed, 22 Dec 2021 13:44:04 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id k21so5220584lfu.0
 for <xen-devel@lists.xenproject.org>; Wed, 22 Dec 2021 04:44:04 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id x6sm204613lfn.144.2021.12.22.04.44.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Dec 2021 04:44:03 -0800 (PST)
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
X-Inumbo-ID: d882f0a3-6324-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=h00eNxBO7wCa59mB27m3kYO8wPJl+/N3yIXlsVLpgrw=;
        b=HfosJQ09HeXugjET35Kgg4+Z1w3+P5HrrgbfsjvReix92glwEsdKMB4p0pBwkEEABC
         y/xxrHQsTYHjy5RNa5huchGL1CGQHythiieOsdpyAcQVfSOfthGmYGk5H14Zp56aTsMm
         OVFuaGzW5ocScd0Ea64ui1VwQBmsP/TLifDtvzo3b+kXl7uVxVv5OBGRTcfKOBNyqeTt
         zUMsyuuWOpzaIe+XDum3Bpf0FHuCVYp4bE5CXdDgIjqzn+n3hfoUJXMtZSBVXwyoHKkN
         ItR1/c1ToI2qmwRuC+viCaw+5Ot91JYHdFdAE4rJ5bHAt+/rg3kII4VwqsdwQkf43mnG
         2N2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=h00eNxBO7wCa59mB27m3kYO8wPJl+/N3yIXlsVLpgrw=;
        b=aMuXwPpCASk02mENrJjh4wBTizW14ASdQQ1KIrCVZR26+cmSQzki9QExxJs/hv1Atp
         cpHOyUP85/E764TG4VkGmGz3Km01Ha7fKDap6XZbvQqrToT8pEV2ERWhSusABxCcYaaE
         ZwsKkzocFfv5PYz1gZ7dLtWSj8zkRL5Q12LKChLtGgfCKxDpZBIxvniH5ltVwbzPAruk
         d+dzw+RIBERgn0vpUyCo+cFc0YLfVEbOon6qYb/ZiXRDl6dstqXTPDeVhf9oeyEEcXVr
         kAtT1iyUMvz0JFviFzgIct39/LYg0h9L3Su2Jjg3+L5fVrWBH6QH07x7yII7pfQH0zmH
         TI0w==
X-Gm-Message-State: AOAM531f0JMmuLP+NM6IW774dLRAOygLouciVKxFhzAy+SK1cGLeIiyi
	bsIH0zUc0VaLS1XzNyautbamkP7hA4Y=
X-Google-Smtp-Source: ABdhPJyCQvB3gfa34bL+eIjLKVNQ/chNv9U6aIeHyBuntdOQJUyK0l2581eB88YMHaWIK9FSt7+Qcg==
X-Received: by 2002:a19:490f:: with SMTP id w15mr2311434lfa.278.1640177043801;
        Wed, 22 Dec 2021 04:44:03 -0800 (PST)
Subject: Re: [PATCH V4] xen/gnttab: Store frame GFN in struct page_info on Arm
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <1638563610-4419-1-git-send-email-olekstysh@gmail.com>
 <ebfaf88c-38a8-638c-298e-a92e5827baf1@suse.com>
 <6f4813ce-5d23-2192-fabc-e933241cf30e@gmail.com>
 <c1c043b1-bffd-f758-f7b0-fd08539550a5@suse.com>
 <f8ac8922-0695-7666-8585-92a089164e44@xen.org>
 <57616176-938b-2125-fe34-4fadf2b4f816@suse.com>
 <74a0ca4a-b091-77e6-ddb4-490d2a0a0f4b@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <6548d378-aaca-2efd-2194-7725aaf0548d@gmail.com>
Date: Wed, 22 Dec 2021 14:44:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <74a0ca4a-b091-77e6-ddb4-490d2a0a0f4b@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 22.12.21 14:33, Julien Grall wrote:
> Hi Jan,


Hi Julien, Jan



>
> On 22/12/2021 13:05, Jan Beulich wrote:
>> On 22.12.2021 11:01, Julien Grall wrote:
>>> On 14/12/2021 17:45, Jan Beulich wrote:
>>>> On 14.12.2021 17:26, Oleksandr wrote:
>>>>> On 14.12.21 15:37, Jan Beulich wrote:
>>>>>> On 03.12.2021 21:33, Oleksandr Tyshchenko wrote:
>>>>>>> @@ -2177,14 +2181,22 @@ void *alloc_xenheap_pages(unsigned int 
>>>>>>> order, unsigned int memflags)
>>>>>>>         void free_xenheap_pages(void *v, unsigned int order)
>>>>>>>     {
>>>>>>> +    struct page_info *pg;
>>>>>>> +    unsigned int i;
>>>>>>> +
>>>>>>>         ASSERT(!in_irq());
>>>>>>>             if ( v == NULL )
>>>>>>>             return;
>>>>>>>     +    pg = virt_to_page(v);
>>>>>>> +
>>>>>>>         memguard_guard_range(v, 1 << (order + PAGE_SHIFT));
>>>>>> ... this really want to (logically) move into the new arch hooks.
>>>>>> That'll effectively mean to simply drop the Arm stubs afaict (and I
>>>>>> notice there's some dead code there on x86, which I guess I'll make
>>>>>> a patch to clean up). But first of all this suggests that you want
>>>>>> to call the hooks with base page and order, putting the loops there.
>>>>>
>>>>> I see your point and agree ... However I see the on-list patches that
>>>>> remove common memguard_* invocations and x86 bits.
>>>>> So I assume, this request is not actual anymore, or I still need 
>>>>> to pass
>>>>> an order to new arch hooks? Please clarify.
>>>>
>>>> Well, that patch (really just the Arm one) effectively takes care of
>>>> part of what I did say above. Irrespective I continue to think that
>>>> the hook should take a (page,order) tuple instead of getting invoked
>>>> once for every order-0 page. And the hook invocations should be placed
>>>> such that they could fulfill the (being removed) memguard function
>>>> (iirc that was already the case, at least mostly).
>>>
>>> IIUC your suggestion, with your approach, alloc_xenheap_pages() would
>>> look like:
>>>
>>>        for ( i = 0; i < (1u << order); i++ )
>>>            pg[i].count_info |= PGC_xen_heap;
>>>
>>>        arch_alloc_xenheap_pages(pg, 1U << order);
>>
>> Like Oleksandr said, the 2nd argument would be just "order".
>>
>>> The Arm implementation for arch_alloc_xenheap_pages() would also 
>>> contain
>>> a loop.
>>>
>>> This could turn out to be quite expensive with large allocation (1GB
>>> allocation would require 16MB of cache) because the cache may not have
>>> enough space contain all the pages of that range. So you would have to
>>> pull twice the page_info in the cache.
>>
>> Hmm, that's a fair point. I assume you realize that a similar issue of
>> higher overhead would occur when using your approach, and when some
>> memguard-like thing was to reappear: Such mapping operations typically
>> are more efficient when done on a larger range.
>
> Yes, I was aware of that when I wrote my message. However, they are 
> not necessary at the moment. So I think we can defer the discussion.
>
>>  Since that's only a
>> hypothetical use at this point, I'm willing to accept your preference.
>> I'd like us to consider one more aspect though: All you need on Arm is
>> the setting of the exact same bits to the exact same pattern for every
>> struct page_info involved. Can't we simply have an arch hook returning
>> that pattern, for generic code to then OR it in alongside PGC_xen_heap?
>
> arch_alloc_xenheap_pages() will modify inuse.type_info so we can't or 
> the value to PGC_xen_heap.

I wonder, can we apply pattern here at alloc_heap_pages() when 
initializing type_info?
https://xenbits.xen.org/gitweb/?p=xen.git;f=xen/common/page_alloc.c;hb=refs/heads/master#l1027
If yes, the next question would be what indicator to use here to make 
sure that page is really xenheap page.
I also wonder, can we apply pattern for all type of pages here (without 
differentiating)?



