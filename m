Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D2C8315A6
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jan 2024 10:22:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668653.1041002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQObm-0007gQ-Ku; Thu, 18 Jan 2024 09:22:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668653.1041002; Thu, 18 Jan 2024 09:22:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQObm-0007er-HV; Thu, 18 Jan 2024 09:22:46 +0000
Received: by outflank-mailman (input) for mailman id 668653;
 Thu, 18 Jan 2024 09:22:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rQObl-0007eg-5r
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2024 09:22:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rQObk-0001Ac-Nz; Thu, 18 Jan 2024 09:22:44 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rQObk-0006Vb-GY; Thu, 18 Jan 2024 09:22:44 +0000
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
	bh=9O59O8rlJG5UDUVfAWUvXXBN6TRsXQMGYCiCUJtBND0=; b=aRmXHBdWYF4asn8CRK8YFeNlVo
	bFsnGAjh3xH3tBFWDK66lk4sOanVeoJZn8VTBCz6+3Xd0xIbyGZU8mRghOOCLEZpxhzg6ZWQJFi42
	XzboeXHCNC7UKaepskLn9DoEOXfCDbHtsRwqCEVxebPLR8efKp9DvRwij46qG09Kub1c=;
Message-ID: <1a49b6e0-c399-4d34-bedf-92c14261a141@xen.org>
Date: Thu, 18 Jan 2024 09:22:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 repost 2/4] arm/smpboot: Move smp_up_cpu to a new
 section .data.idmap
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: carlo.nonato@minervasys.tech, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240116143709.86584-1-julien@xen.org>
 <20240116143709.86584-3-julien@xen.org>
 <c603bf7d-e38c-4ee9-87a6-cd3c75c59fad@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c603bf7d-e38c-4ee9-87a6-cd3c75c59fad@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 17/01/2024 08:44, Michal Orzel wrote:
> Hi Julien,

Hi Michal,

> 
> On 16/01/2024 15:37, Julien Grall wrote:
>>
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> With the upcoming work to color Xen, the binary will not be anymore
>> physically contiguous. This will be a problem during boot as the
>> assembly code will need to work out where each piece of Xen reside.
>>
>> An easy way to solve the issue is to have all code/data accessed
>> by the secondary CPUs while the MMU is off within a single page.
>>
>> Right now, smp_up_cpu is used by secondary CPUs to wait there turn for
> s/there/their ?

Yes. I will fix it on commit.

> 
>> booting before the MMU is on. Yet it is currently in .data which is
>> unlikely to be within the same page as the rest of the idmap.
>>
>> Move smp_up_cpu to the recently create section .data.idmap. The idmap is
> s/create/created
> 
>> currently part of the text section and therefore will be mapped read-onl
> s/onl/only
> 
>> executable. This means that we need to temporarily remap
>> smp_up_cpu in order to update it.
>>
>> Introduce a new function set_smp_up_cpu() for this purpose so the code
>> is not duplicated between when opening and closing the gate.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> 
>> ---
>>   xen/arch/arm/smpboot.c | 36 +++++++++++++++++++++++++++++++-----
>>   1 file changed, 31 insertions(+), 5 deletions(-)
>>
>> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
>> index 7110bc11fc05..8d508a1bb258 100644
>> --- a/xen/arch/arm/smpboot.c
>> +++ b/xen/arch/arm/smpboot.c
>> @@ -29,6 +29,10 @@
>>   #include <asm/psci.h>
>>   #include <asm/acpi.h>
>>
>> +/* Override macros from asm/page.h to make them work with mfn_t */
>> +#undef virt_to_mfn
>> +#define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
>> +
>>   cpumask_t cpu_online_map;
>>   cpumask_t cpu_present_map;
>>   cpumask_t cpu_possible_map;
>> @@ -56,7 +60,7 @@ struct init_info init_data =
>>   };
>>
>>   /* Shared state for coordinating CPU bringup */
>> -unsigned long smp_up_cpu = MPIDR_INVALID;
>> +unsigned long __section(".data.idmap") smp_up_cpu = MPIDR_INVALID;
>>   /* Shared state for coordinating CPU teardown */
>>   static bool cpu_is_dead;
>>
>> @@ -429,6 +433,28 @@ void stop_cpu(void)
>>           wfi();
>>   }
>>
>> +static void set_smp_up_cpu(unsigned long mpidr)
>> +{
>> +    /*
>> +     * smp_up_cpu is part of the identity mapping which is read-only. So
>> +     * We need to re-map the region so it can be updated.
>> +     */
>> +    void *ptr = map_domain_page(virt_to_mfn(&smp_up_cpu));
>> +
>> +    ptr += PAGE_OFFSET(&smp_up_cpu);
>> +
>> +    *(unsigned long *)ptr = mpidr;
>> +
>> +    /*
>> +     * init_ttbr will be accessed with the MMU off, so ensure the update
> smp_up_cpu instead of init_ttbr

Doh. I just copied/pasted the code from init_ttbr. I will update it.

BTW, I thought about trying to consolidate the code between 
set_init_ttbr() and set_smp_up_cpu() but it didn't seem to be worth it.

Cheers,

-- 
Julien Grall

