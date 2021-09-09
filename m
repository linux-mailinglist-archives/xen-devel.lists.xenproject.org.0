Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 188C8406020
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 01:35:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183718.332019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOTYu-00060K-85; Thu, 09 Sep 2021 23:34:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183718.332019; Thu, 09 Sep 2021 23:34:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOTYu-0005y6-4u; Thu, 09 Sep 2021 23:34:32 +0000
Received: by outflank-mailman (input) for mailman id 183718;
 Thu, 09 Sep 2021 23:34:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ArGz=N7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mOTYt-0005y0-7s
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 23:34:31 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7f8b6389-02cd-4948-9a59-3656849e494a;
 Thu, 09 Sep 2021 23:34:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 62366610C9;
 Thu,  9 Sep 2021 23:34:29 +0000 (UTC)
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
X-Inumbo-ID: 7f8b6389-02cd-4948-9a59-3656849e494a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631230469;
	bh=Ry3nsNInnIdfbYlD8M3MCLrSiNb9Qdq/qLmuQdF6Ogg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=H7IMKQ2L+G3oIZtrk34NQjFOnz4Jl1mL2eBaWdWWxM6dcPUbr7f+S5NmJ2Mwi7bqt
	 nrocuUix1dIRVDE7n0vu4X/r1IFMTFcZSafG6nyvIi5s+3uqvqujZThGMOI/91YbMD
	 DWb4mjeEeD4WAGHFJRl2G1QQIW6rXsMMCjK73S+FhDtKYMMbUHG8o3ziNvLGvl9lRn
	 4u+zm2A/RyRDhF9499uE+wm+KP41XT0cqc8BcmAuApmHosN7hsLHeCOywL0aFy//G2
	 x72wu1ITNTS6m1Chje4Ln3yW2G/76LuPV/jZ6hEd9FVzbYmrTr5Sq7o+LVnxwyxnvj
	 k6DIYkAMKvBtQ==
Date: Thu, 9 Sep 2021 16:34:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 07/14] xen/arm: Add support for Xilinx ZynqMP PCI host
 controller
In-Reply-To: <a3318d9459ace64224a14e4424eef657e2ed5b69.1629366665.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2109091629020.10523@sstabellini-ThinkPad-T480s>
References: <cover.1629366665.git.rahul.singh@arm.com> <a3318d9459ace64224a14e4424eef657e2ed5b69.1629366665.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 19 Aug 2021, Rahul Singh wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Add support for Xilinx ZynqMP PCI host controller to map the PCI config
> space to the XEN memory.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
>  xen/arch/arm/pci/Makefile          |  1 +
>  xen/arch/arm/pci/pci-host-zynqmp.c | 59 ++++++++++++++++++++++++++++++
>  2 files changed, 60 insertions(+)
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
> index 0000000000..fe103e3855
> --- /dev/null
> +++ b/xen/arch/arm/pci/pci-host-zynqmp.c
> @@ -0,0 +1,59 @@
> +/*
> + * Copyright (C) 2020-2021 EPAM Systems
> + *
> + * Based on Linux drivers/pci/controller/pci-host-common.c
> + * Based on Linux drivers/pci/controller/pci-host-generic.c
> + * Based on xen/arch/arm/pci/pci-host-generic.c
> + * Copyright (C) 2014 ARM Limited Will Deacon <will.deacon@arm.com>

Only one Copyright line per file is enough :-)

But actually all the Copyright lines with a name or a company name are
not really required or useful, as the copyright is noted in full details
in the commit messages (author and signed-off-by lines). I would remove
them all from the new files added by this series.


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
> +static const struct dt_device_match gen_pci_dt_match[] = {
> +    { .compatible = "xlnx,nwl-pcie-2.11",
> +      .data =       &pci_generic_ecam_ops },
> +    { },
> +};
> +
> +static int gen_pci_dt_init(struct dt_device_node *dev, const void *data)
> +{
> +    const struct dt_device_match *of_id;
> +    const struct pci_ecam_ops *ops;
> +
> +    of_id = dt_match_node(gen_pci_dt_match, dev->dev.of_node);

This should be superfluous


> +    ops = (struct pci_ecam_ops *) of_id->data;
> +
> +    printk(XENLOG_INFO "Found PCI host bridge %s compatible:%s \n",
> +            dt_node_full_name(dev), of_id->compatible);
> +
> +    return pci_host_common_probe(dev, ops, 2);
> +}
> +
> +DT_DEVICE_START(pci_gen, "PCI HOST ZYNQMP", DEVICE_PCI)
> +.dt_match = gen_pci_dt_match,
> +.init = gen_pci_dt_init,
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

