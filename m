Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63823585315
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jul 2022 17:48:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377615.610878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHSCu-0003am-Kn; Fri, 29 Jul 2022 15:47:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377615.610878; Fri, 29 Jul 2022 15:47:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHSCu-0003Y7-Hc; Fri, 29 Jul 2022 15:47:20 +0000
Received: by outflank-mailman (input) for mailman id 377615;
 Fri, 29 Jul 2022 15:47:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N3XD=YC=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oHSCt-0003Y1-K3
 for xen-devel@lists.xenproject.org; Fri, 29 Jul 2022 15:47:19 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9a597c3-0f55-11ed-bd2d-47488cf2e6aa;
 Fri, 29 Jul 2022 17:47:18 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id tk8so9218879ejc.7
 for <xen-devel@lists.xenproject.org>; Fri, 29 Jul 2022 08:47:18 -0700 (PDT)
Received: from [192.168.1.93] (adsl-69.109.242.233.tellas.gr. [109.242.233.69])
 by smtp.gmail.com with ESMTPSA id
 t23-20020aa7d4d7000000b0043bbc9503ddsm2536341edr.76.2022.07.29.08.47.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jul 2022 08:47:17 -0700 (PDT)
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
X-Inumbo-ID: b9a597c3-0f55-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=YU4+N1dFaxYk0V0HBTnikJhCHrzO/Ko9SeXqtkCr9tw=;
        b=Kg2Kn5KzzxxtY5Xtfa8OO6dSU7xEGXF+PeGCcIJcnmFrv7+/EOMxV6x7Mr3SclL/5w
         UlbkbzXSy2VRbM6yqqssnuiE/2eVfFki2eHdi3yV2DJc05638ydQrLXJjkIow191gpbP
         QsungH978BVKGa+flXhsCu6vA3vjBPZD2hWyV+lOI9YdXIi2jlt+6CMYvWrUJM3HdsTl
         CLxwM6ZPZaK96c2ymhTCBwTULzA22HP9zTbG7HAHOU8HDP8+5QZI3/ldTIaQ/gRkDj+a
         qWengSd++bPnowrJDcZqdmGljeN1Ui3rRVru0/5RlQWjm7NUujUrZIjUCfjtpYVTMDv9
         q+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=YU4+N1dFaxYk0V0HBTnikJhCHrzO/Ko9SeXqtkCr9tw=;
        b=YaGgvRNwtH+b6cts8AJLpPdfZNFKiNbKQGZ/66tJdQumuLHqI8NRtQylE2TssTyoY3
         ZeGlQy3/GWltFolGHNaxN9dYMA0ApQ2sSjvl8Sx5xkrj72StZCPaH0jpy39iHPCo76A3
         7Ua8rb/ennJGGEjYR5MBOQB0Z/FLmGIm/vK+mZvLaptcQO5k7ko4WDpkbISJShu5/6Ib
         RY917H6G0aKUiDEonosrzGEWfPHe1SZLq+T1sgkFz2yV2+mlrv6RaJg3Lf4Ql1AigGMO
         2clna0NCJo9Y4iOqX1JUQmC+GVFrRjFmUZjdJ2UpvM7ObyX1MyA1s8pL+EjsTK5+vwjp
         v5vw==
X-Gm-Message-State: AJIora/Fx8ndA1f90ojtOoVzcwiawILE1Yd1BJ7KYdeOtWRfln2GE8Ei
	RwXA9XosTOuLFW5iEXVbjPM=
X-Google-Smtp-Source: AGRyM1tRd535fnfutV2P8ictT1WjRUtyHy9cwe3fF86wtmNif0e5JIdTojMqXzhieWqKMxXuM4Wplw==
X-Received: by 2002:a17:907:970d:b0:72b:3589:a22c with SMTP id jg13-20020a170907970d00b0072b3589a22cmr3367312ejc.621.1659109637628;
        Fri, 29 Jul 2022 08:47:17 -0700 (PDT)
Message-ID: <de13b11f-6ef8-fc89-82da-72915f1fb76f@gmail.com>
Date: Fri, 29 Jul 2022 18:47:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3] xen/arm: domain: Fix MISRA C 2012 Rule 8.7 violation
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Bertrand Marquis
 <Bertrand.Marquis@arm.com>, Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220728162151.1228747-1-burzalodowa@gmail.com>
 <65adc941-78a9-2e2d-fa43-6189ea95773d@suse.com>
 <b9f3bbc1-e6ec-35c3-6ff6-35e051c86953@gmail.com>
 <4327CBBD-315D-44C0-A429-25F3CA5BE25D@arm.com>
 <01bb7315-91a1-de7a-2c17-c6772f740619@gmail.com>
 <fa07bef2-8f0e-affe-0965-65156bdcc84d@xen.org>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <fa07bef2-8f0e-affe-0965-65156bdcc84d@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Julien,

Hi Julien,

On 7/29/22 18:15, Julien Grall wrote:
> Hi Xenia,
> 
> On 29/07/2022 15:03, Xenia Ragiadakou wrote:
>>
>> On 7/29/22 16:41, Bertrand Marquis wrote:
>>> Hi Xenia,
>>>
>>>> On 29 Jul 2022, at 07:31, Xenia Ragiadakou <burzalodowa@gmail.com> 
>>>> wrote:
>>>>
>>>> Hi Jan,
>>>>
>>>> On 7/29/22 09:26, Jan Beulich wrote:
>>>>> On 28.07.2022 18:21, Xenia Ragiadakou wrote:
>>>>>> --- a/xen/arch/arm/domain.c
>>>>>> +++ b/xen/arch/arm/domain.c
>>>>>> @@ -63,7 +63,7 @@ static void do_idle(void)
>>>>>>       rcu_idle_exit(cpu);
>>>>>>   }
>>>>>>   -void idle_loop(void)
>>>>>> +static void idle_loop(void)
>>>>> While you're adding "noreturn" below, shouldn't this one be marked so
>>>>> as well? Preferably with the addition:
>>>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>>>
>>>> Yes, but I was not sure if this should go in this patch or in a 
>>>> separate one.
>>>
>>> As you modify the function to make it static, I think it is ok to 
>>> also add the noreturn in the same patch.
>>>
>>> With that done, you can add my:
>>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>>
>>> Cheers
>>> Bertrand
>>
>> I consider this change unrelated to the patch. I think it is a bad 
>> practice to squash unrelated changes in a single patch. Also, I do not 
>> think it is unfair to be obliged to make it in order for the patch to 
>> be accepted.
>> I could have taken the opportunity to fix this in the same patch but I 
>> decided to not take it.
> 
> In general, I don't like having multiple changes within a patch. 
> However, here this is a consistency problem. You are modifying the 3 
> prototypes (well one is technically a declaration) and it reads odd that 
> 2 are using noreturn but not the other one.
> 

The patch adds the 2 function declarations, it does not modify them. 
Since they do not return, they are declared noreturn.
If the function idle_loop was not declared noreturn, although it should 
have been, for me is a completely different issue.

> I would actually argue that if this patch goes in like that, then the 
> commit message ought to explain why there is a lack of consistency.
> 

I do not agree with you saying that the patch introduced this 
inconsistency. The function idle_loop should have been declared noreturn 
in the first place. If you would like to fix this in the current patch, 
it is up to you.

> Anyway, I agree with Bertrand that it would be preferable to add 
> noreturn to the declaration of idle_loop() in this patch.
> 
> To avoid a round trip, I would be OK to handle on commit.
> 
> Cheers,
> 

-- 
Xenia

