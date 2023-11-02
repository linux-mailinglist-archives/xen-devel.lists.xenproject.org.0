Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1DB7DF0B6
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 11:56:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626844.977479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyVN0-0007iw-PX; Thu, 02 Nov 2023 10:56:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626844.977479; Thu, 02 Nov 2023 10:56:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyVN0-0007gk-M1; Thu, 02 Nov 2023 10:56:14 +0000
Received: by outflank-mailman (input) for mailman id 626844;
 Thu, 02 Nov 2023 10:56:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qyVMz-0007ge-Lk
 for xen-devel@lists.xenproject.org; Thu, 02 Nov 2023 10:56:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qyVMz-00022q-3q; Thu, 02 Nov 2023 10:56:13 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.12.44]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qyVMy-0004Z0-Tb; Thu, 02 Nov 2023 10:56:13 +0000
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
	bh=w+zlhcyZSz/cZVH69Ah5ltNKo1jpjAn6CgZjeNsDIPg=; b=mnq4zw7ygSmzv4H4mZotfyTX1b
	LcjBYuQFtym9dfpRR4eP18aO3qreY8slcPjG6IbxNuoeFPrtm+B++pUCuWFJbnlPGuxqk2IewVg4o
	r2CiTyFKNEztR5fOd4Ok2MSl4zmClLkRDMzmNzTHNrvL2o4ZtDAGLmUde9b43CluuKAw=;
Message-ID: <2fae1a6d-c1cc-4386-96af-ece2c27dc541@xen.org>
Date: Thu, 2 Nov 2023 10:56:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/arm32: head: Improve logging in head.S
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com, ayan.kumar.halder@amd.com,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231101233011.83098-1-julien@xen.org>
 <20231101233011.83098-3-julien@xen.org>
 <58a2c0a3-8cb0-473d-a90a-21f8d27b9206@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <58a2c0a3-8cb0-473d-a90a-21f8d27b9206@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/11/2023 10:23, Michal Orzel wrote:
>>           /* Address in the runtime mapping to jump to after the MMU is enabled */
>>           mov_w lr, primary_switched
>> @@ -593,6 +603,21 @@ enable_mmu:
>>           mcr   CP32(r0, HSCTLR)       /* now paging is enabled */
>>           isb                          /* Now, flush the icache */
>>
>> +        /*
>> +         * At this stage, the UART address will depend on whether the
>> +         * temporary mapping was created or not.
>> +         *
>> +         * If it was, then the UART will be mapped in the temporary
>> +         * area. Otherwise, it will be mapped at runtime virtual
>> +         * mapping.
>> +         */
>> +#ifdef CONFIG_EARLY_PRINTK
>> +        teq   r12, #1               /* Was the temporary mapping created? */
>> +        mov_w_on_cond eq, r11, TEMPORARY_EARLY_UART_VIRTUAL_ADDRESS
> Shouldn't the clobber list be updated?

I missed this comment. I understand it will get clobbered today, but 
thinking a bit more, I would actually prefer if r11 is updated to 
EARLY_UART_ADDRESS just right after calling switch_to_runtime_mapping.

So we can add more prints in remove_identity_mapping() and 
remove_temporary_mapping().

I will have a look to update this patch.

Cheers,

-- 
Julien Grall

