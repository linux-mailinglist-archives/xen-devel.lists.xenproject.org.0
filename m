Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D9190EB37
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2024 14:35:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743789.1150773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJuW7-0000tH-Qu; Wed, 19 Jun 2024 12:34:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743789.1150773; Wed, 19 Jun 2024 12:34:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJuW7-0000q9-Nh; Wed, 19 Jun 2024 12:34:23 +0000
Received: by outflank-mailman (input) for mailman id 743789;
 Wed, 19 Jun 2024 12:34:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sJuW6-0000q3-Ea
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2024 12:34:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sJuW5-00035u-UX; Wed, 19 Jun 2024 12:34:21 +0000
Received: from [15.248.3.90] (helo=[10.24.67.26])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sJuW5-0005Ss-NX; Wed, 19 Jun 2024 12:34:21 +0000
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
	bh=KgQ6dB12ouTGXDm+tZ/XwVHqmjS9BEjxZMeNYcchX5A=; b=ek1qGwTNyji1AMYiYzYOPy16SM
	lIKPVf9VtH0+KlhYlR1QVLGeVWxVjqOnXiS+Gj9T0XAnQIMQUzUJ4lvrN3fFAV5GIm4+yyNKgvvDj
	x1Ch0VpFpvP3GDhvv/0fq5gITW91EEMjP3GaDMfSUUA4ppGo0PvpU5jfF5k4UKXSO91w=;
Message-ID: <7bffdbeb-0219-4ec7-a70f-a9fa55cd6b5e@xen.org>
Date: Wed, 19 Jun 2024 13:34:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] xen/arm: static-shmem: fix "gbase/pbase used
 uninitialized" build failure
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240619064652.18266-1-michal.orzel@amd.com>
 <82790448-dd2f-4299-ae3d-938080ee5e19@xen.org>
 <99fb367a-7ceb-4769-8120-a06474e98fb3@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <99fb367a-7ceb-4769-8120-a06474e98fb3@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 19/06/2024 13:06, Michal Orzel wrote:
> Hi Julien,
> 
> On 19/06/2024 13:55, Julien Grall wrote:
>>
>>
>> Hi Michal,
>>
>> On 19/06/2024 07:46, Michal Orzel wrote:
>>> Building Xen with CONFIG_STATIC_SHM=y results in a build failure:
>>>
>>> arch/arm/static-shmem.c: In function 'process_shm':
>>> arch/arm/static-shmem.c:327:41: error: 'gbase' may be used uninitialized [-Werror=maybe-uninitialized]
>>>     327 |         if ( is_domain_direct_mapped(d) && (pbase != gbase) )
>>> arch/arm/static-shmem.c:305:17: note: 'gbase' was declared here
>>>     305 |         paddr_t gbase, pbase, psize;
>>>
>>> This is because the commit cb1ddafdc573 adds a check referencing
>>> gbase/pbase variables which were not yet assigned a value. Fix it.
>>>
>>> Fixes: cb1ddafdc573 ("xen/arm/static-shmem: Static-shmem should be direct-mapped for direct-mapped domains")
>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>> ---
>>> Rationale for 4.19: this patch fixes a build failure reported by CI:
>>> https://gitlab.com/xen-project/xen/-/jobs/7131807878
>>> ---
>>>    xen/arch/arm/static-shmem.c | 13 +++++++------
>>>    1 file changed, 7 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
>>> index c434b96e6204..cd48d2896b7e 100644
>>> --- a/xen/arch/arm/static-shmem.c
>>> +++ b/xen/arch/arm/static-shmem.c
>>> @@ -324,12 +324,6 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>>>                printk("%pd: static shared memory bank not found: '%s'", d, shm_id);
>>>                return -ENOENT;
>>>            }
>>> -        if ( is_domain_direct_mapped(d) && (pbase != gbase) )
>>> -        {
>>> -            printk("%pd: physical address 0x%"PRIpaddr" and guest address 0x%"PRIpaddr" are not direct-mapped.\n",
>>> -                   d, pbase, gbase);
>>> -            return -EINVAL;
>>> -        }
>>>
>>>            pbase = boot_shm_bank->start;
>>>            psize = boot_shm_bank->size;
>>> @@ -353,6 +347,13 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>>>                /* guest phys address is after host phys address */
>>>                gbase = dt_read_paddr(cells + addr_cells, addr_cells);
>>>
>>> +            if ( is_domain_direct_mapped(d) && (pbase != gbase) )
>>> +            {
>>> +                printk("%pd: physical address 0x%"PRIpaddr" and guest address 0x%"PRIpaddr" are not direct-mapped.\n",
>>> +                       d, pbase, gbase);
>>> +                return -EINVAL;
>>> +            }
>>> +
>>
>> Before this patch, the check was globally. I guess the intention was it
>> covers the two part of the "if". But now, you only have it in when
>> "paddr" is specified in the DT.
>>
>>   From a brief look at the code, I can't figure out why we don't need a
>> similar check on the else path. Is this because it is guarantee that
>> will be paddr == gaddr?
> The reason why I added this check only in the first case is due to what doc states.
> It says that if a domain is 1:1, the shmem should be also 1:1 i.e. pbase == gbase. In the else
> case the pbase is omitted and thus a user cannot know and has no guarantee what will be the backing physical address.

The property "direct-map" has the following definition:

"- direct-map

     Only available when statically allocated memory is used for the domain.
     An empty property to request the memory of the domain to be
     direct-map (guest physical address == physical address).
"

So I think it would be fair for someone to interpret it as shared memory 
would also be 1:1 mapped.

> Thus, reading this doc makes me feel that for 1:1 guests user needs to specify pbase == gbase.

See above, I think this is not 100% clear. I am concerned that someone 
may try to use the version where only the guest address is specified.

It would likely be hard to realize that the extended regions would not 
work properly. So something needs to be done.

I don't have any preference on how to address. It could simply be a 
check in Xen to request that both "gaddr" and "paddr" are specified for 
direct mapped domain.

Cheers,

-- 
Julien Grall

