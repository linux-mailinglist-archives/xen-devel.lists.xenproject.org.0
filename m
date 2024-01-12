Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A2482BF82
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jan 2024 12:55:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666858.1037795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOG84-0008US-J8; Fri, 12 Jan 2024 11:55:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666858.1037795; Fri, 12 Jan 2024 11:55:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOG84-0008SN-GU; Fri, 12 Jan 2024 11:55:16 +0000
Received: by outflank-mailman (input) for mailman id 666858;
 Fri, 12 Jan 2024 11:55:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rOG82-0008SE-PF
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2024 11:55:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rOG82-0008Cq-2j; Fri, 12 Jan 2024 11:55:14 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rOG81-0001QQ-Ta; Fri, 12 Jan 2024 11:55:14 +0000
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
	bh=ZLo3nAB/Nbgl2/KRcGrKclifdZ8eIU9XGts2JGAItlk=; b=KRuVZVPlh6S/2syqflMVJB+qxm
	5D5VYKdX3jTHK6dt+bM/ceiasNct1hVpEWBIbHpm95cIDhBoxlBFs4/X07I+uHslykIv7ACbB5SEA
	PqKOKYVr47TYxMGRw+GA7OJ7ENKAd4SuDQsfnw1c6AQRAGvVvNipJpyjyyKZdGDnkq10=;
Message-ID: <da0c98ec-85e1-4b71-97da-840015773a2c@xen.org>
Date: Fri, 12 Jan 2024 11:55:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] xen/arm32: head: Improve logging in head.S
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240111183410.45566-1-julien@xen.org>
 <20240111183410.45566-3-julien@xen.org>
 <58d2e455-2894-4b1f-948a-3b486bb84499@amd.com>
 <bb7d0581-6e47-4dce-afa3-0f3d55db9ebf@xen.org>
 <a154f9c4-6905-4f51-a8fd-36f3ca652f1d@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a154f9c4-6905-4f51-a8fd-36f3ca652f1d@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 12/01/2024 11:25, Michal Orzel wrote:
> 
> 
> On 12/01/2024 11:58, Julien Grall wrote:
>>
>>
>> On 12/01/2024 08:49, Michal Orzel wrote:
>>> Hi Julien,
>>
>> Hi Michal,
>>
>>> On 11/01/2024 19:34, Julien Grall wrote:
>>>>
>>>>
>>>> From: Julien Grall <jgrall@amazon.com>
>>>>
>>>> The sequence to enable the MMU on arm32 is quite complex as we may need
>>>> to jump to a temporary mapping to map Xen.
>>>>
>>>> Recently, we had one bug in the logic (see f5a49eb7f8b3 ("xen/arm32:
>>>> head: Add mising isb in switch_to_runtime_mapping()") and it was
>>>> a pain to debug because there are no logging.
>>>>
>>>> In order to improve the logging in the MMU switch we need to add
>>>> support for early printk while running on the identity mapping
>>>> and also on the temporary mapping.
>>>>
>>>> For the identity mapping, we have only the first page of Xen mapped.
>>>> So all the strings should reside in the first page. For that purpose
>>>> a new macro PRINT_ID is introduced.
>>>>
>>>> For the temporary mapping, the fixmap is already linked in the temporary
>>>> area (and so does the UART). So we just need to update the register
>>>> storing the UART address (i.e. r11) to point to the UART temporary
>>>> mapping.
>>>>
>>>> Take the opportunity to introduce mov_w_on_cond in order to
>>>> conditionally execute mov_w and avoid branches.
>>>>
>>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>>
>> Thanks!
>>
>>>>    /*
>>>> @@ -29,16 +33,26 @@
>>>>
>>>>    #ifdef CONFIG_EARLY_PRINTK
>>>>    /*
>>>> - * Macro to print a string to the UART, if there is one.
>>>> + * Macros to print a string to the UART, if there is one.
>>>> + *
>>>> + * There are multiple flavors:
>>>> + *  - PRINT_SECT(section, string): The @string will be located in @section
>>>> + *  - PRINT(): The string will be located in .rodata.str.
>>>> + *  - PRINT_ID(): When Xen is running on the Identity Mapping, it is
>>>> + *    only possible to have a limited amount of Xen. This will create
>>>> + *    the string in .rodata.idmap which will always be mapped.
>>>>     *
>>>>     * Clobbers r0 - r3
>>>>     */
>>>> -#define PRINT(_s)           \
>>>> -        mov   r3, lr       ;\
>>>> -        adr_l r0, 98f      ;\
>>>> -        bl    asm_puts     ;\
>>>> -        mov   lr, r3       ;\
>>>> -        RODATA_STR(98, _s)
>>>> +#define PRINT_SECT(section, string)         \
>>>> +        mov   r3, lr                       ;\
>>>> +        adr_l r0, 98f                      ;\
>>>> +        bl    asm_puts                     ;\
>>>> +        mov   lr, r3                       ;\
>>>> +        RODATA_SECT(section, 98, string)
>>>> +
>>>> +#define PRINT(string) PRINT_SECT(.rodata.str, string)
>>>> +#define PRINT_ID(string) PRINT_SECT(.rodata.idmap, string)
>>> I know this is just a macro but does it make sense to have something MMU specific in common header?
>>> I don't expect MPU to use it.
>> For cache coloring, I would like secondary boot CPUs to start directly
>> on the colored Xen. This means that any message used before enabling the
>> MMU will need to be part of the .rodata.idmap.
>>
>> I know that 32-bit is not in scope for the cache coloring series. But I
>> would like to keep 32-bit and 64-bit boot logic fairly similar.
>>
>> With that in mind, would you be happy if I keep PRINT_ID() in macros.h?
>> Note that I would be ok to move in mmu/head.S and move back in macros.h
>> later on. I just wanted to avoid code movement :).
> With the above explanation it does not make sense to move it back and forth, so let's keep it as is.

Thanks! If that's change, we will move PRINT_ID() to mmu/head.S

I have committed the patch.

Cheers,

-- 
Julien Grall

