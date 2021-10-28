Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3B843D80D
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 02:21:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217566.377671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mft9v-0007DZ-PE; Thu, 28 Oct 2021 00:20:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217566.377671; Thu, 28 Oct 2021 00:20:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mft9v-0007Au-M0; Thu, 28 Oct 2021 00:20:43 +0000
Received: by outflank-mailman (input) for mailman id 217566;
 Thu, 28 Oct 2021 00:20:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TkaK=PQ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mft9u-0007Am-0i
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 00:20:42 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e1d82062-3784-11ec-848d-12813bfff9fa;
 Thu, 28 Oct 2021 00:20:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0F9EF610C7;
 Thu, 28 Oct 2021 00:20:40 +0000 (UTC)
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
X-Inumbo-ID: e1d82062-3784-11ec-848d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635380440;
	bh=HoAuIDTuAGBplcEGnWmXrI1OHfBOdkx/zacsX2UldhU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HvSIKd1uzNYiJ1BzFYwvCrYmvte38aMEdBW+2hoH78aZiZsqVNiulZEJzapVTakTs
	 lDdQVO69CMAlHB+RL+Lt5I1EmSbG3J1SQ9kwIyexJr5yZybj1DpSmTOJkUzYdABr+9
	 Ck0BFaolUhyAB1ZPhyGBgYub/8t6OpXy6zYTulhK0Ev//g4JoOmtsX7OqRIJVDplL/
	 1nNEjNa1tY2XJhWpXsBRk8Ys5s8FUDNczFFzBOYifMGMuc+tULUBtZ3DWbQTdfxuq1
	 hMhJENH7pqODEQwieFJOrViSL8pHB1W+0MgokZUZI4WdgZLD496LauMm0pHBMhNLAV
	 svqD8wi4IuFjA==
Date: Wed, 27 Oct 2021 17:20:39 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall.oss@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@arm.com>, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Ian Jackson <iwj@xenproject.org>
Subject: Re: [patch-4.16] arm/smmuv1,v2: Protect smmu master list with a
 lock
In-Reply-To: <CAJ=z9a2SSgG7a87_xTGT5LeNLgubOLQf1+dbnrsTsP8_p5ErJg@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2110271658330.20134@sstabellini-ThinkPad-T480s>
References: <20211026122903.15042-1-michal.orzel@arm.com> <e5632a4e-db98-41b4-1045-2b3532c098fa@xen.org> <70c30a6c-b779-805e-079a-41bb484894b9@xen.org> <cb452c0c-ccde-7798-c403-f972b48a2c46@arm.com> <01545115-e82e-2a9d-a8e4-da9676080c0f@xen.org>
 <alpine.DEB.2.21.2110271557570.20134@sstabellini-ThinkPad-T480s> <CAJ=z9a2SSgG7a87_xTGT5LeNLgubOLQf1+dbnrsTsP8_p5ErJg@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1722989215-1635379202=:20134"
Content-ID: <alpine.DEB.2.21.2110271700150.20134@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1722989215-1635379202=:20134
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2110271700151.20134@sstabellini-ThinkPad-T480s>

On Thu, 28 Oct 2021, Julien Grall wrote:
> On Thu, 28 Oct 2021, 00:14 Stefano Stabellini, <sstabellini@kernel.org> wrote:
>       On Wed, 27 Oct 2021, Julien Grall wrote:
>       > > > > > +    return ret;
>       > > > > >    }
>       > > > > >    static int register_smmu_master(struct arm_smmu_device *smmu,
>       > > > > > @@ -2056,7 +2066,10 @@ static int arm_smmu_add_device(struct device
>       > > > > > *dev)
>       > > > > >        } else {
>       > > > > >            struct arm_smmu_master *master;
>       > > > > > +        spin_lock(&arm_smmu_devices_lock);
>       > > > > >            master = find_smmu_master(smmu, dev->of_node);
>       > > > > > +        spin_unlock(&arm_smmu_devices_lock);
>       > > > >
>       > > > > At the moment, unlocking here is fine because we don't remove the
>       > > > > device. However, there are a series to supporting removing a device (see
>       > > > > [1]). So I think it would be preferable to unlock after the last use of
>       > > > > 'cfg'.
>       > > > >
>       > > Ok. I will move unlocking to the end of this else {} block. I was not aware
>       > > of the patch you are referring to.
>       >
>       > I think the end of the else is still too early. This needs to at least be past
>       > iommu_group_set_iommudata() because we store cfg.
>       >
>       > Potentially, the lock wants to also englobe arm_smmu_master_alloc_smes(). So I
>       > am wondering whether it would be simpler to hold the lock for the whole
>       > duration of arm_smmu_add_device() (I can see value when we will want to
>       > interlock with the remove code).
> 
>       The patch was to protect the smmu master list. From that point of view
>       the unlock right after find_smmu_master would be sufficient, right?
> 
> 
> Yes. However this is not fixing all the problems (see below).
> 
> 
>       We only need to protect cfg if we are worried that the same device is
>       added in two different ways at the same time. Did I get it right? If so,
>       I would say that that case should not be possible? Am I missing another
>       potential conflict?
> 
> 
> It should not be possible to add the same device twice. The problem is more when we are going to remove the device. In this case, "master"
> may disappear at any point.
> 
> The support for removing device is not yet implemented in the tree. But there is already a patch on the ML. So I think it would be
> shortsighted to only move the lock to just solve concurrent access to the list.
 
That makes sense now: the other source of conflict is concurrent add and
remove of the same device. Sorry it wasn't clear to me before.
 
 
>       I am pointing this out for two reasons:
> 
>       Protecting the list is different from protecting each element from
>       concurrent modification of the element itself. If the latter is a
>       potential problem, I wonder if arm_smmu_add_device is the only function
>       affected?
> 
> 
> I had a brief looked at the code and couldn't find any other places where this may be an issue.
> 
> 
>       The second reason is that extending the lock past
>       arm_smmu_master_alloc_smes is a bit worrying because it causes
>       &arm_smmu_devices_lock and smmu->stream_map_lock to nest, which wasn't
>       the case before.
> 
> 
> Nested locks are common. I don't believe there would be a problem here with this one.
> 
> 
>       I am not saying that it is a bad idea to extend the lock past
>       arm_smmu_master_alloc_smes -- it might be the right thing to do.
> 
> 
> I don't usually suggest locking changes blindly ;).
> 
>       But I
> 
>       am merely saying that it might be best to think twice about it.
> 
>       and/or do
>       that after 4.16.
> 
> 
> To be honest, this patch is not useful the callback to register a
> device in the IOMMU subsystem. The sentence makes no sense sorry. I
> meant the add callback doesn't support PCI devices. So the locking is
> a latent issue at the moment.
>
> So if you are concerned with the my suggested locking then, I am
> afraid the current patch is a no-go on my side for 4.16.

I was totally fine with it aside from the last suggestion of extending
the spin_unlock until the end of the function because until then the
changes were obviously correct to me.

I didn't understand the reason why we needed extending spin_unlock, now
I understand it. Also lock nesting is one of those thing that it is
relatively common but I think should always take a second check to make
sure it is correct.  Specifically we need to check that no fuctions with
smmu->stream_map_lock taken call a function that take
&arm_smmu_devices_lock. It is not very difficult but I haven't done
this check myself.

The other thing that is not clear to me is whether we would need also to
protect places where we use (not allocate) masters and/or cfg, e.g.
arm_smmu_attach_dev, arm_smmu_domain_add_master.


> That said we can work towards a new locking approach for 4.17.
> However, I would want to have a proposal from your side or at least
> some details on why the suggested locking is not suitable.
 
The suggested locking approach up until the last suggestion looks
totally fine to me. The last suggestion is a bit harder to tell because
the PCI removal hook is not there yet, so I am having troubles seeing
exactly what needs to be protected.
--8323329-1722989215-1635379202=:20134--

