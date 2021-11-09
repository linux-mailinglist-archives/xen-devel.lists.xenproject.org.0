Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AABA744AD0B
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 12:59:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223908.386870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkPlz-0002aQ-Dh; Tue, 09 Nov 2021 11:58:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223908.386870; Tue, 09 Nov 2021 11:58:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkPlz-0002YE-9k; Tue, 09 Nov 2021 11:58:43 +0000
Received: by outflank-mailman (input) for mailman id 223908;
 Tue, 09 Nov 2021 11:58:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mkPlx-0002Y8-GL
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 11:58:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mkPlt-0006Ou-LW; Tue, 09 Nov 2021 11:58:37 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.22.169]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mkPlt-0002rt-Ef; Tue, 09 Nov 2021 11:58:37 +0000
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
	bh=o/Hf95Q2lES6czjOxaWUltgJELMYguFn8xZaw8jFX2A=; b=b7vHN5SCC3fIkyb9TR2pEF2r4r
	Y+/FOURNyq8UbHJWgMTgjHZBqMxHAaQvLUnx4P4EhZaZyeJZyhPgVjuHMyhhRRwLFbjkaT8TlR/5u
	3neDtkUpCoJD6FQ2gZ91r+SaoJx/RBE84rqOl4OBuzEw2NSBj26gH3eQp0YksueY2umQ=;
Message-ID: <666a0b12-bfda-a6b4-a7e6-d58e0a01d5ff@xen.org>
Date: Tue, 9 Nov 2021 11:58:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: ASSERT in rangeset_remove_range
To: Stefano Stabellini <sstabellini@kernel.org>, oleksandr_tyshchenko@epam.com
Cc: iwj@xenproject.org, Bertrand.Marquis@arm.com,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <alpine.DEB.2.22.394.2111081430090.3317@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2111081430090.3317@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

(+ Jan, Andrew, Wei for the common code)

On 08/11/2021 22:45, Stefano Stabellini wrote:
> Hi Oleksandr, Julien,

Hi,

> I discovered a bug caused by the recent changes to introduce extended
> regions in make_hypervisor_node (more logs appended):
> 
> 
> (XEN) d1 BANK[0] 0x00000040000000-0x0000007e800000 (1000MB)
> (XEN) d1 BANK[1] 0x00000200000000-0x00000200000000 (0MB)
> (XEN) DEBUG find_unallocated_memory 994 s=40000000 e=7e7fffff
> (XEN) DEBUG find_unallocated_memory 994 s=200000000 e=1ffffffff
> (XEN) Assertion 's <= e' failed at rangeset.c:189
> 
> 
> When a bank of memory is zero in size, then rangeset_remove_range is
> called with end < start, triggering an ASSERT in rangeset_remove_range.
> 
> One solution is to avoid creating 0 size banks. The following change
> does that:
> 
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 49b4eb2b13..3efe542d0f 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -459,9 +459,12 @@ static void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
>           goto fail;
>   
>       bank_size = MIN(GUEST_RAM1_SIZE, kinfo->unassigned_mem);
> -    if ( !allocate_bank_memory(d, kinfo, gaddr_to_gfn(GUEST_RAM1_BASE),
> +    if ( bank_size > 0 )
> +    {
> +        if ( !allocate_bank_memory(d, kinfo, gaddr_to_gfn(GUEST_RAM1_BASE),
>                                  bank_size) )
> -        goto fail;
> +            goto fail;
> +    }

I would move the size check in allocate_bank_memory().

>   
>       if ( kinfo->unassigned_mem )
>           goto fail;
> 
> 
> 
> We have a couple of other options too:
> 
> - remove the ASSERT in rangeset_remove_range
> There is an argument that we should simply return error
> fromrangeset_remove_range, rather than a full assert.

To be honest, this is a developper mistake to call with end < start. If 
we were going to return an error then we would completely hide (even in 
developper) it because we would fallback to not exposing extended regions.

So I am not sure switch from ASSERT() to a plain check is a good idea. 
Jan, Andrew, Wei, what do you think?

That said, this option would not be sufficient to fix your problem as 
extended regions will not work.

> 
> - add a if (end > start) check before calling rangeset_remove_range
> We could check that end > start before calling rangeset_remove_range at
> all the call sites in domain_build.c. There are 5 call sites at the
> moment.

I think we only want to add (end > start) where we expect the region 
size to be 0. AFAICT, the only other potential place where this can 
happens is ``find_memory_holes()`` (I vaguely recall a discussion in the 
past where some of the "reg"  property would have size == 0).

> 
> Any other ideas or suggestions?

My preference goes with your initial sugestion (so long the check is 
moved to allocate_bank_memory()).

[...]

> (XEN) Assertion 's <= e' failed at rangeset.c:189
> (XEN) ----[ Xen-4.16-rc  arm64  debug=y  Not tainted ]----
> (XEN) Xen call trace:
> (XEN)    [<0000000000220e6c>] rangeset_remove_range+0xbc/0x2bc (PC)
> (XEN)    [<00000000002cd508>] domain_build.c#make_hypervisor_node+0x258/0x7f4 (LR)
> (XEN)    [<00000000002cf2a8>] domain_build.c#construct_domU+0x9cc/0xa8c

Vanilla staging doesn't call make_hypervisor_node() from construct_domU. 
So what are you using?

> (XEN)    [<00000000002d0440>] create_domUs+0xe8/0x224
> (XEN)    [<00000000002d4988>] start_xen+0xafc/0xbf0
> (XEN)    [<00000000002001a0>] arm64/head.o#primary_switched+0xc/0x1c
> (XEN)
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 0:
> (XEN) Assertion 's <= e' failed at rangeset.c:189
> (XEN) ****************************************
> 

Cheers,

-- 
Julien Grall

