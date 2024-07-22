Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C531793931F
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 19:21:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762290.1172438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVwj0-0006ce-0n; Mon, 22 Jul 2024 17:21:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762290.1172438; Mon, 22 Jul 2024 17:21:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVwiz-0006ZK-U2; Mon, 22 Jul 2024 17:21:25 +0000
Received: by outflank-mailman (input) for mailman id 762290;
 Mon, 22 Jul 2024 17:21:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sVwiy-0006ZE-2W
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 17:21:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sVwiv-0003f2-Nt; Mon, 22 Jul 2024 17:21:21 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sVwiv-0001Au-IA; Mon, 22 Jul 2024 17:21:21 +0000
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
	bh=SuZOPzmd4k+Jsla1AVpfAQADydFs9J5k0uoqoBCri7k=; b=r6xLy9wbTZuBPhP//Jr/Mir3wS
	j9O7CZX4VGiStuCRTb05b4xzS8QFIvwwuFgLgu3fcXoXZnrbZRzg+SJHtftPdt3D7UlPN+jWC6tce
	oL1lmCGSWoDvRK8VlIgTsOxyBjDS+cVD2ujZvSj06R41okltYfWKeQvHyqahieGfi8I4=;
Message-ID: <26ae01e2-d085-48d7-8b1f-da1e44b01e53@xen.org>
Date: Mon, 22 Jul 2024 18:21:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] xen/riscv: introduce asm/pmap.h header
Content-Language: en-GB
To: Oleksii Kurochko <inisider@gmail.com>, Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1720799925.git.oleksii.kurochko@gmail.com>
 <c7331e4c2f481f069571976a708c4aba04d2c0e4.1720799926.git.oleksii.kurochko@gmail.com>
 <6458c61d-5974-41c2-a1e6-76e4a15a487a@suse.com>
 <54af6fb751da1103054de2d79a2057bec658f399.camel@gmail.com>
 <623da862-8e76-4d40-9aa9-b02c8fd9944d@xen.org>
 <a53ef38e044db149bb37b70f1e56a33c6a3e7c83.camel@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a53ef38e044db149bb37b70f1e56a33c6a3e7c83.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 22/07/2024 18:09, Oleksii Kurochko wrote:
> On Mon, 2024-07-22 at 15:48 +0100, Julien Grall wrote:
>> Hi,
>>
>> On 22/07/2024 15:44, Oleksii Kurochko wrote:
>>> On Mon, 2024-07-22 at 14:54 +0200, Jan Beulich wrote:
>>>> On 12.07.2024 18:22, Oleksii Kurochko wrote:
>>>>> --- /dev/null
>>>>> +++ b/xen/arch/riscv/include/asm/pmap.h
>>>>> @@ -0,0 +1,28 @@
>>>>> +#ifndef __ASM_PMAP_H__
>>>>> +#define __ASM_PMAP_H__
>>>>> +
>>>>> +#include <xen/bug.h>
>>>>> +#include <xen/mm.h>
>>>>> +
>>>>> +#include <asm/fixmap.h>
>>>>> +
>>>>> +static inline void arch_pmap_map(unsigned int slot, mfn_t mfn)
>>>>> +{
>>>>> +    pte_t *entry = &xen_fixmap[slot];
>>>>> +    pte_t pte;
>>>>> +
>>>>> +    ASSERT(!pte_is_valid(*entry));
>>>>> +
>>>>> +    pte = mfn_to_xen_entry(mfn, PAGE_HYPERVISOR_RW);
>>>>> +    pte.pte |= PTE_LEAF_DEFAULT;
>>>>> +    write_pte(entry, pte);
>>>>> +}
>>>>> +
>>>>> +static inline void arch_pmap_unmap(unsigned int slot)
>>>>> +{
>>>>> +    pte_t pte = {};
>>>>> +
>>>>> +    write_pte(&xen_fixmap[slot], pte);
>>>>> +}
>>>>
>>>> Why are these not using set_fixmap() / clear_fixmap()
>>>> respectively?
>>> They haven't been introduced yet. And I thought that these fucntion
>>> are
>>> used only in pmap_{un}map() and that is the reason why I decided to
>>> not
>>> introduce them. But while writing the answer on another comment, I
>>> found other places where set_fixmap() / clear_fixmap() are used, so
>>> I
>>> will introduce them and reuse here.
>>
>> I am guessing you are going to implement set_fixmap()/clear_fixmap()
>> using map_pages_to_xen(). If so, for early boot you are going to end
>> up
>> in a circular loop because map_pages_to_xen() will likely use pmap()
>> which will call set_fixmap().
> I am going to implement that in the following way as I faced the
> described by you issue when I first time tried to implement it using
> map_pages_to_xen():
What's wrong with keeping the arch_pmap_*() as-is and call 
map_pages_to_xen() in the fixmap?

At least this would be consistent with what other architectures does and 
less risky (see below).

>     /* Map a 4k page in a fixmap entry */
>     void set_fixmap(unsigned map, mfn_t mfn, unsigned int flags)
>     {
>         pte_t pte;
>     
>         pte = mfn_to_xen_entry(mfn, flags);
>         pte.pte |= PTE_LEAF_DEFAULT;
>         write_pte(&xen_fixmap[pt_index(0, FIXMAP_ADDR(map))], pte);

It would be saner to check if you are not overwriting any existing 
mapping as otherwise you will probably need a TLB flush.

>     }
>     
>     /* Remove a mapping from a fixmap entry */
>     void clear_fixmap(unsigned map)
>     {
>         pte_t pte = {0};
>         write_pte(&xen_fixmap[pt_index(0, FIXMAP_ADDR(map))], pte);

Don't you need a TLB flush?

Cheers,

-- 
Julien Grall

