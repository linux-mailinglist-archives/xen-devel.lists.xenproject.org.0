Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA485562590
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 23:50:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358724.588044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o722y-0000n9-J7; Thu, 30 Jun 2022 21:50:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358724.588044; Thu, 30 Jun 2022 21:50:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o722y-0000lJ-GC; Thu, 30 Jun 2022 21:50:00 +0000
Received: by outflank-mailman (input) for mailman id 358724;
 Thu, 30 Jun 2022 21:49:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o722x-0000lD-PE
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 21:49:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o722r-0005ts-69; Thu, 30 Jun 2022 21:49:53 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o722q-0001iP-Up; Thu, 30 Jun 2022 21:49:53 +0000
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
	bh=Nxr2urabtnXbbACzZJT+wojuonK0+VBifsLRBxz7Fak=; b=xhA6tkMkfLH4DNSUJ5v06uMEy6
	TLrCBCxXDohfw28Tfn3zozLu77yE3El2ndoR2lQGvtgkLsGG/PMTiLtTkzEZEACJMQOptrlFJkDUq
	9X3Z36V0tAyA2+ew4Nkn7lWOgw4+l2VnqNe4p9e7fsuyRDdwpYLCaznBVBt0ryazv0+U=;
Message-ID: <ef5bf7df-ad8a-e420-0fc4-d8f0a0e0f2fc@xen.org>
Date: Thu, 30 Jun 2022 22:49:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
To: Jan Beulich <jbeulich@suse.com>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <1652294845-13980-1-git-send-email-olekstysh@gmail.com>
 <632404c3-b285-753d-6644-bccbc17d42c0@xen.org>
 <15da3838-aa8e-57c3-b9e2-6c0a4a639fb0@suse.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH V6 1/2] xen/gnttab: Store frame GFN in struct page_info on
 Arm
In-Reply-To: <15da3838-aa8e-57c3-b9e2-6c0a4a639fb0@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 24/06/2022 07:45, Jan Beulich wrote:
> On 23.06.2022 19:50, Julien Grall wrote:
>> On 11/05/2022 19:47, Oleksandr Tyshchenko wrote:
>>> @@ -1505,7 +1507,23 @@ int xenmem_add_to_physmap_one(
>>>        }
>>>    
>>>        /* Map at new location. */
>>> -    rc = guest_physmap_add_entry(d, gfn, mfn, 0, t);
>>
>>> +    if ( !p2m_is_ram(t) || !is_xen_heap_mfn(mfn) )
>>> +        rc = guest_physmap_add_entry(d, gfn, mfn, 0, t);
>>
>> I would expand the comment above to explain why you need a different
>> path for xenheap mapped as RAM. AFAICT, this is because we need to call
>> page_set_xenheap_gfn().
>>
>>> +    else
>>> +    {
>>> +        struct p2m_domain *p2m = p2m_get_hostp2m(d);
>>> +
>>> +        p2m_write_lock(p2m);
>>> +        if ( gfn_eq(page_get_xenheap_gfn(mfn_to_page(mfn)), INVALID_GFN) )
>>
>> Sorry to only notice it now. This check will also change the behavior
>> for XENMAPSPACE_shared_info. Now, we are only allowed to map the shared
>> info once.
>>
>> I believe this is fine because AFAICT x86 already prevents it. But this
>> is probably something that ought to be explained in the already long
>> commit message.
> 
> If by "prevent" you mean x86 unmaps the page from its earlier GFN, then
> yes. But this means that Arm would better follow that model instead of
> returning -EBUSY in this case. Just think of kexec-ing or a boot loader
> wanting to map shared info or grant table: There wouldn't necessarily
> be an explicit unmap.

I spent some time to think about this. There is a potential big issue 
with implicit unmapping from its earlier GFN. Imagine the boot loader 
decided to map the page in place of a RAM.

If the boot loader didn't unmap the page then when the OS map again, we 
would have a hole in the RAM. The OS may not know that and it may end up 
to use a page as RAM (and crash).

The problem is the same for kexec and AFAIU that's why we need to use 
soft-reset when kexec-ing.

So overall, I think we should prevent implicit unmap. So it would help 
to enforce that the bootloader (or any other components) clean-up behind 
themselves (i.e. unmap the page and populate if necessary).

Cheers,

-- 
Julien Grall

