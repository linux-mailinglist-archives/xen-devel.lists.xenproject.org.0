Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7028D54AF15
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jun 2022 13:10:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.348811.574994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o14RW-0007WI-7M; Tue, 14 Jun 2022 11:10:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 348811.574994; Tue, 14 Jun 2022 11:10:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o14RW-0007Te-3O; Tue, 14 Jun 2022 11:10:42 +0000
Received: by outflank-mailman (input) for mailman id 348811;
 Tue, 14 Jun 2022 11:10:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o14RU-0007TV-MA
 for xen-devel@lists.xenproject.org; Tue, 14 Jun 2022 11:10:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o14RU-0005Uf-AK; Tue, 14 Jun 2022 11:10:40 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.23.240]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o14RU-0000nn-4h; Tue, 14 Jun 2022 11:10:40 +0000
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
	bh=oMIZp+yXJSEBeZsKO2/fkkXCOk7EgCg//qdPK3HV1LY=; b=j84xD1Q/+feryHoJ5s4buoY+zr
	Ns51lnFYv5fdpVcdxeJD39RuIvsNHAzy9kNaLJD0IbobX1D4PrrOHxswG7tI3j3prwPvpT9wPTPkj
	xe604hWhTG70lSwgUvlCC4+94duWhQjjl+7NmopKE9Bum+m0vqF1v8IyG5oZDCDTVWOI=;
Message-ID: <c1642dbd-2a0e-10eb-0842-32667b574a73@xen.org>
Date: Tue, 14 Jun 2022 12:10:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH] xen/arm: irq: Initialize the per-CPU IRQs while preparing
 the CPU
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220614094157.95631-1-julien@xen.org>
 <998ad0b5-1835-025c-9329-e80695247033@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <998ad0b5-1835-025c-9329-e80695247033@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14/06/2022 12:05, Michal Orzel wrote:
> Hi Julien,
> 
> On 14.06.2022 11:41, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Commit 5047cd1d5dea "xen/common: Use enhanced ASSERT_ALLOC_CONTEXT in
>> xmalloc()" extended the checks in _xmalloc() to catch any use of the
>> helpers from context with interrupts disabled.
>>
>> Unfortunately, the rule is not followed when initializing the per-CPU
>> IRQs:
>>
>> (XEN) Xen call trace:
>> (XEN)    [<002389f4>] _xmalloc+0xfc/0x314 (PC)
>> (XEN)    [<00000000>] 00000000 (LR)
>> (XEN)    [<0021a7c4>] init_one_irq_desc+0x48/0xd0
>> (XEN)    [<002807a8>] irq.c#init_local_irq_data+0x48/0xa4
>> (XEN)    [<00280834>] init_secondary_IRQ+0x10/0x2c
>> (XEN)    [<00288fa4>] start_secondary+0x194/0x274
>> (XEN)    [<40010170>] 40010170
>> (XEN)
>> (XEN)
>> (XEN) ****************************************
>> (XEN) Panic on CPU 2:
>> (XEN) Assertion '!in_irq() && (local_irq_is_enabled() || num_online_cpus() <= 1)' failed at common/xmalloc_tlsf.c:601
>> (XEN) ****************************************
>>
>> This is happening because zalloc_cpumask_var() may allocate memory
>> if NR_CPUS is > 2 * sizeof(unsigned long).
>>
>> Avoid the problem by allocate the per-CPU IRQs while preparing the
>> CPU.
> Shouldn't this be" by initializing the per-CPU IRQs while ..." ?

I am fine with using "initializing" rather than "allocating".

> Either way this text is the same like in the previous patch so I think this is not correct.

I can't quite parse this.

> Other than that:
> Reviewed-by: Michal Orzel <michal.orzel@arm.com>

Thanks!

Cheers,

-- 
Julien Grall

