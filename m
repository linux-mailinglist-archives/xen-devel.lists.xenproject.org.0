Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 870A460D270
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 19:28:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430022.681464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onNif-0003IB-4A; Tue, 25 Oct 2022 17:28:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430022.681464; Tue, 25 Oct 2022 17:28:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onNif-0003FB-1F; Tue, 25 Oct 2022 17:28:05 +0000
Received: by outflank-mailman (input) for mailman id 430022;
 Tue, 25 Oct 2022 17:28:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tfwf=22=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1onNid-0002vV-Vz
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 17:28:04 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60de776f-548a-11ed-8fd0-01056ac49cbb;
 Tue, 25 Oct 2022 19:28:02 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id k2so14484492ejr.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Oct 2022 10:28:02 -0700 (PDT)
Received: from [192.168.1.93] (adsl-115.176.58.194.tellas.gr. [176.58.194.115])
 by smtp.gmail.com with ESMTPSA id
 e21-20020a1709062c1500b00781be3e7badsm1710130ejh.53.2022.10.25.10.28.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Oct 2022 10:28:01 -0700 (PDT)
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
X-Inumbo-ID: 60de776f-548a-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ziuf2jyNnaY2nR2BxTPSYAC/kOKBbzM+LbjynCTvGnw=;
        b=WOb04wmiMsoRXeMJK7qNQY9vqZjXsmoXyHiXDUYW3i4CzzBvBkbvE6SOO0GICxsLRg
         H+1DZy1EbBh7b1EW0AL/0MOCuQ5mQRwYvwx2SEXjP7fmPsiTMaKMb3dXnfrOXHM8ezU+
         0FAxOlR++eDmkdOwL4XuFu8jTXgZGeIv2BtPfVTF+AgplV39pW06tvI+5AUi+JxofhZD
         LoxaCMRRAxeqpASp5iaMDdSvDktD0AQolXczSZEszz7zibpCzj8HKstEoUBsmF94xFKc
         O3EEVEZNsDBJ5WHNYSYcAXyEIjA4KJgoTW5+fn4g+eHC3HPvXftYBGoYYebBmcI80wRB
         nc8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ziuf2jyNnaY2nR2BxTPSYAC/kOKBbzM+LbjynCTvGnw=;
        b=QA209M68/HZnjX/z0o52m4Yt6GLlrh0x0na/430G9DU1j9SSKg9yjE6jEej20zOts/
         wbId3DgD53zf+OSum8iOF1w9R8p0YiLZel3F0s18WleyVFKEcFhsEizlcfKO+x7Mknjc
         cq93GU1ogXoruZ2fo/TsPR36G+BsyeVCYdKBNp2FP6zTcA4XfJ9N7M9n3PLwmHZtsHrX
         sx4DiV3Xw+Qd1r5hedJdelVuPnMw/oKpuv+soqRO0rleNRE5xYg+fJZABvNHJKpoCLwN
         RCSjD3ynhnWuV05IhAWiuWA6HvNsBSCSI800KFDoEFCoVuMxt/ooIUi3HcJ+8TJa73iB
         qIUg==
X-Gm-Message-State: ACrzQf3VCg6xs3/kMOMiEZ5P4Hjed9t2aFsKyscyBkGiUolLWWW053Eq
	F4ggdOtUU+qB1hAfE52DelU=
X-Google-Smtp-Source: AMsMyM5Iz0hrSojDyqGBVVNearrPqTp8MX/J5TDLcFFXl1GUjqyS6ripVIfRo+/CIaiC6ASc8/AGbg==
X-Received: by 2002:a17:906:4786:b0:78d:b793:5bf6 with SMTP id cw6-20020a170906478600b0078db7935bf6mr34119042ejc.222.1666718882263;
        Tue, 25 Oct 2022 10:28:02 -0700 (PDT)
Message-ID: <03fdb0f3-614c-5ee7-592e-25facbc2344f@gmail.com>
Date: Tue, 25 Oct 2022 20:28:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V4 2/2] xen/virtio: Handle PCI devices which Host
 controller is described in DT
Content-Language: en-US
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>
References: <20221025162004.8501-1-olekstysh@gmail.com>
 <20221025162004.8501-3-olekstysh@gmail.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <20221025162004.8501-3-olekstysh@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/25/22 19:20, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Use the same "xen-grant-dma" device concept for the PCI devices
> behind device-tree based PCI Host controller, but with one modification.
> Unlike for platform devices, we cannot use generic IOMMU bindings
> (iommus property), as we need to support more flexible configuration.
> The problem is that PCI devices under the single PCI Host controller
> may have the backends running in different Xen domains and thus have
> different endpoints ID (backend domains ID).
> 
> Add ability to deal with generic PCI-IOMMU bindings (iommu-map/
> iommu-map-mask properties) which allows us to describe relationship
> between PCI devices and backend domains ID properly.
> 
> To avoid having to look up for the PCI Host bridge twice and reduce
> the amount of checks pass an extra struct device_node *np to
> xen_dt_grant_init_backend_domid().
> 
> So with current patch the code expects iommus property for the platform
> devices and iommu-map/iommu-map-mask properties for PCI devices.
> 
> The example of generated by the toolstack iommu-map property
> for two PCI devices 0000:00:01.0 and 0000:00:02.0 whose
> backends are running in different Xen domains with IDs 1 and 2
> respectively:
> iommu-map = <0x08 0xfde9 0x01 0x08 0x10 0xfde9 0x02 0x08>;
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Reviewed-by: Xenia Ragiadakou <burzalodowa@gmail.com>

> ---
> Slightly RFC. This is needed to support Xen grant mappings for virtio-pci devices
> on Arm at some point in the future. The Xen toolstack side is not completely ready yet.
> Here, for PCI devices we use more flexible way to pass backend domid to the guest
> than for platform devices.
> 
> Changes V1 -> V2:
>     - update commit description
>     - rebase
>     - rework to use generic PCI-IOMMU bindings instead of generic IOMMU bindings
> 
> Changes V2 -> V3:
>     - update commit description, add an example
>     - drop xen_dt_map_id() and squash xen_dt_get_pci_host_node() with
>       xen_dt_get_node()
>     - pass struct device_node *np to xen_is_dt_grant_dma_device() and
>       xen_dt_grant_init_backend_domid()
>     - pass domid_t *backend_domid instead of struct xen_grant_dma_data *data
>       to xen_dt_grant_init_backend_domid()
> 
> Changes V3 -> V4:
>     - just rebase on new prereq patch
>       "xen/virtio: Optimize the setup of "xen-grant-dma" devices"
> 
> Previous discussion is at:
> https://lore.kernel.org/xen-devel/20221006174804.2003029-1-olekstysh@gmail.com/
> https://lore.kernel.org/xen-devel/20221015153409.918775-1-olekstysh@gmail.com/
> https://lore.kernel.org/xen-devel/20221021172408.77397-1-olekstysh@gmail.com/
> 
> Based on:
> https://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git/log/?h=for-linus-6.1
> ---
> ---
>   drivers/xen/grant-dma-ops.c | 46 +++++++++++++++++++++++++++++++------
>   1 file changed, 39 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
> index 1e797a043980..9784a77fa3c9 100644
> --- a/drivers/xen/grant-dma-ops.c
> +++ b/drivers/xen/grant-dma-ops.c
> @@ -10,6 +10,7 @@
>   #include <linux/module.h>
>   #include <linux/dma-map-ops.h>
>   #include <linux/of.h>
> +#include <linux/pci.h>
>   #include <linux/pfn.h>
>   #include <linux/xarray.h>
>   #include <linux/virtio_anchor.h>
> @@ -292,15 +293,43 @@ static const struct dma_map_ops xen_grant_dma_ops = {
>   	.dma_supported = xen_grant_dma_supported,
>   };
>   
> +static struct device_node *xen_dt_get_node(struct device *dev)
> +{
> +	if (dev_is_pci(dev)) {
> +		struct pci_dev *pdev = to_pci_dev(dev);
> +		struct pci_bus *bus = pdev->bus;
> +
> +		/* Walk up to the root bus to look for PCI Host controller */
> +		while (!pci_is_root_bus(bus))
> +			bus = bus->parent;
> +
> +		return of_node_get(bus->bridge->parent->of_node);
> +	}
> +
> +	return of_node_get(dev->of_node);
> +}
> +
>   static int xen_dt_grant_init_backend_domid(struct device *dev,
> +					   struct device_node *np,
>   					   domid_t *backend_domid)
>   {
> -	struct of_phandle_args iommu_spec;
> +	struct of_phandle_args iommu_spec = { .args_count = 1 };
>   
> -	if (of_parse_phandle_with_args(dev->of_node, "iommus", "#iommu-cells",
> -			0, &iommu_spec)) {
> -		dev_dbg(dev, "Cannot parse iommus property\n");
> -		return -ESRCH;
> +	if (dev_is_pci(dev)) {
> +		struct pci_dev *pdev = to_pci_dev(dev);
> +		u32 rid = PCI_DEVID(pdev->bus->number, pdev->devfn);
> +
> +		if (of_map_id(np, rid, "iommu-map", "iommu-map-mask", &iommu_spec.np,
> +				iommu_spec.args)) {
> +			dev_dbg(dev, "Cannot translate ID\n");
> +			return -ESRCH;
> +		}
> +	} else {
> +		if (of_parse_phandle_with_args(np, "iommus", "#iommu-cells",
> +				0, &iommu_spec)) {
> +			dev_dbg(dev, "Cannot parse iommus property\n");
> +			return -ESRCH;
> +		}
>   	}
>   
>   	if (!of_device_is_compatible(iommu_spec.np, "xen,grant-dma") ||
> @@ -324,10 +353,13 @@ static int xen_dt_grant_init_backend_domid(struct device *dev,
>   static int xen_grant_init_backend_domid(struct device *dev,
>   					domid_t *backend_domid)
>   {
> +	struct device_node *np;
>   	int ret = -ENODEV;
>   
> -	if (dev->of_node) {
> -		ret = xen_dt_grant_init_backend_domid(dev, backend_domid);
> +	np = xen_dt_get_node(dev);
> +	if (np) {
> +		ret = xen_dt_grant_init_backend_domid(dev, np, backend_domid);
> +		of_node_put(np);
>   	} else if (IS_ENABLED(CONFIG_XEN_VIRTIO_FORCE_GRANT) || xen_pv_domain()) {
>   		dev_info(dev, "Using dom0 as backend\n");
>   		*backend_domid = 0;

-- 
Xenia

