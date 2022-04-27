Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E115114D6
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 12:23:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314832.533079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njepW-0006sb-Sd; Wed, 27 Apr 2022 10:23:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314832.533079; Wed, 27 Apr 2022 10:23:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njepW-0006qm-PW; Wed, 27 Apr 2022 10:23:30 +0000
Received: by outflank-mailman (input) for mailman id 314832;
 Wed, 27 Apr 2022 10:23:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1njepU-0006qg-PF
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 10:23:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1njepU-0003Ed-8G; Wed, 27 Apr 2022 10:23:28 +0000
Received: from [54.239.6.186] (helo=[192.168.24.58])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1njepU-0003Cz-21; Wed, 27 Apr 2022 10:23:28 +0000
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
	bh=yyH+NTdb5aFo6DqjZPL8BPt+tc+8CVzRwLJFZqn5viQ=; b=pWMggW8tLh4jG7tzm6nmjDhvw/
	NLE5kl/6k0gQB0EbOPtC/ASKlzyAEJDkqev2H4UNypLmZR+Dj/vgLwrVlngQ6lAV9h+CfU+n6SOaN
	AoahTZJyV3AaaRH1Z85fSvD/LASFXAFWinkh7QrGa0DYGqC/iGJ9Rjtcdhg2sLsxxe3k=;
Message-ID: <433f9e2a-9da7-662f-04b5-0379eca7496f@xen.org>
Date: Wed, 27 Apr 2022 11:23:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [PATCH v3 5/6] xen/arm: unpopulate memory when domain is static
To: Penny Zheng <Penny.Zheng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Chen <Wei.Chen@arm.com>, Henry Wang <Henry.Wang@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20220427092743.925563-1-Penny.Zheng@arm.com>
 <20220427092743.925563-6-Penny.Zheng@arm.com>
 <95b1d82e-92fa-7468-d3aa-038f0de937d9@xen.org>
 <DU2PR08MB73250D118F81DF1FF2C89DAFF7FA9@DU2PR08MB7325.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <DU2PR08MB73250D118F81DF1FF2C89DAFF7FA9@DU2PR08MB7325.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 27/04/2022 11:19, Penny Zheng wrote:
>>> +/*
>>> + * Put free pages on the resv page list after having taken them
>>> + * off the "normal" page list, when pages from static memory  */
>>> +#ifdef CONFIG_STATIC_MEMORY
>>> +#define arch_free_heap_page(d, pg) ({                   \
>>> +    page_list_del(pg, page_to_list(d, pg));             \
>>> +    if ( (pg)->count_info & PGC_reserved )              \
>>> +        page_list_add_tail(pg, &(d)->resv_page_list);   \
>>> +})
>>> +#endif
>>
>> I am a bit puzzled how this is meant to work.
>>
>> Looking at the code, arch_free_heap_page() will be called from
>> free_domheap_pages(). If I am not mistaken, reserved pages are not
>> considered as xen heap pages, so we would go in the else which will end up to
>> call free_heap_pages().
>>
>> free_heap_pages() will end up to add the page in the heap allocator and
>> corrupt the d->resv_page_list because there are only one link list.
>>
>> What did I miss?
>>
> 
> In my first commit "do not free reserved memory into heap", I've changed the behavior
> for reserved pages in free_heap_pages()
> +    if ( pg->count_info & PGC_reserved )
> +        /* Reserved page shall not go back to the heap. */
> +        return free_staticmem_pages(pg, 1UL << order, need_scrub);
> +

Hmmm... somehow this e-mail is neither in my inbox nor in the archives 
on lore.kernel.org.

Cheers,
-- 
Julien Grall

