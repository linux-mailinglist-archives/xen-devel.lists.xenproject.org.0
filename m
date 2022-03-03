Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4EE4CC693
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 20:52:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283702.482795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPrU0-0006zj-M1; Thu, 03 Mar 2022 19:51:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283702.482795; Thu, 03 Mar 2022 19:51:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPrU0-0006wG-J1; Thu, 03 Mar 2022 19:51:28 +0000
Received: by outflank-mailman (input) for mailman id 283702;
 Thu, 03 Mar 2022 19:51:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nPrTz-0006wA-JR
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 19:51:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nPrTz-0004or-Av; Thu, 03 Mar 2022 19:51:27 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nPrTz-0003OV-5R; Thu, 03 Mar 2022 19:51:27 +0000
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
	bh=rC4HdGpY6qF32CtQhpopw67qgDTJI8DLQrD0drn/GZs=; b=T4P6JqHefBAmAcYQrvmlD45SZP
	+78c5KBJi/ir86pAor0WKKr0BMU3LzSXhaB1ORm9ApZgQ+m+e7ssbchYsdJ5fYAcxHBDwC5y3FCIB
	abGTtS+yzgOHyOvfLhJbPW9E0ZzFeWQ9BYklrdevyIgzOvUWmPyv1HiAEQ7i6kvxfN5o=;
Message-ID: <d860bbdb-c0ef-d4c4-51aa-b248a858e177@xen.org>
Date: Thu, 3 Mar 2022 19:51:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
To: Wei Chen <Wei.Chen@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Penny Zheng <Penny.Zheng@arm.com>, Henry Wang <Henry.Wang@arm.com>,
 nd <nd@arm.com>
References: <PAXPR08MB7420A01809B84E04E196793F9E3D9@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <04db7e8b-2f04-41d7-1deb-d8bda3625c04@xen.org>
 <PAXPR08MB7420BF1299A1577B98211C1A9E029@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <1f0bba54-158b-d171-6f99-0c29e0547f8a@xen.org>
 <PAXPR08MB742067028155B11528C5CCA39E049@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Subject: Re: Proposal for Porting Xen to Armv8-R64 - DraftA
In-Reply-To: <PAXPR08MB742067028155B11528C5CCA39E049@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Wei,

On 03/03/2022 02:06, Wei Chen wrote:
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: 2022年3月2日 20:00
>> To: Wei Chen <Wei.Chen@arm.com>; xen-devel@lists.xenproject.org; Stefano
>> Stabellini <sstabellini@kernel.org>
>> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>; Penny Zheng
>> <Penny.Zheng@arm.com>; Henry Wang <Henry.Wang@arm.com>; nd <nd@arm.com>
>> Subject: Re: Proposal for Porting Xen to Armv8-R64 - DraftA
>>
>>
>>
>> On 01/03/2022 07:51, Wei Chen wrote:
>>> Hi Julien,
>>
>> Hi Wei,
>>
>>>> -----Original Message-----
>>>> From: Julien Grall <julien@xen.org>
>>>> Sent: 2022年2月26日 4:55
>>>> To: Wei Chen <Wei.Chen@arm.com>; xen-devel@lists.xenproject.org;
>> Stefano
>>>> Stabellini <sstabellini@kernel.org>
>>>> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>; Penny Zheng
>>>> <Penny.Zheng@arm.com>; Henry Wang <Henry.Wang@arm.com>; nd <nd@arm.com>
>>>> Subject: Re: Proposal for Porting Xen to Armv8-R64 - DraftA
>>>>> ### 1.2. Xen Challenges with PMSA Virtualization
>>>>> Xen is PMSA unaware Type-1 Hypervisor, it will need modifications to
>> run
>>>>> with an MPU and host multiple guest OSes.
>>>>>
>>>>> - No MMU at EL2:
>>>>>        - No EL2 Stage 1 address translation
>>>>>            - Xen provides fixed ARM64 virtual memory layout as basis of
>>>> EL2
>>>>>              stage 1 address translation, which is not applicable on
>> MPU
>>>> system,
>>>>>              where there is no virtual addressing. As a result, any
>>>> operation
>>>>>              involving transition from PA to VA, like ioremap, needs
>>>> modification
>>>>>              on MPU system.
>>>>>        - Xen's run-time addresses are the same as the link time
>> addresses.
>>>>>            - Enable PIC (position-independent code) on a real-time
>> target
>>>>>              processor probably very rare.
>>>>
>>>> Aside the assembly boot code and UEFI stub, Xen already runs at the
>> same
>>>> address as it was linked.
>>>>
>>>
>>> But the difference is that, base on MMU, we can use the same link
>> address
>>> for all platforms. But on MPU system, we can't do it in the same way.
>>
>> I agree that we currently use the same link address for all the
>> platforms. But this is also a problem when using MMU because EL2 has a
>> single TTBR.
>>
>> At the moment we are switching page-tables with the MMU which is not
>> safe. Instead we need to turn out the MMU off, switch page-tables and
>> then turn on the MMU. This means we need to have an identity mapping of
>> Xen in the page-tables. Assuming Xen is not relocated, the identity
>> mapping may clash with Xen (or the rest of the virtual address map).
>>
> 
> Is this the same reason we create a dummy reloc section for EFI loader?

The relocations for the EFI loader are necessary because IIRC it is 
running with virt == phys.

But this brings to all sort of problem:

https://lore.kernel.org/all/20171221145521.29526-1-julien.grall@linaro.org/

[...]

>>>
>>> Some callers that want to change a memory's attribute will set them.
>> Something like
>>> ioremap_nocache. I am not sure is this what you had asked : )
>>
>> I am a bit confused. If ioremap_nocache() can change the attribute, then
>> why would ioremap_attr() not be able to do it?
>>
> 
> MMU based iorepmap_xxxx can use a new VA and new PTE to do this. But for
> MPU, we can't do it, except you change the whole MPU region's attribute.
> The reasons are:
> 1. For V8R PMSA, one physical address only be existed one MPU region.
> 2. There's not enough MPU regions for us to split one MPU region to
>     multiple MPU regions (changed pages region and unmodified pages regions).

Ok. I think we should at least check the attributes requested match the 
one in the MPU.

> 
>>>
>>>>
>>>>>                if ( CACHE_ATTR_need_change )
>>>>>                    return NULL;
>>>>>                return (void *)pa;
>>>>>            }
>>>>>            static inline void __iomem *ioremap_nocache(...)
>>>>>            {
>>>>>                return ioremap_attr(start, len, PAGE_HYPERVISOR_NOCACHE);
>>>>>            }
>>>>>            static inline void __iomem *ioremap_cache(...)
>>>>>            {
>>>>>                return ioremap_attr(start, len, PAGE_HYPERVISOR);
>>>>>            }
>>>>>            static inline void __iomem *ioremap_wc(...)
>>>>>            {
>>>>>                return ioremap_attr(start, len, PAGE_HYPERVISOR_WC);
>>>>>            }
>>>>>            void *ioremap(...)
>>>>>            {
>>>>>                return ioremap_attr(pa, len, PAGE_HYPERVISOR_NOCACHE);
>>>>>            }
>>>>>
>>>>>            ```
>>>>>        4. For `alternative`, it depends on `vmap` too.
>>>>
>>>> The only reason we depend on vmap() is because the map the sections
>>>> *text read-only and we enforce WnX. For VMSA, it would be possible to
>>>> avoid vmap() with some rework. I don't know for PMSA.
>>>>
>>>
>>> For PMSA, we still enforce WnX. For your use case, I assume it's
>> alternative.
>>> It still may have some possibility to avoid vmap(). But there may be
>> some
>>> security issues. We had thought to disable MPU -> update xen text ->
>> enable
>>> MPU to copy VMSA alternative's behavior. The problem with this, however,
>>> is that at some point, all memory is RWX. There maybe some security
>> risk. > But because it's in init stage, it probably doesn't matter as much
>> as
>> I thought.
>>
>> For boot code, we need to ensure the code is compliant to the Arm Arm.
>> Other than that, it is OK to have the memory RWX for a short period of
>> time.
>>
>> In fact, when we originally boot Xen, we don't enforce WnX. We will
>> start to enforce when initializing the memory. But there are no blocker
>> to delay it (other than writing the code :)).
> 
> Ah, ok, it seems we still can implement alternative on MPU system.
> I will update it in new version proposal, but place it in TODO, I don't
> want to include it before single CPU support be merged. Because current
> patch series is huge enough : )

That's fine with me. I am not expecting you to implement everything we 
discussed here from day 1! :)

Cheers,

-- 
Julien Grall

