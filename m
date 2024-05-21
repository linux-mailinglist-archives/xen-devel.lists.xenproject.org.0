Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F298CA628
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2024 04:30:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726449.1130721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9FFh-00051K-LD; Tue, 21 May 2024 02:29:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726449.1130721; Tue, 21 May 2024 02:29:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9FFh-0004zr-Hw; Tue, 21 May 2024 02:29:21 +0000
Received: by outflank-mailman (input) for mailman id 726449;
 Tue, 21 May 2024 02:29:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wS2T=MY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s9FFf-0004zk-N6
 for xen-devel@lists.xenproject.org; Tue, 21 May 2024 02:29:19 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea34d8f4-1719-11ef-b4bb-af5377834399;
 Tue, 21 May 2024 04:29:16 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 990C5CE0D88;
 Tue, 21 May 2024 02:29:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 437B5C32786;
 Tue, 21 May 2024 02:29:09 +0000 (UTC)
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
X-Inumbo-ID: ea34d8f4-1719-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716258550;
	bh=P67AskWNTrdJ4dOXuRas5XfbseatRzLMeypvoV7gxow=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rf9VJ7CZtIZPF5kIdSo8B5lQe58RG2jITrphNs4frhsSaalr0MNaMSWL8/v2R7YBl
	 AHct3lU5JBtCfNq+ziiC7udR8+hV1k9hd2lkA49emiH0vAwVlbfrzMwt3pY1jzJcLf
	 ycFddWlUaCcZMB2LKMsy5UpegF1LQO/6u9we/2J/MEHMyhYwa5hGZmWABzwPhlTD9z
	 OLSwu/2XqGIY91EXHttDLBJuhBOMfn1VIIkJsdKxhtu8B1HGpcWDf/jHMdx7tFmBah
	 EeRbuGNuQTexH8hF7JguLWI8opKhLcRWTyDLj/VRAhYSgb216KmninsNsY3qcv3XBt
	 zspw9sBpCK04Q==
Date: Mon, 20 May 2024 19:29:07 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Henry Wang <xin.wang2@amd.com>, xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 5/8] xen/arm/gic: Allow routing/removing interrupt to
 running VMs
In-Reply-To: <30c42949-bf67-416d-9f6f-e476fb1da436@xen.org>
Message-ID: <alpine.DEB.2.22.394.2405201927050.1052252@ubuntu-linux-20-04-desktop>
References: <20240516100330.1433265-1-xin.wang2@amd.com> <20240516100330.1433265-6-xin.wang2@amd.com> <59e72623-00a7-4b19-9240-fb8c4982a381@amd.com> <9f086470-a17f-482a-ad98-814424da0ee5@xen.org> <c475fc50-3d30-49d4-b12d-31535cfe1306@amd.com>
 <30c42949-bf67-416d-9f6f-e476fb1da436@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1368579412-1716258550=:1052252"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1368579412-1716258550=:1052252
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 20 May 2024, Julien Grall wrote:
> Hi Henry,
> 
> On 20/05/2024 02:01, Henry Wang wrote:
> > Hi Julien,
> > 
> > On 5/19/2024 7:08 PM, Julien Grall wrote:
> > > Hi,
> > > 
> > > On 17/05/2024 07:03, Henry Wang wrote:
> > > > > @@ -444,14 +444,18 @@ int vgic_connect_hw_irq(struct domain *d, struct
> > > > > vcpu *v, unsigned int virq,
> > > > >       {
> > > > >           /* The VIRQ should not be already enabled by the guest */
> > > 
> > > This comment needs to be updated.
> > 
> > Yes, sorry. I will update this and the one in the new vGIC in v3.
> > 
> > > > >           if ( !p->desc &&
> > > > > -             !test_bit(GIC_IRQ_GUEST_ENABLED, &p->status) )
> > > > > +             !test_bit(GIC_IRQ_GUEST_ENABLED, &p->status) &&
> > > > > +             !test_bit(GIC_IRQ_GUEST_VISIBLE, &p->status) &&
> > > > > +             !test_bit(GIC_IRQ_GUEST_ACTIVE, &p->status) )
> > > > >               p->desc = desc;
> > > > >           else
> > > > >               ret = -EBUSY;
> > > > >       }
> > > > >       else
> > > > >       {
> > > > > -        if ( desc && p->desc != desc )
> > > > > +        if ( desc && p->desc != desc &&
> > > > > +             (test_bit(GIC_IRQ_GUEST_VISIBLE, &p->status) ||
> > > > > +              test_bit(GIC_IRQ_GUEST_ACTIVE, &p->status)) )
> > > > 
> > > > This should be
> > > > 
> > > > +        if ( (desc && p->desc != desc) ||
> > > > +             test_bit(GIC_IRQ_GUEST_VISIBLE, &p->status) ||
> > > > +             test_bit(GIC_IRQ_GUEST_ACTIVE, &p->status) )
> > > Looking at gic_set_lr(), we first check p->desc, before setting
> > > IRQ_GUEST_VISIBLE.
> > > 
> > > I can't find a common lock, so what would guarantee that p->desc is not
> > > going to be used or IRQ_GUEST_VISIBLE set afterwards?
> > 
> > I think the gic_set_lr() is supposed to be called with v->arch.vgic.lock
> > taken, at least the current two callers (gic_raise_guest_irq() and
> > gic_restore_pending_irqs()) are doing it this way. Would this address your
> > concern? Thanks.
> 
> I don't think it would address my concern. AFAICT, the lock is not taken by
> vgic_connect_hw_irq().
> 
> I also haven't touched the vGIC for quite a while and didn't have much time to
> dig into the code. Hence why I didn't propose a fix.
> 
> The vGIC code was mainly written by Stefano, so maybe he will have an idea how
> this could be fixed.

I think we need to take the v->arch.vgic.lock just after the rank lock
in vgic_connect_hw_irq():

  vgic_lock_rank(v_target, rank, flags);
  spin_lock(&v_target->arch.vgic.lock);
--8323329-1368579412-1716258550=:1052252--

