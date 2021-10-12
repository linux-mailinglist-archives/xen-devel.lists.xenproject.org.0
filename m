Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B500D42A551
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 15:18:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207177.362922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maHfc-0004dD-IS; Tue, 12 Oct 2021 13:18:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207177.362922; Tue, 12 Oct 2021 13:18:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maHfc-0004bI-FA; Tue, 12 Oct 2021 13:18:16 +0000
Received: by outflank-mailman (input) for mailman id 207177;
 Tue, 12 Oct 2021 13:18:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P4MT=PA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1maHfb-0004bC-BO
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 13:18:15 +0000
Received: from mail-lf1-x12e.google.com (unknown [2a00:1450:4864:20::12e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4d6b9054-f05d-4417-9f2f-9703a95a810d;
 Tue, 12 Oct 2021 13:18:14 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id p16so16954960lfa.2
 for <xen-devel@lists.xenproject.org>; Tue, 12 Oct 2021 06:18:14 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id o6sm183465lfr.19.2021.10.12.06.18.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 06:18:12 -0700 (PDT)
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
X-Inumbo-ID: 4d6b9054-f05d-4417-9f2f-9703a95a810d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=QpKqygwgbmbmWIw4bWoPgXdUNCBdr92kg5Gqj+0zhcI=;
        b=d5xlA7cNkd2c4RSzms7sRDsLz9LIF+iZwSQ/exz6smKJEKzbAavNlHGI+tw4k9VQ+/
         LgPUekRF3a3ViamnNtzHNQ/BHL68iiX8KJvFm0avlQ6CV5G+RqFt+M7s6LrtwXJkaRlX
         w1jFsvL/eSg4ISRAosNByHT/EK7qpXp9tg6EOdiEQsQIaHlxeHLAmzG6hVikmbigCsFK
         kch1nKcCbyCSDXpDcbtHKYbiV2llUTZx3sXowWwoo06orV6NlaF3vs62yMtnaHVRz1D2
         uXPD9iJnxL8KiWO/8JuoRiNpYMsUw8opewJJVpUPkMrAm0h3TKbuMILwVXKnIyJDLPYE
         k5aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=QpKqygwgbmbmWIw4bWoPgXdUNCBdr92kg5Gqj+0zhcI=;
        b=IBmXmhLrkIq4jx7vUiCF6WfqUmtbKiXxrD8JgN3EP3c5c6g+iUe/9VEVNxpkXmQaqn
         iN4AiINylb9Kh8/f4y6T/r7oRaOhfnYh6xcD6PPduEEP3N/9oo4Ouei7qCSoq5iGPaob
         zHXJsy6816rgYS4ix/YT4LkIFL05X4l2/5imUf0Ijs+T3/akYsJARSGANaW1J7K3Zl5z
         +4LgzizioasYP50pUw3BE+LK7bWjckNBTAWKighwrh10dE73SSDYP+ZGa7ykKpv343xn
         h4jgZtU95eoROLfu/paIFG7xIbFYYPEJ2zeT5avxMSXYMxAHKJ19188D25bwnQOPvTQN
         zO6g==
X-Gm-Message-State: AOAM531Jca0CpaSfphgKC8MuvttGedV4W2UG2uUGrSJ93yu0bjEDJOD2
	ik2+Jmqgf85d0oha2zW5+5x5ewklVZA=
X-Google-Smtp-Source: ABdhPJza7QD9Hl1E0JIABgAUh14c24M70XmvT9FrGvSbwPa+H+tubiYWTivSuATxkicMW/jkCGXadw==
X-Received: by 2002:ac2:592f:: with SMTP id v15mr17816973lfi.17.1634044692972;
        Tue, 12 Oct 2021 06:18:12 -0700 (PDT)
Subject: Re: [PATCH V6 1/2] xen/arm: Introduce gpaddr_bits field to struct
 xen_domctl_getdomaininfo
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <1633974539-7380-1-git-send-email-olekstysh@gmail.com>
 <1633974539-7380-2-git-send-email-olekstysh@gmail.com>
 <1466e946-d247-2380-6d7d-cda405a2f255@suse.com>
 <68213f79-2cbc-e0cf-3181-bc487f0a5eff@gmail.com>
 <0e03fe6e-8236-fc7d-669f-98107f40e014@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <31f869a5-5788-74c7-c290-ce6797584e9e@gmail.com>
Date: Tue, 12 Oct 2021 16:18:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0e03fe6e-8236-fc7d-669f-98107f40e014@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 12.10.21 14:49, Jan Beulich wrote:

Hi Jan

> On 12.10.2021 13:28, Oleksandr wrote:
>> On 12.10.21 12:24, Jan Beulich wrote:
>>> On 11.10.2021 19:48, Oleksandr Tyshchenko wrote:
>>>> @@ -150,6 +150,7 @@ struct xen_domctl_getdomaininfo {
>>>>        uint32_t ssidref;
>>>>        xen_domain_handle_t handle;
>>>>        uint32_t cpupool;
>>>> +    uint8_t gpaddr_bits; /* Guest physical address space size. */
>>>>        struct xen_arch_domainconfig arch_config;
>>> On the basis of the above, please add uint8_t pad[3] (or perhaps
>>> better pad[7] to be independent of the present
>>> alignof(struct xen_arch_domainconfig) == 4) and make sure the
>>> array will always be zero-filled, such that the padding space can
>>> subsequently be assigned a purpose without needing to bump the
>>> interface version(s) again.
>> ok, will do.
>>
>>
>>> Right now the sysctl caller of getdomaininfo() clears the full
>>> structure (albeit only once, so stale / inapplicable data might get
>>> reported for higher numbered domains if any field was filled only
>>> in certain cases), while the domctl one doesn't. Maybe it would be
>>> best looking forward if the domctl path also cleared the full buffer
>>> up front, or if the clearing was moved into the function. (In the
>>> latter case some writes of zeros into the struct could be eliminated
>>> in return.)
>> Well, I would be OK either way, with a little preference for the latter.
>>
>> Is it close to what you meant?
> Yes, just that ...
>
>> --- a/xen/common/domctl.c
>> +++ b/xen/common/domctl.c
>> @@ -69,10 +69,10 @@ void getdomaininfo(struct domain *d, struct
>> xen_domctl_getdomaininfo *info)
>>        int flags = XEN_DOMINF_blocked;
>>        struct vcpu_runstate_info runstate;
>>
>> +    memset(info, 0, sizeof(*info));
>> +
>>        info->domain = d->domain_id;
>>        info->max_vcpu_id = XEN_INVALID_MAX_VCPU_ID;
>> -    info->nr_online_vcpus = 0;
>> -    info->ssidref = 0;
> ... there are a few more "... = 0" further down iirc.

I didn't spot anything except "info->flags = ..." which probably can now 
be converted into "info->flags |= ..."


>
>>> Perhaps, once properly first zero-filling the struct in all cases,
>>> the padding field near the start should also be made explicit,
>>> clarifying visually that it is an option to use the space there for
>>> something that makes sense to live early in the struct (i.e. I
>>> wouldn't necessarily recommend putting there the new field you add,
>>> albeit - as mentioned near the top - that's certainly an option).
>> I read this as a request to also add uint16_t pad after "domid_t domain"
>> at least. Correct?
> I guess I should really leave this up to you - that's largely a cosmetic
> thing after all once clearing the whole struct up front.

ok, thank you for the clarification.


>
> Jan
>
-- 
Regards,

Oleksandr Tyshchenko


