Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8505F2749CD
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 22:06:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKoXt-0002z2-5t; Tue, 22 Sep 2020 20:05:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cWTz=C7=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kKoXr-0002yj-5C
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 20:05:47 +0000
X-Inumbo-ID: 60337a7f-d9e4-4532-b17f-98435d0be62c
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 60337a7f-d9e4-4532-b17f-98435d0be62c;
 Tue, 22 Sep 2020 20:05:45 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id c2so15201527ljj.12
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2020 13:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=3JPDcZzk6uJCJuEGkOJaVAXdGyJiNhAEoEu9izRRyJ8=;
 b=e7YsSuXQICt0NIk08uc9Fn2C88gPBRVPqlAbIFNxk1kSdHmlXRp7wpvRajgj0c1dnD
 xNpqFCrSNV8uvOMSunpDrQCX8rwNx71QHZbOMgRpVv97+9OS/GSz4umTTladFv0dOvij
 6pyHZhQWVrRJO3B04NRjdG+hKZDkSB3KmvElWojBfhflVEQ1BQzRCtn/CvlOtthRpN+0
 Zkx1NqR6GiCtBP0KYa7YIEwJzTiym7qXXAQKSsyOkGvWAzUdteljIyEPHRuUG2a9VL6E
 gnpz8VZph5JSJBR2MrS/nSt7qu6f8b9NwFPmE/Re9SFTOd5V3fXl1KapVeBXsDblhc/L
 NoBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=3JPDcZzk6uJCJuEGkOJaVAXdGyJiNhAEoEu9izRRyJ8=;
 b=UuaYYqrFOr1suPHngQp90C+RlGHwMg7N4dEkrSGURXhhDko1luic8DDJtZqlsmNlIQ
 4kBA7Nb/Qf9SSyEC2SFVqQ8tO1oB/y7j8Py8Ogpo2Y6xcXW6FT4XIreR+Ut+lpB3A3/M
 hbPcYGV+nhgtcINnVmaS1ptj1ZsCxpg0/glm0LtvgCHo/hXhHWGPUtfOjv0/29kioGUM
 5+B54Oh9Gp6tVvpGfcvkTzuG+vNmn0wdEYwjSjIaSViINOWwghUdUUVIrusoL9YLH8qa
 o/3AlBZ5Nx2c7xqdWkKPSI38StRM2zJnS+bf2l1Eb97ckD2U64AfJ0RFnpvnQHCD75v1
 LKyg==
X-Gm-Message-State: AOAM532uqxw4i27UpSxWAWb42mrhz3dZgXUfI1ECfgksi0kdoFEqTqIb
 6I98e877OXGVvrfeSVsj5Oc=
X-Google-Smtp-Source: ABdhPJy5Ts+NVaCigFJzSeyEffugGfXqV4M5zEPNCkP18A17XJIxJtA3nZGT0PMq6EmDcqshqBKMDA==
X-Received: by 2002:a2e:99cb:: with SMTP id l11mr2026373ljj.123.1600805144442; 
 Tue, 22 Sep 2020 13:05:44 -0700 (PDT)
Received: from [192.168.1.6] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id b197sm3830782lfd.251.2020.09.22.13.05.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2020 13:05:43 -0700 (PDT)
Subject: Re: [PATCH V1 14/16] xen/ioreq: Use guest_cmpxchg64() instead of
 cmpxchg()
To: Julien Grall <julien@xen.org>, paul@xen.org,
 'Jan Beulich' <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <jgrall@amazon.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-15-git-send-email-olekstysh@gmail.com>
 <44b19ee1-dc34-3a46-0b4b-7196faadcb5c@suse.com>
 <c87089d5-39d2-55e6-5539-97af32c3d6cd@xen.org>
 <002b01d68c09$12df32a0$389d97e0$@xen.org>
 <b43a814a-3788-010e-768b-75211748b05c@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <3e58dc8a-4ecb-1ed5-3179-82f96cc40ca7@gmail.com>
Date: Tue, 22 Sep 2020 23:05:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b43a814a-3788-010e-768b-75211748b05c@xen.org>
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


On 16.09.20 12:12, Julien Grall wrote:

Hi all.

>
>
> On 16/09/2020 10:09, Paul Durrant wrote:
>>> -----Original Message-----
>>> From: Julien Grall <julien@xen.org>
>>> Sent: 16 September 2020 10:07
>>> To: Jan Beulich <jbeulich@suse.com>; Oleksandr Tyshchenko 
>>> <olekstysh@gmail.com>
>>> Cc: xen-devel@lists.xenproject.org; Oleksandr Tyshchenko 
>>> <oleksandr_tyshchenko@epam.com>; Paul Durrant
>>> <paul@xen.org>; Stefano Stabellini <sstabellini@kernel.org>; Julien 
>>> Grall <jgrall@amazon.com>
>>> Subject: Re: [PATCH V1 14/16] xen/ioreq: Use guest_cmpxchg64() 
>>> instead of cmpxchg()
>>>
>>>
>>>
>>> On 16/09/2020 10:04, Jan Beulich wrote:
>>>> On 10.09.2020 22:22, Oleksandr Tyshchenko wrote:
>>>>> @@ -1325,7 +1327,7 @@ static int hvm_send_buffered_ioreq(struct 
>>>>> hvm_ioreq_server *s, ioreq_t *p)
>>>>>
>>>>>            new.read_pointer = old.read_pointer - n * 
>>>>> IOREQ_BUFFER_SLOT_NUM;
>>>>>            new.write_pointer = old.write_pointer - n * 
>>>>> IOREQ_BUFFER_SLOT_NUM;
>>>>> -        cmpxchg(&pg->ptrs.full, old.full, new.full);
>>>>> +        guest_cmpxchg64(d, &pg->ptrs.full, old.full, new.full);
>>>>
>>>> But the memory we're updating is shared with s->emulator, not with d,
>>>> if I'm not mistaken.
>>>
>>> It is unfortunately shared with both s->emulator and d when using the
>>> legacy interface.
>>
>> When using magic pages they should be punched out of the P2M by the 
>> time the code gets here, so the memory should not be guest-visible.
>
> Can you point me to the code that doing this?
>
> Cheers,
>
If we are not going to use legacy interface on Arm we will have a page 
to be mapped in a single domain at the time.

I will update patch to use "s->emulator" if no objections.


-- 
Regards,

Oleksandr Tyshchenko


