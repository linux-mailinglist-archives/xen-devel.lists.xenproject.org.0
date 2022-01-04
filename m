Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF36484A1A
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jan 2022 22:42:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253402.434543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4rYz-0007Ib-BK; Tue, 04 Jan 2022 21:41:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253402.434543; Tue, 04 Jan 2022 21:41:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4rYz-0007Fu-82; Tue, 04 Jan 2022 21:41:49 +0000
Received: by outflank-mailman (input) for mailman id 253402;
 Tue, 04 Jan 2022 21:41:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ud3B=RU=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1n4rYx-0007Fo-Gs
 for xen-devel@lists.xenproject.org; Tue, 04 Jan 2022 21:41:47 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1cf09c1c-6da7-11ec-81c0-a30af7de8005;
 Tue, 04 Jan 2022 22:41:45 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id i22so78798381wrb.13
 for <xen-devel@lists.xenproject.org>; Tue, 04 Jan 2022 13:41:45 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id p11sm44710049wru.99.2022.01.04.13.41.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 13:41:44 -0800 (PST)
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
X-Inumbo-ID: 1cf09c1c-6da7-11ec-81c0-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=8xWQ8o/+yLX+b4GmO17LP9TMt5AaOLPvSPN898Ye1Q4=;
        b=EGghD9kcmAayNbGhLOUSIJXTErkIlKsuNIOPbjWp20sDnlvLEuRzDctSgqLMgw4cEP
         WQQtLS5tw6mrbKUJw7/BjSYQj2fi8WNzmYoCbT+CFUeLmSGpVO4zX+39/KyVKoxu8sPg
         XCo6XzRu3EFs4v7OpBWkpm0YRrJqpW6g4M1E9TR0Z0jpy47Gqj2vPDWclVVlK7m6UXDu
         kjiocZ5g5ee8oJCAa96jRQXVRXBCXE4IYAh99M9aLRmiAzduX453QzoGxvL1z6qTAr7/
         L2rIToFmhtT7U+P0Agl9nxb8Ri701J/is9ZbNnk8NlCMULczIZyb4J5Q58GOCjlVsBjS
         OBIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=8xWQ8o/+yLX+b4GmO17LP9TMt5AaOLPvSPN898Ye1Q4=;
        b=x9amqgJU4AyzPQgc6hV7QAEOozDUzkOgDmu9r5L+BJxVr2K99AnRMyCGETYuOVnGOp
         IcDs8tqbHUfkyE8TKqUNAwWxKvl0eO8CR3M0mGDhiLU8rdvKmyfl4cQnVER4+QvOAFEV
         h2gJ4YKOwZV0DToEn5UbhqfghoIZej6qISYrnTcM4G3OXNpIEPtto/2l7sP5iav3bJIR
         I8JSocLICg1yAEhzND1kZkZqO8bkA3BdqkVNDrEndJXjFlg08pSyuq+s5q8vZIpHJiZz
         Tb8JoATJxIEnnUk32N8VL+uADIB+XIDbSqQp7nXky4U0ocywWbfMpJGlgOsulGmoOwHE
         Oibg==
X-Gm-Message-State: AOAM532LgQ+FTLj5j963fIaqedYwDx94pPCShKAlylbFG9Bp1WHFtyQd
	6WzLGdfSxM463nXmIfijvSM=
X-Google-Smtp-Source: ABdhPJzBYzuswDs3E6f8lm23QrGACTX4a0Kf+tqeA3I2mEAfjf7Whg18r4ClGAA3TG0LMid1ZUNK4Q==
X-Received: by 2002:adf:f985:: with SMTP id f5mr44420104wrr.14.1641332505061;
        Tue, 04 Jan 2022 13:41:45 -0800 (PST)
Subject: Re: [PATCH V4] xen/gnttab: Store frame GFN in struct page_info on Arm
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org,
 Julien Grall <julien@xen.org>
References: <1638563610-4419-1-git-send-email-olekstysh@gmail.com>
 <ebfaf88c-38a8-638c-298e-a92e5827baf1@suse.com>
 <6f4813ce-5d23-2192-fabc-e933241cf30e@gmail.com>
 <c1c043b1-bffd-f758-f7b0-fd08539550a5@suse.com>
 <f8ac8922-0695-7666-8585-92a089164e44@xen.org>
 <57616176-938b-2125-fe34-4fadf2b4f816@suse.com>
 <74a0ca4a-b091-77e6-ddb4-490d2a0a0f4b@xen.org>
 <6548d378-aaca-2efd-2194-7725aaf0548d@gmail.com>
 <4b4d9543-e7ba-5664-effd-03fc6336f898@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <b4832284-9bfc-d600-14b1-1784f53e5d9f@gmail.com>
Date: Tue, 4 Jan 2022 23:41:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4b4d9543-e7ba-5664-effd-03fc6336f898@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 04.01.22 10:36, Jan Beulich wrote:

Hi Jan


> On 22.12.2021 13:44, Oleksandr wrote:
>> On 22.12.21 14:33, Julien Grall wrote:
>>> Hi Jan,
>>
>> Hi Julien, Jan
>>
>>
>>
>>> On 22/12/2021 13:05, Jan Beulich wrote:
>>>> On 22.12.2021 11:01, Julien Grall wrote:
>>>>> On 14/12/2021 17:45, Jan Beulich wrote:
>>>>>> On 14.12.2021 17:26, Oleksandr wrote:
>>>>>>> On 14.12.21 15:37, Jan Beulich wrote:
>>>>>>>> On 03.12.2021 21:33, Oleksandr Tyshchenko wrote:
>>>>>>>>> @@ -2177,14 +2181,22 @@ void *alloc_xenheap_pages(unsigned int
>>>>>>>>> order, unsigned int memflags)
>>>>>>>>>          void free_xenheap_pages(void *v, unsigned int order)
>>>>>>>>>      {
>>>>>>>>> +    struct page_info *pg;
>>>>>>>>> +    unsigned int i;
>>>>>>>>> +
>>>>>>>>>          ASSERT(!in_irq());
>>>>>>>>>              if ( v == NULL )
>>>>>>>>>              return;
>>>>>>>>>      +    pg = virt_to_page(v);
>>>>>>>>> +
>>>>>>>>>          memguard_guard_range(v, 1 << (order + PAGE_SHIFT));
>>>>>>>> ... this really want to (logically) move into the new arch hooks.
>>>>>>>> That'll effectively mean to simply drop the Arm stubs afaict (and I
>>>>>>>> notice there's some dead code there on x86, which I guess I'll make
>>>>>>>> a patch to clean up). But first of all this suggests that you want
>>>>>>>> to call the hooks with base page and order, putting the loops there.
>>>>>>> I see your point and agree ... However I see the on-list patches that
>>>>>>> remove common memguard_* invocations and x86 bits.
>>>>>>> So I assume, this request is not actual anymore, or I still need
>>>>>>> to pass
>>>>>>> an order to new arch hooks? Please clarify.
>>>>>> Well, that patch (really just the Arm one) effectively takes care of
>>>>>> part of what I did say above. Irrespective I continue to think that
>>>>>> the hook should take a (page,order) tuple instead of getting invoked
>>>>>> once for every order-0 page. And the hook invocations should be placed
>>>>>> such that they could fulfill the (being removed) memguard function
>>>>>> (iirc that was already the case, at least mostly).
>>>>> IIUC your suggestion, with your approach, alloc_xenheap_pages() would
>>>>> look like:
>>>>>
>>>>>         for ( i = 0; i < (1u << order); i++ )
>>>>>             pg[i].count_info |= PGC_xen_heap;
>>>>>
>>>>>         arch_alloc_xenheap_pages(pg, 1U << order);
>>>> Like Oleksandr said, the 2nd argument would be just "order".
>>>>
>>>>> The Arm implementation for arch_alloc_xenheap_pages() would also
>>>>> contain
>>>>> a loop.
>>>>>
>>>>> This could turn out to be quite expensive with large allocation (1GB
>>>>> allocation would require 16MB of cache) because the cache may not have
>>>>> enough space contain all the pages of that range. So you would have to
>>>>> pull twice the page_info in the cache.
>>>> Hmm, that's a fair point. I assume you realize that a similar issue of
>>>> higher overhead would occur when using your approach, and when some
>>>> memguard-like thing was to reappear: Such mapping operations typically
>>>> are more efficient when done on a larger range.
>>> Yes, I was aware of that when I wrote my message. However, they are
>>> not necessary at the moment. So I think we can defer the discussion.
>>>
>>>>   Since that's only a
>>>> hypothetical use at this point, I'm willing to accept your preference.
>>>> I'd like us to consider one more aspect though: All you need on Arm is
>>>> the setting of the exact same bits to the exact same pattern for every
>>>> struct page_info involved. Can't we simply have an arch hook returning
>>>> that pattern, for generic code to then OR it in alongside PGC_xen_heap?
>>> arch_alloc_xenheap_pages() will modify inuse.type_info so we can't or
>>> the value to PGC_xen_heap.
>> I wonder, can we apply pattern here at alloc_heap_pages() when
>> initializing type_info?
>> https://xenbits.xen.org/gitweb/?p=xen.git;f=xen/common/page_alloc.c;hb=refs/heads/master#l1027
>> If yes, the next question would be what indicator to use here to make
>> sure that page is really xenheap page.
> Technically that would seem to be possible, by way of passing yet another
> argument into alloc_heap_pages(). I'm not (yet) convinced, though, of this
> being desirable.

Yes, adding an extra argument would work, but I also don't like that 
idea much. I meant
to determine somehow from the existing arguments (zone_*, memflags) that 
a particular page is a xenheap page.


>
>> I also wonder, can we apply pattern for all type of pages here (without
>> differentiating)?
> I'm afraid I don't understand this part: How could we get along without
> differentiating Xen heap and domain heap pages?

I was thinking, what bad could happen if we would simply use the following:

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 50334a0..97cf0d8 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1024,7 +1024,7 @@ static struct page_info *alloc_heap_pages(
                                  &tlbflush_timestamp);

          /* Initialise fields which have other uses for free pages. */
-        pg[i].u.inuse.type_info = 0;
+        pg[i].u.inuse.type_info = PGT_TYPE_INFO_INIT_PATTERN;
          page_set_owner(&pg[i], NULL);

      }


on Arm:
#define PGT_TYPE_INFO_INIT_PATTERN   PGT_gfn_mask
or
#define PGT_TYPE_INFO_INIT_PATTERN   gfn_x(PGT_INVALID_XENHEAP_GFN)

on x86:
#define PGT_TYPE_INFO_INIT_PATTERN   0


Yes, we apply this pattern to *all* pages, although the gfn portion is 
only used for xenheap pages.
I might mistake but I think this pattern (which doesn't set any bits 
outside of the gfn portion) is harmless for non-xenheap pages, albeit an 
extra action.

Well, if not appropriate I will follow the advise to OR the pattern in 
alloc_xenheap_pages(). For !CONFIG_SEPARATE_XENHEAP the loop is already 
there, but for CONFIG_SEPARATE_XENHEAP new loop is needed.


Thank you.


>
> Jan
>
-- 
Regards,

Oleksandr Tyshchenko


