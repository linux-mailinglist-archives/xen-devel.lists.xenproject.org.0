Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E00890829
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 19:21:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699153.1091786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpuNB-0003EN-GD; Thu, 28 Mar 2024 18:21:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699153.1091786; Thu, 28 Mar 2024 18:21:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpuNB-0003CJ-De; Thu, 28 Mar 2024 18:21:09 +0000
Received: by outflank-mailman (input) for mailman id 699153;
 Thu, 28 Mar 2024 18:21:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rpuN9-0003CB-GO
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 18:21:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rpuN6-0000dJ-9o; Thu, 28 Mar 2024 18:21:04 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rpuN5-0004YG-VW; Thu, 28 Mar 2024 18:21:04 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=LVwuqNbWmNIdQGMsknjb9crp53/xlgANmbKy0dpt2+o=; b=GofVg9DJkdDTqenEzPzmTvglVJ
	IDAhhcL/oQEbB6+43dsBnQHwoMso6uDz+096ZVxX3xVp9I5CWRysH4Aj/54tPNjAcpiMYDcyU+9tD
	CuYZ9vp5QMb40wI1vX4LGYjuUtue2E8d3wLm9UjBVzaYBIeRmwoTVXQ/WYcRtlDFgidA=;
Message-ID: <d226de71-22b9-46fa-8e6e-c6bd0c243140@xen.org>
Date: Thu, 28 Mar 2024 18:21:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 08/14] xen/page_alloc: introduce preserved page flags
 macro
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
To: Jan Beulich <jbeulich@suse.com>,
 Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
 <20240315105902.160047-9-carlo.nonato@minervasys.tech>
 <3f615066-a792-493f-ba33-7667a6557c23@xen.org>
 <9e0f7ff3-5457-41e4-a1e4-bf75804fb900@xen.org>
 <255be735-f9fe-4e39-a24e-2f6aff91acc5@suse.com>
 <CAG+AhRWMh2quv3SNPJQ61au=e6gtdXUO7j-XVYV6chDmktqkvA@mail.gmail.com>
 <3427132d-9458-4447-b667-d2ef3c1f0569@suse.com>
 <CAG+AhRXE7cMNnDNxZeF=o7wBXKUtwvMj6Y5oRy-UrpDyAfM5Cw@mail.gmail.com>
 <f7bde6a7-1e48-4074-b8f5-094fa0d6a593@suse.com>
 <fbc17f7a-b07d-4508-902f-9fc021bc9a19@xen.org>
 <CAG+AhRW2=kaxsAJ6JO+j6xy4C8Mv81j9hb=muZKT30O+Zdp0Vw@mail.gmail.com>
 <54156e94-3630-49b1-8a22-5cd4206d565f@xen.org>
 <fe433260-c8c9-419d-8b05-50e2cc50d127@suse.com>
 <cdee3c70-c1cc-4787-8d75-ac00c95463b7@xen.org>
In-Reply-To: <cdee3c70-c1cc-4787-8d75-ac00c95463b7@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Replying to myself.

On 27/03/2024 13:48, Julien Grall wrote:
> On 27/03/2024 13:38, Jan Beulich wrote:
>> On 27.03.2024 14:28, Julien Grall wrote:
>>> Hi Carlo,
>>>
>>> On 27/03/2024 11:10, Carlo Nonato wrote:
>>>> Hi guys,
>>>>
>>>>> Question is: How would you justify such a change? IOW I'm not 
>>>>> convinced
>>>>> (yet) this wants doing there.
>>>>
>>>> You mean in this series?
>>>>
>>>>> Looking at the code, the flag is originally set in
>>>>> alloc_domheap_pages(). So I guess it would make sense to do it in
>>>>> free_domheap_pages().
>>>>
>>>> We don't hold the heap_lock there.
>>> Regardless of the safety question (I will answer below), count_info is
>>> not meant to be protected by heap_lock. The lock is protecting the heap
>>> and ensure we are not corrupting them when there are concurrent call to
>>> free_heap_pages().
>>>
>>>   > Is it safe to change count_info without it?
>>>
>>> count_info is meant to be accessed locklessly. The flag PGC_extra cannot
>>> be set/clear concurrently because you can't allocate a page that has not
>>> yet been freed.
>>>
>>> So it would be fine to use clear_bit(..., ...);
>>
>> Actually we hardly ever use clear_bit() on count_info. Normally we use
>> ordinary C operators.
> 
> I knew you would say that. I am not convince it is safe to always using 
> count_info without any atomic operations. But I never got around to 
> check all them.
> 
>> Atomic (and otherwise lockless) updates are useful
>> only if done like this everywhere.
> 
> You are right. But starting to use the bitops is not going to hurt 
> anyone (other than maybe performance, but once we convert all of them, 
> then this will become moot). In fact, it helps start to slowly move 
> towards the aim to have count_info safe.

I think I managed to convince myself that, count_info |= ... is fine in 
this case and no locking is necessary.

Cheers,

-- 
Julien Grall

