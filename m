Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2BE74305C
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 00:23:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557173.870281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qF02T-0002nU-KF; Thu, 29 Jun 2023 22:22:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557173.870281; Thu, 29 Jun 2023 22:22:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qF02T-0002lc-Gm; Thu, 29 Jun 2023 22:22:57 +0000
Received: by outflank-mailman (input) for mailman id 557173;
 Thu, 29 Jun 2023 22:22:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qF02S-0002lW-7e
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 22:22:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qF02R-0001E0-Nq; Thu, 29 Jun 2023 22:22:55 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qF02R-00063F-J0; Thu, 29 Jun 2023 22:22:55 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=QA5e9xK9/DB7qxHp6/LH5V/2cjTJgdXvEdqzwDnYNlE=; b=A5Mnd8k/o3DOtfbpCkfWyVA9Hx
	xfXr6SGaf/9GwxbTZOg3FuzrRkWuilsByRXaO4wQvDietPVo2l3aNOSt6e1rLz2nOdsJYYBp6sEJd
	LzFnu6I5QG2wJfsa47D71cZq7mgOby4uO+Od2oOdetkrWP7aAdoFHW0G/zTcw8qg3CGg=;
Message-ID: <78ad0cfd-1046-36b1-ab17-68b5ea29f35c@xen.org>
Date: Thu, 29 Jun 2023 23:22:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Rahul Singh <rahul.singh@arm.com>
References: <20230607030220.22698-1-stewart.hildebrand@amd.com>
 <20230607030220.22698-3-stewart.hildebrand@amd.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v4 2/7] xen/arm: Move is_protected flag to struct device
In-Reply-To: <20230607030220.22698-3-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stewart,

On 07/06/2023 04:02, Stewart Hildebrand wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> This flag will be re-used for PCI devices by the subsequent
> patches.

I was expecting that we would only do PCI passthrough on boards where 
all the PCI devices are behind an IOMMU. So it would be a all or nothing 
and therefore is_protected would not be used.

Do you have an example where this wouldn't be the case?

Regardless that, it would be good to spell out that you also rename 
helpers. But see below.

> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
> v3->v4:
> * move is_protected flag within struct device to reduce padding
> * re-add device_is_protected checks in add_device hooks in smmu-v3.c/ipmmu-vmsa.c
> * split mmu-masters check into separate patch
> 
> v2->v3:
> * no change
> 
> v1->v2:
> * no change
> 
> downstream->v1:
> * rebase
> * s/dev_node->is_protected/dev_node->dev.is_protected/ in smmu.c
> * s/dt_device_set_protected(dev_to_dt(dev))/device_set_protected(dev)/ in smmu-v3.c
> * remove redundant device_is_protected checks in smmu-v3.c/ipmmu-vmsa.c
> 
> (cherry picked from commit 59753aac77528a584d3950936b853ebf264b68e7 from
>   the downstream branch poc/pci-passthrough from
>   https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc.git)
> ---
>   xen/arch/arm/domain_build.c              |  4 ++--
>   xen/arch/arm/include/asm/device.h        | 14 ++++++++++++++
>   xen/common/device_tree.c                 |  2 +-
>   xen/drivers/passthrough/arm/ipmmu-vmsa.c |  4 ++--
>   xen/drivers/passthrough/arm/smmu-v3.c    |  5 +++--
>   xen/drivers/passthrough/arm/smmu.c       |  2 +-
>   xen/drivers/passthrough/device_tree.c    |  8 ++++----
>   xen/include/xen/device_tree.h            | 13 -------------
>   8 files changed, 27 insertions(+), 25 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 3f4558ade67f..b229bfaae712 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2524,7 +2524,7 @@ static int __init handle_device(struct domain *d, struct dt_device_node *dev,
>               return res;
>           }
>   
> -        if ( dt_device_is_protected(dev) )
> +        if ( device_is_protected(dt_to_dev(dev)) )

I would actually prefer if we keep dt_device_is_protected() and call 
device_is_protected(dt_to_dev(...)) within it.

>           {
>               dt_dprintk("%s setup iommu\n", dt_node_full_name(dev));
>               res = iommu_assign_dt_device(d, dev);
> @@ -3024,7 +3024,7 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
>           return res;
>   
>       /* If xen_force, we allow assignment of devices without IOMMU protection. */
> -    if ( xen_force && !dt_device_is_protected(node) )
> +    if ( xen_force && !device_is_protected(dt_to_dev(node)) )
>           return 0;
>   
>       return iommu_assign_dt_device(kinfo->d, node);
> diff --git a/xen/arch/arm/include/asm/device.h b/xen/arch/arm/include/asm/device.h
> index b5d451e08776..8ac807482737 100644
> --- a/xen/arch/arm/include/asm/device.h
> +++ b/xen/arch/arm/include/asm/device.h
> @@ -1,6 +1,8 @@
>   #ifndef __ASM_ARM_DEVICE_H
>   #define __ASM_ARM_DEVICE_H
>   
> +#include <xen/types.h>
> +
>   enum device_type
>   {
>       DEV_DT,
> @@ -15,6 +17,8 @@ struct dev_archdata {
>   struct device
>   {
>       enum device_type type;
> +    bool is_protected; /* Shows that device is protected by IOMMU */
> +    uint8_t _pad[3];

AFAIK, a compiler would be allowed to use 8-byte for the enum. So the 
padding would increase the size of the structure.

Therefore, I don't think you want to add an explicit padding here.

Cheers,

-- 
Julien Grall

