Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 092217F3B15
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 02:14:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638342.994815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5bp6-0003sn-1a; Wed, 22 Nov 2023 01:14:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638342.994815; Wed, 22 Nov 2023 01:14:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5bp5-0003qf-VG; Wed, 22 Nov 2023 01:14:35 +0000
Received: by outflank-mailman (input) for mailman id 638342;
 Wed, 22 Nov 2023 01:14:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lIMN=HD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r5bp4-0003qX-N3
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 01:14:34 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7dc81526-88d4-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 02:14:33 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 51F3161BD1;
 Wed, 22 Nov 2023 01:14:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0024C433C9;
 Wed, 22 Nov 2023 01:14:29 +0000 (UTC)
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
X-Inumbo-ID: 7dc81526-88d4-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700615671;
	bh=fva6UkXo8yJFzKn+8NB5CkzT6L9wTtbwWCv/BmrGO3k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nlOzqkLadcY70GMBrv0WjnQZD9pbeNDSgvX+aJfrIRzzzTuPzmbz7rQEXOYtgEJnS
	 +Hq8yXcU0H9q6nnL96MhHSBh1QJPQ6l8HLoPhcG7qKTKm7x9wHhXkT4rZSypMRdBjR
	 4LryoRRiRBPsUl6MTTS+RKwlYBe2mhMQUHDs5Amv/TU64s48osdkUdseTyrbwz430y
	 1c5fv/UieKEJVjSzKrmcOEP/D8/osk8DB5AjUmYgLpfq18l96imDFvuIzmQTItKU6S
	 uTSlryw+SvDsEN4kaU64XqZjezbhOU69qGcKsDKgTL0m1EO0GKEV2bYnD9aDPYFil2
	 FpbKDoHM9l8Aw==
Date: Tue, 21 Nov 2023 17:14:28 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
cc: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, 
    Julien Grall <julien@xen.org>, Sergiy Kibrik <Sergiy_Kibrik@epam.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    "vikram.garhwal@amd.com" <vikram.garhwal@amd.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [RFC PATCH 2/6] xen/public: arch-arm: reserve resources for
 virtio-pci
In-Reply-To: <54294601-76fe-4994-9500-e6a9999dba73@amd.com>
Message-ID: <alpine.DEB.2.22.394.2311211713560.2053963@ubuntu-linux-20-04-desktop>
References: <20231115112611.3865905-1-Sergiy_Kibrik@epam.com> <20231115112611.3865905-3-Sergiy_Kibrik@epam.com> <f4523916-f8aa-4f3c-a148-2fc73b0c5fa4@xen.org> <a5ce647b-f372-41ee-b1d2-b6ff16c3d1a0@epam.com> <alpine.DEB.2.22.394.2311151518500.160649@ubuntu-linux-20-04-desktop>
 <78c59979-5110-4fa3-855d-e0fa6df116f0@amd.com> <a96732c2-cdfb-43fb-9e88-1cd54994eab4@epam.com> <54294601-76fe-4994-9500-e6a9999dba73@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 21 Nov 2023, Stewart Hildebrand wrote:
> On 11/17/23 03:11, Oleksandr Tyshchenko wrote:
> > 
> > 
> > On 17.11.23 05:31, Stewart Hildebrand wrote:
> > 
> > Hello Stewart
> > 
> > [answering only for virtio-pci bits as for vPCI I am only familiar with 
> > code responsible for trapping config space accesses]
> > 
> > [snip]
> > 
> >>>
> >>>
> >>> Let me start by saying that if we can get away with it, I think that a
> >>> single PCI Root Complex in Xen would be best because it requires less
> >>> complexity. Why emulate 2/3 PCI Root Complexes if we can emulate only
> >>> one?
> >>>
> >>> Stewart, you are deep into vPCI, what's your thinking?
> >>
> >> First allow me explain the moving pieces in a bit more detail (skip ahead to "Back to the question: " if you don't want to be bored with the details). I played around with this series, and I passed through a PCI device (with vPCI) and enabled virtio-pci:
> >>
> >> virtio = [ "type=virtio,device,transport=pci,bdf=0000:00:00.0,backend_type=qemu" ]
> >> device_model_args = [ "-device", "virtio-serial-pci" ]
> >> pci = [ "01:00.0" ]
> >>
> >> Indeed we get two root complexes (2 ECAM ranges, 2 sets of interrupts, etc.) from the domU point of view:
> >>
> >>      pcie@10000000 {
> >>          compatible = "pci-host-ecam-generic";
> >>          device_type = "pci";
> >>          reg = <0x00 0x10000000 0x00 0x10000000>;
> >>          bus-range = <0x00 0xff>;
> >>          #address-cells = <0x03>;
> >>          #size-cells = <0x02>;
> >>          status = "okay";
> >>          ranges = <0x2000000 0x00 0x23000000 0x00 0x23000000 0x00 0x10000000 0x42000000 0x01 0x00 0x01 0x00 0x01 0x00>;
> >>          #interrupt-cells = <0x01>;
> >>          interrupt-map = <0x00 0x00 0x00 0x01 0xfde8 0x00 0x74 0x04>;
> >>          interrupt-map-mask = <0x00 0x00 0x00 0x07>;
> > 
> > 
> > I am wondering how you got interrupt-map here? AFAIR upstream toolstack 
> > doesn't add that property for vpci dt node.
> 
> You are correct. I'm airing my dirty laundry here: this is a hack to get a legacy interrupt passed through on a ZCU102 board (Zynq UltraScale+), which doesn't have GICv3/ITS. In a system with a GICv3/ITS, we would have an msi-map property (this is also not yet upstream, but is in a couple of downstreams).
> 
> > 
> >>      };
> >>
> >>      pcie@33000000 {
> >>          compatible = "pci-host-ecam-generic";
> >>          device_type = "pci";
> >>          reg = <0x00 0x33000000 0x00 0x200000>;
> >>          bus-range = <0x00 0x01>;
> >>          #address-cells = <0x03>;
> >>          #size-cells = <0x02>;
> >>          status = "okay";
> >>          ranges = <0x2000000 0x00 0x34000000 0x00 0x34000000 0x00 0x800000 0x42000000 0x00 0x3a000000 0x00 0x3a000000 0x00 0x800000>;
> >>          dma-coherent;
> >>          #interrupt-cells = <0x01>;
> >>          interrupt-map = <0x00 0x00 0x00 0x01 0xfde8 0x00 0x0c 0x04 0x00 0x00 0x00 0x02 0xfde8 0x00 0x0d 0x04 0x00 0x00 0x00 0x03 0xfde8 0x00 0x0e 0x04 0x00 0x00 0x00 0x04 0xfde8 0x00 0x0f 0x04 0x800 0x00 0x00 0x01 0xfde8 0x00 0x0d 0x04 0x800 0x00 0x00 0x02 0xfde8 0x00 0x0e 0x04 0x800 0x00 0x00 0x03 0xfde8 0x00 0x0f 0x04 0x800 0x00 0x00 0x04 0xfde8 0x00 0x0c 0x04 0x1000 0x00 0x00 0x01 0xfde8 0x00 0x0e 0x04 0x1000 0x00 0x00 0x02 0xfde8 0x00 0x0f 0x04 0x1000 0x00 0x00 0x03 0xfde8 0x00 0x0c 0x04 0x1000 0x00 0x00 0x04 0xfde8 0x00 0x0d 0x04 0x1800 0x00 0x00 0x01 0xfde8 0x00 0x0f 0x04 0x1800 0x00 0x00 0x02 0xfde8 0x00 0x0c 0x04 0x1800 0x00 0x00 0x03 0xfde8 0x00 0x0d 0x04 0x1800 0x00 0x00 0x04 0xfde8 0x00 0x0e 0x04>;
> >>          interrupt-map-mask = <0x1800 0x00 0x00 0x07>;
> > 
> > 
> > that is correct dump.
> > 
> > BTW, if you added "grant_usage=1" (it is disabled by default for dom0) 
> > to virtio configuration you would get iommu-map property here as well 
> > [1]. This is another point to think about when considering combined 
> > approach (single PCI Host bridge node -> single virtual root complex), I 
> > guess usual PCI device doesn't want grant based DMA addresses, correct? 
> > If so, it shouldn't be specified in the property.
> 
> Right, a usual PCI device doesn't want/need grant based DMA addresses. The iommu-map property [2] is flexible enough to make it apply only to certain vBDFs or ranges of vBDFs. Actually, it looks like ("libxl/arm: Reuse generic PCI-IOMMU bindings for virtio-pci devices") already has the logic for doing exactly this. So it should be fine to have the iommu-map property in the single root complex and still do regular PCI passthrough.
> 
> Presumably, we would also want msi-map [3] to apply to some vBDFs, not others. msi-map has the same flexible BDF matching as iommu-map (these two bindings actually share the same parsing function), so we should be able to use a similar strategy here if needed.
> 
> We would also want interrupt-map [4] to apply to some vBDFs, not others. The BDF matching with interrupt-map behaves slightly differently, but I believe it is still flexible enough to achieve this. In this case, the function create_virtio_pci_irq_map(), added in ("libxl/arm: Add basic virtio-pci support"), would need some re-thinking.
> 
> In summary, with a single virtual root complex, the toolstack needs to know which vBDFs are virtio-pci, and which vBDFs are passthrough, so it can create the [iommu,msi,interrupt]-map properties accordingly.

That should be fine given that the toolstack also knows all the PCI
Passthrough devices too.

