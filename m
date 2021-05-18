Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA513872F1
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 09:16:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128875.241901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1litx9-0002Lr-7e; Tue, 18 May 2021 07:15:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128875.241901; Tue, 18 May 2021 07:15:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1litx9-0002Jj-3f; Tue, 18 May 2021 07:15:43 +0000
Received: by outflank-mailman (input) for mailman id 128875;
 Tue, 18 May 2021 07:15:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tO0P=KN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1litx7-0002Jd-PR
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 07:15:41 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b4526d1e-a354-41a5-9b7b-74c0f2dd05ee;
 Tue, 18 May 2021 07:15:40 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2EA50ACF5;
 Tue, 18 May 2021 07:15:39 +0000 (UTC)
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
X-Inumbo-ID: b4526d1e-a354-41a5-9b7b-74c0f2dd05ee
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621322139; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ViA/9VBVx2zGG16Lk8Vsi237Q91m+xKo1Y9XUEB7aEs=;
	b=huruEDjKMzdoThn+foEHZt/KI+++H8fkOyM1qrxMhhcrFV4fDriXnocrVa3PSa4H5kyB4d
	ZU0PsHoFaBXia8pYQDY++TJERrfBLPWHkruqP78NHuwm3ER7Zt4vWlDZAhAr/4mcRZkxtF
	ixvU7BNEOPabEiphLR6yN2U92SfLx4o=
Subject: Re: [PATCH 04/10] xen/arm: static memory initialization
To: Penny Zheng <penny.zheng@arm.com>
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com, nd@arm.com,
 xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-5-penny.zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dbffa647-37e2-93b6-4041-a1344aeb1837@suse.com>
Date: Tue, 18 May 2021 09:15:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210518052113.725808-5-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 18.05.2021 07:21, Penny Zheng wrote:
> This patch introduces static memory initialization, during system RAM boot up.
> 
> New func init_staticmem_pages is the equivalent of init_heap_pages, responsible
> for static memory initialization.
> 
> Helper func free_staticmem_pages is the equivalent of free_heap_pages, to free
> nr_pfns pages of static memory.
> For each page, it includes the following steps:
> 1. change page state from in-use(also initialization state) to free state and
> grant PGC_reserved.
> 2. set its owner NULL and make sure this page is not a guest frame any more

But isn't the goal (as per the previous patch) to associate such pages
with a _specific_ domain?

> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -150,6 +150,9 @@
>  #define p2m_pod_offline_or_broken_hit(pg) 0
>  #define p2m_pod_offline_or_broken_replace(pg) BUG_ON(pg != NULL)
>  #endif
> +#ifdef CONFIG_ARM_64
> +#include <asm/setup.h>
> +#endif

Whatever it is that's needed from this header suggests the code won't
build for other architectures. I think init_staticmem_pages() in its
current shape shouldn't live in this (common) file.

> @@ -1512,6 +1515,49 @@ static void free_heap_pages(
>      spin_unlock(&heap_lock);
>  }
>  
> +/* Equivalent of free_heap_pages to free nr_pfns pages of static memory. */
> +static void free_staticmem_pages(struct page_info *pg, unsigned long nr_pfns,
> +                                 bool need_scrub)

Right now this function gets called only from an __init one. Unless
it is intended to gain further callers, it should be marked __init
itself then. Otherwise it should be made sure that other
architectures don't include this (dead there) code.

> +{
> +    mfn_t mfn = page_to_mfn(pg);
> +    int i;

This type doesn't fit nr_pfns'es.

Jan

