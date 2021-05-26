Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E42391C81
	for <lists+xen-devel@lfdr.de>; Wed, 26 May 2021 17:54:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132617.247302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llvqi-0002MU-1f; Wed, 26 May 2021 15:53:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132617.247302; Wed, 26 May 2021 15:53:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llvqh-0002Kd-TB; Wed, 26 May 2021 15:53:35 +0000
Received: by outflank-mailman (input) for mailman id 132617;
 Wed, 26 May 2021 15:53:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wTMo=KV=kernel.org=will@srs-us1.protection.inumbo.net>)
 id 1llvqg-0002KX-4W
 for xen-devel@lists.xenproject.org; Wed, 26 May 2021 15:53:34 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 864be4d1-254e-4c9b-a5e6-1c89d23ff4e3;
 Wed, 26 May 2021 15:53:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 063E7611CD;
 Wed, 26 May 2021 15:53:24 +0000 (UTC)
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
X-Inumbo-ID: 864be4d1-254e-4c9b-a5e6-1c89d23ff4e3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1622044412;
	bh=OnL/4Jq+LKq6vWvDBS0xA9CvVYxTMOTBjml/zh+3Ar0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B4UuFsxu1r3HigmEjVwQF/otX4DrMd38lSSUyIbdumWlwAz4mqWFVwTfX3tV+cLTK
	 ezumxJCPuSoiNTejbR/1l7Q+EyQuGnIdMF026YW9wZDBrp0Etki3m3VqLD3t52Z+ML
	 aIGQuwBPRYJXDmtAfPisyQiC2L9qX6xiRg823CR+7DK1ZJFKUWOyliFfy6nu3kEBra
	 72iE6bgTyqyaVJ438e+wldUwZTA5bJjB+laj7DX9kULouD8NbVtF/6oVvQWdjQCza8
	 vTg4CtjTc7cs0vgmNuLf7hWhlxI/bnFdiE1zs5zIETRjnoBXmZKSOwwvGM2DpAYygJ
	 B11ILWs8v9zvg==
Date: Wed, 26 May 2021 16:53:21 +0100
From: Will Deacon <will@kernel.org>
To: Claire Chang <tientzu@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
	Joerg Roedel <joro@8bytes.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	boris.ostrovsky@oracle.com, jgross@suse.com,
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	benh@kernel.crashing.org, paulus@samba.org,
	"list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
	sstabellini@kernel.org, Robin Murphy <robin.murphy@arm.com>,
	grant.likely@arm.com, xypron.glpk@gmx.de,
	Thierry Reding <treding@nvidia.com>, mingo@kernel.org,
	bauerman@linux.ibm.com, peterz@infradead.org,
	Greg KH <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	heikki.krogerus@linux.intel.com,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	linux-devicetree <devicetree@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
	xen-devel@lists.xenproject.org,
	Nicolas Boichat <drinkcat@chromium.org>,
	Jim Quinlan <james.quinlan@broadcom.com>, tfiga@chromium.org,
	bskeggs@redhat.com, bhelgaas@google.com, chris@chris-wilson.co.uk,
	daniel@ffwll.ch, airlied@linux.ie, dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
	jxgao@google.com, joonas.lahtinen@linux.intel.com,
	linux-pci@vger.kernel.org, maarten.lankhorst@linux.intel.com,
	matthew.auld@intel.com, rodrigo.vivi@intel.com,
	thomas.hellstrom@linux.intel.com
Subject: Re: [PATCH v7 14/15] dt-bindings: of: Add restricted DMA pool
Message-ID: <20210526155321.GA19633@willie-the-truck>
References: <20210518064215.2856977-1-tientzu@chromium.org>
 <20210518064215.2856977-15-tientzu@chromium.org>
 <20210526121322.GA19313@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210526121322.GA19313@willie-the-truck>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, May 26, 2021 at 01:13:22PM +0100, Will Deacon wrote:
> On Tue, May 18, 2021 at 02:42:14PM +0800, Claire Chang wrote:
> > @@ -138,4 +160,9 @@ one for multimedia processing (named multimedia-memory@77000000, 64MiB).
> >  		memory-region = <&multimedia_reserved>;
> >  		/* ... */
> >  	};
> > +
> > +	pcie_device: pcie_device@0,0 {
> > +		memory-region = <&restricted_dma_mem_reserved>;
> > +		/* ... */
> > +	};
> 
> I still don't understand how this works for individual PCIe devices -- how
> is dev->of_node set to point at the node you have above?
> 
> I tried adding the memory-region to the host controller instead, and then
> I see it crop up in dmesg:
> 
>   | pci-host-generic 40000000.pci: assigned reserved memory node restricted_dma_mem_reserved
> 
> but none of the actual PCI devices end up with 'dma_io_tlb_mem' set, and
> so the restricted DMA area is not used. In fact, swiotlb isn't used at all.
> 
> What am I missing to make this work with PCIe devices?

Aha, looks like we're just missing the logic to inherit the DMA
configuration. The diff below gets things working for me.

Will

--->8

diff --git a/drivers/of/address.c b/drivers/of/address.c
index c562a9ff5f0b..bf499fdd6e93 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -1113,25 +1113,25 @@ bool of_dma_is_coherent(struct device_node *np)
 }
 EXPORT_SYMBOL_GPL(of_dma_is_coherent);
 
-int of_dma_set_restricted_buffer(struct device *dev)
+int of_dma_set_restricted_buffer(struct device *dev, struct device_node *np)
 {
-	struct device_node *node;
 	int count, i;
 
-	if (!dev->of_node)
+	if (!np)
 		return 0;
 
-	count = of_property_count_elems_of_size(dev->of_node, "memory-region",
+	count = of_property_count_elems_of_size(np, "memory-region",
 						sizeof(phandle));
 	for (i = 0; i < count; i++) {
-		node = of_parse_phandle(dev->of_node, "memory-region", i);
+		struct device_node *node;
+
+		node = of_parse_phandle(np, "memory-region", i);
 		/* There might be multiple memory regions, but only one
-		 * restriced-dma-pool region is allowed.
+		 * restricted-dma-pool region is allowed.
 		 */
 		if (of_device_is_compatible(node, "restricted-dma-pool") &&
 		    of_device_is_available(node))
-			return of_reserved_mem_device_init_by_idx(
-				dev, dev->of_node, i);
+			return of_reserved_mem_device_init_by_idx(dev, np, i);
 	}
 
 	return 0;
diff --git a/drivers/of/device.c b/drivers/of/device.c
index d8d865223e51..2defdca418ec 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -166,7 +166,7 @@ int of_dma_configure_id(struct device *dev, struct device_node *np,
 	arch_setup_dma_ops(dev, dma_start, size, iommu, coherent);
 
 	if (!iommu)
-		return of_dma_set_restricted_buffer(dev);
+		return of_dma_set_restricted_buffer(dev, np);
 
 	return 0;
 }
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 9fc874548528..8fde97565d11 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -163,14 +163,15 @@ struct bus_dma_region;
 #if defined(CONFIG_OF_ADDRESS) && defined(CONFIG_HAS_DMA)
 int of_dma_get_range(struct device_node *np,
 		const struct bus_dma_region **map);
-int of_dma_set_restricted_buffer(struct device *dev);
+int of_dma_set_restricted_buffer(struct device *dev, struct device_node *np);
 #else
 static inline int of_dma_get_range(struct device_node *np,
 		const struct bus_dma_region **map)
 {
 	return -ENODEV;
 }
-static inline int of_dma_set_restricted_buffer(struct device *dev)
+static inline int of_dma_set_restricted_buffer(struct device *dev,
+					       struct device_node *np)
 {
 	return -ENODEV;
 }

