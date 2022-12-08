Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0273E6470CB
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 14:31:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457148.715007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3Gzc-0003QC-Jr; Thu, 08 Dec 2022 13:31:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457148.715007; Thu, 08 Dec 2022 13:31:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3Gzc-0003Nq-H2; Thu, 08 Dec 2022 13:31:16 +0000
Received: by outflank-mailman (input) for mailman id 457148;
 Thu, 08 Dec 2022 13:31:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p3Gzb-0003Nk-NB
 for xen-devel@lists.xenproject.org; Thu, 08 Dec 2022 13:31:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p3GzY-00017u-2s; Thu, 08 Dec 2022 13:31:12 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239] helo=[192.168.4.36])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p3GzX-0000Rb-Sq; Thu, 08 Dec 2022 13:31:12 +0000
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
	bh=XuB7XkZgCQwDmNUmMn5Arvg9AAGmaonnXBQCjEwHKRY=; b=c/IQpanrqww6jJa3MVBtPbLlm4
	HGHdttoCC4p92lgfx1+2vEk7rCd5N9IIbw4z3kn3IHw1DxdRWCA8MfN8Rst51OA+gxufENxnldr0v
	a8mh65HQp5Zdf8rJqsE3+kE0yM4pn4/GGFlV9D0VWy7hzqVgC/R7pfEPvnnQlJfbAmYU=;
Message-ID: <59e3a9a2-98dc-7b01-5c3e-a7fafc9ee85d@xen.org>
Date: Thu, 8 Dec 2022 13:31:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [BUG]SMMU-V3 queue need no-cache memory
Content-Language: en-US
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: sisyphean <sisyphean@zlw.email>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <e1e0e347-6530-7b68-92f7-ef52defa55ac@zlw.email>
 <75D89B2C-BBE4-419A-80B7-FEE39445ABB2@arm.com>
 <fe0f90fa-84aa-54b2-1e12-98baff7fcaf7@xen.org>
 <A1DD6AE5-7AB0-4843-BB9F-3CA1F8277ADF@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <A1DD6AE5-7AB0-4843-BB9F-3CA1F8277ADF@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 08/12/2022 13:04, Rahul Singh wrote:
> Hi Julien,

Hi Rahul,

>> On 7 Dec 2022, at 12:13 pm, Julien Grall <julien@xen.org> wrote:
>>
>> Hi,
>>
>> I only noticed this e-mail because I was skimming xen-devel. If you want to get our attention, then I would suggest to CC both of us because I (and I guess Stefano) have filter rules so those e-mails land directly in my inbox.
>>
>> On 07/12/2022 10:24, Rahul Singh wrote:
>>>> On 7 Dec 2022, at 2:04 am, sisyphean <sisyphean@zlw.email> wrote:
>>>>
>>>> Hi,
>>>>
>>>>      I try to run XEN on my ARM board(Sorry, for some commercial reasons, I can't tell you
>>>>      on which platform I run XEN)  and enable SMMU-V3, but all cmds in cmdq failed when XEN started.
>>>>
>>>>      After using the debugger to track debugging, the reason for this problem is that
>>>>      the queue in the smmu-v3 driver is not no-cache, so after the function arm_smmu_cmdq_build_cmd
>>>>      is executed, the cmd is still in cache.Therefore, the SMMU-V3 hardware cannot obtain the correct cmd
>>>>      from the memory for execution.
>>> Yes you are right as of now we are allocating the memory for cmdqueue via _xzalloc() which is cached
>>> memory because of that you are observing the issue. We have tested the Xen SMMUv3 driver on SOC
>>> where SMMUv3 HW is in the coherency domain, and because of that we have not encountered this issue.
>>> I think In your case SMMUv3 HW is not in the coherency domain. Please confirm from your side if the
>>> "dma-coherent” property is not set in DT.
>>> I think there is no function available as of now to request Xen to allocate memory that is not cached.
>>
>> You are correct.
>>
>>> @Julien and @Stefano do you have any suggestion on how we can request memory from Xen that is not
>>> cached something like dma_alloc_coherent() in Linux.
>>
>> At the moment all the RAM is mapped cacheable in Xen. So it will require some work to have some memory uncacheable.
>>
>> There are two options:
>> 1) Allocate a pool of memory at boot time that will be mapped with different memory attribute. This means we would need a separate pool and the user will have to size it.
>> 2) Modify after the allocation the caching attribute in the memory and then revert back after freeing. The cons is we would end up to shatter superpage. We also can't re-create superpage (yet), but that might be fine if the memory is never freed.
>>
>> Option two would probably the best. But before going that route I have one question...
>>
>>> The temporary solution I use is to execute function clean_dcache every
>>> time cmd is copied to cmdq in function queue_write. But it is obvious
>>> that this will seriously affect the efficiency.
>>
>> I agree you will see some performance impact in micro-benchmark. But I am not sure about normal use-cases. How often do you expect the command queue to be used?
> 
> To be precise command queue will be used when

Thanks for the list. See my comments below.

>   - Set up the stage-2 translation when we assigned the devices to guests. This happens typically dom0 boot and domU creation.

Hotplugging is another approach. At the moment, I would expect that in 
this situation the cache flush will just be noise as the domain creation 
is quite complex.

>   - When there is a call to iommu_iotlb_flush() that will call IOMMU specific iotlb_flush. SMMuv3 driver will send the command to
>     SMMUv3 HW to invalidate the entries.

This is an interesting one. Those operations will usually be heavily 
used by backend PV drivers when mapping/unmapping the grant entries.

I am not aware of anyone that did some performance test when the IOMMU 
is enabled (I think Stefano did some in the past when disabled).

The grant mapping are usually one page at the time. So it would be 
interesting to check the overhead of the SMMU (even without the cache 
flush). The tests I am thinking are comparing the numbers with and 
without the IOMMU enabled:
  1) Micro-benchmark the map/unmap operations
  2) Benchmark throughput for block and network device

Cheers,

-- 
Julien Grall

