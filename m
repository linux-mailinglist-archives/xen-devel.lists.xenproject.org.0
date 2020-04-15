Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 672F31AA9B8
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 16:18:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOirv-00010G-Vy; Wed, 15 Apr 2020 14:18:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=HSXo=57=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jOiru-00010B-0Z
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 14:18:22 +0000
X-Inumbo-ID: f5d45e2a-7f23-11ea-b58d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f5d45e2a-7f23-11ea-b58d-bc764e2007e4;
 Wed, 15 Apr 2020 14:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R9nOKVo3DKo4xWiJH5aWCXcvOmoq9BN8nzsaODFlZs0=; b=25TFLSrm/peNp/+0//h2Nd1IEi
 FRznsuN373RH72WUvWAq8JD2CsNgYoR/K+wi/XnBRRz/VBeSaUKvLD/GDjidYrR8X8SnMSPmGsvC3
 zCzxrquPFpDissdJ5HS8s6YtaUGaed/KP1/EgIYP/3+E/Fwf08UDNC1Qa/wlJfDMcujc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jOirr-0004vc-EU; Wed, 15 Apr 2020 14:18:19 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jOirr-0002J5-7s; Wed, 15 Apr 2020 14:18:19 +0000
Subject: Re: [PATCH 12/12] xen/arm: call iomem_permit_access for passthrough
 devices
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
 <20200415010255.10081-12-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
Message-ID: <521c8e55-73e8-950f-2d94-70b0c664bd3d@xen.org>
Date: Wed, 15 Apr 2020 15:18:17 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200415010255.10081-12-sstabellini@kernel.org>
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
> iomem_permit_access should be called for MMIO regions of devices
> assigned to a domain. Currently it is not called for MMIO regions of
> passthrough devices of Dom0less guests. This patch fixes it.

You can already have cases today where the MMIO regions are mapped to 
the guest but the guest doesn't have permission on them.

Can you explain why this is a problem here?

Cheers,

> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> ---
>   xen/arch/arm/domain_build.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index d0fc497d07..d3d42eef5d 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1846,6 +1846,17 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
>               return -EINVAL;
>           }
>   
> +        res = iomem_permit_access(kinfo->d, paddr_to_pfn(mstart),
> +                                  paddr_to_pfn(PAGE_ALIGN(mstart + size - 1)));
> +        if ( res )
> +        {
> +            printk(XENLOG_ERR "Unable to permit to dom%d access to"
> +                   " 0x%"PRIx64" - 0x%"PRIx64"\n",
> +                   kinfo->d->domain_id,
> +                   mstart & PAGE_MASK, PAGE_ALIGN(mstart + size) - 1);
> +            return res;
> +        }
> +
>           res = map_regions_p2mt(kinfo->d,
>                                  gaddr_to_gfn(gstart),
>                                  PFN_DOWN(size),
> 

-- 
Julien Grall

