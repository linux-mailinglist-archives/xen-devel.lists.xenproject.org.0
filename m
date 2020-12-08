Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 409192D3310
	for <lists+xen-devel@lfdr.de>; Tue,  8 Dec 2020 21:17:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47877.84723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmjQ2-000800-9q; Tue, 08 Dec 2020 20:17:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47877.84723; Tue, 08 Dec 2020 20:17:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmjQ2-0007zb-6d; Tue, 08 Dec 2020 20:17:06 +0000
Received: by outflank-mailman (input) for mailman id 47877;
 Tue, 08 Dec 2020 20:17:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KXXm=FM=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kmjQ0-0007zV-O1
 for xen-devel@lists.xenproject.org; Tue, 08 Dec 2020 20:17:04 +0000
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c0d09c8f-303e-4305-b729-833d2c61df6a;
 Tue, 08 Dec 2020 20:17:03 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id a1so20442708ljq.3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Dec 2020 12:17:03 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id 129sm3313925lfo.43.2020.12.08.12.17.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 12:17:01 -0800 (PST)
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
X-Inumbo-ID: c0d09c8f-303e-4305-b729-833d2c61df6a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=HjN+rS4v9m2c0PQGwpM1swajT+DtylVzRjuh32YTpSg=;
        b=MTvB2lIh+q69m1zntUlL9zABjWhq8rfXDZtLJBr8qp4Ur1saBRsSfkbmc8K4K5eqTI
         q0uHzijYrMZrTfXNCoKbt5YUvLoRsT0YhDHpBSsv+GjjnGp4TyA3tzKlu4/CevwAGQAH
         oVyuoYuy6fJMCzjsDZBlg6DdGMsGKUwv5ZTIgnoWe6kfXhRXHY9SALD4yVBWWqc8L69C
         r8xEwsJWqVK28GNPxixzY76fsC3oyhSW7FEdZqU+/CL5CR9+a/8LVIU/SRl3cmd9VXud
         u8ZTSvSpAAFLkHSlu9psXSUCsRwIPSHtsLfvZphfzkakAldpLV+aGinr2lAkkTQ2Q/9o
         LeOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=HjN+rS4v9m2c0PQGwpM1swajT+DtylVzRjuh32YTpSg=;
        b=FQKa27AZza2vcBM8+QfmwJ7HN7X6/TgnW8v5GmZ3fYWHfNGokivP6HkbFJg/nHsqpf
         rHXDoJjXwLiOxDihk+NZI84QITKPbHeXSThRf0XuYhiYTo3rLWJnumX33vgTVrWVTh7T
         jFsaMrMATllpiua8HluIlwwwIxng/kZYsLUDzuL7mJfG50dT40IT+KE74fb1Y+KtBUKt
         URhU14ehzWax7voMfoWH80O+5I3DP1VANb3D3W1SsfJSjNzpRH+KvL6YggM0Td4gREjr
         rJ6tW6RSNZrxFpGAUKkHkaWAotpGMGpKQ1NaBBp3Tg6DZpjtHJ89giOAey3wwjmrX7r4
         DWlw==
X-Gm-Message-State: AOAM530cY5stEUq3ratKCmgPKyT61XOn0BqQPijBDYalZ5DGQj6+c00G
	mg+bYrzyT78szOWmPgTwpkhJ69wWAWW8yQ==
X-Google-Smtp-Source: ABdhPJzbpxEywi/5uHMqUt1RniGQlNgWxGgbf+PuWG/YPxAxEUjeMoaGAzdgeDceVIJeHUeIKLOoLQ==
X-Received: by 2002:a2e:58f:: with SMTP id 137mr1647786ljf.469.1607458622449;
        Tue, 08 Dec 2020 12:17:02 -0800 (PST)
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
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <57bfc007-e400-6777-0075-827daa8acf0e@gmail.com>
Date: Tue, 8 Dec 2020 22:16:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0d6c01d6cd9a$666326c0$33297440$@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 08.12.20 21:43, Paul Durrant wrote:

Hi Paul

>> -----Original Message-----
>> From: Oleksandr <olekstysh@gmail.com>
>> Sent: 08 December 2020 16:57
>> To: Paul Durrant <paul@xen.org>
>> Cc: Jan Beulich <jbeulich@suse.com>; Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; Stefano
>> Stabellini <sstabellini@kernel.org>; Julien Grall <julien@xen.org>; Volodymyr Babchuk
>> <Volodymyr_Babchuk@epam.com>; Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap
>> <george.dunlap@citrix.com>; Ian Jackson <iwj@xenproject.org>; Wei Liu <wl@xen.org>; Julien Grall
>> <julien.grall@arm.com>; xen-devel@lists.xenproject.org
>> Subject: Re: [PATCH V3 17/23] xen/ioreq: Introduce domain_has_ioreq_server()
>>
>>
>> Hi Paul.
>>
>>
>> On 08.12.20 17:33, Oleksandr wrote:
>>> On 08.12.20 17:11, Jan Beulich wrote:
>>>
>>> Hi Jan
>>>
>>>> On 30.11.2020 11:31, Oleksandr Tyshchenko wrote:
>>>>> --- a/xen/include/xen/ioreq.h
>>>>> +++ b/xen/include/xen/ioreq.h
>>>>> @@ -55,6 +55,20 @@ struct ioreq_server {
>>>>>        uint8_t                bufioreq_handling;
>>>>>    };
>>>>>    +/*
>>>>> + * This should only be used when d == current->domain and it's not
>>>>> paused,
>>>> Is the "not paused" part really relevant here? Besides it being rare
>>>> that the current domain would be paused (if so, it's in the process
>>>> of having all its vCPU-s scheduled out), does this matter at all?do
>>>> any extra actionsdo any extra actions
>>> No, it isn't relevant, I will drop it.
>>>
>>>
>>>> Apart from this the patch looks okay to me, but I'm not sure it
>>>> addresses Paul's concerns. Iirc he had suggested to switch back to
>>>> a list if doing a swipe over the entire array is too expensive in
>>>> this specific case.
>>> We would like to avoid to do any extra actions in
>>> leave_hypervisor_to_guest() if possible.
>>> But not only there, the logic whether we check/set
>>> mapcache_invalidation variable could be avoided if a domain doesn't
>>> use IOREQ server...
>>
>> Are you OK with this patch (common part of it)?
> How much of a performance benefit is this? The array is small to simply counting the non-NULL entries should be pretty quick.
I didn't perform performance measurements on how much this call consumes.
In our system we run three domains. The emulator is in DomD only, so I 
would like to avoid to call vcpu_ioreq_handle_completion() for every 
Dom0/DomU's vCPUs
if there is no real need to do it. On Arm vcpu_ioreq_handle_completion() 
is called with IRQ enabled, so the call is accompanied with 
corresponding irq_enable/irq_disable.
These unneeded actions could be avoided by using this simple one-line 
helper...


-- 
Regards,

Oleksandr Tyshchenko


