Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C403D9F195F
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2024 23:50:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857235.1269630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tMETY-00053u-E3; Fri, 13 Dec 2024 22:49:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857235.1269630; Fri, 13 Dec 2024 22:49:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tMETY-00051O-BI; Fri, 13 Dec 2024 22:49:36 +0000
Received: by outflank-mailman (input) for mailman id 857235;
 Fri, 13 Dec 2024 22:49:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tMETX-00051I-SY
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2024 22:49:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tMETW-001SJU-2g;
 Fri, 13 Dec 2024 22:49:35 +0000
Received: from [2a02:8012:3a1:0:544c:e3b3:a616:8824]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tMETW-0032bt-2m;
 Fri, 13 Dec 2024 22:49:34 +0000
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
	bh=J5b/8kbUcBUlf1uNLsu1i4+8JQ0VNiRoMT0NGuW5SzI=; b=o/3RBEenMF7LT20qa9M/SpwROM
	1xBH4Bn/mQaVkmtInMO91nLYYoDe+9S++bry2ocdYeNuuGDZ/mPztpj+ycMsBf6B0AAHrApYodFXn
	uAGZkrnXCZ5YeCWonVxiv9BAXWjOQG8a68BnPYhLToW8r7arOj7lCyxm1fKCxSKdxgHw=;
Message-ID: <a4b5db5f-9082-4830-93e3-abb349adb3de@xen.org>
Date: Fri, 13 Dec 2024 22:49:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ARM: ITS: implement quirks and add support for
 Renesas Gen4 ITS
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1734096752.git.mykyta_poturai@epam.com>
 <2ea26be2689585ea254a9c0177816722bcb2db8d.1734096752.git.mykyta_poturai@epam.com>
 <alpine.DEB.2.22.394.2412131354330.463523@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2412131354330.463523@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13/12/2024 22:06, Stefano Stabellini wrote:
> On Fri, 13 Dec 2024, Mykyta Poturai wrote:
>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>
>> There are number of ITS implementations exist which are different from
>> the base one which have number of functionalities defined as is
>> "IMPLEMENTATION DEFINED", e.g. there may exist differences in cacheability,
>> shareability and memory requirements and others. This requires
>> appropriate handling of such HW requirements which are implemented as
>> ITS quirks: GITS_IIDR (ITS Implementer Identification Register) is used to
>> differentiate the ITS implementations and select appropriate set of
>> quirks if any.
>>
>> As an example of such ITSes add quirk implementation for Renesas Gen4 ITS:
>> - add possibility to override default cacheability and shareability
>> settings used for ITS memory allocations;
>> - add possibility to allocate memory used by ITS with specific memory
>> requirements: introduce _x{z|m}alloc_whole_pages functions and free the
>> memory with xfree as usual.

Do you have any link to any errata documentation?

>>
>> The idea of the quirk implementation is inspired by the Linux kernel ITS
>> quirk implementation [1].
>>
>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
>>
>> [1] https://elixir.bootlin.com/linux/v5.16.1/source/drivers/irqchip/irq-gic-v3-its.c
>> ---
>>   xen/arch/arm/gic-v3-its.c             | 90 ++++++++++++++++++++++++---
>>   xen/arch/arm/gic-v3-lpi.c             | 14 +++--
>>   xen/arch/arm/include/asm/gic_v3_its.h |  8 +++
>>   xen/arch/arm/vgic-v3-its.c            |  8 +--
>>   xen/common/xmalloc_tlsf.c             | 18 +++++-
>>   xen/include/xen/xmalloc.h             |  4 ++
>>   6 files changed, 122 insertions(+), 20 deletions(-)
>>
>> diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
>> index 5fd83af25a..b1a2cdccc5 100644
>> --- a/xen/arch/arm/gic-v3-its.c
>> +++ b/xen/arch/arm/gic-v3-its.c
>> @@ -50,6 +50,77 @@ struct its_device {
>>       struct pending_irq *pend_irqs;      /* One struct per event */
>>   };
>>   
>> +/*
>> + * It is unlikely that a platform implements ITSes with different quirks,
>> + * so assume they all share the same.
>> + */
>> +struct its_quirk {
>> +    const char *desc;
>> +    bool (*init)(struct host_its *hw_its);
>> +    uint32_t iidr;
>> +    uint32_t mask;
>> +};
>> +
>> +uint32_t its_quirk_flags;

Is this mean to be modified after boot? If not, then can we use 
__ro_after_init?

>> diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/include/asm/gic_v3_its.h
>> index c24d4752d0..0737e67aa6 100644
>> --- a/xen/arch/arm/include/asm/gic_v3_its.h
>> +++ b/xen/arch/arm/include/asm/gic_v3_its.h
>> @@ -110,6 +110,9 @@
>>   #define HOST_ITS_FLUSH_CMD_QUEUE        (1U << 0)
>>   #define HOST_ITS_USES_PTA               (1U << 1)
>>   
>> +#define HOST_ITS_WORKAROUND_NC_NS       (1U << 0)
>> +#define HOST_ITS_WORKAROUND_32BIT_ADDR  (1U << 1)
>> +
>>   /* We allocate LPIs on the hosts in chunks of 32 to reduce handling overhead. */
>>   #define LPI_BLOCK                       32U
>>   
>> @@ -197,6 +200,11 @@ struct pending_irq *gicv3_assign_guest_event(struct domain *d,
>>   void gicv3_lpi_update_host_entry(uint32_t host_lpi, int domain_id,
>>                                    uint32_t virt_lpi);
>>   
>> +/* ITS quirks handling. */
>> +uint64_t gicv3_its_get_cacheability(void);
>> +uint64_t gicv3_its_get_shareability(void);
>> +unsigned int gicv3_its_get_memflags(void);
>> +
>>   #else
>>   
>>   #ifdef CONFIG_ACPI
>> diff --git a/xen/arch/arm/vgic-v3-its.c b/xen/arch/arm/vgic-v3-its.c
>> index c65c1dbf52..f5deb18497 100644
>> --- a/xen/arch/arm/vgic-v3-its.c
>> +++ b/xen/arch/arm/vgic-v3-its.c
>> @@ -1191,7 +1191,7 @@ static void sanitize_its_base_reg(uint64_t *reg)
>>       {
>>       case GIC_BASER_OuterShareable:
>>           r &= ~GITS_BASER_SHAREABILITY_MASK;
>> -        r |= GIC_BASER_InnerShareable << GITS_BASER_SHAREABILITY_SHIFT;
>> +        r |= gicv3_its_get_shareability() << GITS_BASER_SHAREABILITY_SHIFT;
>>           break;
>>       default:
>>           break;
>> @@ -1203,7 +1203,7 @@ static void sanitize_its_base_reg(uint64_t *reg)
>>       case GIC_BASER_CACHE_nCnB:
>>       case GIC_BASER_CACHE_nC:
>>           r &= ~GITS_BASER_INNER_CACHEABILITY_MASK;
>> -        r |= GIC_BASER_CACHE_RaWb << GITS_BASER_INNER_CACHEABILITY_SHIFT;
>> +        r |= gicv3_its_get_cacheability() << GITS_BASER_INNER_CACHEABILITY_SHIFT;
> 
> gicv3_its_get_cacheability returns GIC_BASER_CACHE_RaWaWb, because that
> is the value that was previously present in all the other cases. In this
> case, however, we end up replacing GIC_BASER_CACHE_RaWb with
> GIC_BASER_CACHE_RaWaWb. Is that OK?

Actually I don't understand why we need to modify the vGIC code. We 
never pass memory from the domain to the physical ITS, so the erratum 
should not apply.
> 
>>           break;
>>       default:
>>           break;
>> @@ -1455,9 +1455,9 @@ static int vgic_v3_its_init_virtual(struct domain *d, paddr_t guest_addr,
>>       if ( !its )
>>           return -ENOMEM;
>>   
>> -    base_attr  = GIC_BASER_InnerShareable << GITS_BASER_SHAREABILITY_SHIFT;
>> +    base_attr  = gicv3_its_get_shareability() << GITS_BASER_SHAREABILITY_SHIFT;
>>       base_attr |= GIC_BASER_CACHE_SameAsInner << GITS_BASER_OUTER_CACHEABILITY_SHIFT;
>> -    base_attr |= GIC_BASER_CACHE_RaWaWb << GITS_BASER_INNER_CACHEABILITY_SHIFT;
>> +    base_attr |= gicv3_its_get_cacheability() << GITS_BASER_INNER_CACHEABILITY_SHIFT;
>>   
>>       its->cbaser  = base_attr;
>>       base_attr |= 0ULL << GITS_BASER_PAGE_SIZE_SHIFT;    /* 4K pages */

[...]

-- 
Julien Grall


