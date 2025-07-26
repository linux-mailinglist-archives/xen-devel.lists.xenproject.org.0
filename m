Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C84EFB129DB
	for <lists+xen-devel@lfdr.de>; Sat, 26 Jul 2025 11:23:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1059175.1426369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufb7z-0004al-5Y; Sat, 26 Jul 2025 09:23:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1059175.1426369; Sat, 26 Jul 2025 09:23:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufb7z-0004YM-1b; Sat, 26 Jul 2025 09:23:39 +0000
Received: by outflank-mailman (input) for mailman id 1059175;
 Sat, 26 Jul 2025 09:23:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ufb7x-0004XU-HK
 for xen-devel@lists.xenproject.org; Sat, 26 Jul 2025 09:23:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ufb7x-002FBV-0q;
 Sat, 26 Jul 2025 09:23:37 +0000
Received: from [2a02:8012:3a1:0:c403:8a80:39a7:bf21]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ufb7x-00Ca6Y-0L;
 Sat, 26 Jul 2025 09:23:37 +0000
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
	bh=P9sywRYRZxfffPx72FUo6Uhtqnr72bDfANGjGsYtwPs=; b=mhlfK6nBzZ4v6dW5kT8Drp+DZH
	2tIa8SKG3bt31WqU62ZdNBR/VLiJAgsdMZRd7NA/68WD1f5XjXl2Q5V02vKZTau5reMK/PxJymhwR
	Rl005/L2a4SKdMnLgLLgkAEJUjRMdBFo1/eNlDk07ilfOnu3RcA9GzDmuya0gXGZO8hA=;
Message-ID: <02f0d392-c817-4c5a-9b74-6a0f2e6e18ea@xen.org>
Date: Sat, 26 Jul 2025 10:23:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] xen/arm: allow translated iommu mappings
Content-Language: en-GB
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250725140130.4008-1-stewart.hildebrand@amd.com>
 <20250725140130.4008-2-stewart.hildebrand@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250725140130.4008-2-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 25/07/2025 15:01, Stewart Hildebrand wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> In preparation of exposing vITS to domUs, generalize arm_iommu_map_page
> and arm_iommu_unmap_page to allow ITS doorbell mappings with dfn != mfn.
> 
> The mfn does not need to be passed to guest_physmap_remove_page since
> there is no mfn checking on the p2m_iommu_map_{rw,ro} p2m types during
> unmap. Pass INVALID_MFN to guest_physmap_remove_page.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

> ---
> v4->v5:
> * no change
> 
> v3->v4:
> * no change
> 
> v2->v3:
> * split change from ("xen/arm: fix arm_iommu_map_page after f9f6b22ab")
> * both map and unmap
> ---
>   xen/drivers/passthrough/arm/iommu_helpers.c | 11 ++---------
>   1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/arm/iommu_helpers.c b/xen/drivers/passthrough/arm/iommu_helpers.c
> index bdb271584b0d..a3e3cafb8705 100644
> --- a/xen/drivers/passthrough/arm/iommu_helpers.c
> +++ b/xen/drivers/passthrough/arm/iommu_helpers.c
> @@ -36,9 +36,6 @@ int __must_check arm_iommu_map_page(struct domain *d, dfn_t dfn, mfn_t mfn,
>   {
>       p2m_type_t t;
>   
> -    BUG_ON(!domain_use_host_layout(d));
> -    BUG_ON(mfn_x(mfn) != dfn_x(dfn));
> -
>       /* We only support readable and writable flags */
>       if ( !(flags & (IOMMUF_readable | IOMMUF_writable)) )
>           return -EINVAL;
> @@ -49,7 +46,7 @@ int __must_check arm_iommu_map_page(struct domain *d, dfn_t dfn, mfn_t mfn,
>        * The function guest_physmap_add_entry replaces the current mapping
>        * if there is already one...
>        */
> -    return guest_physmap_add_entry(d, _gfn(dfn_x(dfn)), _mfn(dfn_x(dfn)),
> +    return guest_physmap_add_entry(d, _gfn(dfn_x(dfn)), mfn,
>                                      IOMMUF_order(flags), t);
>   }
>   
> @@ -58,11 +55,7 @@ int __must_check arm_iommu_unmap_page(struct domain *d, dfn_t dfn,
>                                         unsigned int order,
>                                         unsigned int *flush_flags)
>   {
> -    if ( !domain_use_host_layout(d) )
> -        return -EINVAL;
> -
> -    return guest_physmap_remove_page(d, _gfn(dfn_x(dfn)), _mfn(dfn_x(dfn)),
> -                                     order);
> +    return guest_physmap_remove_page(d, _gfn(dfn_x(dfn)), INVALID_MFN, order);
>   }
>   
>   /*

-- 
Julien Grall


