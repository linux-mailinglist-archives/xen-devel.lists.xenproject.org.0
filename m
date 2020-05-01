Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B58CC1C0BAB
	for <lists+xen-devel@lfdr.de>; Fri,  1 May 2020 03:26:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUKRY-0000P6-MO; Fri, 01 May 2020 01:26:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J7As=6P=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jUKRX-0000Op-Aw
 for xen-devel@lists.xenproject.org; Fri, 01 May 2020 01:26:19 +0000
X-Inumbo-ID: c1fff28e-8b4a-11ea-b07b-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c1fff28e-8b4a-11ea-b07b-bc764e2007e4;
 Fri, 01 May 2020 01:26:19 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4700320787;
 Fri,  1 May 2020 01:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588296378;
 bh=CgAWZcq0REh8JirC9d7joi6d2dEeb8gkYbFAttQ/cB4=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=gLrKMP26n7kkpaTaGTku9nOaHeGr33mEZSFWe2dgLc6Ep8z9E6Xe7I1GOq8YrCRTB
 wgtc2VfZWg/U5dL+gB4gxZhpnBa8HwW5987LfPdku9BhpZpIaCY8sNODFQ60f4T/1R
 kKV25JrptarrWncjzVmcpGI71WvU4D3isMLcHL9s=
Date: Thu, 30 Apr 2020 18:26:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 08/12] xen/arm: if is_domain_direct_mapped use native
 addresses for GICv2
In-Reply-To: <05375484-43f2-9d4b-205a-b9dcf4ee5d8e@xen.org>
Message-ID: <alpine.DEB.2.21.2004301412460.28941@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
 <20200415010255.10081-8-sstabellini@kernel.org>
 <05375484-43f2-9d4b-205a-b9dcf4ee5d8e@xen.org>
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

On Wed, 15 Apr 2020, Julien Grall wrote:
> On 15/04/2020 02:02, Stefano Stabellini wrote:
> > Today we use native addresses to map the GICv2 for Dom0 and fixed
> > addresses for DomUs.
> > 
> > This patch changes the behavior so that native addresses are used for
> > any domain that is_domain_direct_mapped.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > ---
> >   xen/arch/arm/domain_build.c | 10 +++++++---
> >   xen/arch/arm/vgic-v2.c      | 12 ++++++------
> >   xen/arch/arm/vgic/vgic-v2.c |  2 +-
> >   xen/include/asm-arm/vgic.h  |  1 +
> >   4 files changed, 15 insertions(+), 10 deletions(-)
> > 
> > diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > index 627e0c5e8e..303bee60f6 100644
> > --- a/xen/arch/arm/domain_build.c
> > +++ b/xen/arch/arm/domain_build.c
> > @@ -1643,8 +1643,12 @@ static int __init make_gicv2_domU_node(struct
> > kernel_info *kinfo)
> >       int res = 0;
> >       __be32 reg[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) * 2];
> >       __be32 *cells;
> > +    struct domain *d = kinfo->d;
> > +    char buf[38];
> >   -    res = fdt_begin_node(fdt,
> > "interrupt-controller@"__stringify(GUEST_GICD_BASE));
> > +    snprintf(buf, sizeof(buf), "interrupt-controller@%"PRIx64,
> > +             d->arch.vgic.dbase);
> > +    res = fdt_begin_node(fdt, buf);
> >       if ( res )
> >           return res;
> >   @@ -1666,9 +1670,9 @@ static int __init make_gicv2_domU_node(struct
> > kernel_info *kinfo)
> >         cells = &reg[0];
> >       dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS,
> > GUEST_ROOT_SIZE_CELLS,
> > -                       GUEST_GICD_BASE, GUEST_GICD_SIZE);
> > +                       d->arch.vgic.dbase, GUEST_GICD_SIZE);
> >       dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS,
> > GUEST_ROOT_SIZE_CELLS,
> > -                       GUEST_GICC_BASE, GUEST_GICC_SIZE);
> > +                       d->arch.vgic.cbase, GUEST_GICC_SIZE);
> 
> You can't use the native base address and not the native size. Particularly,
> this is going to screw any GIC using 8KB alias.

I don't follow why it could cause problems with a GIC using the 8KB
alias. Maybe an example (even a fake example) would help.



> It would be preferable if only expose part of the CPU interface as we do for
> the guest. So d->arch.vgic.cbase would be equal to vgic_v2_hw.dbase +
> vgic_v2.hw.aliased_offset.


