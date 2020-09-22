Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FB927477E
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 19:30:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKm7r-0002Lj-SC; Tue, 22 Sep 2020 17:30:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cWTz=C7=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kKm7p-0002Ks-Qr
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 17:30:45 +0000
X-Inumbo-ID: 6ee42aa8-8a60-42aa-a2e3-d6f85eee38e1
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6ee42aa8-8a60-42aa-a2e3-d6f85eee38e1;
 Tue, 22 Sep 2020 17:30:44 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id z19so18958666lfr.4
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2020 10:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=6PZcaEAwgSjtUHG7xbibO6XM9VzE0oaihV0BOI1nbk4=;
 b=KN54tF4mXYrH7EJ4bZeKKycFkbOhgBD1AbWu0B/85LBczuwG8xF3zgcdPvOFxRVOl8
 Po+uGxvMjSFZIuh7fGvN/ebFrg/ybCrQ4QI3nM/Vy+42FphaZofq9ejpU4HRUy59pRQ/
 5QhZ2oW2/ocnj1VdG45bFJfLoT0rlU0U+dHd/I1zHqLmBPqJ45O6v/u+/iBCVCYsyg0X
 mmBKUjB7OdNWYy9PsNAM+p1RCoFNPSkEPAnurLCGL6/vntr3Kghj57aj8U46trLQofe5
 KMvTo3SJdgBbd1LVerkrGcf9yJPI7KC4gpzusD2SPDJezrap2BEAUcxupXmIslisGD6u
 8pcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=6PZcaEAwgSjtUHG7xbibO6XM9VzE0oaihV0BOI1nbk4=;
 b=HL5CjLkk4RyNoxsfkeSjtArphXopXjroZkeJHprvW8Fdp28kByRqj5DZIYDVqZYFYQ
 ZT5B3V1pD8pTmxH4pWRt5fip4+PdaqK0cg5eWHZcAu1+sdO84d5bepE29AiJaHt+OWIB
 PRvT7yfnNEHgfz0HwchEKRioQX7rousqBerIZSNo0ArXAMbwup2z/Yvfr1D+vk+exIsJ
 ZufrQl3PAsyupxRR8OwmsID/TliKn2YwDzm4sEKIm7noO4dSw2W+3a9VhmWcbNRu910w
 E5b4E+HyHpZOzgIz+6U4L/oG6jDnXsQzbaysQCfwmhp649X9ell6tsSJVtBTaXz0XlGI
 nUAA==
X-Gm-Message-State: AOAM533X/aohQZFfXGY2X1M9V6W6BYIwAcgTaHmhzQO6bQMsaoi46OyG
 y+ZD9Y7XRLfUY+51uunHO8o=
X-Google-Smtp-Source: ABdhPJyxUe1LxHNpv76Mw0R3dwdzvQn88XS38YT/Up3vNVMO83OG8l9ykMLMpHW5khxqO89XjGDNrQ==
X-Received: by 2002:a19:ed6:: with SMTP id 205mr1967427lfo.454.1600795843157; 
 Tue, 22 Sep 2020 10:30:43 -0700 (PDT)
Received: from [192.168.1.6] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id z7sm3672147lfc.59.2020.09.22.10.30.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2020 10:30:42 -0700 (PDT)
Subject: Re: [PATCH V1 10/16] xen/mm: Handle properly reference in
 set_foreign_p2m_entry() on Arm
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-11-git-send-email-olekstysh@gmail.com>
 <110c648d-581c-fd42-5180-7d32653227af@suse.com>
 <2560b3ad-bd22-af01-29a9-64a2733e568b@xen.org>
 <9d68bae6-455c-3def-b4f8-12bc25882929@suse.com>
 <62e56b1e-3a44-8563-84bc-31d39b9cf09f@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <5629c414-3d7d-4122-7825-30a9fac34164@gmail.com>
Date: Tue, 22 Sep 2020 20:30:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <62e56b1e-3a44-8563-84bc-31d39b9cf09f@xen.org>
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


On 16.09.20 11:55, Julien Grall wrote:

Hi Julien, Jan

>
>
> On 16/09/2020 09:52, Jan Beulich wrote:
>> On 16.09.2020 10:50, Julien Grall wrote:
>>> On 16/09/2020 08:17, Jan Beulich wrote:
>>>> On 10.09.2020 22:22, Oleksandr Tyshchenko wrote:
>>>>>            for ( i = 0; !rc && i < xmar.nr_frames; i++ )
>>>>>            {
>>>>> -            rc = set_foreign_p2m_entry(currd, gfn_list[i],
>>>>> +            rc = set_foreign_p2m_entry(currd, d, gfn_list[i],
>>>>> _mfn(mfn_list[i]));
>>>>
>>>> Is it going to lead to proper behavior when d == currd, specifically
>>>> for Arm but also in the abstract model? If you expose this to other
>>>> than Dom0, this case needs at least considering (and hence mentioning
>>>> in the description of why it's safe to permit if you don't reject
>>>> such attempts).
>>>
>>> This is already rejected by rcu_lock_remote_domain_by_id().
>>
>> Oh, yes, I'm sorry for overlooking this.
>
> That's fine, I also overlooked it when I originally wrote the code.
>
> @oleksandr, it might be worth mentioning in the commit message and 
> maybe in the code this subtlety.

Yes, will do.

Also the following will be taken into the account:

1. Implement arch_refcounts_p2m()
2. Move function declaration to xen/p2m-common.h
3. Add const to new parameter


-- 
Regards,

Oleksandr Tyshchenko


