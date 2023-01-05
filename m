Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE0965F327
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 18:51:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472094.732220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDUO7-0003NI-Tg; Thu, 05 Jan 2023 17:50:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472094.732220; Thu, 05 Jan 2023 17:50:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDUO7-0003Kk-QC; Thu, 05 Jan 2023 17:50:47 +0000
Received: by outflank-mailman (input) for mailman id 472094;
 Thu, 05 Jan 2023 17:50:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pDUO6-0003Ke-7C
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 17:50:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pDUO3-0001Mr-Sv; Thu, 05 Jan 2023 17:50:43 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235] helo=[192.168.4.62])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pDUO3-0000oE-Mo; Thu, 05 Jan 2023 17:50:43 +0000
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
	bh=8vcieIbCBqWK4v4MK2ILng/goWaB9VQK/FpAtpowD4k=; b=Z3E9fWBcJwZgZSxJziOArJA0tc
	rURGvep9oQuxASKqtELj08YwhJhKMqeiBz2GZgZkqqCdV2yYAyBec2kKwOiyPuAlxObNAE/Sist1w
	7fBRAHnEZjxQdMlsrMSz1RkdvIyRGQX9nWeWA+Ni8SmIYC5pMgM+rhFtIR8FrAoQKfS8=;
Message-ID: <924abe0d-6ba8-5d64-d74a-c2e1894d4f64@xen.org>
Date: Thu, 5 Jan 2023 17:50:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 13/22] xen/x86: Add support for the PMAP
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-14-julien@xen.org>
 <84a96972-3c41-ec94-3513-9944467d9e1c@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <84a96972-3c41-ec94-3513-9944467d9e1c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 05/01/2023 16:46, Jan Beulich wrote:
> On 16.12.2022 12:48, Julien Grall wrote:
>> --- a/xen/arch/x86/include/asm/fixmap.h
>> +++ b/xen/arch/x86/include/asm/fixmap.h
>> @@ -21,6 +21,8 @@
>>   
>>   #include <xen/acpi.h>
>>   #include <xen/pfn.h>
>> +#include <xen/pmap.h>
>> +
>>   #include <asm/apicdef.h>
>>   #include <asm/msi.h>
>>   #include <acpi/apei.h>
>> @@ -54,6 +56,8 @@ enum fixed_addresses {
>>       FIX_XEN_SHARED_INFO,
>>   #endif /* CONFIG_XEN_GUEST */
>>       /* Everything else should go further down. */
>> +    FIX_PMAP_BEGIN,
>> +    FIX_PMAP_END = FIX_PMAP_BEGIN + NUM_FIX_PMAP,
> 
> ... you've inserted the new entries after the respective comment? Is
> there a reason you don't insert farther towards the end of this
> enumeration?

I will answer this below.

> 
>> --- /dev/null
>> +++ b/xen/arch/x86/include/asm/pmap.h
>> @@ -0,0 +1,25 @@
>> +#ifndef __ASM_PMAP_H__
>> +#define __ASM_PMAP_H__
>> +
>> +#include <asm/fixmap.h>
>> +
>> +static inline void arch_pmap_map(unsigned int slot, mfn_t mfn)
>> +{
>> +    unsigned long linear = (unsigned long)fix_to_virt(slot);
>> +    l1_pgentry_t *pl1e = &l1_fixmap[l1_table_offset(linear)];
>> +
>> +    ASSERT(!(l1e_get_flags(*pl1e) & _PAGE_PRESENT));
>> +
>> +    l1e_write_atomic(pl1e, l1e_from_mfn(mfn, PAGE_HYPERVISOR));
>> +}
>> +
>> +static inline void arch_pmap_unmap(unsigned int slot)
>> +{
>> +    unsigned long linear = (unsigned long)fix_to_virt(slot);
>> +    l1_pgentry_t *pl1e = &l1_fixmap[l1_table_offset(linear)];
>> +
>> +    l1e_write_atomic(pl1e, l1e_empty());
>> +    flush_tlb_one_local(linear);
>> +}
> 
> You're effectively open-coding {set,clear}_fixmap(), just without
> the L1 table allocation (should such be necessary). If you depend
> on using the build-time L1 table, then you need to move your
> entries ahead of said comment.

So the problem is less about the allocation be more the fact that we 
can't use map_pages_to_xen() because it would call pmap_map().

So we need to break the loop. Hence why set_fixmap()/clear_fixmap() are 
open-coded.

And indeed, we would need to rely on the build-time L1 table in this 
case. So I will move the entries earlier.

> But independent of that you want
> to either use the existing macros / functions, or explain why you
> can't.

This is explained in the caller of arch_pmap*():

     /*
      * We cannot use set_fixmap() here. We use PMAP when the domain map
      * page infrastructure is not yet initialized, so 
map_pages_to_xen() called
      * by set_fixmap() needs to map pages on demand, which then calls 
pmap()
      * again, resulting in a loop. Modify the PTEs directly instead. 
The same
      * is true for pmap_unmap().
      */

The comment is valid for Arm, x86 and (I would expect in the future) 
RISC-V because the page-tables may be allocated in domheap (so not 
always mapped).

So I don't feel this comment should be duplicated in the header. But I 
can certainly explain it in the commit message.

Cheers,

-- 
Julien Grall

