Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C760678AB3
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 23:23:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483299.749382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK5DX-0005zO-0P; Mon, 23 Jan 2023 22:23:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483299.749382; Mon, 23 Jan 2023 22:23:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK5DW-0005wN-TY; Mon, 23 Jan 2023 22:23:06 +0000
Received: by outflank-mailman (input) for mailman id 483299;
 Mon, 23 Jan 2023 22:23:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pK5DV-0005wF-Fu
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 22:23:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pK5DU-0005Yv-Q2; Mon, 23 Jan 2023 22:23:04 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pK5DU-0001ZS-Ks; Mon, 23 Jan 2023 22:23:04 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=M5CGCxzzAW/bES03HcF9ha3g+oYu/Y8f85jI11wEIAk=; b=ALXbaZxEeXG78HSgHJu9IQ6em+
	/pG+51DUuEFzxqjQbAZGK7P8FC6f97vXeG6c7Hpwd6eR8quXpqrFzhVjp6UlKqa2HsUiGm9khF3wS
	xOPH29gFaAGlBUFpoJx66V80mQ1JTPUbsL6uPs2KFfxYBzUr4fDsvotzX21ht48hDjJ8=;
Message-ID: <ea6c03f4-13ad-e312-1827-8e1c5ea1363e@xen.org>
Date: Mon, 23 Jan 2023 22:23:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Hongyan Xia <hongyxia@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Julien Grall <jgrall@amazon.com>
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-18-julien@xen.org>
 <alpine.DEB.2.22.394.2301231358440.1978264@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 17/22] x86/setup: vmap heap nodes when they are outside
 the direct map
In-Reply-To: <alpine.DEB.2.22.394.2301231358440.1978264@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 23/01/2023 22:03, Stefano Stabellini wrote:
> On Fri, 16 Dec 2022, Julien Grall wrote:
>> From: Hongyan Xia <hongyxia@amazon.com>
>>
>> When we do not have a direct map, archs_mfn_in_direct_map() will always
>> return false, thus init_node_heap() will allocate xenheap pages from an
>> existing node for the metadata of a new node. This means that the
>> metadata of a new node is in a different node, slowing down heap
>> allocation.
>>
>> Since we now have early vmap, vmap the metadata locally in the new node.
>>
>> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> ----
>>
>>      Changes from Hongyan's version:
>>          * arch_mfn_in_direct_map() was renamed to
>>            arch_mfns_in_direct_map()
>>          * Use vmap_contig_pages() rather than __vmap(...).
>>          * Add missing include (xen/vmap.h) so it compiles on Arm
>> ---
>>   xen/common/page_alloc.c | 42 +++++++++++++++++++++++++++++++----------
>>   1 file changed, 32 insertions(+), 10 deletions(-)
>>
>> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
>> index 0c4af5a71407..581c15d74dfb 100644
>> --- a/xen/common/page_alloc.c
>> +++ b/xen/common/page_alloc.c
>> @@ -136,6 +136,7 @@
>>   #include <xen/sched.h>
>>   #include <xen/softirq.h>
>>   #include <xen/spinlock.h>
>> +#include <xen/vmap.h>
>>   
>>   #include <asm/flushtlb.h>
>>   #include <asm/numa.h>
>> @@ -597,22 +598,43 @@ static unsigned long init_node_heap(int node, unsigned long mfn,
>>           needed = 0;
>>       }
>>       else if ( *use_tail && nr >= needed &&
>> -              arch_mfns_in_directmap(mfn + nr - needed, needed) &&
>>                 (!xenheap_bits ||
>>                  !((mfn + nr - 1) >> (xenheap_bits - PAGE_SHIFT))) )
>>       {
>> -        _heap[node] = mfn_to_virt(mfn + nr - needed);
>> -        avail[node] = mfn_to_virt(mfn + nr - 1) +
>> -                      PAGE_SIZE - sizeof(**avail) * NR_ZONES;
>> -    }
>> -    else if ( nr >= needed &&
>> -              arch_mfns_in_directmap(mfn, needed) &&
>> +        if ( arch_mfns_in_directmap(mfn + nr - needed, needed) )
>> +        {
>> +            _heap[node] = mfn_to_virt(mfn + nr - needed);
>> +            avail[node] = mfn_to_virt(mfn + nr - 1) +
>> +                          PAGE_SIZE - sizeof(**avail) * NR_ZONES;
>> +        }
>> +        else
>> +        {
>> +            mfn_t needed_start = _mfn(mfn + nr - needed);
>> +
>> +            _heap[node] = vmap_contig_pages(needed_start, needed);
>> +            BUG_ON(!_heap[node]);
> 
> I see a BUG_ON here but init_node_heap is not __init.

FWIW, this is not the first introducing the first BUG_ON() in this function.

  Asking because
> BUG_ON is only a good idea during init time. Should init_node_heap be
> __init (not necessarely in this patch, but still)?
AFAIK, there are two uses outside of __init:
   1) Free the init sections
   2) Memory hotplug

In the first case, we will likely need to panic() in case of an error. 
For ther second case, I am not entirely sure.

But there would be a fair bit of plumbing and thinking (how do you deal 
with the case where part of the memory were already added?).

Anyway, I don't think I am making the function worse, so I would rather 
no open that can of worms (yet).

Cheers,

-- 
Julien Grall

