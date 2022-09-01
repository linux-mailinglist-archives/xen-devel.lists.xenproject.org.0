Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A9D5A996C
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 15:53:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396635.636858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTkcl-0008Ki-Ot; Thu, 01 Sep 2022 13:52:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396635.636858; Thu, 01 Sep 2022 13:52:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTkcl-0008Ik-M2; Thu, 01 Sep 2022 13:52:51 +0000
Received: by outflank-mailman (input) for mailman id 396635;
 Thu, 01 Sep 2022 13:52:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oTkck-0008I8-79
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 13:52:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oTkcj-0004oT-Pj; Thu, 01 Sep 2022 13:52:49 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.12.167]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oTkcj-0003v0-IE; Thu, 01 Sep 2022 13:52:49 +0000
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
	bh=Ax6EyUP8IlhrPDpDqbHNfbG0obJxlV2kF881bCNVjtw=; b=Noekl/PvEnwq/PBFERKMnqDV8K
	jVyZDquDKVjL782qGQXovaeTWA/z/lFWF5rZ5u2Cm5yvWuwJ5KxUBZ135g92lqg+6jtcXcdoXQ/86
	gV2TAB/0CyRyZStyrI5nGV5F+35SxFRqvldvFX6rgc3AZlsHmwobTJBsVGeyxXJShixo=;
Message-ID: <9d328b4d-ef7a-e457-428d-83a2b2351465@xen.org>
Date: Thu, 1 Sep 2022 14:52:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.0
Subject: Re: [PATCH v11 6/6] xen: retrieve reserved pages on populate_physmap
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220831024041.468757-1-Penny.Zheng@arm.com>
 <20220831024041.468757-7-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220831024041.468757-7-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 31/08/2022 03:40, Penny Zheng wrote:
> +/*
> + * Acquire a page from reserved page list(resv_page_list), when populating
> + * memory for static domain on runtime.
> + */
> +mfn_t acquire_reserved_page(struct domain *d, unsigned int memflags)
> +{
> +    struct page_info *page;
> +
> +    ASSERT_ALLOC_CONTEXT();
> +
> +    /* Acquire a page from reserved page list(resv_page_list). */
> +    spin_lock(&d->page_alloc_lock);
> +    page = page_list_remove_head(&d->resv_page_list);
> +    spin_unlock(&d->page_alloc_lock);
> +    if ( unlikely(!page) )
> +        return INVALID_MFN;
> +
> +    if ( !prepare_staticmem_pages(page, 1, memflags) )
> +        goto fail;
> +
> +    if ( assign_domstatic_pages(d, page, 1, memflags) )
> +        goto fail_assign;
> +
> +    return page_to_mfn(page);
> +
> + fail_assign:
> +    unprepare_staticmem_pages(page, 1, false);

Looking at assign_domstatic_pages(). It will already call 
unprepare_staticmem_pages() in one of the error path. It doesn't look 
like the latter can be called twice on a page.

To be honest, I find a bit odd that assign_domstatic_pages() is calling 
unprepare_staticmem_pages() because the former doesn't call the 
"prepare" function.

AFAICT, this is an issue introduced in this patch. So I would remove the 
call from assign_domstatic_pages() and then let the caller calls 
unprepare_staticmem_pages() (this would need to be added in 
acquire_domstatic_pages()).

Also, I think it would be good to explain why we don't need to scrub. 
Something like:

"The page was never accessible by the domain. So scrubbing can be skipped".

Cheers,

-- 
Julien Grall

