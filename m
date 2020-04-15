Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF971AA967
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 16:10:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOijn-0007sx-Fx; Wed, 15 Apr 2020 14:09:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=HSXo=57=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jOijm-0007ss-D0
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 14:09:58 +0000
X-Inumbo-ID: c8bb9ef4-7f22-11ea-8a56-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c8bb9ef4-7f22-11ea-8a56-12813bfff9fa;
 Wed, 15 Apr 2020 14:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TMG2quokWnBbiNMGentFiAHC/QrOcLhzsZN9l7VZNX4=; b=dHoMoEJ9CfCUmgFddBn2IusPrN
 j/cWBh/pNsMsoMLrWuIQXgBn+0OtifdvI2MsITPQVMzn6uMvQJcokAh6CbdjYK5OKDC9/FarcOhd7
 pjXa3hTv6H2SmR6jqe8zRVp4A2I1BpMJCjLvfg97BtJwTZlIU2+3CsKbOJmmU1aawfMc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jOiji-0004jE-NF; Wed, 15 Apr 2020 14:09:54 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jOiji-0001ft-EM; Wed, 15 Apr 2020 14:09:54 +0000
Subject: Re: [PATCH 09/12] xen/arm: if is_domain_direct_mapped use native
 addresses for GICv3
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
 <20200415010255.10081-9-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
Message-ID: <923411c5-37d4-c86e-c5a8-8acd8a6830e7@xen.org>
Date: Wed, 15 Apr 2020 15:09:52 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200415010255.10081-9-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Volodymyr_Babchuk@epam.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 15/04/2020 02:02, Stefano Stabellini wrote:
> Today we use native addresses to map the GICv3 for Dom0 and fixed
> addresses for DomUs.
> 
> This patch changes the behavior so that native addresses are used for
> any domain that is_domain_direct_mapped. The patch has to introduce one
> #ifndef CONFIG_NEW_VGIC because the new vgic doesn't support GICv3.

Please no #ifdef. Instead move the creation of the DT node in vgic.c and 
introduce a stub for non-GICv3 platform.

> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> ---
>   xen/arch/arm/domain_build.c | 12 +++++++++---
>   xen/arch/arm/vgic-v3.c      | 18 ++++++++++++++----
>   2 files changed, 23 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 303bee60f6..beec0a144c 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1697,8 +1697,12 @@ static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
>       int res = 0;
>       __be32 reg[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) * 2];
>       __be32 *cells;
> +    struct domain *d = kinfo->d;
> +    char buf[38];
>   
> -    res = fdt_begin_node(fdt, "interrupt-controller@"__stringify(GUEST_GICV3_GICD_BASE));
> +    snprintf(buf, sizeof(buf), "interrupt-controller@%"PRIx64,
> +             d->arch.vgic.dbase);
> +    res = fdt_begin_node(fdt, buf);
>       if ( res )
>           return res;
>   
> @@ -1720,9 +1724,11 @@ static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
>   
>       cells = &reg[0];
>       dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
> -                       GUEST_GICV3_GICD_BASE, GUEST_GICV3_GICD_SIZE);
> +                       d->arch.vgic.dbase, GUEST_GICV3_GICD_SIZE);
> +#if defined(CONFIG_GICV3) && !defined(CONFIG_NEW_VGIC)

CONFIG_GICV3 does not exist. Did you mean CONFIG_HAS_GICV3?

>       dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
> -                       GUEST_GICV3_GICR0_BASE, GUEST_GICV3_GICR0_SIZE);
> +                       d->arch.vgic.rdist_regions[0].base, GUEST_GICV3_GICR0_SIZE);
> +#endif
>   
>       res = fdt_property(fdt, "reg", reg, sizeof(reg));
>       if (res)
> diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
> index 4e60ba15cc..4cf430f865 100644
> --- a/xen/arch/arm/vgic-v3.c
> +++ b/xen/arch/arm/vgic-v3.c
> @@ -1677,13 +1677,25 @@ static int vgic_v3_domain_init(struct domain *d)


I think you also want to modify vgic_v3_max_rdist_count().

>        * Domain 0 gets the hardware address.
>        * Guests get the virtual platform layout.

This comment needs to be updated.

>        */
> -    if ( is_hardware_domain(d) )
> +    if ( is_domain_direct_mapped(d) )
>       {
>           unsigned int first_cpu = 0;
> +        unsigned int nr_rdist_regions;
>   
>           d->arch.vgic.dbase = vgic_v3_hw.dbase;
>   
> -        for ( i = 0; i < vgic_v3_hw.nr_rdist_regions; i++ )
> +        if ( is_hardware_domain(d) )
> +        {
> +            nr_rdist_regions = vgic_v3_hw.nr_rdist_regions;
> +            d->arch.vgic.intid_bits = vgic_v3_hw.intid_bits;
> +        }
> +        else
> +        {
> +            nr_rdist_regions = 1;

What does promise your the rdist region will be big enough to cater all 
the re-distributors for your domain?

Cheers,

-- 
Julien Grall

