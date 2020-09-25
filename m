Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2312278961
	for <lists+xen-devel@lfdr.de>; Fri, 25 Sep 2020 15:21:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLnfS-00071Z-Lr; Fri, 25 Sep 2020 13:21:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T0XI=DC=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kLnfR-00071S-7A
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2020 13:21:41 +0000
X-Inumbo-ID: 3395e91d-628c-482d-a706-b971f0adecdf
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3395e91d-628c-482d-a706-b971f0adecdf;
 Fri, 25 Sep 2020 13:05:39 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id b19so2383531lji.11
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2020 06:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=w865fNQ8RYmJ0SCr9ba+q/FMFU6vSSFGGySjxoqb7uQ=;
 b=AuOgsydg018M+Gs07A9rYszGRjP+08vrqxYXdacdSF8uODcUigqtET5zHaX5p0R5ev
 lAwb5LFbYFJ1tQQXOWDF7dVHRQEdpmHoKhYV5sVOkeO8Qzt4b9OFjhU8BFRo72E/h6ub
 AYc9spqMUFe+y55g1AI56Y/BsrSr3iOUL/TaQHY1n91WQINa4mIwH5o75eWDqkREbUWL
 PXVNnZam4QwFR/xinTmsiTLGI4XqxoNJimNP83JHrjZ9XeiaCUMY1U4KIzmW4NYlvhx4
 AYpF8e9vl4gTJiupNuuRYbl7PzVeWVRkS5zjHjhgY7cshlcCcY+xk4Ka6XPkE6shzDXa
 2lFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=w865fNQ8RYmJ0SCr9ba+q/FMFU6vSSFGGySjxoqb7uQ=;
 b=RculYx+eKMYvnn+HKLauQGQJEJmTjl3tPwV1y8slKS+YjBLKVWd6F22HABYxifk19v
 ptikUa8vqp2lOfpKy3QlWFFp0/t8wN9Lkdsmr/ZtqFpQnbE78/QLVyfCjdMkDpIGXnZU
 anFqtT2mTkG/X1tNvgllIv82UKpGcptxYkgNSSgUvpaYWU0Kx3w/VUXAxWugQjLh3RuV
 DUEmWiICcAzvmcMMmLllLk0Pvsn5r6/Wwts4eNguJGXjRcLa9YbwfQ6+w7r9YMvNGoxZ
 Dwj2KGkFhfw+Y+mn9uvsxfi/Gd3h1IVR4q9aT8N+2TpCYEhg34X4Xb3mY6SyVE3XMs6+
 FlKQ==
X-Gm-Message-State: AOAM5303OMQkCuh5qOw2IrXpATEoPF5gxjD54td3ksBc5Lsk/DV5WWBs
 b+tFlKAPhS5qoSQF8I9fVR0=
X-Google-Smtp-Source: ABdhPJyOXtT1l5UEPtrO8UfqTXlzI+qfZ+oTKE6NmjU+nxB47eV7GKIO6ipbxO+ww0ZLwQwi4/m1PQ==
X-Received: by 2002:a05:651c:c8:: with SMTP id 8mr1251136ljr.251.1601039137713; 
 Fri, 25 Sep 2020 06:05:37 -0700 (PDT)
Received: from [192.168.1.6] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id x14sm2231034lfc.93.2020.09.25.06.05.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Sep 2020 06:05:37 -0700 (PDT)
Subject: Re: [PATCH V1 13/16] xen/ioreq: Make x86's invalidate qemu mapcache
 handling common
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
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <47ecdde7-6575-bee8-7981-7b1a31715a0b@gmail.com>
Date: Fri, 25 Sep 2020 16:05:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3abe3988-f1c0-9bbf-1ff9-ce3ae380c825@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 25.09.20 10:03, Jan Beulich wrote:

Hi Jan.

> On 24.09.2020 18:45, Oleksandr wrote:
>> On 24.09.20 14:16, Jan Beulich wrote:
>>
>> Hi Jan
>>
>>> On 22.09.2020 21:32, Oleksandr wrote:
>>>> On 16.09.20 11:50, Jan Beulich wrote:
>>>>> On 10.09.2020 22:22, Oleksandr Tyshchenko wrote:
>>>>>> --- a/xen/common/memory.c
>>>>>> +++ b/xen/common/memory.c
>>>>>> @@ -1651,6 +1651,11 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>>>>             break;
>>>>>>         }
>>>>>>     
>>>>>> +#ifdef CONFIG_IOREQ_SERVER
>>>>>> +    if ( op == XENMEM_decrease_reservation )
>>>>>> +        curr_d->qemu_mapcache_invalidate = true;
>>>>>> +#endif
>>>>> I don't see why you put this right into decrease_reservation(). This
>>>>> isn't just to avoid the extra conditional, but first and foremost to
>>>>> avoid bypassing the earlier return from the function (in the case of
>>>>> preemption). In the context of this I wonder whether the ordering of
>>>>> operations in hvm_hypercall() is actually correct.
>>>> Good point, indeed we may return earlier in case of preemption, I missed
>>>> that.
>>>> Will move it to decrease_reservation(). But, we may return even earlier
>>>> in case of error...
>>>> Now I am wondering should we move it to the very beginning of command
>>>> processing or not?
>>> In _this_ series I'd strongly recommend you keep things working as
>>> they are. If independently you think you've found a reason to
>>> re-order certain operations, then feel free to send a patch with
>>> suitable justification.
>> Of course, I will try to retain current behavior.
>>
>>
>>>>> I'm also unconvinced curr_d is the right domain in all cases here;
>>>>> while this may be a pre-existing issue in principle, I'm afraid it
>>>>> gets more pronounced by the logic getting moved to common code.
>>>> Sorry I didn't get your concern here.
>>> Well, you need to be concerned whose qemu_mapcache_invalidate flag
>>> you set.
>> May I ask, in what cases the *curr_d* is the right domain?
> When a domain does a decrease-reservation on itself. I thought
> that's obvious. But perhaps your question was rather meant a to
> whether a->domain ever is _not_ the right one?
No, my question was about *curr_d*. I saw your answer
 > I'm also unconvinced curr_d is the right domain in all cases here;
and just wanted to clarify these cases. Sorry if I was unclear.


>
>> We need to make sure that domain is using IOREQ server(s) at least.
>> Hopefully, we have a helper for this
>> which is hvm_domain_has_ioreq_server(). Please clarify, anything else I
>> should taking care of?
> Nothing I can recall / think of right now, except that the change
> may want to come under a different title and with a different
> description.As indicated, I don't think this is correct for PVH
> Dom0 issuing the request against a HVM DomU, and addressing this
> will likely want this moved out of hvm_memory_op() anyway. Of
> course an option is to split this into two patches - the proposed
> bug fix (perhaps wanting backporting) and then the moving of the
> field out of arch.hvm. If you feel uneasy about the bug fix part,
> let me know and I (or maybe Roger) will see to put together a
> patch.

Thank you for the clarification.

Yes, it would be really nice if you (or maybe Roger) could create a 
patch for the bug fix part.

-- 
Regards,

Oleksandr Tyshchenko


