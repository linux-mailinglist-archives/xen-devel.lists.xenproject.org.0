Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E36753676
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jul 2023 11:30:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563548.880794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKF6k-0003qA-Mr; Fri, 14 Jul 2023 09:29:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563548.880794; Fri, 14 Jul 2023 09:29:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKF6k-0003oV-JB; Fri, 14 Jul 2023 09:29:02 +0000
Received: by outflank-mailman (input) for mailman id 563548;
 Fri, 14 Jul 2023 09:29:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qKF6i-0003oP-SU
 for xen-devel@lists.xenproject.org; Fri, 14 Jul 2023 09:29:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qKF6c-000581-RO; Fri, 14 Jul 2023 09:28:54 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qKF6c-0000uG-GC; Fri, 14 Jul 2023 09:28:54 +0000
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
	bh=50WfSytNTAkD+vaGxiaTL0sbP+GHuBfj/91rG957sjc=; b=k0RHeoIDNSQIKXyNHV0DXZdumo
	9ejlFGcrG1cxxfj1Cek2LZPZPYpNn4xNJSiQCgtPBfuj2sBf7i9zLUrhEEjBd8Rh4LKutxBD3AHqo
	m3nQmkwP1ujLEqOMtO4BOwDEFJLn/m1iAiDEbaBIYuowsgOGyTcnlVOVVgj4KbQiJYxc=;
Message-ID: <4a6bd691-95e1-ad15-1054-b43460c85b32@xen.org>
Date: Fri, 14 Jul 2023 10:28:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/2] restrict concept of pIRQ to x86
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <85e59fd5-9a06-48b4-ba7e-81865d44e332@suse.com>
 <98f51b96-8a1c-7f33-b4d3-1744174df465@suse.com>
 <0cd9d94b-0a8d-a3e1-d683-04fac1572750@xen.org>
 <8cdf9179-7b3f-5a52-ff02-8ededbe03e0c@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <8cdf9179-7b3f-5a52-ff02-8ededbe03e0c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 11/07/2023 13:29, Jan Beulich wrote:
> On 10.07.2023 22:59, Julien Grall wrote:
>>> ---
>>> I'm not really certain about XEN_DOMCTL_irq_permission: With pIRQ-s not
>>> used, the prior pIRQ -> IRQ translation cannot have succeeded on Arm, so
>>> quite possibly the entire domctl is unused there? Yet then how is access
>>> to particular device IRQs being granted/revoked?
> 
> (Leaving this in context, as it'll be relevant for the last comment you
> gave.)

Sorry I missed this comment.

 > so quite possibly the entire domctl is unused there?

You are right, the domctl permission is not used on Arm.

 >  Yet then how is access to particular device IRQs being granted/revoked?

At the moment, a device can only be attached at domain creation and 
detached when the domain is destroyed. Also, only the toolstack can map 
IRQs. So we don't need to worry for granting/revoking IRQs.

> 
>>> --- a/xen/common/domain.c
>>> +++ b/xen/common/domain.c
>>> @@ -350,6 +350,8 @@ static int late_hwdom_init(struct domain
>>>    #endif
>>>    }
>>>    
>>> +#ifdef CONFIG_HAS_PIRQ
>>> +
>>>    static unsigned int __read_mostly extra_hwdom_irqs;
>>>    static unsigned int __read_mostly extra_domU_irqs = 32;
>>>    
>>> @@ -364,6 +366,8 @@ static int __init cf_check parse_extra_g
>>>    }
>>>    custom_param("extra_guest_irqs", parse_extra_guest_irqs);
>>>    
>>> +#endif /* CONFIG_HAS_PIRQ */
>>
>> NIT: I would suggest create a file pirq.c and move anything PIRQ
>> specific there. This should reduce the number of #ifdef in the code.
> 
> I did consider that, but it looked quite a bit more intrusive to
> me than the few #ifdef-s added to this file. (The ones in other
> files would be yet uglier to eliminate, if that was to be implied
> from your remark.)

I was under the impression we wanted to limit the number of #ifdef in 
the common code. They didn't seem to be warrant here and, from a brief 
look, it didn't seem the option would be that "ugly". But I guess this 
is a matter of taste.

> 
>>> @@ -1864,6 +1874,8 @@ long do_vm_assist(unsigned int cmd, unsi
>>>    }
>>>    #endif
>>>    
>>> +#ifdef CONFIG_HAS_PIRQ
>>> +
>>
>> With this change and some others, we probably can remove
>> alloc_pirq_struct() & co. I will have a look to send a clean-up patch
>> after this goes in.
> 
> Right, there's likely further cleanup possible.
> 
>>> --- a/xen/common/domctl.c
>>> +++ b/xen/common/domctl.c
>>> @@ -683,11 +683,13 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xe
>>>            unsigned int pirq = op->u.irq_permission.pirq, irq;
>>>            int allow = op->u.irq_permission.allow_access;
>>>    
>>> +#ifdef CONFIG_HAS_PIRQ
>>>            if ( pirq >= current->domain->nr_pirqs )
>>>            {
>>>                ret = -EINVAL;
>>>                break;
>>>            }
>>> +#endif
>>
>> This #ifdef reads a little bit strange. If we can get away with the
>> check for Arm, then why can't when CONFIG_HAS_PIRQ=y? Overall, a comment
>> would be helpful.
> 
> As per the post-commit-message remark first of all I need to understand
> why things were the way they were, and why (whether) that was correct
> (or at least entirely benign) for Arm in the first place. Only then I'll
> (hopefully) be in the position of putting a sensible comment here.
> 
> One thing is clear, I suppose: Without the #ifdef the code wouldn't
> build. Yet imo if things all matched up, it should have been buildable
> either way already in the past. Hence the questions.

Right, it would not build. But does this check really matter even in the 
case where CONFIG_HAS_PIRQ=y? Looking at the code, it sounds like more 
an optimization/a way to return a different error code if there value is 
too high. For the domctl, it doesn't seem to be worth it, the more if we 
need to add #ifdef.

With that, the rest of the domctl should mostly work for Arm.

Cheers,

-- 
Julien Grall

