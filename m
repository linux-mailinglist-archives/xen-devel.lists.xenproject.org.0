Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3CC3DF8BD
	for <lists+xen-devel@lfdr.de>; Wed,  4 Aug 2021 02:09:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163643.299727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mB4Sm-0001yk-B9; Wed, 04 Aug 2021 00:08:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163643.299727; Wed, 04 Aug 2021 00:08:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mB4Sm-0001ww-7k; Wed, 04 Aug 2021 00:08:48 +0000
Received: by outflank-mailman (input) for mailman id 163643;
 Wed, 04 Aug 2021 00:08:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K6bJ=M3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mB4Sk-0001wq-Ge
 for xen-devel@lists.xenproject.org; Wed, 04 Aug 2021 00:08:46 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 889c08a3-d62a-458b-92de-2254937a79a6;
 Wed, 04 Aug 2021 00:08:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 74AB460FA0;
 Wed,  4 Aug 2021 00:08:44 +0000 (UTC)
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
X-Inumbo-ID: 889c08a3-d62a-458b-92de-2254937a79a6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628035724;
	bh=NJs61trkaEXtOTggwWHuLnV9q8az4L+YnLUozq0ygMw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XXvAkv5TbqrE57H2qU7L147wVsbw7gy/ZUSrSK+CEIAdksCiIhQEc2JOJgzF3hxY9
	 ibUmCYnETdF1MBUCu2pahtloGohuQOUJ2LW+Q8CNTaVl4s+8R4O9eAj1DbzBMAJiTm
	 NfDnwIM311zFrH8+08z8ByLtEe7wiZRyXarJfi00EJ+CfCHqtpMhorrxjSdhFyMS6H
	 SCN1+uRVu08IWEgKzXbvpzglKwQmBcYfoVKr84TUXPxTMfBoXnLlyj6RzqhcUwGU5Q
	 /yqC3PQ8xEAJwwKXpAC+9xmKTzeuwibeF5Sm2EXVWJikesCB/ubPAeA8bONenatiu8
	 yyR/nBL7AY9gA==
Date: Tue, 3 Aug 2021 17:08:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Volodymyr_Babchuk@epam.com, 
    Bertrand.Marquis@arm.com
Subject: Re: [PATCH] do not p2m_invalidate_root when iommu_use_hap_pt
In-Reply-To: <ff5e9e5a-287d-127c-1d39-57c31564e9b3@xen.org>
Message-ID: <alpine.DEB.2.21.2108031702430.19737@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2108031419500.19737@sstabellini-ThinkPad-T480s> <ff5e9e5a-287d-127c-1d39-57c31564e9b3@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 3 Aug 2021, Julien Grall wrote:
> Hi,
> 
> Title: How about:
> 
> "xen/arm: Do not invalidate the P2M when the PT is shared with the IOMMU"

OK


> On 03/08/2021 22:37, Stefano Stabellini wrote:
> > Set/Way flushes never work correctly in a virtualized environment.
> > 
> > Our current implementation is based on clearing the valid bit in the p2m
> > pagetable to track guest memory accesses. This technique doesn't work
> > when the IOMMU is enabled for the domain and the pagetable is shared
> > between IOMMU and MMU because it triggers IOMMU faults.
> > 
> > Specifically, p2m_invalidate_root causes IOMMU faults if
> > iommu_use_hap_pt returns true for the domain.
> > 
> > Add a check in vsysreg.c and vcpreg.c: if a set/way instruction is used
> > and iommu_use_hap_pt returns true, rather than failing with obscure
> > IOMMU faults, inject an undef exception straight away into the guest,
> > and print a verbose error message to explain the problem.
> > 
> > Also add an ASSERT in p2m_invalidate_root to make sure we don't
> > inadvertently stumble across this problem again in the future.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > ---
> > 
> > This patch is an improvement over the IOMMU faults. I don't know if we
> > want to give users an option to get past these errors for development
> > and debugging.
> > 
> > We could add a Xen command line option to make Xen ignore Set/Way
> > instructions (do nothing on trap). Or we could add an option to avoid
> > trapping Set/Way instructions altogether (remove HCR_TSW).
> > 
> > Both workarounds are obviously not correct and could lead to memory
> > corruptions (the former) or bad interference between guests (the latter).
> 
> My answer is similar to when you suggested to not trap the SMCs for all the
> domains. Yes, it may allow a domain to boot but such option will not do a
> favor to anyone because more weird behavior may happen.
> 
> If there is a will to handle set/way when device is assigned, then we need to
> add support for unsharing the page-tables or figure out a different way to
> emulate set/way.
>
> > Either way, we can start with this patch.
> > 
> > diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
> > index caf17174b8..125a9281fc 100644
> > --- a/xen/arch/arm/arm64/vsysreg.c
> > +++ b/xen/arch/arm/arm64/vsysreg.c
> > @@ -105,6 +105,13 @@ void do_sysreg(struct cpu_user_regs *regs,
> >       case HSR_SYSREG_DCISW:
> >       case HSR_SYSREG_DCCSW:
> >       case HSR_SYSREG_DCCISW:
> > +        if ( iommu_use_hap_pt(current->domain) )
> > +        {
> > +            gdprintk(XENLOG_ERR,
> > +                     "d%u uses set/way cache flushes with the IOMMU on. It
> > cannot work. Replace set/way instructions with dc [ci]vac and retry.
> > Injecting exception into the guest now.\n",
> 
> This line would be far too long to print on the serial. I think you want to
> add a few newline here.

Fair enough but I'll try to keep most info on the same line because
otherwise with a dom0less boot it can get confusing. I suggest:

gprintk(XENLOG_ERR,
        "uses set/way cache flushes with the IOMMU on. It cannot work. Replace them with dc [ci]vac and retry.\n"
        "Injecting exception into the guest now.\n");


> > +                     current->domain->domain_id);
> 
> Please use %pd.

I realized I should use gprintk and not gdprintk, and also that either
way the domain id gets printed automatically, so there is no need to add
d%u.


> > +            return inject_undef_exception(regs, hsr);
> > +        }
> 
> I would prefer if the undef is added in p2m_set_way_flush(). This will avoid
> the duplication between the cpreg and sysreg code.

Yes, I can do that


> >           if ( !hsr.sysreg.read )
> >               p2m_set_way_flush(current);
> >           break;
> > diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
> > index d414c4feb9..240913d5ac 100644
> > --- a/xen/arch/arm/p2m.c
> > +++ b/xen/arch/arm/p2m.c
> > @@ -1171,6 +1171,9 @@ void p2m_invalidate_root(struct p2m_domain *p2m)
> >   {
> >       unsigned int i;
> >   +    /* Clearing the valid bit causes IOMMU faults. */
> 
> How about moving this comment on top of the function and writing:
> 
> "p2m_invalid_root() should not be called when the P2M is shared with the IOMMU
> because it will cause IOMMU fault."
> 
> So one doesn't  need to read the invalidation to understand that the function
> should not be called when the P2M is shared with the IOMMU.

Sure


> > +    ASSERT(!iommu_use_hap_pt(p2m->domain)); > +
> >       p2m_write_lock(p2m);
> >         for ( i = 0; i < P2M_ROOT_LEVEL; i++ )
> > diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
> > index e3ce56d875..04b68f6901 100644
> > --- a/xen/arch/arm/vcpreg.c
> > +++ b/xen/arch/arm/vcpreg.c
> > @@ -231,6 +231,13 @@ void do_cp15_32(struct cpu_user_regs *regs, const union
> > hsr hsr)
> >       case HSR_CPREG32(DCISW):
> >       case HSR_CPREG32(DCCSW):
> >       case HSR_CPREG32(DCCISW):
> > +        if ( iommu_use_hap_pt(current->domain) )
> > +        {
> > +            gdprintk(XENLOG_ERR,
> > +                     "d%u uses set/way cache flushes with the IOMMU on. It
> > cannot work. Replace set/way instructions with dc [ci]vac and retry.
> > Injecting exception into the guest now.\n",
> > +                     current->domain->domain_id);
> > +            return inject_undef_exception(regs, hsr);
> > +        }
> >           if ( !cp32.read )
> >               p2m_set_way_flush(current);
> >           break;
> > 
> 
> Cheers,
> 
> -- 
> Julien Grall
> 

