Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 446071C1007
	for <lists+xen-devel@lfdr.de>; Fri,  1 May 2020 10:50:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jURNI-0003fi-Di; Fri, 01 May 2020 08:50:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s7FD=6P=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jURNH-0003fb-Oc
 for xen-devel@lists.xenproject.org; Fri, 01 May 2020 08:50:23 +0000
X-Inumbo-ID: cb31414f-8b88-11ea-9af3-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cb31414f-8b88-11ea-9af3-12813bfff9fa;
 Fri, 01 May 2020 08:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YoTKvPMAknxrTnJEGDXlTHukXwmOTzocpuRBu4Fjzbg=; b=ExJMM04sMi/ZCbB5bUUivhzk8v
 6J7G248yzz0nC9duNw4T+ZbC8+cFw6e9XQG+mRhvwJaGweLA3OlVmaWa2H+tYSWZUWVGSv7qpc2s3
 u/pkhdg9EuM94i8yBwlfxzDxFwnB2413ldraOJAIIbn1e2mTDFP7xYBkiyXHTTU7/Crs=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jURNE-0005GT-Th; Fri, 01 May 2020 08:50:20 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jURNE-0003Mz-MN; Fri, 01 May 2020 08:50:20 +0000
Subject: Re: [PATCH 13/16] xen/page_alloc: add a path for xenheap when there
 is no direct map
To: Hongyan Xia <hx242@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1588278317.git.hongyxia@amazon.com>
 <32ae7c14babf7e78b60febb53095a74c5e865456.1588278317.git.hongyxia@amazon.com>
From: Julien Grall <julien@xen.org>
Message-ID: <4faf56ec-1495-8b77-8a3c-ef9ec7c515c6@xen.org>
Date: Fri, 1 May 2020 09:50:18 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <32ae7c14babf7e78b60febb53095a74c5e865456.1588278317.git.hongyxia@amazon.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Hongyan,

On 30/04/2020 21:44, Hongyan Xia wrote:
> From: Hongyan Xia <hongyxia@amazon.com>
> 
> When there is not an always-mapped direct map, xenheap allocations need
> to be mapped and unmapped on-demand.
> 
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> ---
>   xen/common/page_alloc.c | 45 ++++++++++++++++++++++++++++++++++++++---
>   1 file changed, 42 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 10b7aeca48..1285fc5977 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -2143,6 +2143,7 @@ void init_xenheap_pages(paddr_t ps, paddr_t pe)
>   void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
>   {
>       struct page_info *pg;
> +    void *ret;
>   
>       ASSERT(!in_irq());
>   
> @@ -2151,14 +2152,27 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
>       if ( unlikely(pg == NULL) )
>           return NULL;
>   
> -    memguard_unguard_range(page_to_virt(pg), 1 << (order + PAGE_SHIFT));
> +    ret = page_to_virt(pg);
>   
> -    return page_to_virt(pg);
> +    if ( !arch_has_directmap() &&
> +         map_pages_to_xen((unsigned long)ret, page_to_mfn(pg), 1UL << order,
> +                          PAGE_HYPERVISOR) )

The only user (arm32) of split domheap/xenheap has no directmap. So this 
will break arm32 as we don't support superpage shattering (for good 
reasons).

In this configuration, only xenheap pages are always mapped. Domheap 
will be mapped on-demand. So I don't think we need to map/unmap xenheap 
pages at allocation/free.

Cheers,

-- 
Julien Grall

