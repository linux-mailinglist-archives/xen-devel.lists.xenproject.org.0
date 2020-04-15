Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BD31AA93C
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 16:00:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOiam-0007Ri-M6; Wed, 15 Apr 2020 14:00:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=HSXo=57=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jOial-0007RZ-8b
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 14:00:39 +0000
X-Inumbo-ID: 7c64a52e-7f21-11ea-b58d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c64a52e-7f21-11ea-b58d-bc764e2007e4;
 Wed, 15 Apr 2020 14:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qiKdXtRMDFwrY08zBd+4dbytpfkDLG+Wi08CN+Mtndk=; b=cxisyBYm6M470cbd6LgR+vDRSX
 4sFzpvUoVktAs9GzKG4S9SEK5txM57zg8lfTSYGKxmHeovbdMwJP9zsw79ABUaG1Aq53DkcI5Zi78
 q7FFN1iWNXsnAO5sEWJZDRnOVIvJPIviIrUNsR78eplEYJ8tbvfNOYZwKLP9x8o81a44=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jOiai-0004Xh-Oz; Wed, 15 Apr 2020 14:00:36 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jOiai-0000xA-Io; Wed, 15 Apr 2020 14:00:36 +0000
Subject: Re: [PATCH 08/12] xen/arm: if is_domain_direct_mapped use native
 addresses for GICv2
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
 <20200415010255.10081-8-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
Message-ID: <05375484-43f2-9d4b-205a-b9dcf4ee5d8e@xen.org>
Date: Wed, 15 Apr 2020 15:00:34 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200415010255.10081-8-sstabellini@kernel.org>
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



On 15/04/2020 02:02, Stefano Stabellini wrote:
> Today we use native addresses to map the GICv2 for Dom0 and fixed
> addresses for DomUs.
> 
> This patch changes the behavior so that native addresses are used for
> any domain that is_domain_direct_mapped.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> ---
>   xen/arch/arm/domain_build.c | 10 +++++++---
>   xen/arch/arm/vgic-v2.c      | 12 ++++++------
>   xen/arch/arm/vgic/vgic-v2.c |  2 +-
>   xen/include/asm-arm/vgic.h  |  1 +
>   4 files changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 627e0c5e8e..303bee60f6 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1643,8 +1643,12 @@ static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
>       int res = 0;
>       __be32 reg[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) * 2];
>       __be32 *cells;
> +    struct domain *d = kinfo->d;
> +    char buf[38];
>   
> -    res = fdt_begin_node(fdt, "interrupt-controller@"__stringify(GUEST_GICD_BASE));
> +    snprintf(buf, sizeof(buf), "interrupt-controller@%"PRIx64,
> +             d->arch.vgic.dbase);
> +    res = fdt_begin_node(fdt, buf);
>       if ( res )
>           return res;
>   
> @@ -1666,9 +1670,9 @@ static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
>   
>       cells = &reg[0];
>       dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
> -                       GUEST_GICD_BASE, GUEST_GICD_SIZE);
> +                       d->arch.vgic.dbase, GUEST_GICD_SIZE);
>       dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
> -                       GUEST_GICC_BASE, GUEST_GICC_SIZE);
> +                       d->arch.vgic.cbase, GUEST_GICC_SIZE);

You can't use the native base address and not the native size. 
Particularly, this is going to screw any GIC using 8KB alias.

It would be preferable if only expose part of the CPU interface as we do 
for the guest. So d->arch.vgic.cbase would be equal to vgic_v2_hw.dbase 
+ vgic_v2.hw.aliased_offset.


Cheers,

-- 
Julien Grall

