Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA41EA35E89
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 14:15:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888824.1298108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tivXO-0006lk-Rx; Fri, 14 Feb 2025 13:15:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888824.1298108; Fri, 14 Feb 2025 13:15:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tivXO-0006js-PD; Fri, 14 Feb 2025 13:15:22 +0000
Received: by outflank-mailman (input) for mailman id 888824;
 Fri, 14 Feb 2025 13:15:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tivXN-0006jm-8V
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 13:15:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tivXN-001BJQ-0B;
 Fri, 14 Feb 2025 13:15:20 +0000
Received: from [2a02:8012:3a1:0:c076:8426:eb1f:4b85]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tivXM-00GSc9-1n;
 Fri, 14 Feb 2025 13:15:20 +0000
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
	bh=pXY5IxDS9uadTM+zL1OnyVbgO5ESfdk5m87y4N5a7y4=; b=G68sp52Y1iPsPMS9dvHKJKefue
	CP9+oJX3CpI/Ezsifxt2MzYOpF1XcJ2BB4wluduNJl1WGVCnd5Bvm3PerLBJ3N2WXK6t2V9g7iYcc
	V0dL6cVtFG4u1LYUjOC11nL8H5yi4+O94f6ubnGOCVd+jW0exz4bT+qVy4QN+2gjs8fo=;
Message-ID: <deb84d7f-d335-4976-9f5f-6a5fa74b386e@xen.org>
Date: Fri, 14 Feb 2025 13:15:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: fix iomem_ranges cfg in map_range_to_domain()
Content-Language: en-GB
To: Grygorii Strashko <gragst.linux@gmail.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
References: <20250214125505.2862809-1-grygorii_strashko@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250214125505.2862809-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 14/02/2025 12:55, Grygorii Strashko wrote:
> Now the following code in map_range_to_domain()
> 
> res = iomem_permit_access(d, paddr_to_pfn(addr),
>                  paddr_to_pfn(PAGE_ALIGN(addr + len - 1)));
> 
> and
> 
> res = rangeset_add_range(mr_data->iomem_ranges,
>                           paddr_to_pfn(addr),
>                           paddr_to_pfn_aligned(addr + len - 1));
 > > will incorrectly calculate end address of the iomem_range by 
rounding it up
> to the next Xen page, which in turn will give Control domain access to
> manage incorrect MMIO range.

I think the key point that needs to be spelled out is that both 
functions are expecting "end" to be inclusive. Whereas the code is 
thinking that the end should be exclusive. This is a very common error 
in Xen and why I have been advocating several times to switch to use
"start, nr" rather than "start, end".

> 
> For example, requested range:
>    00e6140000 - 00e6141004 should set e6140:e6141 nr=2, but will configure
> e6140 e6142 nr=3 instead.

I am not sure what 'nr' is referring to here.

Also, with the range you provide above, it means that you will still 
give access to more than necessary. That's because you give access to 
the full page but only the first four bytes are valid. Is this intended?

> 
> Note. paddr_to_pfn_aligned() has PAGE_ALIGN() inside.
> 
> Fix it, by using paddr_to_pfn(addr + len - 1) in both places to get correct
> end address of the iomem_range.
 > > Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>

I think this wants to have a fixes tag and possibly split in two because 
I suspect we may need to backport the changes to different versions.

> ---
> 
> Hi All,
> 
> I have a question - the paddr_to_pfn_aligned() is not used any more,
> should I remove it as part of this patch?

I would keep it. It might be used in the future.

> 
>   xen/arch/arm/device.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
> index 5610cddcba8e..5e1c1cc326ac 100644
> --- a/xen/arch/arm/device.c
> +++ b/xen/arch/arm/device.c
> @@ -71,7 +71,7 @@ int map_range_to_domain(const struct dt_device_node *dev,
>                        strlen("/reserved-memory/")) != 0 )
>       {
>           res = iomem_permit_access(d, paddr_to_pfn(addr),
> -                paddr_to_pfn(PAGE_ALIGN(addr + len - 1)));
> +                                  paddr_to_pfn(addr + len - 1));
>           if ( res )
>           {
>               printk(XENLOG_ERR "Unable to permit to dom%d access to"
> @@ -107,7 +107,7 @@ int map_range_to_domain(const struct dt_device_node *dev,
>       {
>           res = rangeset_add_range(mr_data->iomem_ranges,
>                                    paddr_to_pfn(addr),
> -                                 paddr_to_pfn_aligned(addr + len - 1));
> +                                 paddr_to_pfn(addr + len - 1));
>           if ( res )
>               return res;
>       }

Cheers,

-- 
Julien Grall


