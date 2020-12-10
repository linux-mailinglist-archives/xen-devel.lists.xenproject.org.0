Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C57972D5B72
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 14:18:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49205.86981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knLpH-0002kq-Lp; Thu, 10 Dec 2020 13:17:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49205.86981; Thu, 10 Dec 2020 13:17:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knLpH-0002kR-I3; Thu, 10 Dec 2020 13:17:43 +0000
Received: by outflank-mailman (input) for mailman id 49205;
 Thu, 10 Dec 2020 13:17:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1knLpF-0002kM-WC
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 13:17:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1knLpE-0007La-HA; Thu, 10 Dec 2020 13:17:40 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1knLpE-00086w-7w; Thu, 10 Dec 2020 13:17:40 +0000
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
	bh=fCgGDOSwt7p/h6DxE1W0vBRr6YFicucTeTT1d4kB45k=; b=W8WLuYcy5i+A/goZtaE3F952eL
	sw8heASU8yYCa8EGKvOmGGb7DOrYOAO/I6F8uOMT0hmdD/Tj+4MhfxaJuQYMEYuXBmSv3zbU00ZtP
	+kY5gqP5BaeXzjHovJi4h2l1TuP9xD2IQnvmAcuKBhUba0+DQIDTCSoAX8nD9R5e3Sp4=;
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
 <52799b99-6405-03f4-2a46-3a0a4aac597f@xen.org>
 <alpine.DEB.2.21.2012091745550.20986@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <6053ad08-95ce-fb31-122d-450df21a20f7@xen.org>
Date: Thu, 10 Dec 2020 13:17:38 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2012091745550.20986@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 10/12/2020 02:30, Stefano Stabellini wrote:
>>> I am also wondering if there is any benefit in calling wait_for_io()
>>> earlier, maybe from try_handle_mmio if IO_RETRY?
>>
>> wait_for_io() may end up to deschedule the vCPU. I would like to avoid this to
>> happen in the middle of the I/O emulation because we need to happen it without
>> lock held at all.
>>
>> I don't think there are locks involved today, but the deeper in the call stack
>> the scheduling happens, the more chance we may screw up in the future.
>>
>> However...
>>
>>> leave_hypervisor_to_guest is very late for that.
>>
>> ... I am not sure what's the problem with that. The IOREQ will be notified of
>> the pending I/O as soon as try_handle_mmio() put the I/O in the shared page.
>>
>> If the IOREQ server is running on a different pCPU, then it might be possible
>> that the I/O has completed before reached leave_hypervisor_to_guest(). In this
>> case, we would not have to wait for the I/O.
> 
> Yeah, I was thinking about that too. Actually it could be faster
> this way we end up being lucky.
> 
> The reason for moving it earlier would be that by the time
> leave_hypervisor_to_guest is called "Xen" has already decided to
> continue running this particular vcpu. If we called wait_for_io()
> earlier, we would give important information to the scheduler before any
> decision is made.

I don't understand this. Xen preemption is voluntary, so the scheduler 
is not going to run unless requested.

wait_for_io() is a preemption point. So if you call it, then vCPU may 
get descheduled at that point.

Why would we want to do this? What's our benefits here?

Cheers,

-- 
Julien Grall

