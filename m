Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89727454F8E
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 22:45:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227006.392485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnSkF-0007ze-0J; Wed, 17 Nov 2021 21:45:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227006.392485; Wed, 17 Nov 2021 21:45:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnSkE-0007xF-St; Wed, 17 Nov 2021 21:45:30 +0000
Received: by outflank-mailman (input) for mailman id 227006;
 Wed, 17 Nov 2021 21:45:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mnSkD-0007x9-Ee
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 21:45:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mnSkC-0001QM-Bg; Wed, 17 Nov 2021 21:45:28 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.25.43]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mnSkC-0000tP-3L; Wed, 17 Nov 2021 21:45:28 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=vYOymXebaSd5VmPWEZC/uCACL0l6vZrq2eJyzXp7pxs=; b=nAIrDJZrTlflES8u30AXsbxthm
	l1+N9zThp9d8iBm5OyhhR2EP4Pm8xUItZx/UCH8+5tMGa2bDkaODbNvrkLzNXWm0MVFCR9ha1ehJ9
	P7HI9YaVLAUqTAyi7OUKVfipK969wdJmU9r1rU3X2dwfcxx8qUE2dpZkXLmBDbyBblRU=;
Message-ID: <af9d192c-7445-1378-a81d-17101bad7245@xen.org>
Date: Wed, 17 Nov 2021 21:45:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [PATCH v6 7/7] xen/arm: do not use void pointer in
 pci_host_common_probe
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 jbeulich@suse.com, andrew.cooper3@citrix.com, george.dunlap@citrix.com,
 paul@xen.org, bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
References: <20211105063326.939843-1-andr2000@gmail.com>
 <20211105063326.939843-8-andr2000@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211105063326.939843-8-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 05/11/2021 06:33, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> There is no reason to use void pointer while passing ECAM ops to the
> pci_host_common_probe function as it is anyway casted to struct pci_ecam_ops
> inside. For that reason remove the void pointer and pass struct pci_ecam_ops
> pointer as is.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

I was going to ack and push the patch. But then I couldn't apply the 
patch...

> 
> ---
> New in v4
> ---
>   xen/arch/arm/pci/ecam.c            | 4 ++--
>   xen/arch/arm/pci/pci-host-common.c | 6 ++----
>   xen/include/asm-arm/pci.h          | 5 +++--
>   3 files changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/arch/arm/pci/ecam.c b/xen/arch/arm/pci/ecam.c
> index 4f71b11c3057..6aeea12a68bf 100644
> --- a/xen/arch/arm/pci/ecam.c
> +++ b/xen/arch/arm/pci/ecam.c
> @@ -24,8 +24,8 @@ void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
>                                  pci_sbdf_t sbdf, uint32_t where)
>   {
>       const struct pci_config_window *cfg = bridge->cfg;
> -    struct pci_ecam_ops *ops =
> -        container_of(bridge->ops, struct pci_ecam_ops, pci_ops);
> +    const struct pci_ecam_ops *ops =
> +        container_of(bridge->ops, const struct pci_ecam_ops, pci_ops);
>       unsigned int devfn_shift = ops->bus_shift - 8;
>       void __iomem *base;
>   
> diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
> index 6af845ab9d6c..1aad664b213e 100644
> --- a/xen/arch/arm/pci/pci-host-common.c
> +++ b/xen/arch/arm/pci/pci-host-common.c
> @@ -194,15 +194,13 @@ static int pci_bus_find_domain_nr(struct dt_device_node *dev)
>       return domain;
>   }
>   
> -int pci_host_common_probe(struct dt_device_node *dev, const void *data)
> +int pci_host_common_probe(struct dt_device_node *dev,
> +                          const struct pci_ecam_ops *ops)
>   {
>       struct pci_host_bridge *bridge;
>       struct pci_config_window *cfg;
> -    struct pci_ecam_ops *ops;
>       int err;

... in staging, the code has an two additional lines here:

     if ( dt_device_for_passthrough(dev) )
         return 0;

Is this series relying on patch that are not yet upstreamed?

Cheers,

-- 
Julien Grall

