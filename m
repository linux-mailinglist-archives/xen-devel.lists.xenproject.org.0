Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9653F3064F7
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 21:22:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76405.137858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4rKQ-0000Na-18; Wed, 27 Jan 2021 20:22:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76405.137858; Wed, 27 Jan 2021 20:22:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4rKP-0000NB-Tu; Wed, 27 Jan 2021 20:22:13 +0000
Received: by outflank-mailman (input) for mailman id 76405;
 Wed, 27 Jan 2021 20:22:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kelV=G6=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l4rKN-0000N6-Jt
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 20:22:11 +0000
Received: from mail-lj1-x234.google.com (unknown [2a00:1450:4864:20::234])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f3b7477d-9bce-4156-8c47-28ba41923ade;
 Wed, 27 Jan 2021 20:22:10 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id f19so3665173ljn.5
 for <xen-devel@lists.xenproject.org>; Wed, 27 Jan 2021 12:22:10 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id 194sm752235lfk.292.2021.01.27.12.22.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jan 2021 12:22:09 -0800 (PST)
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
X-Inumbo-ID: f3b7477d-9bce-4156-8c47-28ba41923ade
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Gz3oLTrs8uV2CuakAJhcgOvEGqa7e+CgZRM1sKZsDK4=;
        b=p8+BxN7ZEWSbYI2Vp9e9eLplbKFilCypu0mEhlvlHUpk50+2Qj9Xv3fvaL+FyifgXP
         VZuhexXNUJjfu0pEZjyNf8VGovbtE/GBG6sp+fWwWcS7C13k4C6o6ohq/J6biU+t3JtZ
         vNrjirCLXuMAqNSeu7vc4GgUuYzzGOsRX69CQ/dB1wt4f0BwPCKoEvO0OJIuXf/j4cps
         Dl8MJmagpf8+Np9NkPHwB2U61zHlj/OJWB5cCELofOvLIg/KmwRLcJYJero2q61LOS/M
         gRJP8YtMC4gsEErOoueqDYctvwcQc7al03yBvSH1px4rDDxbgD7dnBmTC+2GF+SqFD19
         fC1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Gz3oLTrs8uV2CuakAJhcgOvEGqa7e+CgZRM1sKZsDK4=;
        b=iYWIWoFbvrd9rgXMDJ+BbtpBHUI0WWqCbkZY47XEX3ISJZHBQEv9Jj8mWxWOGp71th
         /xYYw+7ANNKdKIIldGZ5JKK6BvtHcBa9WQLTnSTqgzbbjvFCYFICibcekGT6IgHbb6W/
         lCr59w/xMB3v8p+M/ll3waPsycSg9lvtH4m3BSM3/I3Jm+MgQHcUqjpAqhlGwylYL6yx
         W8kwseiwJK5U0MyG7SOacpyROHqQbf+MD6zbri7io6/rtGW8mdbCK9LpGYSTkBr563Gv
         CZOv68WNpoA+7u2VnaAae6TldXwnBjkVyjR8mw+eAjZB03snukvTQPImG5MlPsKk5XkM
         8vag==
X-Gm-Message-State: AOAM533JJs6iYZGcmy4f8P25BCaYSTDLU41psuC1UnFwj+Q/ISYpoGT7
	jkkFLa5NxSPPuca6TXzuL3U=
X-Google-Smtp-Source: ABdhPJz/Skxq73qcBTHUoTB+3qZ++3nCmOKCL8rjXTHUNRe8GG4KwlHVz/tolvjBL4Woxdwiti1M+w==
X-Received: by 2002:a2e:88c5:: with SMTP id a5mr6804505ljk.250.1611778929542;
        Wed, 27 Jan 2021 12:22:09 -0800 (PST)
Subject: Re: [PATCH V5 04/22] xen/ioreq: Make x86's IOREQ feature common
To: Julien Grall <julien@xen.org>, Julien Grall <julien.grall.oss@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
 <1611601709-28361-5-git-send-email-olekstysh@gmail.com>
 <CAJ=z9a1c+obN3KW_cMr7OH0112_gHSxnAoEJb9qW6R1J38QgQQ@mail.gmail.com>
 <20270711-36bc-6d7d-16cb-4572cace47ed@gmail.com>
 <eb03f366-9405-c193-07be-fbeca29fca4c@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <1156e356-5762-a196-ec16-bb6614912394@gmail.com>
Date: Wed, 27 Jan 2021 22:22:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <eb03f366-9405-c193-07be-fbeca29fca4c@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 27.01.21 20:43, Julien Grall wrote:
>
>
> On 25/01/2021 23:40, Oleksandr wrote:
>>
>> On 26.01.21 01:13, Julien Grall wrote:
>>> Hi,
>>
>> Hi Julien
>
> Hi Oleksandr,

Hi Julien


>
>>
>>>
>>> On Mon, 25 Jan 2021 at 19:09, Oleksandr Tyshchenko 
>>> <olekstysh@gmail.com> wrote:
>>>> ***
>>>> Please note, this patch depends on the following which is
>>>> on review:
>>>> https://patchwork.kernel.org/patch/11816689/
>>>> The effort (to get it upstreamed) was paused because of
>>>> the security issue around that code (XSA-348).
>>>> ***
>>> I read this comment as "This series should be applied on top the patch
>>> X". However, looking at your branch, I can't see the patch. What did I
>>> miss?
>> You didn't miss anything. Patch series doesn't contain it. I 
>> mentioned about this patch in order not to forget about it
>> and draw reviewer's attention. Looks like, the activity (to get it 
>> upstreamed) hasn't been resumed yet and I don't know what we should 
>> do with that dependency
>> in the context of this series...
>
> I will reply what I wrote on IRC privately :). I think this fine to 
> defer it to after Xen 4.15 because IOREQ will be in tech preview.

Thank you. I got a request to make a possibility for user to select 
IOREQ via the menuconfig on Arm. Saying tech preview do you mean that I 
also need to put it under CONFIG_EXPERT on Arm?


>
> Note that the bug can only be hit if the IOREQ server disappear behind 
> your back. AFAICT, this is mostly an issue with device model running 
> in non-trusted domain.

I got it.



-- 
Regards,

Oleksandr Tyshchenko


