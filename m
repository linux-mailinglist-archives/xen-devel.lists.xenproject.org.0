Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8C71CBB8C
	for <lists+xen-devel@lfdr.de>; Sat,  9 May 2020 02:07:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jXD1D-0005BN-FF; Sat, 09 May 2020 00:07:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7o+2=6X=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jXD1C-0005BI-IF
 for xen-devel@lists.xenproject.org; Sat, 09 May 2020 00:07:02 +0000
X-Inumbo-ID: 01cca92c-9189-11ea-a08a-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 01cca92c-9189-11ea-a08a-12813bfff9fa;
 Sat, 09 May 2020 00:07:01 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E6B47217BA;
 Sat,  9 May 2020 00:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588982821;
 bh=SrxvNwD47o7Ig+7SER7oobjUeKIf3mAVkEkZ01FPrrA=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=hirxPktpfP3uPIPH1mPW9XSzXkH+0kx8m88lgYhTf8R4IsEMVBHrYQxV+z+bLE18C
 U4BSKj+FQXPj+cGtH8LaN10TGoZ28etY3NyMxGOOs0J4busH3aPLi+OM4KvjoKVkeb
 jcILSe7TerHOgSu8F6MJVAoXCGYDm/83SFLxxGmI=
Date: Fri, 8 May 2020 17:06:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 08/12] xen/arm: if is_domain_direct_mapped use native
 addresses for GICv2
In-Reply-To: <4384aed5-97cd-ef93-5512-b41c0124b072@xen.org>
Message-ID: <alpine.DEB.2.21.2005081525270.26167@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
 <20200415010255.10081-8-sstabellini@kernel.org>
 <05375484-43f2-9d4b-205a-b9dcf4ee5d8e@xen.org>
 <alpine.DEB.2.21.2004301412460.28941@sstabellini-ThinkPad-T480s>
 <4384aed5-97cd-ef93-5512-b41c0124b072@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr_Babchuk@epam.com, Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, 1 May 2020, Julien Grall wrote:
> On 01/05/2020 02:26, Stefano Stabellini wrote:
> > On Wed, 15 Apr 2020, Julien Grall wrote:
> > > On 15/04/2020 02:02, Stefano Stabellini wrote:
> > > > Today we use native addresses to map the GICv2 for Dom0 and fixed
> > > > addresses for DomUs.
> > > > 
> > > > This patch changes the behavior so that native addresses are used for
> > > > any domain that is_domain_direct_mapped.
> > > > 
> > > > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > > > ---
> > > >    xen/arch/arm/domain_build.c | 10 +++++++---
> > > >    xen/arch/arm/vgic-v2.c      | 12 ++++++------
> > > >    xen/arch/arm/vgic/vgic-v2.c |  2 +-
> > > >    xen/include/asm-arm/vgic.h  |  1 +
> > > >    4 files changed, 15 insertions(+), 10 deletions(-)
> > > > 
> > > > diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > > > index 627e0c5e8e..303bee60f6 100644
> > > > --- a/xen/arch/arm/domain_build.c
> > > > +++ b/xen/arch/arm/domain_build.c
> > > > @@ -1643,8 +1643,12 @@ static int __init make_gicv2_domU_node(struct
> > > > kernel_info *kinfo)
> > > >        int res = 0;
> > > >        __be32 reg[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) *
> > > > 2];
> > > >        __be32 *cells;
> > > > +    struct domain *d = kinfo->d;
> > > > +    char buf[38];
> > > >    -    res = fdt_begin_node(fdt,
> > > > "interrupt-controller@"__stringify(GUEST_GICD_BASE));
> > > > +    snprintf(buf, sizeof(buf), "interrupt-controller@%"PRIx64,
> > > > +             d->arch.vgic.dbase);
> > > > +    res = fdt_begin_node(fdt, buf);
> > > >        if ( res )
> > > >            return res;
> > > >    @@ -1666,9 +1670,9 @@ static int __init make_gicv2_domU_node(struct
> > > > kernel_info *kinfo)
> > > >          cells = &reg[0];
> > > >        dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS,
> > > > GUEST_ROOT_SIZE_CELLS,
> > > > -                       GUEST_GICD_BASE, GUEST_GICD_SIZE);
> > > > +                       d->arch.vgic.dbase, GUEST_GICD_SIZE);
> > > >        dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS,
> > > > GUEST_ROOT_SIZE_CELLS,
> > > > -                       GUEST_GICC_BASE, GUEST_GICC_SIZE);
> > > > +                       d->arch.vgic.cbase, GUEST_GICC_SIZE);
> > > 
> > > You can't use the native base address and not the native size.
> > > Particularly,
> > > this is going to screw any GIC using 8KB alias.
> > 
> > I don't follow why it could cause problems with a GIC using the 8KB
> > alias. Maybe an example (even a fake example) would help.
> 
> The GICC interface is composed of the two 4KB pages. In some of the
> implementation, each pages starts at a 64KB aligned address. Each page are
> also aliased every 4KB in the 64KB region.
> 
> For guest, we don't expose the full 128KB region but only part of it (8KB). So
> the guest interface is the same regardless the underlying implementation of
> the GIC.
> 
> vgic.cbase points to the beginning of the first region. So what you are
> mapping is the first 8KB of the first region. The second region is not mapped
> at all.
> 
> As the pages are aliased, the trick we use is to map from vgic.cbase + 60KB
> (vgic_v2.hw.aliased_offset). This means the 2 pages will now be contiguous in
> the guest physical memory.

I understood the issue and I fixed it by applying
vgic_v2.hw.aliased_offset to vbase and cbase. (Although only vbase is
actually necessary as far as I can tell.)

