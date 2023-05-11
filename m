Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9076FF0BB
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 13:55:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533293.829823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px4t7-0004oT-QQ; Thu, 11 May 2023 11:55:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533293.829823; Thu, 11 May 2023 11:55:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px4t7-0004me-Nm; Thu, 11 May 2023 11:55:13 +0000
Received: by outflank-mailman (input) for mailman id 533293;
 Thu, 11 May 2023 11:55:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1px4t7-0004mW-21
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 11:55:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1px4t6-0001if-OK; Thu, 11 May 2023 11:55:12 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.27.46]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1px4t6-00005o-Hj; Thu, 11 May 2023 11:55:12 +0000
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
	bh=gxiGGCrxhqXIQ9pZXMT0X4e4p8ZlYDBRB2ae+JEsPiU=; b=K6kZkkReOr2ThlgUsGw3GOhQQt
	CJjgceCW9mZKkQ+27wv+/bjf0hxYkh2hq2RzQ1GPxz748NSCMw4PSY8rI+/rrUMONQIYNA7/ZYpZL
	jbtUWk+jPcMNxGBnlQkv7aLdUQnInIk4l1neVA2lGFJJ4JEs8MrekRYxD5Oo6pdN40nw=;
Message-ID: <09f4eef3-df60-ee90-bc5b-7e61ef9788a0@xen.org>
Date: Thu, 11 May 2023 12:55:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH] xen/arm: domain_build: Propagate return code of
 map_irq_to_domain()
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230511112531.705-1-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230511112531.705-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 11/05/2023 12:25, Michal Orzel wrote:
>  From map_dt_irq_to_domain() we are assigning a return code of
> map_irq_to_domain() to a variable without checking it for an error.
> Fix it by propagating the return code directly since this is the last
> call.
> 
> Take the opportunity to use the correct printk() format specifiers,
> since both irq and domain id are of unsigned types.

I would rather prefer if this is split in a separate patch because while 
we want to backport the first part, I don't think the latter wants to be.

> 
> Fixes: 467e5cbb2ffc ("xen: arm: consolidate mmio and irq mapping to dom0")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
>   xen/arch/arm/domain_build.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index f80fdd1af206..2c14718bff87 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2303,7 +2303,7 @@ static int __init map_dt_irq_to_domain(const struct dt_device_node *dev,
>   
>       if ( irq < NR_LOCAL_IRQS )
>       {
> -        printk(XENLOG_ERR "%s: IRQ%"PRId32" is not a SPI\n",
> +        printk(XENLOG_ERR "%s: IRQ%u is not a SPI\n",
>                  dt_node_name(dev), irq);
>           return -EINVAL;
>       }
> @@ -2313,14 +2313,14 @@ static int __init map_dt_irq_to_domain(const struct dt_device_node *dev,
>       if ( res )
>       {
>           printk(XENLOG_ERR
> -               "%s: Unable to setup IRQ%"PRId32" to dom%d\n",
> +               "%s: Unable to setup IRQ%u to dom%u\n",
>                  dt_node_name(dev), irq, d->domain_id);

Please switch %pd when printing the domain.

>           return res;
>       }
>   
>       res = map_irq_to_domain(d, irq, !mr_data->skip_mapping, dt_node_name(dev));
>   
> -    return 0;
> +    return res;
>   }
>   
>   int __init map_range_to_domain(const struct dt_device_node *dev,

Cheers,

-- 
Julien Grall

