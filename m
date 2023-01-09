Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A87036623E9
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 12:14:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473518.734173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEq6h-0000dA-CE; Mon, 09 Jan 2023 11:14:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473518.734173; Mon, 09 Jan 2023 11:14:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEq6h-0000aS-8q; Mon, 09 Jan 2023 11:14:23 +0000
Received: by outflank-mailman (input) for mailman id 473518;
 Mon, 09 Jan 2023 11:14:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pEq6g-0000aI-GE
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 11:14:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pEq6f-0003Dl-RB; Mon, 09 Jan 2023 11:14:21 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.1.158]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pEq6f-0005UR-LS; Mon, 09 Jan 2023 11:14:21 +0000
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
	bh=bpMEbxC0C/EchsSeg1PKvRuvBtnvzv7EgYhijVCgq4c=; b=A8mw0AwuLBabsFTTLabdZ5ukUO
	sF+L/DU/ZQyeFTZZhdOq+/b2XGBcYaspI0reac9JaXN8HfLsSY2KwO9xjhWxEfc1pyFNZmpIYmMla
	EPGHYD3wVf8+oeAvh98TSIxSElET2JAPfHrQuNdJPKAunFZeyra1pKTkVHmqjwQzTMc0=;
Message-ID: <82388ac9-784b-d13a-a0db-36d2fffb7cfb@xen.org>
Date: Mon, 9 Jan 2023 11:14:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v1 6/8] xen/riscv: introduce early_printk basic stuff
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <cover.1673009740.git.oleksii.kurochko@gmail.com>
 <3f30a60729b45ee01adc2d4c0eec5a89bb083abd.1673009740.git.oleksii.kurochko@gmail.com>
 <e7e66208-5a4f-f37a-6368-29489e93aad9@xen.org>
 <c197037c48921c3bbfd797172829ffa5d01609c2.camel@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c197037c48921c3bbfd797172829ffa5d01609c2.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 09/01/2023 09:10, Oleksii wrote:
> On Fri, 2023-01-06 at 13:51 +0000, Julien Grall wrote:
>> Hi,
>>
>> On 06/01/2023 13:14, Oleksii Kurochko wrote:
>>> The patch introduces a basic stuff of early_printk functionality
>>> which will be enough to print 'hello from C environment"
>>>
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> ---
>>>    xen/arch/riscv/Kconfig.debug              |  7 ++++++
>>>    xen/arch/riscv/Makefile                   |  1 +
>>>    xen/arch/riscv/early_printk.c             | 27
>>> +++++++++++++++++++++++
>>>    xen/arch/riscv/include/asm/early_printk.h | 12 ++++++++++
>>>    4 files changed, 47 insertions(+)
>>>    create mode 100644 xen/arch/riscv/early_printk.c
>>>    create mode 100644 xen/arch/riscv/include/asm/early_printk.h
>>>
>>> diff --git a/xen/arch/riscv/Kconfig.debug
>>> b/xen/arch/riscv/Kconfig.debug
>>> index e69de29bb2..940630fd62 100644
>>> --- a/xen/arch/riscv/Kconfig.debug
>>> +++ b/xen/arch/riscv/Kconfig.debug
>>> @@ -0,0 +1,7 @@
>>> +config EARLY_PRINTK
>>> +    bool "Enable early printk config"
>>> +    default DEBUG
>>> +    depends on RISCV_64
>>
>> OOI, why can't this be used for RISCV_32?
>>
> We can. It's my fault we wanted to start from RISCV_64 support so I
> totally forgot about RISCV_32 =)
>>> +    help
>>> +
>>> +      Enables early printk debug messages
>>> diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
>>> index 60db415654..e8630fe68d 100644
>>> --- a/xen/arch/riscv/Makefile
>>> +++ b/xen/arch/riscv/Makefile
>>> @@ -1,6 +1,7 @@
>>>    obj-$(CONFIG_RISCV_64) += riscv64/
>>>    obj-y += setup.o
>>>    obj-y += sbi.o
>>> +obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
>>
>> Please order the files alphabetically.
>>
>>>    
>>>    $(TARGET): $(TARGET)-syms
>>>          $(OBJCOPY) -O binary -S $< $@
>>> diff --git a/xen/arch/riscv/early_printk.c
>>> b/xen/arch/riscv/early_printk.c
>>> new file mode 100644
>>> index 0000000000..f357f3220b
>>> --- /dev/null
>>> +++ b/xen/arch/riscv/early_printk.c
>>> @@ -0,0 +1,27 @@
>>
>> Please add an SPDX license (the default for Xen is GPLv2).
>>
>>> +/*
>>> + * RISC-V early printk using SBI
>>> + *
>>> + * Copyright (C) 2021 Bobby Eshleman <bobbyeshleman@gmail.com>
>>
>> So the copyright here is from Bobby. But I don't see any mention in
>> the
>> commit message. Where is this coming from?
>>
> Could you please share with me an example how it should be look like?
> Signed-off: ... ? Or "this file was taken from patch series ..."?

This depends on the context. Do you have a pointer to the original work?

If you are taking the patch mostly as-is, then the author should be 
Bobby. The first signed-off-by would be Bobby and you will be the second 
one.

Otherwise, you could credit him with "Based on the original work from 
...". A link could be added in the commit message or after ---.

Cheers,

-- 
Julien Grall

