Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E6540BBE6
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 01:07:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187053.335789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQHVq-0004z2-36; Tue, 14 Sep 2021 23:06:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187053.335789; Tue, 14 Sep 2021 23:06:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQHVp-0004xF-VK; Tue, 14 Sep 2021 23:06:49 +0000
Received: by outflank-mailman (input) for mailman id 187053;
 Tue, 14 Sep 2021 23:06:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L61H=OE=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mQHVp-0004x9-16
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 23:06:49 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5181069a-aead-4e99-8b32-975d834425c8;
 Tue, 14 Sep 2021 23:06:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1D6AA603E5;
 Tue, 14 Sep 2021 23:06:47 +0000 (UTC)
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
X-Inumbo-ID: 5181069a-aead-4e99-8b32-975d834425c8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631660807;
	bh=v7cDB2XwLuvGLjxlVPf6/TIa+X5CHj9IPBciXatkZuY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=M3Q5Fuj50l+1Tg0pyP9WaogOkrYtn6TEZxC4N0zinGNIRVOzLNKjgoBWUmipDrRrl
	 LHjKFBLjzSomZh+7+05sycP0tNUMZMS5105LSBWQPjD/63EG5N7Vi74qLcpv3H1uOl
	 0ARzqoWb1YCsygGfV1koScmgxCIOs3BVp4cBBuOxFjxHGduvakm4I4vNtZ1xodV7jQ
	 eHsOvR3WKXJUUSkOkrs2lDJ64JYQsKEYm8lmOo4pnWgesQVTQoZ81JvWMEflbtFi8h
	 khNF39KpmZ3KXnqFlgTWmsQ8vSssmtgE9i89gJHQSqYuOGGz3MV/42TIskdXvKFgqP
	 mxapdtiZHh4Ow==
Date: Tue, 14 Sep 2021 16:06:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <Rahul.Singh@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 06/14] xen/arm: Add support for PCI ecam operations
In-Reply-To: <B0EBC722-A74A-4742-9D93-904398FDDF1B@arm.com>
Message-ID: <alpine.DEB.2.21.2109141543090.21985@sstabellini-ThinkPad-T480s>
References: <cover.1629366665.git.rahul.singh@arm.com> <1dc8286db35ced8281587135cfa582ea44b0185f.1629366665.git.rahul.singh@arm.com> <alpine.DEB.2.21.2109091607070.10523@sstabellini-ThinkPad-T480s> <B0EBC722-A74A-4742-9D93-904398FDDF1B@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1558274019-1631659690=:21985"
Content-ID: <alpine.DEB.2.21.2109141549020.21985@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1558274019-1631659690=:21985
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2109141549021.21985@sstabellini-ThinkPad-T480s>

On Tue, 14 Sep 2021, Rahul Singh wrote:
> >> +        return NULL;
> >> +
> >> +    busn -= cfg->busn_start;
> >> +    base = cfg->win + (busn << cfg->ops->bus_shift);
> >> +
> >> +    return base + (PCI_DEVFN(sbdf_t.dev, sbdf_t.fn) << devfn_shift) + where;
> >> +}
> > 
> > I understand that the arm32 part is not implemented and not part of this
> > series, that's fine. However if the plan is that arm32 will dynamically
> > map each bus individually, then I imagine this function will have an
> > ioremap in the arm32 version. Which means that we also need an
> > unmap_bus call in struct pci_ops. I understand that pci_ecam_unmap_bus
> > would be a NOP today for arm64, but I think it makes sense to have it if
> > we want the API to be generic.
> 
> As per my understanding we don’t need pci_ecam_unmap_bus(..) as I don’t see any use case to unmap the 
> bus dynamically. We can add the support for per_bus_mapping for ARM32 once we implement arm32 part.
> Let me know your view on this.

In the patch titled "xen/arm: PCI host bridge discovery within XEN on
ARM" there is the following in-code comment:

* On 64-bit systems, we do a single ioremap for the whole config space
* since we have enough virtual address range available.  On 32-bit, we
* ioremap the config space for each bus individually.
*
* As of now only 64-bit is supported 32-bit is not supported.


So I take it that on arm32 we don't have enough virtual address range
available, therefore we cannot ioremap the whole range. Instead, we'll
have to ioremap the config space of each bus individually.

I assumed that the idea was to call ioremap and iounmap dynamically,
otherwise the total amount of virtual address range required would still
be the same. I also thought that the dynamic mapping function, the one
which would end up calling ioremap on arm32, would be pci_ecam_map_bus.
If so, then we are missing the corresponding unmapping function, the one
that would call iounmap on arm32 and do nothing on arm64, called before
returning from pci_generic_config_read and pci_generic_config_write.

As always, I am not asking for the arm32 implementation, but if we are
introducing internal APIs, it would be good that they are consistent.



> >> @@ -50,10 +51,41 @@ struct pci_host_bridge {
> >>     u8 bus_start;                    /* Bus start of this bridge. */
> >>     u8 bus_end;                      /* Bus end of this bridge. */
> >>     void *sysdata;                   /* Pointer to the config space window*/
> >> +    const struct pci_ops *ops;
> >> };
> >> 
> >> +struct pci_ops {
> >> +    void __iomem *(*map_bus)(struct pci_host_bridge *bridge, uint32_t sbdf,
> >> +                             uint32_t offset);
> >> +    int (*read)(struct pci_host_bridge *bridge, uint32_t sbdf,
> >> +                uint32_t reg, uint32_t len, uint32_t *value);
> >> +    int (*write)(struct pci_host_bridge *bridge, uint32_t sbdf,
> >> +                 uint32_t reg, uint32_t len, uint32_t value);
> >> +};
> >> +
> >> +/*
> >> + * struct to hold pci ops and bus shift of the config window
> >> + * for a PCI controller.
> >> + */
> >> +struct pci_ecam_ops {
> >> +    unsigned int            bus_shift;
> >> +    struct pci_ops          pci_ops;
> >> +    int (*init)(struct pci_config_window *);
> > 
> > Is this last member of the struct needed/used?
> 
> Yes It will be used by some vendor specific board( N1SDP ). Please check below.
> https://git.linaro.org/landing-teams/working/arm/n1sdp-pcie-quirk.git/commit/?id=04b7e76d0fe6481a803f58e54e008a1489d713a5

OK. I don't doubt that there might be bridge-specific initializations,
but we already have things like:

DT_DEVICE_START(pci_gen, "PCI HOST ZYNQMP", DEVICE_PCI)
.dt_match = gen_pci_dt_match,
.init = gen_pci_dt_init,
DT_DEVICE_END

The question is do we actually need two different vendor-specific init
functions? One is driven by device tree, e.g. ZynqMP is calling
gen_pci_dt_init. The other one is pci_ecam_ops->init, which is called
from the following chain:

DT_DEVICE_START -> gen_pci_dt_init -> pci_host_common_probe ->
gen_pci_init -> pci_generic_ecam_ops.init

What's the difference between gen_pci_dt_init and pci_ecam_ops.init in
terms of purpose?

I am happy to have pci_ecam_ops.init if it serves a different purpose
from DT_DEVICE_START.init. In that case we might want to add an in-code
comment so that an engineer would know where to add vendor-specific code
(whether to DT_DEVICE_START.init or to pci_ecam_ops.init).
--8323329-1558274019-1631659690=:21985--

