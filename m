Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87766415C31
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 12:48:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193671.344996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTMGi-00078U-4i; Thu, 23 Sep 2021 10:47:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193671.344996; Thu, 23 Sep 2021 10:47:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTMGi-000759-0v; Thu, 23 Sep 2021 10:47:56 +0000
Received: by outflank-mailman (input) for mailman id 193671;
 Thu, 23 Sep 2021 10:47:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mTMGf-000714-Rs
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 10:47:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mTMGf-0005iY-Ol; Thu, 23 Sep 2021 10:47:53 +0000
Received: from [202.153.84.92] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mTMGf-0001JI-Ed; Thu, 23 Sep 2021 10:47:53 +0000
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
	bh=AsQaybsN+y6K9nSwJw8z39y9Zr8Ja6WqTb2Egp8zowk=; b=LJLXolA/St+7XfSzRfMn6lIHVX
	Z9CeQJAYi4MXjpwGA+W+v8EMh872Hx6tu7TgGvaYcyk+JtPsfxM0zC5mPXGbR5iQ8E65gu2wQGgw5
	MnvzkTsJv4IZHBgXOToW0OzG9WO26tB9bM35ARhMJdrzqIkScDtB/m0ksRZLOnvpDxdQ=;
Subject: Re: [PATCH 06/11] xen/arm: new vgic: update vgic_cpu_base
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com
References: <20210923031115.1429719-1-penny.zheng@arm.com>
 <20210923031115.1429719-7-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b8c3659d-e1d5-0957-6e4a-89e3222a0480@xen.org>
Date: Thu, 23 Sep 2021 15:47:47 +0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210923031115.1429719-7-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 23/09/2021 08:11, Penny Zheng wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> In vgic_v2_map_resources, use the new vgic_cpu_base field of struct
> vgic_dist instead of original local variable.

I think this wants to be folded in patch #5.

> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
>   xen/arch/arm/vgic/vgic-v2.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/arm/vgic/vgic-v2.c b/xen/arch/arm/vgic/vgic-v2.c
> index b5ba4ace87..fd452fcb5a 100644
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
> @@ -276,7 +276,7 @@ int vgic_v2_map_resources(struct domain *d)
>            * Note that we assume the size of the CPU interface is always
>            * aligned to PAGE_SIZE.
>            */
> -        cbase = gic_v2_hw_data.cbase;
> +        d->arch.vgic.vgic_cpu_base = gic_v2_hw_data.cbase;
>           csize = gic_v2_hw_data.csize;
>           vbase = gic_v2_hw_data.vbase;
>       }
> @@ -290,7 +290,7 @@ int vgic_v2_map_resources(struct domain *d)
>            * region.
>            */
>           BUILD_BUG_ON(GUEST_GICC_SIZE != SZ_8K);
> -        cbase = GUEST_GICC_BASE;
> +        d->arch.vgic.vgic_cpu_base = GUEST_GICC_BASE;
>           csize = GUEST_GICC_SIZE;
>           vbase = gic_v2_hw_data.vbase + gic_v2_hw_data.aliased_offset;
>       }
> @@ -308,8 +308,8 @@ int vgic_v2_map_resources(struct domain *d)
>        * Map the gic virtual cpu interface in the gic cpu interface
>        * region of the guest.
>        */
> -    ret = map_mmio_regions(d, gaddr_to_gfn(cbase), csize / PAGE_SIZE,
> -                           maddr_to_mfn(vbase));
> +    ret = map_mmio_regions(d, gaddr_to_gfn(d->arch.vgic.vgic_cpu_base),
> +                           csize / PAGE_SIZE, maddr_to_mfn(vbase));
>       if ( ret )
>       {
>           gdprintk(XENLOG_ERR, "Unable to remap VGIC CPU to VCPU\n");
> 

-- 
Julien Grall

