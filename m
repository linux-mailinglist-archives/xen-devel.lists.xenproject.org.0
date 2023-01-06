Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D12D66037F
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 16:39:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472774.733135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDooU-00011k-5Z; Fri, 06 Jan 2023 15:39:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472774.733135; Fri, 06 Jan 2023 15:39:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDooU-0000ya-2Q; Fri, 06 Jan 2023 15:39:22 +0000
Received: by outflank-mailman (input) for mailman id 472774;
 Fri, 06 Jan 2023 15:39:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pDooS-0000yU-Lo
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 15:39:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pDooS-0002Sd-8N; Fri, 06 Jan 2023 15:39:20 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.4.240]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pDooS-0006Cg-1W; Fri, 06 Jan 2023 15:39:20 +0000
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
	bh=2b/ivgfkVHeJEkn1ZmY0o6bI75hFvxbn7e3b1wNI5So=; b=5I4xi7U2qDvifQww5bLNeTgXm8
	Mc9JUJTuJARTbERribUbYhjc+2ay5F17v3TDVW1v9Rf64EG7jM03KvyYSSudISznzvoSQI7jP0IBa
	frHHY1e9q3gdh3UTWSBuyq3Vt7bO1BI/ahw54iMRjggKH79e7DbB2YgJKHccrweO56LQ=;
Message-ID: <d1f1f50d-86f7-5969-2df0-1dc9a890554c@xen.org>
Date: Fri, 6 Jan 2023 15:39:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v1 4/8] xen/riscv: introduce sbi call to putchar to
 console
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <cover.1673009740.git.oleksii.kurochko@gmail.com>
 <09da5a3184242152af6af060720a007738a55d6e.1673009740.git.oleksii.kurochko@gmail.com>
 <d77e7617-5263-0072-4786-ba6144247a4b@xen.org>
 <8b6a9927-8a56-6fab-6658-deb4083d2c45@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <8b6a9927-8a56-6fab-6658-deb4083d2c45@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 06/01/2023 15:19, Andrew Cooper wrote:
> On 06/01/2023 1:40 pm, Julien Grall wrote:
>> Hi,
>>
>> On 06/01/2023 13:14, Oleksii Kurochko wrote:
>>> The patch introduce sbi_putchar() SBI call which is necessary
>>> to implement initial early_printk
>>>
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> ---
>>>    xen/arch/riscv/Makefile          |  1 +
>>>    xen/arch/riscv/include/asm/sbi.h | 34 ++++++++++++++++++++++++
>>>    xen/arch/riscv/sbi.c             | 44 ++++++++++++++++++++++++++++++++
>>
>> IMHO, it would be better to implement sbi.c in assembly so you can use
>> print in the console before you jump to C world.
> 
> That was already requested not to happen.  Frankly, if I was an arm
> maintainer I'd object to the how it's used there too, but RISCV is
> massively more simple still.

There are a few reasons:
   1) Xen is not fully position independent. Even if -fpic is enabled, 
you would still need apply some relocation in order if you want to use 
it before running in the virtual address space.
   2) Doing any memory access before the MMU is setup requires some 
careful though (see [1]). With function implemented in C, you can't 
really control which memory accesses are done.

> 
> Not even the pagetable setup, or the physical relocation (if even
> necessary) needs doing in ASM.
> 
> I'm not completely ruling it out in the future, but someone is going to
> have to come up with a very convincing argument for why they can't do
> this piece of critical setup in C.

That's great if RISC-V doesn't have the issues I mentioned above. On 
Arm, I don't really think we can get away. But feel free to explain how 
this could be done...

Cheers,

[1] 
https://events.static.linuxfound.org/sites/events/files/slides/slides_10.pdf

-- 
Julien Grall

