Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F39B63C436
	for <lists+xen-devel@lfdr.de>; Tue, 29 Nov 2022 16:54:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449514.706317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p02vX-0004ph-JQ; Tue, 29 Nov 2022 15:53:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449514.706317; Tue, 29 Nov 2022 15:53:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p02vX-0004mI-Fk; Tue, 29 Nov 2022 15:53:43 +0000
Received: by outflank-mailman (input) for mailman id 449514;
 Tue, 29 Nov 2022 15:53:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p02vW-0004m1-1W
 for xen-devel@lists.xenproject.org; Tue, 29 Nov 2022 15:53:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p02vV-0001df-Mt; Tue, 29 Nov 2022 15:53:41 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=[192.168.9.110]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p02vV-0008HQ-Go; Tue, 29 Nov 2022 15:53:41 +0000
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
	bh=ilt3lKMFUm97J6gfNNDVmLkNJvhQNKtlk2lriTh3+Sk=; b=O+wuzDTjLfh6dJq7ma6yJdqYKK
	wYJ+goTyKI5gnBTO2kGmFUOwfdCZ0agFpM7/PAwc7JbscK512ZyEy1KB2RhEpDg4mcw7R0VZJ8gTD
	QN6/zPydvNXWQr/j5wSCsVr825HhwmaTPzOWwO3VQOrgbXma/5hLCyl+bU/B+que+miU=;
Message-ID: <711bf14e-7059-6bf3-4337-c25d027cc532@xen.org>
Date: Tue, 29 Nov 2022 15:53:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH] Arm/P2M: reduce locking in p2m_{alloc,free}_page()
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <c29a48ba-a662-f92a-4b97-0694dc93684a@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c29a48ba-a662-f92a-4b97-0694dc93684a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 29/11/2022 15:39, Jan Beulich wrote:
> It is generally preferable to not hold locks around allocation
> functions. And indeed in the hwdom case there's no point at all to hold
> the paging lock. Reduce the locked regions to the non-hwdom case, while
> at the same time arranging for p2m_alloc_page() to have just a single
> return point.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

> 
> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -48,7 +48,6 @@ static struct page_info *p2m_alloc_page(
>   {
>       struct page_info *pg;
>   
> -    spin_lock(&d->arch.paging.lock);
>       /*
>        * For hardware domain, there should be no limit in the number of pages that
>        * can be allocated, so that the kernel may take advantage of the extended
> @@ -58,34 +57,28 @@ static struct page_info *p2m_alloc_page(
>       {
>           pg = alloc_domheap_page(NULL, 0);
>           if ( pg == NULL )
> -        {
>               printk(XENLOG_G_ERR "Failed to allocate P2M pages for hwdom.\n");
> -            spin_unlock(&d->arch.paging.lock);
> -            return NULL;
> -        }
>       }
>       else
>       {
> +        spin_lock(&d->arch.paging.lock);
>           pg = page_list_remove_head(&d->arch.paging.p2m_freelist);
> -        if ( unlikely(!pg) )
> -        {
> -            spin_unlock(&d->arch.paging.lock);
> -            return NULL;
> -        }
> +        spin_unlock(&d->arch.paging.lock);
>       }
> -    spin_unlock(&d->arch.paging.lock);
>   
>       return pg;
>   }
>   
>   static void p2m_free_page(struct domain *d, struct page_info *pg)
>   {
> -    spin_lock(&d->arch.paging.lock);
>       if ( is_hardware_domain(d) )
>           free_domheap_page(pg);
>       else
> +    {
> +        spin_lock(&d->arch.paging.lock);
>           page_list_add_tail(pg, &d->arch.paging.p2m_freelist);
> -    spin_unlock(&d->arch.paging.lock);
> +        spin_unlock(&d->arch.paging.lock);
> +    }
>   }
>   
>   /* Return the size of the pool, in bytes. */

-- 
Julien Grall

