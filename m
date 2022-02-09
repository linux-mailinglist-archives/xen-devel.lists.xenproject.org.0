Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D694AF4E8
	for <lists+xen-devel@lfdr.de>; Wed,  9 Feb 2022 16:16:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269290.463329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHohn-00016o-1U; Wed, 09 Feb 2022 15:16:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269290.463329; Wed, 09 Feb 2022 15:16:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHohm-000151-Uh; Wed, 09 Feb 2022 15:16:26 +0000
Received: by outflank-mailman (input) for mailman id 269290;
 Wed, 09 Feb 2022 15:16:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nHohl-00014v-8N
 for xen-devel@lists.xenproject.org; Wed, 09 Feb 2022 15:16:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nHohl-0007Ag-1v; Wed, 09 Feb 2022 15:16:25 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=[192.168.1.215]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nHohk-0007uM-Sd; Wed, 09 Feb 2022 15:16:25 +0000
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
	bh=tnIKeUJpoZVtK4wLOax0GOcNxahhhcrSZ65cOS5nri4=; b=aRQ5UBMiPFth0wOi9riG7LnAp3
	+sWKH2jFpVx7hPdGAsVVnuXpA22rekkquKXq57LmeID7fNK+zWrLNEjKtDIndEeMiZLXsxHnwwxSv
	etiOkHNY4E8RVdFq1rcdgu7eAHVEZbNPmpfRUmHKoyj3n2586T454i/WpqAgX4G+YXik=;
Message-ID: <62b97822-6609-7556-962c-8684b187030b@xen.org>
Date: Wed, 9 Feb 2022 15:16:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v5 09/11] xen/arm: if direct-map domain use native
 addresses for GICv3
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com
References: <20220127074929.502885-1-penny.zheng@arm.com>
 <20220127074929.502885-10-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220127074929.502885-10-penny.zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 27/01/2022 07:49, Penny Zheng wrote:
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> index cb37ce89ec..848fec8a0f 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -31,6 +31,20 @@ enum domain_type {
>   
>   #define is_domain_direct_mapped(d) (d->arch.directmap)
>   
> +/*
> + * Is the domain using the host memory layout?
> + *
> + * Direct-mapped domain will always have the RAM mapped with GFN == MFN.
> + * To avoid any trouble finding space, it is easier to force using the
> + * host memory layout.
> + *
> + * The hardware domain will use the host layout regardless of
> + * direct-mapped because some OS may rely on a specific address ranges
> + * for the devices.
> + */
> +#define domain_use_host_layout(d) (is_domain_direct_mapped(d) || \
> +                                   is_hardware_domain(d))
> +
>   struct vtimer {
>       struct vcpu *v;
>       int irq;
> diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
> index 65bb7991a6..144089a7b6 100644
> --- a/xen/arch/arm/vgic-v3.c
> +++ b/xen/arch/arm/vgic-v3.c
> @@ -1640,14 +1640,15 @@ static inline unsigned int vgic_v3_max_rdist_count(struct domain *d)
>        * Normally there is only one GICv3 redistributor region.
>        * The GICv3 DT binding provisions for multiple regions, since there are
>        * platforms out there which need those (multi-socket systems).
> -     * For Dom0 we have to live with the MMIO layout the hardware provides,
> -     * so we have to copy the multiple regions - as the first region may not
> -     * provide enough space to hold all redistributors we need.
> +     * For domain using the host memory layout, we have to live with the MMIO
> +     * layout the hardware provides, so we have to copy the multiple regions
> +     * - as the first region may not provide enough space to hold all
> +     * redistributors we need.
>        * However DomU get a constructed memory map, so we can go with

This sentence imply all domUs will use a constructed memory map. I would 
replace "However DomU" with "All the other domains will get a ...".

With that updated:

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

