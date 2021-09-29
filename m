Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7971741CA80
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 18:42:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199258.353197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVcea-0004pR-RS; Wed, 29 Sep 2021 16:41:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199258.353197; Wed, 29 Sep 2021 16:41:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVcea-0004nZ-OS; Wed, 29 Sep 2021 16:41:56 +0000
Received: by outflank-mailman (input) for mailman id 199258;
 Wed, 29 Sep 2021 16:41:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=arYX=OT=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mVcea-0004nT-1L
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 16:41:56 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2787b692-2144-11ec-bd13-12813bfff9fa;
 Wed, 29 Sep 2021 16:41:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 510BB61209;
 Wed, 29 Sep 2021 16:41:54 +0000 (UTC)
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
X-Inumbo-ID: 2787b692-2144-11ec-bd13-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632933714;
	bh=z91rOq2RvvcZpmymQuLhQEnfMpw8VLa8tosZvwqeRNk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cT1AQfmFbzByjwbmObJDSpep6Zllw+9olAJHGHNKLoYkg/FXQzFnl5cvjVzrpfhFd
	 Y0PrDjQGcbRyQPqbi2RMaf+IG0au0AvSf6XOIuL0tMQhQs+tLsTyPN1LIFoKbKYejz
	 s04hLeo1MAfEEFdpZxdmWxLJy1UuV3DlJQ+ZeOdyL9y0WHsuXTGmqZTx3sCZa2Lz8H
	 14WYL18MHHvqtKPuWc4zjQv6pDMY7yIbhHZVik+AmH3DtbmA4OZxN4gGGi0HxEFVxb
	 O63fKCMgqZQVbVXG+ug7uWevTWsO7VyB0bBLZ3iNItBuhwv2N3jsGeI5d76+IOu3yF
	 ur5JG7gl/1fYA==
Date: Wed, 29 Sep 2021 09:41:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Andre.Przywara@arm.com, 
    Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 12/17] xen/arm: Add support for Xilinx ZynqMP PCI host
 controller
In-Reply-To: <c40a520d289799e52234fb1865e7f3ef1fd27431.1632847120.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2109281638210.5022@sstabellini-ThinkPad-T480s>
References: <cover.1632847120.git.rahul.singh@arm.com> <c40a520d289799e52234fb1865e7f3ef1fd27431.1632847120.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 28 Sep 2021, Rahul Singh wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Add support for Xilinx ZynqMP PCI host controller to map the PCI config
> space to the XEN memory.
> 
> Patch helps to understand how the generic infrastructure for PCI
> host-bridge discovery will be used for future references.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
> Change in v3:
> - nwl_cfg_reg_index(..) as static function
> - Add support for pci_host_generic_probe() 
> Change in v2:
> - Add more info in commit msg
> ---
>  xen/arch/arm/pci/Makefile          |  1 +
>  xen/arch/arm/pci/pci-host-zynqmp.c | 63 ++++++++++++++++++++++++++++++
>  2 files changed, 64 insertions(+)
>  create mode 100644 xen/arch/arm/pci/pci-host-zynqmp.c
> 
> diff --git a/xen/arch/arm/pci/Makefile b/xen/arch/arm/pci/Makefile
> index 6f32fbbe67..1d045ade01 100644
> --- a/xen/arch/arm/pci/Makefile
> +++ b/xen/arch/arm/pci/Makefile
> @@ -3,3 +3,4 @@ obj-y += pci-access.o
>  obj-y += pci-host-generic.o
>  obj-y += pci-host-common.o
>  obj-y += ecam.o
> +obj-y += pci-host-zynqmp.o
> diff --git a/xen/arch/arm/pci/pci-host-zynqmp.c b/xen/arch/arm/pci/pci-host-zynqmp.c
> new file mode 100644
> index 0000000000..6ccbfd15c9
> --- /dev/null
> +++ b/xen/arch/arm/pci/pci-host-zynqmp.c
> @@ -0,0 +1,63 @@
> +/*
> + * Based on Linux drivers/pci/controller/pci-host-common.c
> + * Based on Linux drivers/pci/controller/pci-host-generic.c
> + * Based on xen/arch/arm/pci/pci-host-generic.c
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include <asm/device.h>
> +#include <xen/pci.h>
> +#include <asm/pci.h>
> +
> +static int nwl_cfg_reg_index(struct dt_device_node *np)
> +{
> +    return dt_property_match_string(np, "reg-names", "cfg");
> +}

Can this be __init?


> +/* ECAM ops */
> +const struct pci_ecam_ops nwl_pcie_ops = {
> +    .bus_shift  = 20,
> +    .cfg_reg_index = nwl_cfg_reg_index,
> +    .pci_ops    = {
> +        .map_bus                = pci_ecam_map_bus,
> +        .read                   = pci_generic_config_read,
> +        .write                  = pci_generic_config_write,
> +    }
> +};
> +
> +static const struct dt_device_match nwl_pcie_dt_match[] = {

This should probably be __initconst


> +    { .compatible = "xlnx,nwl-pcie-2.11" },
> +    { },
> +};
> +
> +static int pci_host_generic_probe(struct dt_device_node *dev,
> +                                  const void *data)

and this could be __init


> +{
> +    return pci_host_common_probe(dev, &nwl_pcie_ops);
> +}
> +
> +DT_DEVICE_START(pci_gen, "PCI HOST ZYNQMP", DEVICE_PCI)
> +.dt_match = nwl_pcie_dt_match,
> +.init = pci_host_generic_probe,
> +DT_DEVICE_END
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> -- 
> 2.17.1
> 

