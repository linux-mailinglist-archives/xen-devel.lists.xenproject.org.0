Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D50207DA9
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2020 22:47:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joCIt-0006nE-BD; Wed, 24 Jun 2020 20:47:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JaeF=AF=redhat.com=mst@srs-us1.protection.inumbo.net>)
 id 1joCIs-0006n9-43
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 20:47:30 +0000
X-Inumbo-ID: ea736728-b65b-11ea-8496-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id ea736728-b65b-11ea-8496-bc764e2007e4;
 Wed, 24 Jun 2020 20:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593031647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O1reBoQYH57HQ1CEDrheXYLt8D4SLeQ87NHH75QUkc8=;
 b=NF2dsNPSLYo7W0d3DNoeyIVdLTNNbaMA60M8XYx9HQ+l98H+WW5j1NEUuXmPPwVryAFma9
 dm4dNs7ngtCk+zwxM4GDgSyjQsyqEED1UWYl564Lch1lZ7Ua6sEgexuTCYciYjqWPPlCm6
 ivgeAbpDdfyneMU3i0RbZJc31rRxL1g=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-PBdWqiTNO2W9O7miJpL7hg-1; Wed, 24 Jun 2020 16:47:25 -0400
X-MC-Unique: PBdWqiTNO2W9O7miJpL7hg-1
Received: by mail-wm1-f72.google.com with SMTP id a21so3877285wmd.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2020 13:47:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=O1reBoQYH57HQ1CEDrheXYLt8D4SLeQ87NHH75QUkc8=;
 b=WZ7z9RehiMnRcNWXNGkZd7saunRaT4tn5huvb1mW8c/0D+jLSWdPuIJu+kXQWgGas2
 giNSngzEyG8JWH4tdoYP8dz+7PRYO0cDuM9OA5AswVOBUthzDFrakEl+5fGHeIfnOhbX
 k4gyJcN7slSMRpJTE4rINIPcXrCsG5h6J4Lbjmc0vLvzPYE4q9w1uXYUgnKzHKkVJv2f
 X/hXSK7g9psVVnWJSX0muoDPRCsxfJhTQ025KkmbDX/uOcPe80khMK/11MESSztBFnIb
 qiAMovFZQkcTZi3vVZbU534I3rTA2qSNdEXOaKws6XDDfLK4onHIkEuPnz6UqoSHxEZX
 GOVQ==
X-Gm-Message-State: AOAM532HTtI4+bcPobx6wo4cAoJLn5EBddo6nN6lULUGhAv23i4n3uAo
 ifB1GoNCSrncNYMbW72Q+Ii7N+2oskRPGEAbj8mAMbK8y9bKmq68k2TAgc7v4zVyanR2Ld/oFvQ
 YgIvZM2Is12M6uj8UxBHHqyHozg4=
X-Received: by 2002:adf:ed47:: with SMTP id u7mr30096011wro.201.1593031644702; 
 Wed, 24 Jun 2020 13:47:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPnaDNUPfot+ph5kW9eA3bmRXVnTYtGfhIgsVyoq9C+ZHJySjaF/DLGkUFrdWo8f0RjJM2sQ==
X-Received: by 2002:adf:ed47:: with SMTP id u7mr30096000wro.201.1593031644489; 
 Wed, 24 Jun 2020 13:47:24 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 v7sm28870842wrp.45.2020.06.24.13.47.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 13:47:23 -0700 (PDT)
Date: Wed, 24 Jun 2020 16:47:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen: introduce xen_vring_use_dma
Message-ID: <20200624163940-mutt-send-email-mst@kernel.org>
References: <20200624091732.23944-1-peng.fan@nxp.com>
 <20200624050355-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006241047010.8121@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2006241047010.8121@sstabellini-ThinkPad-T480s>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: jgross@suse.com, Peng Fan <peng.fan@nxp.com>, konrad.wilk@oracle.com,
 jasowang@redhat.com, x86@kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 linux-imx@nxp.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jun 24, 2020 at 10:59:47AM -0700, Stefano Stabellini wrote:
> On Wed, 24 Jun 2020, Michael S. Tsirkin wrote:
> > On Wed, Jun 24, 2020 at 05:17:32PM +0800, Peng Fan wrote:
> > > Export xen_swiotlb for all platforms using xen swiotlb
> > > 
> > > Use xen_swiotlb to determine when vring should use dma APIs to map the
> > > ring: when xen_swiotlb is enabled the dma API is required. When it is
> > > disabled, it is not required.
> > > 
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > 
> > Isn't there some way to use VIRTIO_F_IOMMU_PLATFORM for this?
> > Xen was there first, but everyone else is using that now.
> 
> Unfortunately it is complicated and it is not related to
> VIRTIO_F_IOMMU_PLATFORM :-(
> 
> 
> The Xen subsystem in Linux uses dma_ops via swiotlb_xen to translate
> foreign mappings (memory coming from other VMs) to physical addresses.
> On x86, it also uses dma_ops to translate Linux's idea of a physical
> address into a real physical address (this is unneeded on ARM.)
> 
> 
> So regardless of VIRTIO_F_IOMMU_PLATFORM, dma_ops should be used on Xen/x86
> always and on Xen/ARM if Linux is Dom0 (because it has foreign
> mappings.) That is why we have the if (xen_domain) return true; in
> vring_use_dma_api.

VIRTIO_F_IOMMU_PLATFORM makes guest always use DMA ops.

Xen hack predates VIRTIO_F_IOMMU_PLATFORM so it *also*
forces DMA ops even if VIRTIO_F_IOMMU_PLATFORM is clear.

Unfortunately as a result Xen never got around to
properly setting VIRTIO_F_IOMMU_PLATFORM.

I would like to make Xen do what everyone else is doing
which is just set VIRTIO_F_IOMMU_PLATFORM and then put
platform specific hacks inside DMA API.
Then we can think about deprecating the Xen hack in a
distance future, or hiding it behind a static branch, or something
like this.


> You might have noticed that I missed one possible case above: Xen/ARM
> DomU :-)
> 
> Xen/ARM domUs don't need swiotlb_xen, it is not even initialized. So if
> (xen_domain) return true; would give the wrong answer in that case.
> Linux would end up calling the "normal" dma_ops, not swiotlb-xen, and
> the "normal" dma_ops fail.
> 
> 
> The solution I suggested was to make the check in vring_use_dma_api more
> flexible by returning true if the swiotlb_xen is supposed to be used,
> not in general for all Xen domains, because that is what the check was
> really meant to do.

Why not fix DMA ops so they DTRT (nop) on Xen/ARM DomU? What is wrong with that?


> 
> In this regards I have two more comments:
> 
> - the comment on top of the check in vring_use_dma_api is still valid
> - the patch looks broken on x86: it should always return true, but it
>   returns false instead
> 
>  
> > > diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> > > index a2de775801af..768afd79f67a 100644
> > > --- a/drivers/virtio/virtio_ring.c
> > > +++ b/drivers/virtio/virtio_ring.c
> > > @@ -252,7 +252,7 @@ static bool vring_use_dma_api(struct virtio_device *vdev)
> > >  	 * the DMA API if we're a Xen guest, which at least allows
> > >  	 * all of the sensible Xen configurations to work correctly.
> > >  	 */
> > > -	if (xen_domain())
> > > +	if (xen_vring_use_dma())
> > >  		return true;
> > >  
> > >  	return false;
> > 
> > 
> > The comment above this should probably be fixed.
> 
> > 


