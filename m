Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7CE2D4C6A
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 22:05:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48719.86187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn6e5-0002FH-48; Wed, 09 Dec 2020 21:05:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48719.86187; Wed, 09 Dec 2020 21:05:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn6e5-0002Er-0X; Wed, 09 Dec 2020 21:05:09 +0000
Received: by outflank-mailman (input) for mailman id 48719;
 Wed, 09 Dec 2020 21:05:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GmJG=FN=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kn6e3-0002EX-8q
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 21:05:07 +0000
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 75f87b02-3e70-4363-b5f8-743be902e657;
 Wed, 09 Dec 2020 21:05:05 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id x23so4114597lji.7
 for <xen-devel@lists.xenproject.org>; Wed, 09 Dec 2020 13:05:05 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id x67sm285152lff.82.2020.12.09.13.05.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 13:05:03 -0800 (PST)
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
X-Inumbo-ID: 75f87b02-3e70-4363-b5f8-743be902e657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=ziK8rAJAHWHZ7JGTlXpNI/0LtdEcTIT2NfNjvM79Uvk=;
        b=Czp9zXTlJlGo4XB4ISmYDMsMym/4rNLOnM7KUwJuw7Po4kj2287MTK4/rXMaZ54Utt
         lSNHocyH45GAU9hfrbfxMsAISNXW45b631qcvFhlCHAozKkOOj9ScjJRy0JjCEwWFW6b
         8qWMZp4p93rjwBxCZ16VX5vUZlNPAhN+LsDn9o0AwxsZr2GTnzZusN5PGp9wgO4egXUt
         JFdNxJ6te9cVmk5LL00YPnl+yopCkgpRT1MKrqMjX+SeVdV2pohLK/qUC2hQodmBeEak
         QJJRxPFig4zEDW706YVJf7LrLpsT7H8Yb2dNzShHG7m4ffDF42DDzezMGQmW/BT5Zbuw
         K4fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=ziK8rAJAHWHZ7JGTlXpNI/0LtdEcTIT2NfNjvM79Uvk=;
        b=CO0fIDv8oEDSFe2SN1nrywDjgg1S760tetQC88PNhRluTJV7xq+EoqhmYcyYAIGv4g
         KUrh3gV97lRbmpPaVIFv9YdBWr4DXN836dyqlHOg0YQFkvkn5FkdJ7xhtyZPWY3J6WrN
         fedTBP2lA7jqSvY8XGEO8eMSkK0uclDH2xpUspqB4PSwrbx9EjCSPwz6r6Da9eqiSQOj
         BD3CtfLwTxr+VhmPL7CI/iKp9ZhHkElbMXGmUYTXHIs2kDSWGnYkqwC6J+EEH+DTmewP
         9ToZTmw7xBGBpeqmyrslOHV/GvL5hhDySHWZfOGpVFBF8dOcKOEAhy6K4vnBFfWcEqis
         eZzA==
X-Gm-Message-State: AOAM533LmiHvn/pshhSTZWmT69iw8VrvUE+W+b7FqhNerOvj+2dY6/6X
	ifi3juNck+bKGGjmUKxsL5E9MPjWMyCuYA==
X-Google-Smtp-Source: ABdhPJyeG3Dq5+gTT8OTtJ47P4+DJRpzrLCyZP9Wj+/4bgsIjGXdBN5F8g7ySE+XMqT7dgx4aLub0Q==
X-Received: by 2002:a05:651c:1b6:: with SMTP id c22mr1774381ljn.365.1607547904498;
        Wed, 09 Dec 2020 13:05:04 -0800 (PST)
Subject: Re: [PATCH V3 17/23] xen/ioreq: Introduce domain_has_ioreq_server()
To: Julien Grall <julien@xen.org>, paul@xen.org
Cc: 'Jan Beulich' <jbeulich@suse.com>,
 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>,
 'Ian Jackson' <iwj@xenproject.org>, 'Wei Liu' <wl@xen.org>,
 'Julien Grall' <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-18-git-send-email-olekstysh@gmail.com>
 <3bb4c3b5-a46a-ba31-292f-5c6ba49fa9be@suse.com>
 <6026b7f3-ae6e-f98f-be65-27d7f729a37f@gmail.com>
 <18bfd9b1-3e6a-8119-efd0-c82ad7ae681d@gmail.com>
 <0d6c01d6cd9a$666326c0$33297440$@xen.org>
 <57bfc007-e400-6777-0075-827daa8acf0e@gmail.com>
 <0d7201d6ce09$e13dce80$a3b96b80$@xen.org>
 <84d7238d-0ec1-acdd-6cea-db78aba6f3d7@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <dfe1f85a-6293-5c5e-ad33-4367f83a5c60@gmail.com>
Date: Wed, 9 Dec 2020 23:05:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <84d7238d-0ec1-acdd-6cea-db78aba6f3d7@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 09.12.20 20:58, Julien Grall wrote:
> Hi Oleksandr and Paul,

Hi Julien, Paul.


>
> Sorry for jumping late in the conversation.
>
> On 09/12/2020 09:01, Paul Durrant wrote:
>>> -----Original Message-----
>>> From: Oleksandr <olekstysh@gmail.com>
>>> Sent: 08 December 2020 20:17
>>> To: paul@xen.org
>>> Cc: 'Jan Beulich' <jbeulich@suse.com>; 'Oleksandr Tyshchenko' 
>>> <oleksandr_tyshchenko@epam.com>;
>>> 'Stefano Stabellini' <sstabellini@kernel.org>; 'Julien Grall' 
>>> <julien@xen.org>; 'Volodymyr Babchuk'
>>> <Volodymyr_Babchuk@epam.com>; 'Andrew Cooper' 
>>> <andrew.cooper3@citrix.com>; 'George Dunlap'
>>> <george.dunlap@citrix.com>; 'Ian Jackson' <iwj@xenproject.org>; 'Wei 
>>> Liu' <wl@xen.org>; 'Julien Grall'
>>> <julien.grall@arm.com>; xen-devel@lists.xenproject.org
>>> Subject: Re: [PATCH V3 17/23] xen/ioreq: Introduce 
>>> domain_has_ioreq_server()
>>>
>>>
>>> On 08.12.20 21:43, Paul Durrant wrote:
>>>
>>> Hi Paul
>>>
>>>>> -----Original Message-----
>>>>> From: Oleksandr <olekstysh@gmail.com>
>>>>> Sent: 08 December 2020 16:57
>>>>> To: Paul Durrant <paul@xen.org>
>>>>> Cc: Jan Beulich <jbeulich@suse.com>; Oleksandr Tyshchenko 
>>>>> <oleksandr_tyshchenko@epam.com>; Stefano
>>>>> Stabellini <sstabellini@kernel.org>; Julien Grall 
>>>>> <julien@xen.org>; Volodymyr Babchuk
>>>>> <Volodymyr_Babchuk@epam.com>; Andrew Cooper 
>>>>> <andrew.cooper3@citrix.com>; George Dunlap
>>>>> <george.dunlap@citrix.com>; Ian Jackson <iwj@xenproject.org>; Wei 
>>>>> Liu <wl@xen.org>; Julien Grall
>>>>> <julien.grall@arm.com>; xen-devel@lists.xenproject.org
>>>>> Subject: Re: [PATCH V3 17/23] xen/ioreq: Introduce 
>>>>> domain_has_ioreq_server()
>>>>>
>>>>>
>>>>> Hi Paul.
>>>>>
>>>>>
>>>>> On 08.12.20 17:33, Oleksandr wrote:
>>>>>> On 08.12.20 17:11, Jan Beulich wrote:
>>>>>>
>>>>>> Hi Jan
>>>>>>
>>>>>>> On 30.11.2020 11:31, Oleksandr Tyshchenko wrote:
>>>>>>>> --- a/xen/include/xen/ioreq.h
>>>>>>>> +++ b/xen/include/xen/ioreq.h
>>>>>>>> @@ -55,6 +55,20 @@ struct ioreq_server {
>>>>>>>>         uint8_t                bufioreq_handling;
>>>>>>>>     };
>>>>>>>>     +/*
>>>>>>>> + * This should only be used when d == current->domain and it's 
>>>>>>>> not
>>>>>>>> paused,
>>>>>>> Is the "not paused" part really relevant here? Besides it being 
>>>>>>> rare
>>>>>>> that the current domain would be paused (if so, it's in the process
>>>>>>> of having all its vCPU-s scheduled out), does this matter at all?do
>>>>>>> any extra actionsdo any extra actions
>>>>>> No, it isn't relevant, I will drop it.
>>>>>>
>>>>>>
>>>>>>> Apart from this the patch looks okay to me, but I'm not sure it
>>>>>>> addresses Paul's concerns. Iirc he had suggested to switch back to
>>>>>>> a list if doing a swipe over the entire array is too expensive in
>>>>>>> this specific case.
>>>>>> We would like to avoid to do any extra actions in
>>>>>> leave_hypervisor_to_guest() if possible.
>>>>>> But not only there, the logic whether we check/set
>>>>>> mapcache_invalidation variable could be avoided if a domain doesn't
>>>>>> use IOREQ server...
>>>>>
>>>>> Are you OK with this patch (common part of it)?
>>>> How much of a performance benefit is this? The array is small to 
>>>> simply counting the non-NULL
>>> entries should be pretty quick.
>>> I didn't perform performance measurements on how much this call 
>>> consumes.
>>> In our system we run three domains. The emulator is in DomD only, so I
>>> would like to avoid to call vcpu_ioreq_handle_completion() for every
>>> Dom0/DomU's vCPUs
>>> if there is no real need to do it.
>>
>> This is not relevant to the domain that the emulator is running in; 
>> it's concerning the domains which the emulator is servicing. How many 
>> of those are there?
>
> AFAICT, the maximum number of IOREQ servers is 8 today.
>
>>
>>> On Arm vcpu_ioreq_handle_completion()
>>> is called with IRQ enabled, so the call is accompanied with
>>> corresponding irq_enable/irq_disable.
>>> These unneeded actions could be avoided by using this simple one-line
>>> helper...
>>>
>>
>> The helper may be one line but there is more to the patch than that. 
>> I still think you could just walk the array in the helper rather than 
>> keeping a running occupancy count.
>
> Right, the concern here is this function will be called in an hotpath 
> (everytime we are re-entering to the guest). At the difference of x86, 
> the entry/exit code is really small, so any additional code will have 
> an impact on the overall performance.
+1


>
>
> That said, the IOREQ code is a tech preview for Arm. So I would be 
> fine going with Paul's approach until we have a better understanding 
> on the performance of virtio/IOREQ.

I am fine with Paul's approach for now (I only need a confirmation that 
I got it correctly).


>
>
> I am going to throw some more thoughts about the optimization here. 
> The patch is focusing on performance impact when IOREQ is built-in and 
> not used.
It is true, what I would to add here is the helper also avoids 
unnecessary vcpu_ioreq_handle_completion() calls as well another 
unnecessary action
(mapcache handling logic, although it is not a hotpath) in subsequent 
patch when IOREQ is used.


> I think we can do further optimization (which may superseed this one).
>
> get_pending_vcpu() (called from handle_hvm_io_completion()) is overly 
> expensive in particular if you have no I/O forwarded to an IOREQ 
> server. Entry to the hypervisor can happen for many reasons 
> (interrupts, system registers emulation, I/O emulation...) and the I/O 
> forwarded should be a small subset.
>
> Ideally, handle_hvm_io_completion() should be a NOP (at max a few 
> instructions) if there are nothing to do. Maybe we want to introduce a 
> per-vCPU flag indicating if an I/O has been forwarded to an IOREQ server.
>
> This would also us to bypass most of the function if there is nothing 
> to do.
>
> Any thoughts?
>
> In any case this is more a forward looking rather than a request for 
> the current series. What matters to me is we have a functional (not 
> necessarily optimized) version of IOREQ in Xen 4.15. This would be a 
> great step towards using Virto on Xen.

Completely agree, current series is quite big) and if we will try to 
make it perfect I am afraid, we won't have it even in Xen 4.16). As for 
proposed optimization - I think it worth considering, I will mention 
about it in the cover letter for the series among other possible things 
such as buffered request, etc.


>
>
> Cheers,
>
-- 
Regards,

Oleksandr Tyshchenko


