Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DCA7027C8
	for <lists+xen-devel@lfdr.de>; Mon, 15 May 2023 11:04:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534654.831878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyU7j-0003Q1-WA; Mon, 15 May 2023 09:04:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534654.831878; Mon, 15 May 2023 09:04:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyU7j-0003NV-TR; Mon, 15 May 2023 09:04:07 +0000
Received: by outflank-mailman (input) for mailman id 534654;
 Mon, 15 May 2023 09:04:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pyU7i-0003NK-Lh
 for xen-devel@lists.xenproject.org; Mon, 15 May 2023 09:04:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pyU7i-0001tj-3l; Mon, 15 May 2023 09:04:06 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.27.136]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pyU7h-0002Y2-Tw; Mon, 15 May 2023 09:04:06 +0000
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
	bh=VrcPs2Jq8w9VNs7AIBdGcg2ROUBmtiXJ7MVVzP/q8dI=; b=zTkOOjxK7yB7ya9hK+EXYYSlM/
	hmsyVRJpl7nrxh1omDVbWRx3KXvjTA+vUxiTYuaJlXsnroi5pPeEnbPEojUBUNym9UjbGf/SrZGw2
	FWPqqRe6nIMD0xswi/+NfCXDnwYn4j4KG+kdbt8yExlXRnF5mdCoJFR9G8rUcJIiwvR8=;
Message-ID: <feea3570-739f-c998-16ed-afed884f7fe6@xen.org>
Date: Mon, 15 May 2023 10:04:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 2/2] xen/arm: domain_build: Fix format specifiers in
 map_{dt_}irq_to_domain()
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230511130218.22606-1-michal.orzel@amd.com>
 <20230511130218.22606-3-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230511130218.22606-3-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 11/05/2023 14:02, Michal Orzel wrote:
> IRQ is of unsigned type so %u should be used. When printing domain id,
> %pd should be the correct format to maintain the consistency.
> 
> Also, wherever possible, reduce the number of splitted lines for printk().

Reviewed-by: Julien Grall <jgrall@amazon.com>

I will fix the typo pointed out by Andrew whilst committing the series.

Cheers,

> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
> Changes in v2:
>   - split the v1 patch so that the format specifiers are handled separately
>   - also fix map_irq_to_domain()
> ---
>   xen/arch/arm/domain_build.c | 14 +++++---------
>   1 file changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 9dee1bb8f21c..71f307a572e9 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2265,8 +2265,7 @@ int __init map_irq_to_domain(struct domain *d, unsigned int irq,
>       res = irq_permit_access(d, irq);
>       if ( res )
>       {
> -        printk(XENLOG_ERR "Unable to permit to dom%u access to IRQ %u\n",
> -               d->domain_id, irq);
> +        printk(XENLOG_ERR "Unable to permit to %pd access to IRQ %u\n", d, irq);
>           return res;
>       }
>   
> @@ -2282,8 +2281,7 @@ int __init map_irq_to_domain(struct domain *d, unsigned int irq,
>           res = route_irq_to_guest(d, irq, irq, devname);
>           if ( res < 0 )
>           {
> -            printk(XENLOG_ERR "Unable to map IRQ%"PRId32" to dom%d\n",
> -                   irq, d->domain_id);
> +            printk(XENLOG_ERR "Unable to map IRQ%u to %pd\n", irq, d);
>               return res;
>           }
>       }
> @@ -2303,8 +2301,7 @@ static int __init map_dt_irq_to_domain(const struct dt_device_node *dev,
>   
>       if ( irq < NR_LOCAL_IRQS )
>       {
> -        printk(XENLOG_ERR "%s: IRQ%"PRId32" is not a SPI\n",
> -               dt_node_name(dev), irq);
> +        printk(XENLOG_ERR "%s: IRQ%u is not a SPI\n", dt_node_name(dev), irq);
>           return -EINVAL;
>       }
>   
> @@ -2312,9 +2309,8 @@ static int __init map_dt_irq_to_domain(const struct dt_device_node *dev,
>       res = irq_set_spi_type(irq, dt_irq->type);
>       if ( res )
>       {
> -        printk(XENLOG_ERR
> -               "%s: Unable to setup IRQ%"PRId32" to dom%d\n",
> -               dt_node_name(dev), irq, d->domain_id);
> +        printk(XENLOG_ERR "%s: Unable to setup IRQ%u to %pd\n",
> +               dt_node_name(dev), irq, d);
>           return res;
>       }
>   

-- 
Julien Grall

