Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D174424690D
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 17:07:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7gj9-0001s9-Q2; Mon, 17 Aug 2020 15:07:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EDHT=B3=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1k7gj8-0001s2-Mj
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 15:07:10 +0000
X-Inumbo-ID: 73d57f06-bd6e-4c5d-a438-81a6bf4720d6
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 73d57f06-bd6e-4c5d-a438-81a6bf4720d6;
 Mon, 17 Aug 2020 15:07:09 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id b30so8531833lfj.12
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2020 08:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=V+5/d/ZQWPakGrpuamUUpx382oO1V+iKKtl5F+a3kuE=;
 b=UwTWn+DjpGqss9/XO5QsZkmjb/x/+h7HCUmL2sVbhF7/cos19+o+VSC7LVIaQk8HBQ
 hbu3j3o8gtWsoD+U4TCk7MqKINRwmSQPTOg5MpgX09Ko2EcgJdZ9EIxc30FD3Dgv3xAQ
 UlQ5QXS2YEEGKw84iMpHUmZbPLEmFqC8TAx5w62whrkjpQVEI93VFl3LjgEoEMKylnRc
 TyG9BgtOGjDc0qBBbCtBUusI/zCBVYJatY8kW7SrqYTyNE0Y8Sd/eIjP4b4UZlCigLQx
 oONP4PJ77s1pzDrR87B4tGTKXtvpQbdoljNPLzYlVhQtLyOez+PokiJTItQ8i2rPbEcb
 CDyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=V+5/d/ZQWPakGrpuamUUpx382oO1V+iKKtl5F+a3kuE=;
 b=swwhjUg3a8BUaWCZYD2YDHw+mMWS6M+3W9o2ZL6sr3KwrZPxnb1wWGlbo/8FwNj0ZS
 frwqYy/1IbV7PKWgx7zlB1ntzOdmoK0NYQdF74IXQEzW1RZC7bBXUFj0aP8KDeLth+09
 ivE8Qn0XtEdJ0PVbtLeR9Nf219tuGK3lXh7uQVFnM3SgmIbQjAMCv7+2sOEHm5xy5Q3q
 aBSVAv1LNN0SnA+0DE9bzr2dy0Y8WaqS8ExwpCpfRl2/oMix4eUfPUP/uIU4cRXIM8SU
 gGKVQw6r5EvbjvWNwEI5TsP/k/GdNePh6eaWT/DM1JL9POcwXVwdIteSlO+h5MuoOg0L
 XLWQ==
X-Gm-Message-State: AOAM532gh5tIZTMZsvNFoLw9Hzewsi7ejX42OHuWIamWtrVWLenn+wl6
 0TXXS82SSEgkqdp2gSKHbSQ=
X-Google-Smtp-Source: ABdhPJzBPavcluM+xxuyMh8Eb6A4IV/6Xbn6ffQPK+9x3wPphfuuroVHySANo//9X5A9vbyUcSJGow==
X-Received: by 2002:ac2:46d4:: with SMTP id p20mr7717519lfo.109.1597676828467; 
 Mon, 17 Aug 2020 08:07:08 -0700 (PDT)
Received: from [192.168.1.2] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id i16sm5054017ljn.100.2020.08.17.08.07.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2020 08:07:07 -0700 (PDT)
Subject: Re: [RFC PATCH V1 07/12] A collection of tweaks to be able to run
 emulator in driver domain
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 paul@xen.org, 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 'Daniel De Graaf' <dgdegra@tycho.nsa.gov>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-8-git-send-email-olekstysh@gmail.com>
 <4ffa6434-3ad6-04dc-bfde-f75196930fb4@suse.com>
 <005f01d66b47$1c58ccc0$550a6640$@xen.org>
 <a9a8a3fb-10ad-96f7-651b-9bed46310ba2@gmail.com>
 <e8105d18-338f-bd90-39a2-eb37e37345a7@suse.com>
 <17fbc16e-6db8-66e3-967c-85b652df571a@gmail.com>
 <a6fcc96e-9f28-0934-21b9-4cb655c3467a@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <fde63471-c02c-53bf-e93c-66942eabec97@gmail.com>
Date: Mon, 17 Aug 2020 18:07:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a6fcc96e-9f28-0934-21b9-4cb655c3467a@xen.org>
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


On 16.08.20 18:36, Julien Grall wrote:

Hi Julien.

>
>
> On 14/08/2020 17:30, Oleksandr wrote:
>>
>> Hello all.
>>
>>
>>>>>> -----Original Message-----
>>>>>> From: Jan Beulich <jbeulich@suse.com>
>>>>>> Sent: 05 August 2020 17:20
>>>>>> To: Oleksandr Tyshchenko <olekstysh@gmail.com>; Paul Durrant 
>>>>>> <paul@xen.org>
>>>>>> Cc: xen-devel@lists.xenproject.org; Oleksandr Tyshchenko 
>>>>>> <oleksandr_tyshchenko@epam.com>; Andrew
>>>>>> Cooper <andrew.cooper3@citrix.com>; George Dunlap 
>>>>>> <george.dunlap@citrix.com>; Ian Jackson
>>>>>> <ian.jackson@eu.citrix.com>; Julien Grall <julien@xen.org>; 
>>>>>> Stefano Stabellini
>>>>>> <sstabellini@kernel.org>; Wei Liu <wl@xen.org>; Daniel De Graaf 
>>>>>> <dgdegra@tycho.nsa.gov>
>>>>>> Subject: Re: [RFC PATCH V1 07/12] A collection of tweaks to be 
>>>>>> able to run emulator in driver domain
>>>>>>
>>>>>> On 03.08.2020 20:21, Oleksandr Tyshchenko wrote:
>>>>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>>>>
>>>>>>> Trying to run emulator in driver domain I ran into various issues
>>>>>>> mostly policy-related. So this patch tries to resolve all them
>>>>>>> plobably in a hackish way. I would like to get feedback how
>>>>>>> to implement them properly as having an emulator in driver domain
>>>>>>> is a completely valid use-case.
>>>>>>   From going over the comments I can only derive you want to run
>>>>>> an emulator in a driver domain, which doesn't really make sense
>>>>>> to me. A driver domain has a different purpose after all. If
>>>>>> instead you mean it to be run in just some other domain (which
>>>>>> also isn't the domain controlling the target), then there may
>>>>>> be more infrastructure changes needed.
>>>>>>
>>>>>> Paul - was/is your standalone ioreq server (demu?) able to run
>>>>>> in other than the domain controlling a guest?
>>>>>>
>>>>> Not something I've done yet, but it was always part of the idea so 
>>>>> that we could e.g. pass through a device to a dedicated domain and 
>>>>> then run multiple demu instances there to virtualize it for many 
>>>>> domUs. (I'm thinking here of a device that is not SR-IOV and hence 
>>>>> would need some bespoke emulation code to share it out).That 
>>>>> dedicated domain would be termed the 'driver domain' simply 
>>>>> because it is running the device driver for the h/w that underpins 
>>>>> the emulation.
>>>> I may abuse "driver domain" terminology, but indeed in our use-case we
>>>> pass through a set of H/W devices to a dedicated domain which is 
>>>> running
>>>> the device drivers for that H/Ws. Our target system comprises a thin
>>>> Dom0 (without H/W devices at all), DomD (which owns most of the H/W
>>>> devices) and DomU which runs on virtual devices. This patch tries to
>>>> make changes at Xen side to be able run standalone ioreq server
>>>> (emulator) in that dedicated (driver?) domain.
>>> Okay, in which case I'm fine with the term. I simply wasn't aware of 
>>> the
>>> targeted scenario, sorry.
>>
>>
>> May I kindly ask to suggest me the pointers how to *properly* resolve 
>> various policy related issues described in that patch? Without having 
>> them resolved it wouldn't be able to run standalone IOREQ server in 
>> driver domain.
>
> You could already do that by writing your own XSM policy. Did you 
> explore it? If so, may I ask why this wouldn't be suitable?
>
> Also, I would like to emphasis that because of XSA-295 (Unlimited Arm 
> Atomics Operations), you can only run emulators in trusted domain on Arm.
>
> There would be more work to do if you wanted to run them in 
> non-trusted environment.

Thank you for the explanation. Yes, we consider driver domain as a 
trusted domain, there is no plan to run emulator in non-trusted domains. 
Indeed, it worth trying to write our own policy which will cover our use 
case (with emulator in driver domain) rather than tweak Xen's default one.


-- 
Regards,

Oleksandr Tyshchenko


