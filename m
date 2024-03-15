Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D0D87CBB1
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 11:58:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693745.1082194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl5GP-00089z-9G; Fri, 15 Mar 2024 10:58:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693745.1082194; Fri, 15 Mar 2024 10:58:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl5GP-00087K-6B; Fri, 15 Mar 2024 10:58:13 +0000
Received: by outflank-mailman (input) for mailman id 693745;
 Fri, 15 Mar 2024 10:58:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rl5GN-00085d-ER
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 10:58:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rl5GM-0008Tg-Lh; Fri, 15 Mar 2024 10:58:10 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rl5GM-0003jY-Cl; Fri, 15 Mar 2024 10:58:10 +0000
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
	bh=4riWuCVUm7NgESscmGYEJ55dDJYLa2cImkKzyhvYz+M=; b=UeUyWQII61HBU3x/ax+BknYdaU
	XCeX8MlZSjt5SinMc6Qvq22acqch7asgbYVvfXBxbTSXCGAbw8Rva4cgnRZefMYrrGAdKJxBTudmO
	W/6F6IH5U94YeNuJHakJhtWj+CFAxjjtfP+X/Y1bJPMwoM6eH2pvLDBZCIFi5CqlbClI=;
Message-ID: <dc0b86eb-e494-45c9-b1f3-31a9b9f84f77@xen.org>
Date: Fri, 15 Mar 2024 10:58:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/arm: Set correct per-cpu cpu_core_mask
Content-Language: en-GB
To: Henry Wang <xin.wang2@amd.com>, xen-devel@lists.xenproject.org,
 george.dunlap@cloud.com
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Henry Wang <Henry.Wang@arm.com>, Juergen Gross <jgross@suse.com>
References: <20240228015822.56108-1-xin.wang2@amd.com>
 <77520838-67cb-4755-8b02-2ec8b90c7bfa@xen.org>
 <16838c64-c633-4125-9388-af02e18a89be@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <16838c64-c633-4125-9388-af02e18a89be@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 14/03/2024 14:22, Henry Wang wrote:
> Hi Julien,

Hi,

> 
> On 3/14/2024 9:27 PM, Julien Grall wrote:
>> Hi Henry,
>>
>> On 28/02/2024 01:58, Henry Wang wrote:
>>> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
>>> index a84e706d77..d9ebd55d4a 100644
>>> --- a/xen/arch/arm/smpboot.c
>>> +++ b/xen/arch/arm/smpboot.c
>>> @@ -66,7 +66,6 @@ static bool cpu_is_dead;
>>>     /* ID of the PCPU we're running on */
>>>   DEFINE_PER_CPU(unsigned int, cpu_id);
>>> -/* XXX these seem awfully x86ish... */
>>
>> :). I guess at the time we didn't realize that MT was supported on 
>> Arm. It is at least part of the spec, but as Michal pointed out it 
>> doesn't look like a lot of processors supports it.
> 
> Yep. Do you think changing the content of this line to something like 
> "Although multithread is part of the Arm spec, there are not many 
> processors support multithread and current Xen on Arm assumes there is 
> no multithread" makes sense to you?
> 
>>>   /* representing HT siblings of each logical CPU */
>>>   DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t, cpu_sibling_mask);
>>>   /* representing HT and core siblings of each logical CPU */
>>> @@ -89,6 +88,10 @@ static int setup_cpu_sibling_map(int cpu)
>>>       cpumask_set_cpu(cpu, per_cpu(cpu_sibling_mask, cpu));
>>>       cpumask_set_cpu(cpu, per_cpu(cpu_core_mask, cpu));
>>>   +    /* Currently we assume there is no multithread. */
>>
>> I am not very familiar with the scheduling in Xen. Do you know what's 
>> the consequence of not properly supporting MT? One thing I can think 
>> of is security (I know there were plenty of security issues with SMT).
> 
> Unfortunately me neither, so adding George to this thread as I think he 
> can bring us some insights on this topic from the scheduler perspective.

+Juergen as he worked on co-scheduling.

> 
>> Depending on the answer, I would consider to print a warning and maybe 
>> add it in SUPPORT.MD in a separate patch.
> 
> To be honest, as discussed in v1. I think I am quite tempted to add an 
> ASSERT(system_cpuinfo.mpidr.mt == 0) to make sure we catch the 
> multithread support stuff earlier. 

ASSERT(...) is not the right solution. You may have user using a Xen 
shipped by distros where this would be a NOP.

We could try to hide MT completely from the scheduler. If that's too 
difficult, then we could add use warning_add() to throw a warning (see 
how we dealt with opt_hmp_unsafe).

I don't really know what will happen
> if running current Xen on top of a multithread-implemented processor, 
> probably it will be fine, but probably some strange behavior will happen 
> after the boot time which I think will be difficult to debug...

I am not sure what you mean by "strange behavior". AFAIK, you may see 
different performance characteristics and more importantly this is a 
nest for security issue. But I don't expect any difficult to debug.

> 
>> Also, looking at the v1 discussion, it sounds like even 
>> cpu_sibling_mask would not be correct. So I think it would make sense 
>> to move the comment on top of setup_cpu_sibling_map.
> 
> Sounds good. I will move it in v3.
> 
>>> +    cpumask_or(per_cpu(cpu_core_mask, cpu),
>>> +               per_cpu(cpu_core_mask, cpu), &cpu_possible_map);
>>
>> AFIACT, per_cpu(cpu_core_mask, ...) will now be equal to 
>> cpu_possible_map. In that case, wouldn't it be better to simply copy 
>> the cpumask?
> 
> You mean cpumask_copy(per_cpu(cpu_core_mask, cpu), &cpu_possible_map)? 

Yes.

Cheers,

-- 
Julien Grall

