Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17416392CD7
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 13:35:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133045.248074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmEIB-00030n-D3; Thu, 27 May 2021 11:35:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133045.248074; Thu, 27 May 2021 11:35:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmEIB-0002yQ-A3; Thu, 27 May 2021 11:35:11 +0000
Received: by outflank-mailman (input) for mailman id 133045;
 Thu, 27 May 2021 11:35:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nal+=KW=kernel.org=will@srs-us1.protection.inumbo.net>)
 id 1lmEI9-0002yK-Fn
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 11:35:09 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9157bd06-f5ff-422e-81b0-d12d985a0491;
 Thu, 27 May 2021 11:35:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2886A6113B;
 Thu, 27 May 2021 11:35:00 +0000 (UTC)
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
X-Inumbo-ID: 9157bd06-f5ff-422e-81b0-d12d985a0491
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1622115307;
	bh=awWFyuDtGzTSFYuKnqnAwD8I2u8LvxPLkIedgwXpacY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p4bPfFCD5PrcmECQ/JmYfkoIQvGIdlvd3Xmt5WsLHiji5zjF5hUpY/7jV/AEVHJHW
	 CB6f9oBS2X3aNGgQ3+WcdNwOGV1gPRmBycO/zJJUoapgziqu+7IL5STMx1dAhYz3+T
	 0bM7UEMZILv76zqCaWO+pWXqjNmfb4VQ6CH4Qz9dn7I0OepvY2P5/VxhAaiFsn1JPd
	 ce1hSAg7oNQpoYW+JbRsJjBqIARt3uf0TgyQ8bjr7saHdzXTBfM/jxaDHBHbhfTQ4Z
	 nDFzJaE8tdL5MVg6406RffF7r/1Of9XzA/MNxWJkmUtb6zscbeJZBFAuG32Qt3uWbG
	 DCkceG/OoqRLg==
Date: Thu, 27 May 2021 12:34:57 +0100
From: Will Deacon <will@kernel.org>
To: Claire Chang <tientzu@chromium.org>
Cc: heikki.krogerus@linux.intel.com, thomas.hellstrom@linux.intel.com,
	peterz@infradead.org, benh@kernel.crashing.org,
	joonas.lahtinen@linux.intel.com, dri-devel@lists.freedesktop.org,
	chris@chris-wilson.co.uk, grant.likely@arm.com, paulus@samba.org,
	Frank Rowand <frowand.list@gmail.com>, mingo@kernel.org,
	sstabellini@kernel.org, Saravana Kannan <saravanak@google.com>,
	mpe@ellerman.id.au,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Christoph Hellwig <hch@lst.de>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
	linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
	Thierry Reding <treding@nvidia.com>,
	intel-gfx@lists.freedesktop.org, matthew.auld@intel.com,
	linux-devicetree <devicetree@vger.kernel.org>,
	Jianxiong Gao <jxgao@google.com>, Daniel Vetter <daniel@ffwll.ch>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	maarten.lankhorst@linux.intel.com, airlied@linux.ie,
	Dan Williams <dan.j.williams@intel.com>,
	linuxppc-dev@lists.ozlabs.org, jani.nikula@linux.intel.com,
	Rob Herring <robh+dt@kernel.org>, rodrigo.vivi@intel.com,
	Bjorn Helgaas <bhelgaas@google.com>, boris.ostrovsky@oracle.com,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	jgross@suse.com, Nicolas Boichat <drinkcat@chromium.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	lkml <linux-kernel@vger.kernel.org>,
	"list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
	Jim Quinlan <james.quinlan@broadcom.com>, xypron.glpk@gmx.de,
	Robin Murphy <robin.murphy@arm.com>, bauerman@linux.ibm.com
Subject: Re: [PATCH v7 14/15] dt-bindings: of: Add restricted DMA pool
Message-ID: <20210527113456.GA22019@willie-the-truck>
References: <20210518064215.2856977-1-tientzu@chromium.org>
 <20210518064215.2856977-15-tientzu@chromium.org>
 <20210526121322.GA19313@willie-the-truck>
 <20210526155321.GA19633@willie-the-truck>
 <CALiNf2_sVXnb97++yWusB5PWz8Pzfn9bCKZc6z3tY4bx6-nW8w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALiNf2_sVXnb97++yWusB5PWz8Pzfn9bCKZc6z3tY4bx6-nW8w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, May 27, 2021 at 07:29:20PM +0800, Claire Chang wrote:
> On Wed, May 26, 2021 at 11:53 PM Will Deacon <will@kernel.org> wrote:
> >
> > On Wed, May 26, 2021 at 01:13:22PM +0100, Will Deacon wrote:
> > > On Tue, May 18, 2021 at 02:42:14PM +0800, Claire Chang wrote:
> > > > @@ -138,4 +160,9 @@ one for multimedia processing (named multimedia-memory@77000000, 64MiB).
> > > >             memory-region = <&multimedia_reserved>;
> > > >             /* ... */
> > > >     };
> > > > +
> > > > +   pcie_device: pcie_device@0,0 {
> > > > +           memory-region = <&restricted_dma_mem_reserved>;
> > > > +           /* ... */
> > > > +   };
> > >
> > > I still don't understand how this works for individual PCIe devices -- how
> > > is dev->of_node set to point at the node you have above?
> > >
> > > I tried adding the memory-region to the host controller instead, and then
> > > I see it crop up in dmesg:
> > >
> > >   | pci-host-generic 40000000.pci: assigned reserved memory node restricted_dma_mem_reserved
> > >
> > > but none of the actual PCI devices end up with 'dma_io_tlb_mem' set, and
> > > so the restricted DMA area is not used. In fact, swiotlb isn't used at all.
> > >
> > > What am I missing to make this work with PCIe devices?
> >
> > Aha, looks like we're just missing the logic to inherit the DMA
> > configuration. The diff below gets things working for me.
> 
> I guess what was missing is the reg property in the pcie_device node.
> Will update the example dts.

Thanks. I still think something like my diff makes sense, if you wouldn't mind including
it, as it allows restricted DMA to be used for situations where the PCIe
topology is not static.

Perhaps we should prefer dev->of_node if it exists, but then use the node
of the host bridge's parent node otherwise?

Will

