Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D39C1BE90E
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 22:48:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTtc9-0004Gq-VB; Wed, 29 Apr 2020 20:47:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hWzR=6N=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jTtc8-0004Gl-D0
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 20:47:28 +0000
X-Inumbo-ID: a2e1feed-8a5a-11ea-99b9-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a2e1feed-8a5a-11ea-99b9-12813bfff9fa;
 Wed, 29 Apr 2020 20:47:27 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D662220BED;
 Wed, 29 Apr 2020 20:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588193247;
 bh=3R5YYifFP5fZiK4rtqCpLdImbEXA1mR8/vPbWuFFGzY=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=NKBTPyB9z71TIQjkA788m1hA2KjtCBKH/c+2b6Er23nthghLoIDSLNJEv6EaLq5sM
 4jk0fsW309mkRVC5WaIryQdFZm/hzcdMa1cJwBhMmILklm2o7wnfbn3U6COzjMJfV3
 pvtE0hRTSQSbTuifrSduImRyICBj62pFl/mLDZ1c=
Date: Wed, 29 Apr 2020 13:47:25 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 12/12] xen/arm: call iomem_permit_access for passthrough
 devices
In-Reply-To: <521c8e55-73e8-950f-2d94-70b0c664bd3d@xen.org>
Message-ID: <alpine.DEB.2.21.2004291318270.28941@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
 <20200415010255.10081-12-sstabellini@kernel.org>
 <521c8e55-73e8-950f-2d94-70b0c664bd3d@xen.org>
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
> > iomem_permit_access should be called for MMIO regions of devices
> > assigned to a domain. Currently it is not called for MMIO regions of
> > passthrough devices of Dom0less guests. This patch fixes it.
> 
> You can already have cases today where the MMIO regions are mapped to the
> guest but the guest doesn't have permission on them.
> 
> Can you explain why this is a problem here?

I don't remember the original problem that prompted me into doing this
investigation. It came up while I was developing and testing this
series: I noticed the discrepancy compared to the regular (not dom0less)
device assignment code path
(tools/libxl/libxl_create.c:domcreate_launch_dm).

Now I removed this patch from the series, went back to test it, and it
still works fine. Oops, it is not needed after all :-)


I think it makes sense to remove this patch from this series, I'll do
that.

But doesn't it make sense to give domU permission if it is going to get
the memory mapped? But admittedly I can't think of something that would
break because of the lack of the iomem_permit_access call in this code
path.


> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > ---
> >   xen/arch/arm/domain_build.c | 11 +++++++++++
> >   1 file changed, 11 insertions(+)
> > 
> > diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > index d0fc497d07..d3d42eef5d 100644
> > --- a/xen/arch/arm/domain_build.c
> > +++ b/xen/arch/arm/domain_build.c
> > @@ -1846,6 +1846,17 @@ static int __init handle_passthrough_prop(struct
> > kernel_info *kinfo,
> >               return -EINVAL;
> >           }
> >   +        res = iomem_permit_access(kinfo->d, paddr_to_pfn(mstart),
> > +                                  paddr_to_pfn(PAGE_ALIGN(mstart + size -
> > 1)));
> > +        if ( res )
> > +        {
> > +            printk(XENLOG_ERR "Unable to permit to dom%d access to"
> > +                   " 0x%"PRIx64" - 0x%"PRIx64"\n",
> > +                   kinfo->d->domain_id,
> > +                   mstart & PAGE_MASK, PAGE_ALIGN(mstart + size) - 1);
> > +            return res;
> > +        }
> > +
> >           res = map_regions_p2mt(kinfo->d,
> >                                  gaddr_to_gfn(gstart),
> >                                  PFN_DOWN(size),
> > 
> 
> -- 
> Julien Grall
> 

