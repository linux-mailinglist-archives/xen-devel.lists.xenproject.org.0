Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F12A3CD174
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jul 2021 12:01:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.158263.291463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5Q4L-0002Q8-Lf; Mon, 19 Jul 2021 10:00:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 158263.291463; Mon, 19 Jul 2021 10:00:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5Q4L-0002NJ-HY; Mon, 19 Jul 2021 10:00:13 +0000
Received: by outflank-mailman (input) for mailman id 158263;
 Mon, 19 Jul 2021 10:00:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m5Q4K-0002ND-IJ
 for xen-devel@lists.xenproject.org; Mon, 19 Jul 2021 10:00:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m5Q4K-0007gX-B8; Mon, 19 Jul 2021 10:00:12 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m5Q4K-0005z7-57; Mon, 19 Jul 2021 10:00:12 +0000
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
	bh=o8eYTXXx7kiLl/FcNJLbtG9BRtFJUEAFwN79yDm6kl0=; b=NSOqaVJrH4oGfCqfvn9vwe9Q1m
	FZfR7BUrhiHBmD6AUkmAWmsmHQAHqvEHq3/OBgY7ZwnVv7nJTAaeIlwZ6KOlV2vKL3g1whZi9+Yjf
	Pgyi8mxtbwfY/fBNhddBPHr5aCwPEW80WWAUAuXgpG7o3lekN6+4DAt8xpE0+xBt9hQw=;
Subject: Re: [PATCH V3 08/10] xen/arm: introduce acquire_staticmem_pages and
 acquire_domstatic_pages
To: Jan Beulich <jbeulich@suse.com>, Penny Zheng <penny.zheng@arm.com>
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com, nd@arm.com,
 xen-devel@lists.xenproject.org, sstabellini@kernel.org
References: <20210715051819.3073628-1-penny.zheng@arm.com>
 <20210715051819.3073628-9-penny.zheng@arm.com>
 <48c59068-296e-7060-1352-f07338833378@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7753fe1f-7a5c-6205-a184-25190ad43286@xen.org>
Date: Mon, 19 Jul 2021 11:00:10 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <48c59068-296e-7060-1352-f07338833378@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 19/07/2021 10:26, Jan Beulich wrote:
> On 15.07.2021 07:18, Penny Zheng wrote:
>> @@ -1065,6 +1069,73 @@ static struct page_info *alloc_heap_pages(
>>       return pg;
>>   }
>>   
>> +#ifdef CONFIG_STATIC_MEMORY
>> +/*
>> + * Acquire nr_mfns contiguous reserved pages, starting at #smfn, of
>> + * static memory.
>> + */
>> +static struct page_info *acquire_staticmem_pages(unsigned long nr_mfns,
>> +                                                 mfn_t smfn,
>> +                                                 unsigned int memflags)
> 
> This and the other function not being __init, and there neither being
> any caller nor any freeing, a question is whether __init wants adding;
> patch 10 suggests so. The lack of freeing in particular means that
> domains created using static memory won't be restartable, requiring a
> host reboot instead.

I am open to request an host reboot in case of an issue. Although, it 
would be good to have code in place for that.

Regardless the reboot part, I would still expect the domain to balloon 
in/out memory. This is pretty broken today because Xen would end up to 
give the memory to the heap allocator and the next allocation would be 
through the heap allocate.

For runtime "free/allocate", we may want to follow the same behavior as 
direct-mapped domain (i.e. GFN == MFN): the page will not be given back 
to any allocator and we only check if the page belongs to the domain on 
allocation.

So adding __init for acquire_staticmem_pages() is probably fine.

On a side node, on v2, I have requested to keep track of the list of 
missing pieces. @Penny, where can I find the list?

Cheers,

-- 
Julien Grall

