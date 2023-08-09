Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B54477569E
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 11:44:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580815.909241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTfk8-0000Zs-6M; Wed, 09 Aug 2023 09:44:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580815.909241; Wed, 09 Aug 2023 09:44:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTfk8-0000YG-38; Wed, 09 Aug 2023 09:44:40 +0000
Received: by outflank-mailman (input) for mailman id 580815;
 Wed, 09 Aug 2023 09:44:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qTfk6-0000Y8-ML
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 09:44:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qTfk3-00044a-Ug; Wed, 09 Aug 2023 09:44:35 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.16.102]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qTfk3-00078e-Jf; Wed, 09 Aug 2023 09:44:35 +0000
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
	bh=D3TUk0fVtuJ/htEceC83j6Ej9T9H0oui2/i6dkCkfgo=; b=kYcOaJ7urvmOyu6YfKEd5a5TNh
	5t0ZLDDWkQc+UbDoCAl+sBFFxd9mZZR60NjbsL1vJAI7KtGkp0kKXZ7zpKTRDtxRPjBACnb+bgTy4
	jW5rMEKyj3ngeTT4W1XUu76GugYKAKkOpLdJaHnho+HimlLMAu4npaKNRgXTVqVaxtCE=;
Message-ID: <7e578cfd-b74c-45d6-9b90-9963cff2c8e3@xen.org>
Date: Wed, 9 Aug 2023 10:44:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 4/6] capabilities: introduce console io as a domain
 capability
Content-Language: en-GB
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20230801202006.20322-1-dpsmith@apertussolutions.com>
 <20230801202006.20322-5-dpsmith@apertussolutions.com>
 <8951f722-6949-b2b5-f6d4-2d515f085cde@xen.org>
 <7a10af10-27c7-257e-9564-2716c67bb400@apertussolutions.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <7a10af10-27c7-257e-9564-2716c67bb400@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Daniel,

On 08/08/2023 23:49, Daniel P. Smith wrote:
> On 8/3/23 17:03, Julien Grall wrote:
>> On 01/08/2023 21:20, Daniel P. Smith wrote:
>>> The field `is_console` suggests that the field represents a state of 
>>> being or
>>> posession, not that it reflects the privilege to access the console. 
>>> In this
>>> patch the field is renamed to capabilities to encapsulate the 
>>> capabilities a
>>> domain has been granted. The first capability being the ability to 
>>> read/write
>>> the Xen console.
>>>
>>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>>> ---
>>>   xen/arch/arm/domain_build.c |  4 +++-
>>>   xen/include/xen/sched.h     | 25 +++++++++++++++++++++++--
>>>   xen/include/xsm/dummy.h     |  2 +-
>>>   3 files changed, 27 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>> index 51b4daefe1..ad7432b029 100644
>>> --- a/xen/arch/arm/domain_build.c
>>> +++ b/xen/arch/arm/domain_build.c
>>> @@ -4076,7 +4076,9 @@ void __init create_domUs(void)
>>>               panic("Error creating domain %s (rc = %ld)\n",
>>>                     dt_node_name(node), PTR_ERR(d));
>>> -        d->is_console = true;
>>> +        if ( ! domain_set_cap(d, CAP_CONSOLE_IO) )
>>
>> Coding style: We don't usually add a space after '!'.
> 
> Ack.
> 
>>> +            printk("failed setting console_io on %pd\n", d);
>>
>> I find a bit odd that we would continue even if the cap cannot be set. 
>> Can you clarify?
> 
> This is the construction of a domU, so the system is very much capable 
> of coming up and reviewing the hypervisor messages from dom0 to discover 
> the issue. I am hard pressed to believe the hypervisor should be 
> panicked because the domU is not allowed to use the hypervisor's console.

I understand the system may be able to boot. However, the problem is 
that it may take a while to discover that the console is not working 
properly (the more if you only use it for error logging).

So on Arm, we have so always decided to fail early rather than late in 
order to help debugging. So I would rather not change the behavior even 
if this is "just" for the console.

If you expect the console to be disabled, then we should provide a 
property in the Device-Tree to select/deselect. It should not be hidden.

> 
> g>> +
>>>           dt_device_set_used_by(node, d->domain_id);
>>>           rc = construct_domU(d, node);
>>> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
>>> index ec0f9baff6..b04fbe0565 100644
>>> --- a/xen/include/xen/sched.h
>>> +++ b/xen/include/xen/sched.h
>>> @@ -472,8 +472,8 @@ struct domain
>>>   #define ROLE_HARDWARE_DOMAIN   (1U<<2)
>>>   #define ROLE_XENSTORE_DOMAIN   (1U<<3)
>>>       uint8_t          role;
>>> -    /* Can this guest access the Xen console? */
>>> -    bool             is_console;
>>> +#define CAP_CONSOLE_IO  (1U<<0)
>> Coding style: Space before and after <<.
> 
> Ack.
> 
>>> +    uint8_t          capabilities;
>>>       /* Is this guest being debugged by dom0? */
>>>       bool             debugger_attached;
>>>       /*
>>> @@ -1146,6 +1146,27 @@ static always_inline bool is_hvm_vcpu(const 
>>> struct vcpu *v)
>>>       return is_hvm_domain(v->domain);
>>>   }
>>> +static always_inline bool domain_has_cap(
>>> +    const struct domain *d, uint8_t cap)
>>
>> Coding style: We don't usually wrap the arguments this way. See 
>> domain_create() for an example.
> 
> I was informed it was[1], also, please see next_domain_in_cpupool() 
> amongst many others further below.

The unwritten coding style strike again... I am not sure where the 
agreement comes from. At least on Arm, we have been using the first 
version in that thread and if it can't be wrapped to 80 characters, then 
move the "static inline void " on its own line.

The advantage with the Arm approach is that parameters are always 
indented the same way. Anyway, the way you wrote is not my personal 
preference but I am also not up to bikeshed too much on it. Hopefully 
this sort of style discussion will be resolved with clang-format.

[...]

> 
>> Also, do you expect the cap to be set only when the domain is created? 
>> If not, would you prevent potentially concurrent update to 
>> d->capabilities?
> 
> Currently the only means being devise to set this is via hyperlaunch 
> domain creation. If a domctl op was added to be able to manipulate the 
> caps, then yes a lock on the domain would be advised to block.

Loking at patch #6, you are using domctl there.

> With that 
> said, if we switch over to CAP_CTRL/HW, then it might be good to grab a 
> lock on the domain for the late hardware domain case.

Are you planning to clear the caps? If not, then using set_bit() and 
test_bit() should be enough.

Cheers,

-- 
Julien Grall

