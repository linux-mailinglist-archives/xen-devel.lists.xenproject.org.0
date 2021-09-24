Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCD6417E6B
	for <lists+xen-devel@lfdr.de>; Sat, 25 Sep 2021 01:48:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195706.348525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTuvI-0005Ea-4J; Fri, 24 Sep 2021 23:48:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195706.348525; Fri, 24 Sep 2021 23:48:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTuvI-0005C0-1E; Fri, 24 Sep 2021 23:48:08 +0000
Received: by outflank-mailman (input) for mailman id 195706;
 Fri, 24 Sep 2021 23:48:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UhVx=OO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTuvG-0005Bu-8z
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 23:48:06 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dc11bab1-1d91-11ec-bb28-12813bfff9fa;
 Fri, 24 Sep 2021 23:48:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5746C61212;
 Fri, 24 Sep 2021 23:48:04 +0000 (UTC)
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
X-Inumbo-ID: dc11bab1-1d91-11ec-bb28-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632527284;
	bh=g9p3Ou62KpnsjpUew8yvdKULg04zqDYk7HMoNoeDW3M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DZ7W84FbVoriI4A4725qQ1bnz9b8/DJ5X8AiYBh3cnJIiNG9ci0YU8q3vOdw70+V+
	 A9kUKJQihBGQ2+s0tyOXALjisj3/5sZPwoZVr5We9ewhkBMSfL/nQZsbuS8nLXNEpt
	 WNy5mQ8+4nMQmBSVBLJASrj2yMeVDWqLuM5FcY/Cd+Cb3iolrzsYIVoUlG/+gvnsBn
	 40J5rIhwIyJz8nJ6VIgSH5PASU8OiA8ky9VsDzB8A/QMHw0hR/4nodHqNsvtwEmg85
	 O8n6YcrodH9dYKupp6Y+f2TctI0E5F/r48IylA5qrE2ERu9wB7Bxi7wf4oxKnQijef
	 FpniECVRSgcXw==
Date: Fri, 24 Sep 2021 16:48:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Andrushchenko <andr2000@gmail.com>
cc: xen-devel@lists.xenproject.org, julien@xen.org, sstabellini@kernel.org, 
    oleksandr_tyshchenko@epam.com, volodymyr_babchuk@epam.com, 
    Artem_Mygaiev@epam.com, roger.pau@citrix.com, bertrand.marquis@arm.com, 
    rahul.singh@arm.com, 
    Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH v2 03/11] xen/arm: Introduce pci_find_host_bridge_node
 helper
In-Reply-To: <20210923125438.234162-4-andr2000@gmail.com>
Message-ID: <alpine.DEB.2.21.2109241647510.17979@sstabellini-ThinkPad-T480s>
References: <20210923125438.234162-1-andr2000@gmail.com> <20210923125438.234162-4-andr2000@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 23 Sep 2021, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Get host bridge node given a PCI device attached to it.
> 
> This helper will be re-used for adding PCI devices by the subsequent
> patches.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/pci/pci-host-common.c | 17 +++++++++++++++++
>  xen/include/asm-arm/pci.h          |  1 +
>  2 files changed, 18 insertions(+)
> 
> diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
> index a88f20175ea9..1567b6e2956c 100644
> --- a/xen/arch/arm/pci/pci-host-common.c
> +++ b/xen/arch/arm/pci/pci-host-common.c
> @@ -283,6 +283,23 @@ int pci_get_host_bridge_segment(const struct dt_device_node *node,
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
> +        printk(XENLOG_ERR "Unable to find PCI bridge for "PRI_pci"\n",
> +               pdev->seg, pdev->bus, pdev->sbdf.dev, pdev->sbdf.fn);
> +        return NULL;
> +    }
> +    return bridge->dt_node;
> +}
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
> index 9e366ae67e83..5b100556225e 100644
> --- a/xen/include/asm-arm/pci.h
> +++ b/xen/include/asm-arm/pci.h
> @@ -103,6 +103,7 @@ void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
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

