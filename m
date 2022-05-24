Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 740405325D9
	for <lists+xen-devel@lfdr.de>; Tue, 24 May 2022 10:58:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336450.560771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntQNH-0000HF-Ub; Tue, 24 May 2022 08:58:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336450.560771; Tue, 24 May 2022 08:58:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntQNH-0000Dp-Rd; Tue, 24 May 2022 08:58:43 +0000
Received: by outflank-mailman (input) for mailman id 336450;
 Tue, 24 May 2022 08:58:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ntQNG-0000Dj-F7
 for xen-devel@lists.xenproject.org; Tue, 24 May 2022 08:58:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ntQNG-0004CQ-2m; Tue, 24 May 2022 08:58:42 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.193])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ntQNF-00031Q-Sk; Tue, 24 May 2022 08:58:42 +0000
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
	bh=yUFvOZsBAYd/S1QmUNeocJgopa2THC7rTOTfgT3dz5U=; b=ZuKxGzjImQkcLAbp1nZyZBRiIG
	ZHvVtdzl56YEijHXrsjxAwFNotnxWFf+yC03kRvsUBzfvn+jAiRIdzoCYKNv2BSaukoVmS7jobEri
	98WxtXCtdHR8sPk/L14ufhvQ9hZ0v+Z7rhxxFKqNqaXCurhTxC5GVJvWg0PQcfMhODog=;
Message-ID: <4d2a550b-feb8-0a61-1742-dfa3489b9b5b@xen.org>
Date: Tue, 24 May 2022 09:58:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH 10/16] xen/arm: add Persistent Map (PMAP) infrastructure
To: Wei Chen <Wei.Chen@arm.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Hongyan Xia <hongyxia@amazon.com>,
 Julien Grall <jgrall@amazon.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20220520120937.28925-1-julien@xen.org>
 <20220520120937.28925-11-julien@xen.org>
 <a2df72fb-4751-ce8b-3def-2bd7382f658d@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a2df72fb-4751-ce8b-3def-2bd7382f658d@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 24/05/2022 03:11, Wei Chen wrote:
> Hi Julien,

Hi Wei,

>> diff --git a/xen/arch/arm/include/asm/pmap.h 
>> b/xen/arch/arm/include/asm/pmap.h
>> new file mode 100644
>> index 000000000000..74398b4c4fe6
>> --- /dev/null
>> +++ b/xen/arch/arm/include/asm/pmap.h
>> @@ -0,0 +1,32 @@
>> +#ifndef __ASM_PMAP_H__
>> +#define __ASM_PMAP_H__
>> +
>> +#include <xen/mm.h>
>> +
>> +#include <asm/fixmap.h>
>> +
>> +static inline void arch_pmap_map(unsigned int slot, mfn_t mfn)
>> +{
>> +    lpae_t *entry = &xen_fixmap[slot];
>> +    lpae_t pte;
>> +
>> +    ASSERT(!lpae_is_valid(*entry));
>> +
> 
> Sometimes it is very difficult for me to determine whether to
> use ASSERT or fixed check in this situation. In debug=n config,
> is there any risk of pte override of arch_pmap_map should be
> prevented? 

There is always a risk :). In this case, this would be a programming 
error if the slot contains a valid entry. Hence why an ASSERT() (They 
tend to be use for programming error).

> IMO, it's better to provide a return value for this
> function and use a fixed check here.
As I wrote above, arch_pmap_map() is not meant to be called in such 
situation. If we return an error, then there are a lot more churn 
necessary (pmap_map() would now need to return NULL...) for something 
that is never meant to happen.

> 
>> +    pte = mfn_to_xen_entry(mfn, PAGE_HYPERVISOR_RW);
>> +    pte.pt.table = 1;
>> +    write_pte(entry, pte);
>> +}
>> +
>> +static inline void arch_pmap_unmap(unsigned int slot)
>> +{
>> +    lpae_t pte = {};
>> +
> 
> We have checked lpae_is_valid() in arch_pmap_map. So can we add a
> !lpae_is_valid check here and return directly?
The code below can work with invalid entry and this function is not 
meant to be called in such case.

So to me this is sounds like an unnecessary optimization.

>> +void __init pmap_unmap(const void *p)
>> +{
>> +    unsigned int idx;
>> +    unsigned int slot = virt_to_fix((unsigned long)p);
>> +
>> +    ASSERT(system_state < SYS_STATE_smp_boot);
>> +    ASSERT(slot >= FIXMAP_PMAP_BEGIN && slot <= FIXMAP_PMAP_END);
>> +    ASSERT(in_irq());
>> +
> 
> Why this condition is in_irq?

This should be !in_irq().

> Is it for TLB operation in arch_pmap_unmap?

No. pmap_{map, unmap} are not re-entreant. So we have two choices here:
  1) Forbid the helpers to be used in IRQ context
  2) Use local_irq_{disable, enable}

I originally used the caller but given that are no users in IRQ 
contexts, I went with 1.

Cheers,

-- 
Julien Grall

