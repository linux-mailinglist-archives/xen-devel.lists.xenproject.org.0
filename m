Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C02F45765B1
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jul 2022 19:17:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368398.599654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCOvv-0007fB-KY; Fri, 15 Jul 2022 17:16:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368398.599654; Fri, 15 Jul 2022 17:16:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCOvv-0007cx-HQ; Fri, 15 Jul 2022 17:16:55 +0000
Received: by outflank-mailman (input) for mailman id 368398;
 Fri, 15 Jul 2022 17:16:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oCOvu-0007cp-B9
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 17:16:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oCOvq-0001VW-K7; Fri, 15 Jul 2022 17:16:50 +0000
Received: from [54.239.6.188] (helo=[192.168.17.116])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oCOvq-0008Pm-Dn; Fri, 15 Jul 2022 17:16:50 +0000
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
	bh=k8r5A+QcoZnfq5aXkyslmIh+0yDUBkX2OrrbbjBNL30=; b=zejudGc08amAcllnsAUF/ZbuZX
	1pF/aESusrd0b8CnM40xKGpHaoY5S6N5FFCLqN9tEmzN+W2YEJdTUVxI3nhnpQNW3mevmEwvZ1Hi8
	Ebzc/gSUf/iZPzagmwgiCaUyhaZGJUcZneI8l1k9Ia8Tb7o2Bs5ZYsXMw2tqiQjVp3LQ=;
Message-ID: <b0039e79-f35d-62fa-8202-acb36baee2e3@xen.org>
Date: Fri, 15 Jul 2022 18:16:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] xen/heap: pass order to free_heap_pages() in heap
 init
To: Jan Beulich <jbeulich@suse.com>
Cc: bertrand.marquis@arm.com, Hongyan Xia <hongyxia@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20220609083039.76667-1-julien@xen.org>
 <20220609083039.76667-3-julien@xen.org>
 <4462bfdf-fc24-12df-0f16-7c09d0618d0f@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <4462bfdf-fc24-12df-0f16-7c09d0618d0f@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 09/06/2022 14:22, Jan Beulich wrote:
>>   /*
>>    * This function should only be called with valid pages from the same NUMA
>> - * node.
>> + * node and the same zone.
>>    *
>>    * Callers should use is_contig_page() first to check if all the pages
>>    * in a range are contiguous.
>> @@ -1817,8 +1829,22 @@ static void init_contig_heap_pages(struct page_info *pg, unsigned long nr_pages,
>>   
>>       while ( s < e )
>>       {
>> -        free_heap_pages(mfn_to_page(_mfn(s)), 0, need_scrub);
>> -        s += 1UL;
>> +        /*
>> +         * For s == 0, we simply use the largest increment by checking the
>> +         * index of the MSB set. For s != 0, we also need to ensure that the
> 
> "The MSB" reads as it it was not in line with the code; at least I would,
> short of it being spelled out, assume it can only be the page's address
> which is meant (as is the case for LSB below). But it's the MSB of the
> range's size.

Indeed. I have reworded the comment to:

         /*
          * For s == 0, we simply use the largest increment by checking the
          * MSB of the region size. For s != 0, we also need to ensure 
that the
          * chunk is properly sized to end at power-of-two alignment. We 
do this
          * by checking the LSB of the start address and use its index as
          * the increment. Both cases need to be guarded by MAX_ORDER.
          *
          * Note that the value of ffsl() and flsl() starts from 1 so we 
need
          * to decrement it by 1.
          */

> 
>> +         * chunk is properly sized to end at power-of-two alignment. We do this
>> +         * by checking the LSB set and use its index as the increment. Both
>> +         * cases need to be guarded by MAX_ORDER.
>> +         *
>> +         * Note that the value of ffsl() and flsl() starts from 1 so we need
>> +         * to decrement it by 1.
>> +         */
>> +        int inc_order = min(MAX_ORDER, flsl(e - s) - 1);
>> +
>> +        if ( s )
>> +            inc_order = min(inc_order, ffsl(s) - 1);
>> +        free_heap_pages(mfn_to_page(_mfn(s)), inc_order, need_scrub);
>> +        s += (1UL << inc_order);
>>       }
>>   }
>>   
>> @@ -1856,12 +1882,13 @@ static void init_heap_pages(
>>       for ( i = 0; i < nr_pages; )
>>       {
>>           unsigned int nid = phys_to_nid(page_to_maddr(pg));
>> +        unsigned int zone = page_to_zone(pg);
>>           unsigned long left = nr_pages - i;
>>           unsigned long contig_pages;
>>   
>>           for ( contig_pages = 1; contig_pages < left; contig_pages++ )
>>           {
>> -            if ( !is_contig_page(pg + contig_pages, nid) )
>> +            if ( !is_contig_page(pg + contig_pages, nid, zone) )
>>                   break;
>>           }
> 
> Coming back to your reply to my comment on patch 1: I think this
> addition of the node check is actually an argument for inlining the
> function's body here (and then dropping the function). That way the
> separate-Xen-heap aspect is visible at the place where it matters,
> rather than requiring an indirection via looking at the helper
> function (and leaving a dead parameter in the opposite case). But as
> said - I'm not going to insist as long as the helper function has a
> suitable name (representing what it does and not misguiding anyone
> with the common "contig"-means-addresses implication).

I have followed your suggestion in patch #1:
   * is_contig_page() is now inlined
   * init_contig_heap_pages() was renamed to _init_heap_pages()

Cheers,

-- 
Julien Grall

