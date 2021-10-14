Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF9142DF0F
	for <lists+xen-devel@lfdr.de>; Thu, 14 Oct 2021 18:23:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209514.365999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mb3Ux-0002Wx-Iz; Thu, 14 Oct 2021 16:22:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209514.365999; Thu, 14 Oct 2021 16:22:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mb3Ux-0002Tz-FX; Thu, 14 Oct 2021 16:22:27 +0000
Received: by outflank-mailman (input) for mailman id 209514;
 Thu, 14 Oct 2021 16:22:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+gDO=PC=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mb3Uw-0002To-0Q
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 16:22:26 +0000
Received: from mail-wr1-x42e.google.com (unknown [2a00:1450:4864:20::42e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 47b42570-a71b-4e33-a24b-ac10ddf1490b;
 Thu, 14 Oct 2021 16:22:25 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id u18so21323793wrg.5
 for <xen-devel@lists.xenproject.org>; Thu, 14 Oct 2021 09:22:25 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id f127sm7992096wmf.16.2021.10.14.09.22.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 09:22:23 -0700 (PDT)
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
X-Inumbo-ID: 47b42570-a71b-4e33-a24b-ac10ddf1490b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=S7yyp2qFQz4XjR6Xg0wRYG3/mZcFGWBVQXaug5nBNX4=;
        b=iuUkkMlBv93ZOz65zAc2aAX4vGAVVxDMPtS0dGi3k1AJtQnt5iyuo+i/EB6cF+f0t+
         yd/kxAkNaj3RkHmJgYVoaOuasDgTXxdgNn7M1WthxZnLZ2JzmZpzJpIVT49gdJ1l/SAK
         s00PqmKdk+20iqmCUCKXdAAdDUVRsBDTLdNnjl1ewnrdqTFFDQZifzC219dSKR8S+bxK
         +rpeRoeBSWa/3grguCjFCXtsZ1XqcrkKMbRIQeQ47bhftZ/8b1jD32i6gBXeqzQwGr9m
         tgfBLsDP3JUjwaskm8Wj3REyw8yme9YjMcisnz03SCBFZDMJkFEpyqMGdnQAzUDF5ce2
         qPyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=S7yyp2qFQz4XjR6Xg0wRYG3/mZcFGWBVQXaug5nBNX4=;
        b=qiPqzHqN7A4ZvsKVXZOYoanHvETrpwm/X4IzeKrIAjhgJQZwgf/1YlSqIqNFUEiqcx
         CscOnAXjZpifz3V6GNY6lJGVV5MspXskYLypHEhGCQBem6YfMG/A5eTTH9O8hC+rFihZ
         N0sPqL+mbw7pTRBHx4MsOgYg4wMolKDL2gskEI48W6qDgAqBYtN0BUJLBIX68ZGsyq0C
         srU7vpS/sQaudAYmhNNVKiHjSeElPgYqLjePHBWVr2MfLL4lF+rjNaplnuHT0ZaEKF0l
         lQe4Mx/V6zFA94mGR+ex9mz9xNX+LnHcdwpyNTEAo2cNRk8hyaQ6NxA7q7UW5raXWBDB
         oW1w==
X-Gm-Message-State: AOAM530+1wv+uPK+RfcEL+06ujdreOEiBPknR6LjUepsTacqq0UWYnzw
	OCP4P9YTg9l6lTon6wV464g=
X-Google-Smtp-Source: ABdhPJxXEvEM8nX4MPC9HnpMO/o5QPZqVVKtAZAWjjMOnBSEbPvZXUZCaQCoLdtzHOS05VSvg89LhQ==
X-Received: by 2002:a05:6000:1885:: with SMTP id a5mr7632935wri.64.1634228544151;
        Thu, 14 Oct 2021 09:22:24 -0700 (PDT)
Subject: Re: [future abi] [RFC PATCH V3] xen/gnttab: Store frame GFN in struct
 page_info on Arm
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <1632425551-18910-1-git-send-email-olekstysh@gmail.com>
 <de92ab24-a9f0-8f3b-e721-e0465e4dc065@citrix.com>
 <YU2PT4rUts8KljKe@MacBook-Air-de-Roger.local>
 <04400e18-dde2-4b90-4056-f56c5d7937af@xen.org>
 <YU34dsl4cSCBbfrk@MacBook-Air-de-Roger.local>
 <547aff1d-d9dd-c7a5-bfeb-fb6aaa011051@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <c596c58d-4ff3-0313-9ec2-7fe1acb37502@gmail.com>
Date: Thu, 14 Oct 2021 19:22:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <547aff1d-d9dd-c7a5-bfeb-fb6aaa011051@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


Hello, all.

The potential issue on Arm (which might happen when remapping 
grant-table frame) is still present, it hasn't disappeared.
Some effort was put in trying to fix that by current patch. Although I 
have addressed (I hope) all review comments received for this patch, I 
realize this patch (in its current form) cannot go in without resolving 
locking issue I described in a post-commit message (we don't want to 
make things worse than the current state). I would appreciate any 
thoughts regarding that.


On 25.09.21 04:48, Julien Grall wrote:
> Hi Roger,
>
> On 24/09/2021 21:10, Roger Pau Monné wrote:
>> On Fri, Sep 24, 2021 at 07:52:24PM +0500, Julien Grall wrote:
>>> Hi Roger,
>>>
>>> On 24/09/2021 13:41, Roger Pau Monné wrote:
>>>> On Thu, Sep 23, 2021 at 09:59:26PM +0100, Andrew Cooper wrote:
>>>>> On 23/09/2021 20:32, Oleksandr Tyshchenko wrote:
>>>>>> Suggested-by: Julien Grall <jgrall@amazon.com>
>>>>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>>> ---
>>>>>> You can find the related discussions at:
>>>>>> https://lore.kernel.org/xen-devel/93d0df14-2c8a-c2e3-8c51-54412190171c@xen.org/ 
>>>>>>
>>>>>> https://lore.kernel.org/xen-devel/1628890077-12545-1-git-send-email-olekstysh@gmail.com/ 
>>>>>>
>>>>>> https://lore.kernel.org/xen-devel/1631652245-30746-1-git-send-email-olekstysh@gmail.com/ 
>>>>>>
>>>>>>
>>>>>> ! Please note, there is still unresolved locking question here 
>>>>>> for which
>>>>>> I failed to find a suitable solution. So, it is still an RFC !
>>>>>
>>>>> Just FYI, I thought I'd share some of the plans for ABI v2.  
>>>>> Obviously
>>>>> these plans are future work and don't solve the current problem.
>>>>>
>>>>> Guests mapping Xen pages is backwards.  There are reasons why it was
>>>>> used for x86 PV guests, but the entire interface should have been 
>>>>> design
>>>>> differently for x86 HVM.
>>>>>
>>>>> In particular, Xen should be mapping guest RAM, rather than the guest
>>>>> manipulating the 2nd stage tables to map Xen RAM.  Amongst other 
>>>>> things,
>>>>> its far far lower overhead.
>>>>>
>>>>>
>>>>> A much better design is one where the grant table looks like an MMIO
>>>>> device.  The domain builder decides the ABI (v1 vs v2 - none of this
>>>>> dynamic switch at runtime nonsense), and picks a block of guest 
>>>>> physical
>>>>> addresses, which are registered with Xen.  This forms the grant 
>>>>> table,
>>>>> status table (v2 only), and holes to map into.
>>>>
>>>> I think this could be problematic for identity mapped Arm dom0, as
>>>> IIRC in that case grants are mapped so that gfn == mfn in order to
>>>> account for the lack of an IOMMU. You could use a bounce buffer, but
>>>> that would introduce a big performance penalty.
>>>
>>> Or you could find a hole that is outside of the RAM regions. This is 
>>> not
>>> trivial but not impossible (see [1]).
>>
>> I certainly not familiar with the Arm identity map.
>>
>> If you map them at random areas (so no longer identity mapped), how do
>> you pass the addresses to the physical devices for DMA operations? I
>> assume there must be some kind of translation then that converts from
>> gfn to mfn in order to cope with the lack of an IOMMU, 
>
> For grant mapping, the hypercall will return the machine address in 
> dev_bus_addr. Dom0, will keep the conversion dom0 GFN <-> MFN for 
> later use in the swiotlb.
>
> For foreign mapping, AFAICT, we are expecting them to bounce 
> everytime. But DMA into a foreign mapping should be rarer.
>
>> and because
>> dom0 doesn't know the mfn of the grant reference in order to map it at
>> the same gfn.
>
> IIRC, we tried an approach where the grant mapping would be direct 
> mapped in dom0. However, this was an issue on arm32 because Debian was 
> (is?) using short descriptor page tables. This didn't allow dom0 to 
> cover all the mappings and therefore some mappings would not be 
> accessible.
>
-- 
Regards,

Oleksandr Tyshchenko


