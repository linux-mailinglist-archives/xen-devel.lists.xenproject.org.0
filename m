Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3DDB439B6
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 13:18:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1109856.1459260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu7yZ-0003Zx-Lc; Thu, 04 Sep 2025 11:17:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1109856.1459260; Thu, 04 Sep 2025 11:17:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu7yZ-0003Xw-IA; Thu, 04 Sep 2025 11:17:59 +0000
Received: by outflank-mailman (input) for mailman id 1109856;
 Thu, 04 Sep 2025 11:17:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MJB8=3P=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1uu7yY-0003Xq-Ly
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 11:17:58 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce9c75cf-8980-11f0-9809-7dc792cee155;
 Thu, 04 Sep 2025 13:17:56 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-336d84b58edso9296051fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 04 Sep 2025 04:17:56 -0700 (PDT)
Received: from [192.168.0.110] ([91.123.151.69])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f50bfda3sm14694061fa.62.2025.09.04.04.17.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Sep 2025 04:17:55 -0700 (PDT)
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
X-Inumbo-ID: ce9c75cf-8980-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756984676; x=1757589476; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HBdwJF9jipzdshi0RpBlHO4oeC+gshQOme168Ak0B4k=;
        b=EaIJUGyKspmJhudvEAAdwCn1gI8MjwaJJkF3X/X7nhoWw63TuPg22huWkj9CLXAKqf
         KgmYBqCzfXH+3IttxZ98QWhHea2utom1W691KwUGafayh3ZDq6bd+FKand7EZxlTQ2uO
         BBD9WpW+APZg0p/TZa1JQkLuM9LidSuUUZOpaX8JiCOKYbtxJ9oPHnzahinDFr358AgS
         uuQxpRwNvY280geqzDkVJDC4Vdo3C633hXrsnuhYeEfI71n+SCVFcWQ872RwYwJJkE9/
         x72grxSFetCXBXswZ9pLvF61Xu9ib2QU8qkn2ylVo4TpdPw2afNtEYHFhpkviUgSDuwr
         AdSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756984676; x=1757589476;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HBdwJF9jipzdshi0RpBlHO4oeC+gshQOme168Ak0B4k=;
        b=mGUCyajVh6RWHNtbecLrlwNkxJXDvUoPe/wBoYL0PD4UVoPO8HsheFqOvItfV4qnNe
         uPAHPMZ9eriC5nN8ksjHLfPTdp/kbrY9ZAc8IT3/0nZarp8VWfIydHsyGJcafAd17YHv
         4J8XlPT3153WUuzToH29fN2XL1KqYSTEcJ5RNJC3Dc2WurFyghc2FPGNhLWHGmy5ST9U
         sJ48aqZyEj6gtyRQzCVfwpn1BXdONcnktNy0hpuZm9f4EFGXXrgOVZ9d3Nksb3leGzy/
         fEHQrilLrINBcK26yz/3B9jU2UTV1yDDEce0cNbq9zna+bD2yHbQma4njC/1+8XfYgfs
         qjOw==
X-Gm-Message-State: AOJu0YxBGONtIEJ4V1x7/fkwJefL2jY7ovqvIDc3j4z8o4++yGOfvjj8
	Fl7yblUmvwXp7X1+4h6skSdLq3bTEm9KcSA4A4CMLytP6QOdvwvqA7mc
X-Gm-Gg: ASbGnctSV4ntPVt7hKhWBTJtphaO2mXxo3tG9Xg0BVk8PdB2brFQl6p2VMqx20tGtcL
	eHTslFjdDkqUDxu404iZz9U4MrPHUPxrgiUo+VqeedBuCtnG4kIH/PR51J8y4tenMdwZQ9ntPLo
	DKJVmMHGK3tSvSyaTdsWKl3yxMrqWqBf3DRl4j/+zXk/VXC7CDTsPG0vBpdVPm3xNmhp3g/OAxZ
	pezgDLJwmJEJ5+wf/yBsmN1eBdKi4QZNT+DcpJAfZpfhaNBWqVHUCQjhKuz9kRYLlECqY0kvjtk
	oZAftjiG7jGDXbIoa4aVUKXOTxkC/C9xMCMFCdTrYJNsnYLMJqNZb801G1YW4EHX1zegmLTR4Oa
	bld699RLrjyPvgA1FIeF2LORT7g==
X-Google-Smtp-Source: AGHT+IFskoRzcRASuGpMI/HEWiRnnTXPwIYfiu2FcCW4wwztEH2o8dRtvj8iEquCajBK/1Cw7S+kXA==
X-Received: by 2002:a2e:b8c1:0:b0:336:de52:f455 with SMTP id 38308e7fff4ca-336de52f908mr46742001fa.13.1756984675615;
        Thu, 04 Sep 2025 04:17:55 -0700 (PDT)
Message-ID: <c3ab5e0a-b78f-4e08-8022-ba094b467c05@gmail.com>
Date: Thu, 4 Sep 2025 14:17:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/12] xen/arm: vgic-v3: add emulation of GICv3.1 eSPI
 registers
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <cover.1756908472.git.leonid_komarianskyi@epam.com>
 <345da260fcb3bb400834f8a59dacfda8b37440a1.1756908472.git.leonid_komarianskyi@epam.com>
 <cb34378c-95c7-4618-8aeb-a7b7c5c97f2d@gmail.com> <87plc7tdxx.fsf@epam.com>
 <13ed364c-bec3-4c3e-a451-7bc312b2db9d@xen.org>
 <1ec20c31-2ece-4d31-97e2-72995b6aa2b6@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <1ec20c31-2ece-4d31-97e2-72995b6aa2b6@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 04.09.25 08:52, Leonid Komarianskyi wrote:
> Hi Julien, Volodymyr and Oleksandr,


Hello all

> 
> Thank you for your comments.
> 
> On 04.09.25 02:04, Julien Grall wrote:
>> Hi,
>>
>> On 03/09/2025 22:37, Volodymyr Babchuk wrote:
>>> Hi Oleksandr,
>>>
>>> Oleksandr Tyshchenko <olekstysh@gmail.com> writes:
>>>
>>>
>>> [...]
>>>
>>>>> +static inline uint32_t vgic_get_reg_offset(uint32_t reg, uint32_t
>>>>> spi_base,
>>>>> +                                           uint32_t espi_base)
>>>>> +{
>>>>> +    if ( reg < espi_base )
>>>>> +        return reg - spi_base;
>>>>> +    else
>>>>> +        return reg - espi_base;
>>>>> +}
>>>>
>>>> I am wondering (I do not request a change) whether
>>>> vgic_get_reg_offset() is really helpfull,
>>>> e.g. is
>>>>    offset = vgic_get_reg_offset(reg, GICD_IPRIORITYR, GICD_IPRIORITYRnE);
>>>> much better than:
>>>>    offset = reg < GICD_IPRIORITYRnE ? reg - GICD_IPRIORITYR : reg -
>>>>    GICD_IPRIORITYRnE;
>>   >>>
>>> IMO, it is easy to make a mistake, because you need to write register
>>> name 3 times. Can cause errors during copy-pasting.
>>
>> +1.
>>
>>    But I saw clever
>>> trick by Mykola Kvach, something like this:
>>>
>>> #define vgic_get_reg_offset(addr, reg_name) ( addr < reg_name##nE ? \
>>>    addr - reg_name : addr - reg_name##nE )
>>>
>>> And then you can just use this as
>>>
>>> offset = vgic_get_reg_offset(reg, GICD_IPRIORITYR)
>>>
>>> I don't know what maintainers think about this type of preprocessor
>>> trickery, but in my opinion it is justified in this case, because it
>>> leaves less room for a mistake.
>>
>> I don't have a strong opinion between the macro version or the static
>> inline helper. However:
>>     * for the macro version, you want to store 'addr' in a local variable
>> to ensure it is only evaluated once.
>>     * for both case, I would prefer if we assert (for the static inline
>> helper) or use BUILD_BUG_ON() to confirm that spi_base < espi_base
>>
>> Cheers,
>>
> 
> I was considering introducing this kind of macro, but I think it may
> lead to issues in the future because it requires us to always maintain
> the pattern reg_name/reg_name##nE for all registers. I understand that
> the names of the defines are unlikely to change, but I would prefer to
> use an inline function along with the suggested ASSERT(), as it seems
> more versatile to me.

I was leaning more towards the macro, but would be happy with static 
inline helper (my R-b will stay).

I guess, the suggested ASSERT() for the static inline
helper vgic_get_reg_offset would be also applicable for helper 
vgic_get_rank (or whatever name it will gain).

> 
> Best regards,
> Leonid


