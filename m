Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6583031DBB9
	for <lists+xen-devel@lfdr.de>; Wed, 17 Feb 2021 15:54:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86303.161934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCODh-0000DD-Pd; Wed, 17 Feb 2021 14:54:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86303.161934; Wed, 17 Feb 2021 14:54:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCODh-0000Cr-Mg; Wed, 17 Feb 2021 14:54:25 +0000
Received: by outflank-mailman (input) for mailman id 86303;
 Wed, 17 Feb 2021 14:54:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFXw=HT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lCODf-0000Cj-SP
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 14:54:23 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e1914e24-ecf2-4c54-9d08-0b923d4dc645;
 Wed, 17 Feb 2021 14:54:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 421DBB8FA;
 Wed, 17 Feb 2021 14:54:22 +0000 (UTC)
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
X-Inumbo-ID: e1914e24-ecf2-4c54-9d08-0b923d4dc645
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613573662; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yF/cluvsiJCFqkm34Ubp610JZTcmodW0JUMP+pXIss8=;
	b=GCaOQtiLlIF7lQuBb8zh9KNKgIFxZOxRHwnAoJtipEtFqjHs96GoZ72ccI+IC0uNQG7Y2t
	q4OJqDNKwmm/AvmC9JRrk8rGDeJyoeICNdb/0kCPromd1+glij/3k7IxJYzzGktRU8jgvb
	boeyf3hoDdYfLmf/JCYF62bWb68j83o=
Subject: Re: [for-4.15][PATCH v3 1/3] xen/iommu: x86: Clear the root
 page-table before freeing the page-tables
To: Julien Grall <julien@xen.org>
Cc: hongyxia@amazon.co.uk, iwj@xenproject.org,
 Julien Grall <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210217142458.3769-1-julien@xen.org>
 <20210217142458.3769-2-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d20d31ed-4392-a7fb-66ee-575eb254ae84@suse.com>
Date: Wed, 17 Feb 2021 15:54:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210217142458.3769-2-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 17.02.2021 15:24, Julien Grall wrote:
> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> @@ -381,9 +381,18 @@ static int amd_iommu_assign_device(struct domain *d, u8 devfn,
>      return reassign_device(pdev->domain, d, devfn, pdev);
>  }
>  
> +static void iommu_clear_root_pgtable(struct domain *d)

Nit: amd_iommu_ as a prefix would be okay here considering other
(static) functions also use it. Since it is a static function,
no prefix at all would also do (my personal preference). But
iommu_ as a prefix isn't helpful and results in needless re-use
of VT-d's name.

> --- a/xen/drivers/passthrough/x86/iommu.c
> +++ b/xen/drivers/passthrough/x86/iommu.c
> @@ -267,6 +267,15 @@ int iommu_free_pgtables(struct domain *d)
>      struct page_info *pg;
>      unsigned int done = 0;
>  
> +    if ( !is_iommu_enabled(d) )
> +        return 0;
> +
> +    /*
> +     * Pages will be moved to the free list below. So we want to
> +     * clear the root page-table to avoid any potential use after-free.
> +     */
> +    hd->platform_ops->clear_root_pgtable(d);

Taking amd_iommu_alloc_root() as example, is this really correct
prior to what is now patch 2? What guarantees a new root table
won't get allocated subsequently?

Jan

