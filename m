Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 074CC41E585
	for <lists+xen-devel@lfdr.de>; Fri,  1 Oct 2021 02:29:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200304.354788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mW6Qu-0007LN-1f; Fri, 01 Oct 2021 00:29:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200304.354788; Fri, 01 Oct 2021 00:29:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mW6Qt-0007IG-Ua; Fri, 01 Oct 2021 00:29:47 +0000
Received: by outflank-mailman (input) for mailman id 200304;
 Fri, 01 Oct 2021 00:29:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cSXX=OV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mW6Qt-0007IA-3t
 for xen-devel@lists.xenproject.org; Fri, 01 Oct 2021 00:29:47 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id adc52158-224e-11ec-bd77-12813bfff9fa;
 Fri, 01 Oct 2021 00:29:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 472C3619F8;
 Fri,  1 Oct 2021 00:29:45 +0000 (UTC)
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
X-Inumbo-ID: adc52158-224e-11ec-bd77-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633048185;
	bh=jGydmyNGPvK6YZC2gvSXz5PCk+zK4utdoQqXCNBCLr0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=G6ckTti9f2dp93mz+Ka9XZxOwaDxYE74DKyr5P5Pev0mijHLhKdpF7TjXabaX9CYq
	 55ZIqFPmrqd47VP+wdHmyYEdGS95udNASYLyWDUFjD+uIL3t3CpaJ5aYC+mwY89kE9
	 FmkjDEBRpYQ0T6G0swNeXGx5g2vgqn/qFpgRmaN/ykaHY3eIJHDTTz6nn3cn8SnsJe
	 lCz0bZbcquzeHa3wrzWMz0eqyy3fJWCmgD+PVCYinBnF6xmaG9nnRHnxZujKmZ9+zY
	 9eMdb+ZYjrKhh2rsSgP/lacPiKwMuS2wbED/FwPnuoWoOkwz8scgraDeMR09gmxV2P
	 j57M1G5QDoGIw==
Date: Thu, 30 Sep 2021 17:29:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Andrushchenko <andr2000@gmail.com>
cc: xen-devel@lists.xenproject.org, julien@xen.org, sstabellini@kernel.org, 
    oleksandr_tyshchenko@epam.com, volodymyr_babchuk@epam.com, 
    Artem_Mygaiev@epam.com, roger.pau@citrix.com, bertrand.marquis@arm.com, 
    rahul.singh@arm.com, 
    Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH v3 03/11] xen/arm: Introduce pci_find_host_bridge_node
 helper
In-Reply-To: <20210930071326.857390-4-andr2000@gmail.com>
Message-ID: <alpine.DEB.2.21.2109301729210.3209@sstabellini-ThinkPad-T480s>
References: <20210930071326.857390-1-andr2000@gmail.com> <20210930071326.857390-4-andr2000@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 30 Sep 2021, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Get host bridge node given a PCI device attached to it.
> 
> This helper will be re-used for adding PCI devices by the subsequent
> patches.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> ---
> Since v2:
>  - !! dropped Stefano's r-b because of the changes
>  - s/PRI_pci/%pp after rebase onto Arm series
> ---
>  xen/arch/arm/pci/pci-host-common.c | 16 ++++++++++++++++
>  xen/include/asm-arm/pci.h          |  1 +
>  2 files changed, 17 insertions(+)
> 
> diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
> index 593beeb48ce4..592c01aae5bb 100644
> --- a/xen/arch/arm/pci/pci-host-common.c
> +++ b/xen/arch/arm/pci/pci-host-common.c
> @@ -276,6 +276,22 @@ int pci_get_host_bridge_segment(const struct dt_device_node *node,
>      return -EINVAL;
>  }
>  
> +/*
> + * Get host bridge node given a device attached to it.
> + */
> +struct dt_device_node *pci_find_host_bridge_node(struct device *dev)
> +{
> +    struct pci_host_bridge *bridge;
> +    struct pci_dev *pdev = dev_to_pci(dev);
> +
> +    bridge = pci_find_host_bridge(pdev->seg, pdev->bus);
> +    if ( unlikely(!bridge) )
> +    {
> +        printk(XENLOG_ERR "Unable to find PCI bridge for %pp\n", &pdev->sbdf);
> +        return NULL;
> +    }
> +    return bridge->dt_node;
> +}
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
> index 603a1fc072d1..e6d4000e2ac8 100644
> --- a/xen/include/asm-arm/pci.h
> +++ b/xen/include/asm-arm/pci.h
> @@ -99,6 +99,7 @@ void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
>  struct pci_host_bridge *pci_find_host_bridge(uint16_t segment, uint8_t bus);
>  int pci_get_host_bridge_segment(const struct dt_device_node *node,
>                                  uint16_t *segment);
> +struct dt_device_node *pci_find_host_bridge_node(struct device *dev);
>  
>  static always_inline bool is_pci_passthrough_enabled(void)
>  {
> -- 
> 2.25.1
> 

