Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5670482F2F0
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 18:12:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667922.1039625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPmzN-0002Y4-LB; Tue, 16 Jan 2024 17:12:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667922.1039625; Tue, 16 Jan 2024 17:12:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPmzN-0002VF-Hs; Tue, 16 Jan 2024 17:12:37 +0000
Received: by outflank-mailman (input) for mailman id 667922;
 Tue, 16 Jan 2024 17:12:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rPmzM-0002V7-8p
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 17:12:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rPmzE-0006Co-PK; Tue, 16 Jan 2024 17:12:28 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[10.95.149.176]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rPmzE-0005hu-JG; Tue, 16 Jan 2024 17:12:28 +0000
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
	bh=YXivUxrNBIzaqto2llkJo/tRwVIJPQGCDylDpD38YpE=; b=D0aBbTXmRV2xtQ8X1wC1OKNl+X
	VDgqEAllKxHhRQ3aRMDa7PY22k3TmHHXJ8tAwnsUY9dPRlRrbqzLSH00x+jfB/q7zhjdtaDBdeKqQ
	oYN7dh/5zzVHZdvRpMc1G5X/9KdyA+mfhpIL/4njedfahRa9+JCAEK2P1XjSxySXnYYo=;
Message-ID: <402ece4f-a3bf-4eab-ac4c-ae36490ae114@xen.org>
Date: Tue, 16 Jan 2024 17:12:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 21/34] xen/riscv: introduce p2m.h
Content-Language: en-GB
To: Oleksii <oleksii.kurochko@gmail.com>, Jan Beulich <jbeulich@suse.com>
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
 <c3b1f24aea1ba01505697717b240c8d036abfee1.1703255175.git.oleksii.kurochko@gmail.com>
 <abeafa19-7867-46b2-bc0e-b39eaa0f5036@xen.org>
 <abef4701c3f2292e672679f1a18c826d699e1af2.camel@gmail.com>
 <c1abf4ca-d69a-4a17-b23c-18f06b8fddda@suse.com>
 <5bf15f83be5a1cf38bff58d996e74a6de6b044b5.camel@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5bf15f83be5a1cf38bff58d996e74a6de6b044b5.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Oleksii,

On 16/01/2024 09:44, Oleksii wrote:
> On Mon, 2024-01-15 at 12:01 +0100, Jan Beulich wrote:
>> On 15.01.2024 11:35, Oleksii wrote:
>>> Hi Julien,
>>>
>>> On Fri, 2024-01-12 at 10:39 +0000, Julien Grall wrote:
>>>> Hi Oleksii,
>>>>
>>>> On 22/12/2023 15:13, Oleksii Kurochko wrote:
>>>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>>> ---
>>>>> Changes in V3:
>>>>>    - add SPDX
>>>>>    - drop unneeded for now p2m types.
>>>>>    - return false in all functions implemented with BUG()
>>>>> inside.
>>>>>    - update the commit message
>>>>> ---
>>>>> Changes in V2:
>>>>>    - Nothing changed. Only rebase.
>>>>> ---
>>>>>    xen/arch/ppc/include/asm/p2m.h   |   3 +-
>>>>>    xen/arch/riscv/include/asm/p2m.h | 102
>>>>> +++++++++++++++++++++++++++++++
>>>>>    2 files changed, 103 insertions(+), 2 deletions(-)
>>>>>    create mode 100644 xen/arch/riscv/include/asm/p2m.h
>>>>>
>>>>> diff --git a/xen/arch/ppc/include/asm/p2m.h
>>>>> b/xen/arch/ppc/include/asm/p2m.h
>>>>> index 25ba054668..3bc05b7c05 100644
>>>>> --- a/xen/arch/ppc/include/asm/p2m.h
>>>>> +++ b/xen/arch/ppc/include/asm/p2m.h
>>>>> @@ -50,8 +50,7 @@ static inline void memory_type_changed(struct
>>>>> domain *d)
>>>>>    static inline int
>>>>> guest_physmap_mark_populate_on_demand(struct
>>>>> domain *d, unsigned long gfn,
>>>>>                                                           
>>>>> unsigned
>>>>> int order)
>>>>>    {
>>>>> -    BUG_ON("unimplemented");
>>>>> -    return 1;
>>>>> +    return -EOPNOTSUPP;
>>>>>    }
>>>>>    
>>>>>    static inline int guest_physmap_add_entry(struct domain *d,
>>>>> diff --git a/xen/arch/riscv/include/asm/p2m.h
>>>>> b/xen/arch/riscv/include/asm/p2m.h
>>>>> new file mode 100644
>>>>> index 0000000000..d270ef6635
>>>>> --- /dev/null
>>>>> +++ b/xen/arch/riscv/include/asm/p2m.h
>>>>> @@ -0,0 +1,102 @@
>>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>>> +#ifndef __ASM_RISCV_P2M_H__
>>>>> +#define __ASM_RISCV_P2M_H__
>>>>> +
>>>>> +#include <asm/page-bits.h>
>>>>> +
>>>>> +#define paddr_bits PADDR_BITS
>>>>> +
>>>>> +/*
>>>>> + * List of possible type for each page in the p2m entry.
>>>>> + * The number of available bit per page in the pte for this
>>>>> purpose is 4 bits.
>>>>> + * So it's possible to only have 16 fields. If we run out of
>>>>> value
>>>>> in the
>>>>> + * future, it's possible to use higher value for pseudo-type
>>>>> and
>>>>> don't store
>>>>> + * them in the p2m entry.
>>>>> + */
>>>>
>>>> This looks like a verbatim copy from Arm. Did you actually check
>>>> RISC-V
>>>> has 4 bits available in the PTE to store this value?
>>> Thanks for noticing that, in RISC-V it is available only 2 bits (
>>> bits
>>> 8 and 9), so I'll update the comment:
>>> 53                   10 9    8 7 6 5 4 3 2 1 0
>>>   Physical Page Number     RSV  D A G U X W R V
>>
>> It's RSW (Reserved for Supervisor softWare use), not RSV, which is
>> pretty
>> important in this context.
> Yes, you are right it is RSW. Thanks for the correction.
> 
>>
>>> It seems that I missed something in the Arm code/architecture.As
>>> far as I recall, in Arm, bits 5-8 are ignored by the MMU, and they
>>> are expected
>>> to be used by the hypervisor for its purpose.
>>> However, in the code, I notice that these bits are utilized for
>>> storing
>>> a reference counter.
>>
>> Why "however"? Hardware still is going to ignore these bits.
> Sure, these bits are ignored by hardware. What I meant is that,
> according to the code, these bits are used for storing a reference
> counter, not p2m_type_t. I guess I am missing something...

I can only guess where you saw the field used for reference counting. 
This was the domain map page infrastruture, right?

If so, this is for stage-1 page-table (aka hypervisor table) and not the 
stage-2 (e.g. P2M). For the latter, we would use the p2m_type_t.

Cheers,

-- 
Julien Grall

