Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E09F8CEC97
	for <lists+xen-devel@lfdr.de>; Sat, 25 May 2024 01:06:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730007.1135372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAdzk-0001Vw-33; Fri, 24 May 2024 23:06:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730007.1135372; Fri, 24 May 2024 23:06:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAdzk-0001UJ-0D; Fri, 24 May 2024 23:06:40 +0000
Received: by outflank-mailman (input) for mailman id 730007;
 Fri, 24 May 2024 23:06:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sAdzi-0001UD-A2
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 23:06:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sAdzh-0003po-PT; Fri, 24 May 2024 23:06:37 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sAdzh-0003ys-JQ; Fri, 24 May 2024 23:06:37 +0000
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
	bh=GMaAu7+p3av2dZWMaIa3mSBAbBCabMdwFqvx2RFKTzc=; b=uYKRMJKUiLNMqJUaXt8o94mYv+
	FtiPken7mVIzeUcRDTDx5tMWvhO3nYjNu4FzJKNbjtxxyVUk0rC22JlSkBsT1+9xoCAHbj9DvrSFM
	oHze7jjE7t7qGphvLDXQEukIqN/wFEU6XKFWMQpF7J2CFoW4OZhGfA5weBtaD6xAdNvU=;
Message-ID: <697aadfd-a8c1-4f1b-8806-6a5acbf343ba@xen.org>
Date: Sat, 25 May 2024 00:06:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] xen/arm: Alloc XenStore page for Dom0less DomUs
 from hypervisor
Content-Language: en-GB
To: Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, bertrand.marquis@arm.com, michal.orzel@amd.com,
 Volodymyr_Babchuk@epam.com, Henry Wang <xin.wang2@amd.com>,
 Alec Kwapis <alec.kwapis@medtronic.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Oleksii <oleksii.kurochko@gmail.com>
References: <alpine.DEB.2.22.394.2405241552240.2557291@ubuntu-linux-20-04-desktop>
 <20240524225522.2878481-2-stefano.stabellini@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240524225522.2878481-2-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

You have sent a new version. But you didn't reply to Juergen's comment.

While he is not the maintainer of the Arm code, he is the Xenstore 
maintainer. Even if I agree with this approach I don't feel this is 
right to even ack this patch without pending questions addressed.

In this case, we are changing yet another time the sequence for 
initializing Xenstore dom0less domain. I would rather not want to have 
to change a 4th time...

I don't think it is a big problem if this is not merged for the code 
freeze as this is technically a bug fix.

Cheers,

On 24/05/2024 23:55, Stefano Stabellini wrote:
> From: Henry Wang <xin.wang2@amd.com>
> 
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
> Since for init-dom0less, the magic page region is only for XenStore.
> To solve above issue, this commit allocates the XenStore page for
> Dom0less DomUs at the domain construction time. The PFN will be
> noted and communicated to the init-dom0less application executed
> from Dom0. To keep the XenStore late init protocol, set the connection
> status to XENSTORE_RECONNECT.
> 
> Reported-by: Alec Kwapis <alec.kwapis@medtronic.com>
> Suggested-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Signed-off-by: Henry Wang <xin.wang2@amd.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
>   xen/arch/arm/dom0less-build.c | 55 ++++++++++++++++++++++++++++++++++-
>   1 file changed, 54 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index 74f053c242..2963ecc0b3 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -1,5 +1,6 @@
>   /* SPDX-License-Identifier: GPL-2.0-only */
>   #include <xen/device_tree.h>
> +#include <xen/domain_page.h>
>   #include <xen/err.h>
>   #include <xen/event.h>
>   #include <xen/grant_table.h>
> @@ -10,6 +11,8 @@
>   #include <xen/sizes.h>
>   #include <xen/vmap.h>
>   
> +#include <public/io/xs_wire.h>
> +
>   #include <asm/arm64/sve.h>
>   #include <asm/dom0less-build.h>
>   #include <asm/domain_build.h>
> @@ -739,6 +742,53 @@ static int __init alloc_xenstore_evtchn(struct domain *d)
>       return 0;
>   }
>   
> +#define XENSTORE_PFN_OFFSET 1
> +static int __init alloc_xenstore_page(struct domain *d)
> +{
> +    struct page_info *xenstore_pg;
> +    struct xenstore_domain_interface *interface;
> +    mfn_t mfn;
> +    gfn_t gfn;
> +    int rc;
> +
> +    if ( (UINT_MAX - d->max_pages) < 1 )
> +    {
> +        printk(XENLOG_ERR "%pd: Over-allocation for d->max_pages by 1 page.\n",
> +               d);
> +        return -EINVAL;
> +    }
> +    d->max_pages += 1;
> +    xenstore_pg = alloc_domheap_page(d, MEMF_bits(32));
> +    if ( xenstore_pg == NULL && is_64bit_domain(d) )
> +        xenstore_pg = alloc_domheap_page(d, 0);
> +    if ( xenstore_pg == NULL )
> +        return -ENOMEM;
> +
> +    mfn = page_to_mfn(xenstore_pg);
> +    if ( !mfn_x(mfn) )
> +        return -ENOMEM;
> +
> +    if ( !is_domain_direct_mapped(d) )
> +        gfn = gaddr_to_gfn(GUEST_MAGIC_BASE +
> +                           (XENSTORE_PFN_OFFSET << PAGE_SHIFT));
> +    else
> +        gfn = gaddr_to_gfn(mfn_to_maddr(mfn));
> +
> +    rc = guest_physmap_add_page(d, gfn, mfn, 0);
> +    if ( rc )
> +    {
> +        free_domheap_page(xenstore_pg);
> +        return rc;
> +    }
> +
> +    d->arch.hvm.params[HVM_PARAM_STORE_PFN] = gfn_x(gfn);
> +    interface = map_domain_page(mfn);
> +    interface->connection = XENSTORE_RECONNECT;
> +    unmap_domain_page(interface);
> +
> +    return 0;
> +}
> +
>   static int __init construct_domU(struct domain *d,
>                                    const struct dt_device_node *node)
>   {
> @@ -839,7 +889,10 @@ static int __init construct_domU(struct domain *d,
>           rc = alloc_xenstore_evtchn(d);
>           if ( rc < 0 )
>               return rc;
> -        d->arch.hvm.params[HVM_PARAM_STORE_PFN] = ~0ULL;
> +
> +        rc = alloc_xenstore_page(d);
> +        if ( rc < 0 )
> +            return rc;
>       }
>   
>       return rc;

-- 
Julien Grall

