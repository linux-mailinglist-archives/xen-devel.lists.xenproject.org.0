Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C65587DF0BB
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 11:58:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626849.977500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyVOZ-0000ox-Cn; Thu, 02 Nov 2023 10:57:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626849.977500; Thu, 02 Nov 2023 10:57:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyVOZ-0000lc-7U; Thu, 02 Nov 2023 10:57:51 +0000
Received: by outflank-mailman (input) for mailman id 626849;
 Thu, 02 Nov 2023 10:57:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qyVOX-0000lW-Qq
 for xen-devel@lists.xenproject.org; Thu, 02 Nov 2023 10:57:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qyVOX-00027S-I0; Thu, 02 Nov 2023 10:57:49 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.12.44]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qyVOX-0004Z0-Bt; Thu, 02 Nov 2023 10:57:49 +0000
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
	bh=rNY1Y+KMu/4A2keWOlbEuyFwP8ASD43ilm5i62YfBoc=; b=s+q4E5gi2J2CmKs9tUmVtb23hY
	kNnlM2G+uBt6ymZs0P9FUVTOFYNd4r4+7KoSF5F8ApKt8gvOBrTumSpEtXpffLyDf58K2MsmFnnJl
	E9pd3VF8Ie5+jqWwGb2Q1rhoCgEcxcPvQWQAyTYgnMcs75rHlel8b3cxRd5Q8bnCcFHQ=;
Message-ID: <b0a9d158-4732-4f9f-96f9-4062cc5d0bea@xen.org>
Date: Thu, 2 Nov 2023 10:57:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/arm32: head: Rework how the fixmap and early UART
 mapping are prepared
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com, ayan.kumar.halder@amd.com,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231101233011.83098-1-julien@xen.org>
 <20231101233011.83098-2-julien@xen.org>
 <5936b2cc-f89f-4e7e-82cf-daaee4cf35ce@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5936b2cc-f89f-4e7e-82cf-daaee4cf35ce@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 02/11/2023 09:29, Michal Orzel wrote:
> On 02/11/2023 00:30, Julien Grall wrote:
>>
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
>>      * The table is now linked in create_page_tables() because
>>        the boot page tables needs to be recreated for every CPU.
>>      * The early UART mapping is only added for the boot CPU0 as the
>>        fixmap table is not cleared when secondary CPUs boot.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> ---
>>   xen/arch/arm/arm32/head.S | 48 ++++++++-------------------------------
>>   1 file changed, 9 insertions(+), 39 deletions(-)
>>
>> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
>> index 33b038e7e0ca..fec2433e568f 100644
>> --- a/xen/arch/arm/arm32/head.S
>> +++ b/xen/arch/arm/arm32/head.S
>> @@ -183,12 +183,16 @@ past_zImage:
>>           bl    check_cpu_mode
>>           bl    cpu_init
>>           bl    create_page_tables
>> +        /* Add the UART mapping if requested */
>> +#ifdef CONFIG_EARLY_PRINTK
>> +        mov_w r0, EARLY_UART_VIRTUAL_ADDRESS
>> +        create_mapping_entry xen_fixmap, r0, r11, type=PT_DEV_L3
> When building this patch, I'm getting a "Bad instruction" build error.
> Quick look shows that you are trying to use the macro create_mapping_entry before macro definition.
> Unless, I'm using a different baseline (latest staging) than you, this needs to be fixed.

You are using the correct baseline. I have just ended up fix the build 
in patch #2 by mistake. I will move the change here.

> 
> Apart from that:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Thanks!

Cheers,

-- 
Julien Grall

