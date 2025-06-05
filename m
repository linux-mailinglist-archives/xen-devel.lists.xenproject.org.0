Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6AFACF9A6
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 00:21:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007647.1386923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNIx2-0002l0-8L; Thu, 05 Jun 2025 22:20:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007647.1386923; Thu, 05 Jun 2025 22:20:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNIx2-0002iT-5E; Thu, 05 Jun 2025 22:20:44 +0000
Received: by outflank-mailman (input) for mailman id 1007647;
 Thu, 05 Jun 2025 22:20:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uNIx1-0002iN-0e
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 22:20:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uNIws-003mA7-1S;
 Thu, 05 Jun 2025 22:20:34 +0000
Received: from [2a02:8012:3a1:0:7807:532b:1d1d:b850]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uNIws-008YHd-2H;
 Thu, 05 Jun 2025 22:20:34 +0000
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
	bh=BSLNWzQBa/OTEkLfdyJ+SddJxCasEKJV2JDoScP/uB4=; b=kkZjMQ2I5rt93CpL2iKmxLzQGC
	CIGTjazszLuvmflqIfQ7u5W+T3bs83SEcJmz6CLE+9Dq7Ro4xCzfqk+TSNwxRCrsGG8iWhQPGPZNb
	5+OTT+u0n1L/A5EnSo8z4WNZBIzsu1rGAm7ZgT+raaXGm1+QXUfg6grHIjNxb+fIUY4E=;
Message-ID: <d421b800-d5fe-4b47-9c3e-da0d1df68ab6@xen.org>
Date: Thu, 5 Jun 2025 23:20:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] xen/console: remove max_init_domid dependency
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250530231841.73386-1-dmukhin@ford.com>
 <20250530231841.73386-4-dmukhin@ford.com>
 <efbd8839-7556-498e-963b-8a04c1ec42bf@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <efbd8839-7556-498e-963b-8a04c1ec42bf@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 04/06/2025 13:55, Jan Beulich wrote:
> On 31.05.2025 01:19, dmkhn@proton.me wrote:
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -2461,6 +2461,39 @@ void domid_free(domid_t domid)
>>       spin_unlock(&domid_lock);
>>   }
>>   
>> +/*
>> + * Find the ID of the next possible console owner domain.
>> + *
>> + * @return Domain ID: DOMID_XEN or non-system domain IDs within
>> + * the range of [0..DOMID_FIRST_RESERVED-1].
>> + */
>> +domid_t domid_find_with_input_allowed(domid_t hint)
>> +{
>> +    domid_t domid = DOMID_XEN;
>> +
>> +    if ( hint < DOMID_FIRST_RESERVED )
>> +    {
>> +        struct domain *d;
>> +
>> +        rcu_read_lock(&domlist_read_lock);
>> +
>> +        for ( d = domid_to_domain(hint);
> 
> If the domain with ID "hint" went away, what is being switched to changes
> compared to behavior prior to this patch, if I'm not mistaken. While this
> _may_ be acceptable, not saying so in the description is imo a no-go.
> 
>> +              d && get_domain(d) && d->domain_id < DOMID_FIRST_RESERVED;
> 
> What's the DOMID_FIRST_RESERVED check for? And where's the put_domain()
> for the get_domain() here?
> 
>> +              d = rcu_dereference(d->next_in_list) )
>> +        {
>> +            if ( d->console.input_allowed )
>> +            {
>> +                domid = d->domain_id;
>> +                break;
>> +            }
>> +        }
>> +
>> +        rcu_read_unlock(&domlist_read_lock);
>> +    }
>> +
>> +    return domid;
>> +}
> 
> My concern remains: With many domains, the loop here may take quite a few
> iterations. That's even more concerning because it regresses right away in
> environments where along with boot-time created domains (eligible for
> console focus) later further domains are created (non of which are eligible
> for console focus). That is, the step from last boot-time created back to
> DOMID_XEN may now take excessively long.

+1. I vaguely recall making the same concern earlier in the review. One 
possibility would be to have a list of domains where the console is 
supported. I don't think it would be necessary to have the list sorted 
as I view the console switching a debug facility.

Cheers,

-- 
Julien Grall


