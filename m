Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5525AF15A
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 19:01:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399986.641469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVbwF-0001RN-2J; Tue, 06 Sep 2022 17:00:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399986.641469; Tue, 06 Sep 2022 17:00:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVbwE-0001PQ-Vn; Tue, 06 Sep 2022 17:00:38 +0000
Received: by outflank-mailman (input) for mailman id 399986;
 Tue, 06 Sep 2022 17:00:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oVbwD-0001PI-BH
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 17:00:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVbwD-0008Fr-1F; Tue, 06 Sep 2022 17:00:37 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=[192.168.11.176]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVbwC-0003ch-Qx; Tue, 06 Sep 2022 17:00:36 +0000
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
	bh=thc3RkjNwpk19NBiowmfLh0ne6M/EVXpRATymosj1YA=; b=kLDqs6PzCR1D21Vt+NrzBca1y3
	FAGftkPuLvVr/rkf0PhAYz4WCTMWWWuMAj5ECbjWI4xNOmcYg93cXkLezDBUTkhDIMjmS6EBW99PZ
	ANoQYOyTP6qLPAb/yC9jVHJ9Fw4ceHvJOMoKSn/CoCsPHo6zZxWCNs1MujaPWelI3764=;
Message-ID: <7eb683c8-f03e-1fec-4da8-3e1fcc5dda71@xen.org>
Date: Tue, 6 Sep 2022 18:00:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v12 6/6] xen: retrieve reserved pages on populate_physmap
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220906073919.941934-1-Penny.Zheng@arm.com>
 <20220906073919.941934-7-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220906073919.941934-7-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 06/09/2022 08:39, Penny Zheng wrote:
> When a static domain populates memory through populate_physmap at runtime,
> it shall retrieve reserved pages from resv_page_list to make sure that
> guest RAM is still restricted in statically configured memory regions.
> This commit also introduces a new helper acquire_reserved_page to make it work.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>

With one remark below:

Reviewed-by: Julien Grall <jgrall@amazon.com>

[...]

> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 18d34d1b69..215f4c234b 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -2755,9 +2755,8 @@ void free_domstatic_page(struct page_info *page)
>           put_domain(d);
>   }
>   
> -static bool __init prepare_staticmem_pages(struct page_info *pg,
> -                                           unsigned long nr_mfns,
> -                                           unsigned int memflags)
> +static bool prepare_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
> +                                    unsigned int memflags)
>   {
>       bool need_tlbflush = false;
>       uint32_t tlbflush_timestamp = 0;
> @@ -2838,6 +2837,25 @@ static struct page_info * __init acquire_staticmem_pages(mfn_t smfn,
>       return pg;
>   }
>   
> +static int assign_domstatic_pages(struct domain *d, struct page_info *pg,
> +                                  unsigned int nr_mfns, unsigned int memflags)
> +{
> +    if ( !d || (memflags & (MEMF_no_owner | MEMF_no_refcount)) )
> +    {
> +        /*
> +         * Respective handling omitted here because right now
> +         * acquired static memory is only for guest RAM.

"guest" commonly refers to any domain other than dom0. However, I can't 
see why this code couldn't be used by dom0. So it should be s/guest/domain/.

I will modify it on commit.

> +         */
> +        ASSERT_UNREACHABLE();
> +        return -EINVAL;
> +    }
> +
> +    if ( assign_pages(pg, nr_mfns, d, memflags) )
> +        return -EINVAL;
> +
> +    return 0;
> +}
> +

Cheers,

-- 
Julien Grall

