Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A01973E19BB
	for <lists+xen-devel@lfdr.de>; Thu,  5 Aug 2021 18:38:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.164494.300807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBgNI-00056u-9f; Thu, 05 Aug 2021 16:37:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 164494.300807; Thu, 05 Aug 2021 16:37:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBgNI-00054w-6X; Thu, 05 Aug 2021 16:37:40 +0000
Received: by outflank-mailman (input) for mailman id 164494;
 Thu, 05 Aug 2021 16:37:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DXIG=M4=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1mBgNH-00054q-Fg
 for xen-devel@lists.xenproject.org; Thu, 05 Aug 2021 16:37:39 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3e1a6901-367a-4edf-85c3-08b534a4ed47;
 Thu, 05 Aug 2021 16:37:38 +0000 (UTC)
Received: from [10.10.1.24] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1628181447491448.4037791473961;
 Thu, 5 Aug 2021 09:37:27 -0700 (PDT)
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
X-Inumbo-ID: 3e1a6901-367a-4edf-85c3-08b534a4ed47
ARC-Seal: i=1; a=rsa-sha256; t=1628181452; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=b9FNzdBERyOS/rb+yqbsYaY/XNLw4z2jaJLE8dLGxFtSC5HpXBZdyDhGXyRVgdhG12LUH0HZOZvGBeChKi29aPlpyKHgm4H6GyGpYqfJTN1vTGa5yboVKFIeiSQQF8R46r/hWux6SU/jMmW10ZVGCs1Sl4qOwo/W8nBjEPVU+Dc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1628181452; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=Qa4584XltKHjJ1wQAT6FGYfNLVVWGTyVkOKd1H6WQs4=; 
	b=EHdYQQxWa54PWxV6FDST0DKiHjq0a4QCThPBqaVf7dLQzW8bAZrOYRcRiQ/H9wISVUWIzlX/Z+5eeNVGorG1EFbazhSGWlvM89x3Uc6GgM6SwgtSoK/ZgmwTMMLY1IEi0s1xlfsupaVGnUwpR8OkXvtAnEyc6ACr0CrDf/Qx4qc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1628181452;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Qa4584XltKHjJ1wQAT6FGYfNLVVWGTyVkOKd1H6WQs4=;
	b=qSeBcreSxo1ZUr1SUXXSpBGPYPeBCQG6iu6Im/O9oLrML1784vjX5IsUTA4hfFes
	EaEK1Hsa+c35jpCvFtEole/ft8ONdA5drsGEYLvCenOOEjUEmT+fAXcBSP0LuPi7e3t
	Jlkos1B6XTUjrb4KzZqWVGv7ZeeAYx5t5CVOIakc=
To: Oleksandr <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
References: <1627489110-25633-1-git-send-email-olekstysh@gmail.com>
 <6e573489-ceb7-03f4-3511-e6c166b318a6@apertussolutions.com>
 <ee685f11-4f34-614d-e0ba-7cafeda08344@gmail.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [RFC PATCH] xen/memory: Introduce a hypercall to provide
 unallocated space
Message-ID: <ca936d82-cc31-a127-488c-e4e33ceb6fbb@apertussolutions.com>
Date: Thu, 5 Aug 2021 12:37:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <ee685f11-4f34-614d-e0ba-7cafeda08344@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Hey Oleksandr!

On 8/5/21 11:59 AM, Oleksandr wrote:
> 
> On 05.08.21 18:03, Daniel P. Smith wrote:
> 
> Hi Daniel.
> 
>> On 7/28/21 12:18 PM, Oleksandr Tyshchenko wrote:
>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> ...
>>
>>> diff --git a/xen/common/memory.c b/xen/common/memory.c
>>> index e07bd9a..3f9b816 100644
>>> --- a/xen/common/memory.c
>>> +++ b/xen/common/memory.c
>>> @@ -1811,6 +1811,62 @@ long do_memory_op(unsigned long cmd,
>>> XEN_GUEST_HANDLE_PARAM(void) arg)
>>>               start_extent);
>>>           break;
>>>   +    case XENMEM_get_unallocated_space:
>>> +    {
>>> +        struct xen_get_unallocated_space xgus;
>>> +        struct xen_unallocated_region *regions;
>>> +
>>> +        if ( unlikely(start_extent) )
>>> +            return -EINVAL;
>>> +
>>> +        if ( copy_from_guest(&xgus, arg, 1) ||
>>> +             !guest_handle_okay(xgus.buffer, xgus.nr_regions) )
>>> +            return -EFAULT;
>>> +
>>> +        d = rcu_lock_domain_by_any_id(xgus.domid);
>>> +        if ( d == NULL )
>>> +            return -ESRCH;
>>> +
>>> +        rc = xsm_get_unallocated_space(XSM_HOOK, d);
>> Not sure if you are aware but XSM_HOOK is a no-op check, meaning that
>> you are allowing any domain to do this operation on any other domain. In
>> most cases there is an XSM check at the beginning of the hypercall
>> processing to do an initial clamp down but I am pretty sure there is no
>> prior XSM check on this path. Based on my understanding of how this is
>> intended, which may be incorrect, but I think you would actually want
>> XSM_TARGET.the
> Thank you for pointing this out.
> I am aware what the XSM_HOOK is, but I was thinking what the default
> action would be better suited for that hypercall, and failed to think of
> a better alternative.
> I was going to choose XSM_TARGET, but the description "/* Can perform on
> self or your target domain */" confused me a bit, as there was no target
> domain involved as I thought, XSM_PRIV
> sounded too strictly to me, etc. So, I decided to leave a "hook" for the
> RFC version. But, now I see that XSM_TARGET might be indeed better
> choice across all possible variants.

If you unravel the craftiness that is xsm_default_action, there is
actually a bit of hierarchy there. If you set the default_action to
XSM_TARGET, it will first check if calling domain(src) is the target,
then falls into the XSM_DM_PRIV check which is if src->target == target,
and then finally checks if is_control_domain(src). That will constrict
the operation so that a domain can call it on itself, a device model
domain (stubdom) can call it on the domain it is backing, and the
control domain can make the call. I am not a 100% sure on this but I do
not believe a hardware domain would be able to make the call with it set
to XSM_TARGET and not employing Flask. Hope this helps.




