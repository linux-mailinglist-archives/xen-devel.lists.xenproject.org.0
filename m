Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5C6434CF7
	for <lists+xen-devel@lfdr.de>; Wed, 20 Oct 2021 16:02:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213945.372323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdC9b-0007hb-Ie; Wed, 20 Oct 2021 14:01:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213945.372323; Wed, 20 Oct 2021 14:01:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdC9b-0007fZ-Fe; Wed, 20 Oct 2021 14:01:15 +0000
Received: by outflank-mailman (input) for mailman id 213945;
 Wed, 20 Oct 2021 14:01:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mdC9Z-0007fT-Dx
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 14:01:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mdC9Z-0006WR-7F; Wed, 20 Oct 2021 14:01:13 +0000
Received: from [54.239.6.185] (helo=[192.168.28.129])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mdC9Z-0001uD-1B; Wed, 20 Oct 2021 14:01:13 +0000
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
	bh=UDLN0WY+QBoB01llYS7r/7aUZ6DRkuotoiuM3cnHUHw=; b=sPFSAcHAHLUkW4CovO3pOZGEEk
	TKHoZMVVyVWuHYoz7nyfnSAywUmtfraksGulYeP2mGcKjxs9W57GhBXjB9lp2ecCPV79yx9xHwYrO
	QVOnsIhe6GGk+74A9bdRO40Zm3VtYbcXGuy1YF1tozQliucTDK4/y7ofNIBHPwWMMe2c=;
Message-ID: <d8b62ee4-f782-439e-1f37-01d8616a8566@xen.org>
Date: Wed, 20 Oct 2021 15:01:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH v3] xen/arm: vgic to ignore GICD ICPENDRn registers access
To: Ian Jackson <iwj@xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Hongda Deng <Hongda.Deng@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Chen <Wei.Chen@arm.com>
References: <20211020101021.9793-1-Hongda.Deng@arm.com>
 <87512F00-48DA-4E66-B3A8-47F48B9C6A87@arm.com>
 <24944.6620.647052.30281@mariner.uk.xensource.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <24944.6620.647052.30281@mariner.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ian,

On 20/10/2021 14:30, Ian Jackson wrote:
> ~Bertrand Marquis writes ("Re: [PATCH v3] xen/arm: vgic to ignore GICD ICPENDRn registers access"):
>> [+Ian]
>>> On 20 Oct 2021, at 11:10, Hongda Deng <Hongda.Deng@arm.com> wrote:
>>>
>>> Currently, Xen will return IO unhandled when guests access GICD ICPENRn
>>> registers. This will raise a data abort inside guest. For Linux Guest,
>>> these virtual registers will not be accessed. But for Zephyr, in its
>>> GIC initialization code, these virtual registers will be accessed. And
>>> zephyr guest will get an IO data abort in initilization stage and enter
>>> fatal error. Emulating ICPENDR is not easy with the existing vGIC, so
>>> we currently ignore these virtual registers access and print a message
>>> about whether they are already pending instead of returning unhandled.
>>> More details can be found at [1].
>>>
>>> [1] https://github.com/zephyrproject-rtos/zephyr/blob/eaf6cf745df3807e6e
>>> cc941c3a30de6c179ae359/drivers/interrupt_controller/intc_gicv3.c#L274
>>>
>>> Signed-off-by: Hongda Deng <hongda.deng@arm.com>
>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>
>> Ian this is fixing a bug in the vgic implementation which is preventing to run
>> Zephyr as a guest on top of Xen. Xen support has now been merged in Zephyr
>> so this is required to use it.
>>
>> Could we consider adding this patch into the 4.16 release ?
> 
> Hi.  I'm definitely open to the idea, especially if it goes in soon.
> 
> I think this needs an ARM maintainer review, still ?

Yes. I am planning to review it later today.

> 
> It doesn't seem entirely straightforward.  I'd like to hear from the
> maintainer, to confirm that they agree it's a bugfix, and to get an
> idea of the risks vs benefits of this patch.

TL;DR: This is a bug fix and I agree that this should be included in 4.16.

ICPENDRn are a mandatory registers of the GIC implementation. But it is 
not trivial to emulate properly with our existing vGIC. So for the past 
years, we chose the lazy approach and inject a data abort when the vCPU 
access it.

IOW, this is not a new bug fix. We haven't seen any problem before 
because most of our users were using Linux based guests. Now this is 
starting to change and therefore we are exercising paths that Linux 
never used it. In this case, we would not be able to boot Zephyr on Xen.

During boot, Zephyr will write to ICPENDR to clear all the pending 
interrupts. I am not entirely convinced that from Zephyr PoV this is a 
useful things to do because, unless you quiesced the devices, interrupts 
can become pending again right away after clearing.

I would suggest to chat with the Zephyr folks to understand why they 
need to write to ICPENDR during boot.

In any case, I am assuming there are already Zephyr OS out there. So we 
need to solve the issue in Xen.

This patch doesn't fully emulate ICPENDR. The new appropach will ignore 
access and print a message when the OS is trying to clear a pending 
interrupt.

The code itself is only walking the internal structure. So as long as 
the correct locks are held, there is no change in the emulated state.

The only difference will happen at the domain level. Now, the domain 
will be able to continue booting. We will not clear pending interrupts 
but I think this is an acceptable approach as the worst that can happen 
is the guest may receive a "spurious" interrupt.

In both cases, I think the risks are limited and I would support the 
inclusion of this patch (pending appropriate acks) in 4.16.

Cheers,

-- 
Julien Grall

