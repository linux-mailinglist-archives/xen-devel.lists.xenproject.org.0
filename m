Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD36D405C52
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 19:43:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183452.331645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOO4y-0007pA-IN; Thu, 09 Sep 2021 17:43:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183452.331645; Thu, 09 Sep 2021 17:43:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOO4y-0007nJ-F6; Thu, 09 Sep 2021 17:43:16 +0000
Received: by outflank-mailman (input) for mailman id 183452;
 Thu, 09 Sep 2021 17:43:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mOO4x-0007nD-Ai
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 17:43:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mOO4u-0003NE-Iy; Thu, 09 Sep 2021 17:43:12 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mOO4u-0001tu-BO; Thu, 09 Sep 2021 17:43:12 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=HirYJ1RJd/TiLDXKH9u8ITgTJ18WeYSi95VgsTPECEA=; b=vq9wL135Sc++G+ZLEF+EIeBPZw
	P7o+G3Rhj8WMhwrC5OLUiMs+M8ZKDShDfm7l7ogDuFD6wZNHmRqgoUMbePr5bJsH1OgWbhHCWH8GG
	DGrIraohQqgKUEiDjYTVoxPK8qeqAD8O6LQf4wTWdeRaZjH1lEGX9A3d2Cw9m/RWLg1k=;
Subject: Re: [PATCH 09/11] xen/arm: Setup MMIO range trap handlers for
 hardware domain
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
References: <20210903083347.131786-1-andr2000@gmail.com>
 <20210903083347.131786-10-andr2000@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <247bd41c-98e6-f898-8216-e36b22158636@xen.org>
Date: Thu, 9 Sep 2021 18:43:09 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210903083347.131786-10-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 03/09/2021 09:33, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> In order vPCI to work it needs all access to PCI configuration space
> (ECAM) to be synchronized among all entities, e.g. hardware domain and
> guests.

I am not entirely sure what you mean by "synchronized" here. Are you 
refer to the content of the configuration space?

> For that implement PCI host bridge specific callbacks to
> properly setup those ranges depending on particular host bridge
> implementation.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
>   xen/arch/arm/pci/ecam.c            | 11 +++++++++++
>   xen/arch/arm/pci/pci-host-common.c | 16 ++++++++++++++++
>   xen/arch/arm/vpci.c                | 13 +++++++++++++
>   xen/include/asm-arm/pci.h          |  8 ++++++++
>   4 files changed, 48 insertions(+)
> 
> diff --git a/xen/arch/arm/pci/ecam.c b/xen/arch/arm/pci/ecam.c
> index 91c691b41fdf..92ecb2e0762b 100644
> --- a/xen/arch/arm/pci/ecam.c
> +++ b/xen/arch/arm/pci/ecam.c
> @@ -42,6 +42,16 @@ void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
>       return base + (PCI_DEVFN(sbdf_t.dev, sbdf_t.fn) << devfn_shift) + where;
>   }
>   
> +static int pci_ecam_register_mmio_handler(struct domain *d,
> +                                          struct pci_host_bridge *bridge,
> +                                          const struct mmio_handler_ops *ops)
> +{
> +    struct pci_config_window *cfg = bridge->sysdata;
> +
> +    register_mmio_handler(d, ops, cfg->phys_addr, cfg->size, NULL);

We have a fixed array for handling the MMIO handlers. So you need to 
make sure we have enough space in it to store one handler per handler.

This is quite similar to the problem we had with the re-distribuor on 
GICv3. Have a look there to see how we dealt with it.

> +    return 0;
> +}
> +
>   /* ECAM ops */
>   const struct pci_ecam_ops pci_generic_ecam_ops = {
>       .bus_shift  = 20,
> @@ -49,6 +59,7 @@ const struct pci_ecam_ops pci_generic_ecam_ops = {
>           .map_bus                = pci_ecam_map_bus,
>           .read                   = pci_generic_config_read,
>           .write                  = pci_generic_config_write,
> +        .register_mmio_handler  = pci_ecam_register_mmio_handler,
>       }
>   };
>   
> diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
> index d2fef5476b8e..a89112bfbb7c 100644
> --- a/xen/arch/arm/pci/pci-host-common.c
> +++ b/xen/arch/arm/pci/pci-host-common.c
> @@ -318,6 +318,22 @@ struct dt_device_node *pci_find_host_bridge_node(struct device *dev)
>       }
>       return bridge->dt_node;
>   }
> +
> +int pci_host_iterate_bridges(struct domain *d,
> +                             int (*clb)(struct domain *d,

NIT: We tend to name callback variable 'cb'.

Cheers,

-- 
Julien Grall

