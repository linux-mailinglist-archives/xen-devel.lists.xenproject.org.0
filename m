Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AA4387571
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 11:46:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128995.242139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liwIG-0007nB-Bf; Tue, 18 May 2021 09:45:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128995.242139; Tue, 18 May 2021 09:45:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liwIG-0007l4-8K; Tue, 18 May 2021 09:45:40 +0000
Received: by outflank-mailman (input) for mailman id 128995;
 Tue, 18 May 2021 09:45:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1liwIE-0007kw-Sv
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 09:45:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1liwIE-0007xr-Mw; Tue, 18 May 2021 09:45:38 +0000
Received: from [54.239.6.190] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1liwIE-0006WW-HA; Tue, 18 May 2021 09:45:38 +0000
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
	bh=s+1ASYDTgKbn0iWzEQV8ALRZyiGQ0s1pFIA8eajwG8s=; b=KOlehsTrTQ1iwT/AdUByONkJhn
	ybzWLipvsHkD7MfNDs7tcpizWlg77b3mZMvvYGwJ4LWMCEABV/XCkBSSW0CPPKLKqWIBbskpAye40
	Zryg8Yaocap6QVuXYPGkcXlSznkfUKD+WGZI8s5XoZAs7HM9FbmjajEOCj5Fm2QqdbN4=;
Subject: Re: [PATCH 03/10] xen/arm: introduce PGC_reserved
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com, nd@arm.com
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-4-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <bc6a20ef-675d-bbd6-74f7-4ecc45805ee7@xen.org>
Date: Tue, 18 May 2021 10:45:36 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210518052113.725808-4-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 18/05/2021 06:21, Penny Zheng wrote:
> In order to differentiate pages of static memory, from those allocated from
> heap, this patch introduces a new page flag PGC_reserved to tell.
> 
> New struct reserved in struct page_info is to describe reserved page info,
> that is, which specific domain this page is reserved to. >
> Helper page_get_reserved_owner and page_set_reserved_owner are
> designated to get/set reserved page's owner.
> 
> Struct domain is enlarged to more than PAGE_SIZE, due to newly-imported
> struct reserved in struct page_info.

struct domain may embed a pointer to a struct page_info but never 
directly embed the structure. So can you clarify what you mean?

> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
>   xen/include/asm-arm/mm.h | 16 +++++++++++++++-
>   1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/include/asm-arm/mm.h b/xen/include/asm-arm/mm.h
> index 0b7de3102e..d8922fd5db 100644
> --- a/xen/include/asm-arm/mm.h
> +++ b/xen/include/asm-arm/mm.h
> @@ -88,7 +88,15 @@ struct page_info
>            */
>           u32 tlbflush_timestamp;
>       };
> -    u64 pad;
> +
> +    /* Page is reserved. */
> +    struct {
> +        /*
> +         * Reserved Owner of this page,
> +         * if this page is reserved to a specific domain.
> +         */
> +        struct domain *domain;
> +    } reserved;

The space in page_info is quite tight, so I would like to avoid 
introducing new fields unless we can't get away from it.

In this case, it is not clear why we need to differentiate the "Owner" 
vs the "Reserved Owner". It might be clearer if this change is folded in 
the first user of the field.

As an aside, for 32-bit Arm, you need to add a 4-byte padding.

>   };
>   
>   #define PG_shift(idx)   (BITS_PER_LONG - (idx))
> @@ -108,6 +116,9 @@ struct page_info
>     /* Page is Xen heap? */
>   #define _PGC_xen_heap     PG_shift(2)
>   #define PGC_xen_heap      PG_mask(1, 2)
> +  /* Page is reserved, referring static memory */

I would drop the second part of the sentence because the flag could be 
used for other purpose. One example is reserved memory when Live Updating.

> +#define _PGC_reserved     PG_shift(3)
> +#define PGC_reserved      PG_mask(1, 3)
>   /* ... */
>   /* Page is broken? */
>   #define _PGC_broken       PG_shift(7)
> @@ -161,6 +172,9 @@ extern unsigned long xenheap_base_pdx;
>   #define page_get_owner(_p)    (_p)->v.inuse.domain
>   #define page_set_owner(_p,_d) ((_p)->v.inuse.domain = (_d))
>   
> +#define page_get_reserved_owner(_p)    (_p)->reserved.domain
> +#define page_set_reserved_owner(_p,_d) ((_p)->reserved.domain = (_d))
> +
>   #define maddr_get_owner(ma)   (page_get_owner(maddr_to_page((ma))))
>   
>   #define frame_table ((struct page_info *)FRAMETABLE_VIRT_START)
> 

Cheers,

-- 
Julien Grall

