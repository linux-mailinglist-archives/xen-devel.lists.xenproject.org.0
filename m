Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A317585324
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jul 2022 17:59:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377634.610911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHSOp-0006Pb-55; Fri, 29 Jul 2022 15:59:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377634.610911; Fri, 29 Jul 2022 15:59:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHSOp-0006Nr-2J; Fri, 29 Jul 2022 15:59:39 +0000
Received: by outflank-mailman (input) for mailman id 377634;
 Fri, 29 Jul 2022 15:59:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oHSOn-0006Nl-Ld
 for xen-devel@lists.xenproject.org; Fri, 29 Jul 2022 15:59:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oHSOi-0005jB-UQ; Fri, 29 Jul 2022 15:59:32 +0000
Received: from [54.239.6.186] (helo=[192.168.0.45])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oHSOi-0006zz-ML; Fri, 29 Jul 2022 15:59:32 +0000
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
	bh=G36eaP2HJ4Q7C49hQY4QzeQlZaIzCgSlB29yOgxMbnQ=; b=hm+NnHgNUBtinoNqV6aZjEAXd7
	tKP6SMmTflVxJFjSd2Y843nyFMTvMqqcvkA6o9ZsPWXQ0wve1JY5YK8c2TOmzwh25YYmxPvdxuX8r
	ZpgpbmQy2fduSlj8CltJq7LrwMF0lPi+TxY+lrviiJkVOQgNktdQKobQOxTqWFjpmm+E=;
Message-ID: <50e13d08-7f7c-abea-f616-5a312d787b4a@xen.org>
Date: Fri, 29 Jul 2022 16:59:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.0.3
Subject: Re: [PATCH v3] xen/arm: domain: Fix MISRA C 2012 Rule 8.7 violation
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220728162151.1228747-1-burzalodowa@gmail.com>
 <65adc941-78a9-2e2d-fa43-6189ea95773d@suse.com>
 <b9f3bbc1-e6ec-35c3-6ff6-35e051c86953@gmail.com>
 <4327CBBD-315D-44C0-A429-25F3CA5BE25D@arm.com>
 <01bb7315-91a1-de7a-2c17-c6772f740619@gmail.com>
 <fa07bef2-8f0e-affe-0965-65156bdcc84d@xen.org>
 <de13b11f-6ef8-fc89-82da-72915f1fb76f@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <de13b11f-6ef8-fc89-82da-72915f1fb76f@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 29/07/2022 16:47, Xenia Ragiadakou wrote:
> On 7/29/22 18:15, Julien Grall wrote:
>> Hi Xenia,
>>
>> On 29/07/2022 15:03, Xenia Ragiadakou wrote:
>>>
>>> On 7/29/22 16:41, Bertrand Marquis wrote:
>>>> Hi Xenia,
>>>>
>>>>> On 29 Jul 2022, at 07:31, Xenia Ragiadakou <burzalodowa@gmail.com> 
>>>>> wrote:
>>>>>
>>>>> Hi Jan,
>>>>>
>>>>> On 7/29/22 09:26, Jan Beulich wrote:
>>>>>> On 28.07.2022 18:21, Xenia Ragiadakou wrote:
>>>>>>> --- a/xen/arch/arm/domain.c
>>>>>>> +++ b/xen/arch/arm/domain.c
>>>>>>> @@ -63,7 +63,7 @@ static void do_idle(void)
>>>>>>>       rcu_idle_exit(cpu);
>>>>>>>   }
>>>>>>>   -void idle_loop(void)
>>>>>>> +static void idle_loop(void)
>>>>>> While you're adding "noreturn" below, shouldn't this one be marked so
>>>>>> as well? Preferably with the addition:
>>>>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>>>>
>>>>> Yes, but I was not sure if this should go in this patch or in a 
>>>>> separate one.
>>>>
>>>> As you modify the function to make it static, I think it is ok to 
>>>> also add the noreturn in the same patch.
>>>>
>>>> With that done, you can add my:
>>>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>>>
>>>> Cheers
>>>> Bertrand
>>>
>>> I consider this change unrelated to the patch. I think it is a bad 
>>> practice to squash unrelated changes in a single patch. Also, I do 
>>> not think it is unfair to be obliged to make it in order for the 
>>> patch to be accepted.
>>> I could have taken the opportunity to fix this in the same patch but 
>>> I decided to not take it.
>>
>> In general, I don't like having multiple changes within a patch. 
>> However, here this is a consistency problem. You are modifying the 3 
>> prototypes (well one is technically a declaration) and it reads odd 
>> that 2 are using noreturn but not the other one.
>>
> 
> The patch adds the 2 function declarations, it does not modify them.

Fair enough, you are adding 2 declarations and modifying one. This 
doesn't change the inconsistency problem though.

> Since they do not return, they are declared noreturn.
> If the function idle_loop was not declared noreturn, although it should 
> have been, for me is a completely different issue.
[...]

> I do not agree with you saying that the patch introduced this 
> inconsistency. The function idle_loop should have been declared noreturn 
> in the first place.

I think everyone involved in the discussion agrees that idle_loop() 
should have been marked as noreturn from the start.

And we all agree that this needs to be fixed. So I don't think this is 
particularly useful to spend time arguing on whether this needs to be 
handled within or separately. 3 of the reviewers agree that this should 
be preferably added here. So...

> If you would like to fix this in the current patch, 
> it is up to you.

... I will commit it with the change on the next swipe.

Cheers,

-- 
Julien Grall

