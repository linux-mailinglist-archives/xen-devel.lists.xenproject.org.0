Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF410A959F1
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 01:51:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961557.1352945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u70uY-000220-Nz; Mon, 21 Apr 2025 23:50:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961557.1352945; Mon, 21 Apr 2025 23:50:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u70uY-0001zG-Kw; Mon, 21 Apr 2025 23:50:50 +0000
Received: by outflank-mailman (input) for mailman id 961557;
 Mon, 21 Apr 2025 23:50:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nRXx=XH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u70uX-0001zA-2p
 for xen-devel@lists.xenproject.org; Mon, 21 Apr 2025 23:50:49 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71e02abb-1f0b-11f0-9eb0-5ba50f476ded;
 Tue, 22 Apr 2025 01:50:47 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 51B264A007;
 Mon, 21 Apr 2025 23:50:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 968CCC4CEE4;
 Mon, 21 Apr 2025 23:50:44 +0000 (UTC)
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
X-Inumbo-ID: 71e02abb-1f0b-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745279445;
	bh=YHdDgloOoyjisUCB6dHzYNbwVnyh+feIpfjBOGsOP40=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Y/ZPELW9bHeCvP83GzNGK3vLM3nZS0H+h61aG2NNkPAX5deT+PXh4gZVc+9h9hIkb
	 FAIpdbeO6/xDDThiLKm4Kog8D6gPpJW2vpXcHyOSBuM1sInMorO0uHgpQyIXqskdRc
	 sQcmuk9Zy8psnSK5NV0cLih/P8sUB4yzfY4Je9yUx7IrhpWYyxmx1YKORwqleTch8D
	 Ma19K8jlNqVBdXTSNUXiAZmv08uw0Nw53FQo7ggyCePeu1GssAhVkSG3ylOTnlWXrF
	 WHP9raLKoDkmWrd48qow0Albt5G1WqkjU1xA94+YtquuK8pCJ0X4NXN90TtzQd50u7
	 7I5u3zA414wiw==
Date: Mon, 21 Apr 2025 16:50:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stewart Hildebrand <stewart.hildebrand@amd.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v9 3/8] iommu/arm: iommu_add_dt_pci_sideband_ids phantom
 handling
In-Reply-To: <f9954a18b28b2233ef1478855994ce979a779e76.1741958647.git.mykyta_poturai@epam.com>
Message-ID: <alpine.DEB.2.22.394.2504211650330.785180@ubuntu-linux-20-04-desktop>
References: <cover.1741958647.git.mykyta_poturai@epam.com> <f9954a18b28b2233ef1478855994ce979a779e76.1741958647.git.mykyta_poturai@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 14 Mar 2025, Mykyta Poturai wrote:
> From: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> Handle phantom functions in iommu_add_dt_pci_sideband_ids(). Each phantom
> function will have a unique requestor ID (RID)/BDF. On ARM, we need to
> map/translate the RID/BDF to an AXI stream ID for each phantom function
> according to the pci-iommu device tree mapping [1]. The RID/BDF -> AXI stream ID
> mapping in DT could allow phantom devices (i.e. devices with phantom functions)
> to use different AXI stream IDs based on the (phantom) function.
> 
> [1] https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/pci-iommu.txt
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> v8->v9:
> * replace DT_NO_IOMMU with 1
> 
> v7->v8:
> * no change
> 
> v6->v7:
> * no change
> 
> v5->v6:
> * no change
> 
> v4->v5:
> * no change
> 
> v3->v4:
> * s/iommu_dt_pci_map_id/dt_map_id/
> 
> v2->v3:
> * new patch title (was: iommu/arm: iommu_add_dt_pci_device phantom handling)
> * rework loop to reduce duplication
> * s/iommu_fwspec_free(pci_to_dev(pdev))/iommu_fwspec_free(dev)/
> 
> v1->v2:
> * new patch
> 
> ---
> TODO: investigate Jan's comment [2]
> [2] https://lore.kernel.org/xen-devel/806a2978-19fb-4d31-ab6a-35ea7317c8de@suse.com/
> ---
>  xen/drivers/passthrough/device_tree.c | 33 ++++++++++++++++-----------
>  1 file changed, 20 insertions(+), 13 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> index 37e1437b65..f5850a2607 100644
> --- a/xen/drivers/passthrough/device_tree.c
> +++ b/xen/drivers/passthrough/device_tree.c
> @@ -169,6 +169,7 @@ int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev)
>      struct device *dev = pci_to_dev(pdev);
>      const struct dt_device_node *np;
>      int rc;
> +    unsigned int devfn = pdev->devfn;
>  
>      if ( !iommu_enabled )
>          return 1;
> @@ -183,21 +184,27 @@ int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev)
>      if ( !np )
>          return -ENODEV;
>  
> -    /*
> -     * According to the Documentation/devicetree/bindings/pci/pci-iommu.txt
> -     * from Linux.
> -     */
> -    rc = dt_map_id(np, PCI_BDF(pdev->bus, pdev->devfn), "iommu-map",
> -                   "iommu-map-mask", &iommu_spec.np, iommu_spec.args);
> -    if ( rc )
> -        return (rc == -ENODEV) ? 1 : rc;
> +    do {
> +        /*
> +         * According to the Documentation/devicetree/bindings/pci/pci-iommu.txt
> +         * from Linux.
> +         */
> +        rc = dt_map_id(np, PCI_BDF(pdev->bus, devfn), "iommu-map",
> +                       "iommu-map-mask", &iommu_spec.np, iommu_spec.args);
> +        if ( rc )
> +            return (rc == -ENODEV) ? 1 : rc;
>  
> -    rc = iommu_dt_xlate(dev, &iommu_spec, ops);
> -    if ( rc < 0 )
> -    {
> -        iommu_fwspec_free(dev);
> -        return -EINVAL;
> +        rc = iommu_dt_xlate(dev, &iommu_spec, ops);
> +        if ( rc < 0 )
> +        {
> +            iommu_fwspec_free(dev);
> +            return -EINVAL;
> +        }
> +
> +        devfn += pdev->phantom_stride;
>      }
> +    while ( (devfn != pdev->devfn) &&
> +            (PCI_SLOT(devfn) == PCI_SLOT(pdev->devfn)) );
>  
>      return rc;
>  }
> -- 
> 2.34.1
> 

