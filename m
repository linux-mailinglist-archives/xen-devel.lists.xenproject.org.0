Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A82207F3E
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2020 00:17:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joDh8-0006p1-Jm; Wed, 24 Jun 2020 22:16:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JaeF=AF=redhat.com=mst@srs-us1.protection.inumbo.net>)
 id 1joDh6-0006ow-06
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 22:16:36 +0000
X-Inumbo-ID: 5cca07bd-b668-11ea-8150-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 5cca07bd-b668-11ea-8150-12813bfff9fa;
 Wed, 24 Jun 2020 22:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593036994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wYBrrjiMl0OQwY7HbHO2EuoBSyetaNO9eIfsg2bUWrc=;
 b=fY5LaNQdIs2nd5oru1s9OMvRYBNKgaTTvuS9bSBX1LSFy1ty0osDXipmxuS5M++OvsmWfQ
 vjHVuhxVPgPHKlj/cxk9kJez0jWWljsf9afW6AhefSk1KZP4lqbHKyMvLgVH6z2QYHggJw
 lzbc2Z/roXvn47G/GedODggeP73s7XQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-0DpC1zI_OieggqkT2pZUug-1; Wed, 24 Jun 2020 18:16:32 -0400
X-MC-Unique: 0DpC1zI_OieggqkT2pZUug-1
Received: by mail-wm1-f70.google.com with SMTP id b13so2427073wme.9
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2020 15:16:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wYBrrjiMl0OQwY7HbHO2EuoBSyetaNO9eIfsg2bUWrc=;
 b=LgP/v415/LADR3p33Amb6Vw3EnYUEtfAbkTbj6R3nyMXG+iK+xSzUo0jWO5QzONNK+
 892Pyo5sXVE16YJ7dYWZQ0JEFNqJSYmOyGCq6NPIbeHZHktFwHyq3h9Y/N7NDshkk6Ir
 VV2Sd1CVXcc28FVmempratQN9e7xVstpnmJtecdxnCWDT4QW1asF6MPE/g/WSdXBGQgl
 tuCC5bEINPKQ8h43rRCerA5POJ80owEf+bQKcHtrkZlpBBd/wPiqwu/VzDMbJh7Bo5Ut
 kQK29wK9AEP28XG6lyQQ27OIR8v3tvmdojzs7kl3MJj/b+wJUEZxdb+vmRLKlbn+fIkX
 EayQ==
X-Gm-Message-State: AOAM532ZEccRbjOD/wpU4ChWjor9kyaUrplfDIgE4c6YUlPgIx7pDcji
 VY32RjLwCk97IU6YV9Jj2AfEMit1M7NNg0nJ0lwbIRqVhQtj+26Yz+crgx3QeevP/3WsyFKJ8jp
 vSyCiLw7+QomZYp5e0XYWgdaiQok=
X-Received: by 2002:a5d:630d:: with SMTP id i13mr29616357wru.208.1593036991413; 
 Wed, 24 Jun 2020 15:16:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyoZZ/QqNAP1QypcHjt3mv7sAp97QrEj/Mw3Cz3gd3OBPJIW+fGMGO1Vs/5O0ZnQg6aHPyOeQ==
X-Received: by 2002:a5d:630d:: with SMTP id i13mr29616327wru.208.1593036991077; 
 Wed, 24 Jun 2020 15:16:31 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 e8sm26368886wrv.24.2020.06.24.15.16.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 15:16:30 -0700 (PDT)
Date: Wed, 24 Jun 2020 18:16:26 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen: introduce xen_vring_use_dma
Message-ID: <20200624181026-mutt-send-email-mst@kernel.org>
References: <20200624091732.23944-1-peng.fan@nxp.com>
 <20200624050355-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006241047010.8121@sstabellini-ThinkPad-T480s>
 <20200624163940-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006241351430.8121@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2006241351430.8121@sstabellini-ThinkPad-T480s>
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

On Wed, Jun 24, 2020 at 02:53:54PM -0700, Stefano Stabellini wrote:
> On Wed, 24 Jun 2020, Michael S. Tsirkin wrote:
> > On Wed, Jun 24, 2020 at 10:59:47AM -0700, Stefano Stabellini wrote:
> > > On Wed, 24 Jun 2020, Michael S. Tsirkin wrote:
> > > > On Wed, Jun 24, 2020 at 05:17:32PM +0800, Peng Fan wrote:
> > > > > Export xen_swiotlb for all platforms using xen swiotlb
> > > > > 
> > > > > Use xen_swiotlb to determine when vring should use dma APIs to map the
> > > > > ring: when xen_swiotlb is enabled the dma API is required. When it is
> > > > > disabled, it is not required.
> > > > > 
> > > > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > > 
> > > > Isn't there some way to use VIRTIO_F_IOMMU_PLATFORM for this?
> > > > Xen was there first, but everyone else is using that now.
> > > 
> > > Unfortunately it is complicated and it is not related to
> > > VIRTIO_F_IOMMU_PLATFORM :-(
> > > 
> > > 
> > > The Xen subsystem in Linux uses dma_ops via swiotlb_xen to translate
> > > foreign mappings (memory coming from other VMs) to physical addresses.
> > > On x86, it also uses dma_ops to translate Linux's idea of a physical
> > > address into a real physical address (this is unneeded on ARM.)
> > > 
> > > 
> > > So regardless of VIRTIO_F_IOMMU_PLATFORM, dma_ops should be used on Xen/x86
> > > always and on Xen/ARM if Linux is Dom0 (because it has foreign
> > > mappings.) That is why we have the if (xen_domain) return true; in
> > > vring_use_dma_api.
> > 
> > VIRTIO_F_IOMMU_PLATFORM makes guest always use DMA ops.
> > 
> > Xen hack predates VIRTIO_F_IOMMU_PLATFORM so it *also*
> > forces DMA ops even if VIRTIO_F_IOMMU_PLATFORM is clear.
> >
> > Unfortunately as a result Xen never got around to
> > properly setting VIRTIO_F_IOMMU_PLATFORM.
> 
> I don't think VIRTIO_F_IOMMU_PLATFORM would be correct for this because
> the usage of swiotlb_xen is not a property of virtio,


Basically any device without VIRTIO_F_ACCESS_PLATFORM
(that is it's name in latest virtio spec, VIRTIO_F_IOMMU_PLATFORM is
what linux calls it) is declared as "special, don't follow normal rules
for access".

So yes swiotlb_xen is not a property of virtio, but what *is* a property
of virtio is that it's not special, just a regular device from DMA POV.


> it is a detail of
> the way Linux does Xen address translations. swiotlb-xen is used to do
> these translations and it is hooked into the dma_ops framework.
> 
> It would be possible to have a device in hardware that is
> virtio-compatible and doesn't set VIRTIO_F_IOMMU_PLATFORM.

That device would be basically broken, since hardware
can't know whether it can access all memory or not.

> The device
> could be directly assigned (passthrough) to a DomU. We would still
> have to use swiotlb_xen if Xen is running.
> 
> You should think of swiotlb-xen as only internal to Linux and not
> related to whether the (virtual or non-virtual) hardware comes with an
> IOMMU or not.

IOMMU is a misnomer here.  Virtio spec now calls this bit
VIRTIO_F_ACCESS_PLATFORM. We should have done the same a while ago -
I'll send a patch.

> 
> > > You might have noticed that I missed one possible case above: Xen/ARM
> > > DomU :-)
> > > 
> > > Xen/ARM domUs don't need swiotlb_xen, it is not even initialized. So if
> > > (xen_domain) return true; would give the wrong answer in that case.
> > > Linux would end up calling the "normal" dma_ops, not swiotlb-xen, and
> > > the "normal" dma_ops fail.
> > > 
> > > 
> > > The solution I suggested was to make the check in vring_use_dma_api more
> > > flexible by returning true if the swiotlb_xen is supposed to be used,
> > > not in general for all Xen domains, because that is what the check was
> > > really meant to do.
> > 
> > Why not fix DMA ops so they DTRT (nop) on Xen/ARM DomU? What is wrong with that?
> 
> swiotlb-xen is not used on Xen/ARM DomU, the default dma_ops are the
> ones that are used. So you are saying, why don't we fix the default
> dma_ops to work with virtio?
> 
> It is bad that the default dma_ops crash with virtio, so yes I think it
> would be good to fix that. However, even if we fixed that, the if
> (xen_domain()) check in vring_use_dma_api is still a problem.

Why is it a problem? It just makes virtio use DMA API.
If that in turn works, problem solved.



> 
> Alternatively we could try to work-around it from swiotlb-xen. We could
> enable swiotlb-xen for Xen/ARM DomUs with a different implementation so
> that we could leave the vring_use_dma_api check unmodified.
> 
> It would be ugly because we would have to figure out from the new
> swiotlb-xen functions if the device is a normal device, so we have to
> call the regular dma_ops functions, or if the device is a virtio device,
> in which case there is nothing to do. I think it is undesirable but
> could probably be made to work.


