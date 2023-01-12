Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 414D966864E
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 23:04:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476416.738576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pG5g2-0006J1-Cz; Thu, 12 Jan 2023 22:04:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476416.738576; Thu, 12 Jan 2023 22:04:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pG5g2-0006HG-92; Thu, 12 Jan 2023 22:04:02 +0000
Received: by outflank-mailman (input) for mailman id 476416;
 Thu, 12 Jan 2023 22:04:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pG5fz-0006Gr-V4
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 22:04:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pG5fz-0005CO-Eg; Thu, 12 Jan 2023 22:03:59 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pG5fz-00023U-7x; Thu, 12 Jan 2023 22:03:59 +0000
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
	bh=XuCioJJ2tqNj9WXBy6FbHR37qa0/LlKycYs7DN0nRMs=; b=uaBmPeFTamDNWUYJOXCJOXIaDJ
	ZPhUzzYH9X/oDERKm64upgGtRN2mZq39P2YCktEFiB+K+CFWKdI1BBQPACDabzTbqYmQQV5OBpjTM
	l+/Jdax6jMyMrfNwPMG0SmeYQeryp/lrUuN84fLc8QGs3cCRCNGVYy60d5affXUe741A=;
Message-ID: <05007c7e-50ad-829e-21e2-6e26a7b01f96@xen.org>
Date: Thu, 12 Jan 2023 22:03:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 Luca.Fancellu@arm.com, Julien Grall <jgrall@amazon.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221212095523.52683-1-julien@xen.org>
 <20221212095523.52683-16-julien@xen.org>
 <alpine.DEB.2.22.394.2212121734150.3075842@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 15/18] xen/arm64: mm: Introduce helpers to
 prepare/enable/disable the identity mapping
In-Reply-To: <alpine.DEB.2.22.394.2212121734150.3075842@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13/12/2022 01:41, Stefano Stabellini wrote:
>> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
>> index fdbf68aadcaa..e7a80fecec14 100644
>> --- a/xen/arch/arm/include/asm/setup.h
>> +++ b/xen/arch/arm/include/asm/setup.h
>> @@ -168,6 +168,17 @@ int map_range_to_domain(const struct dt_device_node *dev,
>>   
>>   extern const char __ro_after_init_start[], __ro_after_init_end[];
>>   
>> +extern DEFINE_BOOT_PAGE_TABLE(boot_pgtable);
>> +
>> +#ifdef CONFIG_ARM_64
>> +extern DEFINE_BOOT_PAGE_TABLE(boot_first_id);
>> +#endif
>> +extern DEFINE_BOOT_PAGE_TABLE(boot_second_id);
>> +extern DEFINE_BOOT_PAGE_TABLE(boot_third_id);
> 
> This is more a matter of taste but I would either:
> - define extern all BOOT_PAGE_TABLEs here both ARM64 and ARM32 with
>    #ifdefs

A grep of BOOT_PAGE_TABLE shows that they are all defined in setup.h.

> - or define all the ARM64 only BOOT_PAGE_TABLE in arm64/mm.h and all the
>    ARM32 only BOOT_PAGE_TABLE in arm32/mm.h >
> Right now we have a mix, as we have boot_first_id with a #ifdef here
> and we have xen_pgtable in arm64/mm.h
We are talking about two distinct set of page-tables. One is used at 
runtime (i.e. xen_pgtable) and the other are for boot/smp-bring up.

So adding the boot_* in setup.h is correct. As I wrote earlier, setup.h 
would need a split. But this is not something I really want to handle 
here...

> 
> Also we are missing boot_second and boot_third. We might as well be
> consistent and declare them all?

My plan is really to kill boot_second and boot_third. So I don't really 
want to export them right now (even temporarily).

In any case, I don't think such change belongs in this patch (it is 
already complex enough).

>> +/* Find where Xen will be residing at runtime and return an PT entry */
>> +lpae_t pte_of_xenaddr(vaddr_t);
>> +
>>   #endif
>>   /*
>>    * Local variables:
>> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
>> index 0cf7ad4f0e8c..39e0d9e03c9c 100644
>> --- a/xen/arch/arm/mm.c
>> +++ b/xen/arch/arm/mm.c
>> @@ -93,7 +93,7 @@ DEFINE_BOOT_PAGE_TABLE(boot_third);
>>   
>>   #ifdef CONFIG_ARM_64
>>   #define HYP_PT_ROOT_LEVEL 0
>> -static DEFINE_PAGE_TABLE(xen_pgtable);
>> +DEFINE_PAGE_TABLE(xen_pgtable);
>>   static DEFINE_PAGE_TABLE(xen_first);
>>   #define THIS_CPU_PGTABLE xen_pgtable
>>   #else
>> @@ -388,7 +388,7 @@ void flush_page_to_ram(unsigned long mfn, bool sync_icache)
>>           invalidate_icache();
>>   }
>>   
>> -static inline lpae_t pte_of_xenaddr(vaddr_t va)
>> +lpae_t pte_of_xenaddr(vaddr_t va)
>>   {
>>       paddr_t ma = va + phys_offset;
>>   
>> @@ -495,6 +495,8 @@ void __init setup_pagetables(unsigned long boot_phys_offset)
>>   
>>       phys_offset = boot_phys_offset;
>>   
>> +    arch_setup_page_tables();
>> +
>>   #ifdef CONFIG_ARM_64
>>       pte = pte_of_xenaddr((uintptr_t)xen_first);
>>       pte.pt.table = 1;
>> -- 
>> 2.38.1
>>

Cheers,

-- 
Julien Grall

