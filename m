Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BEE54F2FE
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jun 2022 10:32:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.351117.577630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o27Oe-0008Hm-SK; Fri, 17 Jun 2022 08:32:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 351117.577630; Fri, 17 Jun 2022 08:32:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o27Oe-0008FQ-P4; Fri, 17 Jun 2022 08:32:04 +0000
Received: by outflank-mailman (input) for mailman id 351117;
 Fri, 17 Jun 2022 08:32:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o27Od-0008FK-Ey
 for xen-devel@lists.xenproject.org; Fri, 17 Jun 2022 08:32:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o27Od-0006SH-31; Fri, 17 Jun 2022 08:32:03 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.0.243]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o27Oc-0006Bc-Rn; Fri, 17 Jun 2022 08:32:02 +0000
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
	bh=7wPxoulyscd6uNYV9TCtejy04qLXHbPs2WjcheNYt7s=; b=jpZWVw2KOGdqWEKFHhk7kIm5Tq
	powNX8lRAeV7Ofk9Hqih6PP1iTTAkYk4jXUokvOQOGhoTiG0gyjVwdR5ihF33x5bTdd8wDn7rqDbl
	kvrG7dqKjnjzFH30ASFDcPkg7/EzWoUotOnYnKGkG6Pl5nEtunmFggGfjJXpoSYAlOX8=;
Message-ID: <6faaa38d-63af-d962-e8de-4accb5b73ab4@xen.org>
Date: Fri, 17 Jun 2022 09:32:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH] xen/arm: avoid vtimer flip-flop transition in context
 switch
To: Wei Chen <Wei.Chen@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220615013909.283887-1-wei.chen@arm.com>
 <c48bb719-8cc6-ea8d-291d-4e09d42f93c2@xen.org>
 <PAXPR08MB7420FDB50DA7265956A3B0BC9EAD9@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <PAXPR08MB7420FDB50DA7265956A3B0BC9EAD9@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 15/06/2022 11:36, Wei Chen wrote:
> Hi Julien,

Hi Wei,

>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: 2022年6月15日 17:47
>> To: Wei Chen <Wei.Chen@arm.com>; xen-devel@lists.xenproject.org
>> Cc: nd <nd@arm.com>; Stefano Stabellini <sstabellini@kernel.org>; Bertrand
>> Marquis <Bertrand.Marquis@arm.com>; Volodymyr Babchuk
>> <Volodymyr_Babchuk@epam.com>
>> Subject: Re: [PATCH] xen/arm: avoid vtimer flip-flop transition in context
>> switch
>>>
>>> So in this patch, we adjust the formula to use "offset - boot_count"
>>> first, and then use the result to plus cval. This will avoid the
>>> uint64_t overflow.
>>
>> Technically, the overflow is still present because the (offset -
>> boot_count) is a non-zero value *and* cval is a 64-bit value.
>>
> 
> Yes, GuestOS can issue any valid 64-bit value for their usage.
> 
>> So I think the equation below should be reworked to...
>>
>>>
>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>> ---
>>>    xen/arch/arm/vtimer.c | 5 +++--
>>>    1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/vtimer.c b/xen/arch/arm/vtimer.c
>>> index 5bb5970f58..86e63303c8 100644
>>> --- a/xen/arch/arm/vtimer.c
>>> +++ b/xen/arch/arm/vtimer.c
>>> @@ -144,8 +144,9 @@ void virt_timer_save(struct vcpu *v)
>>>        if ( (v->arch.virt_timer.ctl & CNTx_CTL_ENABLE) &&
>>>             !(v->arch.virt_timer.ctl & CNTx_CTL_MASK))
>>>        {
>>> -        set_timer(&v->arch.virt_timer.timer, ticks_to_ns(v-
>>> arch.virt_timer.cval +
>>> -                  v->domain->arch.virt_timer_base.offset - boot_count));
>>> +        set_timer(&v->arch.virt_timer.timer,
>>> +                  ticks_to_ns(v->domain->arch.virt_timer_base.offset -
>>> +                              boot_count + v->arch.virt_timer.cval));
>>
>> ... something like:
>>
>> ticks_to_ns(offset - boot_count) + ticks_to_ns(cval);
>>
>> The first part of the equation should always be the same. So it could be
>> stored in struct domain.
>>
> 
> If you think there is still some values to continue this patch, I will
> address this comment : )

I think there are. This can be easily triggered by a vCPU setting a 
large cval.

Cheers,

-- 
Julien Grall

