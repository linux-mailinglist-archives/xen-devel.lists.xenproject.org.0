Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F8C67A124
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jan 2023 19:28:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483684.749995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKO1f-00057N-Hx; Tue, 24 Jan 2023 18:28:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483684.749995; Tue, 24 Jan 2023 18:28:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKO1f-00055N-Et; Tue, 24 Jan 2023 18:28:07 +0000
Received: by outflank-mailman (input) for mailman id 483684;
 Tue, 24 Jan 2023 18:28:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pKO1e-000551-6I
 for xen-devel@lists.xenproject.org; Tue, 24 Jan 2023 18:28:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pKO1d-0001WU-MH; Tue, 24 Jan 2023 18:28:05 +0000
Received: from [54.239.6.189] (helo=[192.168.20.46])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pKO1d-0000MG-Bl; Tue, 24 Jan 2023 18:28:05 +0000
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
	bh=F4RyW7ieQKR2gtA7gaemy2f7d3xMbPhWD7eLZ+R1iOY=; b=DGhLiTu3HG0aTldb4lmA9HhieW
	/KEQO7OnNei1f7uMcUSE4onId/E5f9s2i5zmVJkHswAKs7UPEWtTui/enlgRec0mQbI6wqNfkvskj
	rIco85ZYxoCEu2wJ87HhIza13QaQJWywqZXh+SXpXM4zLRXG1nU2nVW0k863SZ8HN6e0=;
Message-ID: <59f4d24a-44cf-fa8f-bdac-2af036f2cd30@xen.org>
Date: Tue, 24 Jan 2023 18:28:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 1/3] xen/arm: Reduce redundant clear root pages when
 teardown p2m
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, Henry Wang <Henry.Wang@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230116015820.1269387-1-Henry.Wang@arm.com>
 <20230116015820.1269387-2-Henry.Wang@arm.com>
 <36821aa0-4e88-57f7-3f8b-35ba0529fabf@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <36821aa0-4e88-57f7-3f8b-35ba0529fabf@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 20/01/2023 09:43, Michal Orzel wrote:
> Hi Henry,
> 
> On 16/01/2023 02:58, Henry Wang wrote:
>>
>>
>> Currently, p2m for a domain will be teardown from two paths:
>> (1) The normal path when a domain is destroyed.
>> (2) The arch_domain_destroy() in the failure path of domain creation.
>>
>> When tearing down p2m from (1), the part to clear and clean the root
>> is only needed to do once rather than for every call of p2m_teardown().
>> If the p2m teardown is from (2), the clear and clean of the root
>> is unnecessary because the domain is not scheduled.
>>
>> Therefore, this patch introduces a helper `p2m_clear_root_pages()` to
>> do the clear and clean of the root, and move this logic outside of
>> p2m_teardown(). With this movement, the `page_list_empty(&p2m->pages)`
>> check can be dropped.
>>
>> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
>> ---
>> Was: [PATCH v2] xen/arm: Reduce redundant clear root pages when
>> teardown p2m. Picked to this series with changes in original v1:
>> 1. Introduce a new PROGRESS for p2m_clear_root_pages() to avoid
>>     multiple calling when p2m_teardown() is preempted.
>> 2. Move p2m_force_tlb_flush_sync() to p2m_clear_root_pages().
>> ---
>>   xen/arch/arm/domain.c          | 12 ++++++++++++
>>   xen/arch/arm/include/asm/p2m.h |  1 +
>>   xen/arch/arm/p2m.c             | 34 ++++++++++++++--------------------
>>   3 files changed, 27 insertions(+), 20 deletions(-)
>>
>> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
>> index 99577adb6c..961dab9166 100644
>> --- a/xen/arch/arm/domain.c
>> +++ b/xen/arch/arm/domain.c
>> @@ -959,6 +959,7 @@ enum {
>>       PROG_xen,
>>       PROG_page,
>>       PROG_mapping,
>> +    PROG_p2m_root,
>>       PROG_p2m,
>>       PROG_p2m_pool,
>>       PROG_done,
>> @@ -1021,6 +1022,17 @@ int domain_relinquish_resources(struct domain *d)
>>           if ( ret )
>>               return ret;
>>
>> +    PROGRESS(p2m_root):
>> +        /*
>> +         * We are about to free the intermediate page-tables, so clear the
>> +         * root to prevent any walk to use them.
> The comment from here...
>> +         * The domain will not be scheduled anymore, so in theory we should
>> +         * not need to flush the TLBs. Do it for safety purpose.
>> +         * Note that all the devices have already been de-assigned. So we don't
>> +         * need to flush the IOMMU TLB here.
>> +         */
> to here does not make a lot of sense in this place and should be moved to p2m_clear_root_pages
> where a user can see the call to p2m_force_tlb_flush_sync.

+1

> Apart from that:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

