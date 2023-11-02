Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 430BF7DF0B7
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 11:57:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626846.977489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyVNe-0008Qe-1K; Thu, 02 Nov 2023 10:56:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626846.977489; Thu, 02 Nov 2023 10:56:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyVNd-0008Ol-UX; Thu, 02 Nov 2023 10:56:53 +0000
Received: by outflank-mailman (input) for mailman id 626846;
 Thu, 02 Nov 2023 10:56:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qyVNc-0008NB-EK
 for xen-devel@lists.xenproject.org; Thu, 02 Nov 2023 10:56:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qyVNc-00023a-3F; Thu, 02 Nov 2023 10:56:52 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.12.44]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qyVNb-0004Z0-Tc; Thu, 02 Nov 2023 10:56:52 +0000
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
	bh=SJi0UlDtRi+udPA4Kz4MGbTj//6wpAVOWVMdd9vpL6w=; b=HxMdOLlucK+S6CD+jV6cll7RU+
	RkJhqi6HlDYeXD8CPnJAOm1oTfFBobyOGYqZeJjfKgYhn41z0FUbzPhxlLvaFae2yTfDG4J4m4AMR
	BRdv8c+Muy8imSYe62GdvLO+odntlh4k+5jDoiLF8FMleWqSO/ipQ0rPHH2FW5RWogM4=;
Message-ID: <2ee2d567-3bb4-4769-bcd9-1d5e4cfbb850@xen.org>
Date: Thu, 2 Nov 2023 10:56:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/arm32: head: Rework how the fixmap and early UART
 mapping are prepared
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231101233011.83098-1-julien@xen.org>
 <20231101233011.83098-2-julien@xen.org>
 <FAB1A89E-0F0A-4410-80DC-F8DD1EC8ADE6@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <FAB1A89E-0F0A-4410-80DC-F8DD1EC8ADE6@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 02/11/2023 02:29, Henry Wang wrote:
> Hi Julien,
> 
>> On Nov 2, 2023, at 07:30, Julien Grall <julien@xen.org> wrote:
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Since commit 5e213f0f4d2c ("xen/arm32: head: Widen the use of the
>> temporary mapping"), boot_second (used to cover regions like Xen and
>> the fixmap) will not be mapped if the identity mapping overlap.
>>
>> So it is ok to prepare the fixmap table and link it in boot_second
>> earlier. With that, the fixmap can also be used earlier via the
>> temporary mapping.
>>
>> Therefore split setup_fixmap() in two:
>>     * The table is now linked in create_page_tables() because
>>       the boot page tables needs to be recreated for every CPU.
>>     * The early UART mapping is only added for the boot CPU0 as the
>>       fixmap table is not cleared when secondary CPUs boot.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> ---
>> xen/arch/arm/arm32/head.S | 48 ++++++++-------------------------------
>> 1 file changed, 9 insertions(+), 39 deletions(-)
>>
>> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
>> index 33b038e7e0ca..fec2433e568f 100644
>> --- a/xen/arch/arm/arm32/head.S
>> +++ b/xen/arch/arm/arm32/head.S
>> @@ -183,12 +183,16 @@ past_zImage:
>>          bl    check_cpu_mode
>>          bl    cpu_init
>>          bl    create_page_tables
>> +        /* Add the UART mapping if requested */
>> +#ifdef CONFIG_EARLY_PRINTK
>> +        mov_w r0, EARLY_UART_VIRTUAL_ADDRESS
>> +        create_mapping_entry xen_fixmap, r0, r11, type=PT_DEV_L3
> 
> I tried to test this series today and found a corner case in this patch:
> 
> If we build Xen only with this patch, and CONFIG_EARLY_PRINTK=y, we
> will get below from compiler:
> 
> ```
> arch/arm/arm32/head.S: Assembler messages:
> arch/arm/arm32/head.S:189: Error: bad instruction `create_mapping_entry xen_fixmap,r0,r11,type=0xe73'
> make[3]: *** [Rules.mk:253: arch/arm/arm32/head.o] Error 1
> ```
> 
> With the second patch applied, the above error will disappear and I confirm
> arm32 will work fine with both patch applied + either CONFIG_EARLY_PRINTK={y,n}.

Thanks for testing. Yes I merged one hunk into the wrong patch. I will 
re-order the code.

Cheers,

-- 
Julien Grall

