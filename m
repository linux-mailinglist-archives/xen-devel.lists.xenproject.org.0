Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A60A93F83F0
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 10:50:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172803.315322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJB4h-0000y6-IZ; Thu, 26 Aug 2021 08:49:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172803.315322; Thu, 26 Aug 2021 08:49:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJB4h-0000wJ-FO; Thu, 26 Aug 2021 08:49:27 +0000
Received: by outflank-mailman (input) for mailman id 172803;
 Thu, 26 Aug 2021 08:49:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mJB4g-0000wD-CN
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 08:49:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mJB4g-000194-6w; Thu, 26 Aug 2021 08:49:26 +0000
Received: from [54.239.6.184] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mJB4g-0001WW-18; Thu, 26 Aug 2021 08:49:26 +0000
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
	bh=ikgdwLWoCZr6JKU50ZTWi49Md1/SXkWNySoXkgbRS0U=; b=wxXGaPK7s0hDNV13bHv56/yvVP
	gEXedw4o4W6LgGUiNTChKpBQe2jKj45fVxcsFRyXxcNXE0NM+WBvPUAEZxYWZk20Q/F0jGF30OHre
	tleQdkh43S2ici87F6XJtW3+jH8dyZU0JZjSnjyYZCo3R8bARF+pbzI4DNmM3yzIpwq8=;
Subject: Re: [XEN RFC PATCH 26/40] xen/arm: Add boot and secondary CPU to NUMA
 system
To: Wei Chen <Wei.Chen@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-27-wei.chen@arm.com>
 <35a57b18-4fab-522d-f39a-de21017abe57@xen.org>
 <DB9PR08MB6857FC8EA8C0D324426408709EC79@DB9PR08MB6857.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <d7ea4260-aec5-efb5-32e7-7f73d6ee206b@xen.org>
Date: Thu, 26 Aug 2021 09:49:24 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <DB9PR08MB6857FC8EA8C0D324426408709EC79@DB9PR08MB6857.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 26/08/2021 08:24, Wei Chen wrote:
> Hi Julien,

Hi Wei,

>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: 2021年8月26日 0:58
>> To: Wei Chen <Wei.Chen@arm.com>; xen-devel@lists.xenproject.org;
>> sstabellini@kernel.org; jbeulich@suse.com
>> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>
>> Subject: Re: [XEN RFC PATCH 26/40] xen/arm: Add boot and secondary CPU to
>> NUMA system
>>
>> Hi Wei,
>>
>> On 11/08/2021 11:24, Wei Chen wrote:
>>> When cpu boot up, we have add them to NUMA system. In current
>>> stage, we have not parsed the NUMA data, but we have created
>>> a fake NUMA node. So, in this patch, all CPU will be added
>>> to NUMA node#0. After the NUMA data has been parsed from device
>>> tree, the CPU will be added to correct NUMA node as the NUMA
>>> data described.
>>>
>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>> ---
>>>    xen/arch/arm/setup.c       | 6 ++++++
>>>    xen/arch/arm/smpboot.c     | 6 ++++++
>>>    xen/include/asm-arm/numa.h | 1 +
>>>    3 files changed, 13 insertions(+)
>>>
>>> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>>> index 3c58d2d441..7531989f21 100644
>>> --- a/xen/arch/arm/setup.c
>>> +++ b/xen/arch/arm/setup.c
>>> @@ -918,6 +918,12 @@ void __init start_xen(unsigned long
>> boot_phys_offset,
>>>
>>>        processor_id();
>>>
>>> +    /*
>>> +     * If Xen is running on a NUMA off system, there will
>>> +     * be a node#0 at least.
>>> +     */
>>> +    numa_add_cpu(0);
>>> +
>>>        smp_init_cpus();
>>>        cpus = smp_get_max_cpus();
>>>        printk(XENLOG_INFO "SMP: Allowing %u CPUs\n", cpus);
>>> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
>>> index a1ee3146ef..aa78958c07 100644
>>> --- a/xen/arch/arm/smpboot.c
>>> +++ b/xen/arch/arm/smpboot.c
>>> @@ -358,6 +358,12 @@ void start_secondary(void)
>>>         */
>>>        smp_wmb();
>>>
>>> +    /*
>>> +     * If Xen is running on a NUMA off system, there will
>>> +     * be a node#0 at least.
>>> +     */
>>> +    numa_add_cpu(cpuid);
>>> +
>>
>> On x86, numa_add_cpu() will be called before the pCPU is brought up. I
>> am not quite too sure why we are doing it differently here. Can you
>> clarify it?
> 
> Of course we can invoke numa_add_cpu before cpu_up as x86. But in my tests,
> I found when cpu bring up failed, this cpu still be add to NUMA. Although
> this does not affect the execution of the code (because CPU is offline),
> But I don't think adding a offline CPU to NUMA makes sense.

Right, but again, why do you want to solve the problem on Arm and not 
x86? After all, NUMA is not architecture specific (in fact you move most 
of the code in common).

In fact, the risk, is someone may read arch/x86 and doesn't realize the 
CPU is not in the node until late on Arm.

So I think we should call numa_add_cpu() around the same place on all 
the architectures.

If you think the current position on x86 is not correct, then it should 
be changed at as well. However, I don't know the story behind the 
position of the call on x86. You may want to ask the x86 maintainers.

Cheers,

-- 
Julien Grall

