Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A81037BFE9
	for <lists+xen-devel@lfdr.de>; Wed, 12 May 2021 16:26:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126252.237642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgpoc-00069Q-84; Wed, 12 May 2021 14:26:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126252.237642; Wed, 12 May 2021 14:26:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgpoc-00066a-4i; Wed, 12 May 2021 14:26:22 +0000
Received: by outflank-mailman (input) for mailman id 126252;
 Wed, 12 May 2021 14:26:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lgpoa-00066U-8K
 for xen-devel@lists.xenproject.org; Wed, 12 May 2021 14:26:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lgpoY-0004Ol-Is; Wed, 12 May 2021 14:26:18 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lgpoY-0006nn-C3; Wed, 12 May 2021 14:26:18 +0000
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
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=EWolIiDZsYMmzk/mpfOsJwMTylTgulIFa9VcefDcyNY=; b=OCvzKkJO9n0VgvOdag8qQqVmg9
	cEEe2KtoDF5cET5e216qzGvyacm9DDawrYF3jo/vjmmgJq1Q0cVwp5HonyXXWUMMloQ7Qgxi49Zra
	tj7ca9gEhOQvNGaf7wHYbWA+7tcUGufX0CrUqTUiD4lcrtemAwguww/VXJ4iM6bueHio=;
Subject: Re: [PATCH RFCv2 02/15] xen/arm: lpae: Use the generic helpers to
 defined the Xen PT helpers
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Wei.Chen@arm.com, Henry.Wang@arm.com,
 Penny.Zheng@arm.com, Bertrand.Marquis@arm.com,
 Julien Grall <jgrall@amazon.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20210425201318.15447-1-julien@xen.org>
 <20210425201318.15447-3-julien@xen.org>
 <alpine.DEB.2.21.2105111515470.5018@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <94e364a7-de40-93ab-6cde-a2f493540439@xen.org>
Date: Wed, 12 May 2021 15:26:15 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2105111515470.5018@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 11/05/2021 23:26, Stefano Stabellini wrote:
> On Sun, 25 Apr 2021, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Currently, Xen PT helpers are only working with 4KB page granularity
>> and open-code the generic helpers. To allow more flexibility, we can
>> re-use the generic helpers and pass Xen's page granularity
>> (PAGE_SHIFT).
>>
>> As Xen PT helpers are used in both C and assembly, we need to move
>> the generic helpers definition outside of the !__ASSEMBLY__ section.
>>
>> Note the aliases for each level are still kept for the time being so we
>> can avoid a massive patch to change all the callers.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> The patch is OK as is. I have a couple of suggestions for improvement
> below. If you feel like making them, good, otherwise I am also OK if you
> don't want to change anything.
> 
> 
>> ---
>>      Changes in v2:
>>          - New patch
>> ---
>>   xen/include/asm-arm/lpae.h | 71 +++++++++++++++++++++-----------------
>>   1 file changed, 40 insertions(+), 31 deletions(-)
>>
>> diff --git a/xen/include/asm-arm/lpae.h b/xen/include/asm-arm/lpae.h
>> index 4fb9a40a4ca9..310f5225e056 100644
>> --- a/xen/include/asm-arm/lpae.h
>> +++ b/xen/include/asm-arm/lpae.h
>> @@ -159,6 +159,17 @@ static inline bool lpae_is_superpage(lpae_t pte, unsigned int level)
>>   #define lpae_get_mfn(pte)    (_mfn((pte).walk.base))
>>   #define lpae_set_mfn(pte, mfn)  ((pte).walk.base = mfn_x(mfn))
>>   
>> +/* Generate an array @var containing the offset for each level from @addr */
>> +#define DECLARE_OFFSETS(var, addr)          \
>> +    const unsigned int var[4] = {           \
>> +        zeroeth_table_offset(addr),         \
>> +        first_table_offset(addr),           \
>> +        second_table_offset(addr),          \
>> +        third_table_offset(addr)            \
>> +    }
>> +
>> +#endif /* __ASSEMBLY__ */
>> +
>>   /*
>>    * AArch64 supports pages with different sizes (4K, 16K, and 64K).
>>    * Provide a set of generic helpers that will compute various
>> @@ -190,17 +201,6 @@ static inline bool lpae_is_superpage(lpae_t pte, unsigned int level)
>>   #define LPAE_TABLE_INDEX_GS(gs, lvl, addr)   \
>>       (((addr) >> LEVEL_SHIFT_GS(gs, lvl)) & LPAE_ENTRY_MASK_GS(gs))
>>   
>> -/* Generate an array @var containing the offset for each level from @addr */
>> -#define DECLARE_OFFSETS(var, addr)          \
>> -    const unsigned int var[4] = {           \
>> -        zeroeth_table_offset(addr),         \
>> -        first_table_offset(addr),           \
>> -        second_table_offset(addr),          \
>> -        third_table_offset(addr)            \
>> -    }
>> -
>> -#endif /* __ASSEMBLY__ */
>> -
>>   /*
>>    * These numbers add up to a 48-bit input address space.
>>    *
>> @@ -211,26 +211,35 @@ static inline bool lpae_is_superpage(lpae_t pte, unsigned int level)
>>    * therefore 39-bits are sufficient.
>>    */
>>   
>> -#define LPAE_SHIFT      9
>> -#define LPAE_ENTRIES    (_AC(1,U) << LPAE_SHIFT)
>> -#define LPAE_ENTRY_MASK (LPAE_ENTRIES - 1)
>> -
>> -#define THIRD_SHIFT    (PAGE_SHIFT)
>> -#define THIRD_ORDER    (THIRD_SHIFT - PAGE_SHIFT)
>> -#define THIRD_SIZE     (_AT(paddr_t, 1) << THIRD_SHIFT)
>> -#define THIRD_MASK     (~(THIRD_SIZE - 1))
>> -#define SECOND_SHIFT   (THIRD_SHIFT + LPAE_SHIFT)
>> -#define SECOND_ORDER   (SECOND_SHIFT - PAGE_SHIFT)
>> -#define SECOND_SIZE    (_AT(paddr_t, 1) << SECOND_SHIFT)
>> -#define SECOND_MASK    (~(SECOND_SIZE - 1))
>> -#define FIRST_SHIFT    (SECOND_SHIFT + LPAE_SHIFT)
>> -#define FIRST_ORDER    (FIRST_SHIFT - PAGE_SHIFT)
>> -#define FIRST_SIZE     (_AT(paddr_t, 1) << FIRST_SHIFT)
>> -#define FIRST_MASK     (~(FIRST_SIZE - 1))
>> -#define ZEROETH_SHIFT  (FIRST_SHIFT + LPAE_SHIFT)
>> -#define ZEROETH_ORDER  (ZEROETH_SHIFT - PAGE_SHIFT)
>> -#define ZEROETH_SIZE   (_AT(paddr_t, 1) << ZEROETH_SHIFT)
>> -#define ZEROETH_MASK   (~(ZEROETH_SIZE - 1))
> 
> Should we add a one-line in-code comment saying that the definitions
> below are for 4KB pages? It is not immediately obvious any longer.

Because they are not meant to be for 4KB pages. They are meant to be for 
Xen page size.

Today, it is always 4KB but I would like the Xen code to not rely on that.

I can clarify it in an in-code comment.

>> +#define LPAE_SHIFT          LPAE_SHIFT_GS(PAGE_SHIFT)
>> +#define LPAE_ENTRIES        LPAE_ENTRIES_GS(PAGE_SHIFT)
>> +#define LPAE_ENTRY_MASK     LPAE_ENTRY_MASK_GS(PAGE_SHIFT)
>>
>> +#define LEVEL_SHIFT(lvl)    LEVEL_SHIFT_GS(PAGE_SHIFT, lvl)
>> +#define LEVEL_ORDER(lvl)    LEVEL_ORDER_GS(PAGE_SHIFT, lvl)
>> +#define LEVEL_SIZE(lvl)     LEVEL_SIZE_GS(PAGE_SHIFT, lvl)
>> +#define LEVEL_MASK(lvl)     (~(LEVEL_SIZE(lvl) - 1))
> 
> I would avoid adding these 4 macros. It would be OK if they were just
> used within this file but lpae.h is a header: they could end up be used
> anywhere in the xen/ code and they have a very generic name. My
> suggestion would be to skip them and just do:

Those macros will be used in follow-up patches. They are pretty useful 
to avoid introduce static array with the different information for each 
level.

Would prefix them with XEN_ be better?

> #define THIRD_SHIFT         LEVEL_SHIFT_GS(PAGE_SHIFT, 3)
> 
> etc.
> 
> 
>> +/* Convenience aliases */
>> +#define THIRD_SHIFT         LEVEL_SHIFT(3)
>> +#define THIRD_ORDER         LEVEL_ORDER(3)
>> +#define THIRD_SIZE          LEVEL_SIZE(3)
>> +#define THIRD_MASK          LEVEL_MASK(3)
>> +
>> +#define SECOND_SHIFT        LEVEL_SHIFT(2)
>> +#define SECOND_ORDER        LEVEL_ORDER(2)
>> +#define SECOND_SIZE         LEVEL_SIZE(2)
>> +#define SECOND_MASK         LEVEL_MASK(2)
>> +
>> +#define FIRST_SHIFT         LEVEL_SHIFT(1)
>> +#define FIRST_ORDER         LEVEL_ORDER(1)
>> +#define FIRST_SIZE          LEVEL_SIZE(1)
>> +#define FIRST_MASK          LEVEL_MASK(1)
>> +
>> +#define ZEROETH_SHIFT       LEVEL_SHIFT(0)
>> +#define ZEROETH_ORDER       LEVEL_ORDER(0)
>> +#define ZEROETH_SIZE        LEVEL_SIZE(0)
>> +#define ZEROETH_MASK        LEVEL_MASK(0)
>>   
>>   /* Calculate the offsets into the pagetables for a given VA */
>>   #define zeroeth_linear_offset(va) ((va) >> ZEROETH_SHIFT)
>> -- 
>> 2.17.1
>>

Cheers,

-- 
Julien Grall

