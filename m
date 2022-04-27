Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CE45114B7
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 12:11:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314798.533024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njedO-0002pn-Ch; Wed, 27 Apr 2022 10:10:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314798.533024; Wed, 27 Apr 2022 10:10:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njedO-0002nk-9m; Wed, 27 Apr 2022 10:10:58 +0000
Received: by outflank-mailman (input) for mailman id 314798;
 Wed, 27 Apr 2022 10:10:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1njedM-0002ne-Q4
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 10:10:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1njedM-0002wm-Bp; Wed, 27 Apr 2022 10:10:56 +0000
Received: from [54.239.6.186] (helo=[192.168.24.58])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1njedM-0002Pm-5S; Wed, 27 Apr 2022 10:10:56 +0000
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
	bh=Swv8BnOE/ILYeOAyzk6Q96DEZl1xyulyMQzFat9OreE=; b=GYjn5stC2BOP5VjLVjj5V4G7ns
	GGg1AUkUX+tvlKynQX45OVgOsx/dv2iIL7XWml5Pia8k/2W97fSeBfMOOIH9P7QMhrtZRpHNnqAcW
	tVFy4ndUp/TFYQD2DUc4DcB/l9408dyVFh0e9EEP6ve3KAigqe0c0AzzJBLPqkiPvTPk=;
Message-ID: <95b1d82e-92fa-7468-d3aa-038f0de937d9@xen.org>
Date: Wed, 27 Apr 2022 11:10:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [PATCH v3 5/6] xen/arm: unpopulate memory when domain is static
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, henry.wang@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20220427092743.925563-1-Penny.Zheng@arm.com>
 <20220427092743.925563-6-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220427092743.925563-6-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 27/04/2022 10:27, Penny Zheng wrote:
> Today when a domain unpopulates the memory on runtime, they will always
> hand the memory back to the heap allocator. And it will be a problem if domain
> is static.
> 
> Pages as guest RAM for static domain shall be reserved to only this domain
> and not be used for any other purposes, so they shall never go back to heap
> allocator.
> 
> This commit puts reserved pages on the new list resv_page_list only after
> having taken them off the "normal" list, when the last ref dropped.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
> v3 changes:
> - have page_list_del() just once out of the if()
> - remove resv_pages counter
> - make arch_free_heap_page be an expression, not a compound statement.
> ---
> v2 changes:
> - put reserved pages on resv_page_list after having taken them off
> the "normal" list
> ---
>   xen/arch/arm/include/asm/mm.h | 12 ++++++++++++
>   xen/common/domain.c           |  4 ++++
>   xen/include/xen/sched.h       |  3 +++
>   3 files changed, 19 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
> index 424aaf2823..c6426c1705 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -358,6 +358,18 @@ void clear_and_clean_page(struct page_info *page);
>   
>   unsigned int arch_get_dma_bitsize(void);
>   
> +/*
> + * Put free pages on the resv page list after having taken them
> + * off the "normal" page list, when pages from static memory
> + */
> +#ifdef CONFIG_STATIC_MEMORY
> +#define arch_free_heap_page(d, pg) ({                   \
> +    page_list_del(pg, page_to_list(d, pg));             \
> +    if ( (pg)->count_info & PGC_reserved )              \
> +        page_list_add_tail(pg, &(d)->resv_page_list);   \
> +})
> +#endif

I am a bit puzzled how this is meant to work.

Looking at the code, arch_free_heap_page() will be called from 
free_domheap_pages(). If I am not mistaken, reserved pages are not 
considered as xen heap pages, so we would go in the else which will end 
up to call free_heap_pages().

free_heap_pages() will end up to add the page in the heap allocator and 
corrupt the d->resv_page_list because there are only one link list.

What did I miss?

Cheers,

-- 
Julien Grall

