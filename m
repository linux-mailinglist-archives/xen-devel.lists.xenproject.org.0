Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5A7510991
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 22:09:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314155.532110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njRUb-0004KJ-QD; Tue, 26 Apr 2022 20:09:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314155.532110; Tue, 26 Apr 2022 20:09:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njRUb-0004IU-NI; Tue, 26 Apr 2022 20:09:01 +0000
Received: by outflank-mailman (input) for mailman id 314155;
 Tue, 26 Apr 2022 20:09:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1njRUa-0004IM-5u
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 20:09:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1njRUV-0004Vr-9R; Tue, 26 Apr 2022 20:08:55 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.15.135]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1njRUV-00007Y-3m; Tue, 26 Apr 2022 20:08:55 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=AqXK2Cd6KjaYTOf+NulERg4VoBVgzIiaHCbedl7nyXU=; b=tnc8mbEBXPR2l6xNuqhsadwk2R
	yH/vZ3WXiObzp7sIPia8HieHlRXMCnlbwnEstSlMAw9wD/2ZMycBF2IRIjEbK0TMLO/7FfNlGmGkX
	KmDIyZR24W3VywHw1ecOLFn8viz9UAR+rcZYphtjV05v6F/7W3kG7a4ysR/1gnajZfjk=;
Message-ID: <4e4392d3-2078-35c8-f72f-57d1324e0541@xen.org>
Date: Tue, 26 Apr 2022 21:08:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [PATCH v4] page_alloc: assert IRQs are enabled in heap alloc/free
From: Julien Grall <julien@xen.org>
To: Jan Beulich <jbeulich@suse.com>, David Vrabel <dvrabel@cantab.net>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 David Vrabel <dvrabel@amazon.co.uk>, xen-devel@lists.xenproject.org
References: <20220425132801.1076759-1-dvrabel@cantab.net>
 <f5a45b8e-644d-15aa-951f-aa6d89ce4c5b@suse.com>
 <ecb4876e-c6d4-4bff-d964-92af83d39dff@xen.org>
In-Reply-To: <ecb4876e-c6d4-4bff-d964-92af83d39dff@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26/04/2022 15:14, Julien Grall wrote:
> On 26/04/2022 15:01, Jan Beulich wrote:
>> On 25.04.2022 15:28, David Vrabel wrote:
>>> --- a/xen/common/page_alloc.c
>>> +++ b/xen/common/page_alloc.c
>>> @@ -162,6 +162,13 @@
>>>   static char __initdata opt_badpage[100] = "";
>>>   string_param("badpage", opt_badpage);
>>> +/*
>>> + * Heap allocations may need TLB flushes which require IRQs to be
>>> + * enabled (except when only 1 PCPU is online).
>>> + */
>>> +#define ASSERT_ALLOC_CONTEXT() \
>>> +    ASSERT(!in_irq() && (local_irq_is_enabled() || num_online_cpus() 
>>> <= 1))
>>
>> At least one of these tightened assertions triggers on Arm, as per the
>> most recent smoke flight. I'm going to revert this for the time being.
> 
>  From the serial console [1]:
> 
> (XEN) Xen call trace:
> (XEN)    [<0022a510>] alloc_xenheap_pages+0x120/0x150 (PC)
> (XEN)    [<00000000>] 00000000 (LR)
> (XEN)    [<002736ac>] arch/arm/mm.c#xen_pt_update+0x144/0x6e4
> (XEN)    [<002740d4>] map_pages_to_xen+0x10/0x20
> (XEN)    [<00236864>] __vmap+0x400/0x4a4
> (XEN)    [<0026aee8>] 
> arch/arm/alternative.c#__apply_alternatives_multi_stop+0x144/0x1ec
> (XEN)    [<0022fe40>] stop_machine_run+0x23c/0x300
> (XEN)    [<002c40c4>] apply_alternatives_all+0x34/0x5c
> (XEN)    [<002ce3e8>] start_xen+0xcb8/0x1024
> (XEN)    [<00200068>] arch/arm/arm32/head.o#primary_switched+0xc/0x1c

I have sent a formal patch:

https://lore.kernel.org/xen-devel/20220426200629.58921-1-julien@xen.org/
Cheers,

-- 
Julien Grall

