Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B93DF9E1972
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 11:36:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847920.1262970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIQGb-0006Yx-EW; Tue, 03 Dec 2024 10:36:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847920.1262970; Tue, 03 Dec 2024 10:36:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIQGb-0006WV-BQ; Tue, 03 Dec 2024 10:36:29 +0000
Received: by outflank-mailman (input) for mailman id 847920;
 Tue, 03 Dec 2024 10:36:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tIQGa-0006Un-7b
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 10:36:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tIQGZ-001tXm-1T;
 Tue, 03 Dec 2024 10:36:27 +0000
Received: from [15.248.3.91] (helo=[10.24.66.43])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tIQGZ-00CVkR-1U;
 Tue, 03 Dec 2024 10:36:27 +0000
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
	bh=QJLMf8Jsd3DkRoapzlW/IqRs2AZ9dGhfd/wiyl1JB2k=; b=PK24NjgcrT/0gUcXdDPxKG5StG
	L6FNpakEEkrB6K+o10by8SijAHAnKyxEaWVK+BqjR+t0MpIa4nt/Mus3dqiuvfu9dzeIwo7xHmOdj
	aKK557uSkMbof0xP/e1295m2O16nfvYKg9mE+VJkJtQDbSYCFK0PnF3qabpRDIhfrE24=;
Message-ID: <5580b3fc-66d7-4193-9c54-2733fb628418@xen.org>
Date: Tue, 3 Dec 2024 10:36:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 12/12] xen/arm: add cache coloring support for Xen
 image
Content-Language: en-GB
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: xen-devel@lists.xenproject.org, andrea.bastoni@minervasys.tech,
 marco.solieri@minervasys.tech, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <20241202165921.249585-1-carlo.nonato@minervasys.tech>
 <20241202165921.249585-13-carlo.nonato@minervasys.tech>
 <800b0b49-e6c5-4a83-8ee6-d89d51613b0c@xen.org>
 <CAG+AhRXM=u33jq2yY4F4tJHUXBzDJ8jOHcM53ejmPtfPweQLQg@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CAG+AhRXM=u33jq2yY4F4tJHUXBzDJ8jOHcM53ejmPtfPweQLQg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 03/12/2024 10:08, Carlo Nonato wrote:
> Hi Julien,
> 
> On Mon, Dec 2, 2024 at 10:44 PM Julien Grall <julien@xen.org> wrote:
>>
>> Hi Carlo,
> 
> [...]
> 
>>> diff --git a/xen/arch/arm/arm64/mmu/mm.c b/xen/arch/arm/arm64/mmu/mm.c
>>> index 671eaadbc1..3732d5897e 100644
>>> --- a/xen/arch/arm/arm64/mmu/mm.c
>>> +++ b/xen/arch/arm/arm64/mmu/mm.c
>>> @@ -1,6 +1,7 @@
>>>    /* SPDX-License-Identifier: GPL-2.0-only */
>>>
>>>    #include <xen/init.h>
>>> +#include <xen/llc-coloring.h>
>>>    #include <xen/mm.h>
>>>    #include <xen/pfn.h>
>>>
>>> @@ -138,27 +139,46 @@ void update_boot_mapping(bool enable)
>>>    }
>>>
>>>    extern void switch_ttbr_id(uint64_t ttbr);
>>> +extern void relocate_xen(uint64_t ttbr, void *src, void *dst, size_t len);
>>>
>>>    typedef void (switch_ttbr_fn)(uint64_t ttbr);
>>> +typedef void (relocate_xen_fn)(uint64_t ttbr, void *src, void *dst, size_t len);
>>>
>>>    void __init switch_ttbr(uint64_t ttbr)
>>
>> Given the change below, I think this function needs to be renamed.
>> Possibly to relocate_and_jump() with a comment explaning that the
>> relocation only happen for cache-coloring.
> 
> Changing the name of switch_ttbr() to relocate_and_jump() seems a bit
> misleading to me. First I need to change the name also for arm32 where there's
> no relocation at all. Second, relocation is something that happens
> conditionally so I don't think it's a good name for the function.

Feel free to propose a new name. The main thing is the current name 
can't stay "switch_ttbr()" because you are doing more than switching the
TTBR.

The other solution is to have a separate call for relocating xen (which 
will fall-through to switch_ttbr) and another one for those that only to 
switch TTBR.

Cheers,

-- 
Julien Grall


