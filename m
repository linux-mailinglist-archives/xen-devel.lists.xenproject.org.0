Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEA32D4EF6
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 00:48:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48878.86481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn9BZ-0003BT-Ij; Wed, 09 Dec 2020 23:47:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48878.86481; Wed, 09 Dec 2020 23:47:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn9BZ-0003B4-FN; Wed, 09 Dec 2020 23:47:53 +0000
Received: by outflank-mailman (input) for mailman id 48878;
 Wed, 09 Dec 2020 23:47:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kn9BX-0003Az-9L
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 23:47:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kn9BV-0005VF-UI; Wed, 09 Dec 2020 23:47:49 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kn9BV-0003Mp-Lu; Wed, 09 Dec 2020 23:47:49 +0000
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
	bh=UONJBA/KX+vQqohI3/fhkl5eeQUbAO/CODqEwYJ967o=; b=oOfhfeHephQ8rgxIDGdlY10Ijp
	DxxN5YwGMFpJkiYKsdbp+icgQEO3TJSyKo7K1tasOf+ikcbWK/fZp08Lc7WrW6oAqC8V+YLZsM7TD
	EvB+iJnKRtT0U3jf+ygLz5jS4FRB1X8aLzvYeawQrtZQLzr7EE/I4zkCUUO2b8/LdIXE=;
Subject: Re: [PATCH V3 15/23] xen/arm: Stick around in
 leave_hypervisor_to_guest until I/O has completed
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <olekstysh@gmail.com>,
 xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-16-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2012091432450.20986@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.2012091521480.20986@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <52799b99-6405-03f4-2a46-3a0a4aac597f@xen.org>
Date: Wed, 9 Dec 2020 23:47:47 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2012091521480.20986@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 09/12/2020 23:35, Stefano Stabellini wrote:
> On Wed, 9 Dec 2020, Stefano Stabellini wrote:
>> On Mon, 30 Nov 2020, Oleksandr Tyshchenko wrote:
>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>
>>> This patch adds proper handling of return value of
>>> vcpu_ioreq_handle_completion() which involves using a loop
>>> in leave_hypervisor_to_guest().
>>>
>>> The reason to use an unbounded loop here is the fact that vCPU
>>> shouldn't continue until an I/O has completed. In Xen case, if an I/O
>>> never completes then it most likely means that something went horribly
>>> wrong with the Device Emulator. And it is most likely not safe to
>>> continue. So letting the vCPU to spin forever if I/O never completes
>>> is a safer action than letting it continue and leaving the guest in
>>> unclear state and is the best what we can do for now.
>>>
>>> This wouldn't be an issue for Xen as do_softirq() would be called at
>>> every loop. In case of failure, the guest will crash and the vCPU
>>> will be unscheduled.
>>
>> Imagine that we have two guests: one that requires an ioreq server and
>> one that doesn't. If I am not mistaken this loop could potentially spin
>> forever on a pcpu, thus preventing any other guest being scheduled, even
>> if the other guest doesn't need any ioreq servers.
>>
>>
>> My other concern is that we are busy-looping. Could we call something
>> like wfi() or do_idle() instead? The ioreq server event notification of
>> completion should wake us up?
>>
>> Following this line of thinking, I am wondering if instead of the
>> busy-loop we should call vcpu_block_unless_event_pending(current) in
>> try_handle_mmio if IO_RETRY. Then when the emulation is done, QEMU (or
>> equivalent) calls xenevtchn_notify which ends up waking up the domU
>> vcpu. Would that work?
> 
> I read now Julien's reply: we are already doing something similar to
> what I suggested with the following call chain:
> 
> check_for_vcpu_work -> vcpu_ioreq_handle_completion -> wait_for_io -> wait_on_xen_event_channel
> 
> So the busy-loop here is only a safety-belt in cause of a spurious
> wake-up, in which case we are going to call again check_for_vcpu_work,
> potentially causing a guest reschedule.
> 
> Then, this is fine and addresses both my concerns. Maybe let's add a note
> in the commit message about it.

Damm, I hit the "sent" button just a second before seen your reply. :/ 
Oh well. I suggested the same because I have seen the same question 
multiple time.

> 
> 
> I am also wondering if there is any benefit in calling wait_for_io()
> earlier, maybe from try_handle_mmio if IO_RETRY?

wait_for_io() may end up to deschedule the vCPU. I would like to avoid 
this to happen in the middle of the I/O emulation because we need to 
happen it without lock held at all.

I don't think there are locks involved today, but the deeper in the call 
stack the scheduling happens, the more chance we may screw up in the future.

However...

> leave_hypervisor_to_guest is very late for that.

... I am not sure what's the problem with that. The IOREQ will be 
notified of the pending I/O as soon as try_handle_mmio() put the I/O in 
the shared page.

If the IOREQ server is running on a different pCPU, then it might be 
possible that the I/O has completed before reached 
leave_hypervisor_to_guest(). In this case, we would not have to wait for 
the I/O.

Cheers,

-- 
Julien Grall

