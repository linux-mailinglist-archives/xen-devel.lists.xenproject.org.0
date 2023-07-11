Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A2574F469
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jul 2023 18:07:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561813.878365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJFtS-0006bx-1i; Tue, 11 Jul 2023 16:07:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561813.878365; Tue, 11 Jul 2023 16:07:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJFtR-0006ZL-VN; Tue, 11 Jul 2023 16:07:13 +0000
Received: by outflank-mailman (input) for mailman id 561813;
 Tue, 11 Jul 2023 16:07:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qJFtQ-0006ZD-Eo
 for xen-devel@lists.xenproject.org; Tue, 11 Jul 2023 16:07:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qJFtQ-0003qc-7D; Tue, 11 Jul 2023 16:07:12 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=[192.168.8.176]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qJFtQ-0002g0-1u; Tue, 11 Jul 2023 16:07:12 +0000
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
	bh=chJsI1+lhv1ic8+ehGMrs///auMfQgYravMo+4ot6xE=; b=4kEICu7cAsfmi3hJeQ72qjUhb9
	M1+yFj1OewrgQwBAbCOXrOTe8PJkkrUf00uMidq+ihZ5G8+cW4NE0FhGKPhbilZHx4I7LBwucGcZb
	AuFTysctmWQFFPn16xyR8yEwAPL0YGtbQ/RAbCrdwqeSbPuqxMgXlIbK4st3hval5OJk=;
Message-ID: <8bc1ed0e-3ad6-2243-4dd6-a88dd0ee00f8@xen.org>
Date: Tue, 11 Jul 2023 17:07:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 2/2] xen/arm: Account for domU dtb bootmodule size
 separately
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230711082931.5402-1-michal.orzel@amd.com>
 <20230711082931.5402-3-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230711082931.5402-3-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 11/07/2023 09:29, Michal Orzel wrote:
> At the moment, we limit the allocation size when creating a domU dtb to
> 4KB, which is not enough when using a passthrough dtb with several nodes.
> Improve the handling by accounting for a dtb bootmodule (if present)
> size separately, while keeping 4KB for the Xen generated nodes (still
> plenty of space for new nodes). Also, cap the allocation size to 2MB,
> which is the max dtb size allowed.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
> Note for the future:
> As discussed with Julien, really the best way would be to generate dtb directly
> in the guest memory, where no allocation would be necessary. This of course
> requires some rework. The solution in this patch is good enough for now and
> can be treated as an intermediated step to support dtb creation of various
> sizes.

Thanks for summarizing our discussion :).

> ---
>   xen/arch/arm/domain_build.c | 18 +++++++++++++-----
>   1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index f2134f24b971..1dc0eca37bd6 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -3257,14 +3257,15 @@ static int __init domain_handle_dtb_bootmodule(struct domain *d,
>   }
>   
>   /*
> - * The max size for DT is 2MB. However, the generated DT is small, 4KB
> - * are enough for now, but we might have to increase it in the future.
> + * The max size for DT is 2MB. However, the generated DT is small (not including
> + * domU passthrough DT nodes whose size we account separately), 4KB are enough
> + * for now, but we might have to increase it in the future.
>    */
>   #define DOMU_DTB_SIZE 4096
>   static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>   {
>       int addrcells, sizecells;
> -    int ret;
> +    int ret, fdt_size = DOMU_DTB_SIZE;

Can fdt_size be unsigned?

>   
>       kinfo->phandle_gic = GUEST_PHANDLE_GIC;
>       kinfo->gnttab_start = GUEST_GNTTAB_BASE;
> @@ -3273,11 +3274,18 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>       addrcells = GUEST_ROOT_ADDRESS_CELLS;
>       sizecells = GUEST_ROOT_SIZE_CELLS;
>   
> -    kinfo->fdt = xmalloc_bytes(DOMU_DTB_SIZE);
> +    /* Account for domU passthrough DT size */
> +    if ( kinfo->dtb_bootmodule )
> +        fdt_size += kinfo->dtb_bootmodule->size;
> +
> +    /* Cap to max DT size if needed */
> +    fdt_size = min(fdt_size, SZ_2M);
> +
> +    kinfo->fdt = xmalloc_bytes(fdt_size);
>       if ( kinfo->fdt == NULL )
>           return -ENOMEM;
>   
> -    ret = fdt_create(kinfo->fdt, DOMU_DTB_SIZE);
> +    ret = fdt_create(kinfo->fdt, fdt_size);
>       if ( ret < 0 )
>           goto err;
>   

Cheers,

-- 
Julien Grall

