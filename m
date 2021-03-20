Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB23342946
	for <lists+xen-devel@lfdr.de>; Sat, 20 Mar 2021 01:02:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.99423.189120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNP3m-0004Ff-PZ; Sat, 20 Mar 2021 00:01:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99423.189120; Sat, 20 Mar 2021 00:01:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNP3m-0004FG-MK; Sat, 20 Mar 2021 00:01:42 +0000
Received: by outflank-mailman (input) for mailman id 99423;
 Sat, 20 Mar 2021 00:01:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hFOe=IS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lNP3k-0004Ev-8l
 for xen-devel@lists.xenproject.org; Sat, 20 Mar 2021 00:01:40 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8328651e-14e6-4a21-aab4-a1991100ec93;
 Sat, 20 Mar 2021 00:01:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5078C6197D;
 Sat, 20 Mar 2021 00:01:37 +0000 (UTC)
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
X-Inumbo-ID: 8328651e-14e6-4a21-aab4-a1991100ec93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1616198497;
	bh=ApYMVxKR/77D/IWKJUkM2y6g8Yf3Vz+ZW156dJIj5QQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rZiYRQsYtykbOkA2a2FEENGLjKgE/U1VHIFjVeFKJx95o2XXcvrJM9UpPDqVhrszq
	 WMOaX3t0WFbAF6KS8q+Vq8qwO+KsVlj5Bu8pPut1jSQp6o95wi2PArPhBdPUOzta7f
	 +vhu3plDxSPV2K3MwyRE8YG2BW9REKTGqqN1DvdNf3/+26RfMs9iz6PEXmM4rPGaAK
	 wWaTLJarGb8eXo05G6f1iboikZGAoEtW+v5UEai0OrzRxf2rf8vmWxaCrKeK2837+f
	 Pj/Uvyem/f4U84utmqKBo3m/s9wztLR21aYaUxLVuG8QMUVaGvCzITGS0FEWru9Kh9
	 Au/BvwFLFj4TQ==
Date: Fri, 19 Mar 2021 17:01:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    ash.j.wilding@gmail.com, Julien Grall <jgrall@amazon.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Dario Faggioli <dfaggioli@suse.com>, 
    George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] xen/arm: Ensure the vCPU context is seen before clearing
 the _VPF_down
In-Reply-To: <ca41bfbb-d942-d8fd-e96e-c464f6b3643f@xen.org>
Message-ID: <alpine.DEB.2.21.2103191652450.439@sstabellini-ThinkPad-T480s>
References: <20210226205158.20991-1-julien@xen.org> <alpine.DEB.2.21.2102261756280.2682@sstabellini-ThinkPad-T480s> <ca41bfbb-d942-d8fd-e96e-c464f6b3643f@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 27 Feb 2021, Julien Grall wrote:
> (+ Dario and George)
> 
> Hi Stefano,
> 
> I have added Dario and George to get some inputs from the scheduling part.
> 
> On 27/02/2021 01:58, Stefano Stabellini wrote:
> > On Fri, 26 Feb 2021, Julien Grall wrote:
> > > From: Julien Grall <jgrall@amazon.com>
> > > 
> > > A vCPU can get scheduled as soon as _VPF_down is cleared. As there is
> > > currently not ordering guarantee in arch_set_info_guest(), it may be
> > > possible that flag can be observed cleared before the new values of vCPU
> > > registers are observed.
> > > 
> > > Add an smp_mb() before the flag is cleared to prevent re-ordering.
> > > 
> > > Signed-off-by: Julien Grall <jgrall@amazon.com>
> > > 
> > > ---
> > > 
> > > Barriers should work in pair. However, I am not entirely sure whether to
> > > put the other half. Maybe at the beginning of context_switch_to()?
> > 
> > It should be right after VGCF_online is set or cleared, right?
> 
> vcpu_guest_context_t is variable allocated on the heap just for the purpose of
> this call. So an ordering with VGFC_online is not going to do anything.
> 
> > So it
> > would be:
> > 
> > xen/arch/arm/domctl.c:arch_get_info_guest
> > xen/arch/arm/vpsci.c:do_common_cpu_on
> > 
> > But I think it is impossible that either of them get called at the same
> > time as arch_set_info_guest, which makes me wonder if we actually need
> > the barrier...
> arch_get_info_guest() is called without the domain lock held and I can't see
> any other lock that could prevent it to be called in // of
> arch_set_info_guest().
> 
> So you could technically get corrupted information from
> XEN_DOMCTL_getvcpucontext. For this case, we would want a smp_wmb() before
> writing to v->is_initialised. The corresponding read barrier would be in
> vcpu_pause() -> vcpu_sleep_sync() -> sync_vcpu_execstate().
> 
> But this is not the issue I was originally trying to solve. Currently,
> do_common_cpu_on() will roughly do:
> 
>  1) domain_lock(d)
> 
>  2) v->arch.sctlr = ...
>     v->arch.ttbr0 = ...
> 
>  3) clear_bit(_VFP_down, &v->pause_flags);
> 
>  4) domain_unlock(d)
> 
>  5) vcpu_wake(v);
> 
> If we had only one pCPU on the system, then we would only wake the vCPU in
> step 5. We would be fine in this situation. But that's not the interesting
> case.
> 
> If you add a second pCPU in the story, it may be possible to have vcpu_wake()
> happening in // (see more below). As there is no memory barrier, step 3 may be
> observed before 2. So, assuming the vcpu is runnable, we could start to
> schedule a vCPU before any update to the registers (step 2) are observed.
> 
> This means that when context_switch_to() is called, we may end up to restore
> some old values.
> 
> Now the question is can vcpu_wake() be called in // from another pCPU? AFAICT,
> it would be only called if a given flag in v->pause_flags is cleared (e.g.
> _VFP_blocked). But can we rely on that?
> 
> Even if we can rely on it, v->pause_flags has other flags in it. I couldn't
> rule out that _VPF_down cannot be set at the same time as the other _VPF_*.
> 
> Therefore, I think a barrier is necessary to ensure the ordering.
> 
> Do you agree with this analysis?
 
Yes, I think this makes sense. The corresponding barrier in the
scheduling code would have to be after reading _VPF_down and before
reading v->arch.sctlr, etc.


> > > The issues described here is also quite theoritical because there are
> > > hundreds of instructions executed between the time a vCPU is seen
> > > runnable and scheduled. But better be safe than sorry :).
> > > ---
> > >   xen/arch/arm/domain.c | 7 +++++++
> > >   1 file changed, 7 insertions(+)
> > > 
> > > diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> > > index bdd3d3e5b5d5..2b705e66be81 100644
> > > --- a/xen/arch/arm/domain.c
> > > +++ b/xen/arch/arm/domain.c
> > > @@ -914,7 +914,14 @@ int arch_set_info_guest(
> > >       v->is_initialised = 1;
> > >         if ( ctxt->flags & VGCF_online )
> > > +    {
> > > +        /*
> > > +         * The vCPU can be scheduled as soon as _VPF_down is cleared.
> > > +         * So clear the bit *after* the context was loaded.
> > > +         */
> > > +        smp_mb();
> 
> From the discussion above, I would move this barrier before v->is_initialised.
> So we also take care of the issue with arch_get_info_guest().
> 
> This barrier also can be reduced to a smp_wmb() as we only expect an ordering
> between writes.
> 
> The barrier would be paired with the barrier in:
>    - sync_vcpu_execstate() in the case of arch_get_vcpu_info_guest().
>    - context_switch_to() in the case of scheduling (The exact barrier is TDB).

OK, this makes sense, but why before:

  v->is_initialised = 1;

instead of right after it? It is just v->pause_flags we care about,
right?



> > >           clear_bit(_VPF_down, &v->pause_flags);
> > > +    }
> > >       else
> > >           set_bit(_VPF_down, &v->pause_flags);
> > >   


