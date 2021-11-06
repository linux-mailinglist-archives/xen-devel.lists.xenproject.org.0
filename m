Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDD6446E0C
	for <lists+xen-devel@lfdr.de>; Sat,  6 Nov 2021 14:26:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222722.385062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mjLhM-0000Uv-Mz; Sat, 06 Nov 2021 13:25:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222722.385062; Sat, 06 Nov 2021 13:25:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mjLhM-0000Sz-JL; Sat, 06 Nov 2021 13:25:32 +0000
Received: by outflank-mailman (input) for mailman id 222722;
 Sat, 06 Nov 2021 13:25:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mjLhL-0000St-4k
 for xen-devel@lists.xenproject.org; Sat, 06 Nov 2021 13:25:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mjLhJ-0002BP-Ok; Sat, 06 Nov 2021 13:25:29 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=[192.168.23.222]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mjLhJ-0004AC-H2; Sat, 06 Nov 2021 13:25:29 +0000
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
	bh=4c6QIT2egaO+YodV9TZFQFDYWkVXnH4Xsxu63oaRqDY=; b=IxRDMAX4bgsGuIDG1CmrcS8KPg
	mu3pQ1nWXqOn5vAob6iG+loAt/iE5A68g8XYjgPrZxIFer2Ulpdmr0b0INFagpXdYc0qjwh+yh9FU
	o2ydrNKmY3DkiNxV2b7tjnaMxt7WDpjrAE+S2Ght+cjkHUaGCMnExFIhpj6cMMfqnSQc=;
Message-ID: <7e94c7a2-7b20-2fb7-ee0a-ca24f6044fcc@xen.org>
Date: Sat, 6 Nov 2021 13:25:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: static-mem preventing dom0 from booting
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Penny Zheng <Penny.Zheng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Chen <Wei.Chen@arm.com>, Bertrand.Marquis@arm.com,
 Volodymyr_Babchuk@epam.com, iwj@xenproject.org
References: <alpine.DEB.2.22.394.2111041829300.284830@ubuntu-linux-20-04-desktop>
 <DU2PR08MB73256624607E7624CAAD38E5F78E9@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <DU2PR08MB7325A7A5658B1EB7C6EB4DECF78E9@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2111050836580.284830@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2111051554000.284830@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2111051604530.284830@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2111051604530.284830@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 05/11/2021 23:05, Stefano Stabellini wrote:
> On Fri, 5 Nov 2021, Stefano Stabellini wrote:
>> On Fri, 5 Nov 2021, Stefano Stabellini wrote:
>>> The scenario is extremely simple; you can see the full device tree
>>> configuration in the attachment to my previous email.
>>>
>>> - dom0
>>> - dom0less domU with static-mem
>>>
>>> That's it! So basically it is just a normal dom0 + dom0less domU
>>> configuration, which already works fine, where I added static-mem to the
>>> domU and suddenly dom0 (not the domU!) stopped working.
>>
>> I did some more debugging today and I found the problem. The issue is
>> that static-mem regions are added to the list of reserved_mem. However,
>> reserved_mem is automatically assigned to Dom0 by default at the bottom
>> of xen/arch/arm/domain_build.c:handle_node, see the second call to
>> make_memory_node. Really, we shouldn't give to dom0 static-mem ranges
>> meant for other domUs. E.g. the following change is sufficient to solve
>> the problem:
>>
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 88a79247cb..dc609c4f0e 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -891,6 +891,9 @@ static int __init make_memory_node(const struct domain *d,
>>           u64 start = mem->bank[i].start;
>>           u64 size = mem->bank[i].size;
>>   
>> +        if ( mem->bank[i].xen_domain )
>> +            continue;
>> +
>>           dt_dprintk("  Bank %d: %#"PRIx64"->%#"PRIx64"\n",
>>                      i, start, start + size);
>>   
>> However, maybe a better fix would be to purge reserved_mem of any
>> xen_domain items before calling make_memory_node.

I would rather not modify boot_info.reserved_mem because it may be used 
afterwards. I think your approach is the right one.

Alternatively, we would rework make_memory_node() to create one node per 
range (rather than a node with multiple ranges). This would move the 
loop outside of make_memory_node(). The advantage is we have more 
flexibily how on to filter ranges (in the future we may need to pass 
some reserved ranges to a domain).

>>
>>
>> I found one additional issue regarding is_domain_direct_mapped which
>> doesn't return true for static-mem domains. I think we need to add a
>> direct_map bool to arch_domain and set it for both dom0 and static-mem
>> dom0less domUs, so that we can change the implementation of
>> is_domain_direct_mapped to:
>>
>> #define is_domain_direct_mapped(d) (d->arch.direct_map)

In Xen 4.16, static-mem domains are not direct mapped (i.e MFN == GFN). 
Instead, the static memory is used to allocate memory for the domain at 
the default regions in the guest memory layout.

If you want to direct map static-mem domains, then you would have to 
apply [1] from Penny which is still under review.

Cheers,

[1] <20211015030945.2082898-1-penny.zheng@arm.com>

-- 
Julien Grall

