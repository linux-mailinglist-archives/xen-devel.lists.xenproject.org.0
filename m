Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA768C30C4
	for <lists+xen-devel@lfdr.de>; Sat, 11 May 2024 13:04:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720294.1123404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5kVV-0003k2-KL; Sat, 11 May 2024 11:03:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720294.1123404; Sat, 11 May 2024 11:03:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5kVV-0003iV-Fb; Sat, 11 May 2024 11:03:13 +0000
Received: by outflank-mailman (input) for mailman id 720294;
 Sat, 11 May 2024 11:03:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1s5kVU-0003iP-M2
 for xen-devel@lists.xenproject.org; Sat, 11 May 2024 11:03:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s5kVU-0006lh-5y; Sat, 11 May 2024 11:03:12 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s5kVT-0005G7-SP; Sat, 11 May 2024 11:03:11 +0000
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
	bh=IfBIzTlB8gbtJsjuqohges46El9qHcXdYkkiuX1+SAQ=; b=rPYELTDoM39nOWQP+IeMdB12Mh
	Z7/uaGKjwVY2brh8JJTh/BbYalWV1htbJwvyqF0srGBBs9ycE4/ZKrz6XbdnF/9r/54QM4+Rbv7c5
	eSI5eCBLJ5awYREegm8WX1VXUueBLiB+QlM/iqQ63ABZAEYs4tyf8ZLXUWR14yzaGijE=;
Message-ID: <686ba256-f8bf-47e7-872f-d277bf7df0aa@xen.org>
Date: Sat, 11 May 2024 12:03:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] xen/arm: Alloc hypervisor reserved pages as magic
 pages for Dom0less DomUs
Content-Language: en-GB
To: Henry Wang <xin.wang2@amd.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Alec Kwapis <alec.kwapis@medtronic.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>
References: <20240511005611.83125-1-xin.wang2@amd.com>
 <20240511005611.83125-2-xin.wang2@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240511005611.83125-2-xin.wang2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 11/05/2024 01:56, Henry Wang wrote:
> There are use cases (for example using the PV driver) in Dom0less
> setup that require Dom0less DomUs start immediately with Dom0, but
> initialize XenStore later after Dom0's successful boot and call to
> the init-dom0less application.
> 
> An error message can seen from the init-dom0less application on
> 1:1 direct-mapped domains:
> ```
> Allocating magic pages
> memory.c:238:d0v0 mfn 0x39000 doesn't belong to d1
> Error on alloc magic pages
> ```
> 
> The "magic page" is a terminology used in the toolstack as reserved
> pages for the VM to have access to virtual platform capabilities.
> Currently the magic pages for Dom0less DomUs are populated by the
> init-dom0less app through populate_physmap(), and populate_physmap()
> automatically assumes gfn == mfn for 1:1 direct mapped domains. This
> cannot be true for the magic pages that are allocated later from the
> init-dom0less application executed in Dom0. For domain using statically
> allocated memory but not 1:1 direct-mapped, similar error "failed to
> retrieve a reserved page" can be seen as the reserved memory list is
> empty at that time.
> 
> To solve above issue, this commit allocates hypervisor reserved pages
> (currently used as the magic pages) for Arm Dom0less DomUs at the
> domain construction time. The base address/PFN of the region will be
> noted and communicated to the init-dom0less application in Dom0.
> 
> Reported-by: Alec Kwapis <alec.kwapis@medtronic.com>
> Suggested-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Signed-off-by: Henry Wang <xin.wang2@amd.com>
> ---
> v2:
> - Reword the commit msg to explain what is "magic page" and use generic
>    terminology "hypervisor reserved pages" in commit msg. (Daniel)
> - Also move the offset definition of magic pages. (Michal)
> - Extract the magic page allocation logic to a function. (Michal)
> ---
>   tools/libs/guest/xg_dom_arm.c |  6 ------
>   xen/arch/arm/dom0less-build.c | 32 ++++++++++++++++++++++++++++++++
>   xen/include/public/arch-arm.h |  6 ++++++
>   3 files changed, 38 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/libs/guest/xg_dom_arm.c b/tools/libs/guest/xg_dom_arm.c
> index 2fd8ee7ad4..8c579d7576 100644
> --- a/tools/libs/guest/xg_dom_arm.c
> +++ b/tools/libs/guest/xg_dom_arm.c
> @@ -25,12 +25,6 @@
>   
>   #include "xg_private.h"
>   
> -#define NR_MAGIC_PAGES 4
> -#define CONSOLE_PFN_OFFSET 0
> -#define XENSTORE_PFN_OFFSET 1
> -#define MEMACCESS_PFN_OFFSET 2
> -#define VUART_PFN_OFFSET 3
> -
>   #define LPAE_SHIFT 9
>   
>   #define PFN_4K_SHIFT  (0)
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index 74f053c242..4b96ddd9ce 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -739,6 +739,34 @@ static int __init alloc_xenstore_evtchn(struct domain *d)
>       return 0;
>   }
>   
> +static int __init alloc_magic_pages(struct domain *d)
> +{
> +    struct page_info *magic_pg;
> +    mfn_t mfn;
> +    gfn_t gfn;
> +    int rc;
> +
> +    d->max_pages += NR_MAGIC_PAGES;
> +    magic_pg = alloc_domheap_pages(d, get_order_from_pages(NR_MAGIC_PAGES), 0);
> +    if ( magic_pg == NULL )
> +        return -ENOMEM;
> +
> +    mfn = page_to_mfn(magic_pg);
> +    if ( !is_domain_direct_mapped(d) )
> +        gfn = gaddr_to_gfn(GUEST_MAGIC_BASE);
> +    else
> +        gfn = gaddr_to_gfn(mfn_to_maddr(mfn));

Summarizing the discussion we had on Matrix. Regions like the extend 
area and shared memory may not be direct mapped. So unfortunately, I 
think it is possible that the GFN could clash with one of those.

At least in the shared memory case, the user can provide the address. 
But as you use the domheap allocator, the address returned could easily 
change if you tweak your setup.

I am not entirely sure what's the best solution. We could ask the user 
to provide the information for reserved region. But it feels like we are 
exposing a bit too much to the user.

So possibly we would want to use the same approach as extended regions. 
Once we processed all the mappings, find some space for the hypervisor 
regions.

Any other suggestions?

Cheers,

-- 
Julien Grall

