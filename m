Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3921E38735A
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 09:35:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128905.241957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liuFY-0006bN-U9; Tue, 18 May 2021 07:34:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128905.241957; Tue, 18 May 2021 07:34:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liuFY-0006Yj-QO; Tue, 18 May 2021 07:34:44 +0000
Received: by outflank-mailman (input) for mailman id 128905;
 Tue, 18 May 2021 07:34:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tO0P=KN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1liuFX-0006Yd-2M
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 07:34:43 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f7e0ecfa-3ae4-4128-b52a-82cbc2c9d463;
 Tue, 18 May 2021 07:34:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 09C0EAD12;
 Tue, 18 May 2021 07:34:41 +0000 (UTC)
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
X-Inumbo-ID: f7e0ecfa-3ae4-4128-b52a-82cbc2c9d463
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621323281; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kShlrabaw4ls32FAThQfFmZqAFnLYEfnF1x1a3abZqg=;
	b=l/jEKPLyua2VMl/MeXHdPP2JyqQ0iWgGJAt5cP97LF4Z8pMNacc/LXgKt0Gp5ACLW5XsWq
	DY1tXQHkgN0gYO8pavKMKTqNxvOesXl3DGw/oC+f8iBMOoXVlZSqsWuvvQinFIy337K9di
	aKb9u3PxO0Jed17KB4e6MkfvRGCmpdg=
Subject: Re: [PATCH 07/10] xen/arm: intruduce alloc_domstatic_pages
To: Penny Zheng <penny.zheng@arm.com>
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com, nd@arm.com,
 xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-8-penny.zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7e4706dc-70ea-4dc9-3d70-f07396b462d8@suse.com>
Date: Tue, 18 May 2021 09:34:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210518052113.725808-8-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 18.05.2021 07:21, Penny Zheng wrote:
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -2447,6 +2447,9 @@ int assign_pages(
>      {
>          ASSERT(page_get_owner(&pg[i]) == NULL);
>          page_set_owner(&pg[i], d);
> +        /* use page_set_reserved_owner to set its reserved domain owner. */
> +        if ( (pg[i].count_info & PGC_reserved) )
> +            page_set_reserved_owner(&pg[i], d);

Now this is puzzling: What's the point of setting two owner fields
to the same value? I also don't recall you having introduced
page_set_reserved_owner() for x86, so how is this going to build
there?

> @@ -2509,6 +2512,56 @@ struct page_info *alloc_domheap_pages(
>      return pg;
>  }
>  
> +/*
> + * Allocate nr_pfns contiguous pages, starting at #start, of static memory,
> + * then assign them to one specific domain #d.
> + * It is the equivalent of alloc_domheap_pages for static memory.
> + */
> +struct page_info *alloc_domstatic_pages(
> +        struct domain *d, unsigned long nr_pfns, paddr_t start,
> +        unsigned int memflags)
> +{
> +    struct page_info *pg = NULL;
> +    unsigned long dma_size;
> +
> +    ASSERT(!in_irq());
> +
> +    if ( memflags & MEMF_no_owner )
> +        memflags |= MEMF_no_refcount;
> +
> +    if ( !dma_bitsize )
> +        memflags &= ~MEMF_no_dma;
> +    else
> +    {
> +        dma_size = 1ul << bits_to_zone(dma_bitsize);
> +        /* Starting address shall meet the DMA limitation. */
> +        if ( dma_size && start < dma_size )
> +            return NULL;

It is the entire range (i.e. in particular the last byte) which needs
to meet such a restriction. I'm not convinced though that DMA width
restrictions and static allocation are sensible to coexist.

> +    }
> +
> +    pg = alloc_staticmem_pages(nr_pfns, start, memflags);
> +    if ( !pg )
> +        return NULL;
> +
> +    if ( d && !(memflags & MEMF_no_owner) )
> +    {
> +        if ( memflags & MEMF_no_refcount )
> +        {
> +            unsigned long i;
> +
> +            for ( i = 0; i < nr_pfns; i++ )
> +                pg[i].count_info = PGC_extra;
> +        }

Is this as well as the MEMF_no_owner case actually meaningful for
statically allocated pages?

Jan

