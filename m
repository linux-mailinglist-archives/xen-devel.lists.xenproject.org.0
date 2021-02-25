Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF7E32511C
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 15:02:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89788.169444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFHDL-0006OW-Ai; Thu, 25 Feb 2021 14:01:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89788.169444; Thu, 25 Feb 2021 14:01:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFHDL-0006O6-7f; Thu, 25 Feb 2021 14:01:59 +0000
Received: by outflank-mailman (input) for mailman id 89788;
 Thu, 25 Feb 2021 14:01:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lFHDJ-0006O1-WD
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 14:01:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lFHDJ-0001dL-Hh; Thu, 25 Feb 2021 14:01:57 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lFHDJ-0008AE-7t; Thu, 25 Feb 2021 14:01:57 +0000
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
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=i8G2WBCHQKbcbqSL0ndl8kl+tO1w8KIN/yH2WppIgQ8=; b=eldvYWEAJ3/IApQZxynoW/FfZz
	CI2CCas3RlVf/0D7e1he87v5ahyDH6mwtJ4wkAtT11rY+hCLuccvQZnJSd8fV2INziB6+wBS0ixVo
	fmJBpNTvg1T1Uu93QsMiVjG1Vqf0Mx+xTY4fhHh9l9rCXkcqEHTHK6tPNu9MdCytK0bE=;
Subject: Re: [PATCH for-4.15] xen/sched: Add missing memory barrier in
 vcpu_block()
To: Ash Wilding <ash.j.wilding@gmail.com>
Cc: dfaggioli@suse.com, george.dunlap@citrix.com, iwj@xenproject.org,
 jbeulich@suse.com, jgrall@amazon.com, sstabellini@kernel.org,
 xen-devel@lists.xenproject.org
References: <20210220194701.24202-1-julien@xen.org>
 <20210223132408.10283-1-ash.j.wilding@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <ee1d43f2-4c2c-66e0-8ad0-c32ca1c7969f@xen.org>
Date: Thu, 25 Feb 2021 14:01:55 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210223132408.10283-1-ash.j.wilding@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 23/02/2021 13:24, Ash Wilding wrote:
> Hi Julien,

Hi Ash,

> Thanks for looking at this,
> 
>> vcpu_block() is now gaining an smp_mb__after_atomic() to prevent the
>> CPU to read any information about local events before the flag
>> _VPF_blocked is set.
> 
> Reviewed-by: Ash Wilding <ash.j.wilding@gmail.com>

Thanks!

> 
> 
> As an aside,
> 
>> I couldn't convince myself whether the Arm implementation of
>> local_events_need_delivery() contains enough barrier to prevent the
>> re-ordering. However, I don't think we want to play with devil here
>> as the function may be optimized in the future.
> 
> Agreed.
> 
> The vgic_vcpu_pending_irq() and vgic_evtchn_irq_pending() in the call
> path of local_events_need_delivery() both call spin_lock_irqsave(),
> which has an arch_lock_acquire_barrier() in its call path.
> 
> That just happens to map to a heavier smp_mb() on Arm right now, but
> relying on this behaviour would be shaky; I can imagine a future update
> to arch_lock_acquire_barrier() that relaxes it down to just acquire
> semantics like its name implies (for example an LSE-based lock_acquire()
> using LDUMAXA),in which case any code incorrectly relying on that full
> barrier behaviour may break. I'm guessing this is what you meant by the
> function may be optimized in future?

That's one of the optimization I had in mind. The other one is we may 
find a way to remove the spinlocks, so the barriers would disappear 
completely.

> 
> Do we know whether there is an expectation for previous loads/stores
> to have been observed before local_events_need_delivery()? I'm wondering
> whether it would make sense to have an smb_mb() at the start of the
> *_nomask() variant in local_events_need_delivery()'s call path.

That's a good question :). For Arm, there are 4 users of 
local_events_need_delivery():
   1) do_poll()
   2) vcpu_block()
   3) hypercall_preempt_check()
   4) general_preempt_check()

3 and 4 are used for breaking down long running operations. I guess we 
would want to have an accurate view of the pending events and therefore 
we would need a memory barrier to prevent the loads happening too early.

In this case, I think the smp_mb() would want to be part of the 
hypercall_preempt_check() and general_preempt_check().

Therefore, I think we want to avoid the extra barrier in 
local_events_need_delivery(). Instead, we should require the caller to 
take care of the ordering if needed.

This would have benefits any new architecture as the common code would 
already contain the appropriate barriers.

@Stefano, what do you think?

Cheers,

-- 
Julien Grall

