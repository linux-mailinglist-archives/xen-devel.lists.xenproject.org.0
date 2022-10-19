Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E867F603C8D
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 10:48:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425661.673621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol4k1-0002RU-AD; Wed, 19 Oct 2022 08:47:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425661.673621; Wed, 19 Oct 2022 08:47:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol4k1-0002Ob-6w; Wed, 19 Oct 2022 08:47:57 +0000
Received: by outflank-mailman (input) for mailman id 425661;
 Wed, 19 Oct 2022 08:47:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=prF/=2U=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1ol4jz-0002OV-NW
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 08:47:55 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b88473cf-4f8a-11ed-91b4-6bf2151ebd3b;
 Wed, 19 Oct 2022 10:47:54 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id r17so38246671eja.7
 for <xen-devel@lists.xenproject.org>; Wed, 19 Oct 2022 01:47:53 -0700 (PDT)
Received: from [192.168.1.93] (adsl-166.109.242.226.tellas.gr.
 [109.242.226.166]) by smtp.gmail.com with ESMTPSA id
 w22-20020a1709064a1600b0074136cac2e7sm8612834eju.81.2022.10.19.01.47.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 01:47:52 -0700 (PDT)
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
X-Inumbo-ID: b88473cf-4f8a-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fn0vkXWE/OgO7OZyVob5cWSHyej/WCT0UHxy2GYCHp4=;
        b=Emsnh+FxiJ3lB1Xe6RkfRkxIT5iuxz0dU0KsvvWhhFoJmkRj+86tj6eyLfc0o5x2zR
         Xpuxbxf7HoP9+bGmvQxYWvpEGxVNbVLCnXE1HP+p33s8+rA3qo24vH/22w3/GSu7b5pD
         STVQvQWhHnlsIiFFDc9xhSeRbAEoLL2OzSL3rS8+VScQSxYkDqODm7vHSqxM0HQmyKlq
         bjm0VKQgagI3tfSg2gtsPaqNaz+exH3W54JnlW7ImE+hKDU+g3Uumx/3UoG9Dk3+/Zlv
         FcjGrh4j1kuI+DT/Pgv/czMCRFSisMOA2+vZUSX0F5/02CcNsUB3de6hYyivhM3gRmqU
         jxWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fn0vkXWE/OgO7OZyVob5cWSHyej/WCT0UHxy2GYCHp4=;
        b=5rGRWzjGv8v/IAaKNoH3TTH29D7bx31zJ/xwTTQeIeYY1IERCK+2cj/bZ+KMhNN7rd
         I+aRqHGMJV04ZNCKlytWk3xLsiaJ4o3LNYf7C7x9vLEeA6LaTpCFTNsQ4A3csE3Wvw9I
         3px55mKrr7Hhhwx8vHV7CmVfABsmyZJSmoXgd3rxGLXKAN5Xt4+vsID+hutDh7whBTjj
         wlgidV5vQ9TL9Ssj6R04ammQXLDh1IeGpoXDuZ6gE5v9W/1ZIX8yNMqkXCUkNiFfIkcj
         8xX3dYororX3Lc3uMqqfUe8V09DWs/T4+9Rj9/QHSHDDO4qfVMtyoNlxRkVlsFfBeqze
         LPNQ==
X-Gm-Message-State: ACrzQf1dreqhgOJm1feszRmzAZptQAbOfSEc610PiHC0Xcfv37yuWy3u
	daNzMpGdlGTHHLdqgDJBxXY=
X-Google-Smtp-Source: AMsMyM6S7Wg58ZQT0dZSgmjbSrfnEfkfxXF6anbfyb3hyGKS4y6IJYMBCj+vH7GR82tp8p+9wYrxsw==
X-Received: by 2002:a17:907:3e0f:b0:791:9529:3674 with SMTP id hp15-20020a1709073e0f00b0079195293674mr5663556ejc.503.1666169273367;
        Wed, 19 Oct 2022 01:47:53 -0700 (PDT)
Message-ID: <19823a2a-bc84-5458-bb69-7ac0c1b81573@gmail.com>
Date: Wed, 19 Oct 2022 11:47:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V2] xen/virtio: Handle PCI devices which Host controller
 is described in DT
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Juergen Gross <jgross@suse.com>
References: <20221015153409.918775-1-olekstysh@gmail.com>
 <alpine.DEB.2.22.394.2210181734440.4587@ubuntu-linux-20-04-desktop>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2210181734440.4587@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/19/22 03:58, Stefano Stabellini wrote:
> On Sat, 15 Oct 2022, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> Use the same "xen-grant-dma" device concept for the PCI devices
>> behind device-tree based PCI Host controller, but with one modification.
>> Unlike for platform devices, we cannot use generic IOMMU bindings
>> (iommus property), as we need to support more flexible configuration.
>> The problem is that PCI devices under the single PCI Host controller
>> may have the backends running in different Xen domains and thus have
>> different endpoints ID (backend domains ID).
>>
>> So use generic PCI-IOMMU bindings instead (iommu-map/iommu-map-mask
>> properties) which allows us to describe relationship between PCI
>> devices and backend domains ID properly.
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Now that I understood the approach and the reasons for it, I can review
> the patch :-)
> 
> Please add an example of the bindings in the commit message.
> 
> 
>> ---
>> Slightly RFC. This is needed to support Xen grant mappings for virtio-pci devices
>> on Arm at some point in the future. The Xen toolstack side is not completely ready yet.
>> Here, for PCI devices we use more flexible way to pass backend domid to the guest
>> than for platform devices.
>>
>> Changes V1 -> V2:
>>     - update commit description
>>     - rebase
>>     - rework to use generic PCI-IOMMU bindings instead of generic IOMMU bindings
>>
>> Previous discussion is at:
>> https://lore.kernel.org/xen-devel/20221006174804.2003029-1-olekstysh@gmail.com/
>>
>> Based on:
>> https://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git/log/?h=for-linus-6.1
>> ---
>>   drivers/xen/grant-dma-ops.c | 87 ++++++++++++++++++++++++++++++++-----
>>   1 file changed, 76 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
>> index daa525df7bdc..b79d9d6ce154 100644
>> --- a/drivers/xen/grant-dma-ops.c
>> +++ b/drivers/xen/grant-dma-ops.c
>> @@ -10,6 +10,7 @@
>>   #include <linux/module.h>
>>   #include <linux/dma-map-ops.h>
>>   #include <linux/of.h>
>> +#include <linux/pci.h>
>>   #include <linux/pfn.h>
>>   #include <linux/xarray.h>
>>   #include <linux/virtio_anchor.h>
>> @@ -292,12 +293,55 @@ static const struct dma_map_ops xen_grant_dma_ops = {
>>   	.dma_supported = xen_grant_dma_supported,
>>   };
>>   
>> +static struct device_node *xen_dt_get_pci_host_node(struct device *dev)
>> +{
>> +	struct pci_dev *pdev = to_pci_dev(dev);
>> +	struct pci_bus *bus = pdev->bus;
>> +
>> +	/* Walk up to the root bus to look for PCI Host controller */
>> +	while (!pci_is_root_bus(bus))
>> +		bus = bus->parent;
>> +
>> +	return of_node_get(bus->bridge->parent->of_node);
>> +}
> 
> It seems silly that we need to walk the hierachy that way, but I
> couldn't find another way to do it
> 
> 
>> +static struct device_node *xen_dt_get_node(struct device *dev)
>> +{
>> +	if (dev_is_pci(dev))
>> +		return xen_dt_get_pci_host_node(dev);
>> +
>> +	return of_node_get(dev->of_node);
>> +}
>> +
>> +static int xen_dt_map_id(struct device *dev, struct device_node **iommu_np,
>> +			 u32 *sid)
>> +{
>> +	struct pci_dev *pdev = to_pci_dev(dev);
>> +	u32 rid = PCI_DEVID(pdev->bus->number, pdev->devfn);
>> +	struct device_node *host_np;
>> +	int ret;
>> +
>> +	host_np = xen_dt_get_pci_host_node(dev);
>> +	if (!host_np)
>> +		return -ENODEV;
>> +
>> +	ret = of_map_id(host_np, rid, "iommu-map", "iommu-map-mask", iommu_np, sid);
>> +	of_node_put(host_np);
>> +	return ret;
>> +}
>> +
>>   static bool xen_is_dt_grant_dma_device(struct device *dev)
>>   {
>> -	struct device_node *iommu_np;
>> +	struct device_node *iommu_np = NULL;
>>   	bool has_iommu;
>>   
>> -	iommu_np = of_parse_phandle(dev->of_node, "iommus", 0);
>> +	if (dev_is_pci(dev)) {
>> +		if (xen_dt_map_id(dev, &iommu_np, NULL))
>> +			return false;
>> +	} else
>> +		iommu_np = of_parse_phandle(dev->of_node, "iommus", 0);
>> +
>>   	has_iommu = iommu_np &&
>>   		    of_device_is_compatible(iommu_np, "xen,grant-dma");
>>   	of_node_put(iommu_np);
>> @@ -307,9 +351,17 @@ static bool xen_is_dt_grant_dma_device(struct device *dev)
>>   
>>   bool xen_is_grant_dma_device(struct device *dev)
>>   {
>> +	struct device_node *np;
>> +
>>   	/* XXX Handle only DT devices for now */
>> -	if (dev->of_node)
>> -		return xen_is_dt_grant_dma_device(dev);
>> +	np = xen_dt_get_node(dev);
>> +	if (np) {
>> +		bool ret;
>> +
>> +		ret = xen_is_dt_grant_dma_device(dev);
>> +		of_node_put(np);
>> +		return ret;
>> +	}
> 
> We don't need to walk the PCI hierachy twice. Maybe we can add the
> of_node check directly to xen_is_dt_grant_dma_device?
> 

I think in general we could pass directly the host bridge device if 
dev_is_pci(dev) (which can be retrieved with 
pci_get_host_bridge_device(to_pci_dev(dev), and after done with it 
pci_put_host_bridge_device(phb)).
So that, xen_is_dt_grant_dma_device() and 
xen_dt_grant_init_backend_domid() won't need to discover it themselves.
This will simplify the code.

> 
>>   	return false;
>>   }
>> @@ -325,12 +377,19 @@ bool xen_virtio_mem_acc(struct virtio_device *dev)
>>   static int xen_dt_grant_init_backend_domid(struct device *dev,
>>   					   struct xen_grant_dma_data *data)
>>   {
>> -	struct of_phandle_args iommu_spec;
>> +	struct of_phandle_args iommu_spec = { .args_count = 1 };
>>   
>> -	if (of_parse_phandle_with_args(dev->of_node, "iommus", "#iommu-cells",
>> -			0, &iommu_spec)) {
>> -		dev_err(dev, "Cannot parse iommus property\n");
>> -		return -ESRCH;
>> +	if (dev_is_pci(dev)) {
>> +		if (xen_dt_map_id(dev, &iommu_spec.np, iommu_spec.args)) {
>> +			dev_err(dev, "Cannot translate ID\n");
>> +			return -ESRCH;
>> +		}
>> +	} else {
>> +		if (of_parse_phandle_with_args(dev->of_node, "iommus", "#iommu-cells",
>> +				0, &iommu_spec)) {
>> +			dev_err(dev, "Cannot parse iommus property\n");
>> +			return -ESRCH;
>> +		}
>>   	}
>>   
>>   	if (!of_device_is_compatible(iommu_spec.np, "xen,grant-dma") ||
>> @@ -354,6 +413,7 @@ static int xen_dt_grant_init_backend_domid(struct device *dev,
>>   void xen_grant_setup_dma_ops(struct device *dev)
>>   {
>>   	struct xen_grant_dma_data *data;
>> +	struct device_node *np;
>>   
>>   	data = find_xen_grant_dma_data(dev);
>>   	if (data) {
>> @@ -365,8 +425,13 @@ void xen_grant_setup_dma_ops(struct device *dev)
>>   	if (!data)
>>   		goto err;
>>   
>> -	if (dev->of_node) {
>> -		if (xen_dt_grant_init_backend_domid(dev, data))
>> +	np = xen_dt_get_node(dev);
>> +	if (np) {
>> +		int ret;
>> +
>> +		ret = xen_dt_grant_init_backend_domid(dev, data);
>> +		of_node_put(np);
>> +		if (ret)
>>   			goto err;
>>   	} else if (IS_ENABLED(CONFIG_XEN_VIRTIO_FORCE_GRANT)) {
>>   		dev_info(dev, "Using dom0 as backend\n");
>> -- 
>> 2.25.1
>>
> 

-- 
Xenia

