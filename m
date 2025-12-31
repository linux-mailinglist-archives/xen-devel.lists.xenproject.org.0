Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A485CEC2D3
	for <lists+xen-devel@lfdr.de>; Wed, 31 Dec 2025 16:31:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1194585.1512948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vay9k-0001O1-3R; Wed, 31 Dec 2025 15:30:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1194585.1512948; Wed, 31 Dec 2025 15:30:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vay9j-0001MX-W5; Wed, 31 Dec 2025 15:30:35 +0000
Received: by outflank-mailman (input) for mailman id 1194585;
 Wed, 31 Dec 2025 15:30:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vay9h-0001MP-Pb
 for xen-devel@lists.xenproject.org; Wed, 31 Dec 2025 15:30:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vay9h-001IDH-0M;
 Wed, 31 Dec 2025 15:30:33 +0000
Received: from [213.226.64.151] (helo=[192.168.8.236])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vay9h-001Dy5-0a;
 Wed, 31 Dec 2025 15:30:33 +0000
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
	bh=21dj1HuxM77VKz4tWKQE72pq1xIKbRJlIF5a8K0+pEc=; b=fooyLPqU4ssInDyzAz7BxOppP9
	Ly/KJjumao2xN8nMJ6p4UKi1e9MQgxEejismyjDHnOUxYkgYd4gfW1HQ24u3VmrvpevJEKUieilDB
	biyJZVqOfPQOSZayfln1rg3v9b3RHPqs+fVU761xGNZ55z6GVEw8uz+YU2Wu4t/HR8tI=;
Message-ID: <18f249c1-3717-42e4-86df-84552741702d@xen.org>
Date: Wed, 31 Dec 2025 15:30:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/8] arm/irq: Migrate IRQs from dyings CPUs
Content-Language: en-GB
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1762939773.git.mykyta_poturai@epam.com>
 <6371ac96102f48b55ffd884656770187ed3a7f84.1762939773.git.mykyta_poturai@epam.com>
 <8099d0ed-74bd-4c98-9441-296daf76c41e@xen.org>
 <5569161c-2edc-4409-901d-d65493f12496@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5569161c-2edc-4409-901d-d65493f12496@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 12/12/2025 10:01, Mykyta Poturai wrote:
> On 16.11.25 13:24, Julien Grall wrote:
>> Hi,
>>
>> On 12/11/2025 10:51, Mykyta Poturai wrote:
>>> Move IRQs from dying CPU to the online ones.
>>> Guest-bound IRQs are already handled by scheduler in the process of
>>> moving vCPUs to active pCPUs, so we only need to handle IRQs used by Xen
>>> itself.
>>>
>>> If IRQ is to be migrated, it's affinity is set to a mask of all online
>>> CPUs. With current GIC implementation, this means they are routed to a
>>> random online CPU. This may cause extra moves if multiple cores are
>>> disabled in sequence, but should prevent all interrupts from piling up
>>> on CPU0 in case of repeated up-down cycles on different cores.
>>
>> Wouldn't they eventually all move to CPU0 in the case of suspend/resume
>> or if all the CPUs but CPU0 are turned off and then off? If so,
>> shouldn't we try to rebalance the interrupts?
>>
> 
> In case of disabling/enabling all cores in a sequence, yes. This was
> designed with the idea of achieving some balancing when
> enabling/disabling some cores for power saving reasons.

I understand how this may balance when disabling some cores. But I don't 
understand how it helps for enabling cores. Can you provide more details?

> I agree that
> proper balancing should be implemented, but it is a complex task on its
> own and requires a substantial amount of testing on different hardware
> to prove it is close to optimal. So I think implementing it is out of
> scope for what I’m trying to do here.

Can you provide some details about what you are trying and why it would 
be ok to avoid the balancing?

 > > If this would be okay, I can implement a relatively simple solution of
> just adding onlined CPUs back to the affinity mask for now. I think it
> should improve the situation for the “switching all cores” case.

Do you mean calling gic_irq_set_affinity() with the CPU? If so, Xen is 
still going to get one CPU from the affinity mask.

> 
>>>
>>> IRQs from CPU 0 are never migrated, as dying CPU 0 means we are either
>>> shutting down compeletely or entering system suspend.
>>
>> I can't find a place where __cpu_disable() is called on CPU0. Do you
>> have any pointer? In any case, I am not sure I want to bake that
>> assumption in more places of the code.
>>
> 
> I assume it would be called when suspend is implemented. In any case, I
> will rework this to replace the hard check for CPU 0 with the “is it the
> last CPU online” one.

AFAIK __cpu_disable() is not going to be called during suspend/resume 
for CPU0. So the only case is shutting down the platform.

> 
>>>
>>> Considering that all Xen-used IRQs are currently allocated during init
>>> on CPU 0, and setup_irq uses smp_processor_id for the initial affinity.
>>
>> Looking at the SMMU driver, we seems to request IRQs at the time the
>> device is attached. So are you sure about this?
>>
> 
> Indeed, I have missed that one. I will remove those statements then.

I think you need to have something in the commit message explaining why 
you are ignoring the balancing for the SMMU.

Cheers,

-- 
Julien Grall


