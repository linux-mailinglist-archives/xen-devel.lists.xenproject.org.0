Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 434B82DA09E
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 20:35:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52635.91930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kotcp-0002iv-E6; Mon, 14 Dec 2020 19:35:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52635.91930; Mon, 14 Dec 2020 19:35:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kotcp-0002iW-Ay; Mon, 14 Dec 2020 19:35:15 +0000
Received: by outflank-mailman (input) for mailman id 52635;
 Mon, 14 Dec 2020 19:35:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kotco-0002iR-6F
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 19:35:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kotcj-0004cA-Vb; Mon, 14 Dec 2020 19:35:09 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kotcj-0003q3-NF; Mon, 14 Dec 2020 19:35:09 +0000
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
	bh=QC56/L8dZ8gMmsCuXnU4A4bTJ9SlqYisdqCPjcMZX7A=; b=nrvCYkD1StrE1F7l4AJVc4UFxV
	LOZpPUalC4cvPWK2GlNwCGKWM9Vhgkvuud7RaKfsaO9X0cDmcismLb9Pnv//j9XPAFpe0GOhldOi5
	4lK7eSeQNuzGzvuX9MXumGPyMv7HGvRUBEPpQVfP25KgDmdNjS5WlsEaQ/MYeZ00Edf4=;
Subject: Re: [PATCH v3 7/8] xen/arm: Add support for SMMUv3 driver
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1607617848.git.rahul.singh@arm.com>
 <33645b592bc5935a3b28ad576a819d06ed81e8dd.1607617848.git.rahul.singh@arm.com>
 <e26c96cb-245b-6927-c4a7-224c2114df42@xen.org>
 <1660236F-7BB0-4F3E-8CDD-10AE9282E2A3@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <6d693361-220c-fa1b-a04f-12a80f0aec4a@xen.org>
Date: Mon, 14 Dec 2020 19:35:06 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <1660236F-7BB0-4F3E-8CDD-10AE9282E2A3@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 14/12/2020 19:08, Rahul Singh wrote:
> Hello Julien,

Hi Rahul,

> 
>> On 11 Dec 2020, at 2:25 pm, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Rahul,
>>
>> On 10/12/2020 16:57, Rahul Singh wrote:
>>>   struct arm_smmu_strtab_cfg {
>>> @@ -613,8 +847,13 @@ struct arm_smmu_device {
>>>   		u64			padding;
>>>   	};
>>>   -	/* IOMMU core code handle */
>>> -	struct iommu_device		iommu;
>>> +	/* Need to keep a list of SMMU devices */
>>> +	struct list_head		devices;
>>> +
>>> +	/* Tasklets for handling evts/faults and pci page request IRQs*/
>>> +	struct tasklet		evtq_irq_tasklet;
>>> +	struct tasklet		priq_irq_tasklet;
>>> +	struct tasklet		combined_irq_tasklet;
>>>   };
>>>     /* SMMU private data for each master */
>>> @@ -638,7 +877,6 @@ enum arm_smmu_domain_stage {
>>>     struct arm_smmu_domain {
>>>   	struct arm_smmu_device		*smmu;
>>> -	struct mutex			init_mutex; /* Protects smmu pointer */
>>
>> Hmmm... Your commit message says the mutex would be replaced by a spinlock. However, you are dropping the lock. What I did miss?
> 
> Linux code using the mutex in the function arm_smmu_attach_dev() but in XEN this function is called from arm_smmu_assign_dev() which already has the spin_lock when arm_smmu_attach_dev() function I called so I drop the mutex to avoid nested spinlock.
> Timing analysis of using spin lock in place of mutex as compared to linux  when attaching a  device to SMMU is still valid.

I think it would be better to keep the current locking until the 
investigation is done.

But if you still want to make this change, then you should explain in 
the commit message why the lock is dropped.

[...]

> WARN_ON(q->base_dma & (qsz - 1));
> if (!unlikely(q->base_dma & (qsz - 1))) {
> 	dev_info(smmu->dev, "allocated %u entries for %s\n",
> 		1 << q->llq.max_n_shift, name);
> }

Right, but this doesn't address the second part of my comment.

This change would *not* be necessary if the implementation of WARN_ON() 
in Xen return whether the warn was triggered.

Before considering to change the SMMU code, you should first attempt to 
modify implementation of the WARN_ON(). We can discuss other approach if 
the discussion goes nowhere.

Cheers,

-- 
Julien Grall

