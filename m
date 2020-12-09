Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEB82D4ED9
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 00:38:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48871.86468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn92U-00029S-GX; Wed, 09 Dec 2020 23:38:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48871.86468; Wed, 09 Dec 2020 23:38:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn92U-000292-DI; Wed, 09 Dec 2020 23:38:30 +0000
Received: by outflank-mailman (input) for mailman id 48871;
 Wed, 09 Dec 2020 23:38:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kn92T-00028w-Aw
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 23:38:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kn92R-0005Iy-RM; Wed, 09 Dec 2020 23:38:27 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kn92R-0002ao-IM; Wed, 09 Dec 2020 23:38:27 +0000
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
	bh=OPfKh88rj2a43wotGM9GnLojN6RW6OzBmxRIlQMO0ow=; b=Tj1RNt9rtiwE/t7B60/2RrwZRe
	fyrYX52R9FirDFXSJ+TVQ8FelYy0UUPuTxXGg9IRV3lTcNTx/Ok8nzZ9udBx2zKMRe9+M7LZhiVaT
	6STZeAIL/bWfGrr7MDEb6grdeNwu00Uzd+sSROX4/rEpJXFh6jlMKjJZ+PX3rTWj9H+U=;
Subject: Re: [PATCH V3 15/23] xen/arm: Stick around in
 leave_hypervisor_to_guest until I/O has completed
To: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-16-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2012091432450.20986@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <fa447d9c-d601-eee7-1cc2-d595c7c2edf9@xen.org>
Date: Wed, 9 Dec 2020 23:38:25 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2012091432450.20986@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 09/12/2020 23:18, Stefano Stabellini wrote:
> On Mon, 30 Nov 2020, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> This patch adds proper handling of return value of
>> vcpu_ioreq_handle_completion() which involves using a loop
>> in leave_hypervisor_to_guest().
>>
>> The reason to use an unbounded loop here is the fact that vCPU
>> shouldn't continue until an I/O has completed. In Xen case, if an I/O
>> never completes then it most likely means that something went horribly
>> wrong with the Device Emulator. And it is most likely not safe to
>> continue. So letting the vCPU to spin forever if I/O never completes
>> is a safer action than letting it continue and leaving the guest in
>> unclear state and is the best what we can do for now.
>>
>> This wouldn't be an issue for Xen as do_softirq() would be called at
>> every loop. In case of failure, the guest will crash and the vCPU
>> will be unscheduled.
>
> Imagine that we have two guests: one that requires an ioreq server and
> one that doesn't. If I am not mistaken this loop could potentially spin
> forever on a pcpu, thus preventing any other guest being scheduled, even
> if the other guest doesn't need any ioreq servers.

That's not correct. At every loop we will call check_for_pcpu_work() 
that will process pending softirqs. If the rescheduling is necessary 
(might be set by a timer or by a caller in check_for_vcpu_work()), then 
the vCPU will be descheduled to give place to someone else.

> 
> 
> My other concern is that we are busy-looping. Could we call something
> like wfi() or do_idle() instead? The ioreq server event notification of
> completion should wake us up?

There are no busy loop here. If the IOREQ has not yet handled the I/O we 
will block the vCPU until an event notification is received (see the 
call to wait_on_xen_event_channel()).

This loop make sure that all the vPCU works are done before we return to 
the guest.

The worse that can happen here if the vCPU will never run again if the 
IOREQ server is been naughty.

> 
> Following this line of thinking, I am wondering if instead of the
> busy-loop we should call vcpu_block_unless_event_pending(current) in
> try_handle_mmio if IO_RETRY. Then when the emulation is done, QEMU (or
> equivalent) calls xenevtchn_notify which ends up waking up the domU
> vcpu. Would that work?

vcpu_block_unless_event_pending() will not block if there are interrupts 
pending. However, here we really want to block until the I/O has been 
completed. So vcpu_block_unless_event_pending() is not the right approach.

The IOREQ code is using wait_on_xen_event_channel(). Yet, this can still 
"exit" early if an event has been received. But this doesn't mean the 
I/O has completed. So we need to check if the I/O has completed and wait 
again if it hasn't.

I seem to keep having to explain how the code works. So maybe we want to 
update the commit message with more details?

Cheers,

-- 
Julien Grall

