Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D5E8C3041
	for <lists+xen-devel@lfdr.de>; Sat, 11 May 2024 10:46:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720250.1123339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5iMx-0006bq-0Y; Sat, 11 May 2024 08:46:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720250.1123339; Sat, 11 May 2024 08:46:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5iMw-0006Zp-TR; Sat, 11 May 2024 08:46:14 +0000
Received: by outflank-mailman (input) for mailman id 720250;
 Sat, 11 May 2024 08:46:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1s5iMv-0006Zj-Rv
 for xen-devel@lists.xenproject.org; Sat, 11 May 2024 08:46:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s5iMv-0003lX-0q; Sat, 11 May 2024 08:46:13 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s5iMu-0005mi-PM; Sat, 11 May 2024 08:46:12 +0000
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
	bh=XORHB6a8m1colt+QcM1Vrsw78pratXVMJJzEBgQqzjk=; b=4cPPsVHZJsyz3Hq62YaF0HfMKr
	mMJ5iMG7P5ZyLSV29jtX2mpkEO+bT1PS81xgnXX8iVlVD+vqMyd5YafFbAGViQvwhLPd9Txbw49qf
	aeZ+K6TLA7X9MGJmDJv0JKA3jWV8Mi0ytljVkjMES9meiUHB/FUzzuxOJzuilXeNP6wE=;
Message-ID: <37ee9f1f-0d62-4d88-9507-2906c3149bba@xen.org>
Date: Sat, 11 May 2024 09:46:10 +0100
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

Here you bump d->max_mages by NR_MAGIC_PAGES but...

> +    magic_pg = alloc_domheap_pages(d, get_order_from_pages(NR_MAGIC_PAGES), 0);

... here you will allocate using a power-of-two. Which may end up to 
fail as there is nothing guaranteeing that NR_MAGIC_PAGES is suitably 
aligned.

For now NR_MAGIC_PAGES seems suitably aligned, so it BUILD_BUG_ON() 
woudl be ok.


> +    if ( magic_pg == NULL )
> +        return -ENOMEM;
> +
> +    mfn = page_to_mfn(magic_pg);
> +    if ( !is_domain_direct_mapped(d) )
> +        gfn = gaddr_to_gfn(GUEST_MAGIC_BASE);
> +    else
> +        gfn = gaddr_to_gfn(mfn_to_maddr(mfn));

Allocating the magic pages contiguously is only necessary for direct 
mapped domain. For the other it might be preferable to allocate page by 
page. That said, NR_MAGIC_PAGES is not big enough. So it would be okay.

> +
> +    rc = guest_physmap_add_pages(d, gfn, mfn, NR_MAGIC_PAGES);
> +    if ( rc )
> +    {
> +        free_domheap_pages(magic_pg, get_order_from_pages(NR_MAGIC_PAGES));
> +        return rc;
> +    }
> +
> +    return 0;
> +}
> +
>   static int __init construct_domU(struct domain *d,
>                                    const struct dt_device_node *node)
>   {
> @@ -840,6 +868,10 @@ static int __init construct_domU(struct domain *d,
>           if ( rc < 0 )
>               return rc;
>           d->arch.hvm.params[HVM_PARAM_STORE_PFN] = ~0ULL;
> +
> +        rc = alloc_magic_pages(d);
> +        if ( rc < 0 )
> +            return rc;

This will only be allocated xenstore is enabled. But I don't think some 
of the magic pages really require xenstore to work. In the future we may 
need some more fine graine choice (see my comment in patch #2 as well).

>       }
>   
>       return rc;
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index 289af81bd6..186520d01f 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -476,6 +476,12 @@ typedef uint64_t xen_callback_t;
>   #define GUEST_MAGIC_BASE  xen_mk_ullong(0x39000000)
>   #define GUEST_MAGIC_SIZE  xen_mk_ullong(0x01000000)
>   
> +#define NR_MAGIC_PAGES 4
This name and the other below are far too generic to be part of the 
shared header. For NR_MAGIC_PAGES, can you explain why GUEST_MAGIC_SIZE 
cannot be used? Is it because it is "too" big?

For the rest below...

> +#define CONSOLE_PFN_OFFSET 0
> +#define XENSTORE_PFN_OFFSET 1
> +#define MEMACCESS_PFN_OFFSET 2
> +#define VUART_PFN_OFFSET 3

... the order we allocate the magic pages is purely an internal decision 
of the toolstack. For the rest of the system, they need to access 
HVM_PARAM_*. So it doesn't feel like they should be part of the shared 
headers.

If there is a strong reason to include them, then I think they all 
should be prefixed with GUEST_MAGIC_*.

Cheers,

> +
>   #define GUEST_RAM_BANKS   2
>   
>   /*

-- 
Julien Grall

