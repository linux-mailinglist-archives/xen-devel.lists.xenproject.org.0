Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76963BB3EC3
	for <lists+xen-devel@lfdr.de>; Thu, 02 Oct 2025 14:44:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1135796.1472760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4Ien-0006Gq-Np; Thu, 02 Oct 2025 12:43:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1135796.1472760; Thu, 02 Oct 2025 12:43:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4Ien-0006FA-L7; Thu, 02 Oct 2025 12:43:37 +0000
Received: by outflank-mailman (input) for mailman id 1135796;
 Thu, 02 Oct 2025 12:43:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1v4Iem-0006F0-EN
 for xen-devel@lists.xenproject.org; Thu, 02 Oct 2025 12:43:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1v4Iem-0053df-06;
 Thu, 02 Oct 2025 12:43:36 +0000
Received: from [2a00:23ee:18a8:687f:8046:1b4f:134:a4e3]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1v4Iel-00CGL6-2T;
 Thu, 02 Oct 2025 12:43:35 +0000
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
	bh=1SC3STYZSGN0qmvhFGzFvBhbR+nOzOnvgunMcZ95gtA=; b=Li0ENJKVlbwfTtM4/Afu5cTYLV
	dp1WCiTV7IqGB6Usju2xang5kCIgQu2/uz/kgRjdWcSUnq4CQjvolpjWQejnx2yvzPxhJSHW2Hxn/
	s6JR2AXtW7GXERhKfUSJ22X0TuRv1rQNLniRWNA9hi7ru7QRCSxNL0Y5KGI8wUB1qDLs=;
Message-ID: <e091f7d3-14f3-40d1-a943-4758a52db71b@xen.org>
Date: Thu, 2 Oct 2025 13:43:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: XEN_DOMCTL_get_address_size hypercall support
Content-Language: en-GB
To: Milan Djokic <milan_djokic@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <39511522aae7dab5766ef2ebfed1d13abec8610e.1759324344.git.milan_djokic@epam.com>
 <bf042eea-ed2d-431e-b1f0-7be0c09194ef@citrix.com>
 <f3e662d1-7626-49f3-a673-e3cfd8d7944d@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <f3e662d1-7626-49f3-a673-e3cfd8d7944d@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 02/10/2025 12:10, Milan Djokic wrote:
> Hello Andrew,
> 
> On 10/2/25 12:10, Andrew Cooper wrote:
>> On 01/10/2025 9:01 pm, Milan Djokic wrote:
>>> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
>>>
>>> ---
>>> XEN_DOMCTL_get_address_size hypercall is not implemented for arm 
>>> (only for x86)
>>> It would be useful to have this hypercall supported for arm64, in 
>>> order to get
>>> current guest addressing mode and also to verify that 
>>> XEN_DOMCTL_set_address_size
>>> performs switch to target addressing mode (instead of relying on its 
>>> returned error code only).
>>
>> Please don't copy this misfeature of x86 PV guests into ARM.
>>
>> Letting domains be of variable bitness after domain create leads to a
>> whole lot of bugs, many security relevant.
>>
>> 32bit vs 64bit should be an input to domain_create(), not something that
>> is edited after the domain has been constructed.
>>
> 
> Yes, the idea behind this patch is not to introduce variable bitness, 
> just to have the ability to get current addressing mode through 
> hypercall. In our case, we have used it only in domain creation path 
> (after domain_create(), to verify that target addressing mode is set).
> Of course, whether this hypercall support would be useful in mainline is 
> open for discussion.

We already have a series under review [1] that follow what Andrew is 
suggesting. I would rather focus on getting it committed rather than 
trying to workaround it.

> 
>>> diff --git a/xen/arch/arm/arm64/domctl.c b/xen/arch/arm/arm64/domctl.c
>>> index 8720d126c9..f227309e06 100644
>>> --- a/xen/arch/arm/arm64/domctl.c
>>> +++ b/xen/arch/arm/arm64/domctl.c
>>> @@ -33,6 +34,37 @@ static long switch_mode(struct domain *d, enum 
>>> domain_type type)
>>>       return 0;
>>>   }
>>> +static long get_address_size(struct domain *d, uint32_t *address_size)
>>> +{
>>> +    long rc = 0;
>>> +    struct vcpu *v;
>>> +    /* Check invalid arguments */
>>> +    if ( d == NULL || address_size == NULL) {
>>> +        rc = -EINVAL;
>>> +    }
>>> +    /* Domain structure type field and actual vcpu mode must be 
>>> aligned */
>>> +    if(rc == 0) {
>>> +        for_each_vcpu(d, v) {
>>> +            if(vcpu_get_mode(v) != d->arch.type) {
>>> +                rc = -EFAULT;
>>> +            }
>>> +        }
>>
>> This is deeply suspicious.
>>
>> Under what circumstances can the vCPU setting be different from the
>> domain setting?
>>
> 
> It should never happen, this is more of a sanity check. Alternative 
> would be to use only one of vCPU or domain settings, checking against 
> both seemed more complete to me.

This would be a logical error in Xen rather than something that could be 
triggered by the toolstack. I feel it could mislead people using release 
build because the fault is not due to the input provided.

Cheers,

-- 
Julien Grall


