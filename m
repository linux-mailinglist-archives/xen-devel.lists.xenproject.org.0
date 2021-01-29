Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD883308859
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 12:38:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78041.141780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5S6Q-0007BK-Oe; Fri, 29 Jan 2021 11:38:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78041.141780; Fri, 29 Jan 2021 11:38:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5S6Q-0007Av-LJ; Fri, 29 Jan 2021 11:38:14 +0000
Received: by outflank-mailman (input) for mailman id 78041;
 Fri, 29 Jan 2021 11:38:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AjHm=HA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l5S6P-0007Aq-J7
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 11:38:13 +0000
Received: from mail-lf1-x12b.google.com (unknown [2a00:1450:4864:20::12b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1085ce3d-7b63-4680-8ac0-ff532f66fc96;
 Fri, 29 Jan 2021 11:38:12 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id p21so12030039lfu.11
 for <xen-devel@lists.xenproject.org>; Fri, 29 Jan 2021 03:38:12 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id a25sm2502114ljp.21.2021.01.29.03.37.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jan 2021 03:37:57 -0800 (PST)
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
X-Inumbo-ID: 1085ce3d-7b63-4680-8ac0-ff532f66fc96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=JP9vAtFwav9wZKxmK+xNEr6QDgHky60gsmNwvbKAS8k=;
        b=mT/w5xn9nfh6wrwj13XtNbmbpDRGxBU4exogczY5lDFxJ0x3uSCZLkYfBTLKJiLQxF
         YGsjZzQOneoDxmESDxDdlpByz8boEC7ffV4JPcSVy5LpPbhSgwUNdhG2ciO0J04ue8PP
         W3yuuRnTnqLXmHlZMeQOs+eKYHe0e6tjIr051vtGP9GZiVRJsqyyw8SnGWkGhx4WB/iZ
         eJ0WjBRAuP1wjybfq35Z+draNXYOZfLRIAtACy+36ixzhyHCZHSy0D50UMVVF3vBFKKb
         lLGP3hkclxhNmT622ZEhSELa1gPZzRxYVTgClZQCvlk8G6zPIdPIgo/WgJSBh/5J6JK7
         JmMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=JP9vAtFwav9wZKxmK+xNEr6QDgHky60gsmNwvbKAS8k=;
        b=m45EfKM10UCZQFIO6RjKh1VtTaMFVfouZsxMaScFJJiTupHPO1ho2gHU3G+GRq0VmY
         d/6CC6wnAEkaArzfaWYmVlgUoajSez5JvYTZwAD88QPgmZ9cB16GiXfxdUfvQUUDe00F
         exB1Nkd+oeP1U4D6kdw9fNsEHB2hGCXPKDiV1X7JNTw+xZhUsMH7F+1/ff45PFyBslZc
         SLOTMUFwd52tG5sPnj2HQTSWYtdr0E7b7CxQv9iBspNYNDkXq0qhG5VnP7c6MT6sol5+
         eJAVCOo63HbN0g6LR6eguyLdW4qch6CnbaHFDXkyqm+fCTyTCEIaBeGHbMNTfYUGjl1h
         M38A==
X-Gm-Message-State: AOAM5306xvrjzS0DBb4MphIUVGHCL4MaY84FtNB5pzd2g+f1uQ9WDWRd
	Ob5K1ylg9hELGTtkU1mYcEI74Q5lOSzVXg==
X-Google-Smtp-Source: ABdhPJy7EHBJBLbwGbsVQWAelSjhx47faKBQwSjATtoczqSSvq7kblhowsoB3F+pi2ukkJE4AakD1Q==
X-Received: by 2002:a05:6512:4c9:: with SMTP id w9mr1890026lfq.437.1611920291193;
        Fri, 29 Jan 2021 03:38:11 -0800 (PST)
Subject: Re: [PATCH V6 24/24] xen/ioreq: Make the IOREQ feature selectable on
 Arm
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>
 <1611884932-1851-25-git-send-email-olekstysh@gmail.com>
 <2d98fd45-a88a-a198-a42d-393a713e1d54@xen.org>
 <433f8d5c-f66f-874e-e08e-83427f9f2a29@suse.com>
 <3fb55faa-8d05-cb8f-f567-4e099347b3e6@gmail.com>
 <e9e9eabc-3925-c402-b7e2-1412b5b6ca8a@suse.com>
 <63d005ce-0993-e604-7b06-fc6603995152@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <4da02c52-1866-6eaa-415b-ddd374edc9d9@gmail.com>
Date: Fri, 29 Jan 2021 13:37:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <63d005ce-0993-e604-7b06-fc6603995152@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 29.01.21 13:26, Julien Grall wrote:

Hi all

>
>
> On 29/01/2021 11:25, Jan Beulich wrote:
>> On 29.01.2021 12:19, Oleksandr wrote:
>>>
>>> On 29.01.21 12:06, Jan Beulich wrote:
>>>
>>> Hi Jan, Julien
>>>
>>>> On 29.01.2021 10:55, Julien Grall wrote:
>>>>>> --- a/xen/common/Kconfig
>>>>>> +++ b/xen/common/Kconfig
>>>>>> @@ -137,7 +137,13 @@ config HYPFS_CONFIG
>>>>>>           want to hide the .config contents from dom0.
>>>>>>         config IOREQ_SERVER
>>>>>> -    bool
>>>>>> +    bool "IOREQ support (EXPERT)" if EXPERT && !X86
>>>>>> +    default X86
>>>>>> +    depends on HVM
>>>>> AFAICT, CONFIG_HVM will already select CONFIG_IOREQ_SERVER. So are 
>>>>> the
>>>>> two lines necessary?
>>>> I agree they may not be necessary, but as long as they don't
>>>> cause any harm I thought maybe they serve a documentation
>>>> purpose.
>>> 1. Agree that it should be "If unsure, say N."
>>
>> Faod this could be taken care of while committing.
>>
>>> 2. Agree that two lines are not strictly needed (just rechecked).
>>> 3. Agree that two lines indicates the *real* state:
>>> - Although we managed to remove almost all (all?) HVM-ism in IOREQ
>>> common code, this feature depends on HVM anyway
>>> - And it is should enabled by default on X86, and disabled on Arm
>>>
>>> So what we should do with them (keep or remove)?
>>
>> I'd be fine either way, with just a slight preference to keeping.
>> Julien?
>
> I find a bit strange, but I am happy to keep it.
>
> Acked-by: Julien Grall <jgrall@amazon.com>

Thanks to both of you!

I am wondering do we need to update support.md in the context of IOREQ 
status on Arm right now or this could be postponed?


-- 
Regards,

Oleksandr Tyshchenko


