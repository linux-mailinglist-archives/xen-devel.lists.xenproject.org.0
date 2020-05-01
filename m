Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C321C0BAD
	for <lists+xen-devel@lfdr.de>; Fri,  1 May 2020 03:26:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUKRz-0000Ur-Vf; Fri, 01 May 2020 01:26:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J7As=6P=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jUKRy-0000Ub-KQ
 for xen-devel@lists.xenproject.org; Fri, 01 May 2020 01:26:46 +0000
X-Inumbo-ID: d23c8932-8b4a-11ea-b07b-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d23c8932-8b4a-11ea-b07b-bc764e2007e4;
 Fri, 01 May 2020 01:26:46 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7A6D72073E;
 Fri,  1 May 2020 01:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588296405;
 bh=hHmNrSXX0b8xwo49uXz+1R8w1FiK6501aUC2Xai0ID8=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=vepCulncd8+MOpZ0vaAZMao3Yiu50yDWoEeCRVQEcIbkQ4JqTeyLLXIMLEtQOQsrH
 GO5E70Z3R4lBd6Pz1Wt6h8ts/F3V8tEVR1vtqY1oj2i5O4dt/ANLAP3b2XqFz2xxRC
 G5Jgk4p/CK4ICq1TsuLmz2qzQLOApDcFpCgTGPnA=
Date: Thu, 30 Apr 2020 18:26:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 03/12] xen/arm: introduce 1:1 mapping for domUs
In-Reply-To: <3f26f6a0-89bd-cbec-f07f-90a08fa60e26@xen.org>
Message-ID: <alpine.DEB.2.21.2004301417070.28941@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
 <20200415010255.10081-3-sstabellini@kernel.org>
 <3f26f6a0-89bd-cbec-f07f-90a08fa60e26@xen.org>
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
> > In some cases it is desirable to map domU memory 1:1 (guest physical ==
> > physical.) For instance, because we want to assign a device to the domU
> > but the IOMMU is not present or cannot be used. In these cases, other
> > mechanisms should be used for DMA protection, e.g. a MPU.
> 
> I am not against this, however the documentation should clearly explain that
> you are making your platform insecure unless you have other mean for DMA
> protection.

I'll expand the docs


> > 
> > This patch introduces a new device tree option for dom0less guests to
> > request a domain to be directly mapped. It also specifies the memory
> > ranges. This patch documents the new attribute and parses it at boot
> > time. (However, the implementation of 1:1 mapping is missing and just
> > BUG() out at the moment.)  Finally the patch sets the new direct_map
> > flag for DomU domains.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > ---
> >   docs/misc/arm/device-tree/booting.txt | 13 +++++++
> >   docs/misc/arm/passthrough-noiommu.txt | 35 ++++++++++++++++++
> >   xen/arch/arm/domain_build.c           | 52 +++++++++++++++++++++++++--
> >   3 files changed, 98 insertions(+), 2 deletions(-)
> >   create mode 100644 docs/misc/arm/passthrough-noiommu.txt
> > 
> > diff --git a/docs/misc/arm/device-tree/booting.txt
> > b/docs/misc/arm/device-tree/booting.txt
> > index 5243bc7fd3..fce5f7ed5a 100644
> > --- a/docs/misc/arm/device-tree/booting.txt
> > +++ b/docs/misc/arm/device-tree/booting.txt
> > @@ -159,6 +159,19 @@ with the following properties:
> >       used, or GUEST_VPL011_SPI+1 if vpl011 is enabled, whichever is
> >       greater.
> >   +- direct-map
> > +
> > +    Optional. An array of integer pairs specifying addresses and sizes.
> > +    direct_map requests the memory of the domain to be 1:1 mapped with
> > +    the memory ranges specified as argument. Only sizes that are a
> > +    power of two number of pages are allowed.
> > +
> > +- #direct-map-addr-cells and #direct-map-size-cells
> > +
> > +    The number of cells to use for the addresses and for the sizes in
> > +    direct-map. Default and maximum are 2 cells for both addresses and
> > +    sizes.
> > +
> 
> As this is going to be mostly used for passthrough, can't we take advantage of
> the partial device-tree and describe the memory region using memory node?

With the system device tree bindings that are under discussion the role
of the partial device tree might be reduce going forward, and might even
go away in the long term. For this reason, I would prefer not to add
more things to the partial device tree.


> >   - #address-cells and #size-cells
> >         Both #address-cells and #size-cells need to be specified because
> > diff --git a/docs/misc/arm/passthrough-noiommu.txt
> > b/docs/misc/arm/passthrough-noiommu.txt
> > new file mode 100644
> > index 0000000000..d2bfaf26c3
> > --- /dev/null
> > +++ b/docs/misc/arm/passthrough-noiommu.txt
> > @@ -0,0 +1,35 @@
> > +Request Device Assignment without IOMMU support
> > +===============================================
> > +
> > +Add xen,force-assign-without-iommu; to the device tree snippet
> > +
> > +    ethernet: ethernet@ff0e0000 {
> > +        compatible = "cdns,zynqmp-gem";
> > +        xen,path = "/amba/ethernet@ff0e0000";
> > +        xen,reg = <0x0 0xff0e0000 0x1000 0x0 0xff0e0000>;
> > +        xen,force-assign-without-iommu;
> > +
> > +Optionally, if none of the domains require an IOMMU, then it could be
> > +disabled (not recommended). For instance by adding status = "disabled";
> > +under the smmu node:
> > +
> > +    smmu@fd800000 {
> > +        compatible = "arm,mmu-500";
> > +        status = "disabled";
> 
> I am not sure why this section is added in this patch. Furthermore, the file
> is named "noiommu" but here you mention the IOMMU.

I took the habit of writing user and testing docs at the time of writing
the patch series. I'll move this doc to the end of the the series. Also,
the words here are inaccurate, I'll improve it in the next version.


I have addressed all other comments.

