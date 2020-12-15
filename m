Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2763E2DAAAA
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 11:14:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.53022.92520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp7KW-0000D2-SJ; Tue, 15 Dec 2020 10:13:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 53022.92520; Tue, 15 Dec 2020 10:13:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp7KW-0000Cd-Oq; Tue, 15 Dec 2020 10:13:16 +0000
Received: by outflank-mailman (input) for mailman id 53022;
 Tue, 15 Dec 2020 10:13:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kp7KV-0000CY-45
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 10:13:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kp7KQ-0003Y4-TD; Tue, 15 Dec 2020 10:13:10 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kp7KQ-0005O1-KO; Tue, 15 Dec 2020 10:13:10 +0000
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
	bh=IPzPIFuYqyXykbuJUmZrBmTINjrSm/wOBxDDVvjdgZ4=; b=MVYqtZSYyf2SHM/p00TQo10RWD
	DHS6mx+G4ZSIaobrzVdHzRccPt/Juz6XsVC525/TiA1QUnjhcXPDqg5Cm0iy+av4ha7ncJhdJ7WvW
	nL0KidISEHdcYWfED/QqOqtJq474Qe5jYVzdac8LIKpk0fekIT1ZWYW2R2O4G3Q+OBxU=;
Subject: Re: [PATCH v3 7/8] xen/arm: Add support for SMMUv3 driver
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Rahul Singh <Rahul.Singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1607617848.git.rahul.singh@arm.com>
 <33645b592bc5935a3b28ad576a819d06ed81e8dd.1607617848.git.rahul.singh@arm.com>
 <e26c96cb-245b-6927-c4a7-224c2114df42@xen.org>
 <1660236F-7BB0-4F3E-8CDD-10AE9282E2A3@arm.com>
 <6d693361-220c-fa1b-a04f-12a80f0aec4a@xen.org>
 <CD549B7A-97C8-40F6-B762-6661A7EFAED1@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <da26c36c-97ec-d9f6-abfd-642017c3df5c@xen.org>
Date: Tue, 15 Dec 2020 10:13:08 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <CD549B7A-97C8-40F6-B762-6661A7EFAED1@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 15/12/2020 09:42, Bertrand Marquis wrote:
> Hi Julien,

Hi,

>> On 14 Dec 2020, at 19:35, Julien Grall <julien@xen.org> wrote:
>>
>>
>>
>> On 14/12/2020 19:08, Rahul Singh wrote:
>>> Hello Julien,
>>
>> Hi Rahul,
>>
>>>> On 11 Dec 2020, at 2:25 pm, Julien Grall <julien@xen.org> wrote:
>>>>
>>>> Hi Rahul,
>>>>
>>>> On 10/12/2020 16:57, Rahul Singh wrote:
>>>>>   struct arm_smmu_strtab_cfg {
>>>>> @@ -613,8 +847,13 @@ struct arm_smmu_device {
>>>>>   		u64			padding;
>>>>>   	};
>>>>>   -	/* IOMMU core code handle */
>>>>> -	struct iommu_device		iommu;
>>>>> +	/* Need to keep a list of SMMU devices */
>>>>> +	struct list_head		devices;
>>>>> +
>>>>> +	/* Tasklets for handling evts/faults and pci page request IRQs*/
>>>>> +	struct tasklet		evtq_irq_tasklet;
>>>>> +	struct tasklet		priq_irq_tasklet;
>>>>> +	struct tasklet		combined_irq_tasklet;
>>>>>   };
>>>>>     /* SMMU private data for each master */
>>>>> @@ -638,7 +877,6 @@ enum arm_smmu_domain_stage {
>>>>>     struct arm_smmu_domain {
>>>>>   	struct arm_smmu_device		*smmu;
>>>>> -	struct mutex			init_mutex; /* Protects smmu pointer */
>>>>
>>>> Hmmm... Your commit message says the mutex would be replaced by a spinlock. However, you are dropping the lock. What I did miss?
>>> Linux code using the mutex in the function arm_smmu_attach_dev() but in XEN this function is called from arm_smmu_assign_dev() which already has the spin_lock when arm_smmu_attach_dev() function I called so I drop the mutex to avoid nested spinlock.
>>> Timing analysis of using spin lock in place of mutex as compared to linux  when attaching a  device to SMMU is still valid.
>>
>> I think it would be better to keep the current locking until the investigation is done.
>>
>> But if you still want to make this change, then you should explain in the commit message why the lock is dropped.
>>
>> [...]
>>
>>> WARN_ON(q->base_dma & (qsz - 1));
>>> if (!unlikely(q->base_dma & (qsz - 1))) {
>>> 	dev_info(smmu->dev, "allocated %u entries for %s\n",
>>> 		1 << q->llq.max_n_shift, name);
>>> }
>>
>> Right, but this doesn't address the second part of my comment.
>>
>> This change would *not* be necessary if the implementation of WARN_ON() in Xen return whether the warn was triggered.
>>
>> Before considering to change the SMMU code, you should first attempt to modify implementation of the WARN_ON(). We can discuss other approach if the discussion goes nowhere.
> 
> The code proposed by Rahul is providing the equivalent functionality to what linux does.
> 
> Modifying WARN_ON implementation in Xen to fit how Linux version is working would make sense but should be done in its own patch as it will imply modification on more Xen code and
> some of it will not be related to SMMU and will need some validation.

Let me start that this was a request I already made on v2 and Rahul 
agreed. I saw no pushback on the request until now. So to me this meant 
this would be addressed in v3.

Further, the validation seems to be a common argument everytime I ask to 
make a change in this series... Yes validation is important, but this 
often doesn't require a lot of effort when the changes are simple... 
TBH, you are probably spending more time arguing against it.

> So I do not think it would be fare to ask Rahul to also do this in the scope of this serie

I would have agreed with this statement if the change is difficult. This 
is not the case here.

The first step when working upstream should always to improve existing 
helpers rather than working around it.

If it is not possible because it is either too complex or there are push 
back from the maintainers. Then we can discuss about workaround.

Cheers,

-- 
Julien Grall

