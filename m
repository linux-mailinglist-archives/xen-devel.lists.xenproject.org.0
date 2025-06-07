Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF003AD0B91
	for <lists+xen-devel@lfdr.de>; Sat,  7 Jun 2025 09:19:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1009168.1388166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNnpI-0000M9-6c; Sat, 07 Jun 2025 07:18:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1009168.1388166; Sat, 07 Jun 2025 07:18:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNnpI-0000JD-3N; Sat, 07 Jun 2025 07:18:48 +0000
Received: by outflank-mailman (input) for mailman id 1009168;
 Sat, 07 Jun 2025 07:18:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uNnpH-0000J7-5Q
 for xen-devel@lists.xenproject.org; Sat, 07 Jun 2025 07:18:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uNnpG-006oKL-1H;
 Sat, 07 Jun 2025 07:18:46 +0000
Received: from [2a02:8012:3a1:0:7807:532b:1d1d:b850]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uNnpG-00Gx7Q-23;
 Sat, 07 Jun 2025 07:18:46 +0000
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
	bh=59QHEkKEeW5Owl9sVRCdlgls8zxxBjK7/Nu3Dbot8vE=; b=xFZfrTMz/7+eIG96lC1/AVXi42
	hiCvOOqofqt8cibFLPQteHao7wVRbIDrXCTYI8vqys/XUwGVa0zQz7FOmhs2E3gEZX0l9wH+JfoKP
	8NoR0ne3P0mmOdtL42/49lT97Md6qdb47JLO4JgRe5PQhhG4aAvQwzrgB7aNja6Zob5k=;
Message-ID: <4512cd95-efea-4962-a20d-6165c2c0d2a5@xen.org>
Date: Sat, 7 Jun 2025 08:18:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/3] xen/domain: unify domain ID allocation
Content-Language: en-GB
To: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 anthony.perard@vates.tech, jbeulich@suse.com, roger.pau@citrix.com,
 sstabellini@kernel.org, teddy.astie@vates.tech, dmukhin@ford.com
References: <20250528225030.2652166-1-dmukhin@ford.com>
 <20250528225030.2652166-2-dmukhin@ford.com>
 <d0829041-1375-4161-b2c4-f8dffadbb657@xen.org> <aEKQ2Fpfah+qVkB2@kraken>
From: Julien Grall <julien@xen.org>
In-Reply-To: <aEKQ2Fpfah+qVkB2@kraken>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Denis,

On 06/06/2025 07:55, dmkhn@proton.me wrote:
> On Thu, Jun 05, 2025 at 10:58:48PM +0100, Julien Grall wrote:
>>> +        if ( domid == DOMID_INVALID )
>>> +            panic("Error allocating ID for domain %s\n", dt_node_name(node));
>>> +
>>> +        d = domain_create(domid, &d_cfg, flags);
>>>            if ( IS_ERR(d) )
>>>                panic("Error creating domain %s (rc = %ld)\n",
>>>                      dt_node_name(node), PTR_ERR(d));
>>> diff --git a/xen/common/domain.c b/xen/common/domain.c
>>> index abf1969e60..ae0c44fcbb 100644
>>> --- a/xen/common/domain.c
>>> +++ b/xen/common/domain.c
>>> @@ -66,6 +66,10 @@ DEFINE_RCU_READ_LOCK(domlist_read_lock);
>>>    static struct domain *domain_hash[DOMAIN_HASH_SIZE];
>>>    struct domain *domain_list;
>>>
>>> +/* Non-system domain ID allocator. */
>>> +static DEFINE_SPINLOCK(domid_lock);
>>> +static DECLARE_BITMAP(domid_bitmap, DOMID_FIRST_RESERVED);
>>> +
>>>    /*
>>>     * Insert a domain into the domlist/hash.  This allows the domain to be looked
>>>     * up by domid, and therefore to be the subject of hypercalls/etc.
>>> @@ -1449,6 +1453,8 @@ void domain_destroy(struct domain *d)
>>>
>>>        TRACE_TIME(TRC_DOM0_DOM_REM, d->domain_id);
>>>
>>> +    domid_free(d->domain_id);
>>> +
>>>        /* Remove from the domlist/hash. */
>>>        domlist_remove(d);
>>>
>>> @@ -2405,6 +2411,54 @@ domid_t get_initial_domain_id(void)
>>>        return hardware_domid;
>>>    }
>>>
>>> +domid_t domid_alloc(domid_t domid)
>>> +{
>>> +    spin_lock(&domid_lock);
>>> +
>>> +    if ( domid < DOMID_FIRST_RESERVED )
>>> +    {
>>> +        if ( __test_and_set_bit(domid, domid_bitmap) )
>>> +            domid = DOMID_INVALID;
>>> +    }
>>> +    else
>>> +    {
>>> +        static domid_t domid_last;
>>> +        /* NB: account for late hwdom case, skip ID#0 */
>>
>> I am somewhat confused with this comment. For the late hwdom case, I
>> thought we were using a non-zero ID. Dom0 should also always be the
>> first dom0 to be reserved. Can you clarify?
> 
> My current understanding is:
> - the ID of "domain 0" (privileged domain) can be overridden at the boot-time
>    via hardware_domid parameter.
 > > - there's only one reserved (and configurable) domain ID == 
hardware_domid in
>    the allocation range (which is 0 by default).
 > > - get_initial_domain_id() returns the reserved domain ID value 
(which is
>    used in the in the follow on change to keep the change isolated).
> 
> Is my understanding correct?

I have replied yesterday night on a separate thread about this behavior 
[1]. Rather than duplicating it, I would suggest to move the 
conversation there.

In short, I believe the late domain support was recently broken.

Cheers,

[1] 
https://lore.kernel.org/xen-devel/20250528225030.2652166-1-dmukhin@ford.com/T/#mdcdf3802a913859243ff6ce841
445cfab265145f

-- 
Julien Grall


