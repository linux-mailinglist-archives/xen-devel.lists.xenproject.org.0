Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE5A5679C8
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 23:56:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361632.591244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8qWj-0000JA-LF; Tue, 05 Jul 2022 21:56:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361632.591244; Tue, 05 Jul 2022 21:56:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8qWj-0000G6-IH; Tue, 05 Jul 2022 21:56:13 +0000
Received: by outflank-mailman (input) for mailman id 361632;
 Tue, 05 Jul 2022 21:56:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o8qWi-0000FL-Ca
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 21:56:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o8qWi-0006Xj-20; Tue, 05 Jul 2022 21:56:12 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o8qWh-0007q8-SV; Tue, 05 Jul 2022 21:56:11 +0000
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
	bh=bRPkaQ+mAtRkk9nQRLnLvO8fxCkGJ6LNM4AGtsIxDtY=; b=oyH8DvoMu7rCBq/lf7JbjSSkm0
	8nwIkOb7vcXjRmJXjzZrYIYgKZgJASGRkxikFjSumrpvld/PFa8erFlFOx8cF6lp+6OrxgrwVEXk+
	YqXdGmWroXNdn/c4++NZ1aA8vVwehx1wz7u8rrtby2Ey5ELUYfOKkoZ39SOLzH68wIwM=;
Message-ID: <0afd7250-b157-7fb2-1fdb-78955d2bf262@xen.org>
Date: Tue, 5 Jul 2022 22:56:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
To: Xenia Ragiadakou <burzalodowa@gmail.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220705210218.483854-1-burzalodowa@gmail.com>
 <20220705210218.483854-2-burzalodowa@gmail.com>
 <f0f36355-29c5-7355-f784-4d844ebc5566@xen.org>
 <0accbe13-2155-185f-5d77-a590e1855af3@gmail.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 1/4] xen/arm: traps: Fix MISRA C 2012 Rule 8.4 violations
In-Reply-To: <0accbe13-2155-185f-5d77-a590e1855af3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Xenia,

On 05/07/2022 22:49, Xenia Ragiadakou wrote:
> On 7/6/22 00:28, Julien Grall wrote:
>> Hi Xenia,
>>
>> On 05/07/2022 22:02, Xenia Ragiadakou wrote:
>>> Add the function prototypes of the functions below in 
>>> <asm/processor.h> header
>>> file so that they are visible before the function definitions in 
>>> traps.c.
>>> enter_hypervisor_from_guest_preirq()
>>> enter_hypervisor_from_guest()
>>> do_trap_hyp_sync()
>>> do_trap_guest_sync()
>>> do_trap_irq()
>>> do_trap_fiq()
>>> leave_hypervisor_to_guest()
>>
>> I have actually came across those missing prototypes in the past and I 
>> have refrained to add them because they are not meant to be called 
>> from C.
>>
>> While I agree this is a violation of Misra C, I am still not convinced 
>> they should be added (there is no need to verify the prototype).
> 
> Yes, there is no need. Here, I decided to follow the example of 
> do_trap_hyp_serror() and do_trap_guest_serror() for consistency.

do_trap_guest_serror() is called from C code (see arch/arm32/traps.c).

do_trap_hyp_serror() is called only from assembly. I would argue that if 
you want consistency, then you should drop the prototype rather than 
modifying 90% of the other examples.

Otherwise, this is not really consistency but more a design choice (you 
want to be fully compliant with MISRA).

Cheers,

-- 
Julien Grall

