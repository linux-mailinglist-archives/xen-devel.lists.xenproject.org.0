Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 824EF8CE331
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 11:18:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729200.1134314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAR3F-0001Fi-6B; Fri, 24 May 2024 09:17:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729200.1134314; Fri, 24 May 2024 09:17:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAR3F-0001DI-2t; Fri, 24 May 2024 09:17:25 +0000
Received: by outflank-mailman (input) for mailman id 729200;
 Fri, 24 May 2024 09:17:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sAR3E-0001DC-7y
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 09:17:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sAR3D-00066I-Rb; Fri, 24 May 2024 09:17:23 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sAR3D-0002qI-GT; Fri, 24 May 2024 09:17:23 +0000
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
	bh=9AZj1h9UOhZHEe/Py/Og1fOziSe/VD3m91jq1FB5heI=; b=cqfAA9bP8Y7fLI3W7qUv0jN1eX
	leVAPMYMBRRMnUgYAZFE6lqBPcXdbn/NI5fvc9aVROOEz5uh/zfY2pwTP99uUDBcX5RV3VSNQP3AM
	tJRAoggKdFxN9w5Te2IGcJED2IpxIvkE5buh7zTpsAByeEmSmG1PcUB2rcGqFoR65L7E=;
Message-ID: <555a80ba-3981-4b3e-877d-77ff172ac186@xen.org>
Date: Fri, 24 May 2024 10:17:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 02/14] xen: introduce generic non-atomic test_*bit()
Content-Language: en-GB
To: "Oleksii K." <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <cover.1715952103.git.oleksii.kurochko@gmail.com>
 <219df9d840a183fc55de02aff011c0972a68587c.1715952103.git.oleksii.kurochko@gmail.com>
 <1554d534-7998-4ad4-9218-579b2568b744@xen.org>
 <9f02d973c2520d36ee33d01b871378de16ede4d0.camel@gmail.com>
 <a535a3fc-5b90-454f-8d3f-202de631bc49@xen.org>
 <82b8828112ffb05170472310d7d510ceb4edc555.camel@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <82b8828112ffb05170472310d7d510ceb4edc555.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Oleksii,

On 24/05/2024 09:58, Oleksii K. wrote:
> On Thu, 2024-05-23 at 15:33 +0100, Julien Grall wrote:
>>>>>      #include <asm/bitops.h>
>>>>>      
>>>>> +/**
>>>>> + * generic__test_and_set_bit - Set a bit and return its old
>>>>> value
>>>>> + * @nr: Bit to set
>>>>> + * @addr: Address to count from
>>>>> + *
>>>>> + * This operation is non-atomic and can be reordered.
>>>>> + * If two examples of this operation race, one can appear to
>>>>> succeed
>>>>> + * but actually fail.  You must protect multiple accesses with
>>>>> a
>>>>> lock.
>>>>> + */
>>>>
>>>> Sorry for only mentioning this on v10. I think this comment
>>>> should be
>>>> duplicated (or moved to) on top of test_bit() because this is
>>>> what
>>>> everyone will use. This will avoid the developper to follow the
>>>> function
>>>> calls and only notice the x86 version which says "This function
>>>> is
>>>> atomic and may not be reordered." and would be wrong for all the
>>>> other arch.
>>> It makes sense to add this comment on top of test_bit(), but I am
>>> curious if it is needed to mention that for x86 arch_test_bit() "is
>>> atomic and may not be reordered":
>>
>> I would say no because any developper modifying common code can't
>> relying it.
> But won't then be confusion that if not generic implementation of
> test_bit() is chosen then test_bit() can be " atomic and cannot be
> reordered " ( as it is in case of x86 )?

I don't understand what confusion could arise. A developper cannot rely 
on the x86 behavior in common code. They have to write code that works 
for every arch.

The first thing a developer will do is to check test_bit(). The comment 
on top will say they can't relying on ordering. And that what most of 
the developper needs to rely on.

If someone wants to write more optimized code for x86, they are free to 
look at the implementation. But I don't think this should be detailed on 
top of the common wrapper (the x86 implementation would still be 
compatible with the comment).

Cheers,

-- 
Julien Grall

