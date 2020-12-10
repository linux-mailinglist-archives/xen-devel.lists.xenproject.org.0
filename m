Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AACEC2D62AF
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 17:58:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49555.87659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knPGH-0005nL-91; Thu, 10 Dec 2020 16:57:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49555.87659; Thu, 10 Dec 2020 16:57:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knPGH-0005mr-58; Thu, 10 Dec 2020 16:57:49 +0000
Received: by outflank-mailman (input) for mailman id 49555;
 Thu, 10 Dec 2020 16:57:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ykji=FO=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1knPGG-0005mY-0k
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 16:57:48 +0000
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 799aad02-ea0a-46dd-a737-9bbf727e7e1a;
 Thu, 10 Dec 2020 16:57:47 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id u18so9218616lfd.9
 for <xen-devel@lists.xenproject.org>; Thu, 10 Dec 2020 08:57:46 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id m21sm581989lfh.234.2020.12.10.08.57.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Dec 2020 08:57:45 -0800 (PST)
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
X-Inumbo-ID: 799aad02-ea0a-46dd-a737-9bbf727e7e1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=9veu/89fdLOXOwROQXRtrg7V3t8PiokUD1pb3Hncd5Q=;
        b=In7p5uj+XFf3tXocsuDz8ouvSKm/8bZjO5FcEZT/b0NK7VUv3v23wVpwTY1zbDtbsy
         6WYfYwRAnV+zGpXTDxSDtyZ+SNtaoMCrrXl4tsoAJ/6xZ7craqXa7SldWxWlXy5ntITX
         UHefaZx+WSrRSkTim2ZA1PeIHfiFpZ9MYEERAQwIRWZZBe4e5WEXpMl0D2q9exM+FLGM
         cX1yUazWa7FpthsJL6LZhK38qq1ru5uQbg8K39G1305+IGlFLU22svsvhF77MyVnD4Q4
         aXgqqsiwPUido/lyXjqThqPlhdacCiGh9QoKfZZk7Gi5raOJW1QZ+UrKI4mvJ9pg9vUD
         B2jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=9veu/89fdLOXOwROQXRtrg7V3t8PiokUD1pb3Hncd5Q=;
        b=nDXb/DxM6FNe+lOUGI9Rvos8qIvZjYz5JQAfkCusRLvbJ4cCyC9LNZJI5ZSJ60VfYz
         diTGDb0ulp912Jcl7uGKm1gKppmZOISD3h2nxxBTyRpCABTAJIebuJqO5t/rJ+DDHGYO
         YrldWufHtWgfckuQrNRD5fQqAQztK2+EApbrDK3D9sU0zi3cXfrWJskmA4GJqgZze+F/
         crcpFhf7Y5uCpCMrogqQxr1en/IGtr9SqxksTgJp+fyk7SmImI7cbySwcmSFwc0lzzsr
         t04ENNdw45PpwXPz9mHI6tVNvP1f1K0GYOJNb5yUbF1RdP36J3AGJQg/Y1lpjPNQupHJ
         bSMQ==
X-Gm-Message-State: AOAM530ycM6X6tHU98RRtMkmxOnczTF19D+tDiXaGxKZt4fXMGTU2vnU
	+E2ig8rVbvsZL0C5W2rdm5HGoJsO88c1oQ==
X-Google-Smtp-Source: ABdhPJyFSwyEiwnn3G6isxehumFtenn+UsTTokHJUVstFVwcJs3deSHagC6X0x1sA5mSYceuuP9QMg==
X-Received: by 2002:ac2:5462:: with SMTP id e2mr3225826lfn.552.1607619465716;
        Thu, 10 Dec 2020 08:57:45 -0800 (PST)
Subject: Re: [PATCH V3 17/23] xen/ioreq: Introduce domain_has_ioreq_server()
To: paul@xen.org
Cc: 'Jan Beulich' <jbeulich@suse.com>,
 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>,
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
 <96b9b843-f4fe-834a-f17b-d75198aa0dab@gmail.com>
 <002401d6cecf$ce472710$6ad57530$@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <1c012758-7121-5702-038e-4510f3cf1b0b@gmail.com>
Date: Thu, 10 Dec 2020 18:57:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <002401d6cecf$ce472710$6ad57530$@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 10.12.20 10:38, Paul Durrant wrote:

Hi Paul.

>> -----Original Message-----
>> From: Oleksandr <olekstysh@gmail.com>
>> Sent: 09 December 2020 20:36
>> To: paul@xen.org
>> Cc: 'Jan Beulich' <jbeulich@suse.com>; 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>;
>> 'Stefano Stabellini' <sstabellini@kernel.org>; 'Julien Grall' <julien@xen.org>; 'Volodymyr Babchuk'
>> <Volodymyr_Babchuk@epam.com>; 'Andrew Cooper' <andrew.cooper3@citrix.com>; 'George Dunlap'
>> <george.dunlap@citrix.com>; 'Ian Jackson' <iwj@xenproject.org>; 'Wei Liu' <wl@xen.org>; 'Julien Grall'
>> <julien.grall@arm.com>; xen-devel@lists.xenproject.org
>> Subject: Re: [PATCH V3 17/23] xen/ioreq: Introduce domain_has_ioreq_server()
>>
>>
>> Hi Paul.
>>
>>
>>>>>>>> On 30.11.2020 11:31, Oleksandr Tyshchenko wrote:
>>>>>>>>> --- a/xen/include/xen/ioreq.h
>>>>>>>>> +++ b/xen/include/xen/ioreq.h
>>>>>>>>> @@ -55,6 +55,20 @@ struct ioreq_server {
>>>>>>>>>          uint8_t                bufioreq_handling;
>>>>>>>>>      };
>>>>>>>>>      +/*
>>>>>>>>> + * This should only be used when d == current->domain and it's not
>>>>>>>>> paused,
>>>>>>>> Is the "not paused" part really relevant here? Besides it being rare
>>>>>>>> that the current domain would be paused (if so, it's in the process
>>>>>>>> of having all its vCPU-s scheduled out), does this matter at all?do
>>>>>>>> any extra actionsdo any extra actions
>>>>>>> No, it isn't relevant, I will drop it.
>>>>>>>
>>>>>>>
>>>>>>>> Apart from this the patch looks okay to me, but I'm not sure it
>>>>>>>> addresses Paul's concerns. Iirc he had suggested to switch back to
>>>>>>>> a list if doing a swipe over the entire array is too expensive in
>>>>>>>> this specific case.
>>>>>>> We would like to avoid to do any extra actions in
>>>>>>> leave_hypervisor_to_guest() if possible.
>>>>>>> But not only there, the logic whether we check/set
>>>>>>> mapcache_invalidation variable could be avoided if a domain doesn't
>>>>>>> use IOREQ server...
>>>>>> Are you OK with this patch (common part of it)?
>>>>> How much of a performance benefit is this? The array is small to simply counting the non-NULL
>>>> entries should be pretty quick.
>>>> I didn't perform performance measurements on how much this call consumes.
>>>> In our system we run three domains. The emulator is in DomD only, so I
>>>> would like to avoid to call vcpu_ioreq_handle_completion() for every
>>>> Dom0/DomU's vCPUs
>>>> if there is no real need to do it.
>>> This is not relevant to the domain that the emulator is running in; it's concerning the domains
>> which the emulator is servicing. How many of those are there?
>> Err, yes, I wasn't precise when providing an example.
>> Single emulator is running in DomD and servicing DomU. So with the
>> helper in place the vcpu_ioreq_handle_completion() gets only called for
>> DomU vCPUs (as expected).
>> Without an optimization the vcpu_ioreq_handle_completion() gets called
>> for _all_ vCPUs, and I see it as an extra action for Dom0, DomD vCPUs.
>>
>>
>>>> On Arm vcpu_ioreq_handle_completion()
>>>> is called with IRQ enabled, so the call is accompanied with
>>>> corresponding irq_enable/irq_disable.
>>>> These unneeded actions could be avoided by using this simple one-line
>>>> helper...
>>>>
>>> The helper may be one line but there is more to the patch than that. I still think you could just
>> walk the array in the helper rather than keeping a running occupancy count.
>>
>> OK, is the implementation below close to what you propose? If yes, I
>> will update a helper and drop nr_servers variable.
>>
>> bool domain_has_ioreq_server(const struct domain *d)
>> {
>>       const struct ioreq_server *s;
>>       unsigned int id;
>>
>>       FOR_EACH_IOREQ_SERVER(d, id, s)
>>           return true;
>>
>>       return false;
>> }
> Yes, that's what I had in mind.
>
>    Paul

Thank you for the clarification.


-- 
Regards,

Oleksandr Tyshchenko


