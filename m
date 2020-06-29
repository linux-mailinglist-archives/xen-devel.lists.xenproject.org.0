Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A591020CCBD
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2020 08:23:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jpnB4-0001qo-FZ; Mon, 29 Jun 2020 06:22:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YmWB=AK=redhat.com=mst@srs-us1.protection.inumbo.net>)
 id 1jpnB2-0001qj-NE
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2020 06:22:00 +0000
X-Inumbo-ID: d60cb50a-b9d0-11ea-8496-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id d60cb50a-b9d0-11ea-8496-bc764e2007e4;
 Mon, 29 Jun 2020 06:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593411718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CH00j3xLGgY5MCOHoqIWuWnauDKW7cEZeJtWO3pCrfs=;
 b=GoWxgzxC7ls5HNIMuUKoFJIxG4LSomud0qNsflYKfJYFEN/+gAYnZ5nji6GBYy83DAm6A2
 qjymKMEPhmfZ9/hWEVaDLPcVYcqwD8t2NjiBESjlzqqTyLb7TWXOPxQSxulE3RXXpnU80a
 rocYJmHFRHnCnBfV00Hp+w6LuBFCuc0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-wCiyD2LBPAKZSL09-8w2uA-1; Mon, 29 Jun 2020 02:21:55 -0400
X-MC-Unique: wCiyD2LBPAKZSL09-8w2uA-1
Received: by mail-wr1-f72.google.com with SMTP id i10so16078420wrn.21
 for <xen-devel@lists.xenproject.org>; Sun, 28 Jun 2020 23:21:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CH00j3xLGgY5MCOHoqIWuWnauDKW7cEZeJtWO3pCrfs=;
 b=eLFqwwFURRz31blDH0++/KwtZwcGx2QMNZ7KRWEB3x0lKd6reT292+jtw3IYY7a8+u
 kfUIjqqq6x1TjcA7qnikX/B+Ri9dE9fTexoD0GOz1tEhDPzGLuyYlFbvvyiaRPRMLRAC
 2JAvjTpILqLGQmWWStuHfyUQuVzMloquo8MRKDaSH8g0/wvuCm+WzVY9NuK//XRUzSyR
 y2dv/g3beloZSHU17YJ6c0WuOo9yCPEKyxEs08jdevAWpO00qb97g6Mg1dhAejcmKgFs
 Mr31DBNoAzV9/ua/J3FL1qsR6BPJoCuxPCB70GKKRoAMePZNIWc+UGZ9y78gaflSBPFx
 OgRA==
X-Gm-Message-State: AOAM533CIQbS6+28HRQrO9LHchYkFfz8jq3uZ+Ufzg2RtoqYcqY/XEkp
 XvjRyuYMj0QIUlYwoAwDnnRSfy4PKcDNRQBSwPMCuUKAeMkZS20AmkIdSnhWcpsO3TUsxzbBpcO
 s9EFX5Rmo8xsWyodg7l5D7BNrVlU=
X-Received: by 2002:a1c:2842:: with SMTP id o63mr213023wmo.169.1593411713730; 
 Sun, 28 Jun 2020 23:21:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKYcxmqMsT/1ldFS1WC1gydKg7IfQlagc8Qi0Jdy4z5P71txG/ryJ4wq5phGebg35mwOxHnw==
X-Received: by 2002:a1c:2842:: with SMTP id o63mr213007wmo.169.1593411713418; 
 Sun, 28 Jun 2020 23:21:53 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 k126sm22276200wme.17.2020.06.28.23.21.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jun 2020 23:21:52 -0700 (PDT)
Date: Mon, 29 Jun 2020 02:21:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] xen: introduce xen_vring_use_dma
Message-ID: <20200629022124-mutt-send-email-mst@kernel.org>
References: <20200624091732.23944-1-peng.fan@nxp.com>
 <20200624050355-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006241047010.8121@sstabellini-ThinkPad-T480s>
 <20200624163940-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006241351430.8121@sstabellini-ThinkPad-T480s>
 <20200624181026-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006251014230.8121@sstabellini-ThinkPad-T480s>
 <20200626110629-mutt-send-email-mst@kernel.org>
 <DB6PR0402MB27601CA74B85DA5A9F5E5DD6886E0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <DB6PR0402MB27601CA74B85DA5A9F5E5DD6886E0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
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
Cc: "jgross@suse.com" <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>, "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 dl-linux-imx <linux-imx@nxp.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jun 29, 2020 at 03:05:19AM +0000, Peng Fan wrote:
> > Subject: Re: [PATCH] xen: introduce xen_vring_use_dma
> > 
> > On Thu, Jun 25, 2020 at 10:31:27AM -0700, Stefano Stabellini wrote:
> > > On Wed, 24 Jun 2020, Michael S. Tsirkin wrote:
> > > > On Wed, Jun 24, 2020 at 02:53:54PM -0700, Stefano Stabellini wrote:
> > > > > On Wed, 24 Jun 2020, Michael S. Tsirkin wrote:
> > > > > > On Wed, Jun 24, 2020 at 10:59:47AM -0700, Stefano Stabellini wrote:
> > > > > > > On Wed, 24 Jun 2020, Michael S. Tsirkin wrote:
> > > > > > > > On Wed, Jun 24, 2020 at 05:17:32PM +0800, Peng Fan wrote:
> > > > > > > > > Export xen_swiotlb for all platforms using xen swiotlb
> > > > > > > > >
> > > > > > > > > Use xen_swiotlb to determine when vring should use dma
> > > > > > > > > APIs to map the
> > > > > > > > > ring: when xen_swiotlb is enabled the dma API is required.
> > > > > > > > > When it is disabled, it is not required.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > > > > > >
> > > > > > > > Isn't there some way to use VIRTIO_F_IOMMU_PLATFORM for
> > this?
> > > > > > > > Xen was there first, but everyone else is using that now.
> > > > > > >
> > > > > > > Unfortunately it is complicated and it is not related to
> > > > > > > VIRTIO_F_IOMMU_PLATFORM :-(
> > > > > > >
> > > > > > >
> > > > > > > The Xen subsystem in Linux uses dma_ops via swiotlb_xen to
> > > > > > > translate foreign mappings (memory coming from other VMs) to
> > physical addresses.
> > > > > > > On x86, it also uses dma_ops to translate Linux's idea of a
> > > > > > > physical address into a real physical address (this is
> > > > > > > unneeded on ARM.)
> > > > > > >
> > > > > > >
> > > > > > > So regardless of VIRTIO_F_IOMMU_PLATFORM, dma_ops should be
> > > > > > > used on Xen/x86 always and on Xen/ARM if Linux is Dom0
> > > > > > > (because it has foreign
> > > > > > > mappings.) That is why we have the if (xen_domain) return
> > > > > > > true; in vring_use_dma_api.
> > > > > >
> > > > > > VIRTIO_F_IOMMU_PLATFORM makes guest always use DMA ops.
> > > > > >
> > > > > > Xen hack predates VIRTIO_F_IOMMU_PLATFORM so it *also* forces
> > > > > > DMA ops even if VIRTIO_F_IOMMU_PLATFORM is clear.
> > > > > >
> > > > > > Unfortunately as a result Xen never got around to properly
> > > > > > setting VIRTIO_F_IOMMU_PLATFORM.
> > > > >
> > > > > I don't think VIRTIO_F_IOMMU_PLATFORM would be correct for this
> > > > > because the usage of swiotlb_xen is not a property of virtio,
> > > >
> > > >
> > > > Basically any device without VIRTIO_F_ACCESS_PLATFORM (that is it's
> > > > name in latest virtio spec, VIRTIO_F_IOMMU_PLATFORM is what linux
> > > > calls it) is declared as "special, don't follow normal rules for
> > > > access".
> > > >
> > > > So yes swiotlb_xen is not a property of virtio, but what *is* a
> > > > property of virtio is that it's not special, just a regular device from DMA
> > POV.
> > >
> > > I am trying to understand what you meant but I think I am missing
> > > something.
> > >
> > > Are you saying that modern virtio should always have
> > > VIRTIO_F_ACCESS_PLATFORM, hence use normal dma_ops as any other
> > devices?
> > 
> > I am saying it's a safe default. Clear VIRTIO_F_ACCESS_PLATFORM if you have
> > some special needs e.g. you are very sure it's ok to bypass DMA ops, or you
> > need to support a legacy guest (produced in the window between virtio 1
> > support in 2014 and support for VIRTIO_F_ACCESS_PLATFORM in 2016).
> > 
> > 
> > > If that is the case, how is it possible that virtio breaks on ARM
> > > using the default dma_ops? The breakage is not Xen related (except
> > > that Xen turns dma_ops on). The original message from Peng was:
> > >
> > >   vring_map_one_sg -> vring_use_dma_api
> > >                    -> dma_map_page
> > >   		       -> __swiotlb_map_page
> > >   		                ->swiotlb_map_page
> > >   				->__dma_map_area(phys_to_virt(dma_to_phys(dev,
> > dev_addr)), size, dir);
> > >   However we are using per device dma area for rpmsg, phys_to_virt
> > >   could not return a correct virtual address for virtual address in
> > >   vmalloc area. Then kernel panic.
> > >
> > > I must be missing something. Maybe it is because it has to do with RPMesg?
> > 
> > I think it's an RPMesg bug, yes
> 
> rpmsg bug is another issue, it should not use dma_alloc_coherent for reserved area,
> and use vmalloc_to_page.
> 
> Anyway here using dma api will also trigger issue.
> 
> > 
> > >
> > > > > > > You might have noticed that I missed one possible case above:
> > > > > > > Xen/ARM DomU :-)
> > > > > > >
> > > > > > > Xen/ARM domUs don't need swiotlb_xen, it is not even
> > > > > > > initialized. So if
> > > > > > > (xen_domain) return true; would give the wrong answer in that case.
> > > > > > > Linux would end up calling the "normal" dma_ops, not
> > > > > > > swiotlb-xen, and the "normal" dma_ops fail.
> > > > > > >
> > > > > > >
> > > > > > > The solution I suggested was to make the check in
> > > > > > > vring_use_dma_api more flexible by returning true if the
> > > > > > > swiotlb_xen is supposed to be used, not in general for all Xen
> > > > > > > domains, because that is what the check was really meant to do.
> > > > > >
> > > > > > Why not fix DMA ops so they DTRT (nop) on Xen/ARM DomU? What is
> > wrong with that?
> > > > >
> > > > > swiotlb-xen is not used on Xen/ARM DomU, the default dma_ops are
> > > > > the ones that are used. So you are saying, why don't we fix the
> > > > > default dma_ops to work with virtio?
> > > > >
> > > > > It is bad that the default dma_ops crash with virtio, so yes I
> > > > > think it would be good to fix that. However, even if we fixed
> > > > > that, the if
> > > > > (xen_domain()) check in vring_use_dma_api is still a problem.
> > > >
> > > > Why is it a problem? It just makes virtio use DMA API.
> > > > If that in turn works, problem solved.
> > >
> > > You are correct in the sense that it would work. However I do think it
> > > is wrong for vring_use_dma_api to enable dma_ops/swiotlb-xen for
> > > Xen/ARM DomUs that don't need it. There are many different types of
> > > Xen guests, Xen x86 is drastically different from Xen ARM, it seems
> > > wrong to treat them the same way.
> > 
> > I could imagine some future Xen hosts setting a flag somewhere in the
> > platform capability saying "no xen specific flag, rely on
> > "VIRTIO_F_ACCESS_PLATFORM". Then you set that accordingly in QEMU.
> > How about that?
> > 
> 
> Michael, Stefano,
> 
> So what's your suggestion here, that we could avoid similar issue
> for virtio drivers in ARM DomU?
> 
> Thanks,
> Peng.
> 
> > 
> > >
> > >
> > > Anyway, re-reading the last messages of the original thread [1], it
> > > looks like Peng had a clear idea on how to fix the general issue.
> > > Peng, what happened with that?
> 
> We shrinked the rpmsg reserved area to workaround the issue.
> So still use the dma apis in rpmsg.
> 
> But here I am going to address domu android trusty issue using
> virtio.

My suggestion is to first of all fix DMA API so it works properly.

> > >
> > >
> > > [1]
> > > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore
> > > .kernel.org%2Fpatchwork%2Fpatch%2F1033801%2F%231222404&amp;dat
> > a=02%7C0
> > >
> > 1%7Cpeng.fan%40nxp.com%7C08ba48d3b3d54e775a8108d819e62fd0%7C68
> > 6ea1d3bc
> > >
> > 2b4c6fa92cd99c5c301635%7C0%7C0%7C637287823721994475&amp;sdata
> > =Cw4FHWrH
> > > uVKBCn3%2BKS2VM7cWuGoTI6R7SHJrJSLY5Io%3D&amp;reserved=0


