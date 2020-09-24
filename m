Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC82A27771F
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 18:46:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLUNY-0001dz-10; Thu, 24 Sep 2020 16:45:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EOGg=DB=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kLUNW-0001du-F5
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 16:45:54 +0000
X-Inumbo-ID: 57ce4b3a-646e-42e4-ab3a-2367a1332f8a
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 57ce4b3a-646e-42e4-ab3a-2367a1332f8a;
 Thu, 24 Sep 2020 16:45:51 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id y2so4633249lfy.10
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2020 09:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=7bBQEWBf7EXtzzMqaKxJ5usVWLa396pg1ewymSVFlj8=;
 b=CBBzkMINP3zuiLbTpmRvmocCVjheTPXTfTaVtwB4b96bcaHqYmXyvbofjh0Vk8ibpu
 gNjXQHpTCH66IQsqqAvmmV8b3sCdkbU+0rTHlqYhmcPeMRZELUF7Xc975OdOb2hOBB+r
 lf8sDUt5TErWDbfP6cJ2Mslu0Yo5nFocrnQ5kpPZLEmQRlQaxdcZd3iIRog3Cd6NKXrF
 cMG4NhGp6DrKHKGxzutFA/r24ifeFBLUgBH82UfXBoUZsxfTl74B9nlTzPueodJGs8f9
 2n2ik1uEsPyo9BJe6EKcuFZxUChTxSm3xgb2KiiMPng/+XboV/h+4EjAp1H7x4n+jYL9
 dq5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=7bBQEWBf7EXtzzMqaKxJ5usVWLa396pg1ewymSVFlj8=;
 b=UqCQPbs/VWjLp3F/DgY5Jm72bCSs4Bsv2XoLK/MC205B7S4BucAP8+uGW5B9bpVn/K
 wGW1o08xB5keI43gyZo80lJZ0I7DpOLTxu86HUVedj27727feWw85PE2oXc0hc34q5Z2
 xc+/kAbUgR46FD4T70UqRn7FC8pUxgycAs5WPd6dn/k7y6LPTBLRUW6yahRtTFHJPTKc
 5hpfDyPePM7TqwVXq52keCM8fJAOAI6veLne6T4CByLQxHeRbqTuG/JewhP1jIQ2nIpc
 JVpfZRLNcdXCzCo49qLQycFPzk0rUNDN3kyAZH13mWHyvTQAodH/EGXAhxWVNtdChqlO
 1C+Q==
X-Gm-Message-State: AOAM533T8s3AViUcg6gMxs9POv1RRL5NdrJ11Mp8SapWpdau75LfZX63
 aVYpG0vxhN/9k1iHeLwBNrY=
X-Google-Smtp-Source: ABdhPJy2FvnU9kxxnkDMFokGM9Ag268tGQZ61rdNh3Ag+v08NlAMS6aTsWUAvvN4RPQtnGr7whdUDA==
X-Received: by 2002:ac2:4d10:: with SMTP id r16mr116068lfi.58.1600965950333;
 Thu, 24 Sep 2020 09:45:50 -0700 (PDT)
Received: from [192.168.1.6] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id g74sm2477264lfd.152.2020.09.24.09.45.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Sep 2020 09:45:49 -0700 (PDT)
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
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <0fa6a31c-8da6-2a0a-b110-a697f4955702@gmail.com>
Date: Thu, 24 Sep 2020 19:45:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <17f1c7d2-7a84-a6a5-4afb-f82e67bc9fd0@suse.com>
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


On 24.09.20 14:16, Jan Beulich wrote:

Hi Jan

> On 22.09.2020 21:32, Oleksandr wrote:
>> On 16.09.20 11:50, Jan Beulich wrote:
>>> On 10.09.2020 22:22, Oleksandr Tyshchenko wrote:
>>>> --- a/xen/common/memory.c
>>>> +++ b/xen/common/memory.c
>>>> @@ -1651,6 +1651,11 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>>            break;
>>>>        }
>>>>    
>>>> +#ifdef CONFIG_IOREQ_SERVER
>>>> +    if ( op == XENMEM_decrease_reservation )
>>>> +        curr_d->qemu_mapcache_invalidate = true;
>>>> +#endif
>>> I don't see why you put this right into decrease_reservation(). This
>>> isn't just to avoid the extra conditional, but first and foremost to
>>> avoid bypassing the earlier return from the function (in the case of
>>> preemption). In the context of this I wonder whether the ordering of
>>> operations in hvm_hypercall() is actually correct.
>> Good point, indeed we may return earlier in case of preemption, I missed
>> that.
>> Will move it to decrease_reservation(). But, we may return even earlier
>> in case of error...
>> Now I am wondering should we move it to the very beginning of command
>> processing or not?
> In _this_ series I'd strongly recommend you keep things working as
> they are. If independently you think you've found a reason to
> re-order certain operations, then feel free to send a patch with
> suitable justification.

Of course, I will try to retain current behavior.


>>> I'm also unconvinced curr_d is the right domain in all cases here;
>>> while this may be a pre-existing issue in principle, I'm afraid it
>>> gets more pronounced by the logic getting moved to common code.
>> Sorry I didn't get your concern here.
> Well, you need to be concerned whose qemu_mapcache_invalidate flag
> you set.
May I ask, in what cases the *curr_d* is the right domain?

We need to make sure that domain is using IOREQ server(s) at least. 
Hopefully, we have a helper for this
which is hvm_domain_has_ioreq_server(). Please clarify, anything else I 
should taking care of?


-- 
Regards,

Oleksandr Tyshchenko


