Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E88847D06C
	for <lists+xen-devel@lfdr.de>; Wed, 22 Dec 2021 12:00:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250764.431858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzzLf-0001pH-GX; Wed, 22 Dec 2021 10:59:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250764.431858; Wed, 22 Dec 2021 10:59:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzzLf-0001nT-DS; Wed, 22 Dec 2021 10:59:55 +0000
Received: by outflank-mailman (input) for mailman id 250764;
 Wed, 22 Dec 2021 10:59:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/qRA=RH=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mzzLe-0001nN-9d
 for xen-devel@lists.xenproject.org; Wed, 22 Dec 2021 10:59:54 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a419813-6316-11ec-9e60-abaf8a552007;
 Wed, 22 Dec 2021 11:59:53 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id g11so4558923lfu.2
 for <xen-devel@lists.xenproject.org>; Wed, 22 Dec 2021 02:59:52 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id j1sm178457lfu.309.2021.12.22.02.59.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Dec 2021 02:59:52 -0800 (PST)
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
X-Inumbo-ID: 4a419813-6316-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=qFMihSGoewdyshzwX/m2/nP/fRO1pApx4410Go5LgUY=;
        b=WblifteoAp/lEwrJB9p0tSdJbsNQWJegXR/rw+ljCi8kfixl/+4rMHRhCdlUkXF15K
         rKk6D0B/hylYaQQLHkIV/4jC6cIJoay8lJBqd2ns5uXdUMYZOs7+VhGdD+U1yD2gvzYi
         xrF4METDXcjzjj6l7q1qFS6xy7UhTIpQvCklmGTNyGcHmyadZsxs25VaLJyxlPpwKCpn
         kytKxb2DvEeC9kIdxIxiUh46QS6ztyMF1oQSvXn8iJsD0Ku38RRFrRLuegYMy61H1Zdt
         x9CqauCqErXNKfqVC0FXmUB0LIxGxY4nKN9+SMvsBRO9NWG/R4bdJfHm4BRtMUjIvBGu
         LKsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=qFMihSGoewdyshzwX/m2/nP/fRO1pApx4410Go5LgUY=;
        b=QW/4111ZyB2TSrZ7SSDu148zs6MNLlcFbII0jPNR2UF4rNiq7/k8vHEV2HxTgJpIn8
         Fc8zHfmkcgE1RSnpqIhuT78eS1IeTQcKGNlQ5ZtN3L5SSK3YRjd8AXmjG4fXEk0xkDss
         ysrlTuvSKain7zCgzTipNuX10bpVVUtoKprTFVddTbN8ExkrP3DyY4EUDSzRI5yDdoNY
         GEZiZVz/hDU8Hs3Wu2606DNsmBBa1S3BPkyBtJ+NCOKAkPmt8cVJSvRpaFTBe9JYwmcu
         evSHK9IdSckuh6wus0sehgjceXdVRuZbcyUZzEcG1ytViJmhOu3kLm2pK+XyfgF9z3SP
         G29Q==
X-Gm-Message-State: AOAM531K9ROsVmGzMCN3beoAOy0Ht9LT3bMnfsHyRsw38LGF2rO4Of/o
	zpyD9k8lssTf3UyL7EgvXM1AANRqKyM=
X-Google-Smtp-Source: ABdhPJyt4oQTMy9EyrMOxASYTiwbGrfnkoSDiWrkE3hcN9LctyNO0igz5/tOFXS/oe0BEjLKM1SEIA==
X-Received: by 2002:a19:6f4c:: with SMTP id n12mr2204616lfk.582.1640170792333;
        Wed, 22 Dec 2021 02:59:52 -0800 (PST)
Subject: Re: [PATCH V4] xen/gnttab: Store frame GFN in struct page_info on Arm
To: Julien Grall <julien@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
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
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <3a8b4905-dee5-6723-8987-0082207b2718@gmail.com>
Date: Wed, 22 Dec 2021 12:59:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f8ac8922-0695-7666-8585-92a089164e44@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 22.12.21 12:01, Julien Grall wrote:

Hi Julien

> Hi Jan,
>
> On 14/12/2021 17:45, Jan Beulich wrote:
>> On 14.12.2021 17:26, Oleksandr wrote:
>>> On 14.12.21 15:37, Jan Beulich wrote:
>>>> On 03.12.2021 21:33, Oleksandr Tyshchenko wrote:
>>>>> @@ -2177,14 +2181,22 @@ void *alloc_xenheap_pages(unsigned int 
>>>>> order, unsigned int memflags)
>>>>>       void free_xenheap_pages(void *v, unsigned int order)
>>>>>    {
>>>>> +    struct page_info *pg;
>>>>> +    unsigned int i;
>>>>> +
>>>>>        ASSERT(!in_irq());
>>>>>           if ( v == NULL )
>>>>>            return;
>>>>>    +    pg = virt_to_page(v);
>>>>> +
>>>>>        memguard_guard_range(v, 1 << (order + PAGE_SHIFT));
>>>> ... this really want to (logically) move into the new arch hooks.
>>>> That'll effectively mean to simply drop the Arm stubs afaict (and I
>>>> notice there's some dead code there on x86, which I guess I'll make
>>>> a patch to clean up). But first of all this suggests that you want
>>>> to call the hooks with base page and order, putting the loops there.
>>>
>>> I see your point and agree ... However I see the on-list patches that
>>> remove common memguard_* invocations and x86 bits.
>>> So I assume, this request is not actual anymore, or I still need to 
>>> pass
>>> an order to new arch hooks? Please clarify.
>>
>> Well, that patch (really just the Arm one) effectively takes care of
>> part of what I did say above. Irrespective I continue to think that
>> the hook should take a (page,order) tuple instead of getting invoked
>> once for every order-0 page. And the hook invocations should be placed
>> such that they could fulfill the (being removed) memguard function
>> (iirc that was already the case, at least mostly).
>
> IIUC your suggestion, with your approach, alloc_xenheap_pages() would 
> look like:
>
>      for ( i = 0; i < (1u << order); i++ )
>          pg[i].count_info |= PGC_xen_heap;
>
>      arch_alloc_xenheap_pages(pg, 1U << order);
>
> The Arm implementation for arch_alloc_xenheap_pages() would also 
> contain a loop.
I have the same understanding (except passing an order instead of a 
number, but it doesn't really matter now)

#define arch_alloc_xenheap_pages(p, order) ({                   \
     unsigned int cnt_ = 1u << (order);                          \
     while (cnt_--)                                              \
         page_set_xenheap_gfn(&(p)[cnt_], INVALID_GFN); \
})

So yes if !CONFIG_SEPARATE_XENHEAP there will be two loops here.



>
>
> This could turn out to be quite expensive with large allocation (1GB 
> allocation would require 16MB of cache) because the cache may not have 
> enough space contain all the pages of that range. So you would have to 
> pull twice the page_info in the cache.
>
> This is something we noticed when working on reducing the downtime for 
> Live-Update. We were able to save 100s ms by reducing the number of 
> loop on the page_info.
>
> So I would prefer Oleksandr's approach here.
>
> Cheers,
>
-- 
Regards,

Oleksandr Tyshchenko


