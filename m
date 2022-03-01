Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 284104C8C6A
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 14:18:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281423.479747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP2NV-0007NR-2C; Tue, 01 Mar 2022 13:17:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281423.479747; Tue, 01 Mar 2022 13:17:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP2NU-0007Ld-Ur; Tue, 01 Mar 2022 13:17:20 +0000
Received: by outflank-mailman (input) for mailman id 281423;
 Tue, 01 Mar 2022 13:17:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nP2NT-0007LV-6v
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 13:17:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nP2NS-0007Pa-Tt; Tue, 01 Mar 2022 13:17:18 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235] helo=[192.168.6.66])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nP2NS-0001le-O9; Tue, 01 Mar 2022 13:17:18 +0000
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
	bh=bLkgc3t5QqA0tYP1xFG/GpU6vNgDn3gbTj1IxLYQhl8=; b=VWOt4lCvLnfoLkCyu+U2+t0MFc
	f50rhrUNhKQeACaF+NQnMfUZYAfZpytHPPWoVD+X9CiAqSd47VfotXbt9POyEwIqYyT6kzQuTrKO4
	0dWElwn4UseyRjpSmo4EFeFGWT37Qytw77D216L4xiEkOad8CjgoLicNZzCB8BvlJ+8w=;
Message-ID: <7260f050-9022-4adf-618b-a8b271aca8c3@xen.org>
Date: Tue, 1 Mar 2022 13:17:16 +0000
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
From: Julien Grall <julien@xen.org>
In-Reply-To: <PAXPR08MB74200F4B0B4EFFD5BE1A6E699E029@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01/03/2022 06:29, Wei Chen wrote:
> Hi Julien,

Hi,

>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: 2022年2月26日 4:12
>> To: Wei Chen <Wei.Chen@arm.com>; Stefano Stabellini
>> <sstabellini@kernel.org>
>> Cc: xen-devel@lists.xenproject.org; Bertrand Marquis
>> <Bertrand.Marquis@arm.com>; Penny Zheng <Penny.Zheng@arm.com>; Henry Wang
>> <Henry.Wang@arm.com>; nd <nd@arm.com>
>> Subject: Re: Proposal for Porting Xen to Armv8-R64 - DraftA
>>
>> Hi Wei,
>>
>> On 25/02/2022 10:48, Wei Chen wrote:
>>>>>       Armv8-R64 can support max to 256 MPU regions. But that's just
>>>> theoretical.
>>>>>       So we don't want to define `pr_t mpu_regions[256]`, this is a
>> memory
>>>> waste
>>>>>       in most of time. So we decided to let the user specify through a
>>>> Kconfig
>>>>>       option. `CONFIG_ARM_MPU_EL1_PROTECTION_REGIONS` default value can
>> be
>>>> `32`,
>>>>>       it's a typical implementation on Armv8-R64. Users will recompile
>> Xen
>>>> when
>>>>>       their platform changes. So when the MPU changes, respecifying the
>>>> MPU
>>>>>       protection regions number will not cause additional problems.
>>>>
>>>> I wonder if we could probe the number of MPU regions at runtime and
>>>> dynamically allocate the memory needed to store them in arch_vcpu.
>>>>
>>>
>>> We have considered to used a pr_t mpu_regions[0] in arch_vcpu. But it
>> seems
>>> we will encounter some static allocated arch_vcpu problems and sizeof
>> issue.
>>
>> Does it need to be embedded in arch_vcpu? If not, then we could allocate
>> memory outside and add a pointer in arch_vcpu.
>>
> 
> We had thought to use a pointer in arch_vcpu instead of embedding mpu_regions
> into arch_vcpu. But we noticed that arch_vcpu has a __cacheline_aligned
> attribute, this may be because of arch_vcpu will be used very frequently
> in some critical path. So if we use the pointer for mpu_regions, may cause
> some cache miss in these critical path, for example, in context_swtich.

 From my understanding, the idea behind ``cacheline_aligned`` is to 
avoid the struct vcpu to be shared with other datastructure. Otherwise 
you may end up to have two pCPUs to frequently write the same cacheline 
which is not ideal.

arch_vcpu should embbed anything that will be accessed often (e.g. 
entry/exit) to certain point. For instance, not everything related to 
the vGIC are embbed in the vCPU/Domain structure.

I am a bit split regarding the mpu_regions. If they are mainly used in 
the context_switch() then I would argue this is a premature optimization 
because the scheduling decision is probably going to take a lot more 
time than the context switch itself.

Note that for the P2M we already have that indirection because it is 
embbed in the struct domain.

This raises one question, why is the MPUs regions will be per-vCPU 
rather per domain?

Cheers,

-- 
Julien Grall

