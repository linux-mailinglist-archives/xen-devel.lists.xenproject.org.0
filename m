Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5642DAC0F
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 12:31:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.53085.92631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp8Y0-00080R-2m; Tue, 15 Dec 2020 11:31:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 53085.92631; Tue, 15 Dec 2020 11:31:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp8Xz-000802-Vi; Tue, 15 Dec 2020 11:31:15 +0000
Received: by outflank-mailman (input) for mailman id 53085;
 Tue, 15 Dec 2020 11:31:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kp8Xy-0007zx-2z
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 11:31:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kp8Xu-0004rI-CK; Tue, 15 Dec 2020 11:31:10 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kp8Xu-0001YU-13; Tue, 15 Dec 2020 11:31:10 +0000
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
	bh=fa62A7nEbkIDrc4YDc0RsgpTwVxVHjUkKzGCyZBXX78=; b=GpNV6Y3SiY/Tz12x+Qfbcr5B+7
	0pyzmOt8DX6FOc2bOxqbF1wCkGPPhwB/9zoJVSp4WYtqP2/ISA/yR7Xrghqe+f53ZMg0wjrIgFZ0H
	z6gSYOZwHR7dctpNIC7EjD1QfgN9zSIjayKEMar2V0YGd2j9brL7tAmW1WiYialEUExg=;
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
 <da26c36c-97ec-d9f6-abfd-642017c3df5c@xen.org>
 <99C334D2-B77B-4B8A-8294-00A811CFB80B@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <f90df909-8815-878e-88ad-077b55a9ce1e@xen.org>
Date: Tue, 15 Dec 2020 11:31:07 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <99C334D2-B77B-4B8A-8294-00A811CFB80B@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 15/12/2020 10:51, Bertrand Marquis wrote:
> Hi Julien,

Hi Bertrand,

> 
>> On 15 Dec 2020, at 10:13, Julien Grall <julien@xen.org> wrote:
>>
>>
>>
>> On 15/12/2020 09:42, Bertrand Marquis wrote:
>>> Hi Julien,
>>
>> Hi,
>>
>>>> On 14 Dec 2020, at 19:35, Julien Grall <julien@xen.org> wrote:
>>>>
>>>>
>>>>
>>>> On 14/12/2020 19:08, Rahul Singh wrote:
>>>>> Hello Julien,
>>>>
>>>> Hi Rahul,
>>>>
>>>>>> On 11 Dec 2020, at 2:25 pm, Julien Grall <julien@xen.org> wrote:
>>>>>>
>>>>>> Hi Rahul,
>>>>>>
>>>>>> On 10/12/2020 16:57, Rahul Singh wrote:
>>>>>>>   struct arm_smmu_strtab_cfg {
>>>>>>> @@ -613,8 +847,13 @@ struct arm_smmu_device {
>>>>>>>   		u64			padding;
>>>>>>>   	};
>>>>>>>   -	/* IOMMU core code handle */
>>>>>>> -	struct iommu_device		iommu;
>>>>>>> +	/* Need to keep a list of SMMU devices */
>>>>>>> +	struct list_head		devices;
>>>>>>> +
>>>>>>> +	/* Tasklets for handling evts/faults and pci page request IRQs*/
>>>>>>> +	struct tasklet		evtq_irq_tasklet;
>>>>>>> +	struct tasklet		priq_irq_tasklet;
>>>>>>> +	struct tasklet		combined_irq_tasklet;
>>>>>>>   };
>>>>>>>     /* SMMU private data for each master */
>>>>>>> @@ -638,7 +877,6 @@ enum arm_smmu_domain_stage {
>>>>>>>     struct arm_smmu_domain {
>>>>>>>   	struct arm_smmu_device		*smmu;
>>>>>>> -	struct mutex			init_mutex; /* Protects smmu pointer */
>>>>>>
>>>>>> Hmmm... Your commit message says the mutex would be replaced by a spinlock. However, you are dropping the lock. What I did miss?
>>>>> Linux code using the mutex in the function arm_smmu_attach_dev() but in XEN this function is called from arm_smmu_assign_dev() which already has the spin_lock when arm_smmu_attach_dev() function I called so I drop the mutex to avoid nested spinlock.
>>>>> Timing analysis of using spin lock in place of mutex as compared to linux  when attaching a  device to SMMU is still valid.
>>>>
>>>> I think it would be better to keep the current locking until the investigation is done.
>>>>
>>>> But if you still want to make this change, then you should explain in the commit message why the lock is dropped.
>>>>
>>>> [...]
>>>>
>>>>> WARN_ON(q->base_dma & (qsz - 1));
>>>>> if (!unlikely(q->base_dma & (qsz - 1))) {
>>>>> 	dev_info(smmu->dev, "allocated %u entries for %s\n",
>>>>> 		1 << q->llq.max_n_shift, name);
>>>>> }
>>>>
>>>> Right, but this doesn't address the second part of my comment.
>>>>
>>>> This change would *not* be necessary if the implementation of WARN_ON() in Xen return whether the warn was triggered.
>>>>
>>>> Before considering to change the SMMU code, you should first attempt to modify implementation of the WARN_ON(). We can discuss other approach if the discussion goes nowhere.
>>> The code proposed by Rahul is providing the equivalent functionality to what linux does.
>>> Modifying WARN_ON implementation in Xen to fit how Linux version is working would make sense but should be done in its own patch as it will imply modification on more Xen code and
>>> some of it will not be related to SMMU and will need some validation.
>>
>> Let me start that this was a request I already made on v2 and Rahul agreed. I saw no pushback on the request until now. So to me this meant this would be addressed in v3.
> 
> I think he agreed on the analysis but he did not say he was going to do it.
> 
>>
>> Further, the validation seems to be a common argument everytime I ask to make a change in this series... Yes validation is important, but this often doesn't require a lot of effort when the changes are simple... TBH, you are probably spending more time arguing against it.
> 
> Testing is important and effort evaluation also depends on other priorities we have.
> 
> There are 20 WARN_ON in Xen and most of them are in x86 code.
> If we do this change, the serie will impact a lot more code then it originally did.

What's the problem?

> 
> I am not saying it should not be done, I am saying it should not be done in this serie.
> Such a change would need a serie upfront and then rebasing this serie on top of it to prevent mixing stuff to much.

It is trivial enough to be part of this series. But if you prefer to 
create a separate series then so be it.

> 
>>
>>> So I do not think it would be fare to ask Rahul to also do this in the scope of this serie
>>
>> I would have agreed with this statement if the change is difficult. This is not the case here.
>>
>> The first step when working upstream should always to improve existing helpers rather than working around it.
> 
> I agree with that statement but we should be carefull not to ask to much to people who try to contribute so that they
> do not feel like all changes asked are not too much to handle.

I am well aware of that and I don't think this request is asking a lot.

> I am open to create new tasks on our side for the future when things to be improved like this ones are revealed by a
> serie.
> 
> If this is a blocker from your point of view, we will evaluate the effort to do this extra work and the serie will wait until
> january to be pushed again.
This sounds like it would require more effort than it is actually 
necessary. In fact...

... it took me one minute to check the existing use of WARN_ON() (all of 
them don't care about the return so far), another 2 minutes to write it, 
  an extra 5 minutes to test it and 2 minutes to write the commit message.

So a grand total of 10 minutes.

Anyway, please see the patch [1].

Cheers,

[1] 
https://lore.kernel.org/xen-devel/20201215112610.1986-1-julien@xen.org/T/#u

-- 
Julien Grall

