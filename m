Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 319B81CBB8E
	for <lists+xen-devel@lfdr.de>; Sat,  9 May 2020 02:07:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jXD1P-0005Dj-0L; Sat, 09 May 2020 00:07:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7o+2=6X=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jXD1N-0005DK-Gu
 for xen-devel@lists.xenproject.org; Sat, 09 May 2020 00:07:13 +0000
X-Inumbo-ID: 088992b6-9189-11ea-b9cf-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 088992b6-9189-11ea-b9cf-bc764e2007e4;
 Sat, 09 May 2020 00:07:13 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 62B232184D;
 Sat,  9 May 2020 00:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588982832;
 bh=tjhorcnghY2eQGqm8jtdi7hkjMizB/NV5vnFe7r3qB0=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=tvmA8Z5PxtpE/mYTUzjg09AeAFBCebgebQ1aNTko38hVinQQsB71HQnhYh1uJOrrb
 X54Zqb1aWavq3jCxptLrsJQnJFBl6ewkNGd11CmsblvZ55Lo3FLs3pVo37LJ7fnuME
 bhMA7ANdxwBhqpXT+Wovr9x68qs7m0/dc5miaSLs=
Date: Fri, 8 May 2020 17:07:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 03/12] xen/arm: introduce 1:1 mapping for domUs
In-Reply-To: <77d2858c-768c-e2a1-e2c9-32cb1612512d@xen.org>
Message-ID: <alpine.DEB.2.21.2005081351340.26167@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
 <20200415010255.10081-3-sstabellini@kernel.org>
 <3f26f6a0-89bd-cbec-f07f-90a08fa60e26@xen.org>
 <alpine.DEB.2.21.2004301417070.28941@sstabellini-ThinkPad-T480s>
 <77d2858c-768c-e2a1-e2c9-32cb1612512d@xen.org>
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
> > > > In some cases it is desirable to map domU memory 1:1 (guest physical ==
> > > > physical.) For instance, because we want to assign a device to the domU
> > > > but the IOMMU is not present or cannot be used. In these cases, other
> > > > mechanisms should be used for DMA protection, e.g. a MPU.
> > > 
> > > I am not against this, however the documentation should clearly explain
> > > that
> > > you are making your platform insecure unless you have other mean for DMA
> > > protection.
> > 
> > I'll expand the docs
> > 
> > 
> > > > 
> > > > This patch introduces a new device tree option for dom0less guests to
> > > > request a domain to be directly mapped. It also specifies the memory
> > > > ranges. This patch documents the new attribute and parses it at boot
> > > > time. (However, the implementation of 1:1 mapping is missing and just
> > > > BUG() out at the moment.)  Finally the patch sets the new direct_map
> > > > flag for DomU domains.
> > > > 
> > > > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > > > ---
> > > >    docs/misc/arm/device-tree/booting.txt | 13 +++++++
> > > >    docs/misc/arm/passthrough-noiommu.txt | 35 ++++++++++++++++++
> > > >    xen/arch/arm/domain_build.c           | 52
> > > > +++++++++++++++++++++++++--
> > > >    3 files changed, 98 insertions(+), 2 deletions(-)
> > > >    create mode 100644 docs/misc/arm/passthrough-noiommu.txt
> > > > 
> > > > diff --git a/docs/misc/arm/device-tree/booting.txt
> > > > b/docs/misc/arm/device-tree/booting.txt
> > > > index 5243bc7fd3..fce5f7ed5a 100644
> > > > --- a/docs/misc/arm/device-tree/booting.txt
> > > > +++ b/docs/misc/arm/device-tree/booting.txt
> > > > @@ -159,6 +159,19 @@ with the following properties:
> > > >        used, or GUEST_VPL011_SPI+1 if vpl011 is enabled, whichever is
> > > >        greater.
> > > >    +- direct-map
> > > > +
> > > > +    Optional. An array of integer pairs specifying addresses and sizes.
> > > > +    direct_map requests the memory of the domain to be 1:1 mapped with
> > > > +    the memory ranges specified as argument. Only sizes that are a
> > > > +    power of two number of pages are allowed.
> > > > +
> > > > +- #direct-map-addr-cells and #direct-map-size-cells
> > > > +
> > > > +    The number of cells to use for the addresses and for the sizes in
> > > > +    direct-map. Default and maximum are 2 cells for both addresses and
> > > > +    sizes.
> > > > +
> > > 
> > > As this is going to be mostly used for passthrough, can't we take
> > > advantage of
> > > the partial device-tree and describe the memory region using memory node?
> > 
> > With the system device tree bindings that are under discussion the role
> > of the partial device tree might be reduce going forward, and might even
> > go away in the long term. For this reason, I would prefer not to add
> > more things to the partial device tree.
> 
> Was the interface you suggested approved by the committee behind system device
> tree? If not, we will still have to support your proposal + whatever the
> committee come up with. So I am not entirely sure why using the partial
> device-tree will be an issue.

Not yet


> It is actually better to keep everything in the partial device-tree as it
> would avoid to clash with whatever you come up with the system device tree.

I don't think we want to support both in the long term. The closer we
are to it the better for transitioning.


> Also, I don't think the partial device-tree could ever go away at least in
> Xen. This is an external interface we provide to the user, removing it would
> mean users would not be able to upgrade from Xen 4.x to 4.y without any major
> rewrite of there DT.

I don't want to put the memory ranges inside the multiboot,device-tree
module because that is clearly for device assignment:

"Device Assignment (Passthrough) is supported by adding another module,
alongside the kernel and ramdisk, with the device tree fragment
corresponding to the device node to assign to the guest."

One could do 1:1 memory mapping without device assignment.


Genuine question: did we write down any compatibility promise on that
interface? If so, do you know where? I'd like to take a look.

In any case backward compatible interfaces can be deprecated although it
takes time. Alternatively it could be made optional (even for device
assignment). So expanding its scope beyond device assignment
configuration it is not a good idea.

