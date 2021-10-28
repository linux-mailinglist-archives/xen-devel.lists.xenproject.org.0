Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA5D43DE67
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 12:05:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217794.377974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg2Hk-0003K4-O7; Thu, 28 Oct 2021 10:05:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217794.377974; Thu, 28 Oct 2021 10:05:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg2Hk-0003HT-Km; Thu, 28 Oct 2021 10:05:24 +0000
Received: by outflank-mailman (input) for mailman id 217794;
 Thu, 28 Oct 2021 10:05:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mg2Hk-0003HL-17
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 10:05:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mg2Hi-0004gq-OO; Thu, 28 Oct 2021 10:05:22 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225] helo=[10.7.236.13])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mg2Hi-00059E-GT; Thu, 28 Oct 2021 10:05:22 +0000
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
	bh=MZ0gQCL7RG80aB7yqtqCAkOV78hJhMJsG3xFRq+YgWs=; b=gI6K4GXZ4wqKIQSTECaZ4wUjDt
	Psubp5pztQgQgHb1uEGKerfykjEv3FOgJhkpDis1pTZAcW502I3z2Qf+oMlrb8VUSfK7BSLaJC/6g
	BiaLGF79zlDWx2/7j9Q3U9PsN5ldUx9XKXeNdnvWskrqlpbmwlanA/YN0wCm2fDpUxes=;
Message-ID: <4554621d-63da-ea3e-e56a-4e01d0cef347@xen.org>
Date: Thu, 28 Oct 2021 11:05:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [patch-4.16] arm/smmuv1,v2: Protect smmu master list with a lock
To: Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall.oss@gmail.com>
Cc: Michal Orzel <michal.orzel@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
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
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.21.2110271658330.20134@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Stefano,

First apologies for sending the previous e-mails in HTML (thanks for 
pointing that out!).

On 28/10/2021 01:20, Stefano Stabellini wrote:
> On Thu, 28 Oct 2021, Julien Grall wrote:
>> On Thu, 28 Oct 2021, 00:14 Stefano Stabellini, <sstabellini@kernel.org> wrote:
>>        On Wed, 27 Oct 2021, Julien Grall wrote:
>>        > > > > > +    return ret;
>>        > > > > >    }
>>        > > > > >    static int register_smmu_master(struct arm_smmu_device *smmu,
>>        > > > > > @@ -2056,7 +2066,10 @@ static int arm_smmu_add_device(struct device
>>        > > > > > *dev)
>>        > > > > >        } else {
>>        > > > > >            struct arm_smmu_master *master;
>>        > > > > > +        spin_lock(&arm_smmu_devices_lock);
>>        > > > > >            master = find_smmu_master(smmu, dev->of_node);
>>        > > > > > +        spin_unlock(&arm_smmu_devices_lock);
>>        > > > >
>>        > > > > At the moment, unlocking here is fine because we don't remove the
>>        > > > > device. However, there are a series to supporting removing a device (see
>>        > > > > [1]). So I think it would be preferable to unlock after the last use of
>>        > > > > 'cfg'.
>>        > > > >
>>        > > Ok. I will move unlocking to the end of this else {} block. I was not aware
>>        > > of the patch you are referring to.
>>        >
>>        > I think the end of the else is still too early. This needs to at least be past
>>        > iommu_group_set_iommudata() because we store cfg.
>>        >
>>        > Potentially, the lock wants to also englobe arm_smmu_master_alloc_smes(). So I
>>        > am wondering whether it would be simpler to hold the lock for the whole
>>        > duration of arm_smmu_add_device() (I can see value when we will want to
>>        > interlock with the remove code).
>>
>>        The patch was to protect the smmu master list. From that point of view
>>        the unlock right after find_smmu_master would be sufficient, right?
>>
>>
>> Yes. However this is not fixing all the problems (see below).
>>
>>
>>        We only need to protect cfg if we are worried that the same device is
>>        added in two different ways at the same time. Did I get it right? If so,
>>        I would say that that case should not be possible? Am I missing another
>>        potential conflict?
>>
>>
>> It should not be possible to add the same device twice. The problem is more when we are going to remove the device. In this case, "master"
>> may disappear at any point.
>>
>> The support for removing device is not yet implemented in the tree. But there is already a patch on the ML. So I think it would be
>> shortsighted to only move the lock to just solve concurrent access to the list.
>   
> That makes sense now: the other source of conflict is concurrent add and
> remove of the same device. Sorry it wasn't clear to me before.
At the moment, we are relying on the upper layer (e.g. PCI or DT 
subsystem) to prevent concurrent add/remove/assignment. The trouble is 
we don't have a common lock between PCI and DT.

One possibility would be to add a common in the uper layer, but it feels 
to me this is a bit fragile and may also require longer locking section 
than necessary.

That said, add/remove/assignment operations are meant to be rare. So 
this is could be an option. This would also have the advantage to cover 
all the IOMMUs.

>   
>   
>>        I am pointing this out for two reasons:
>>
>>        Protecting the list is different from protecting each element from
>>        concurrent modification of the element itself. If the latter is a
>>        potential problem, I wonder if arm_smmu_add_device is the only function
>>        affected?
>>
>>
>> I had a brief looked at the code and couldn't find any other places where this may be an issue.
>>
>>
>>        The second reason is that extending the lock past
>>        arm_smmu_master_alloc_smes is a bit worrying because it causes
>>        &arm_smmu_devices_lock and smmu->stream_map_lock to nest, which wasn't
>>        the case before.
>>
>>
>> Nested locks are common. I don't believe there would be a problem here with this one.
>>
>>
>>        I am not saying that it is a bad idea to extend the lock past
>>        arm_smmu_master_alloc_smes -- it might be the right thing to do.
>>
>>
>> I don't usually suggest locking changes blindly ;).
>>
>>        But I
>>
>>        am merely saying that it might be best to think twice about it.
>>
>>        and/or do
>>        that after 4.16.
>>
>>

[...]

> The other thing that is not clear to me is whether we would need also to
> protect places where we use (not allocate) masters and/or cfg, e.g.
> arm_smmu_attach_dev, arm_smmu_domain_add_master.

I think both should be with the lock. Now the question is will other 
IOMMUs driver requires the same locking?

If yes, then maybe that locking should be in the common code.

>> That said we can work towards a new locking approach for 4.17.
>> However, I would want to have a proposal from your side or at least
>> some details on why the suggested locking is not suitable.
>   
> The suggested locking approach up until the last suggestion looks
> totally fine to me. The last suggestion is a bit harder to tell because
> the PCI removal hook is not there yet, so I am having troubles seeing
> exactly what needs to be protected.

The PCI removal hook is the same as the platform device one. There are 
already a patch on the ML (see [1]) for that.

We have two interlocking problem to resolve:
   1) Concurrent request between PCI and platform/DT subsystem
   2) Removal vs add vs (re)assign

The two approaches I can think of are:

Approach A:
   - The driver is responsible to protect against 1)
   - Each subsystem (DT and PCI) are responsible for 2)

Approach B:
   The driver is responsible to protect for 1) 2).

 From my understanding, the proposed patch for Michal is following 
approach A whilst my proposal is going towards approach B.

I am open to use approach A, however I think this needs to be documented 
as the lock to use will depend on whether the device is a PCI device or not.

Cheers,

[1] <1630562763-390068-9-git-send-email-fnu.vikram@xilinx.com>

-- 
Julien Grall

