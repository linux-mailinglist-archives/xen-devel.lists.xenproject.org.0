Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3103D82BEF4
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jan 2024 12:09:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666830.1037735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOFPs-0007rD-3J; Fri, 12 Jan 2024 11:09:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666830.1037735; Fri, 12 Jan 2024 11:09:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOFPs-0007p5-0U; Fri, 12 Jan 2024 11:09:36 +0000
Received: by outflank-mailman (input) for mailman id 666830;
 Fri, 12 Jan 2024 11:09:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rOFPq-0007oz-GR
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2024 11:09:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rOFPo-0007Ms-Lx; Fri, 12 Jan 2024 11:09:32 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rOFPo-0007jE-Gg; Fri, 12 Jan 2024 11:09:32 +0000
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
	bh=3+/zjifcTz60wbhEA479EO8AVIrZPdJxsFNtLve40tI=; b=6IvilGuNKBuKbMFCK27BFwXaEl
	iWS7ykwdW7W0IV3WzRpqWAJdnWmawZOF5Xaqav53IeIQDuKzlenaFWb4QR5z9dtF3deb157Ng+rJ5
	2njCnTgxnS+4OXwP983RyFeRZ6GRh7y6CAP//YeHvNVsQXMtB3VT4iOPkz3iB0+nA3R0=;
Message-ID: <bb62c55c-d11c-4835-b13f-a0c8c70a2fe0@xen.org>
Date: Fri, 12 Jan 2024 11:09:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 21/34] xen/riscv: introduce p2m.h
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
 <c3b1f24aea1ba01505697717b240c8d036abfee1.1703255175.git.oleksii.kurochko@gmail.com>
 <abeafa19-7867-46b2-bc0e-b39eaa0f5036@xen.org>
 <05589cba-6779-4794-9684-470589fe2383@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <05589cba-6779-4794-9684-470589fe2383@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 12/01/2024 11:06, Jan Beulich wrote:
> On 12.01.2024 11:39, Julien Grall wrote:
>> On 22/12/2023 15:13, Oleksii Kurochko wrote:
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> ---
>>> Changes in V3:
>>>    - add SPDX
>>>    - drop unneeded for now p2m types.
>>>    - return false in all functions implemented with BUG() inside.
>>>    - update the commit message
>>> ---
>>> Changes in V2:
>>>    - Nothing changed. Only rebase.
>>> ---
>>>    xen/arch/ppc/include/asm/p2m.h   |   3 +-
>>>    xen/arch/riscv/include/asm/p2m.h | 102 +++++++++++++++++++++++++++++++
>>>    2 files changed, 103 insertions(+), 2 deletions(-)
>>>    create mode 100644 xen/arch/riscv/include/asm/p2m.h
>>>
>>> diff --git a/xen/arch/ppc/include/asm/p2m.h b/xen/arch/ppc/include/asm/p2m.h
>>> index 25ba054668..3bc05b7c05 100644
>>> --- a/xen/arch/ppc/include/asm/p2m.h
>>> +++ b/xen/arch/ppc/include/asm/p2m.h
>>> @@ -50,8 +50,7 @@ static inline void memory_type_changed(struct domain *d)
>>>    static inline int guest_physmap_mark_populate_on_demand(struct domain *d, unsigned long gfn,
>>>                                                            unsigned int order)
>>>    {
>>> -    BUG_ON("unimplemented");
>>> -    return 1;
>>> +    return -EOPNOTSUPP;
>>>    }
>>>    
>>>    static inline int guest_physmap_add_entry(struct domain *d,
>>> diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
>>> new file mode 100644
>>> index 0000000000..d270ef6635
>>> --- /dev/null
>>> +++ b/xen/arch/riscv/include/asm/p2m.h
>>> @@ -0,0 +1,102 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +#ifndef __ASM_RISCV_P2M_H__
>>> +#define __ASM_RISCV_P2M_H__
>>> +
>>> +#include <asm/page-bits.h>
>>> +
>>> +#define paddr_bits PADDR_BITS
>>> +
>>> +/*
>>> + * List of possible type for each page in the p2m entry.
>>> + * The number of available bit per page in the pte for this purpose is 4 bits.
>>> + * So it's possible to only have 16 fields. If we run out of value in the
>>> + * future, it's possible to use higher value for pseudo-type and don't store
>>> + * them in the p2m entry.
>>> + */
>>
>> This looks like a verbatim copy from Arm. Did you actually check RISC-V
>> has 4 bits available in the PTE to store this value?
>>
>>> +typedef enum {
>>> +    p2m_invalid = 0,    /* Nothing mapped here */
>>> +    p2m_ram_rw,         /* Normal read/write guest RAM */
>>
>> s/guest/domain/ as this also applies for dom0.
>>
>>> +} p2m_type_t;
>>> +
>>> +#include <xen/p2m-common.h>
>>> +
>>> +static inline int get_page_and_type(struct page_info *page,
>>> +                                    struct domain *domain,
>>> +                                    unsigned long type)
>>> +{
>>> +    BUG();
>>
>> I understand your goal with the BUG() but I find it risky. This is not a
>> problem right now, it is more when we will decide to have RISC-V
>> supported. You will have to go through all the BUG() to figure out which
>> one are warrant or not.
>>
>> To reduce the load, I would recommend to switch to ASSERT_UNREACHABLE()
>> (or maybe introduced a different macro) that would lead to a crash on
>> debug build but propagate the error normally on production build.
> 
> Elsewhere BUG_ON("unimplemented") is used to indicate such cases.
> Can't this be used here (and then uniformly elsewhere) as well?

I would prefer something that can be compiled out in production build. 
But I would be Ok with BUG_ON("...") this is at least clearer than a 
plain BUG().

-- 
Julien Grall

