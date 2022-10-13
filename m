Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D893B5FD6CB
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 11:14:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421785.667406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiuHp-00032c-Mz; Thu, 13 Oct 2022 09:13:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421785.667406; Thu, 13 Oct 2022 09:13:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiuHp-0002zL-K3; Thu, 13 Oct 2022 09:13:53 +0000
Received: by outflank-mailman (input) for mailman id 421785;
 Thu, 13 Oct 2022 09:13:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oiuHo-0002zF-EH
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 09:13:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oiuHo-0003EY-7X; Thu, 13 Oct 2022 09:13:52 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oiuHo-00040z-14; Thu, 13 Oct 2022 09:13:52 +0000
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
	bh=MEbbdfVmcU9+7Rkp3fc7LaJdAUPBHabKoPmsTvtEsWA=; b=JoHfCDH6b7HwXXICcG7xFnjKeQ
	8xZu/1BpuL8VouWLnR/fzYAjMHU9z+kuUwE+WpNYCedIDxKWKCPNKz7BM+EcgquP9BK5hdmwyLdOy
	s41Iu+AQWqWs6ja6HLPJCIGLXziccyQaQKzppHhoa9FnljohSFDhv6/UdiJNinKyHeZg=;
Message-ID: <c1020b65-491f-e1c5-3ef3-7edb99e0435c@xen.org>
Date: Thu, 13 Oct 2022 10:13:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.1
Subject: Re: [PATCH] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221013083818.36209-1-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221013083818.36209-1-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 13/10/2022 09:38, Henry Wang wrote:
> Hardware using GICv2 needs to create a P2M mapping of 8KB GICv2 area
> when the domain is created. Considering the worst case of page tables

Can you describe in the commit message what is the worst case scenario?

> and keep a buffer, populate 16 pages as the default value to the P2M
> pages pool in arch_domain_create() at the domain creation stage to
> satisfy the GICv2 requirement.
> 
> Fixes: cbea5a1149ca ("xen/arm: Allocate and free P2M pages from the P2M pool")
> Suggested-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> ---
> This should also be backported to 4.13, 4.14, 4.15 and 4.16.
> ---
>   xen/arch/arm/domain.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 2c84e6dbbb..e40e2bcba1 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -740,6 +740,20 @@ int arch_domain_create(struct domain *d,
>           BUG();
>       }
>   
> +    spin_lock(&d->arch.paging.lock);
> +    /*
> +     * Hardware using GICv2 needs to create a P2M mapping of 8KB GICv2 area

The wording suggests that this is only necessary for GICv2. But below 
this is done unconditionally. I am happy with this been done 
unconditionally, but I think this should be clarified here.

> +     * when the domain is created. Considering the worst case for page
> +     * tables and keep a buffer, populate 16 pages to the P2M pages pool here.
> +     */
> +    if ( (rc = p2m_set_allocation(d, 16, NULL)) != 0 )
> +    {
> +        p2m_set_allocation(d, 0, NULL);

Shouldn't this be done in p2m_fiinal_teardown() to cover so the pages 
will be freed anything after this call will fail (include in the caller 
domain_create())?

> +        spin_unlock(&d->arch.paging.lock);
> +        goto fail;
> +    }
> +    spin_unlock(&d->arch.paging.lock);
> +
>       if ( (rc = domain_vgic_register(d, &count)) != 0 )
>           goto fail;
>   

Cheers,

-- 
Julien Grall

