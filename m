Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0098EAFD6EE
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 21:14:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037212.1409881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZDlX-0001fO-Ky; Tue, 08 Jul 2025 19:14:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037212.1409881; Tue, 08 Jul 2025 19:14:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZDlX-0001d9-I4; Tue, 08 Jul 2025 19:14:07 +0000
Received: by outflank-mailman (input) for mailman id 1037212;
 Tue, 08 Jul 2025 19:14:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G3iI=ZV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uZDlV-0001d3-Ku
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 19:14:05 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b60e86b3-5c2f-11f0-a317-13f23c93f187;
 Tue, 08 Jul 2025 21:14:04 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3E609A53F75;
 Tue,  8 Jul 2025 19:14:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5674C4CEED;
 Tue,  8 Jul 2025 19:14:01 +0000 (UTC)
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
X-Inumbo-ID: b60e86b3-5c2f-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752002042;
	bh=a9Fa+o5VhXQNwOv52OZI3bERsa0/m4qsG0//3lsjGcY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=AXYNEwo3UVw1Ke5h3GZyS/IUX/gkATfFeY+AEMIdv7euU21Tv+yA5F9+Zywh3xZlj
	 gt7NXYw01d/6gu2eUkQPu5QtdKjjLR+Z7BrwO1m2yvJ2/k+S+WFLGmiQCzJYJDtk+h
	 sJX62Cheivod5SmFj41kSKXRy+dy7t/TfIJQehMO5XZ+y+gvntGZUaq1XAM++6RhTX
	 wMGIvSW//+pCyLq1YrUp2ZkiLYWRclwzxZcYhUZIP6TY8NV7vvOSmTtGrMFSqzf6RV
	 bpQiLFv7tC5D+DX4EbLcJmC609SdK41e4RidH33fJm6Wa4gYLMLwmYoIvmUDtpzzh4
	 h/nEJeRpnjkBQ==
Date: Tue, 8 Jul 2025 12:13:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 1/3] arm/pci: allow designware-based hosts to have
 private data
In-Reply-To: <471d93d91543c5bfcd5a56cc555b94b3ab5fb623.1751874601.git.mykyta_poturai@epam.com>
Message-ID: <alpine.DEB.2.22.394.2507081209100.605088@ubuntu-linux-20-04-desktop>
References: <cover.1751874601.git.mykyta_poturai@epam.com> <471d93d91543c5bfcd5a56cc555b94b3ab5fb623.1751874601.git.mykyta_poturai@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 7 Jul 2025, Mykyta Poturai wrote:
> Introduce an additional private data field in `dw_pcie_priv` to allow
> vendors to store custom data without interfering with bridge->priv.
> Also add get/set pair to make accesing that private data less
> cumbersome.
> 
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/pci/pci-designware.c | 12 ++++++++++++
>  xen/arch/arm/pci/pci-designware.h |  4 ++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/xen/arch/arm/pci/pci-designware.c b/xen/arch/arm/pci/pci-designware.c
> index 47dd2dd4c0..0bd67524ac 100644
> --- a/xen/arch/arm/pci/pci-designware.c
> +++ b/xen/arch/arm/pci/pci-designware.c
> @@ -403,3 +403,15 @@ dw_pcie_host_probe(struct dt_device_node *dev, const void *data,
>  
>      return bridge;
>  }
> +
> +void *dw_pcie_get_priv(struct pci_host_bridge *bridge)
> +{
> +    struct dw_pcie_priv *priv = bridge->priv;
> +    return priv->priv;
> +}
> +
> +void dw_pcie_set_priv(struct pci_host_bridge *bridge, void *other)
> +{
> +    struct dw_pcie_priv *priv = bridge->priv;
> +    priv->priv = other;
> +}
> diff --git a/xen/arch/arm/pci/pci-designware.h b/xen/arch/arm/pci/pci-designware.h
> index 7efb1dc9a2..b9deb3b138 100644
> --- a/xen/arch/arm/pci/pci-designware.h
> +++ b/xen/arch/arm/pci/pci-designware.h
> @@ -66,8 +66,12 @@ struct dw_pcie_priv {
>      bool iatu_unroll_enabled;
>      void __iomem *atu_base;
>      unsigned int version;
> +    void *priv;
>  };
>  
> +void *dw_pcie_get_priv(struct pci_host_bridge *bridge);
> +void dw_pcie_set_priv(struct pci_host_bridge *bridge, void *other);
> +
>  void dw_pcie_set_version(struct pci_host_bridge *bridge, unsigned int version);
>  
>  void __iomem *dw_pcie_child_map_bus(struct pci_host_bridge *bridge,
> -- 
> 2.34.1
> 

