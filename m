Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A36831692F
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 15:32:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83623.156082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9qXZ-00040z-Ki; Wed, 10 Feb 2021 14:32:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83623.156082; Wed, 10 Feb 2021 14:32:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9qXZ-00040a-H6; Wed, 10 Feb 2021 14:32:25 +0000
Received: by outflank-mailman (input) for mailman id 83623;
 Wed, 10 Feb 2021 14:32:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jO30=HM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l9qXX-00040V-Sk
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 14:32:23 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bb99d8f2-abf9-4f0c-963d-f5dbf8ff88d8;
 Wed, 10 Feb 2021 14:32:22 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 834BCB1B1;
 Wed, 10 Feb 2021 14:32:21 +0000 (UTC)
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
X-Inumbo-ID: bb99d8f2-abf9-4f0c-963d-f5dbf8ff88d8
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612967541; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ddUnG2xVvUFWFetPfW/UI4nCG0WTOcWrTehPZZknISg=;
	b=MtFnysHK2UE0k1jsaMEtzCL5cSt0nkdmS07Y3Rbml4LDByZvmMleRnBTvD15ziitcQZtb/
	yWSf5TrAPnWZt7ys5WAtT89YCSTcpIWr/0vRYaoV15aMWVsZswZDkEdYe7MDNb6lLG2g17
	oxgFNxiG6N5TsKNXj1CHUF7pL/CI3wQ=
Subject: Re: [for-4.15][PATCH v2 4/5] xen/iommu: x86: Don't leak the IOMMU
 page-tables
To: Julien Grall <julien@xen.org>
Cc: hongyxia@amazon.co.uk, iwj@xenproject.org,
 Julien Grall <jgrall@amazon.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210209152816.15792-1-julien@xen.org>
 <20210209152816.15792-5-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <62a791cb-a880-4097-5fec-4f728751b58b@suse.com>
Date: Wed, 10 Feb 2021 15:32:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210209152816.15792-5-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09.02.2021 16:28, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> The new IOMMU page-tables allocator will release the pages when
> relinquish the domain resources. However, this is not sufficient when
> the domain is dying because nothing prevents page-table to be allocated.
> 
> iommu_alloc_pgtable() is now checking if the domain is dying before
> adding the page in the list. We are relying on &hd->arch.pgtables.lock
> to synchronize d->is_dying.

As said in reply to an earlier patch, I think suppressing
(really: ignoring) new mappings would be better. You could
utilize the same lock, but you'd need to duplicate the
checking in {amd,intel}_iommu_map_page().

I'm not entirely certain in the case about unmap requests:
It may be possible to also suppress/ignore them, but this
may require some further thought.

Apart from this, just in case we settle on your current
approach, a few spelling nits:

> --- a/xen/drivers/passthrough/x86/iommu.c
> +++ b/xen/drivers/passthrough/x86/iommu.c
> @@ -149,6 +149,13 @@ int arch_iommu_domain_init(struct domain *d)
>  
>  void arch_iommu_domain_destroy(struct domain *d)
>  {
> +    /*
> +     * There should be not page-tables left allocated by the time the

... should be no ...

> +     * domain is destroyed. Note that arch_iommu_domain_destroy() is
> +     * called unconditionally, so pgtables may be unitialized.

uninitialized

> @@ -303,9 +317,29 @@ struct page_info *iommu_alloc_pgtable(struct domain *d)
>      unmap_domain_page(p);
>  
>      spin_lock(&hd->arch.pgtables.lock);
> -    page_list_add(pg, &hd->arch.pgtables.list);
> +    /*
> +     * The IOMMU page-tables are freed when relinquishing the domain, but
> +     * nothing prevent allocation to happen afterwards. There is no valid

prevents

> +     * reasons to continue to update the IOMMU page-tables while the

reason

> +     * domain is dying.
> +     *
> +     * So prevent page-table allocation when the domain is dying.
> +     *
> +     * We relying on &hd->arch.pgtables.lock to synchronize d->is_dying.

rely

Jan

