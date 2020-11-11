Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E508E2AF765
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 18:32:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25133.52727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kctyG-0005Ne-Pe; Wed, 11 Nov 2020 17:31:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25133.52727; Wed, 11 Nov 2020 17:31:48 +0000
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
	id 1kctyG-0005NF-MB; Wed, 11 Nov 2020 17:31:48 +0000
Received: by outflank-mailman (input) for mailman id 25133;
 Wed, 11 Nov 2020 17:31:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OH4G=ER=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kctyE-0005NA-Vw
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 17:31:47 +0000
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 96299019-09b2-466d-9a3c-1ed40d640f09;
 Wed, 11 Nov 2020 17:31:45 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id 11so2998969ljf.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2020 09:31:45 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id r12sm288509lfc.80.2020.11.11.09.31.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2020 09:31:43 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=OH4G=ER=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kctyE-0005NA-Vw
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 17:31:47 +0000
X-Inumbo-ID: 96299019-09b2-466d-9a3c-1ed40d640f09
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 96299019-09b2-466d-9a3c-1ed40d640f09;
	Wed, 11 Nov 2020 17:31:45 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id 11so2998969ljf.2
        for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2020 09:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=9lJcUz8QfXwF8vJaUpaGnd9A5ljqxkWw2E3euLf1b2E=;
        b=faVKNxWR3DZbJ6ORB0FoEGO2o7fyd6xSnWLASggYQdI90I3vCsPLm2MqySvFEfk/JE
         sY9AOJGdbaqlnTNNRaUOaR3NM0ZRbh/4CJndsSY/Q2NIyXys4ci4AjiTEyXrQDeZaT26
         X1gZlJ9gLkyn7/BNWvPmGtdjFBskMXnKrxxnJjIekXkXdj2lLswSP9MP96wM8ha5Ui8a
         wmzpPj0A14TRgrNAMnLHzUEVFDIKIfjNv2NIgmyuzgZ3mGh5mRpu5KH7VeG/gMCZm2Gm
         4Fxb9TuX08u7G6UXUL2ZT+1ziMHU83tz5ryy2QfK0bP9OTlNA/MTHvHQSSAfT1T4QBMj
         G9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=9lJcUz8QfXwF8vJaUpaGnd9A5ljqxkWw2E3euLf1b2E=;
        b=SHNy/u5bouKKucPJwotmMq8oyJOjSIxl5nr/V1nj7hlDCa32Oh/KqF1gzkUgpETsr5
         4xyRP8YGzM/GZ/upFfct4VYL5bXR6ppcT6wBUojnFz1KW0knOCYSowRM8luKuKIZehEp
         Yr7HKQ8eA7QLMrqh9hSOFMTdR1o6IqjLXL3rq6Wyxe73238A20JncYnCXOVSFccYi3Kf
         05xfQSpb2eAQYIDNgNT0Sx8NM5OsaM9DiCH25wwRiboUax/NVAZx13Va8t2GCcqRFdQy
         qN3vhpFLIOFd5nMs6pUwbLvDidGhaO8ywVYquNoEVzS03OHKs5WduLkQRXhK9de4yfEJ
         F2mQ==
X-Gm-Message-State: AOAM531n5f58urQW/qWCjvr+zc6n7QeUq9fNCpDMs5irZV3yHsyMO/66
	7w/EVCdUUOt8kN5Kx40Uwm65aDUw83LDzw==
X-Google-Smtp-Source: ABdhPJwqsr5xF26n/tPUD6Z4pRNeNivTmqj6ig/i4bu+22DhlBd1aMreC2lH1lbgk57ruKYkPvxlGQ==
X-Received: by 2002:a2e:8e3b:: with SMTP id r27mr8614266ljk.466.1605115904037;
        Wed, 11 Nov 2020 09:31:44 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
        by smtp.gmail.com with ESMTPSA id r12sm288509lfc.80.2020.11.11.09.31.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2020 09:31:43 -0800 (PST)
Subject: Re: [PATCH V2 17/23] xen/ioreq: Introduce domain_has_ioreq_server()
To: Jan Beulich <jbeulich@suse.com>
Cc: 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>,
 'Ian Jackson' <iwj@xenproject.org>, 'Wei Liu' <wl@xen.org>,
 'Julien Grall' <julien.grall@arm.com>, paul@xen.org,
 xen-devel@lists.xenproject.org
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <1602780274-29141-18-git-send-email-olekstysh@gmail.com>
 <004e01d6a6cf$09cd9f40$1d68ddc0$@xen.org>
 <700a643e-641e-c243-cb2d-7ad8b5a9b8ad@gmail.com>
 <d4088e1b-1a50-d2fd-29b0-0f8a2cf4e7d4@suse.com>
 <ed9defbe-b6bf-bd1f-cd88-64d1b0e135c1@gmail.com>
 <0ab03a33-5056-0de8-e5f7-b54a661a09c5@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <fcf79de6-ce12-24db-0a32-5ce1f657d699@gmail.com>
Date: Wed, 11 Nov 2020 19:31:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0ab03a33-5056-0de8-e5f7-b54a661a09c5@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 11.11.20 15:27, Jan Beulich wrote:

Hi Jan.

>
>>>>>>     }
>>>>>>
>>>>>>     #define GET_IOREQ_SERVER(d, id) \
>>>>>> diff --git a/xen/include/xen/ioreq.h b/xen/include/xen/ioreq.h
>>>>>> index 7b03ab5..0679fef 100644
>>>>>> --- a/xen/include/xen/ioreq.h
>>>>>> +++ b/xen/include/xen/ioreq.h
>>>>>> @@ -55,6 +55,20 @@ struct ioreq_server {
>>>>>>         uint8_t                bufioreq_handling;
>>>>>>     };
>>>>>>
>>>>>> +#ifdef CONFIG_IOREQ_SERVER
>>>>>> +static inline bool domain_has_ioreq_server(const struct domain *d)
>>>>>> +{
>>>>>> +    ASSERT((current->domain == d) || atomic_read(&d->pause_count));
>>>>>> +
>>>>> This seems like an odd place to put such an assertion.
>>>> I might miss something or interpreted incorrectly but these asserts are
>>>> the result of how I understood the review comment on previous version [1].
>>>>
>>>> I will copy a comment here for the convenience:
>>>> "This is safe only when d == current->domain and it's not paused,
>>>> or when they're distinct and d is paused. Otherwise the result is
>>>> stale before the caller can inspect it. This wants documenting by
>>>> at least a comment, but perhaps better by suitable ASSERT()s."
>>> The way his reply was worded, I think Paul was wondering about the
>>> place where you put the assertion, not what you actually assert.
>> Shall I put the assertion at the call sites of this helper instead?
> Since Paul raised the question, I expect this is a question to him
> rather than me?
Yes, it was primarily a question to Paul, but I wanted to hear your 
opinion as well. Sorry for the confusion.

-- 
Regards,

Oleksandr Tyshchenko


