Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0924E704D
	for <lists+xen-devel@lfdr.de>; Fri, 25 Mar 2022 10:52:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294626.501044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXgbs-0000KI-Rl; Fri, 25 Mar 2022 09:51:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294626.501044; Fri, 25 Mar 2022 09:51:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXgbs-0000HI-Ob; Fri, 25 Mar 2022 09:51:56 +0000
Received: by outflank-mailman (input) for mailman id 294626;
 Fri, 25 Mar 2022 09:51:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nXgbr-0000HC-Jk
 for xen-devel@lists.xenproject.org; Fri, 25 Mar 2022 09:51:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nXgbr-0007d8-7B; Fri, 25 Mar 2022 09:51:55 +0000
Received: from [54.239.6.185] (helo=[192.168.14.36])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nXgbr-0005BS-0y; Fri, 25 Mar 2022 09:51:55 +0000
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
	bh=MrvaKqyjOmUOMmYbhTXITBRj89jdqBGAglnnMn1Kvow=; b=2ADw8DSxOFuj2SVyW/xVe0nVcs
	u3Ru6srCuL4x3ToGKcJy2ptxBQ1K+uxZvonj4yl+khCldzH9gLsOa0YOyvh90uVKehdO8IM4OFgSs
	iK840TNkzAT5tWit47BzZdjvg/OD13qDC+hVtrusLkX73axHT+I1K+d4Y04Fn3echaHk=;
Message-ID: <7de4ca80-48dd-d366-c428-a156ffc57a2d@xen.org>
Date: Fri, 25 Mar 2022 09:51:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH] xen/arm: set CPSR Z bit when creating aarch32 guests
To: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20220325010052.1597420-1-sstabellini@kernel.org>
 <PAXPR08MB74201501E8AF611683A60ACF9E1A9@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <PAXPR08MB74201501E8AF611683A60ACF9E1A9@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Wei,

On 25/03/2022 02:51, Wei Chen wrote:
>> -----Original Message-----
>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of
>> Stefano Stabellini
>> Sent: 2022年3月25日 9:01
>> To: xen-devel@lists.xenproject.org
>> Cc: julien@xen.org; sstabellini@kernel.org; Bertrand Marquis
>> <Bertrand.Marquis@arm.com>; Volodymyr_Babchuk@epam.com; Stefano Stabellini
>> <stefano.stabellini@xilinx.com>
>> Subject: [PATCH] xen/arm: set CPSR Z bit when creating aarch32 guests
>>
>> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
>>
>> The first 32 bytes of zImage are NOPs. When CONFIG_EFI is enabled in the
>> kernel, certain versions of Linux will use an UNPREDICATABLE NOP
>> encoding, sometimes resulting in an unbootable kernel. Whether the
>> resulting kernel is bootable or not depends on the processor. See commit
>> a92882a4d270 in the Linux kernel for all the details.
>>
>> All kernel releases starting from Linux 4.9 without commit a92882a4d270
>> are affected.
>>
>> Fortunately there is a simple workaround: setting the "Z" bit in CPSR
>> make it so those invalid NOP instructions are never executed. That is
>> because the instruction is conditional (not equal). So, on QEMU at
>> least, the instruction will end up to be ignored and not generate an
>> exception. Setting the "Z" bit makes those kernel versions bootable
>> again and it is harmless in the other cases.
>>
>> Note that both U-Boot and QEMU -kernel set the "Z" bit in CPSR when
>> booting a zImage kernel on aarch32.
>>
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>> ---
>> Changes in v3:
>> - improve commit message
>> - improve in-code comment
>>
>> Changes in v2:
>> - improve commit message
>> - add in-code comment
>> - move PSR_Z to the beginning
>> ---
>>   xen/include/public/arch-arm.h | 11 ++++++++++-
>>   1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
>> index 94b31511dd..c0c1149e27 100644
>> --- a/xen/include/public/arch-arm.h
>> +++ b/xen/include/public/arch-arm.h
>> @@ -361,6 +361,7 @@ typedef uint64_t xen_callback_t;
>>   #define PSR_DBG_MASK    (1<<9)        /* arm64: Debug Exception mask */
>>   #define PSR_IT_MASK     (0x0600fc00)  /* Thumb If-Then Mask */
>>   #define PSR_JAZELLE     (1<<24)       /* Jazelle Mode */
>> +#define PSR_Z           (1<<30)       /* Zero condition flag */
>>
>>   /* 32 bit modes */
>>   #define PSR_MODE_USR 0x10
>> @@ -383,7 +384,15 @@ typedef uint64_t xen_callback_t;
>>   #define PSR_MODE_EL1t 0x04
>>   #define PSR_MODE_EL0t 0x00
>>
>> -#define PSR_GUEST32_INIT
>> (PSR_ABT_MASK|PSR_FIQ_MASK|PSR_IRQ_MASK|PSR_MODE_SVC)
>> +/*
>> + * We set PSR_Z to be able to boot Linux kernel versions with an invalid
>> + * encoding of the first 8 NOP instructions. See commit a92882a4d270 in
>> + * Linux.
>> + *
>> + * Note that PSR_Z is also set by U-Boot and QEMU -kernel when loading
>> + * zImage kernels on aarch32.
>> + */
>> +#define PSR_GUEST32_INIT
>> (PSR_Z|PSR_ABT_MASK|PSR_FIQ_MASK|PSR_IRQ_MASK|PSR_MODE_SVC)
>>   #define PSR_GUEST64_INIT
>> (PSR_ABT_MASK|PSR_FIQ_MASK|PSR_IRQ_MASK|PSR_MODE_EL1h)
>>
> 
> Maybe this is a good opportunity to fix the alignment of the two macros : )

I have dropped one space for PSR_GUEST32_INIT and committed.

Cheers,

-- 
Julien Grall

