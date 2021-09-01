Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 962843FD292
	for <lists+xen-devel@lfdr.de>; Wed,  1 Sep 2021 06:51:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176057.320468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLICr-0000z8-LS; Wed, 01 Sep 2021 04:50:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176057.320468; Wed, 01 Sep 2021 04:50:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLICr-0000wm-IL; Wed, 01 Sep 2021 04:50:37 +0000
Received: by outflank-mailman (input) for mailman id 176057;
 Wed, 01 Sep 2021 04:50:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ocLH=NX=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mLICp-0000wf-KL
 for xen-devel@lists.xenproject.org; Wed, 01 Sep 2021 04:50:35 +0000
Received: from mail-lj1-x22d.google.com (unknown [2a00:1450:4864:20::22d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7942cd84-54e6-4fb6-86b6-aad24475e815;
 Wed, 01 Sep 2021 04:50:34 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id s3so2618941ljp.11
 for <xen-devel@lists.xenproject.org>; Tue, 31 Aug 2021 21:50:34 -0700 (PDT)
Received: from [192.168.10.179] ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id e15sm2383177ljn.25.2021.08.31.21.50.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Aug 2021 21:50:32 -0700 (PDT)
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
X-Inumbo-ID: 7942cd84-54e6-4fb6-86b6-aad24475e815
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=fp+l23ni8nD//u350996azMCPKCUo56T7jjZIzLPNDY=;
        b=LTZvKfPGCOt6z6sq51v4QCbm+YcdSuPPrXAbAWO9F0OjfFVFoXJOhtldbXUEgy/xMX
         ccC/gEbZPAr3+yTuyVGxI6bT16BGcGY22OPmd7ue3vWOZfA1ybc2/7kpcebA5gPn1bfA
         pAlKMp26Z6jeJ8JkwnV7oq7G0kplYcbb6e/BVn+CdXgx0y5jWT6La6uDAkjKpqycdgk2
         EZygunRC8ILxteP56YbI/Lt5m7VadKcj2HGnbkp/Pw/0wRSGJNhvNQUA8F/qfaCXEiaD
         sMUsEe6cFYQj5Ddz0dJ/D0gpc4e+uU9BmRSwlYvQvW2DLBFLp+4rw6+wnR+NaJQyrlA6
         w18w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=fp+l23ni8nD//u350996azMCPKCUo56T7jjZIzLPNDY=;
        b=CUhjZNBYH0K/9VZjTzOrzAI9/hRAGYDQ79GYmI2rO+IcoGuW+SP9Nbg4lD8bgnE4A5
         xmJ5ejTnGJStvJYjlOmT/YsW6Zi3TU4Nd3WVtGkOTx2yaOHI5ucNe52sxdz6XQe6XzXj
         NitLm+VUcVxTYF6ls6rrqDbLRDYCe7h2tvfqhHwyyCVOmgRwP1YpH8vfAmiC6guZd67R
         UsCMG7ms3xhe89zlcbz7WrH+H8CB63VZzZs7//6UhdUZBtSUZA1ejmFbGJFRy7Pzc1UZ
         xF1rLqbLpNsH/Bu+9x9K+27dXgPEM+lUKTzxhZjuX91CJ03VfeLxPJ99HD5Iv1KekLaR
         ziJg==
X-Gm-Message-State: AOAM531ZCJDEOKk7QugCyn7KpTvY5+lrhJ8RzVqcy5Aq/50U3mhHiILX
	1pNeIFZgweobp4aX70ZJ+m94B41Zodw4Xw==
X-Google-Smtp-Source: ABdhPJy+09EttPJHJkf6WstYZk8w+26229ZqHGUmytKZbcF+xhAAFrwoPcd32nxOFA0MKVR4+xFrDw==
X-Received: by 2002:a05:651c:200e:: with SMTP id s14mr28530367ljo.306.1630471832844;
        Tue, 31 Aug 2021 21:50:32 -0700 (PDT)
Subject: Re: [PATCH RFC] vPCI: account for hidden devices in modify_bars()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6285981f-683f-a043-7025-993613eaea7c@suse.com>
 <b2e8863d-217a-fc0e-3176-a20ef5ad0872@gmail.com>
 <e87ad2a2-7ee0-a2e7-7bab-0c332aca7aec@suse.com>
 <3a6ca3ac-8771-2a80-285e-701c5c1b8343@gmail.com>
 <956dd02c-553e-6aa2-eedf-28703a6ded32@suse.com>
 <13eb638e-c3c5-6794-c828-04c66bb2bd2f@gmail.com>
 <8295cd88-4e4e-4189-cf27-ce83823357df@suse.com>
 <1f571749-5d41-7c4d-8ca0-afc91d2f83fe@gmail.com>
 <2f81bc05-69e0-f3e7-4a50-67b40352efa6@suse.com>
From: Oleksandr Andrushchenko <andr2000@gmail.com>
Message-ID: <052efde6-bccd-b34c-ccbb-c2cc9f513f56@gmail.com>
Date: Wed, 1 Sep 2021 07:50:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <2f81bc05-69e0-f3e7-4a50-67b40352efa6@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 31.08.21 11:35, Jan Beulich wrote:
> On 31.08.2021 10:14, Oleksandr Andrushchenko wrote:
>> On 31.08.21 11:05, Jan Beulich wrote:
>>> On 31.08.2021 09:56, Oleksandr Andrushchenko wrote:
>>>> On 31.08.21 10:47, Jan Beulich wrote:
>>>>> On 31.08.2021 09:06, Oleksandr Andrushchenko wrote:
>>>>>> On 31.08.21 09:51, Jan Beulich wrote:
>>>>>>> On 31.08.2021 07:35, Oleksandr Andrushchenko wrote:
>>>>>>>> On 30.08.21 16:04, Jan Beulich wrote:
>>>>>>>>> @@ -265,7 +266,8 @@ static int modify_bars(const struct pci_
>>>>>>>>>            * Check for overlaps with other BARs. Note that only BARs that are
>>>>>>>>>            * currently mapped (enabled) are checked for overlaps.
>>>>>>>>>            */
>>>>>>>>> -    for_each_pdev ( pdev->domain, tmp )
>>>>>>>>> +for ( d = pdev->domain; ; d = dom_xen ) {//todo
>>>>>>>> I am not quite sure this will be correct for the cases where pdev->domain != dom0,
>>>>>>>> e.g. in the series for PCI passthrough for Arm this can be any guest. For such cases
>>>>>>>> we'll force running the loop for dom_xen which I am not sure is desirable.
>>>>>>> It is surely not desirable, but it also doesn't happen - see the
>>>>>>> is_hardware_domain() check further down (keeping context below).
>>>>>> Right
>>>>>>>> Another question is why such a hidden device has its pdev->domain not set correctly,
>>>>>>>> so we need to work this around?
>>>>>>> Please see _setup_hwdom_pci_devices() and commit e46ea4d44dc0
>>>>>>> ("PCI: don't allow guest assignment of devices used by Xen")
>>>>>>> introducing that temporary override. To permit limited
>>>>>>> visibility to Dom0, these devices still need setting up in the
>>>>>>> IOMMU for Dom0. Consequently BAR overlap detection also needs
>>>>>>> to take these into account (i.e. the goal here is not just to
>>>>>>> prevent triggering the ASSERT() in question).
>>>>>> So, why don't we set pdev->domain = dom_xen for such devices and call
>>>>>> modify_bars or something from pci_hide_device for instance (I didn't get too
>>>>>> much into implementation details though)? If pci_hide_device already handles
>>>>>> such exceptions, so it should also take care of the correct BAR overlaps etc.
>>>>> How would it? It runs long before Dom0 gets created, let alone when
>>>>> Dom0 may make adjustments to the BAR arrangement.
>>>> So, why don't we call "yet another hide function" while creating Dom0 for that
>>>> exactly reason, e.g. BAR overlap handling? E.g. make it 2-stage hide for special
>>>> devices such as console etc.
>>> This might be an option, but is imo going to result not only in more
>>> code churn, but also in redundant code. After all what modify_bars()
>>> needs is the union of BARs from Dom0's and DomXEN's devices.
>> To me DomXEN here is yet another workaround as strictly speaking
>> vpci code didn't need and doesn't(?) need it at the moment. Yes, at least on Arm.
>> So, I do understand why you want it there, but this then does need a very
>> good description of what is happening and why...
>>
>>>>> The temporary overriding of pdev->domain is because other IOMMU code
>>>>> takes the domain to act upon from that field.
>>>> So, you mean pdev->domain in that case is pointing to what?
>>> Did you look at the function I've pointed you at? DomXEN there gets
>>> temporarily overridden to Dom0.
>> This looks like yet another workaround to me which is not cute.
>> So, the overall solution is spread over multiple subsystems, each
>> introducing something which is hard to follow
> If you have any better suggestions, I'm all ears. Or feel free to send
> patches.

Unfortunately I don't have any. But, could you please at least document a bit

more what is happening here with DomXEN: either in the commit message or

in the code itself, so it is easier to understand why vpci has this code at all...

Thank you,

Oleksandr

>
> Jan
>

