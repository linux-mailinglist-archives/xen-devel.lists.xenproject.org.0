Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB9342B111
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 02:44:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207785.363703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maSMA-0005iO-US; Wed, 13 Oct 2021 00:42:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207785.363703; Wed, 13 Oct 2021 00:42:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maSMA-0005gb-RB; Wed, 13 Oct 2021 00:42:54 +0000
Received: by outflank-mailman (input) for mailman id 207785;
 Wed, 13 Oct 2021 00:42:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XJnr=PB=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1maSM8-0005gV-Sl
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 00:42:52 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7eb28fc6-2bbe-11ec-815a-12813bfff9fa;
 Wed, 13 Oct 2021 00:42:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4CAE860EB4;
 Wed, 13 Oct 2021 00:42:50 +0000 (UTC)
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
X-Inumbo-ID: 7eb28fc6-2bbe-11ec-815a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634085770;
	bh=SRqyP5abr+ZRlPkyAgc4gyKINlzuiYnhlPALhAa8tpU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rVISt6iYBGfsIKDaWk7uYeZH0wvRkv3QK7lSUue2STE37LKG4hO4g4Szt9vRyYlra
	 U7HDz4kaq/S5YunEbZ15dtguuIugKnbudk0xrew4EteHzc8/Ronq3AFFPYyLyPi54X
	 DSQhP3lICgHqHDoy231GNejMpyuz3kqaQJwt97rus3nOALjxBsoIf0GKidxwVQ903x
	 6ypFY6NKkhuteNeuU64cKw6MatwCvkFCcebXTOurjhAK26dM24XRMRPtVZZc1uNU/Y
	 rpQFmncUOwkhh7CSdbqMh3pklf+rVMSOdCsRQKPiEDF38U5jbEkHBE2jlI9W5BBmt7
	 iQK1/VISu2maA==
Date: Tue, 12 Oct 2021 17:42:48 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Hongda Deng <Hongda.Deng@arm.com>, xen-devel@lists.xenproject.org, 
    sstabellini@kernel.org, Bertrand.Marquis@arm.com, Wei.Chen@arm.com
Subject: Re: [PATCH v2] xen/arm: vgic to ignore GICD ICPENRn registers
 access
In-Reply-To: <2006f09d-25c3-af7a-cbea-dbc811fc8748@xen.org>
Message-ID: <alpine.DEB.2.21.2110121548060.9408@sstabellini-ThinkPad-T480s>
References: <20211012062449.30966-1-Hongda.Deng@arm.com> <2006f09d-25c3-af7a-cbea-dbc811fc8748@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 12 Oct 2021, Julien Grall wrote:
> On 12/10/2021 07:24, Hongda Deng wrote:
> > Currently, Xen will return IO unhandled when guests access GICD ICPENRn
> > registers. This will raise a data abort inside guest. For Linux Guest,
> > these virtual registers will not be accessed. But for Zephyr, in its
> > GIC initialization code, these virtual registers will be accessed. And
> > zephyr guest will get an IO data abort in initilization stage and enter
> > fatal error. Emulating ICPENDR is not easy with the existing vGIC, so
> > we currently ignore these virtual registers access and print a message
> > about whether they are already pending instead of returning unhandled.
> > More details can be found at [1].
> 
> The link you provide only states that I am happy with the warning. This
> doesn't seem relevant for a future reader. Did you intend to point to
> something different?
> 
> > 
> > [1] https://lists.xenproject.org/archives/html/xen-devel/2021-09/
> > msg00744.html
> > 
> > Signed-off-by: Hongda Deng <hongda.deng@arm.com>
> > ---
> >   xen/arch/arm/vgic-v2.c | 26 +++++++++++++++++++++++++-
> >   xen/arch/arm/vgic-v3.c | 40 +++++++++++++++++++++++++++++++---------
> >   2 files changed, 56 insertions(+), 10 deletions(-)
> > 
> > diff --git a/xen/arch/arm/vgic-v2.c b/xen/arch/arm/vgic-v2.c
> > index b2da886adc..d7ffaeeb65 100644
> > --- a/xen/arch/arm/vgic-v2.c
> > +++ b/xen/arch/arm/vgic-v2.c
> > @@ -480,11 +480,35 @@ static int vgic_v2_distr_mmio_write(struct vcpu *v,
> > mmio_info_t *info,
> >           return 1;
> >         case VRANGE32(GICD_ICPENDR, GICD_ICPENDRN):
> > +    {
> > +        struct pending_irq *iter;
> > +        unsigned int irq_start;
> > +        unsigned int irq_end;
> > +        uint32_t irq_pending = 0;
> > +
> >           if ( dabt.size != DABT_WORD ) goto bad_width;
> >           printk(XENLOG_G_ERR
> >                  "%pv: vGICD: unhandled word write %#"PRIregister" to
> > ICPENDR%d\n",
> >                  v, r, gicd_reg - GICD_ICPENDR);
> 
> As I wrote in v1, we should avoid to print a message when we know there is no
> pending interrupts.
> 
> > -        return 0;
> > +
> > +        irq_start = (gicd_reg - GICD_ICPENDR) * 32;
> > +        irq_end = irq_start + 31;
> > +        /* go through inflight_irqs and print specified pending irqs */
> > +        list_for_each_entry(iter, &v->arch.vgic.inflight_irqs, inflight)
> You need to hold v->arch.vgic.lock (with interrupt disabled) to go through the
> list of inflight irqs. Otherwise, the list may be modified while you are
> walking it.
> 
> However, I am a little bit concerned with this approached (I noticed Stefano
> suggested). The list may in theory contains a few hundreds interrupts (a
> malicious OS May decide to never read IAR). So we are potentially doing more
> work than necessary (we need to think about the worse case scenario).
> 
> Instead, I think it would be better to go through the 32 interrupts and for
> each of them:
>   1) find the pending_irq() using irq_to_pending()
>   2) check if the IRQ in the inflight list with list_empty(&p->inflight)
> 
> In addition to that, you want to check that the rank exists so we don't do any
> extra work if the guest is trying to clear an interrupts above the number of
> interrupts we support.

This is a good approach and it should be fast.

In the normal case, iterating over inflight_irqs should be fine because
there are typically no more than 2-3 inflight interrupts. So in the
normal case iterating over inflight_irqs will be typically faster but in
the worst case it could be bad because the theoretical max is high: it
is only bounded by the total amount of interrupts assigned to the domU
and by the vgic IRQ limit. So theoretically it is possible that we could
have to walk a list with a hundred elements or more.

Your suggestion has the advantage that the compute time becomes
deterministic. Alternatively, we could #ifdef DEBUG the walk over the
inflight_irqs list. I am fine either way but I prefer your suggestion.

