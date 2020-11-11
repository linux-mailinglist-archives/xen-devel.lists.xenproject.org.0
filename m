Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EC62AF767
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 18:33:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25139.52739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kctzy-0005Xf-Aj; Wed, 11 Nov 2020 17:33:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25139.52739; Wed, 11 Nov 2020 17:33:34 +0000
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
	id 1kctzy-0005XG-78; Wed, 11 Nov 2020 17:33:34 +0000
Received: by outflank-mailman (input) for mailman id 25139;
 Wed, 11 Nov 2020 17:33:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OH4G=ER=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kctzw-0005X9-J8
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 17:33:32 +0000
Received: from mail-lj1-x230.google.com (unknown [2a00:1450:4864:20::230])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d00b3402-5166-4e33-9c8f-29c5817c8b6d;
 Wed, 11 Nov 2020 17:33:31 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id 11so3005603ljf.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2020 09:33:31 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id j11sm294773ljh.26.2020.11.11.09.33.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2020 09:33:29 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=OH4G=ER=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kctzw-0005X9-J8
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 17:33:32 +0000
X-Inumbo-ID: d00b3402-5166-4e33-9c8f-29c5817c8b6d
Received: from mail-lj1-x230.google.com (unknown [2a00:1450:4864:20::230])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d00b3402-5166-4e33-9c8f-29c5817c8b6d;
	Wed, 11 Nov 2020 17:33:31 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id 11so3005603ljf.2
        for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2020 09:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Nd5jEW0QzDuwykLHNKZ4lrMPbVGUqkgVK6JGfBtXzws=;
        b=aKpKP8sfVMbpyRkFgGYsZdrh6QeyDHLKPh/GDqvzgsb0jMUzU50zZNsQBSMh5qmPJO
         grY9SCLhn4Qjyrep0GPZG2qvzzmKRIzNQzh+JPHXv+4WWogG69XqqYDGowSOiQCDNi6a
         yJIl75S9cA901gtrWZU9Csy9Lst2emRvboN2q+vK0gz+pCumRzL4WNtCMFMIJ1hXf5oc
         +1rFJy4zo7PbSWzmWRYQ+e/c6L1myM8Fptv3pyNhPHQbsVx7vtrZ/Vv+qieY9TMighOW
         ZJMR2ZYFtGiKmHWMmad8DS5humT+yMxe2nih0dHB8ZnAA4KN+uEICu2/Ozybwt4CbhHn
         jyXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Nd5jEW0QzDuwykLHNKZ4lrMPbVGUqkgVK6JGfBtXzws=;
        b=PH/xH2VUvTqraDLzEEuukpkuRirpHi8k2OwRZ0U0UJnNOJfAWRHMJD8wSCSQhcZxtv
         n3cyGNmZkUEvWWdEnVPmA5eFBq/AQspwMhKsGukix0kwRO4XXyIwou9l9l9e+1IA49Un
         falY8QaZYUo6p2npkw+iifhagn1gw6qNwQuKFkXeKniSWP2xZw8TSmcMzSsi28mNd7x3
         S+Twae4J0o3s5ZxAb1ANvjFc5DE7qTwJprJxUCbFz+bCldO2uq+YuiUf+RHPGtfHdd8j
         lsj3xG7TBQpBoZH4W3Cn4aPbrDeW98PsqaeNOkwHkSkmlYQiUgJL7X89glCXnMpEINuY
         34VA==
X-Gm-Message-State: AOAM533W9jb711FWaIlTyTPm4+ETAotRTt/qADEAcyAof6vyhQVMP5j1
	QW/zGWAL/JGN1MyPjgivYO60CqxorBU8ww==
X-Google-Smtp-Source: ABdhPJzktMhzISNMR0atIKvY/55l+KaH2X4GFlKFIwD5uERKcvEWMeiyd2N8rv+O6KnNMW/meVeyMg==
X-Received: by 2002:a2e:9798:: with SMTP id y24mr10142909lji.341.1605116010210;
        Wed, 11 Nov 2020 09:33:30 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
        by smtp.gmail.com with ESMTPSA id j11sm294773ljh.26.2020.11.11.09.33.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2020 09:33:29 -0800 (PST)
Subject: Re: [PATCH V2 17/23] xen/ioreq: Introduce domain_has_ioreq_server()
To: paul@xen.org
Cc: 'Jan Beulich' <jbeulich@suse.com>,
 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>,
 'Ian Jackson' <iwj@xenproject.org>, 'Wei Liu' <wl@xen.org>,
 'Julien Grall' <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <1602780274-29141-18-git-send-email-olekstysh@gmail.com>
 <004e01d6a6cf$09cd9f40$1d68ddc0$@xen.org>
 <700a643e-641e-c243-cb2d-7ad8b5a9b8ad@gmail.com>
 <d4088e1b-1a50-d2fd-29b0-0f8a2cf4e7d4@suse.com>
 <ed9defbe-b6bf-bd1f-cd88-64d1b0e135c1@gmail.com>
 <0ab03a33-5056-0de8-e5f7-b54a661a09c5@suse.com>
 <003401d6b847$a2d9f470$e88ddd50$@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <6472d0b7-d23f-a908-65b9-0cee64ca8e2a@gmail.com>
Date: Wed, 11 Nov 2020 19:33:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <003401d6b847$a2d9f470$e88ddd50$@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 11.11.20 18:28, Paul Durrant wrote:

Hi Paul.

>>
>>>>>>>         d->ioreq_server.server[id] = s;
>>>>>>> +
>>>>>>> +    if ( s )
>>>>>>> +        d->ioreq_server.nr_servers++;
>>>>>>> +    else
>>>>>>> +        d->ioreq_server.nr_servers--;
>>>>>>>     }
>>>>>>>
>>>>>>>     #define GET_IOREQ_SERVER(d, id) \
>>>>>>> diff --git a/xen/include/xen/ioreq.h b/xen/include/xen/ioreq.h
>>>>>>> index 7b03ab5..0679fef 100644
>>>>>>> --- a/xen/include/xen/ioreq.h
>>>>>>> +++ b/xen/include/xen/ioreq.h
>>>>>>> @@ -55,6 +55,20 @@ struct ioreq_server {
>>>>>>>         uint8_t                bufioreq_handling;
>>>>>>>     };
>>>>>>>
>>>>>>> +#ifdef CONFIG_IOREQ_SERVER
>>>>>>> +static inline bool domain_has_ioreq_server(const struct domain *d)
>>>>>>> +{
>>>>>>> +    ASSERT((current->domain == d) || atomic_read(&d->pause_count));
>>>>>>> +
>>>>>> This seems like an odd place to put such an assertion.
>>>>> I might miss something or interpreted incorrectly but these asserts are
>>>>> the result of how I understood the review comment on previous version [1].
>>>>>
>>>>> I will copy a comment here for the convenience:
>>>>> "This is safe only when d == current->domain and it's not paused,
>>>>> or when they're distinct and d is paused. Otherwise the result is
>>>>> stale before the caller can inspect it. This wants documenting by
>>>>> at least a comment, but perhaps better by suitable ASSERT()s."
>>>> The way his reply was worded, I think Paul was wondering about the
>>>> place where you put the assertion, not what you actually assert.
>>> Shall I put the assertion at the call sites of this helper instead?
>> Since Paul raised the question, I expect this is a question to him
>> rather than me?
> If it is indeed a question for me then yes, put the assertion where it is clear why it is needed. domain_has_ioreq_server() is essentially a trivial accessor function; it's not the appropriate place.

Got it. Thank you for the clarification.

-- 
Regards,

Oleksandr Tyshchenko


