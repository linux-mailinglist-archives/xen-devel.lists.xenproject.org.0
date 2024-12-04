Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 441DB9E38A1
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2024 12:18:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.848528.1263386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tInOd-0005ue-IL; Wed, 04 Dec 2024 11:18:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 848528.1263386; Wed, 04 Dec 2024 11:18:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tInOd-0005sL-Fk; Wed, 04 Dec 2024 11:18:19 +0000
Received: by outflank-mailman (input) for mailman id 848528;
 Wed, 04 Dec 2024 11:18:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tInOc-0005sF-EY
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2024 11:18:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tInOb-003b73-1Y;
 Wed, 04 Dec 2024 11:18:17 +0000
Received: from [15.248.2.30] (helo=[10.24.67.22])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tInOb-00F1tV-1Y;
 Wed, 04 Dec 2024 11:18:17 +0000
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
	bh=wQtOr/4W3Ysv2wRRLbBoQxvR2KNUVcWPImcsAjJEyeI=; b=a7R0yq9+2TeuUfLNM7P7EVoeRm
	MC6fpShSSpl5u3aWo7SrsNr8Wa3MJp3C+aDJTIkWI/tU486lzLwnnufGfRjTwKV2u8S/3ePsVSqlx
	aficeYAu+8+DIemFOl2JiGKS8KpFJdNbZqYc90z+dnB+fikK10pzRQt4DIrqz1Ad85yk=;
Message-ID: <2bea0c6d-ce0e-44e3-ab9a-cbd5c2fdd99e@xen.org>
Date: Wed, 4 Dec 2024 11:18:15 +0000
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
 <5580b3fc-66d7-4193-9c54-2733fb628418@xen.org>
 <CAG+AhRWSpjOcaabWGpCDh6zqUfMpUVGe3eM2zbWz759=Fv+Kfg@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CAG+AhRWSpjOcaabWGpCDh6zqUfMpUVGe3eM2zbWz759=Fv+Kfg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Carlo,

On 03/12/2024 11:37, Carlo Nonato wrote:
> On Tue, Dec 3, 2024 at 11:36 AM Julien Grall <julien@xen.org> wrote:
>>
>> On 03/12/2024 10:08, Carlo Nonato wrote:
>>> Hi Julien,
>>>
>>> On Mon, Dec 2, 2024 at 10:44 PM Julien Grall <julien@xen.org> wrote:
>>>>
>>>> Hi Carlo,
>>>
>>> [...]
>>>
>>>>> diff --git a/xen/arch/arm/arm64/mmu/mm.c b/xen/arch/arm/arm64/mmu/mm.c
>>>>> index 671eaadbc1..3732d5897e 100644
>>>>> --- a/xen/arch/arm/arm64/mmu/mm.c
>>>>> +++ b/xen/arch/arm/arm64/mmu/mm.c
>>>>> @@ -1,6 +1,7 @@
>>>>>     /* SPDX-License-Identifier: GPL-2.0-only */
>>>>>
>>>>>     #include <xen/init.h>
>>>>> +#include <xen/llc-coloring.h>
>>>>>     #include <xen/mm.h>
>>>>>     #include <xen/pfn.h>
>>>>>
>>>>> @@ -138,27 +139,46 @@ void update_boot_mapping(bool enable)
>>>>>     }
>>>>>
>>>>>     extern void switch_ttbr_id(uint64_t ttbr);
>>>>> +extern void relocate_xen(uint64_t ttbr, void *src, void *dst, size_t len);
>>>>>
>>>>>     typedef void (switch_ttbr_fn)(uint64_t ttbr);
>>>>> +typedef void (relocate_xen_fn)(uint64_t ttbr, void *src, void *dst, size_t len);
>>>>>
>>>>>     void __init switch_ttbr(uint64_t ttbr)
>>>>
>>>> Given the change below, I think this function needs to be renamed.
>>>> Possibly to relocate_and_jump() with a comment explaning that the
>>>> relocation only happen for cache-coloring.
>>>
>>> Changing the name of switch_ttbr() to relocate_and_jump() seems a bit
>>> misleading to me. First I need to change the name also for arm32 where there's
>>> no relocation at all. Second, relocation is something that happens
>>> conditionally so I don't think it's a good name for the function.
>>
>> Feel free to propose a new name. The main thing is the current name
>> can't stay "switch_ttbr()" because you are doing more than switching the
>> TTBR.
>>
>> The other solution is to have a separate call for relocating xen (which
>> will fall-through to switch_ttbr) and another one for those that only to
>> switch TTBR.
> 
> What about a function like this one, defined in xen/arch/arm/arm64/mmu/mm.c:
> 
> typedef void (relocate_xen_fn)(uint64_t ttbr, void *src, void *dst, size_t len);
> 
> void __init relocate_and_switch_ttbr(uint64_t ttbr) {
>      vaddr_t id_addr = virt_to_maddr(relocate_xen);
>      relocate_xen_fn *fn = (relocate_xen_fn *)id_addr;
>      lpae_t pte;
> 
>      /* Enable the identity mapping in the boot page tables */
>      update_identity_mapping(true);
> 
>      /* Enable the identity mapping in the runtime page tables */
>      pte = pte_of_xenaddr((vaddr_t)relocate_xen);
>      pte.pt.table = 1;
>      pte.pt.xn = 0;
>      pte.pt.ro = 1;
>      write_pte(&xen_third_id[third_table_offset(id_addr)], pte);
> 
>      /* Relocate Xen and switch TTBR */
>      fn(ttbr, _start, (void *)BOOT_RELOC_VIRT_START, _end - _start);
> 
>      /*
>       * Disable the identity mapping in the runtime page tables.
>       * Note it is not necessary to disable it in the boot page tables
>       * because they are not going to be used by this CPU anymore.
>       */
>      update_identity_mapping(false);
> }
> 
> which is actually a clone of switch_ttbr() but it does relocation. I would
> then call it in case of coloring in setup_pagetables(). This should go in the
> direction you suggested, but it would duplicate a bit of code. What do you
> think about it?

I think the duplication is fine here.

It would be possible to reduce the duplication is we introduce an helper 
for call update_identity_mapping(true) and update the PTE. But I am not 
sure it is worth it.

Cheers,

-- 
Julien Grall


