Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC804C684F
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 11:52:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280375.478303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOddh-0004u8-Ts; Mon, 28 Feb 2022 10:52:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280375.478303; Mon, 28 Feb 2022 10:52:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOddh-0004rx-Py; Mon, 28 Feb 2022 10:52:25 +0000
Received: by outflank-mailman (input) for mailman id 280375;
 Mon, 28 Feb 2022 10:52:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nOddg-0004rr-CI
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 10:52:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nOddb-0003A4-1s; Mon, 28 Feb 2022 10:52:19 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[192.168.13.237]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nOdda-00088S-RW; Mon, 28 Feb 2022 10:52:18 +0000
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
	bh=mL6WHjWnkX1s4k/eEgkeRtgtPNPagl79wz+BIyPKcQI=; b=uhzjYr4oz1lJLqZ08unqjCz5nw
	ToGkh9bfbKevbdk1b3kBcWlx61H0QdYsXnCpE3rNfk9EZ35qQ1mo3KsjZD7ZM5D3Ee8HfjpSwSjDO
	S6u8cio5iCiQaFiwqc6jAUmuLziCdOhb7uq1WuMbUskF+s0WXvDv7vM1afT3M3ON9ERk=;
Message-ID: <0fea3c06-b0b5-2726-f25f-10436258782c@xen.org>
Date: Mon, 28 Feb 2022 10:52:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v3 14/19] xen/arm: add Persistent Map (PMAP)
 infrastructure
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Hongyan Xia <hongyxia@amazon.com>,
 Julien Grall <jgrall@amazon.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220221102218.33785-1-julien@xen.org>
 <20220221102218.33785-15-julien@xen.org>
 <fea3b34c-d605-be27-f75e-722b39cc48e3@suse.com>
 <ecb68523-1881-214a-b1e4-b239fed6ddce@xen.org>
 <5d218b78-876f-71c2-ec73-9958c7e472ea@suse.com>
 <c55d7cb3-3d9d-59d3-6d85-69c115c8da89@xen.org>
 <9cb96dda-5450-6127-0eef-66aa2fb670fd@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <9cb96dda-5450-6127-0eef-66aa2fb670fd@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 28/02/2022 10:30, Jan Beulich wrote:
> On 28.02.2022 11:20, Julien Grall wrote:
>> On 28/02/2022 10:10, Jan Beulich wrote:
>>> On 28.02.2022 10:55, Julien Grall wrote:
>>>> On 22/02/2022 15:22, Jan Beulich wrote:
>>>>> On 21.02.2022 11:22, Julien Grall wrote:
>>>>>> +    /*
>>>>>> +     * We cannot use set_fixmap() here. We use PMAP when there is no direct map,
>>>>>> +     * so map_pages_to_xen() called by set_fixmap() needs to map pages on
>>>>>> +     * demand, which then calls pmap() again, resulting in a loop. Modify the
>>>>>> +     * PTEs directly instead. The same is true for pmap_unmap().
>>>>>> +     */
>>>>>> +    arch_pmap_map(slot, mfn);
>>>>>
>>>>> I'm less certain here, but like above I'm under the impression
>>>>> that this comment may no longer be accurate.
>>>>
>>>> This comment is still accurate for Arm. I also expect it to be accurate
>>>> for all architectures because set_fixmap() is likely going to be
>>>> implemented with generic PT helpers.
>>>>
>>>> So I think it makes sense to keep it in common code. This explains why
>>>> we are calling arch_pmap_map() rather than set_fixmap() directly.
>>>
>>> I guess I was rather after "when there is no direct map" alluding to the
>>> planned removal of it on x86.
>> It is one way to interpret it. The other way is that pmap will be used
>> when the directmap is not yet in place.
>>
>> But I guess I could be less specific and refers to the fact the domain
>> page infrastructure is not yet setup. Would that be better for you?
> 
> That or simply add "(yet)" to what is there.

I will do that in the next version.

Thanks!

Cheers,

-- 
Julien Grall

