Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2D32CA311
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 13:47:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41985.75503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk53e-0000JV-5J; Tue, 01 Dec 2020 12:47:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41985.75503; Tue, 01 Dec 2020 12:47:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk53e-0000It-1Y; Tue, 01 Dec 2020 12:47:02 +0000
Received: by outflank-mailman (input) for mailman id 41985;
 Tue, 01 Dec 2020 12:47:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kk53c-0000Io-82
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 12:47:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kk53a-0003fw-O1; Tue, 01 Dec 2020 12:46:58 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kk53a-00054p-IF; Tue, 01 Dec 2020 12:46:58 +0000
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
	bh=o0qGaJvymSsbp0G5CPySp3y92GYd0Tz7c6m2ZoOVRoM=; b=ekPVelHUHuMU1NJhq2y+kEKPI4
	k8cHyRL5vUabV4dVJFHC9CeFxMFZxlcmpVbTtGz33OcLCjR/B51VnnNuvjGG5Mw8Xu5nT23ZQCRf+
	wyb/cbdc6lhL2L4TS0Tkg2ljcnWck1a/hL13K6G9E0rJ28aqFDdvlrgO1dVHM7e3jU/k=;
Subject: Re: [PATCH V3 15/23] xen/arm: Stick around in
 leave_hypervisor_to_guest until I/O has completed
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-16-git-send-email-olekstysh@gmail.com>
 <87czzu7emb.fsf@epam.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c3cfe831-0f78-8e57-d9d4-802be7ce283e@xen.org>
Date: Tue, 1 Dec 2020 12:46:56 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <87czzu7emb.fsf@epam.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Volodymyr,

On 30/11/2020 20:51, Volodymyr Babchuk wrote:
> Oleksandr Tyshchenko writes:
> 
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
>>
> 
> Why you don't block vcpu there and unblock it when response is ready?

The vCPU will already block while waiting for the event channel. See the 
call wait_for_event_channel() in the ioreq code. However, you can still 
receive spurious unblock (e.g. the event channel notificaiton is 
received before the I/O is unhandled). So you have to loop around and 
check if there are more work to do.

> If
> I got it right, "client" vcpu will spin in the loop, eating own
> scheduling budget with no useful work done.

You can't really do much about that if you have a rogue/buggy device model.

> In the worst case, it will
> prevent "server" vcpu from running.

How so? Xen will raise the schedule softirq if the I/O is handled. You 
would have a pretty buggy system if your "client" vCPU is considered to 
be a much higher priority than your "server" vCPU.

Cheers,

-- 
Julien Grall

