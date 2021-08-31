Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C381B3FCA56
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 16:48:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175844.320200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL53M-0003Rg-KZ; Tue, 31 Aug 2021 14:47:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175844.320200; Tue, 31 Aug 2021 14:47:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL53M-0003PH-HY; Tue, 31 Aug 2021 14:47:56 +0000
Received: by outflank-mailman (input) for mailman id 175844;
 Tue, 31 Aug 2021 14:47:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mL53K-0003PB-UL
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 14:47:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mL53K-00088I-01; Tue, 31 Aug 2021 14:47:54 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mL53J-0000g2-PB; Tue, 31 Aug 2021 14:47:53 +0000
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
	bh=FdVoFEkdwMQVC3eulYe1SY6fAm/PI7+4L8jW8fXIUzs=; b=k693X1q+AP56k31qcCMKOGxtRg
	CPbgV69YxtlV3w66GMmkIeNcc7ap+u7LUxujgEqKcqQJiU3OaR8oCcUj3sUJL7ABKpMgntEaFyVVs
	snGi/1Mu08vPwpUM0360cq0rAulUsrLuirpbrJXdcw28h3QFgoGnSj95gNkdl/9oaquE=;
Subject: Re: [PATCH v3 7/7] xen/arm: Sanitize CTR_EL0 and emulate it if needed
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1629897306.git.bertrand.marquis@arm.com>
 <a7482653a0c29d68854846f25553f4938a6279b9.1629897306.git.bertrand.marquis@arm.com>
 <14b1639e-c9e4-f8fb-e921-73d7f28681ac@xen.org>
 <98E8FB9D-3372-47D2-92F7-8AD401AC1092@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <6705127a-bde2-36cd-0fed-900eb1eace03@xen.org>
Date: Tue, 31 Aug 2021 15:47:52 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <98E8FB9D-3372-47D2-92F7-8AD401AC1092@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 31/08/2021 14:17, Bertrand Marquis wrote:
> Hi Julien,

Hi Bertrand,

> 
>> On 27 Aug 2021, at 16:05, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Bertrand,
>>
>> On 25/08/2021 14:18, Bertrand Marquis wrote:
>>> Sanitize CTR_EL0 value between cores.
>>> In most cases different values will taint Xen but if different
>>> i-cache policies are found, we choose the one which will be compatible
>>> between all cores in terms of invalidation/data cache flushing strategy.
>>
>> I understand that all the CPUs in Xen needs to agree on the cache flush strategy. However...
>>
>>> In this case we need to activate the TID2 bit in HCR to emulate the
>>> TCR_EL0 register for guests. This patch is not activating TID2 bit all
>>> the time to limit the overhead when possible.
>>
>> as we discussed in an earlier version, a vCPU is unlikely (at least in short/medium) to be able move across pCPU of different type. So the vCPU would be pinned to a set of pCPUs. IOW, the guest would have to be big.LITTLE aware and therefore would be able to do its own strategy decision.
>>
>> So I think we should be able to get away from trappings the registers.
> 
> I do agree that we should be able to get away from that in the long term once
> we have cpupools properly set but right now this is the only way to have
> something useable (I will not say right).
> I will work on finding a way to setup properly cpupools (or something else as
> we discussed earlier) but in the short term I think this is the best we can do.

My concern is you are making look like Xen will be able to deal nicely 
with big.LITTLE when in fact there are a lot more potential issue by 
allow a vCPU moving accross pCPU of different type (the errata is one 
example).

> 
> An other solution would be to discard this patch from the serie for now until
> I have worked a proper solution for this case.
> 
> Should we discard or merge or do you have an other idea ?
Please correct me if I am wrong, at the moment, it doesn't look like 
this patch will be part of the longer plan. If so, then I think it 
should be parked for now.

This would also have the advantage to avoid spending too much time on 
resolving the emulation issue I mentioned in my previous answer.

No need to resend a new version of this series yet. You can wait until 
the rest of the series get more feedback.

[...]

> If we get interrupted, someone could program CSSELR differently and the next read
> will not be reflecting what the guest actually wants to do

AFAICT, CSSELR is preserved during the context switch of vCPU. So that 
someone would have to be Xen, right?

If so, what you describe would also be an issue even if we didn't trap 
the register. Therefore, if Xen would ever use CSSELR, then that code 
would need to save the value, use the register and then restore the 
value with preemption disabled.

> 
> The code is not preemptible right now so this cannot be an issue but I added the
>   comment more as a warning.
> 
> This is not something from the documentation, this is because value written
> in CSSELR is defining what is read from CCSIDR
> 
>>
>>> +            WRITE_SYSREG(v->arch.csselr, CSSELR_EL1);
>>> +            set_user_reg(regs, regidx, READ_SYSREG(CCSIDR_EL1));
>>> +        }

Cheers,

-- 
Julien Grall

