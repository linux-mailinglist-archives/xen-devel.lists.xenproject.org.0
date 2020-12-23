Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 358782E1D72
	for <lists+xen-devel@lfdr.de>; Wed, 23 Dec 2020 15:35:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58400.102648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks5Dr-000458-VX; Wed, 23 Dec 2020 14:34:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58400.102648; Wed, 23 Dec 2020 14:34:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks5Dr-00044j-SA; Wed, 23 Dec 2020 14:34:39 +0000
Received: by outflank-mailman (input) for mailman id 58400;
 Wed, 23 Dec 2020 14:34:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zN8f=F3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ks5Dp-00044d-NO
 for xen-devel@lists.xenproject.org; Wed, 23 Dec 2020 14:34:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ebcfa173-e689-4ed6-816e-57e4df780d97;
 Wed, 23 Dec 2020 14:34:36 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6336CACC6;
 Wed, 23 Dec 2020 14:34:35 +0000 (UTC)
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
X-Inumbo-ID: ebcfa173-e689-4ed6-816e-57e4df780d97
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608734075; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yBRFO0fMu//VJVUASebih4NIM7CO71uywLxAhKadaas=;
	b=Bm0pxWiAZhOsA3R56e5GflaJqhwgIDgvJ1g4DsVOCZfXyS4U0ePBWGDqH2C9S3sH3Jp5sG
	I3PvEWopXuFxDEly50RlKPbDheFBhWIhwF8MUUQixOrFz4Q4tDTT+53a0HZHoEp/Uw3gRw
	CNEKtZw4OyrMlDzpZgmLcnOIEoLy7xg=
Subject: Re: [PATCH for-4.15 4/4] xen/iommu: x86: Don't leak the IOMMU
 page-tables
To: Julien Grall <julien@xen.org>
Cc: hongyxia@amazon.co.uk, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20201222154338.9459-1-julien@xen.org>
 <20201222154338.9459-5-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <beb22b59-701e-462c-5080-e99033079204@suse.com>
Date: Wed, 23 Dec 2020 15:34:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201222154338.9459-5-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22.12.2020 16:43, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> The new IOMMU page-tables allocator will release the pages when
> relinquish the domain resources. However, this is not sufficient in two
> cases:
>     1) domain_relinquish_resources() is not called when the domain
>     creation fails.

Could you remind me of what IOMMU page table insertions there
are during domain creation? No memory got allocated to the
domain at that point yet, so it would seem to me there simply
is nothing to map.

>     2) There is nothing preventing page-table allocations when the
>     domain is dying.
> 
> In both cases, this can be solved by freeing the page-tables again
> when the domain destruction. Although, this may result to an high
> number of page-tables to free.

Since I've seen this before in this series, and despite me also
not being a native speaker, as a nit: I don't think it can
typically be other than "result in".

> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -2290,7 +2290,7 @@ int domain_relinquish_resources(struct domain *d)
>  
>      PROGRESS(iommu_pagetables):
>  
> -        ret = iommu_free_pgtables(d);
> +        ret = iommu_free_pgtables(d, false);

I suppose you mean "true" here, but I also think the other
approach (checking for DOMDYING_dead, which you don't seem to
like very much) is better, if for no other reason than it
already being used elsewhere.

> @@ -305,6 +320,19 @@ struct page_info *iommu_alloc_pgtable(struct domain *d)
>          memflags = MEMF_node(hd->node);
>  #endif
>  
> +    /*
> +     * The IOMMU page-tables are freed when relinquishing the domain, but
> +     * nothing prevent allocation to happen afterwards. There is no valid
> +     * reasons to continue to update the IOMMU page-tables while the
> +     * domain is dying.
> +     *
> +     * So prevent page-table allocation when the domain is dying. Note
> +     * this doesn't fully prevent the race because d->is_dying may not
> +     * yet be seen.
> +     */
> +    if ( d->is_dying )
> +        return NULL;
> +
>      pg = alloc_domheap_page(NULL, memflags);
>      if ( !pg )
>          return NULL;

As said in reply to an earlier patch - with a suitable
spin_barrier() you can place your check further down, along the
lines of

    spin_lock(&hd->arch.pgtables.lock);
    if ( likely(!d->is_dying) )
    {
        page_list_add(pg, &hd->arch.pgtables.list);
        p = NULL;
    }
    spin_unlock(&hd->arch.pgtables.lock);

    if ( p )
    {
        free_domheap_page(pg);
        pg = NULL;
    }

(albeit I'm relatively sure you won't like the re-purposing of
p, but that's a minor detail). (FREE_DOMHEAP_PAGE() would be
nice to use here, but we seem to only have FREE_XENHEAP_PAGE()
so far.)

Jan

