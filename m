Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CF0ADDF34
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jun 2025 00:52:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018556.1395457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRf9v-0006ux-5u; Tue, 17 Jun 2025 22:52:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018556.1395457; Tue, 17 Jun 2025 22:52:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRf9v-0006rw-1F; Tue, 17 Jun 2025 22:52:03 +0000
Received: by outflank-mailman (input) for mailman id 1018556;
 Tue, 17 Jun 2025 22:52:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hcls=ZA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uRf9u-0006ro-8P
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 22:52:02 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad2d4754-4bcd-11f0-a30a-13f23c93f187;
 Wed, 18 Jun 2025 00:52:00 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 489C05C53F0;
 Tue, 17 Jun 2025 22:49:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92038C4CEE3;
 Tue, 17 Jun 2025 22:51:57 +0000 (UTC)
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
X-Inumbo-ID: ad2d4754-4bcd-11f0-a30a-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750200718;
	bh=Spc04Q5E4aU7xLHQhioCLSz0rEpRmZag58hMfDZCJYE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZS09iev8n7N8sK/CZPwy/YnRNIfC9GPM7ZmjBN88D30MULd6NloqcOwv8Uz7nc29G
	 k3uNQEKoDuCVkdkizBebz4rJHf53rSoufmFGOnzpXiQ+9IR60+PeiPVkaW/LD2p+ES
	 CQ07on2z0CXaflrhvnbY/NJf4n59aoFs13bxFG3+uhqLQ21gWWYBlatUODhMqvvI8f
	 TZOXQIuK691J5u4Wbl/27kzyEhECNEh2FgSjx6NqWoHGmZFD48wPzBNQaitLn7or+7
	 do1mlIsnOwirmgqRxA3t9laL+9t4Y9RSCDz4ranLn/x2FwuJLF2AX+Gc4+gIIvWvmK
	 D/GOynk2fuVUw==
Date: Tue, 17 Jun 2025 15:51:51 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v6 3/4] xen/arm: add support for PCI child bus
In-Reply-To: <a5c394242c8d3d717cefa37324f14ac688f50ca7.1749720912.git.mykyta_poturai@epam.com>
Message-ID: <alpine.DEB.2.22.394.2506171548240.1780597@ubuntu-linux-20-04-desktop>
References: <cover.1749720912.git.mykyta_poturai@epam.com> <a5c394242c8d3d717cefa37324f14ac688f50ca7.1749720912.git.mykyta_poturai@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 12 Jun 2025, Mykyta Poturai wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> PCI host bridges often have different ways to access the root and child
> bus configuration spaces. One of the examples is Designware's host bridge
> and its multiple clones [1].
> 
> Linux kernel implements this by instantiating a child bus when device
> drivers provide not only the usual pci_ops to access ECAM space (this is
> the case for the generic host bridge), but also means to access the child
> bus which has a dedicated configuration space and own implementation for
> accessing the bus, e.g. child_ops.
> 
> For Xen it is not feasible to fully implement PCI bus infrastructure as
> Linux kernel does, but still child bus can be supported.
> 
> Add support for the PCI child bus which includes the following changes:
> - introduce bus mapping functions depending on SBDF
> - assign bus start and end for the child bus and re-configure the same for
>   the parent (root) bus
> - make pci_find_host_bridge be aware of multiple busses behind the same bridge
> - update pci_host_bridge_mappings, so it also doesn't map to guest the memory
>   spaces belonging to the child bus
> - make pci_host_common_probe accept one more pci_ops structure for the child bus
> - install MMIO handlers for the child bus for hardware domain
> - re-work vpci_mmio_{write|read} with parent and child approach in mind
> 
> [1] https://elixir.bootlin.com/linux/v5.15/source/drivers/pci/controller/dwc
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>

[...]


> diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
> index 53953d4895..487c545f3a 100644
> --- a/xen/arch/arm/pci/pci-host-common.c
> +++ b/xen/arch/arm/pci/pci-host-common.c
> @@ -57,17 +57,12 @@ static void pci_ecam_free(struct pci_config_window *cfg)
>      xfree(cfg);
>  }
>  
> -static struct pci_config_window * __init
> -gen_pci_init(struct dt_device_node *dev, const struct pci_ecam_ops *ops)
> +void __init pci_generic_init_bus_range(struct dt_device_node *dev,
> +                                       struct pci_host_bridge *bridge,
> +                                       struct pci_config_window *cfg)
>  {
> -    int err, cfg_reg_idx;
>      u32 bus_range[2];
> -    paddr_t addr, size;
> -    struct pci_config_window *cfg;
> -
> -    cfg = xzalloc(struct pci_config_window);
> -    if ( !cfg )
> -        return NULL;
> +    int err;
>  
>      err = dt_property_read_u32_array(dev, "bus-range", bus_range,
>                                       ARRAY_SIZE(bus_range));
> @@ -82,6 +77,35 @@ gen_pci_init(struct dt_device_node *dev, const struct pci_ecam_ops *ops)
>          if ( cfg->busn_end > cfg->busn_start + 0xff )
>              cfg->busn_end = cfg->busn_start + 0xff;
>      }
> +}
> +
> +void __init pci_generic_init_bus_range_child(struct dt_device_node *dev,
> +                                             struct pci_host_bridge *bridge,
> +                                             struct pci_config_window *cfg)
> +{
> +    cfg->busn_start = bridge->cfg->busn_start + 1;
> +    cfg->busn_end = bridge->cfg->busn_end;
> +    bridge->cfg->busn_end = bridge->cfg->busn_start;

I think Stewart meant that pci_generic_init_bus_range_child should be
renamed pci_designware_init_bus_range_child and moved to
pci-designware.c.

However, given that we don't have a second user of this and I am not
certain how generic (or not) this bus_range_child function is, also
considering the other comments have been addressed:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

It can be moved later as appropriate if this turns out not to be generic
once we have a second user.


> +    printk(XENLOG_INFO "Root bus end updated: [bus %x-%x]\n",
> +           bridge->cfg->busn_start, bridge->cfg->busn_end);
> +}


