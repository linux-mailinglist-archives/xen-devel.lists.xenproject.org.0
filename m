Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4F727288B
	for <lists+xen-devel@lfdr.de>; Mon, 21 Sep 2020 16:44:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKN2U-0000yb-Vt; Mon, 21 Sep 2020 14:43:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KPbg=C6=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kKN2U-0000yW-6U
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2020 14:43:34 +0000
X-Inumbo-ID: 4148ab54-6a2d-4355-a4fd-6a2380ef523d
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4148ab54-6a2d-4355-a4fd-6a2380ef523d;
 Mon, 21 Sep 2020 14:43:33 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id u4so11302469ljd.10
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2020 07:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=X9bGeWS/pU9plZURIOC68njPk7KNNjSfrKhHtrbLK2I=;
 b=ab93EJexR9J2pEUnW0PHZNx1vaZxcufyB5E/1+e2o2MzS6ZVnzBv/XaUaMG6c5em6K
 n8+FVpVjCRRYin9/IEzbBMSONwlB9Tjfbas1Hi99O1yUK/9ZbL06CfAQiR93dso0n6jS
 qBBDO2FnJ0Khk9+6kRjeaZSjEh+CO89VlZdhcBkLvXbCy4qVgr44ezEoKDF1MKOZb3VC
 Kp14RpvKAkVf0B4G+C82J2+vsvtc3z1KHcvSMOoHH5UuwcBak7lahsn48phcSZg8HLCk
 H98m8xhyxf9sMRYQ2TJs4s3R0pjVGmpDOsSoYSQsDKjByCzqLaUW1hWLwPkq8igmUYKu
 uwHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=X9bGeWS/pU9plZURIOC68njPk7KNNjSfrKhHtrbLK2I=;
 b=P7QIhYK7Ip3IuLfJ+o5ZRCZTWoVpeGyDpsd5HxvIOYHcyZp9eBaMQ5wNg0qwGO3rUz
 Z1feq/Gi7l7pVhxI20h5yB/hiHwvE6FuvjEN9YxVk3j8t+HOTmGs3bJ4/WxP0IeYk6sE
 FyPL+se76vS/UNYXtwHIT4Q4H6ubD4whspL9CyO4a1o1RYcLzAZSW7nkLn9cdeZPJtP0
 1g+TUNeG1v+sW4HgUf7kxk92Bu0TtBUynd2OmfOXqGKogWtAmPqNFO00oZD6wIctXBQP
 4mRjXQoBXli2eJ5MxRP5eAcvhSr8/5Yc9FAEm3rDKkVGnkMQM54D4cSgEDTBK/L2ZS32
 kwyQ==
X-Gm-Message-State: AOAM531fUA67I0yXfD316eoXFe4qPOlRl0FrRMbDACsq1wFBftOG7oEi
 ahbkYMAMjrfKtGTKuRaA9Sk=
X-Google-Smtp-Source: ABdhPJzQ/FHoLHcB9PzucELZ1iEIDikquOs5RIrFEsVX8inKJMW/HEWbBzfeHA0SSnLzzTRTL9ztpg==
X-Received: by 2002:a2e:9cc3:: with SMTP id g3mr34058ljj.146.1600699412010;
 Mon, 21 Sep 2020 07:43:32 -0700 (PDT)
Received: from [192.168.1.6] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id q24sm2803755ljm.60.2020.09.21.07.43.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2020 07:43:31 -0700 (PDT)
Subject: Re: [PATCH V1 01/16] x86/ioreq: Prepare IOREQ feature for making it
 common
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-2-git-send-email-olekstysh@gmail.com>
 <98420567-40a9-7297-d243-4af90f692bf9@suse.com>
 <123d8e2a-96c2-a97c-a0c0-a5dca4288a2b@gmail.com>
 <2dea0b83-5178-7768-eaab-ff4a8878eeb0@suse.com>
 <e01631d6-7e32-0923-e004-d6aefe6ffabb@gmail.com>
 <dfbe6c62-55f6-8d33-db25-031e36b758bc@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <ac068d84-24cb-af37-cb89-f36fdd785d07@gmail.com>
Date: Mon, 21 Sep 2020 17:43:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <dfbe6c62-55f6-8d33-db25-031e36b758bc@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 21.09.20 16:29, Jan Beulich wrote:

Hi

> On 21.09.2020 14:47, Oleksandr wrote:
>> On 21.09.20 15:31, Jan Beulich wrote:
>>> On 21.09.2020 14:22, Oleksandr wrote:
>>>> On 14.09.20 16:52, Jan Beulich wrote:
>>>>> On 10.09.2020 22:21, Oleksandr Tyshchenko wrote:
>>>>>> @@ -1215,8 +1233,7 @@ void hvm_destroy_all_ioreq_servers(struct domain *d)
>>>>>>         struct hvm_ioreq_server *s;
>>>>>>         unsigned int id;
>>>>>>     
>>>>>> -    if ( !relocate_portio_handler(d, 0xcf8, 0xcf8, 4) )
>>>>>> -        return;
>>>>>> +    arch_hvm_ioreq_destroy(d);
>>>>> So the call to relocate_portio_handler() simply goes away. No
>>>>> replacement, no explanation?
>>>> As I understand from the review comment on that for the RFC patch, there
>>>> is no
>>>> a lot of point of keeping this. Indeed, looking at the code I got the
>>>> same opinion.
>>>> I should have added an explanation in the commit description at least.
>>>> Or shall I return the call back?
>>> If there's a reason to drop it (which I can't see, but I also
>>> don't recall seeing the discussion you're mentioning), then doing
>>> so should be a separate patch with suitable reasoning. In the
>>> patch here you definitely should only transform what's already
>>> there.
>> Sounds reasonable. Please see the comment below
>> relocate_portio_handler() here:
>> https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg78512.html
>>
>> However, I might interpret the request incorrectly.
> I'm afraid you do: The way you've coded it the function was a no-op.
> But that's because you broke the caller by not bailing from
> hvm_destroy_all_ioreq_servers() if relocate_portio_handler() returned
> false. IOW you did assume that moving the "return" statement into an
> inline function would have an effect on its caller(s). For questions
> like this one it also often helps to look at the commit introducing
> the construct in question (b3344bb1cae0 in this case): Chances are
> that the description helps, albeit I agree there are many cases
> (particularly the farther you get into distant past) where it isn't
> of much help.


Hmm, now it's clear to me what I did wrong. By calling 
relocate_portio_handler() here we don't really want to relocate 
something, we just use it as a flag to indicate whether we need to 
actually release IOREQ resources down the 
hvm_destroy_all_ioreq_servers(). Thank you for the explanation, it 
wasn't obvious to me at the beginning. But, now the question is how to 
do it in a correct way and retain current behavior (to not break callers)?

I see two options here:
1. Place the check of relocate_portio_handler() in 
arch_hvm_ioreq_destroy() and make the later returning bool.
     The "common" hvm_destroy_all_ioreq_servers() will check for the 
return value and bail out if false.
2. Don't use relocate_portio_handler(), instead introduce a flag into 
struct hvm_domain's ioreq_server sub-structure.


Personally I don't like much the option 1 and option 2 is a little bit 
overhead.

What do you think?


-- 
Regards,

Oleksandr Tyshchenko


