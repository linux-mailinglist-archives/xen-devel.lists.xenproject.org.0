Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7920054E9CD
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jun 2022 21:10:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.350842.577261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1usB-0003mw-91; Thu, 16 Jun 2022 19:09:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 350842.577261; Thu, 16 Jun 2022 19:09:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1usB-0003ju-5N; Thu, 16 Jun 2022 19:09:43 +0000
Received: by outflank-mailman (input) for mailman id 350842;
 Thu, 16 Jun 2022 19:09:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o1us9-0003jo-Dg
 for xen-devel@lists.xenproject.org; Thu, 16 Jun 2022 19:09:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o1us5-00013a-QH; Thu, 16 Jun 2022 19:09:37 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=[10.95.152.232]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o1us5-00085V-Fk; Thu, 16 Jun 2022 19:09:37 +0000
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
	bh=izQx3XPBc7LFETS7Dw+w+rCaTVcbKs+zYwAASNCMo9U=; b=uUinrJ/vy6w4K586BTBvCycj6s
	+7JAoPNbrmI1iKbOEceCUyDhBwxHVwWxcQHAJ0hA5g3m7FvWAcSn5mnofq+fgmjFDaWIT/hJMysad
	JnqcKx8AeVVWisQP1LjK6/ddoxr7RFCIhXsqEYwhJwJ1MS17yrLXSv6vMbmSMwW6qGCM=;
Message-ID: <67f56cdd-531b-72fc-1257-214d078f6bb6@xen.org>
Date: Thu, 16 Jun 2022 20:09:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH] xen: Don't call panic if ARM TF cpu off returns DENIED
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "dmitry.semenets@gmail.com" <dmitry.semenets@gmail.com>,
 Dmytro Semenets <Dmytro_Semenets@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220616135541.3333760-1-dmitry.semenets@gmail.com>
 <cf7660da-0bde-865e-7c22-a2e21e31fae5@xen.org> <87wndgh2og.fsf@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <87wndgh2og.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/06/2022 19:40, Volodymyr Babchuk wrote:
> 
> Hi Julien,

Hi Volodymyr,

> 
> Julien Grall <julien@xen.org> writes:
> 
>> Hi,
>>
>> On 16/06/2022 14:55, dmitry.semenets@gmail.com wrote:
>>> From: Dmytro Semenets <dmytro_semenets@epam.com>
>>> According to PSCI specification ARM TF can return DENIED on CPU OFF.
>>
>> I am confused. The spec is talking about Trusted OS and not
>> firmware. The docummentation is also not specific to ARM Trusted
>> Firmware. So did you mean "Trusted OS"?
> 
> It should be "firmware", I believe.

Hmmm... I couldn't find a reference in the spec suggesting that CPU_OFF 
could return DENIED because of the firmware. Do you have a pointer to 
the spec?

> 
>>
>> Also, did you reproduce on HW? If so, on which CPU this will fail?
>>
> 
> Yes, we reproduced this on HW. In our case it failed on CPU0. To be
> fair, in our case it had nothing to do with Trusted OS. It is just
> platform limitation - it can't turn off CPU0. But from Xen perspective
> there is no difference - CPU_OFF call returns DENIED.

Thanks for the clarification. I think I have seen that in the wild also 
but it never got on top of my queue. It is good that we are fixing it.

> 
>>> This patch brings the hypervisor into compliance with the PSCI
>>> specification.
>>
>> Now it means CPU off will never be turned off using PSCI. Instead, we
>> would end up to spin in Xen. This would be a problem because we could
>> save less power.
> 
> Agreed.
> 
>>
>>> Refer to "Arm Power State Coordination Interface (DEN0022D.b)"
>>> section 5.5.2
>>
>> Reading both 5.5.2 and 5.9.1 together, DENIED would be returned when
>> the trusted OS can only run on one core.
>>
>> Some of the trusted OS are migratable. So I think we should first
>> attempt to migrate the CPU. Then if it doesn't work, we should prevent
>> the CPU to go offline.
>>
>> That said, upstream doesn't support cpu offlining (I don't know for
>> your use case). In case of shutdown, it is not necessary to offline
>> the CPU, so we could avoid to call CPU_OFF on all CPUs but
>> one. Something like:
>>
> 
> This is even better approach yes. But you mentioned CPU_OFF. Did you
> mean SYSTEM_RESET?

By CPU_OFF I was referring to the fact that Xen will issue the call all 
CPUs but one. The remaining CPU will issue the command to reset/shutdown 
the system.

>>   void machine_halt(void)
>> @@ -21,10 +23,6 @@ void machine_halt(void)
>>       smp_call_function(halt_this_cpu, NULL, 0);
>>       local_irq_disable();
>>
>> -    /* Wait at most another 10ms for all other CPUs to go offline. */
>> -    while ( (num_online_cpus() > 1) && (timeout-- > 0) )
>> -        mdelay(1);
>> -
>>       /* This is mainly for PSCI-0.2, which does not return if success. */
>>       call_psci_system_off();
>>
>>> Signed-off-by: Dmytro Semenets <dmytro_semenets@epam.com>
>>> Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>>
>> I don't recall to see patch on the ML recently for this. So is this an
>> internal review?
> 
> Yeah, sorry about that. Dmytro is a new member in our team and he is not
> yet familiar with differences in internal reviews and reviews in ML.

No worries. I usually classify internal review anything that was done 
privately. This looks to be a public review, althought not on xen-devel.

I understand that not all some of the patches are still in PoC stage and 
doing the review on your github is a good idea. But for those are meant 
to be for upstream (e.g. bug fixes, small patches), I would suggest to 
do the review on xen-devel directly.

Cheers,

-- 
Julien Grall

