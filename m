Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77832CA1A1C
	for <lists+xen-devel@lfdr.de>; Wed, 03 Dec 2025 22:10:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1177136.1501531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQu7U-0008MV-R2; Wed, 03 Dec 2025 21:10:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1177136.1501531; Wed, 03 Dec 2025 21:10:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQu7U-0008KG-OP; Wed, 03 Dec 2025 21:10:40 +0000
Received: by outflank-mailman (input) for mailman id 1177136;
 Wed, 03 Dec 2025 21:10:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vQu7T-0008KA-Mf
 for xen-devel@lists.xenproject.org; Wed, 03 Dec 2025 21:10:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vQu7T-0050oW-0W;
 Wed, 03 Dec 2025 21:10:39 +0000
Received: from [2a02:8012:3a1:0:a90a:e0da:b0b5:e466]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vQu7S-00Bvm9-1f;
 Wed, 03 Dec 2025 21:10:39 +0000
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
	bh=T2qSEDOYO4OtxDEa2Qs9O+9WMHizUhUsD/iN7ViM070=; b=OvOL5krpEnge2CffM9YYHJMIrX
	bFwt3wiUS6gdrJHkYrnfGaB3lA0GD5uOBsRdh1PQAFCTxxo2Kq1O5hVx5gQ+cyZFUz07yRbDILmOd
	GeI6MHZDDiIdAoOW5id1zBYKISV5Azgd9r1OM37r2KDhHc3obBva3yvsMeVZXr2ueJcc=;
Message-ID: <6e83d3bc-c49c-49f4-9dbd-e994e53a62a7@xen.org>
Date: Wed, 3 Dec 2025 21:10:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] xen/dom0less: Calculate guest DTB size based on
 MAX_VIRT_CPUS
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <20251203185817.3722903-1-oleksandr_tyshchenko@epam.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <20251203185817.3722903-1-oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 03/12/2025 18:58, Oleksandr Tyshchenko wrote:
> Creating a dom0less guest with a high vCPU count (e.g., >32) fails
> because the fixed 4KiB device tree buffer (DOMU_DTB_SIZE) overflows
> during creation.
> 
> The FDT nodes for each vCPU are the primary consumer of space,
> and the previous fixed-size buffer was insufficient.
> 
> This patch replaces the fixed size with a formula that calculates
> the required buffer size based on a fixed baseline plus a scalable
> portion for each potential vCPU up to the MAX_VIRT_CPUS limit.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
> V1: https://patchew.org/Xen/20251202193246.3357821-1-oleksandr._5Ftyshchenko@epam.com/
> 
>    V2:
>     - update commit subj/desc
>     - use a formula that accounts MAX_VIRT_CPUS
>     - add BUILD_BUG_ON
> ---
> ---
>   xen/common/device-tree/dom0less-build.c | 16 +++++++++++++---
>   1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
> index 3f5b987ed8..38a5830813 100644
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -461,15 +461,25 @@ static int __init domain_handle_dtb_boot_module(struct domain *d,
>   
>   /*
>    * The max size for DT is 2MB. However, the generated DT is small (not including
> - * domU passthrough DT nodes whose size we account separately), 4KB are enough
> - * for now, but we might have to increase it in the future.
> + * domU passthrough DT nodes whose size we account separately). The size is
> + * calculated from a fixed baseline plus a scalable portion for each potential
> + * vCPU node up to the system limit (MAX_VIRT_CPUS), as the vCPU nodes are
> + * the primary consumer of space.
> + *
> + * The baseline of 2KiB is a safe buffer for all non-vCPU FDT content.

What if the use decides to pass a DTB fragment? How do we know this will 
fit in the 2KiB?

> + * Empirical testing with the maximum number of other device tree nodes shows
> + * a final compacted base size of ~1.5KiB. The 128 bytes per vCPU is derived
> + * from a worst-case analysis of the FDT construction-time size for a single
> + * vCPU node.

For in-code documentation, this is ok to just provide some numbers. But 
this needs a bit more details in the commit message with the exact tests 
you did. This would be helpful if we ever need to change the size (for 
instance we could have extra emulated devices or we need another 
property per CPU).

>    */
> -#define DOMU_DTB_SIZE 4096
> +#define DOMU_DTB_SIZE (2048 + (MAX_VIRT_CPUS * 128))

On Arm32, MAX_VIRT_CPUS is 8. This means the new DOMU_DTB_SIZE is going 
to be smaller than 4096. Why is it ok?

>   static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>   {
>       int addrcells, sizecells;
>       int ret, fdt_size = DOMU_DTB_SIZE;
>   
> +    BUILD_BUG_ON(DOMU_DTB_SIZE > SZ_2M);
> +
>       kinfo->phandle_intc = GUEST_PHANDLE_GIC;
>   
>   #ifdef CONFIG_GRANT_TABLE

Cheers,

-- 
Julien Grall


