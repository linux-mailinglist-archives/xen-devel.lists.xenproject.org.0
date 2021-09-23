Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84489415B9E
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 12:00:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193601.344852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTLWq-00032t-1L; Thu, 23 Sep 2021 10:00:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193601.344852; Thu, 23 Sep 2021 10:00:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTLWp-00030J-Ty; Thu, 23 Sep 2021 10:00:31 +0000
Received: by outflank-mailman (input) for mailman id 193601;
 Thu, 23 Sep 2021 10:00:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mTLWo-00030B-Qg
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 10:00:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mTLWo-0004ud-FJ; Thu, 23 Sep 2021 10:00:30 +0000
Received: from [202.153.84.92] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mTLWo-0005TV-5O; Thu, 23 Sep 2021 10:00:30 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=a+mRos+FxOv5H2KRZ2STHOwwYTDpULtpygDmSpWT4wo=; b=bV1Ouviu6sHJ1yHi7zFVSNbvJL
	eJJt9G87xVr3eAaUUyU3oieV7TVee8GNxpi6X4pnkPRdi1kzaE+E1amgdmnI78Hfrtp0pdeUZpIzz
	EFwJbUUj0Estqe3IdBRSHy1c1mbNZbtTXr6Jb6EpQhavbx7bwjFxLQXdDXh7/TPUcdvY=;
Subject: Re: [PATCH 02/11] xen/arm: introduce XEN_DOMCTL_INTERNAL_directmap
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com
References: <20210923031115.1429719-1-penny.zheng@arm.com>
 <20210923031115.1429719-3-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e059836c-d3f4-70d4-c4f6-cb15b1b787cc@xen.org>
Date: Thu, 23 Sep 2021 15:00:26 +0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210923031115.1429719-3-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi,

On 23/09/2021 08:11, Penny Zheng wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> This commit introduces a new ARM-specific flag to specify that the
> domain should be 1:1 directly mapped (guest physical addresses ==

"1:1" and "directly" means the exactly the same. Please remove either.

> physical addresses).
> 
> Also, add a direct_map flag under struct arch_domain and use it to
> implement is_domain_direct_mapped.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> CC: andrew.cooper3@citrix.com
> CC: jbeulich@suse.com
> CC: George Dunlap <George.Dunlap@eu.citrix.com>
> CC: Ian Jackson <ian.jackson@eu.citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: "Roger Pau Monné" <roger.pau@citrix.com>
> ---
>   xen/arch/arm/domain.c        | 1 +
>   xen/arch/arm/domain_build.c  | 2 +-
>   xen/include/asm-arm/domain.h | 9 +++++++--
>   xen/include/xen/domain.h     | 4 ++++
>   4 files changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 7922249d26..0b3cff8a40 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -696,6 +696,7 @@ int arch_domain_create(struct domain *d,
>           return 0;
>   
>       ASSERT(config != NULL);
> +    d->arch.direct_map = config->flags & XEN_DOMCTL_INTERNAL_directmap;
>   
>   #ifdef CONFIG_IOREQ_SERVER
>       ioreq_domain_init(d);
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 8cc4c800e9..21d8a559af 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2753,7 +2753,7 @@ void __init create_dom0(void)
>       struct domain *dom0;
>       struct xen_domctl_createdomain dom0_cfg = {
>           .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
> -                 XEN_DOMCTL_INTERNAL_ispriv,
> +                 XEN_DOMCTL_INTERNAL_ispriv | XEN_DOMCTL_INTERNAL_directmap,
>           .max_evtchn_port = -1,
>           .max_grant_frames = gnttab_dom0_frames(),
>           .max_maptrack_frames = -1,
> diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
> index c9277b5c6d..a74ee5720c 100644
> --- a/xen/include/asm-arm/domain.h
> +++ b/xen/include/asm-arm/domain.h
> @@ -29,8 +29,11 @@ enum domain_type {
>   #define is_64bit_domain(d) (0)
>   #endif
>   
> -/* The hardware domain has always its memory direct mapped. */
> -#define is_domain_direct_mapped(d) is_hardware_domain(d)
> +/*
> + * The hardware domain has always its memory direct mapped. And DOM0 shall
> + * be always been set as 1:1 direct-map domain.
> + */

I think this comment should be moved on top of dom0_cfg.flags. This will 
prevent in stall comment if in the future we decide to remove the direct 
map (I know that cache coloring will want to drop it).

> +#define is_domain_direct_mapped(d) (d)->arch.direct_map
>   
>   struct vtimer {
>       struct vcpu *v;
> @@ -89,6 +92,8 @@ struct arch_domain
>   #ifdef CONFIG_TEE
>       void *tee;
>   #endif
> +
> +    bool direct_map;

We already store the flag in d->options. So this is a bit redundant.

>   }  __cacheline_aligned;
>   
>   struct arch_vcpu
> diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
> index 7ed0b62b78..6c2b07eb42 100644
> --- a/xen/include/xen/domain.h
> +++ b/xen/include/xen/domain.h
> @@ -32,6 +32,10 @@ void arch_get_domain_info(const struct domain *d,
>   #define _XEN_DOMCTL_INTERNAL_ispriv         16
>   #define XEN_DOMCTL_INTERNAL_ispriv          (1U<<_XEN_DOMCTL_INTERNAL_ispriv)
>   
> +/* This flag is ARM specific */
> +#define _XEN_DOMCTL_INTERNAL_directmap      17
> +#define XEN_DOMCTL_INTERNAL_directmap       (1U<<_XEN_DOMCTL_INTERNAL_directmap)

Coding style: space before and after <<.

> +
>   /*
>    * Arch-specifics.
>    */
> 

Cheers,

-- 
Julien Grall

