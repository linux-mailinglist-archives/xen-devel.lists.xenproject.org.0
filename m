Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C1F825903
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jan 2024 18:27:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.662274.1032322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLnxj-00062T-QR; Fri, 05 Jan 2024 17:26:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 662274.1032322; Fri, 05 Jan 2024 17:26:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLnxj-0005zf-NS; Fri, 05 Jan 2024 17:26:27 +0000
Received: by outflank-mailman (input) for mailman id 662274;
 Fri, 05 Jan 2024 17:26:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rLnxi-0005zZ-MG
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2024 17:26:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rLnxi-00038p-2X; Fri, 05 Jan 2024 17:26:26 +0000
Received: from [54.239.6.189] (helo=[192.168.15.166])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rLnxh-00076G-Ps; Fri, 05 Jan 2024 17:26:25 +0000
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
	bh=tHp+kUsNDMEKqK+HQIYg0aMd3qIhsDMFTsbzq1Ss57A=; b=CFSIFxT0ytwt0O4Ri1zlESnPWz
	i6XEGRWskzeoiX05Drkt0mZfBHQrW/xv7xV+K+VuQJEK/UNnfrN45bKAwjBLChZLdZqqs+vTdvqrw
	h4EglK8A1/fCZlkbGB3YH79AmPa/qC7Wb/5gTRqaKWdM4lqJWIiHR6r68OsajrLmB0jM=;
Message-ID: <99295edf-6c9c-4d06-ba20-86db67100561@xen.org>
Date: Fri, 5 Jan 2024 17:26:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/13] xen: extend domctl interface for cache coloring
Content-Language: en-GB
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Marco Solieri <marco.solieri@minervasys.tech>
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
 <20240102095138.17933-5-carlo.nonato@minervasys.tech>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240102095138.17933-5-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Carlo,

On 02/01/2024 09:51, Carlo Nonato wrote:
> This commit updates the domctl interface to allow the user to set cache
> coloring configurations from the toolstack.
> It also implements the functionality for arm64.
> 
> Based on original work from: Luca Miccio <lucmiccio@gmail.com>
> 
> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> ---
> v5:
> - added a new hypercall to set colors
> - uint for the guest handle
> v4:
> - updated XEN_DOMCTL_INTERFACE_VERSION
> ---
>   xen/arch/arm/llc-coloring.c    | 17 +++++++++++++++++
>   xen/common/domctl.c            | 11 +++++++++++
>   xen/include/public/domctl.h    | 10 +++++++++-
>   xen/include/xen/llc-coloring.h |  3 +++
>   4 files changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/llc-coloring.c b/xen/arch/arm/llc-coloring.c
> index 5ce58aba70..a08614ec36 100644
> --- a/xen/arch/arm/llc-coloring.c
> +++ b/xen/arch/arm/llc-coloring.c
> @@ -9,6 +9,7 @@
>    *    Carlo Nonato <carlo.nonato@minervasys.tech>
>    */
>   #include <xen/errno.h>
> +#include <xen/guest_access.h>
>   #include <xen/keyhandler.h>
>   #include <xen/llc-coloring.h>
>   #include <xen/param.h>
> @@ -278,6 +279,22 @@ int dom0_set_llc_colors(struct domain *d)
>       return domain_check_colors(d);
>   }
>   
> +int domain_set_llc_colors_domctl(struct domain *d,
> +                                 const struct xen_domctl_set_llc_colors *config)
> +{
> +    if ( d->num_llc_colors )
> +        return -EEXIST;
> +
> +    if ( domain_alloc_colors(d, config->num_llc_colors) )

domain_alloc_colors() doesn't sanity check config->num_llc_colors before 
allocating the array. You want a check the size before so we would not 
try to allocate an arbitrary amount of memory.

> +        return -ENOMEM;
> +
> +    if ( copy_from_guest(d->llc_colors, config->llc_colors,
> +                         config->num_llc_colors) )
> +        return -EFAULT;
> +
> +    return domain_check_colors(d);
> +}
> +
>   /*
>    * Local variables:
>    * mode: C
> diff --git a/xen/common/domctl.c b/xen/common/domctl.c
> index f5a71ee5f7..b6867d0602 100644
> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -8,6 +8,7 @@
>   
>   #include <xen/types.h>
>   #include <xen/lib.h>
> +#include <xen/llc-coloring.h>
>   #include <xen/err.h>
>   #include <xen/mm.h>
>   #include <xen/sched.h>
> @@ -858,6 +859,16 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>                   __HYPERVISOR_domctl, "h", u_domctl);
>           break;
>   
> +    case XEN_DOMCTL_set_llc_colors:
> +        if ( !llc_coloring_enabled )
> +            break;
> +
> +        ret = domain_set_llc_colors_domctl(d, &op->u.set_llc_colors);
> +        if ( ret == -EEXIST )
> +            printk(XENLOG_ERR
> +                   "Can't set LLC colors on an already created domain\n");

To me, the message doesn't match the check in 
domain_set_llc_colors_domctl(). But I think you want to check that no 
memory was yet allocated to the domain. Otherwise, you coloring will be 
wrong.

Also, it is a bit unclear why you print a message for -EEXIST but not 
the others. In this instance, I would consider to print nothing at all.

> +        break;
> +
>       default:
>           ret = arch_do_domctl(op, d, u_domctl);
>           break;
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index a33f9ec32b..2b12069294 100644
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
> @@ -1190,6 +1190,12 @@ struct xen_domctl_vmtrace_op {
>   typedef struct xen_domctl_vmtrace_op xen_domctl_vmtrace_op_t;
>   DEFINE_XEN_GUEST_HANDLE(xen_domctl_vmtrace_op_t);
>   
> +struct xen_domctl_set_llc_colors {
> +    /* IN LLC coloring parameters */
> +    unsigned int num_llc_colors;

I think there will be a padding here. So can you make it explicit?

> +    XEN_GUEST_HANDLE_64(uint) llc_colors;
> +};
> +
>   struct xen_domctl {
>       uint32_t cmd;
>   #define XEN_DOMCTL_createdomain                   1
> @@ -1277,6 +1283,7 @@ struct xen_domctl {
>   #define XEN_DOMCTL_vmtrace_op                    84
>   #define XEN_DOMCTL_get_paging_mempool_size       85
>   #define XEN_DOMCTL_set_paging_mempool_size       86
> +#define XEN_DOMCTL_set_llc_colors                87
>   #define XEN_DOMCTL_gdbsx_guestmemio            1000
>   #define XEN_DOMCTL_gdbsx_pausevcpu             1001
>   #define XEN_DOMCTL_gdbsx_unpausevcpu           1002
> @@ -1339,6 +1346,7 @@ struct xen_domctl {
>           struct xen_domctl_vuart_op          vuart_op;
>           struct xen_domctl_vmtrace_op        vmtrace_op;
>           struct xen_domctl_paging_mempool    paging_mempool;
> +        struct xen_domctl_set_llc_colors    set_llc_colors;
>           uint8_t                             pad[128];
>       } u;
>   };
> diff --git a/xen/include/xen/llc-coloring.h b/xen/include/xen/llc-coloring.h
> index cedd97d4b5..fa2edc8ad8 100644
> --- a/xen/include/xen/llc-coloring.h
> +++ b/xen/include/xen/llc-coloring.h
> @@ -33,6 +33,9 @@ extern bool llc_coloring_enabled;
>   void domain_llc_coloring_free(struct domain *d);
>   void domain_dump_llc_colors(struct domain *d);
>   
> +int domain_set_llc_colors_domctl(struct domain *d,
> +                                 const struct xen_domctl_set_llc_colors *config);
> +
>   #endif /* __COLORING_H__ */
>   
>   /*

Cheers,

-- 
Julien Grall

