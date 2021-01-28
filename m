Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FC1307EC4
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 20:44:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77435.140232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5DD8-00020n-D5; Thu, 28 Jan 2021 19:44:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77435.140232; Thu, 28 Jan 2021 19:44:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5DD8-00020N-9g; Thu, 28 Jan 2021 19:44:10 +0000
Received: by outflank-mailman (input) for mailman id 77435;
 Thu, 28 Jan 2021 19:44:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tEu6=G7=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l5DD6-00020I-Vs
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 19:44:09 +0000
Received: from mail-lj1-x22c.google.com (unknown [2a00:1450:4864:20::22c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b8458b0b-caf6-45bf-824a-c42dd79273ff;
 Thu, 28 Jan 2021 19:44:07 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id e18so7785849lja.12
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jan 2021 11:44:07 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id l133sm1770565lfd.234.2021.01.28.11.44.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 11:44:06 -0800 (PST)
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
X-Inumbo-ID: b8458b0b-caf6-45bf-824a-c42dd79273ff
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=dKQlun+FzopAMojG5mXB0OqNVb4pYCcJeKP6FDJ1VuA=;
        b=MOQEQCVK8dgqW4bNV8fUll6kZFVvJIj+y55SHFWX7utF+EEd+rkcYC2MWIgB+FmenS
         fAU7mWy68wXpoBs3ncnaktWeT9yQ9oBmzTwsg0CgJ/4YOzVzZMPngQQyMm0KLFpxjK7D
         o9CtZlJR4kfniTlUiqoLWNZSyXqCHhktloI+PoYElmbVjc0zFUna7UbbCe/THXuaxrZE
         pmYqioHfm/vR0HksbydWbChZBEGw6RqJPLsSbI7ARqiXiGPg0/yr4e+PJ1f6/u35yc19
         BsWviAJj+eAU1F6+pBQy9GaHB8zk3EOYTgq9pHjkZXduGLS2GCU877tZ6MK7q6qFGoJI
         4odQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=dKQlun+FzopAMojG5mXB0OqNVb4pYCcJeKP6FDJ1VuA=;
        b=hGth8ooqA82mm0dJMpD7O2C6dYHmX8Ouv7YdUA8aqCnKlTkJIblI+De3SZzX2OuE+H
         ic7ML8rc0kDbaY4BTxSewYJa5W+DnY9PbjXNFtZ4/xVvYeKYxjNEpzNLqMUA8ZR95UCD
         ODFwCuOd4py71Aoh9+j9nkBTTSpCK3BXBf+NgJwcvJEVi1bBBvWhzLkWZLcdhMu6dVk8
         7yHvpL/mRkbrgwyqcM38S5aMFtZKodmH5B1Cd6UDc19yIZn5Xtyu1lrOmeuRbf9mHWtF
         MSs1KhEQyCIGIxVRTU8v7poRbbiR/JxEvqni7gOtt9SxAqBQeLzfkcxsDjTQ2y6MSwnX
         lLYg==
X-Gm-Message-State: AOAM5337lsSZJKwFcYlZGmm12rzwH24BSrbGHNEoagM5LXgxhkScIo8a
	EIUv22jzKotcjrboiJEFzKo=
X-Google-Smtp-Source: ABdhPJy76szGmfWrFL8GOkvDZOERP0cCLjZ9aD71nh2vepj4wmimnLNKqbmSNGcDHp2Kp3GonRgJUQ==
X-Received: by 2002:a2e:a409:: with SMTP id p9mr443774ljn.281.1611863046737;
        Thu, 28 Jan 2021 11:44:06 -0800 (PST)
Subject: Re: [PATCH V5 00/22] IOREQ feature (+ virtio-mmio) on Arm
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Ian Jackson <iwj@xenproject.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien.grall@arm.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Tim Deegan <tim@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Kaly Xin <Kaly.Xin@arm.com>, Artem Mygaiev <joculator@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
 <ca1375c7-852d-fb3a-6895-5ef12ea7a01e@xen.org>
 <alpine.DEB.2.21.2101280919590.9684@sstabellini-ThinkPad-T480s>
 <1bdfda04-5954-a285-db0f-3f1633e5fd2e@xen.org>
 <5fa7024d-b259-3507-c708-676c52c13c68@citrix.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <089ca38a-63e4-5418-8ff4-54cdad949340@gmail.com>
Date: Thu, 28 Jan 2021 21:44:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5fa7024d-b259-3507-c708-676c52c13c68@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 28.01.21 20:10, Andrew Cooper wrote:

Hi Andrew

> On 28/01/2021 17:44, Julien Grall wrote:
>>
>> On 28/01/2021 17:24, Stefano Stabellini wrote:
>>> On Thu, 28 Jan 2021, Julien Grall wrote:
>>>> On 25/01/2021 19:08, Oleksandr Tyshchenko wrote:
>>>>    > Patch series [8] was rebased on recent "staging branch"
>>>>> (5e31789 tools/ocaml/libs/xb: Do not crash after xenbus is
>>>>> unmapped) and
>>>>> tested on
>>>>> Renesas Salvator-X board + H3 ES3.0 SoC (Arm64) with virtio-mmio disk
>>>>> backend [9]
>>>>> running in driver domain and unmodified Linux Guest running on
>>>>> existing
>>>>> virtio-blk driver (frontend). No issues were observed. Guest domain
>>>>> 'reboot/destroy'
>>>>> use-cases work properly. Patch series was only build-tested on x86.
>>>> I have done basic testing with a Linux guest on x86 and I didn't
>>>> spot any
>>>> regression.
>>>>
>>>> Unfortunately, I don't have a Windows VM in hand, so I can't confirm
>>>> if there
>>>> is no regression there. Can anyone give a try?
>>>>
>>>> On a separate topic, Andrew expressed on IRC some concern to expose the
>>>> bufioreq interface to other arch than x86. I will let him explain
>>>> his view
>>>> here.
>>>>
>>>> Given that IOREQ will be a tech preview on Arm (this implies the
>>>> interface is
>>>> not stable) on Arm, I think we can defer the discussion past the
>>>> freeze.
>>> Yes, I agree that we can defer the discussion.
>>>
>>>
>>>> For now, I would suggest to check if a Device Model is trying to
>>>> create an
>>>> IOREQ server with bufioreq is enabled (see ioreq_server_create()).
>>>> This would
>>>> not alleviate Andrew's concern, however it would at allow us to
>>>> judge whether
>>>> the buffering concept is going to be used on Arm (I can see some use
>>>> for the
>>>> Virtio doorbell).
>>>>
>>>> What do others think?
>>> Difficult to say. We don't have any uses today but who knows in the
>>> future.
>> I have some ideas, but Andrew so far objects on using the existing
>> bufioreq interface for good reasons. It is using guest_cmpxchg() which
>> is really expensive.
> Worse.  Patch 5 needs to switch cmpxchg() to guest_cmpxchg() to avoid
> reintroducing XSA-295, but doesn't.
>
>>> Maybe for now the important thing is to clarify that the bufioreq
>>> interface won't be maintain for backward compatibility on ARM, and could
>>> be removed without warnings, at least as long as the whole IOREQ feature
>>> is a tech preview. >
>>> In other words, it is not like we are forced to keep bufioreq around
>>> forever on ARM.
>> That's correct, we are not forced to use it. But if you only document
>> it, then there is a fair chance this will split past the "Tech Preview".
>>
>> Today, there is no caller which requires to send buffered I/O in the
>> Xen Arm hypervisor. So a Device Model should not need to say "I want
>> to allocate a page and event channel for the buffered I/O".
>>
>> The check I suggested serves two purposes:
>>    1) Catch any future upstream user of bufioreq
>>    2) Avoid an interface to be marked supported by mistake
> "use bufioreq" is an input to create_ioreq_server.  The easiest fix in
> the short term is "if ( !IS_ENABLED(CONFIG_X86) && bufioreq ) return
> -EINVAL;"

OK, will take into the account for V6 as a separate patch



-- 
Regards,

Oleksandr Tyshchenko


