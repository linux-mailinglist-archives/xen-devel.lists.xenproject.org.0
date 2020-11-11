Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C26232AEC28
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 09:41:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24536.51854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kclgt-0007IJ-Jm; Wed, 11 Nov 2020 08:41:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24536.51854; Wed, 11 Nov 2020 08:41:19 +0000
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
	id 1kclgt-0007Hu-GV; Wed, 11 Nov 2020 08:41:19 +0000
Received: by outflank-mailman (input) for mailman id 24536;
 Wed, 11 Nov 2020 08:41:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OH4G=ER=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kclgr-0007Ho-Og
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 08:41:17 +0000
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id daf066f2-9763-4215-8554-842d4a90ff37;
 Wed, 11 Nov 2020 08:41:16 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id s30so2101480lfc.4
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2020 00:41:16 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id m4sm158479ljg.137.2020.11.11.00.41.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2020 00:41:14 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=OH4G=ER=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kclgr-0007Ho-Og
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 08:41:17 +0000
X-Inumbo-ID: daf066f2-9763-4215-8554-842d4a90ff37
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id daf066f2-9763-4215-8554-842d4a90ff37;
	Wed, 11 Nov 2020 08:41:16 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id s30so2101480lfc.4
        for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2020 00:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=1p1YoNJhcui0Z5VPptfzLr+hDu0PusmRVdK0otCW7k8=;
        b=kr/h8xwb/xjyw/IWBfiguYjTJfOIEoCy7vdm5fxvxu89dKxUqrOFCYTpXyUyG54d70
         hv8+NCcPV0QlFIQFh5uxu2gMRysRjd3ri3KUqG4zqlvEUfKvLpZ4NxjO38Q6XZkenlrF
         ujdICmZocYDWeT3ODf5Gg22k5mfQzi5QPrXIDD58vFWMg6JHqwG1P2054JELYFVs/klq
         hpmNdVKuuNaUltI2uc8bO/Rnhwb1pbUmie9EGuccqDe6f31CmvUqkRLn0shtxop1Ztg7
         V1Y2dhdu6OQYCssGzaz0Aj3PQmnVTYDzSxf+4mOGmnr2yQt2dnF8BqfdDIf3b4SdzbLc
         rnnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=1p1YoNJhcui0Z5VPptfzLr+hDu0PusmRVdK0otCW7k8=;
        b=umJStj9zUdV/stkt+JFaoZZqCFBIk8fcsCWgUaFIg8kfSmiRY0Lns0uDYrr/UMPnNz
         U6UaX3X62A36qBAovnXlL6BACFDuNUkCZ4vIW6Ha1UAYjWzN3bvQ8lsBxo9TMZl252M/
         6z1Nh/wVuvncduVqv6ErRZU7cr06xxy8iQhXlCUDfbinbxW6VhBqBwrbrjOIivqMUuep
         YOOtNFNFdycWPHr1TA08C2gG4rPM051ukPXZ7n5HjPBI7Rt23AuKF9vSxRwUsg3/RHmO
         DRu/TrCGcHtk44ReVOk3VjjMh5xaQeQX6DpQ+ocPBpJ1vXY0j2vHcfNhODHzd8PUl9SB
         D1rw==
X-Gm-Message-State: AOAM5335Zze4EQgbO3d+C4bWszVecR1p9BQAjbOFtYBnWRp08Yq29ifP
	HpeCtDPk2ZaSOtQveVkN5agf3DJkqRvXpg==
X-Google-Smtp-Source: ABdhPJx11/VEpWCkJL0WT5d3Fj6kLmKPnyKWioQwREy44p7HPWJvRDTTUYTqy2Bw+IZCdFyNsVfkFw==
X-Received: by 2002:a19:8487:: with SMTP id g129mr8761852lfd.285.1605084074763;
        Wed, 11 Nov 2020 00:41:14 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
        by smtp.gmail.com with ESMTPSA id m4sm158479ljg.137.2020.11.11.00.41.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2020 00:41:14 -0800 (PST)
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
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <ed9defbe-b6bf-bd1f-cd88-64d1b0e135c1@gmail.com>
Date: Wed, 11 Nov 2020 10:41:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d4088e1b-1a50-d2fd-29b0-0f8a2cf4e7d4@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 11.11.20 10:08, Jan Beulich wrote:

Hi Jan

> On 10.11.2020 21:53, Oleksandr wrote:
>> On 20.10.20 13:51, Paul Durrant wrote:
>>
>> Hi Paul.
>>
>> Sorry for the late response.
>>
>>>> -----Original Message-----
>>>> From: Oleksandr Tyshchenko <olekstysh@gmail.com>
>>>> Sent: 15 October 2020 17:44
>>>> To: xen-devel@lists.xenproject.org
>>>> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; Stefano Stabellini <sstabellini@kernel.org>;
>>>> Julien Grall <julien@xen.org>; Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>; Andrew Cooper
>>>> <andrew.cooper3@citrix.com>; George Dunlap <george.dunlap@citrix.com>; Ian Jackson
>>>> <iwj@xenproject.org>; Jan Beulich <jbeulich@suse.com>; Wei Liu <wl@xen.org>; Paul Durrant
>>>> <paul@xen.org>; Julien Grall <julien.grall@arm.com>
>>>> Subject: [PATCH V2 17/23] xen/ioreq: Introduce domain_has_ioreq_server()
>>>>
>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>
>>>> This patch introduces a helper the main purpose of which is to check
>>>> if a domain is using IOREQ server(s).
>>>>
>>>> On Arm the current benefit is to avoid calling handle_io_completion()
>>>> (which implies iterating over all possible IOREQ servers anyway)
>>>> on every return in leave_hypervisor_to_guest() if there is no active
>>>> servers for the particular domain.
>>>> Also this helper will be used by one of the subsequent patches on Arm.
>>>>
>>>> This involves adding an extra per-domain variable to store the count
>>>> of servers in use.
>>>>
>>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>> CC: Julien Grall <julien.grall@arm.com>
>>>>
>>>> ---
>>>> Please note, this is a split/cleanup/hardening of Julien's PoC:
>>>> "Add support for Guest IO forwarding to a device emulator"
>>>>
>>>> Changes RFC -> V1:
>>>>      - new patch
>>>>
>>>> Changes V1 -> V2:
>>>>      - update patch description
>>>>      - guard helper with CONFIG_IOREQ_SERVER
>>>>      - remove "hvm" prefix
>>>>      - modify helper to just return d->arch.hvm.ioreq_server.nr_servers
>>>>      - put suitable ASSERT()s
>>>>      - use ASSERT(d->ioreq_server.server[id] ? !s : !!s) in set_ioreq_server()
>>>>      - remove d->ioreq_server.nr_servers = 0 from hvm_ioreq_init()
>>>> ---
>>>>    xen/arch/arm/traps.c    | 15 +++++++++------
>>>>    xen/common/ioreq.c      |  7 ++++++-
>>>>    xen/include/xen/ioreq.h | 14 ++++++++++++++
>>>>    xen/include/xen/sched.h |  1 +
>>>>    4 files changed, 30 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
>>>> index 507c095..a8f5fdf 100644
>>>> --- a/xen/arch/arm/traps.c
>>>> +++ b/xen/arch/arm/traps.c
>>>> @@ -2261,14 +2261,17 @@ static bool check_for_vcpu_work(void)
>>>>        struct vcpu *v = current;
>>>>
>>>>    #ifdef CONFIG_IOREQ_SERVER
>>>> -    bool handled;
>>>> +    if ( domain_has_ioreq_server(v->domain) )
>>>> +    {
>>>> +        bool handled;
>>>>
>>>> -    local_irq_enable();
>>>> -    handled = handle_io_completion(v);
>>>> -    local_irq_disable();
>>>> +        local_irq_enable();
>>>> +        handled = handle_io_completion(v);
>>>> +        local_irq_disable();
>>>>
>>>> -    if ( !handled )
>>>> -        return true;
>>>> +        if ( !handled )
>>>> +            return true;
>>>> +    }
>>>>    #endif
>>>>
>>>>        if ( likely(!v->arch.need_flush_to_ram) )
>>>> diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
>>>> index bcd4961..a72bc0e 100644
>>>> --- a/xen/common/ioreq.c
>>>> +++ b/xen/common/ioreq.c
>>>> @@ -39,9 +39,14 @@ static void set_ioreq_server(struct domain *d, unsigned int id,
>>>>                                 struct ioreq_server *s)
>>>>    {
>>>>        ASSERT(id < MAX_NR_IOREQ_SERVERS);
>>>> -    ASSERT(!s || !d->ioreq_server.server[id]);
>>>> +    ASSERT(d->ioreq_server.server[id] ? !s : !!s);
>>> That looks odd. How about ASSERT(!s ^ !d->ioreq_server.server[id])?
>> ok, looks like it will work.
>>
>>
>>>     Paul
>>>
>>>>        d->ioreq_server.server[id] = s;
>>>> +
>>>> +    if ( s )
>>>> +        d->ioreq_server.nr_servers++;
>>>> +    else
>>>> +        d->ioreq_server.nr_servers--;
>>>>    }
>>>>
>>>>    #define GET_IOREQ_SERVER(d, id) \
>>>> diff --git a/xen/include/xen/ioreq.h b/xen/include/xen/ioreq.h
>>>> index 7b03ab5..0679fef 100644
>>>> --- a/xen/include/xen/ioreq.h
>>>> +++ b/xen/include/xen/ioreq.h
>>>> @@ -55,6 +55,20 @@ struct ioreq_server {
>>>>        uint8_t                bufioreq_handling;
>>>>    };
>>>>
>>>> +#ifdef CONFIG_IOREQ_SERVER
>>>> +static inline bool domain_has_ioreq_server(const struct domain *d)
>>>> +{
>>>> +    ASSERT((current->domain == d) || atomic_read(&d->pause_count));
>>>> +
>>> This seems like an odd place to put such an assertion.
>> I might miss something or interpreted incorrectly but these asserts are
>> the result of how I understood the review comment on previous version [1].
>>
>> I will copy a comment here for the convenience:
>> "This is safe only when d == current->domain and it's not paused,
>> or when they're distinct and d is paused. Otherwise the result is
>> stale before the caller can inspect it. This wants documenting by
>> at least a comment, but perhaps better by suitable ASSERT()s."
> The way his reply was worded, I think Paul was wondering about the
> place where you put the assertion, not what you actually assert.

Shall I put the assertion at the call sites of this helper instead?


>   
>
>>>> +    return d->ioreq_server.nr_servers;
>>>> +}
>>>> +#else
>>>> +static inline bool domain_has_ioreq_server(const struct domain *d)
>>>> +{
>>>> +    return false;
>>>> +}
>>>> +#endif
>>>> +
>>> Can this be any more compact? E.g.
>>>
>>> return IS_ENABLED(CONFIG_IOREQ_SERVER) && d->ioreq_server.nr_servers;
>>>
>>> ?
>> I have got a compilation error this way (if CONFIG_IOREQ_SERVER is
>> disabled):
>>
>> ...xen/4.14.0+gitAUTOINC+ee22110219-r0/git/xen/include/xen/ioreq.h:62:48:
>> error: ‘const struct domain’ has no member named ‘ioreq_server’
>>        return IS_ENABLED(CONFIG_IOREQ_SERVER) && d->ioreq_server.nr_servers;
>>                                                   ^
>> as domain's ioreq_server struct is guarded by CONFIG_IOREQ_SERVER as well.
> The #ifdef is unavoidable here, I agree, but it should be inside
> the function's body. There's no need to duplicate the rest of it.


Got it, will do.


-- 
Regards,

Oleksandr Tyshchenko


