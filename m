Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9619E4CA21F
	for <lists+xen-devel@lfdr.de>; Wed,  2 Mar 2022 11:25:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282165.480773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPMAH-0007Tr-8T; Wed, 02 Mar 2022 10:25:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282165.480773; Wed, 02 Mar 2022 10:25:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPMAH-0007R5-3r; Wed, 02 Mar 2022 10:25:01 +0000
Received: by outflank-mailman (input) for mailman id 282165;
 Wed, 02 Mar 2022 10:24:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nPMAE-0007Qy-SV
 for xen-devel@lists.xenproject.org; Wed, 02 Mar 2022 10:24:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nPMAE-0002k9-F7; Wed, 02 Mar 2022 10:24:58 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=[192.168.10.166]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nPMAE-0001tM-9S; Wed, 02 Mar 2022 10:24:58 +0000
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
	bh=4uvfLopOFXXpP9IPakmYMMfm7KZs0MhHhWTR090+4PY=; b=t1uqdmYuEq/lslnZigPZmri9E6
	RAV/Qo4NQjyBjeCHVoA059EDu3ro28VecxJxkUUsOd51ROQnJUS/0yR9LN46PPPe05WSXPmAHSOoa
	Va1Zh2/Nuw/bAuD6Qj/D6D3hpti9HFzLTog/RP6lIVfnSKdJDGUbOpdtixAsLss0L2uo=;
Message-ID: <5eb5fe51-9ef7-affe-06e1-b15da512a76c@xen.org>
Date: Wed, 2 Mar 2022 10:24:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: Proposal for Porting Xen to Armv8-R64 - DraftA
To: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Penny Zheng <Penny.Zheng@arm.com>, Henry Wang <Henry.Wang@arm.com>,
 nd <nd@arm.com>
References: <PAXPR08MB7420A01809B84E04E196793F9E3D9@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2202241606450.239973@ubuntu-linux-20-04-desktop>
 <AS1PR08MB74269923288B75097392BDD99E3E9@AS1PR08MB7426.eurprd08.prod.outlook.com>
 <4c558f8f-56d4-0445-32d4-169bc5d0a3bc@xen.org>
 <PAXPR08MB74200F4B0B4EFFD5BE1A6E699E029@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <7260f050-9022-4adf-618b-a8b271aca8c3@xen.org>
 <PAXPR08MB7420B367FFEB4FD3A7C88EB79E039@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <PAXPR08MB7420B367FFEB4FD3A7C88EB79E039@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Wei,

On 02/03/2022 06:43, Wei Chen wrote:
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: 2022年3月1日 21:17
>> To: Wei Chen <Wei.Chen@arm.com>; Stefano Stabellini
>> <sstabellini@kernel.org>
>> Cc: xen-devel@lists.xenproject.org; Bertrand Marquis
>> <Bertrand.Marquis@arm.com>; Penny Zheng <Penny.Zheng@arm.com>; Henry Wang
>> <Henry.Wang@arm.com>; nd <nd@arm.com>
>> Subject: Re: Proposal for Porting Xen to Armv8-R64 - DraftA
>>
>> On 01/03/2022 06:29, Wei Chen wrote:
>>> Hi Julien,
>>
>> Hi,
>>
>>>> -----Original Message-----
>>>> From: Julien Grall <julien@xen.org>
>>>> Sent: 2022年2月26日 4:12
>>>> To: Wei Chen <Wei.Chen@arm.com>; Stefano Stabellini
>>>> <sstabellini@kernel.org>
>>>> Cc: xen-devel@lists.xenproject.org; Bertrand Marquis
>>>> <Bertrand.Marquis@arm.com>; Penny Zheng <Penny.Zheng@arm.com>; Henry
>> Wang
>>>> <Henry.Wang@arm.com>; nd <nd@arm.com>
>>>> Subject: Re: Proposal for Porting Xen to Armv8-R64 - DraftA
>>>>
>>>> Hi Wei,
>>>>
>>>> On 25/02/2022 10:48, Wei Chen wrote:
>>>>>>>        Armv8-R64 can support max to 256 MPU regions. But that's just
>>>>>> theoretical.
>>>>>>>        So we don't want to define `pr_t mpu_regions[256]`, this is a
>>>> memory
>>>>>> waste
>>>>>>>        in most of time. So we decided to let the user specify through
>> a
>>>>>> Kconfig
>>>>>>>        option. `CONFIG_ARM_MPU_EL1_PROTECTION_REGIONS` default value
>> can
>>>> be
>>>>>> `32`,
>>>>>>>        it's a typical implementation on Armv8-R64. Users will
>> recompile
>>>> Xen
>>>>>> when
>>>>>>>        their platform changes. So when the MPU changes, respecifying
>> the
>>>>>> MPU
>>>>>>>        protection regions number will not cause additional problems.
>>>>>>
>>>>>> I wonder if we could probe the number of MPU regions at runtime and
>>>>>> dynamically allocate the memory needed to store them in arch_vcpu.
>>>>>>
>>>>>
>>>>> We have considered to used a pr_t mpu_regions[0] in arch_vcpu. But it
>>>> seems
>>>>> we will encounter some static allocated arch_vcpu problems and sizeof
>>>> issue.
>>>>
>>>> Does it need to be embedded in arch_vcpu? If not, then we could
>> allocate
>>>> memory outside and add a pointer in arch_vcpu.
>>>>
>>>
>>> We had thought to use a pointer in arch_vcpu instead of embedding
>> mpu_regions
>>> into arch_vcpu. But we noticed that arch_vcpu has a __cacheline_aligned
>>> attribute, this may be because of arch_vcpu will be used very frequently
>>> in some critical path. So if we use the pointer for mpu_regions, may
>> cause
>>> some cache miss in these critical path, for example, in context_swtich.
>>
>>   From my understanding, the idea behind ``cacheline_aligned`` is to
>> avoid the struct vcpu to be shared with other datastructure. Otherwise
>> you may end up to have two pCPUs to frequently write the same cacheline
>> which is not ideal.
>>
>> arch_vcpu should embbed anything that will be accessed often (e.g.
>> entry/exit) to certain point. For instance, not everything related to
>> the vGIC are embbed in the vCPU/Domain structure.
>>
>> I am a bit split regarding the mpu_regions. If they are mainly used in
>> the context_switch() then I would argue this is a premature optimization
>> because the scheduling decision is probably going to take a lot more
>> time than the context switch itself.
> 
> mpu_regions in arch_vcpu are used to save guest's EL1 MPU context. So, yes,
> they are mainly used in context_switch. In terms of the number of registers,
> it will save/restore more work than the original V8A. And on V8R we also need
> to keep most of the original V8A save/restore work. So it will take longer
> than the original V8A context_switch. And I think this is due to architecture's
> difference. So it's impossible for us not to save/restore EL1 MPU region
> registers in context_switch. And we have done some optimization for EL1 MPU
> save/restore:
> 1. Assembly code for EL1 MPU context_switch

This discussion reminds me when KVM decided to rewrite their context 
switch from assembly to C. The outcome was the compiler is able to do a 
better job than us when it comes to optimizing.

With a C version, we could also share the save/restore code with 32-bit 
and it is easier to read/maintain.

So I would suggest to run some numbers to check if it really worth 
implementing the MPU save/restore in assembly.

> 2. Use real MPU regions number instead of CONFIG_ARM_MPU_EL1_PROTECTION_REGIONS
>     in context_switch. CONFIG_ARM_MPU_EL1_PROTECTION_REGIONS is defined the Max
>     supported EL1 MPU regions for this Xen image. All platforms that implement
>     EL1 MPU regions in this range can work well with this Xen Image. But if the
>     implemented EL1 MPU region number exceeds CONFIG_ARM_MPU_EL1_PROTECTION_REGIONS,
>     this Xen image could not work well on this platform.

This sounds similar to the GICv3. The number of LRs depends on the 
hardware. See how we dealt with it in gicv3_save_lrs().

>    
>>
>> Note that for the P2M we already have that indirection because it is
>> embbed in the struct domain.
> 
> It's different with V8A P2M case. In V8A context_switch we just need to
> save/restore VTTBR, we don't need to do P2M table walk. But on V8R, we
> need to access valid mpu_regions for save/restore.

The save/restore for the P2M is a bit more complicated than simply 
save/restore the VTTBR. But yes, I agree the code for the MPU will 
likely be more complicated.

> 
>>
>> This raises one question, why is the MPUs regions will be per-vCPU
>> rather per domain?
>>
> 
> Because there is a EL1 MPU component for each pCPU. We can't assume guest
> to use the same EL1 MPU configuration for all vCPU.

Ah. Sorry, I thought you were referring to whatever Xen will use to 
prevent the guest accessing outside of its designated region.

Cheers,

-- 
Julien Grall

