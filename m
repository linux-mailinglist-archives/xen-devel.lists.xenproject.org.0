Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4744E31CDFB
	for <lists+xen-devel@lfdr.de>; Tue, 16 Feb 2021 17:28:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.85945.160908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC3CQ-0003Er-GO; Tue, 16 Feb 2021 16:27:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85945.160908; Tue, 16 Feb 2021 16:27:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC3CQ-0003ER-DE; Tue, 16 Feb 2021 16:27:42 +0000
Received: by outflank-mailman (input) for mailman id 85945;
 Tue, 16 Feb 2021 16:27:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lC3CO-0003EF-V9
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 16:27:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lC3CN-0004Ui-Vb; Tue, 16 Feb 2021 16:27:39 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lC3CN-0005jD-Ou; Tue, 16 Feb 2021 16:27:39 +0000
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
	bh=DCI+BtU6LfMqY9BMnR7Jf3s3R8a2DrxZCuIrxTkqtAI=; b=5Ra9B4eh8aKd30TYqZKTDi63bA
	GApQCrBP9BpvB/Thtql0JSL3DCste0Es8cLn0sdpfVB0tCjmbH33z/bVbAO+KjkOO6Hg0zD/w6TvW
	hZT3EL7SaCL5rks9QBMg1OuV9p7I/3Hk6qm636m1ZA8pGH4JPFp06GEhAlo2W4YhwiB0=;
Subject: Re: [PATCH v1.1 03/10] tools/libxg: Drop stale p2m logic from ARM's
 meminit()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20210212153953.4582-4-andrew.cooper3@citrix.com>
 <20210212200139.26911-1-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <0f973282-770e-bab8-2918-541f1740eace@xen.org>
Date: Tue, 16 Feb 2021 16:27:37 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210212200139.26911-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 12/02/2021 20:01, Andrew Cooper wrote:
> Various version of gcc, when compiling with -Og, complain:
> 
>    xg_dom_arm.c: In function 'meminit':
>    xg_dom_arm.c:420:19: error: 'p2m_size' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>      420 |     dom->p2m_size = p2m_size;
>          |     ~~~~~~~~~~~~~~^~~~~~~~~~
> 
> This is actually entirely stale code since ee21f10d70^..97e34ad22d which
> removed the 1:1 identity p2m for translated domains.
> 
> Drop the write of d->p2m_size, and the p2m_size local variable.  Reposition
> the p2m_size field in struct xc_dom_image and correct some stale
> documentation.
> 
> This change really ought to have been part of the original cleanup series.
> 
> No actual change to how ARM domains are constructed.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
> CC: Ian Jackson <iwj@xenproject.org>
> CC: Wei Liu <wl@xen.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> 
> v2:
>   * Delete stale p2m_size infrastructure.
> ---
>   tools/include/xenguest.h      | 5 ++---
>   tools/libs/guest/xg_dom_arm.c | 5 -----
>   2 files changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
> index 775cf34c04..217022b6e7 100644
> --- a/tools/include/xenguest.h
> +++ b/tools/include/xenguest.h
> @@ -145,6 +145,7 @@ struct xc_dom_image {
>        * eventually copied into guest context.
>        */
>       xen_pfn_t *pv_p2m;
> +    xen_pfn_t p2m_size;         /* number of pfns covered by pv_p2m */
>   
>       /* physical memory
>        *
> @@ -154,12 +155,10 @@ struct xc_dom_image {
>        *
>        * An ARM guest has GUEST_RAM_BANKS regions of RAM, with
>        * rambank_size[i] pages in each. The lowest RAM address
> -     * (corresponding to the base of the p2m arrays above) is stored
> -     * in rambase_pfn.
> +     * is stored in rambase_pfn.
>        */
>       xen_pfn_t rambase_pfn;
>       xen_pfn_t total_pages;
> -    xen_pfn_t p2m_size;         /* number of pfns covered by p2m */
>       struct xc_dom_phys *phys_pages;
>   #if defined (__arm__) || defined(__aarch64__)
>       xen_pfn_t rambank_size[GUEST_RAM_BANKS];
> diff --git a/tools/libs/guest/xg_dom_arm.c b/tools/libs/guest/xg_dom_arm.c
> index 94948d2b20..b4c24f15fb 100644
> --- a/tools/libs/guest/xg_dom_arm.c
> +++ b/tools/libs/guest/xg_dom_arm.c
> @@ -373,7 +373,6 @@ static int meminit(struct xc_dom_image *dom)
>       const uint64_t modsize = dtb_size + ramdisk_size;
>       const uint64_t ram128mb = bankbase[0] + (128<<20);
>   
> -    xen_pfn_t p2m_size;
>       uint64_t bank0end;
>   
>       assert(dom->rambase_pfn << XC_PAGE_SHIFT == bankbase[0]);
> @@ -409,16 +408,12 @@ static int meminit(struct xc_dom_image *dom)
>   
>           ramsize -= banksize;
>   
> -        p2m_size = ( bankbase[i] + banksize - bankbase[0] ) >> XC_PAGE_SHIFT;
> -
>           dom->rambank_size[i] = banksize >> XC_PAGE_SHIFT;
>       }
>   
>       assert(dom->rambank_size[0] != 0);
>       assert(ramsize == 0); /* Too much RAM is rejected above */
>   
> -    dom->p2m_size = p2m_size;
> -
>       /* setup initial p2m and allocate guest memory */
>       for ( i = 0; i < GUEST_RAM_BANKS && dom->rambank_size[i]; i++ )
>       {
> 

-- 
Julien Grall

