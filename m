Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2C64DCF62
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 21:32:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291748.495418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUwnC-0008QD-A3; Thu, 17 Mar 2022 20:32:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291748.495418; Thu, 17 Mar 2022 20:32:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUwnC-0008NB-6R; Thu, 17 Mar 2022 20:32:18 +0000
Received: by outflank-mailman (input) for mailman id 291748;
 Thu, 17 Mar 2022 20:32:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nUwnA-0008N5-SH
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 20:32:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nUwnA-0002oR-Cd; Thu, 17 Mar 2022 20:32:16 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nUwnA-0003J6-6G; Thu, 17 Mar 2022 20:32:16 +0000
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
	bh=tgOS5ylxJvBwNcddRTleaXLCAw9znbKVmH9nmFiWK0Y=; b=cVeyJO6HuRl1I2WICY2NgjXAyU
	pKVSwqIUdTJoxTWyXBnRGIhn92jbq2WnpC1ZyPadTILysjh+yJflg4hfWt5GpK3lO19cbuImXPMrS
	wZLkDyaV7c6xn2ikzyqj+282DfXwuOYLeIeyd4MSmAVFz0qrsj9ZhbwdU42RXyOTb4Yw=;
Message-ID: <78aaa9be-328b-76e4-42c0-b116ab194bdf@xen.org>
Date: Thu, 17 Mar 2022 20:32:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.2
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 "marco.solieri@minervasys.tech" <marco.solieri@minervasys.tech>,
 "lucmiccio@gmail.com" <lucmiccio@gmail.com>, Julien Grall
 <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220309112048.17377-1-julien@xen.org>
 <20220309112048.17377-2-julien@xen.org>
 <0E4A176E-BE1F-427F-8D4E-1AAEA811964C@arm.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH early-RFC 1/5] xen/arm: Clean-up the memory layout
In-Reply-To: <0E4A176E-BE1F-427F-8D4E-1AAEA811964C@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 17/03/2022 15:23, Bertrand Marquis wrote:
> Hi Julien,

Hi Bertrand,

>> On 9 Mar 2022, at 11:20, Julien Grall <julien@xen.org> wrote:
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> In a follow-up patch, the base address for the common mappings will
>> vary between arm32 and arm64. To avoid any duplication, define
>> every mapping in the common region from the previous one.
>>
>> Take the opportunity to add mising *_SIZE for some mappings.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Changes looks ok to me so:
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> 
> Only one question after.
> 
>>
>> ---
>>
>> After the next patch, the term "common" will sound strange because
>> the base address is different. Any better suggestion?
> 
> MAPPING_VIRT_START ?

For arm32, I am planning to reshuffle the layout so the runtime address 
is always at the end of the layout.

So I think MAPPING_VIRT_START may be as confusing. How about 
SHARED_ARCH_VIRT_MAPPING?

> 
> Or space maybe..

I am not sure I understand this suggestion. Can you clarify?

> 
>> ---
>> xen/arch/arm/include/asm/config.h | 24 +++++++++++++++++-------
>> 1 file changed, 17 insertions(+), 7 deletions(-)
>>
>> diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
>> index aedb586c8d27..5db28a8dbd56 100644
>> --- a/xen/arch/arm/include/asm/config.h
>> +++ b/xen/arch/arm/include/asm/config.h
>> @@ -107,16 +107,26 @@
>>   *  Unused
>>   */
>>
>> -#define XEN_VIRT_START         _AT(vaddr_t,0x00200000)
>> -#define FIXMAP_ADDR(n)        (_AT(vaddr_t,0x00400000) + (n) * PAGE_SIZE)
>> +#define COMMON_VIRT_START       _AT(vaddr_t, 0)
>>
>> -#define BOOT_FDT_VIRT_START    _AT(vaddr_t,0x00600000)
>> -#define BOOT_FDT_SLOT_SIZE     MB(4)
>> -#define BOOT_FDT_VIRT_END      (BOOT_FDT_VIRT_START + BOOT_FDT_SLOT_SIZE)
>> +#define XEN_VIRT_START          (COMMON_VIRT_START + MB(2))
>> +#define XEN_SLOT_SIZE           MB(2)
> 
> I know this is not modified by your patch, but any idea why SLOT is used here ?
> XEN_VIRT_SIZE would sound a bit more logic.

No idea. I can add a patch to rename it.

Cheers,

-- 
Julien Grall

