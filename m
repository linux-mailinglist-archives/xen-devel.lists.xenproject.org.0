Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E9C43C7D6
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 12:42:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216872.376642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfgNQ-0002c9-Cz; Wed, 27 Oct 2021 10:41:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216872.376642; Wed, 27 Oct 2021 10:41:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfgNQ-0002ZZ-9S; Wed, 27 Oct 2021 10:41:48 +0000
Received: by outflank-mailman (input) for mailman id 216872;
 Wed, 27 Oct 2021 10:41:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gtXy=PP=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1mfgNP-0002ZT-3q
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 10:41:47 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 7f93e34e-ad61-4b4e-9ef8-7e4fd39633f7;
 Wed, 27 Oct 2021 10:41:44 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 10CE81FB;
 Wed, 27 Oct 2021 03:41:44 -0700 (PDT)
Received: from [10.57.26.24] (unknown [10.57.26.24])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AF5573F70D;
 Wed, 27 Oct 2021 03:41:42 -0700 (PDT)
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
X-Inumbo-ID: 7f93e34e-ad61-4b4e-9ef8-7e4fd39633f7
Subject: Re: [patch-4.16] arm/smmuv1,v2: Protect smmu master list with a lock
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com,
 Ian Jackson <iwj@xenproject.org>
References: <20211026122903.15042-1-michal.orzel@arm.com>
 <e5632a4e-db98-41b4-1045-2b3532c098fa@xen.org>
 <70c30a6c-b779-805e-079a-41bb484894b9@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <cb452c0c-ccde-7798-c403-f972b48a2c46@arm.com>
Date: Wed, 27 Oct 2021 12:41:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <70c30a6c-b779-805e-079a-41bb484894b9@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Julien,

On 26.10.2021 18:56, Julien Grall wrote:
> Hi,
> 
> On 26/10/2021 17:28, Julien Grall wrote:
>> On 26/10/2021 13:29, Michal Orzel wrote:
>>> If a device is added to SMMUv1/v2 from DT and PCI
>>> at the same time, there is a concurrent access
>>> to a smmu master list. This could lead to a
>>> scenario where one is looking into a list that
>>> is being modified at the same time. Add a lock
>>> to prevent this issue.
>>
>> Did you intend to say "Hold" rather than "Add"?
>>
Yes, this is what I meant. I will change it.

>>>
>>> Reuse the existing spinlock arm_smmu_devices_lock
>>> as it is already protecting find_smmu_master.
>>>
>>> ipmmu-smmu and smmuv3 are not impacted by this
>>> issue as there is no access or modification of
>>> a global resource during add_device.
>>>
>>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
>>> ---
>>> This patch aims for 4.16 release.
>>> Benefits:
>>> Remove a bug that could lead to a corruption of the
>>> smmu master list, which would be very hard to debug.
>>
>>  From my understanding, this corruption would only happen with CONFIG_HAS_PCI. At the moment, this is a experimental feature as it is not fully complete.
> 
> Actually, digging through the code, I noticed that iommu_add_device() assume that it can only be called with platform/DT. Thankfully, AFAICT, the function would return -ENXIO because the fwspec would not be allocated for PCI device.
> 
> So was this patch tested with additional patch on top?
> 
The purpose of this patch is to fix the issue that is present and which you thankfully noticed.
There is still a lot of patches to be added that aim to support PCI passthrough.
The complete PCI series is tested with SMMU and it works.
But there is no chance to test this patch standalone as iommu_add_device is not in the correct form for PCI as of now.

>>
>>> Risks:
>>> Overall the risk is low as we are touching init code
>>> rather than a runtime one. In case of any issue, the
>>> problem would be catched during system boot or guest
>>> start.
>>
>> With the PCI feature enabled, this can be called at runtime as this plumbed through a PHYSDEVOP. That said, it doesn't matter here as for supported code (platform/DT device), this will only happen during boot.
>>
>> The patch looks straighforward, so I would not mind to have it in Xen 4.16. Ian, what do you think?
>>
>>> ---
>>>   xen/drivers/passthrough/arm/smmu.c | 25 +++++++++++++++++++------
>>>   1 file changed, 19 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
>>> index c9dfc4caa0..be62a66a28 100644
>>> --- a/xen/drivers/passthrough/arm/smmu.c
>>> +++ b/xen/drivers/passthrough/arm/smmu.c
>>> @@ -820,21 +820,25 @@ static int arm_smmu_dt_add_device_legacy(struct arm_smmu_device *smmu,
>>>                        struct device *dev,
>>>                        struct iommu_fwspec *fwspec)
>>>   {
>>> -    int i;
>>> +    int i, ret;
>>>       struct arm_smmu_master *master;
>>>       struct device_node *dev_node = dev_get_dev_node(dev);
>>> +    spin_lock(&arm_smmu_devices_lock);
>>>       master = find_smmu_master(smmu, dev_node);
>>>       if (master) {
>>>           dev_err(dev,
>>>               "rejecting multiple registrations for master device %s\n",
>>>               dev_node->name);
>>> -        return -EBUSY;
>>> +        ret = -EBUSY;
>>> +        goto out_unlock;
>>>       }
>>>       master = devm_kzalloc(dev, sizeof(*master), GFP_KERNEL);
>>> -    if (!master)
>>> -        return -ENOMEM;
>>> +    if (!master) {
>>> +        ret = -ENOMEM;
>>> +        goto out_unlock;
>>> +    }
>>>       master->of_node = dev_node;
>>>       /* Xen: Let Xen know that the device is protected by an SMMU */
>>> @@ -846,11 +850,17 @@ static int arm_smmu_dt_add_device_legacy(struct arm_smmu_device *smmu,
>>>               dev_err(dev,
>>>                   "stream ID for master device %s greater than maximum allowed (%d)\n",
>>>                   dev_node->name, smmu->num_mapping_groups);
>>> -            return -ERANGE;
>>> +            ret = -ERANGE;
>>> +            goto out_unlock;
>>>           }
>>>           master->cfg.smendx[i] = INVALID_SMENDX;
>>>       }
>>> -    return insert_smmu_master(smmu, master);
>>> +
>>> +    ret = insert_smmu_master(smmu, master);
>>> +
>>> +out_unlock:
>>> +    spin_unlock(&arm_smmu_devices_lock);
>>
>> Please add a newline here.
>>
Ok.

>>> +    return ret;
>>>   }
>>>   static int register_smmu_master(struct arm_smmu_device *smmu,
>>> @@ -2056,7 +2066,10 @@ static int arm_smmu_add_device(struct device *dev)
>>>       } else {
>>>           struct arm_smmu_master *master;
>>> +        spin_lock(&arm_smmu_devices_lock);
>>>           master = find_smmu_master(smmu, dev->of_node);
>>> +        spin_unlock(&arm_smmu_devices_lock);
>>
>> At the moment, unlocking here is fine because we don't remove the device. However, there are a series to supporting removing a device (see [1]). So I think it would be preferable to unlock after the last use of 'cfg'.
>>
Ok. I will move unlocking to the end of this else {} block. I was not aware of the patch you are referring to.

>> Looking at the code, I also noticed that the error path is not correct for at least the PCI device and we would leak memory. We also assume that Stream ID == Requester ID. Are both of them in your radar for PCI passthrough?
>>
I agree with you. I also noticed it. However this is going to be fixed with the next patch series when Rahul gets back.

>> Cheers,
>>
>> [1] https://lore.kernel.org/xen-devel/1630562763-390068-9-git-send-email-fnu.vikram@xilinx.com/
>>
> 
> Cheers,
>
Cheers,
Michal

