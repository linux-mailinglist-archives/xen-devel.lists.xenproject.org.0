Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 694293E06E1
	for <lists+xen-devel@lfdr.de>; Wed,  4 Aug 2021 19:42:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163803.299935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBKtZ-0006Je-Fy; Wed, 04 Aug 2021 17:41:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163803.299935; Wed, 04 Aug 2021 17:41:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBKtZ-0006Gq-CG; Wed, 04 Aug 2021 17:41:33 +0000
Received: by outflank-mailman (input) for mailman id 163803;
 Wed, 04 Aug 2021 17:41:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K6bJ=M3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mBKtY-0006Gk-7N
 for xen-devel@lists.xenproject.org; Wed, 04 Aug 2021 17:41:32 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7ffa6008-09e3-40a2-af97-e4720000eaf8;
 Wed, 04 Aug 2021 17:41:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 77818610FB;
 Wed,  4 Aug 2021 17:41:30 +0000 (UTC)
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
X-Inumbo-ID: 7ffa6008-09e3-40a2-af97-e4720000eaf8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628098890;
	bh=NVcHF8WsbOFKzj1IgIzKmZGdeCZ4QKiXBMUldkdBX5s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=M4mbTgZfxwVDWNobNwL/wGtcKMGxB3UAjF3PRsaK9OMS/QHxvteD/BfPYh1vM27/x
	 NAreErQsbHZZbbIRIqCit+aGE6YYQYND+PXKcxc8ksJ+4zPq48a/XKUoCAY0WQPNK1
	 bmfO2c5MwY3bHLvQSqybdamaD3/WHomazW+hDqZk+UxVQ31PpdVfj5bS1n4OWv5FWP
	 hTI+kh3vdaY4T/66X2WTsnRFefyW+v6vPByA+hkle8Qj+sqqSNdhcXDp7N7Z9JYbnU
	 XhmOUHuUZtG5hpsI1LVxnqXLXWOMaKs2plG4aI7c1Xf0qL5Ep/YymCAcM69p/QCqMq
	 aDNtrDRMw4USA==
Date: Wed, 4 Aug 2021 10:41:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Volodymyr_Babchuk@epam.com, 
    Bertrand.Marquis@arm.com
Subject: Re: [PATCH] do not p2m_invalidate_root when iommu_use_hap_pt
In-Reply-To: <a2a99173-c566-c492-310c-003490cdba5f@xen.org>
Message-ID: <alpine.DEB.2.21.2108041032330.9768@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2108031419500.19737@sstabellini-ThinkPad-T480s> <ff5e9e5a-287d-127c-1d39-57c31564e9b3@xen.org> <alpine.DEB.2.21.2108031702430.19737@sstabellini-ThinkPad-T480s> <a2a99173-c566-c492-310c-003490cdba5f@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 4 Aug 2021, Julien Grall wrote:
> Hi Stefano,
> 
> On 04/08/2021 01:08, Stefano Stabellini wrote:
> > > > diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
> > > > index caf17174b8..125a9281fc 100644
> > > > --- a/xen/arch/arm/arm64/vsysreg.c
> > > > +++ b/xen/arch/arm/arm64/vsysreg.c
> > > > @@ -105,6 +105,13 @@ void do_sysreg(struct cpu_user_regs *regs,
> > > >        case HSR_SYSREG_DCISW:
> > > >        case HSR_SYSREG_DCCSW:
> > > >        case HSR_SYSREG_DCCISW:
> > > > +        if ( iommu_use_hap_pt(current->domain) )
> > > > +        {
> > > > +            gdprintk(XENLOG_ERR,
> > > > +                     "d%u uses set/way cache flushes with the IOMMU on.
> > > > It
> > > > cannot work. Replace set/way instructions with dc [ci]vac and retry.
> > > > Injecting exception into the guest now.\n",
> > > 
> > > This line would be far too long to print on the serial. I think you want
> > > to
> > > add a few newline here.
> > 
> > Fair enough but I'll try to keep most info on the same line because
> > otherwise with a dom0less boot it can get confusing. I suggest:
> 
> I am not quite too sure to understand why it would get confusing with
> dom0less. Can you give an example?

I was doing tests with the error messages before implementing the undef
exception injection. This is the output of a regular domU (not
dom0less): https://pastebin.com/Wytg660j

The entire message in this test should be:

(XEN) d1v0 uses set/way cache flushes with the IOMMU on. It cannot work.
(XEN) Replace them with dc [ci]vac and retry.

But actually the first line gets eaten, so we only see:

(XEN) Replace them with dc [ci]vac and retry.

several times at the bottom of the logs.

