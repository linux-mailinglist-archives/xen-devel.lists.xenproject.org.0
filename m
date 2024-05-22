Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EB58CB7D3
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 03:16:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727148.1131554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9aat-000253-5m; Wed, 22 May 2024 01:16:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727148.1131554; Wed, 22 May 2024 01:16:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9aat-00022l-31; Wed, 22 May 2024 01:16:39 +0000
Received: by outflank-mailman (input) for mailman id 727148;
 Wed, 22 May 2024 01:16:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ujjH=MZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s9aar-00022c-Ct
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 01:16:37 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec3c6965-17d8-11ef-909f-e314d9c70b13;
 Wed, 22 May 2024 03:16:34 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D596ECE127D;
 Wed, 22 May 2024 01:16:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBE02C32786;
 Wed, 22 May 2024 01:16:26 +0000 (UTC)
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
X-Inumbo-ID: ec3c6965-17d8-11ef-909f-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716340588;
	bh=kUn+DDiRT0c0kx5drYEsDBfZBZ6NJAIQieGv72PxdXU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=eh0LMNl3kq1JzzRuqHAZ10CuUbwb4wN+6p3XuD8bsV7JDyOmZOIg1UEd5TzZs+YpD
	 wKJeeB5k2fNKxL2TGlypf4Af4jGAyNFwhZvK1yAL7eoDcB9ocS+Om2EUWLszLNCS2S
	 JBkudZcLw1AVFDpoe4Jp1Kmrfh+ie2efWriHgutUX95BonVohRFSEELGKLqVqzIZjH
	 Y8rokZjYZqrEXDQska9YpPvZMcEFXZkPitUNlzakE4uOQdxyVnqiaq1r4rA8hlDhL0
	 b1GkgKcK+rLdssirdW8XTZt8NBg4B6omCxnp4u1tiFr1gbu3ljt2tFjMu40NGkRHQn
	 PBuFJwmK2SeYA==
Date: Tue, 21 May 2024 18:16:25 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Henry Wang <xin.wang2@amd.com>
cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 5/8] xen/arm/gic: Allow routing/removing interrupt to
 running VMs
In-Reply-To: <4f6a24b5-5e7b-41e0-9314-496bbcaa8888@amd.com>
Message-ID: <alpine.DEB.2.22.394.2405211815040.1052252@ubuntu-linux-20-04-desktop>
References: <20240521043557.1580753-1-xin.wang2@amd.com> <20240521043557.1580753-6-xin.wang2@amd.com> <3f6fa7e7-c02c-4fa5-b4aa-5e4c2efed65f@xen.org> <4f6a24b5-5e7b-41e0-9314-496bbcaa8888@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1156148855-1716340587=:1052252"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1156148855-1716340587=:1052252
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 22 May 2024, Henry Wang wrote:
> Hi Julien,
> 
> On 5/21/2024 8:30 PM, Julien Grall wrote:
> > Hi,
> > 
> > On 21/05/2024 05:35, Henry Wang wrote:
> > > diff --git a/xen/arch/arm/gic-vgic.c b/xen/arch/arm/gic-vgic.c
> > > index 56490dbc43..956c11ba13 100644
> > > --- a/xen/arch/arm/gic-vgic.c
> > > +++ b/xen/arch/arm/gic-vgic.c
> > > @@ -439,24 +439,33 @@ int vgic_connect_hw_irq(struct domain *d, struct
> > > vcpu *v, unsigned int virq,
> > >         /* We are taking to rank lock to prevent parallel connections. */
> > >       vgic_lock_rank(v_target, rank, flags);
> > > +    spin_lock(&v_target->arch.vgic.lock);
> > 
> > I know this is what Stefano suggested, but v_target would point to the
> > current affinity whereas the interrupt may be pending/active on the
> > "previous" vCPU. So it is a little unclear whether v_target is the correct
> > lock. Do you have more pointer to show this is correct?
> 
> No I think you are correct, we have discussed this in the initial version of
> this patch. Sorry.
> 
> I followed the way from that discussion to note down the vcpu ID and retrieve
> here, below is the diff, would this make sense to you?
> 
> diff --git a/xen/arch/arm/gic-vgic.c b/xen/arch/arm/gic-vgic.c
> index 956c11ba13..134ed4e107 100644
> --- a/xen/arch/arm/gic-vgic.c
> +++ b/xen/arch/arm/gic-vgic.c
> @@ -439,7 +439,7 @@ int vgic_connect_hw_irq(struct domain *d, struct vcpu *v,
> unsigned int virq,
> 
>      /* We are taking to rank lock to prevent parallel connections. */
>      vgic_lock_rank(v_target, rank, flags);
> -    spin_lock(&v_target->arch.vgic.lock);
> + spin_lock(&d->vcpu[p->spi_vcpu_id]->arch.vgic.lock);
> 
>      if ( connect )
>      {
> @@ -465,7 +465,7 @@ int vgic_connect_hw_irq(struct domain *d, struct vcpu *v,
> unsigned int virq,
>              p->desc = NULL;
>      }
> 
> -    spin_unlock(&v_target->arch.vgic.lock);
> + spin_unlock(&d->vcpu[p->spi_vcpu_id]->arch.vgic.lock);
>      vgic_unlock_rank(v_target, rank, flags);
> 
>      return ret;
> diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgic.h
> index 79b73a0dbb..f4075d3e75 100644
> --- a/xen/arch/arm/include/asm/vgic.h
> +++ b/xen/arch/arm/include/asm/vgic.h
> @@ -85,6 +85,7 @@ struct pending_irq
>      uint8_t priority;
>      uint8_t lpi_priority;       /* Caches the priority if this is an LPI. */
>      uint8_t lpi_vcpu_id;        /* The VCPU for an LPI. */
> +    uint8_t spi_vcpu_id;        /* The VCPU for an SPI. */
>      /* inflight is used to append instances of pending_irq to
>       * vgic.inflight_irqs */
>      struct list_head inflight;
> diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
> index c04fc4f83f..e852479f13 100644
> --- a/xen/arch/arm/vgic.c
> +++ b/xen/arch/arm/vgic.c
> @@ -632,6 +632,7 @@ void vgic_inject_irq(struct domain *d, struct vcpu *v,
> unsigned int virq,
>      }
>      list_add_tail(&n->inflight, &v->arch.vgic.inflight_irqs);
>  out:
> +    n->spi_vcpu_id = v->vcpu_id;
>      spin_unlock_irqrestore(&v->arch.vgic.lock, flags);
> 
>      /* we have a new higher priority irq, inject it into the guest */
>      vcpu_kick(v);
> 
> 
> > Also, while looking at the locking, I noticed that we are not doing anything
> > with GIC_IRQ_GUEST_MIGRATING. In gic_update_one_lr(), we seem to assume that
> > if the flag is set, then p->desc cannot be NULL.
> > 
> > Can we reach vgic_connect_hw_irq() with the flag set?
> 
> I think even from the perspective of making the code extra safe, we should
> also check GIC_IRQ_GUEST_MIGRATING as the LR is allocated for this case. I
> will also add the check of GIC_IRQ_GUEST_MIGRATING here.

Yes. I think it might be easier to check for GIC_IRQ_GUEST_MIGRATING
early and return error immediately in that case. Otherwise, we can
continue and take spin_lock(&v_target->arch.vgic.lock) because no
migration is in progress




> > What about the other flags? Is this going to be a concern if we don't reset
> > them?
> 
> I don't think so, if I am not mistaken, no LR will be allocated with other
> flags set.
> 
> Kind regards,
> Henry

--8323329-1156148855-1716340587=:1052252--

