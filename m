Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1F8AB6515
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 10:02:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984036.1370203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF74E-0005YR-GA; Wed, 14 May 2025 08:02:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984036.1370203; Wed, 14 May 2025 08:02:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF74E-0005WX-DZ; Wed, 14 May 2025 08:02:18 +0000
Received: by outflank-mailman (input) for mailman id 984036;
 Wed, 14 May 2025 08:02:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uF74D-0005Vt-1S
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 08:02:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uF74C-008HVr-1y;
 Wed, 14 May 2025 08:02:16 +0000
Received: from [2a02:8012:3a1:0:51a6:3d91:4273:769]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uF74B-00F8B5-2w;
 Wed, 14 May 2025 08:02:16 +0000
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
	bh=jT2lqUZoz7zBZkRttb4zUM3DhizvcmqXr0HGFHC5DVQ=; b=Uk7k5U8OjLJsTk7Y4kYMIQBNZ9
	bARPMfAAbc7JNmjaMaYilMTjQzVZW5t2zxQ33j5iL31qwqXApPej2dVq0MqU3RA7SBtMewoeyZ3A4
	6li02I2f42h4EnRqG6TyorloPK9pY0Quah9tvZcf1E6nCeE70wMyq+Eqf3GARtd3H36E=;
Message-ID: <e8cfe2c8-6ae6-43e6-89f0-3c7ed7d49240@xen.org>
Date: Wed, 14 May 2025 09:02:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/dom0less: mark domain_p2m_set_allocation __init
Content-Language: en-GB
To: "Orzel, Michal" <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <20250513171810.668370-1-stewart.hildebrand@amd.com>
 <alpine.DEB.2.22.394.2505131707020.368682@ubuntu-linux-20-04-desktop>
 <cacb0002-dd6b-49e5-8019-2d323771e3e7@amd.com>
 <4e684e38-ed64-4731-8f00-afba938a28a0@suse.com>
 <369ccaf5-5c17-4601-88b0-eb32af8608d6@amd.com>
 <ade0c506-089a-47e6-b4a5-5498311ae38d@xen.org>
 <ec9f265f-f33b-4b03-8139-dab0f9ad7aae@amd.com>
 <00cc8940-9a6d-44b9-ba8b-18fe34e6d6d1@xen.org>
 <61f60a77-637b-488b-b101-1ac0296a7e96@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <61f60a77-637b-488b-b101-1ac0296a7e96@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 14/05/2025 08:59, Orzel, Michal wrote:
> 
> 
> On 14/05/2025 09:55, Julien Grall wrote:
>>
>>
>> On 14/05/2025 08:52, Orzel, Michal wrote:
>>>
>>>
>>> On 14/05/2025 09:37, Julien Grall wrote:
>>>> Hi Michal,
>>>>
>>>> On 14/05/2025 08:04, Orzel, Michal wrote:
>>>>>
>>>>>
>>>>> On 14/05/2025 08:56, Jan Beulich wrote:
>>>>>> On 14.05.2025 08:31, Orzel, Michal wrote:
>>>>>>> On 14/05/2025 02:07, Stefano Stabellini wrote:
>>>>>>>> On Tue, 13 May 2025, Stewart Hildebrand wrote:
>>>>>>>>> All functions in dom0less-build.c should be __init.
>>>>>>> Why? This patch is first in your series and by that time there is no build time
>>>>>>> enforcement. Together with the Fixes tag it implies that this is somehow an
>>>>>>> issue (i.e. build/runtime issue) other than inconsistency for which we surely
>>>>>>> don't need Fixes tag.
>>>>>>
>>>>>> I disagree: Code not called post-init should be in .init.*. While not formally
>>>>>> a Misra violation (and wrongly so, I think), it imo effectively is: Such code
>>>>>> is otherwise unreachable post-init.
>>>>> You have a point here, I agree. Although I don't think MISRA differentiates
>>>>> between unreachable in general vs pre or post init. It defines it as code that
>>>>> cannot be executed. It does not go into stages of runtime execution.
>>>>>
>>>>> I'm thinking how this is different from a function that is called e.g. only once
>>>>> at specific point at runtime execution for which we did not come up with a
>>>>> separate section?
>>>>
>>>> Along with what Jan said, in general there is some relaxation for the
>>>> boot code. For instance, we could accept if it panic.
>>>>
>>>> There is at least one of the place in domain_build.c which panic() and
>>>> the parsing is not meant to be fully robust. So this code either need to
>>>> be __init (as this was the intention from when the feature was created)
>>>> or you need to fully harden the code.
>>> What is this place?
>>
>> static void __init initialize_domU_xenstore(void)
>> {
>> [...]
>>           rc = alloc_xenstore_evtchn(d);
>>           if ( rc < 0 )
>>               panic("%pd: Failed to allocate xenstore_evtchn\n", d);
>> }
> Sorry, I am a bit lost, maybe I don't understand your reply. Do you mean we need
> to do sth about it (I can see it's __init and we have panic) or this is just an
> example?

I was providing an example of why we enforce to enforce __init for 
dom0-build.

Cheers,

-- 
Julien Grall


