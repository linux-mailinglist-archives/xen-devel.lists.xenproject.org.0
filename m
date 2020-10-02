Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF0628102C
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 11:56:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1796.5498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOHnA-0000kw-I4; Fri, 02 Oct 2020 09:55:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1796.5498; Fri, 02 Oct 2020 09:55:56 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOHnA-0000kW-FA; Fri, 02 Oct 2020 09:55:56 +0000
Received: by outflank-mailman (input) for mailman id 1796;
 Fri, 02 Oct 2020 09:55:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=igfv=DJ=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kOHn9-0000kP-1U
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 09:55:55 +0000
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d70a517e-a9a3-4481-aa9a-d373a94371de;
 Fri, 02 Oct 2020 09:55:53 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id z17so1105004lfi.12
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2020 02:55:53 -0700 (PDT)
Received: from [192.168.1.6] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id q6sm163532ljg.115.2020.10.02.02.55.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Oct 2020 02:55:51 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=igfv=DJ=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kOHn9-0000kP-1U
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 09:55:55 +0000
X-Inumbo-ID: d70a517e-a9a3-4481-aa9a-d373a94371de
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d70a517e-a9a3-4481-aa9a-d373a94371de;
	Fri, 02 Oct 2020 09:55:53 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id z17so1105004lfi.12
        for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2020 02:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=jilqFGMThcEMVY+QoTbmMwbZGFodYU3r0tziQEitg7c=;
        b=Jgx/LFTUryIDqsSVmlrq6amZbBqsQ7ZcC3ICyyH0LNxFyDJZfocuWyNHjthmj05Lcu
         jD8nDHK/sIHHFSQ2DJzsx70bs9YAkkWHZGQ7CU7BWHQ+H92bBH5PlUv8mSblH2jbhwbA
         7hBNbLy/ZuVh8Uqa8S0jqlvXKlr2XKtARFs+HFwGO9l5xzx6ufMfo0igr7FLIgvELIVC
         zliPnuIUjGfhfVoaxAWrTLFWLRLZPs5go8ilXJAilXpA71pHIjtoqeluk4avq0/GqNs5
         JfzTMCPNwGJ/roC990kMmiGmF/2105ANm+biYNawPGYp9zgrzbj70x8EYOIuVMlTN2tY
         KYQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=jilqFGMThcEMVY+QoTbmMwbZGFodYU3r0tziQEitg7c=;
        b=RPdBZ+wRd8lWogiUmVx1YirmNpHFzrzzGD8IddWxj32fqCFSUKRMayl03pZmI2pd5y
         XYbSTA70TWdyl1dEd9z9t+ZoqqNovztUvk1v+oIQpd8gZ6EJMz6dc5S45m56EfM0cfBx
         V/xk7EQCDtPmT4uEzyPAcL0pEc6yVtMo27jyH1jfXe+rZuUetkVwwTmoIywwikX9XN//
         qqCIMiwWTo9CfgMmKm1RozRDUCQVG1e9xlNRynRI7q5BzZ/HUA8rNvzauAiHZtXY+DNd
         EniBnuEOizQcGzzXk6dPVjBEeEnuIPM5yz30PIN1Gy+YY99mOAExzONSsIcWZxhleiXU
         WJSw==
X-Gm-Message-State: AOAM532i8hB7H0pRW8UMf7ah7ERwm1pis+cOGZIH0FJ2Tk4OucGYf2Fi
	4aZl/KDgLEbEeD6Cf+v4UeY=
X-Google-Smtp-Source: ABdhPJzmENOXsRROnhmjYAw3jX8ve5Y6KPzHhLxRv/1mI9AiFzz5icjkThsRPNfgtyNAEMsd8jFyzA==
X-Received: by 2002:a19:7006:: with SMTP id h6mr514725lfc.83.1601632552090;
        Fri, 02 Oct 2020 02:55:52 -0700 (PDT)
Received: from [192.168.1.6] ([212.22.223.21])
        by smtp.gmail.com with ESMTPSA id q6sm163532ljg.115.2020.10.02.02.55.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2020 02:55:51 -0700 (PDT)
Subject: Re: [PATCH V1 13/16] xen/ioreq: Make x86's invalidate qemu mapcache
 handling common
From: Oleksandr <olekstysh@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-14-git-send-email-olekstysh@gmail.com>
 <83dfb207-c191-8dad-1474-ce57b6d51102@suse.com>
 <2cab3ca5-0f2b-a813-099f-95bbf54bb9c8@gmail.com>
 <17f1c7d2-7a84-a6a5-4afb-f82e67bc9fd0@suse.com>
 <0fa6a31c-8da6-2a0a-b110-a697f4955702@gmail.com>
 <3abe3988-f1c0-9bbf-1ff9-ce3ae380c825@suse.com>
 <47ecdde7-6575-bee8-7981-7b1a31715a0b@gmail.com>
Message-ID: <0aa9a225-1231-fa98-f2a1-caf898a3ed86@gmail.com>
Date: Fri, 2 Oct 2020 12:55:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <47ecdde7-6575-bee8-7981-7b1a31715a0b@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


Hi Jan


On 25.09.20 16:05, Oleksandr wrote:
>
> On 25.09.20 10:03, Jan Beulich wrote:
>
> Hi Jan.
>
>> On 24.09.2020 18:45, Oleksandr wrote:
>>> On 24.09.20 14:16, Jan Beulich wrote:
>>>
>>> Hi Jan
>>>
>>>> On 22.09.2020 21:32, Oleksandr wrote:
>>>>> On 16.09.20 11:50, Jan Beulich wrote:
>>>>>> On 10.09.2020 22:22, Oleksandr Tyshchenko wrote:
>>>>>>> --- a/xen/common/memory.c
>>>>>>> +++ b/xen/common/memory.c
>>>>>>> @@ -1651,6 +1651,11 @@ long do_memory_op(unsigned long cmd, 
>>>>>>> XEN_GUEST_HANDLE_PARAM(void) arg)
>>>>>>>             break;
>>>>>>>         }
>>>>>>>     +#ifdef CONFIG_IOREQ_SERVER
>>>>>>> +    if ( op == XENMEM_decrease_reservation )
>>>>>>> +        curr_d->qemu_mapcache_invalidate = true;
>>>>>>> +#endif
>>>>>> I don't see why you put this right into decrease_reservation(). This
>>>>>> isn't just to avoid the extra conditional, but first and foremost to
>>>>>> avoid bypassing the earlier return from the function (in the case of
>>>>>> preemption). In the context of this I wonder whether the ordering of
>>>>>> operations in hvm_hypercall() is actually correct.
>>>>> Good point, indeed we may return earlier in case of preemption, I 
>>>>> missed
>>>>> that.
>>>>> Will move it to decrease_reservation(). But, we may return even 
>>>>> earlier
>>>>> in case of error...
>>>>> Now I am wondering should we move it to the very beginning of command
>>>>> processing or not?
>>>> In _this_ series I'd strongly recommend you keep things working as
>>>> they are. If independently you think you've found a reason to
>>>> re-order certain operations, then feel free to send a patch with
>>>> suitable justification.
>>> Of course, I will try to retain current behavior.
>>>
>>>
>>>>>> I'm also unconvinced curr_d is the right domain in all cases here;
>>>>>> while this may be a pre-existing issue in principle, I'm afraid it
>>>>>> gets more pronounced by the logic getting moved to common code.
>>>>> Sorry I didn't get your concern here.
>>>> Well, you need to be concerned whose qemu_mapcache_invalidate flag
>>>> you set.
>>> May I ask, in what cases the *curr_d* is the right domain?
>> When a domain does a decrease-reservation on itself. I thought
>> that's obvious. But perhaps your question was rather meant a to
>> whether a->domain ever is _not_ the right one?
> No, my question was about *curr_d*. I saw your answer
> > I'm also unconvinced curr_d is the right domain in all cases here;
> and just wanted to clarify these cases. Sorry if I was unclear.
>
>
>>
>>> We need to make sure that domain is using IOREQ server(s) at least.
>>> Hopefully, we have a helper for this
>>> which is hvm_domain_has_ioreq_server(). Please clarify, anything else I
>>> should taking care of?
>> Nothing I can recall / think of right now, except that the change
>> may want to come under a different title and with a different
>> description.As indicated, I don't think this is correct for PVH
>> Dom0 issuing the request against a HVM DomU, and addressing this
>> will likely want this moved out of hvm_memory_op() anyway. Of
>> course an option is to split this into two patches - the proposed
>> bug fix (perhaps wanting backporting) and then the moving of the
>> field out of arch.hvm. If you feel uneasy about the bug fix part,
>> let me know and I (or maybe Roger) will see to put together a
>> patch.
>
> Thank you for the clarification.
>
> Yes, it would be really nice if you (or maybe Roger) could create a 
> patch for the bug fix part.


Thank you for your patch [1].

If I got it correctly there won't be a suitable common place where to 
set qemu_mapcache_invalidate flag anymore
as XENMEM_decrease_reservation is not a single place we need to make a 
decision whether to set it
By principle of analogy, on Arm we probably want to do so in 
guest_physmap_remove_page (or maybe better in p2m_remove_mapping).
Julien, what do you think?


I will modify current patch to not alter the common code.


[1] https://patchwork.kernel.org/patch/11803383/

-- 

Regards,

Oleksandr Tyshchenko


