Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0091751D5A
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 11:35:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563054.879991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJsiK-00067z-Bc; Thu, 13 Jul 2023 09:34:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563054.879991; Thu, 13 Jul 2023 09:34:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJsiK-000660-8m; Thu, 13 Jul 2023 09:34:20 +0000
Received: by outflank-mailman (input) for mailman id 563054;
 Thu, 13 Jul 2023 09:34:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qJsiJ-00065u-5H
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 09:34:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qJsiI-0004O5-38; Thu, 13 Jul 2023 09:34:18 +0000
Received: from [15.248.2.150] (helo=[10.24.67.22])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qJsiH-0001eZ-Th; Thu, 13 Jul 2023 09:34:18 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=bcoc3IJFFi4Cq0DgAnGjf5qqSfL5e2opArg8uGrYNZM=; b=RO+I4Q+V9tYw3MoqA4L/5wsrkG
	3pHRQBmDc0ONcF+WRwxl0AFtAUEAnfsE22PyuwPT0VfGaV3RnEahqRJziWnm6SdyT1+MNwygWmnO0
	kKyZn1ZqwruSMaXeSjqjTiEpqiW0FGuIYjC75Uyie4iP4vetTSIf2IoEzvblAF9x7sTY=;
Message-ID: <3f853d77-f1a3-3031-cd83-6826dc9d966f@xen.org>
Date: Thu, 13 Jul 2023 10:34:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v9 02/24] xen/arm: add TEE teardown to
 arch_domain_teardown()
Content-Language: en-US
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand.Marquis@arm.com,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Wei Liu <wl@xen.org>, Marc Bonnici <marc.bonnici@arm.com>,
 Achin Gupta <achin.gupta@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20230705093433.2514898-1-jens.wiklander@linaro.org>
 <20230705093433.2514898-3-jens.wiklander@linaro.org>
 <b1a9be99-6078-6553-74f1-5be5f002b23d@xen.org>
 <CAHUa44FxkUxN4+pfECk0Sb9JgArNAh7vgKktK+=bY1C0rABVqg@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CAHUa44FxkUxN4+pfECk0Sb9JgArNAh7vgKktK+=bY1C0rABVqg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13/07/2023 08:02, Jens Wiklander wrote:
>>> +}
>>> +
>>>    static uint64_t regpair_to_uint64(register_t reg0, register_t reg1)
>>>    {
>>>        return ((uint64_t)reg0 << 32) | (uint32_t)reg1;
>>> @@ -1732,6 +1737,7 @@ static const struct tee_mediator_ops optee_ops =
>>>    {
>>>        .probe = optee_probe,
>>>        .domain_init = optee_domain_init,
>>> +    .domain_teardown = optee_domain_teardown,
>>>        .relinquish_resources = optee_relinquish_resources,
>>>        .handle_call = optee_handle_call,
>>>    };
>>> diff --git a/xen/arch/arm/tee/tee.c b/xen/arch/arm/tee/tee.c
>>> index 3964a8a5cddf..ddd17506a9ff 100644
>>> --- a/xen/arch/arm/tee/tee.c
>>> +++ b/xen/arch/arm/tee/tee.c
>>> @@ -52,6 +52,14 @@ int tee_domain_init(struct domain *d, uint16_t tee_type)
>>>        return cur_mediator->ops->domain_init(d);
>>>    }
>>>
>>> +int tee_domain_teardown(struct domain *d)
>>> +{
>>> +    if ( !cur_mediator )
>>> +        return 0;
>>> +
>>> +    return cur_mediator->ops->domain_teardown(d);
>>
>> NIT: I would consider to check if the callback is NULL. This would avoid
>> providing dummy helper.
> 
> Yes, that's an advantage, but we'd treat this callback differently
> from others. 

I haven't checked the rest of the callbacks. But I would argue that any 
callback that are expected to be optional, should have an if 
(...->ops->fn). This reducing the amount of dummy helper (4 lines) each 
times.

> I'd prefer to keep this as it is if you don't mind.
I am Ok with that. Once FFA is merged, I will try to remember to go 
through the callback and there the empty ones.

Cheers,

-- 
Julien Grall

