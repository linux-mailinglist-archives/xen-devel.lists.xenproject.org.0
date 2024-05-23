Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 053F08CD311
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 15:01:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728464.1133396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA83L-0006EU-0Y; Thu, 23 May 2024 13:00:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728464.1133396; Thu, 23 May 2024 13:00:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA83K-0006CT-UH; Thu, 23 May 2024 13:00:14 +0000
Received: by outflank-mailman (input) for mailman id 728464;
 Thu, 23 May 2024 13:00:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sA83J-0006BW-T2
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 13:00:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sA83I-0005yG-SB; Thu, 23 May 2024 13:00:12 +0000
Received: from [15.248.2.28] (helo=[10.24.67.32])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sA83I-0005hV-Iy; Thu, 23 May 2024 13:00:12 +0000
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
	bh=FnTUlkQqTxBxJc0M0YOmtLiam2iKBFMGtmRiJTAL9Ls=; b=REy2P/ulyVRf8+8ybC0rRMv/cw
	LPVlGO9eu0aT+oCbsAjLg6H0NKPGobSkYHRPFE2Q5dJFJMfL+G+02K2mFq0iobIOdp21wQsumO6Nb
	xNe1VsfsIghnL7Y+k+dZubcO94LsOvKj78/5omi9uXp+xQSD70xcNOGormY1X12k2kEY=;
Message-ID: <1554d534-7998-4ad4-9218-579b2568b744@xen.org>
Date: Thu, 23 May 2024 14:00:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 02/14] xen: introduce generic non-atomic test_*bit()
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <cover.1715952103.git.oleksii.kurochko@gmail.com>
 <219df9d840a183fc55de02aff011c0972a68587c.1715952103.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <219df9d840a183fc55de02aff011c0972a68587c.1715952103.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 17/05/2024 14:54, Oleksii Kurochko wrote:
> diff --git a/xen/arch/arm/arm64/livepatch.c b/xen/arch/arm/arm64/livepatch.c
> index df2cebedde..4bc8ed9be5 100644
> --- a/xen/arch/arm/arm64/livepatch.c
> +++ b/xen/arch/arm/arm64/livepatch.c
> @@ -10,7 +10,6 @@
>   #include <xen/mm.h>
>   #include <xen/vmap.h>
>   
> -#include <asm/bitops.h>

It is a bit unclear how this change is related to the patch. Can you 
explain in the commit message?

>   #include <asm/byteorder.h>
>   #include <asm/insn.h>
>   #include <asm/livepatch.h>
> diff --git a/xen/arch/arm/include/asm/bitops.h b/xen/arch/arm/include/asm/bitops.h
> index 5104334e48..8e16335e76 100644
> --- a/xen/arch/arm/include/asm/bitops.h
> +++ b/xen/arch/arm/include/asm/bitops.h
> @@ -22,9 +22,6 @@
>   #define __set_bit(n,p)            set_bit(n,p)
>   #define __clear_bit(n,p)          clear_bit(n,p)
>   
> -#define BITOP_BITS_PER_WORD     32
> -#define BITOP_MASK(nr)          (1UL << ((nr) % BITOP_BITS_PER_WORD))
> -#define BITOP_WORD(nr)          ((nr) / BITOP_BITS_PER_WORD)
>   #define BITS_PER_BYTE           8

OOI, any reason BITS_PER_BYTE has not been moved as well? I don't expect 
the value to change across arch.

[...]

> diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
> index f14ad0d33a..6eeeff0117 100644
> --- a/xen/include/xen/bitops.h
> +++ b/xen/include/xen/bitops.h
> @@ -65,10 +65,141 @@ static inline int generic_flsl(unsigned long x)
>    * scope
>    */
>   
> +#define BITOP_BITS_PER_WORD 32
> +typedef uint32_t bitop_uint_t;
> +
> +#define BITOP_MASK(nr)  ((bitop_uint_t)1 << ((nr) % BITOP_BITS_PER_WORD))
> +
> +#define BITOP_WORD(nr)  ((nr) / BITOP_BITS_PER_WORD)
> +
> +extern void __bitop_bad_size(void);
> +
> +#define bitop_bad_size(addr) (sizeof(*(addr)) < sizeof(bitop_uint_t))
> +
>   /* --------------------- Please tidy above here --------------------- */
>   
>   #include <asm/bitops.h>
>   
> +/**
> + * generic__test_and_set_bit - Set a bit and return its old value
> + * @nr: Bit to set
> + * @addr: Address to count from
> + *
> + * This operation is non-atomic and can be reordered.
> + * If two examples of this operation race, one can appear to succeed
> + * but actually fail.  You must protect multiple accesses with a lock.
> + */

Sorry for only mentioning this on v10. I think this comment should be 
duplicated (or moved to) on top of test_bit() because this is what 
everyone will use. This will avoid the developper to follow the function 
calls and only notice the x86 version which says "This function is 
atomic and may not be reordered." and would be wrong for all the other arch.

> +static always_inline bool
> +generic__test_and_set_bit(int nr, volatile void *addr)
> +{
> +    bitop_uint_t mask = BITOP_MASK(nr);
> +    volatile bitop_uint_t *p = (volatile bitop_uint_t *)addr + BITOP_WORD(nr);
> +    bitop_uint_t old = *p;
> +
> +    *p = old | mask;
> +    return (old & mask);
> +}
> +
> +/**
> + * generic__test_and_clear_bit - Clear a bit and return its old value
> + * @nr: Bit to clear
> + * @addr: Address to count from
> + *
> + * This operation is non-atomic and can be reordered.
> + * If two examples of this operation race, one can appear to succeed
> + * but actually fail.  You must protect multiple accesses with a lock.
> + */

Same applies here and ...

> +static always_inline bool
> +generic__test_and_clear_bit(int nr, volatile void *addr)
> +{
> +    bitop_uint_t mask = BITOP_MASK(nr);
> +    volatile bitop_uint_t *p = (volatile bitop_uint_t *)addr + BITOP_WORD(nr);
> +    bitop_uint_t old = *p;
> +
> +    *p = old & ~mask;
> +    return (old & mask);
> +}
> +
> +/* WARNING: non atomic and it can be reordered! */

... here.

> +static always_inline bool
> +generic__test_and_change_bit(int nr, volatile void *addr)
> +{
> +    bitop_uint_t mask = BITOP_MASK(nr);
> +    volatile bitop_uint_t *p = (volatile bitop_uint_t *)addr + BITOP_WORD(nr);
> +    bitop_uint_t old = *p;
> +
> +    *p = old ^ mask;
> +    return (old & mask);
> +}
> +/**
> + * generic_test_bit - Determine whether a bit is set
> + * @nr: bit number to test
> + * @addr: Address to start counting from
> + */
> +static always_inline bool generic_test_bit(int nr, const volatile void *addr)
> +{
> +    bitop_uint_t mask = BITOP_MASK(nr);
> +    const volatile bitop_uint_t *p =
> +                        (const volatile bitop_uint_t *)addr + BITOP_WORD(nr);
> +
> +    return (*p & mask);
> +}
> +
> +static always_inline bool
> +__test_and_set_bit(int nr, volatile void *addr)
> +{
> +#ifndef arch__test_and_set_bit
> +#define arch__test_and_set_bit generic__test_and_set_bit
> +#endif
> +
> +    return arch__test_and_set_bit(nr, addr);
> +}

NIT: It is a bit too late to change this one. But I have to admit, I 
don't understand the purpose of the static inline when you could have 
simply call...

> +#define __test_and_set_bit(nr, addr) ({             \
> +    if ( bitop_bad_size(addr) ) __bitop_bad_size(); \
> +    __test_and_set_bit(nr, addr);                   \

... __arch__test_and_set_bit here.


The only two reasons I am not providing an ack is the:
  * Explanation for the removal of asm/bitops.h in livepatch.c
  * The placement of the comments

There are not too important for me.

Cheers,

-- 
Julien Grall

