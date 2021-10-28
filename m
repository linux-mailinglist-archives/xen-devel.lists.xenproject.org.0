Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D74843E0AD
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 14:16:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217986.378251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg4K9-0005Go-71; Thu, 28 Oct 2021 12:16:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217986.378251; Thu, 28 Oct 2021 12:16:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg4K9-0005F1-3N; Thu, 28 Oct 2021 12:16:01 +0000
Received: by outflank-mailman (input) for mailman id 217986;
 Thu, 28 Oct 2021 12:15:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oo2o=PQ=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1mg4K7-0005Ei-RE
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 12:15:59 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id cd8e71a4-d6b5-48b6-8293-1be42eaab109;
 Thu, 28 Oct 2021 12:15:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C7D981063;
 Thu, 28 Oct 2021 05:15:57 -0700 (PDT)
Received: from [10.57.24.217] (unknown [10.57.24.217])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D0363F5A1;
 Thu, 28 Oct 2021 05:15:56 -0700 (PDT)
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
X-Inumbo-ID: cd8e71a4-d6b5-48b6-8293-1be42eaab109
Subject: Re: [patch-4.16] arm/smmuv1,v2: Protect smmu master list with a lock
To: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien.grall.oss@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Ian Jackson <iwj@xenproject.org>
References: <20211026122903.15042-1-michal.orzel@arm.com>
 <e5632a4e-db98-41b4-1045-2b3532c098fa@xen.org>
 <70c30a6c-b779-805e-079a-41bb484894b9@xen.org>
 <cb452c0c-ccde-7798-c403-f972b48a2c46@arm.com>
 <01545115-e82e-2a9d-a8e4-da9676080c0f@xen.org>
 <alpine.DEB.2.21.2110271557570.20134@sstabellini-ThinkPad-T480s>
 <CAJ=z9a2SSgG7a87_xTGT5LeNLgubOLQf1+dbnrsTsP8_p5ErJg@mail.gmail.com>
 <alpine.DEB.2.21.2110271658330.20134@sstabellini-ThinkPad-T480s>
 <4554621d-63da-ea3e-e56a-4e01d0cef347@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <560e75eb-fa0d-a13a-219c-3c1db0b28fa1@arm.com>
Date: Thu, 28 Oct 2021 14:15:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4554621d-63da-ea3e-e56a-4e01d0cef347@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Julien,

On 28.10.2021 12:05, Julien Grall wrote:
> Hi Stefano,
> 
> First apologies for sending the previous e-mails in HTML (thanks for pointing that out!).
> 
> On 28/10/2021 01:20, Stefano Stabellini wrote:
>> On Thu, 28 Oct 2021, Julien Grall wrote:
>>> On Thu, 28 Oct 2021, 00:14 Stefano Stabellini, <sstabellini@kernel.org> wrote:
>>>        On Wed, 27 Oct 2021, Julien Grall wrote:
>>>        > > > > > +    return ret;
>>>        > > > > >    }
>>>        > > > > >    static int register_smmu_master(struct arm_smmu_device *smmu,
>>>        > > > > > @@ -2056,7 +2066,10 @@ static int arm_smmu_add_device(struct device
>>>        > > > > > *dev)
>>>        > > > > >        } else {
>>>        > > > > >            struct arm_smmu_master *master;
>>>        > > > > > +        spin_lock(&arm_smmu_devices_lock);
>>>        > > > > >            master = find_smmu_master(smmu, dev->of_node);
>>>        > > > > > +        spin_unlock(&arm_smmu_devices_lock);
>>>        > > > >
>>>        > > > > At the moment, unlocking here is fine because we don't remove the
>>>        > > > > device. However, there are a series to supporting removing a device (see
>>>        > > > > [1]). So I think it would be preferable to unlock after the last use of
>>>        > > > > 'cfg'.
>>>        > > > >
>>>        > > Ok. I will move unlocking to the end of this else {} block. I was not aware
>>>        > > of the patch you are referring to.
>>>        >
>>>        > I think the end of the else is still too early. This needs to at least be past
>>>        > iommu_group_set_iommudata() because we store cfg.
>>>        >
>>>        > Potentially, the lock wants to also englobe arm_smmu_master_alloc_smes(). So I
>>>        > am wondering whether it would be simpler to hold the lock for the whole
>>>        > duration of arm_smmu_add_device() (I can see value when we will want to
>>>        > interlock with the remove code).
>>>
>>>        The patch was to protect the smmu master list. From that point of view
>>>        the unlock right after find_smmu_master would be sufficient, right?
>>>
>>>
>>> Yes. However this is not fixing all the problems (see below).
>>>
>>>
>>>        We only need to protect cfg if we are worried that the same device is
>>>        added in two different ways at the same time. Did I get it right? If so,
>>>        I would say that that case should not be possible? Am I missing another
>>>        potential conflict?
>>>
>>>
>>> It should not be possible to add the same device twice. The problem is more when we are going to remove the device. In this case, "master"
>>> may disappear at any point.
>>>
>>> The support for removing device is not yet implemented in the tree. But there is already a patch on the ML. So I think it would be
>>> shortsighted to only move the lock to just solve concurrent access to the list.
>>   That makes sense now: the other source of conflict is concurrent add and
>> remove of the same device. Sorry it wasn't clear to me before.
> At the moment, we are relying on the upper layer (e.g. PCI or DT subsystem) to prevent concurrent add/remove/assignment. The trouble is we don't have a common lock between PCI and DT.
> 
> One possibility would be to add a common in the uper layer, but it feels to me this is a bit fragile and may also require longer locking section than necessary.
> 
> That said, add/remove/assignment operations are meant to be rare. So this is could be an option. This would also have the advantage to cover all the IOMMUs.
> 
>>    
>>>        I am pointing this out for two reasons:
>>>
>>>        Protecting the list is different from protecting each element from
>>>        concurrent modification of the element itself. If the latter is a
>>>        potential problem, I wonder if arm_smmu_add_device is the only function
>>>        affected?
>>>
>>>
>>> I had a brief looked at the code and couldn't find any other places where this may be an issue.
>>>
>>>
>>>        The second reason is that extending the lock past
>>>        arm_smmu_master_alloc_smes is a bit worrying because it causes
>>>        &arm_smmu_devices_lock and smmu->stream_map_lock to nest, which wasn't
>>>        the case before.
>>>
>>>
>>> Nested locks are common. I don't believe there would be a problem here with this one.
>>>
>>>
>>>        I am not saying that it is a bad idea to extend the lock past
>>>        arm_smmu_master_alloc_smes -- it might be the right thing to do.
>>>
>>>
>>> I don't usually suggest locking changes blindly ;).
>>>
>>>        But I
>>>
>>>        am merely saying that it might be best to think twice about it.
>>>
>>>        and/or do
>>>        that after 4.16.
>>>
>>>
> 
> [...]
> 
>> The other thing that is not clear to me is whether we would need also to
>> protect places where we use (not allocate) masters and/or cfg, e.g.
>> arm_smmu_attach_dev, arm_smmu_domain_add_master.
> 
> I think both should be with the lock. Now the question is will other IOMMUs driver requires the same locking?
> 
> If yes, then maybe that locking should be in the common code.
> 
>>> That said we can work towards a new locking approach for 4.17.
>>> However, I would want to have a proposal from your side or at least
>>> some details on why the suggested locking is not suitable.
>>   The suggested locking approach up until the last suggestion looks
>> totally fine to me. The last suggestion is a bit harder to tell because
>> the PCI removal hook is not there yet, so I am having troubles seeing
>> exactly what needs to be protected.
> 
> The PCI removal hook is the same as the platform device one. There are already a patch on the ML (see [1]) for that.
> 
> We have two interlocking problem to resolve:
>   1) Concurrent request between PCI and platform/DT subsystem
>   2) Removal vs add vs (re)assign
> 
> The two approaches I can think of are:
> 
> Approach A:
>   - The driver is responsible to protect against 1)
>   - Each subsystem (DT and PCI) are responsible for 2)
> 
> Approach B:
>   The driver is responsible to protect for 1) 2).
> 
> From my understanding, the proposed patch for Michal is following approach A whilst my proposal is going towards approach B.
> 
> I am open to use approach A, however I think this needs to be documented as the lock to use will depend on whether the device is a PCI device or not.
> 

The purpose of this patch is to fix the issue that is present in 4.16.
The patch adding support for removal you are reffering to:
-is in RFC state
-is not meant for 4.16
-will need to be modified anyway because of the future PCI passthrough patches that are going to modify lots of stuff

That being said, the bug we want to fix touches only point 1). And in fact my patch is solving this issue.
So I think we should focus on 4.16 and fixing bugs for it without thinking of future patches/modifications.
I agree that the locking behaviour will change as soon as the patch you are reffering to will be merged.
However, the PCI passthrough patches are going to modify this code anyway, so all in all the future modifications will be needed.

> Cheers,
> 
> [1] <1630562763-390068-9-git-send-email-fnu.vikram@xilinx.com>
> 

Cheers,
Michal

