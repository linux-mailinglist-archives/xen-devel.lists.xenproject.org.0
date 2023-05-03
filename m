Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 969CE6F5805
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 14:36:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529169.823269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puBi7-0005ZR-61; Wed, 03 May 2023 12:35:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529169.823269; Wed, 03 May 2023 12:35:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puBi7-0005Wb-3E; Wed, 03 May 2023 12:35:55 +0000
Received: by outflank-mailman (input) for mailman id 529169;
 Wed, 03 May 2023 12:35:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1puBi5-0005WV-Cs
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 12:35:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1puBi4-0001y0-Qe; Wed, 03 May 2023 12:35:52 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230] helo=[192.168.7.72])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1puBi4-0002Xj-JJ; Wed, 03 May 2023 12:35:52 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=lpezSXCZbHYzG/uYZGtKRGiZ9sjYSZy6hUjCZRVKOas=; b=k5X+wG9s2ZrxRK6QiNaBjNnZqR
	0e4K0w8pXtIUTlrQDj2eUvb2hdrmrZSqaRBVP7Yih60vkuImU4dv7VxsUb6gYIyZcXHek4WeZ5TmM
	KhbuLtTPCB97mf93HXg2m/qOc06vToxZ1fTA/9x+Zh+FVJOYWrGBOKbK20Nnf3nUHySQ=;
Message-ID: <178f9c0f-2f72-daac-772b-c3c4221bea40@xen.org>
Date: Wed, 3 May 2023 13:35:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [XEN v6 11/12] xen/arm: p2m: Use the pa_range_info table to
 support ARM_32 and ARM_64
Content-Language: en-US
From: Julien Grall <julien@xen.org>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, rahul.singh@arm.com
References: <20230428175543.11902-1-ayan.kumar.halder@amd.com>
 <20230428175543.11902-12-ayan.kumar.halder@amd.com>
 <63fa927e-72f5-1645-97c0-6986f2fdcabe@xen.org>
In-Reply-To: <63fa927e-72f5-1645-97c0-6986f2fdcabe@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 03/05/2023 13:20, Julien Grall wrote:
> Hi,
> 
> On 28/04/2023 18:55, Ayan Kumar Halder wrote:
>> Restructure the code so that one can use pa_range_info[] table for both
>> ARM_32 as well as ARM_64.
>>
>> Also, removed the hardcoding for P2M_ROOT_ORDER and P2M_ROOT_LEVEL as
>> p2m_root_order can be obtained from the pa_range_info[].root_order and
>> p2m_root_level can be obtained from pa_range_info[].sl0.
>>
>> Refer ARM DDI 0406C.d ID040418, B3-1345,
>> "Use of concatenated first-level translation tables
>>
>> ...However, a 40-bit input address range with a translation 
>> granularity of 4KB
>> requires a total of 28 bits of address resolution. Therefore, a stage 2
>> translation that supports a 40-bit input address range requires two 
>> concatenated
>> first-level translation tables,..."
>>
>> Thus, root-order is 1 for 40-bit IPA on ARM_32.
>>
>> Refer ARM DDI 0406C.d ID040418, B3-1348,
>>
>> "Determining the required first lookup level for stage 2 translations
>>
>> For a stage 2 translation, the output address range from the stage 1
>> translations determines the required input address range for the stage 2
>> translation. The permitted values of VTCR.SL0 are:
>>
>> 0b00 Stage 2 translation lookup must start at the second level.
>> 0b01 Stage 2 translation lookup must start at the first level.
>>
>> VTCR.T0SZ must indicate the required input address range. The size of 
>> the input
>> address region is 2^(32-T0SZ) bytes."
>>
>> Thus VTCR.SL0 = 1 (maximum value) and VTCR.T0SZ = -8 when the size of 
>> input
>> address region is 2^40 bytes.
>>
>> Thus, pa_range_info[].t0sz = 1 (VTCR.S) | 8 (VTCR.T0SZ) ie 11000b 
>> which is 24.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>> Changes from -
>>
>> v3 - 1. New patch introduced in v4.
>> 2. Restructure the code such that pa_range_info[] is used both by 
>> ARM_32 as
>> well as ARM_64.
>>
>> v4 - 1. Removed the hardcoded definitions of P2M_ROOT_ORDER and 
>> P2M_ROOT_LEVEL.
>> The reason being root_order will not be always 1 (See the next patch).
>> 2. Updated the commit message to explain t0sz, sl0 and root_order 
>> values for
>> 32-bit IPA on Arm32.
>> 3. Some sanity fixes.
>>
>> v5 - pa_range_info is indexed by system_cpuinfo.mm64.pa_range. ie
>> when PARange is 0, the PA size is 32, 1 -> 36 and so on. So 
>> pa_range_info[] has
>> been updated accordingly.
>> For ARM_32 pa_range_info[0] = 0 and pa_range_info[1] = 0 as we do not 
>> support
>> 32-bit, 36-bit physical address range yet.
>>
>>   xen/arch/arm/include/asm/p2m.h |  8 +-------
>>   xen/arch/arm/p2m.c             | 32 ++++++++++++++++++--------------
>>   2 files changed, 19 insertions(+), 21 deletions(-)
>>
>> diff --git a/xen/arch/arm/include/asm/p2m.h 
>> b/xen/arch/arm/include/asm/p2m.h
>> index f67e9ddc72..4ddd4643d7 100644
>> --- a/xen/arch/arm/include/asm/p2m.h
>> +++ b/xen/arch/arm/include/asm/p2m.h
>> @@ -14,16 +14,10 @@
>>   /* Holds the bit size of IPAs in p2m tables.  */
>>   extern unsigned int p2m_ipa_bits;
>> -#ifdef CONFIG_ARM_64
>>   extern unsigned int p2m_root_order;
>>   extern unsigned int p2m_root_level;
>> -#define P2M_ROOT_ORDER    p2m_root_order
>> +#define P2M_ROOT_ORDER p2m_root_order
> 
> This looks like a spurious change.
> 
>>   #define P2M_ROOT_LEVEL p2m_root_level
>> -#else
>> -/* First level P2M is always 2 consecutive pages */
>> -#define P2M_ROOT_ORDER    1
>> -#define P2M_ROOT_LEVEL 1
>> -#endif
>>   struct domain;
>> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
>> index 418997843d..1fe3cccf46 100644
>> --- a/xen/arch/arm/p2m.c
>> +++ b/xen/arch/arm/p2m.c
>> @@ -19,9 +19,9 @@
>>   #define INVALID_VMID 0 /* VMID 0 is reserved */
>> -#ifdef CONFIG_ARM_64
>>   unsigned int __read_mostly p2m_root_order;
>>   unsigned int __read_mostly p2m_root_level;
>> +#ifdef CONFIG_ARM_64
>>   static unsigned int __read_mostly max_vmid = MAX_VMID_8_BIT;
>>   /* VMID is by default 8 bit width on AArch64 */
>>   #define MAX_VMID       max_vmid
>> @@ -2247,16 +2247,6 @@ void __init setup_virt_paging(void)
>>       /* Setup Stage 2 address translation */
>>       register_t val = 
>> VTCR_RES1|VTCR_SH0_IS|VTCR_ORGN0_WBWA|VTCR_IRGN0_WBWA;
>> -#ifdef CONFIG_ARM_32
>> -    if ( p2m_ipa_bits < 40 )
>> -        panic("P2M: Not able to support %u-bit IPA at the moment\n",
>> -              p2m_ipa_bits);
>> -
>> -    printk("P2M: 40-bit IPA\n");
>> -    p2m_ipa_bits = 40;
>> -    val |= VTCR_T0SZ(0x18); /* 40 bit IPA */
>> -    val |= VTCR_SL0(0x1); /* P2M starts at first level */
>> -#else /* CONFIG_ARM_64 */
>>       static const struct {
>>           unsigned int pabits; /* Physical Address Size */
>>           unsigned int t0sz;   /* Desired T0SZ, minimum in comment */
>> @@ -2265,19 +2255,26 @@ void __init setup_virt_paging(void)
>>       } pa_range_info[] __initconst = {
>>           /* T0SZ minimum and SL0 maximum from ARM DDI 0487H.a Table 
>> D5-6 */
>>           /*      PA size, t0sz(min), root-order, sl0(max) */
>> +        [2] = { 40,      24/*24*/,  1,          1 },
> 
> I don't like the fact that the index are not ordered anymore and...
> 
>> +#ifdef CONFIG_ARM_64
>>           [0] = { 32,      32/*32*/,  0,          1 },
>>           [1] = { 36,      28/*28*/,  0,          1 },
>> -        [2] = { 40,      24/*24*/,  1,          1 },
>>           [3] = { 42,      22/*22*/,  3,          1 },
>>           [4] = { 44,      20/*20*/,  0,          2 },
>>           [5] = { 48,      16/*16*/,  0,          2 },
>>           [6] = { 52,      12/*12*/,  4,          2 },
>>           [7] = { 0 }  /* Invalid */
>> +#else
>> +        [0] = { 0 },  /* Invalid */
>> +        [1] = { 0 },  /* Invalid */
>> +        [3] = { 0 }  /* Invalid */
>> +#endif
> 
> ... it is not clear to me why we are adding 3 extra entries. I think it 
> would be better if we do:
> 
> #ifdef CONFIG_ARM_64
>     [0] ...
>     [1] ...
> #endif
>     [2] ...
> #ifdef CONFIG_ARM_64
>     [3] ...
>     [4] ...
>     ...
> #endif

Looking at the next patch. An alternative would be to go back 
duplicating the lines. So after the two patches we would have

#ifdef CONFIG_ARM_64
     [0] ...
     [7] ...
#else
     { /* 32-bit */ }
     { /* 40-bit */ }
#endif

I didn't add '[X] = ' because the index is not necessary for 32-bit.

Cheers,

-- 
Julien Grall

