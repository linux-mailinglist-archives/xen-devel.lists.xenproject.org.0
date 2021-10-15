Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D7D42ECEF
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 10:57:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209973.366576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbJ1T-0003z3-3j; Fri, 15 Oct 2021 08:57:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209973.366576; Fri, 15 Oct 2021 08:57:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbJ1S-0003vz-W7; Fri, 15 Oct 2021 08:57:02 +0000
Received: by outflank-mailman (input) for mailman id 209973;
 Fri, 15 Oct 2021 08:57:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mbJ1R-0003vr-SJ
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 08:57:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mbJ1R-0008AX-Nr; Fri, 15 Oct 2021 08:57:01 +0000
Received: from [54.239.6.185] (helo=[192.168.0.140])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mbJ1R-0002xo-I1; Fri, 15 Oct 2021 08:57:01 +0000
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
	bh=gECphvyWX0b1+h78PP+qAnI6f0/3xmOHqAK4Dv1Xi34=; b=X7RgAM0bDrEQO1WY2u1tK4z+5m
	D+OZ860ZkX3Eqj4uXZj0nuu1OTJY2bBUpD94z+dUu1TB/E72RKO0GzowWk7JifDy0GZe8ciIC61nc
	pjrmC9OM4NpuPVDU2kIKlkMA1uRtz54mZ8JG0LVn4SLt7WUm3WkPIXRolCqjdKjkItk0=;
Message-ID: <0eba23e2-54f4-0fe4-d811-c2fb8a0602b0@xen.org>
Date: Fri, 15 Oct 2021 09:56:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH v2 1/6] xen: introduce XEN_DOMCTL_CDF_directmap
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Wei.Chen@arm.com, Bertrand.Marquis@arm.com
References: <20211015030945.2082898-1-penny.zheng@arm.com>
 <20211015030945.2082898-2-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211015030945.2082898-2-penny.zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 15/10/2021 04:09, Penny Zheng wrote:
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 0167731ab0..37e2d62d47 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -3069,8 +3069,10 @@ static int __init construct_dom0(struct domain *d)
>   void __init create_dom0(void)
>   {
>       struct domain *dom0;
> +    /* DOM0 has always its memory directly mapped. */
>       struct xen_domctl_createdomain dom0_cfg = {
> -        .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
> +        .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
> +                 XEN_DOMCTL_CDF_directmap,
>           .max_evtchn_port = -1,
>           .max_grant_frames = gnttab_dom0_frames(),
>           .max_maptrack_frames = -1,
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 8b53c49d1e..7a6131db74 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -486,7 +486,8 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
>            ~(XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
>              XEN_DOMCTL_CDF_s3_integrity | XEN_DOMCTL_CDF_oos_off |
>              XEN_DOMCTL_CDF_xs_domain | XEN_DOMCTL_CDF_iommu |
> -           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpmu) )
> +           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpmu |
> +           XEN_DOMCTL_CDF_directmap) )
>       {
>           dprintk(XENLOG_INFO, "Unknown CDF flags %#x\n", config->flags);
>           return -EINVAL;
> diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
> index 14e575288f..fc42c6a310 100644
> --- a/xen/include/asm-arm/domain.h
> +++ b/xen/include/asm-arm/domain.h
> @@ -29,8 +29,8 @@ enum domain_type {
>   #define is_64bit_domain(d) (0)
>   #endif
>   
> -/* The hardware domain has always its memory direct mapped. */
> -#define is_domain_direct_mapped(d) is_hardware_domain(d)
> +/* Check if domain is direct-map memory map. */
> +#define is_domain_direct_mapped(d) (d->options & XEN_DOMCTL_CDF_directmap)
>   
>   struct vtimer {
>       struct vcpu *v;
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index 238384b5ae..b505a0db51 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -72,9 +72,11 @@ struct xen_domctl_createdomain {
>   #define XEN_DOMCTL_CDF_nested_virt    (1U << _XEN_DOMCTL_CDF_nested_virt)
>   /* Should we expose the vPMU to the guest? */
>   #define XEN_DOMCTL_CDF_vpmu           (1U << 7)
> +/* If this domain has its memory directly mapped? (ARM only) */
> +#define XEN_DOMCTL_CDF_directmap      (1U << 8)
>   
>   /* Max XEN_DOMCTL_CDF_* constant.  Used for ABI checking. */
> -#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_vpmu
> +#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_directmap

In the previous version, this flag was only settable for domain created 
by Xen. Now this is also settable by the toolstack. I don't think the 
toolstack can sensibly use this flag (at least in the current state).

So can you explain why this flag is exposed to the toolstack?

Cheers,

-- 
Julien Grall

