Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9E05113EC
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 10:53:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314574.532692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njdQY-0003QC-I0; Wed, 27 Apr 2022 08:53:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314574.532692; Wed, 27 Apr 2022 08:53:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njdQY-0003ON-Ds; Wed, 27 Apr 2022 08:53:38 +0000
Received: by outflank-mailman (input) for mailman id 314574;
 Wed, 27 Apr 2022 08:53:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1njdQX-0003OF-2O
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 08:53:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1njdQR-00012C-9X; Wed, 27 Apr 2022 08:53:31 +0000
Received: from [54.239.6.186] (helo=[192.168.24.58])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1njdQR-0005z0-2N; Wed, 27 Apr 2022 08:53:31 +0000
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
	bh=LQto5+T4vhDW1jL85sCepWhHMkn7MmtO53Pn/SK4/G0=; b=Y83yQ49vn9Qb6LawcYuIfTOU1l
	8OvqRr9LCIiBuSF7KfKlnJAlMk2oC7S8852tETGomMu6/FFx8r2HAh+owLb34y1y8gM+lWWSWSw7h
	syuqWt/RGSlQ4oadF0419fa1DG8jgvIqdEZpN7ZiiyglTGlqNETKWrO7ZjIrNH5CvG34=;
Message-ID: <50127f0d-121b-4e9f-b5da-d78cdb41f8fa@xen.org>
Date: Wed, 27 Apr 2022 09:53:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [PATCH] xen/arm: alternative: Don't call vmap() within
 stop_machine_run()
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 David Vrabel <dvrabel@amazon.co.uk>, xen-devel@lists.xenproject.org
References: <20220426200629.58921-1-julien@xen.org>
 <0aacc53d-279f-2e0d-b495-217133e75e03@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <0aacc53d-279f-2e0d-b495-217133e75e03@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 27/04/2022 07:42, Jan Beulich wrote:
> On 26.04.2022 22:06, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Commit 88a037e2cfe1 "page_alloc: assert IRQs are enabled in heap
>> alloc/free" extended the checks in the buddy allocator to catch
>> any use of the helpers from context with interrupts disabled.
>>
>> Unfortunately, the rule is not followed in the alternative code and
>> this will result to crash at boot with debug enabled:
>>
>> (XEN) Xen call trace:
>> (XEN)    [<0022a510>] alloc_xenheap_pages+0x120/0x150 (PC)
>> (XEN)    [<00000000>] 00000000 (LR)
>> (XEN)    [<002736ac>] arch/arm/mm.c#xen_pt_update+0x144/0x6e4
>> (XEN)    [<002740d4>] map_pages_to_xen+0x10/0x20
>> (XEN)    [<00236864>] __vmap+0x400/0x4a4
>> (XEN)    [<0026aee8>] arch/arm/alternative.c#__apply_alternatives_multi_stop+0x144/0x1ec
>> (XEN)    [<0022fe40>] stop_machine_run+0x23c/0x300
>> (XEN)    [<002c40c4>] apply_alternatives_all+0x34/0x5c
>> (XEN)    [<002ce3e8>] start_xen+0xcb8/0x1024
>> (XEN)    [<00200068>] arch/arm/arm32/head.o#primary_switched+0xc/0x1c
>>
>> The interrupts will be disabled by the state machine in stop_machine_run(),
>> hence why the ASSERT is hit.
>>
>> For now the patch extending the checks has been reverted, but it would
>> be good to re-introduce it (allocation with interrupts disabled is not
>> desirable).
> 
> We definitely should re-apply that patch once the one here went in.

I have commit this patch and also re-apply David's patch.

Cheers,

-- 
Julien Grall

