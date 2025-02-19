Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1FFA3BCB7
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 12:26:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892710.1301667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkiD7-0001qM-5W; Wed, 19 Feb 2025 11:25:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892710.1301667; Wed, 19 Feb 2025 11:25:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkiD7-0001o4-2e; Wed, 19 Feb 2025 11:25:49 +0000
Received: by outflank-mailman (input) for mailman id 892710;
 Wed, 19 Feb 2025 11:25:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tkiD5-0001ny-0m
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 11:25:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tkiD4-00Aayd-1e;
 Wed, 19 Feb 2025 11:25:46 +0000
Received: from [15.248.2.31] (helo=[10.24.66.255])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tkiD4-002BVn-03;
 Wed, 19 Feb 2025 11:25:46 +0000
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
	bh=G6gnJDat7OmnClJE5Mu9yCYMPPdUU0uQDFyIpkhCAEc=; b=mXEkUrJz3gV3/pA8dogKspQp1M
	s+p554SJwiNfe2/u4Ocw3EhZLY1QCZEi0RxS7s1NwWQZ8XZsRjm3gu2lZ9M/Xmh10IQnLXwRbHl4Y
	NAG/USRb0QHNgey8LpcErbgYsXaZ6+3bttg0dTevtHrZv3RHsvhYm6OEty3KgRHFKdvM=;
Message-ID: <8f0c8df3-3e6c-40a4-a88e-b81174a170f6@xen.org>
Date: Wed, 19 Feb 2025 11:25:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/arm: fix iomem permissions cfg in
 map_range_to_domain()
Content-Language: en-GB
To: Grygorii Strashko <gragst.linux@gmail.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
References: <20250218112253.3136505-1-grygorii_strashko@epam.com>
 <20250218112253.3136505-2-grygorii_strashko@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250218112253.3136505-2-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Grygorii,

On 18/02/2025 11:22, Grygorii Strashko wrote:
> Now the following code in map_range_to_domain()
> 
>      res = iomem_permit_access(d, paddr_to_pfn(addr),
>                      paddr_to_pfn(PAGE_ALIGN(addr + len - 1)));
> 
> calculates the iomem range end address by rounding it up to the next Xen
> page with incorrect assumption that iomem range end address passed to
> iomem_permit_access() is exclusive, while it is expected to be inclusive.
> It gives Control domain (Dom0) access to manage incorrect MMIO range with
> one additional page.
> 
> For example, if requested range is [00e6140000:00e6141004] then it expected
> to add [e6140:e6141] range (num_pages=2) to the domain iomem_caps rangeset,
> but will add [e6140:e6142] (num_pages=3) instead.
> 
> To fix it, drop PAGE_ALIGN() from the iomem range end address calculation
> formula.
> 
> Fixes: 33233c2758345 ("arch/arm: domain build: let dom0 access I/O memory
> of mapped devices")
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
>   xen/arch/arm/device.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
> index 5610cddcba8e..97e613e06afa 100644
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

-- 
Julien Grall


