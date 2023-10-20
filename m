Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6467D14D5
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 19:26:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619895.965712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qttFy-00057N-EP; Fri, 20 Oct 2023 17:25:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619895.965712; Fri, 20 Oct 2023 17:25:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qttFy-00055E-Bd; Fri, 20 Oct 2023 17:25:54 +0000
Received: by outflank-mailman (input) for mailman id 619895;
 Fri, 20 Oct 2023 17:25:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qttFw-000558-Lh
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 17:25:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qttFv-0000gw-Nw; Fri, 20 Oct 2023 17:25:51 +0000
Received: from [54.239.6.188] (helo=[192.168.205.12])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qttFv-0004bT-Ew; Fri, 20 Oct 2023 17:25:51 +0000
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
	bh=xIOT9wHwoySGXKL3f3K4qMKlJir9SvvlZge57FCtzVo=; b=4L1cqjPcdYd3JJrZPgGvWRtP/0
	f7iJoVd7xL1dQ0S6pkWtGFItdn99YhyJEt/gXFp4Sth14K1IEI8XoszF8/lK/Al+J3vuqeXxTOW9c
	DVhRPyTNswkTXVTThd7+2zyr7UakldMkOt1SCIqluIl+f2xG2CuyprI1E9oSA045aOIw=;
Message-ID: <5f69d9de-23af-429f-afa5-4623bedbb3ed@xen.org>
Date: Fri, 20 Oct 2023 18:25:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] xen/arm: pci: plumb xen_arch_domainconfig with pci
 info
Content-Language: en-GB
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20231009195747.889326-1-stewart.hildebrand@amd.com>
 <20231009195747.889326-3-stewart.hildebrand@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231009195747.889326-3-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 09/10/2023 20:57, Stewart Hildebrand wrote:
> Add a flag to struct xen_arch_domainconfig to allow specifying at domain
> creation time whether the domain uses vPCI.
> 
> Add a corresponding flag to struct arch_domain to indicate vPCI and set it
> accordingly.

The new boolean you are adding doesn't seem very arch specific. So could 
we use a bit in xen_domctl_createdomain.flags?

> 
> Bump XEN_DOMCTL_INTERFACE_VERSION since we're modifying struct
> xen_arch_domainconfig.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
> v2->v3:
> * new patch
> ---
>   xen/arch/arm/domain.c             | 10 ++++++++++
>   xen/arch/arm/include/asm/domain.h |  2 ++
>   xen/include/public/arch-arm.h     |  4 ++++
>   xen/include/public/domctl.h       |  2 +-
>   4 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 28e3aaa5e482..9470c28595da 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -687,6 +687,13 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>           return -EINVAL;
>       }
>   
> +    if ( (config->arch.pci_flags & XEN_DOMCTL_CONFIG_PCI_VPCI) &&
> +         !IS_ENABLED(CONFIG_HAS_VPCI) )
> +    {
> +        dprintk(XENLOG_INFO, "vPCI support not enabled\n");
> +        return -EINVAL;
> +    }
> +
>       return 0;
>   }
>   
> @@ -737,6 +744,9 @@ int arch_domain_create(struct domain *d,
>           BUG();
>       }
>   
> +    if ( config->arch.pci_flags & XEN_DOMCTL_CONFIG_PCI_VPCI )
> +        d->arch.has_vpci = true;
> +
>       if ( (rc = domain_vgic_register(d, &count)) != 0 )
>           goto fail;
>   
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> index 99e798ffff68..0a66ed09a617 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -119,6 +119,8 @@ struct arch_domain
>       void *tee;
>   #endif
>   
> +    bool has_vpci;
> +
>   }  __cacheline_aligned;
>   
>   struct arch_vcpu
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index 6a4467e8f5d1..5c8424341aad 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -300,6 +300,8 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
>   #define XEN_DOMCTL_CONFIG_TEE_OPTEE     1
>   #define XEN_DOMCTL_CONFIG_TEE_FFA       2
>   
> +#define XEN_DOMCTL_CONFIG_PCI_VPCI      (1U << 0)
> +
>   struct xen_arch_domainconfig {
>       /* IN/OUT */
>       uint8_t gic_version;
> @@ -323,6 +325,8 @@ struct xen_arch_domainconfig {
>        *
>        */
>       uint32_t clock_frequency;
> +    /* IN */
> +    uint8_t pci_flags;

Regardless what I wrote above. Do you have any plan for adding more PCI 
specific flags? If not, then if you want to keep the flag Arm specific, 
then I think this should be named pci_flags.

As you add a new field, I believe, you also want to modoify the various 
language specific bindings (e.g. go, ocaml).

>   };
>   #endif /* __XEN__ || __XEN_TOOLS__ */
>   
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index a33f9ec32b08..dcd42b3d603d 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -21,7 +21,7 @@
>   #include "hvm/save.h"
>   #include "memory.h"
>   
> -#define XEN_DOMCTL_INTERFACE_VERSION 0x00000016
> +#define XEN_DOMCTL_INTERFACE_VERSION 0x00000017
>   
>   /*
>    * NB. xen_domctl.domain is an IN/OUT parameter for this operation.

Cheers,

-- 
Julien Grall

