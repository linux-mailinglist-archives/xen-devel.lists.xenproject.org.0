Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2920E1AA8CD
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 15:41:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOiIC-0005BS-Vj; Wed, 15 Apr 2020 13:41:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=HSXo=57=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jOiIB-0005BM-Pb
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 13:41:27 +0000
X-Inumbo-ID: ce07b856-7f1e-11ea-9e09-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ce07b856-7f1e-11ea-9e09-bc764e2007e4;
 Wed, 15 Apr 2020 13:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BxQrAdfzrB++GpsauX6901bkGRH5ZevSSMr6kgxcl58=; b=jVmlsR0xXuvTkLUHYQ7vPRPGZK
 9qzMdqXf4PGVmuGo7H4uWKn+RyCqYVUlkxIX2y3xFerq7yCIkYTb9uMvBuI7udylX1sISsiG9csw9
 N2VJ60qxFz11LG4PhjPgVNzsBzFMfgDydWyj59PQbQEAp3QoQDiHJ5XVudaH7VYY2eVI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jOiI9-00044L-AJ; Wed, 15 Apr 2020 13:41:25 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jOiI8-0007os-Vs; Wed, 15 Apr 2020 13:41:25 +0000
Subject: Re: [PATCH 07/12] xen/arm: new vgic: rename vgic_cpu/dist_base to
 c/dbase
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
 <20200415010255.10081-7-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
Message-ID: <1a553919-9844-6802-4399-e6a6a2b3536b@xen.org>
Date: Wed, 15 Apr 2020 14:41:23 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200415010255.10081-7-sstabellini@kernel.org>
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
> To be uniform with the old vgic. Name uniformity will become immediately
> useful in the following patch.

Please no. Those fields are not meant to be exposed outside of the vGIC.

'cbase' is also much less obvious to read over vgic_cpu_base.

Instead please introduce an helper to retrieve the information you need.

> In vgic_v2_map_resources, use the fields in struct vgic_dist rather than
> local variables.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> ---
>   xen/arch/arm/vgic/vgic-init.c  |  4 ++--
>   xen/arch/arm/vgic/vgic-v2.c    | 16 ++++++++--------
>   xen/include/asm-arm/new_vgic.h |  4 ++--
>   3 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/xen/arch/arm/vgic/vgic-init.c b/xen/arch/arm/vgic/vgic-init.c
> index 62ae553699..ea739d081e 100644
> --- a/xen/arch/arm/vgic/vgic-init.c
> +++ b/xen/arch/arm/vgic/vgic-init.c
> @@ -112,8 +112,8 @@ int domain_vgic_register(struct domain *d, int *mmio_count)
>           BUG();
>       }
>   
> -    d->arch.vgic.vgic_dist_base = VGIC_ADDR_UNDEF;
> -    d->arch.vgic.vgic_cpu_base = VGIC_ADDR_UNDEF;
> +    d->arch.vgic.dbase = VGIC_ADDR_UNDEF;
> +    d->arch.vgic.cbase = VGIC_ADDR_UNDEF;
>       d->arch.vgic.vgic_redist_base = VGIC_ADDR_UNDEF;
>   
>       return 0;
> diff --git a/xen/arch/arm/vgic/vgic-v2.c b/xen/arch/arm/vgic/vgic-v2.c
> index b5ba4ace87..09cb92039a 100644
> --- a/xen/arch/arm/vgic/vgic-v2.c
> +++ b/xen/arch/arm/vgic/vgic-v2.c
> @@ -258,7 +258,7 @@ void vgic_v2_enable(struct vcpu *vcpu)
>   int vgic_v2_map_resources(struct domain *d)
>   {
>       struct vgic_dist *dist = &d->arch.vgic;
> -    paddr_t cbase, csize;
> +    paddr_t csize;
>       paddr_t vbase;
>       int ret;
>   
> @@ -268,7 +268,7 @@ int vgic_v2_map_resources(struct domain *d)
>        */
>       if ( is_hardware_domain(d) )
>       {
> -        d->arch.vgic.vgic_dist_base = gic_v2_hw_data.dbase;
> +        d->arch.vgic.dbase = gic_v2_hw_data.dbase;
>           /*
>            * For the hardware domain, we always map the whole HW CPU
>            * interface region in order to match the device tree (the "reg"
> @@ -276,13 +276,13 @@ int vgic_v2_map_resources(struct domain *d)
>            * Note that we assume the size of the CPU interface is always
>            * aligned to PAGE_SIZE.
>            */
> -        cbase = gic_v2_hw_data.cbase;
> +        d->arch.vgic.cbase = gic_v2_hw_data.cbase;
>           csize = gic_v2_hw_data.csize;
>           vbase = gic_v2_hw_data.vbase;
>       }
>       else
>       {
> -        d->arch.vgic.vgic_dist_base = GUEST_GICD_BASE;
> +        d->arch.vgic.dbase = GUEST_GICD_BASE;
>           /*
>            * The CPU interface exposed to the guest is always 8kB. We may
>            * need to add an offset to the virtual CPU interface base
> @@ -290,13 +290,13 @@ int vgic_v2_map_resources(struct domain *d)
>            * region.
>            */
>           BUILD_BUG_ON(GUEST_GICC_SIZE != SZ_8K);
> -        cbase = GUEST_GICC_BASE;
> +        d->arch.vgic.cbase = GUEST_GICC_BASE;
>           csize = GUEST_GICC_SIZE;
>           vbase = gic_v2_hw_data.vbase + gic_v2_hw_data.aliased_offset;
>       }
>   
>   
> -    ret = vgic_register_dist_iodev(d, gaddr_to_gfn(dist->vgic_dist_base),
> +    ret = vgic_register_dist_iodev(d, gaddr_to_gfn(dist->dbase),
>                                      VGIC_V2);
>       if ( ret )
>       {
> @@ -308,8 +308,8 @@ int vgic_v2_map_resources(struct domain *d)
>        * Map the gic virtual cpu interface in the gic cpu interface
>        * region of the guest.
>        */
> -    ret = map_mmio_regions(d, gaddr_to_gfn(cbase), csize / PAGE_SIZE,
> -                           maddr_to_mfn(vbase));
> +    ret = map_mmio_regions(d, gaddr_to_gfn(d->arch.vgic.cbase),
> +                           csize / PAGE_SIZE, maddr_to_mfn(vbase));
>       if ( ret )
>       {
>           gdprintk(XENLOG_ERR, "Unable to remap VGIC CPU to VCPU\n");
> diff --git a/xen/include/asm-arm/new_vgic.h b/xen/include/asm-arm/new_vgic.h
> index 97d622bff6..e3319900ab 100644
> --- a/xen/include/asm-arm/new_vgic.h
> +++ b/xen/include/asm-arm/new_vgic.h
> @@ -115,11 +115,11 @@ struct vgic_dist {
>       unsigned int        nr_spis;
>   
>       /* base addresses in guest physical address space: */
> -    paddr_t             vgic_dist_base;     /* distributor */
> +    paddr_t             dbase;     /* distributor */
>       union
>       {
>           /* either a GICv2 CPU interface */
> -        paddr_t         vgic_cpu_base;
> +        paddr_t         cbase;
>           /* or a number of GICv3 redistributor regions */
>           struct
>           {
> 

-- 
Julien Grall

