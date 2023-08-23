Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1754785EC3
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 19:37:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589465.921388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYrmH-0002Ay-4C; Wed, 23 Aug 2023 17:36:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589465.921388; Wed, 23 Aug 2023 17:36:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYrmH-00028q-0G; Wed, 23 Aug 2023 17:36:21 +0000
Received: by outflank-mailman (input) for mailman id 589465;
 Wed, 23 Aug 2023 17:36:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z2Dg=EI=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qYrmG-00028k-3w
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 17:36:20 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9038a6fe-41db-11ee-8783-cb3800f73035;
 Wed, 23 Aug 2023 19:36:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 012EC82869D9;
 Wed, 23 Aug 2023 12:36:16 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 31x5xL5EwFj1; Wed, 23 Aug 2023 12:36:14 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 571F482869E2;
 Wed, 23 Aug 2023 12:36:14 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id tWfMebrKupXJ; Wed, 23 Aug 2023 12:36:14 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id D04EB82869D9;
 Wed, 23 Aug 2023 12:36:13 -0500 (CDT)
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
X-Inumbo-ID: 9038a6fe-41db-11ee-8783-cb3800f73035
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 571F482869E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1692812174; bh=i3syzsKEFu67pmlqq9/3CIsmCHz41JeKp7q060O4770=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=fHsCZf35cr7HKEqh/INi9bVAQ3kVRT2C/wUwexF1V73AdUozfd6aAFmV9/kILaWMm
	 GAJkPEF0YLswLj6J8FzI3aI+O5EKO1x9BxgwYVogFfSGChnYJ/QNeUpVTPRtEBhMD5
	 v1oD6PQ5K3x2xRdiYNaTd8po1iHONotdz2U0Ml7o=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <8a9c0fba-132b-1245-caf7-d4a3a670e9d9@raptorengineering.com>
Date: Wed, 23 Aug 2023 12:36:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v4 3/3] xen/ppc: Implement initial Radix MMU support
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1692744718.git.sanastasio@raptorengineering.com>
 <7cebc2962002c36ecfe712bf1bcb251e083910b8.1692744718.git.sanastasio@raptorengineering.com>
 <e942f853-3536-2033-f214-1beccdfc8240@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <e942f853-3536-2033-f214-1beccdfc8240@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/23/23 9:04 AM, Jan Beulich wrote:
> On 23.08.2023 01:03, Shawn Anastasio wrote:
>> Add code to construct early identity-mapped page tables as well as the
>> required process and partition tables to enable the MMU.
>>
>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> with two nits, which I'll be happy to take care of while committing,
> so long as you agree:
> 
>> --- /dev/null
>> +++ b/xen/arch/ppc/include/asm/page.h
>> @@ -0,0 +1,180 @@
>> +#ifndef _ASM_PPC_PAGE_H
>> +#define _ASM_PPC_PAGE_H
>> +
>> +#include <xen/types.h>
>> +
>> +#include <asm/bitops.h>
>> +#include <asm/byteorder.h>
>> +
>> +#define PDE_VALID     PPC_BIT(0)
>> +#define PDE_NLB_MASK  0x1ffffffffffffe0UL
>> +#define PDE_NLS_MASK  0x1f
>> +
>> +#define PTE_VALID     PPC_BIT(0)
>> +#define PTE_LEAF      PPC_BIT(1)
>> +#define PTE_REFERENCE PPC_BIT(55)
>> +#define PTE_CHANGE    PPC_BIT(56)
>> +
>> +/* PTE Attributes */
>> +#define PTE_ATT_SAO            PPC_BIT(59) /* Strong Access Ordering */
>> +#define PTE_ATT_NON_IDEMPOTENT PPC_BIT(58)
>> +#define PTE_ATT_TOLERANT       (PPC_BIT(58) | PPC_BIT(59))
>> +
>> +/* PTE Encoded Access Authority*/
>> +#define PTE_EAA_PRIVILEGED PPC_BIT(60)
>> +#define PTE_EAA_READ       PPC_BIT(61)
>> +#define PTE_EAA_WRITE      PPC_BIT(62)
>> +#define PTE_EAA_EXECUTE    PPC_BIT(63)
>> +
>> +/* Field shifts/masks */
>> +#define PTE_RPN_MASK  0x1fffffffffff000UL
>> +#define PTE_ATT_MASK  0x30UL
>> +#define PTE_EAA_MASK  0xfUL
>> +
>> +#define PTE_XEN_BASE (PTE_VALID | PTE_EAA_PRIVILEGED | PTE_REFERENCE)
>> +#define PTE_XEN_RW   (PTE_XEN_BASE | PTE_EAA_READ | PTE_EAA_WRITE | PTE_CHANGE)
>> +#define PTE_XEN_RO   (PTE_XEN_BASE | PTE_EAA_READ)
>> +#define PTE_XEN_RX   (PTE_XEN_BASE | PTE_EAA_READ | PTE_EAA_EXECUTE)
>> +
>> +/*
>> + * Radix Tree layout for 64KB pages:
>> + *
>> + * [ L1 (ROOT) PAGE DIRECTORY (8192 * sizeof(pde_t)) ]
>> + *                     |
>> + *                     |
>> + *                     v
>> + *    [ L2 PAGE DIRECTORY (512 * sizeof(pde_t)) ]
>> + *                     |
>> + *                     |
>> + *                     v
>> + *    [ L3 PAGE DIRECTORY (512 * sizeof(pde_t)) ]
>> + *                     |
>> + *                     |
>> + *                     v
>> + *      [ L4 PAGE TABLE (32 * sizeof(pte_t)) ]
>> + *                     |
>> + *                     |
>> + *                     v
>> + *            [ PAGE TABLE ENTRY ]
>> + */
>> +
>> +#define XEN_PT_ENTRIES_LOG2_LVL_1 13 /* 2**13 entries, maps 2**13 * 512GB = 4PB */
>> +#define XEN_PT_ENTRIES_LOG2_LVL_2 9  /* 2**9  entries, maps 2**9  * 1GB = 512GB */
>> +#define XEN_PT_ENTRIES_LOG2_LVL_3 9  /* 2**9  entries, maps 2**9  * 1GB = 512GB */
>> +#define XEN_PT_ENTRIES_LOG2_LVL_4 5  /* 2**5  entries, maps 2**5  * 64K = 2MB */
>> +
>> +#define XEN_PT_SHIFT_LVL_1    (XEN_PT_SHIFT_LVL_2 + XEN_PT_ENTRIES_LOG2_LVL_2)
>> +#define XEN_PT_SHIFT_LVL_2    (XEN_PT_SHIFT_LVL_3 + XEN_PT_ENTRIES_LOG2_LVL_3)
>> +#define XEN_PT_SHIFT_LVL_3    (XEN_PT_SHIFT_LVL_4 + XEN_PT_ENTRIES_LOG2_LVL_4)
>> +#define XEN_PT_SHIFT_LVL_4    PAGE_SHIFT
>> +
>> +#define XEN_PT_ENTRIES_LOG2_LVL(lvl) (XEN_PT_ENTRIES_LOG2_LVL_##lvl)
>> +#define XEN_PT_SHIFT_LVL(lvl)        (XEN_PT_SHIFT_LVL_##lvl)
>> +#define XEN_PT_ENTRIES_LVL(lvl)      (1UL << XEN_PT_ENTRIES_LOG2_LVL(lvl))
>> +#define XEN_PT_SIZE_LVL(lvl)         (sizeof(uint64_t) * XEN_PT_ENTRIES_LVL(lvl))
>> +#define XEN_PT_MASK_LVL(lvl)         (XEN_PT_ENTRIES_LVL(lvl) - 1)
>> +#define XEN_PT_INDEX_LVL(lvl, va)    (((va) >> XEN_PT_SHIFT_LVL(lvl)) & XEN_PT_MASK_LVL(lvl))
>> +
>> +/*
>> + * Calculate the index of the provided virtual address in the provided
>> + * page table struct
>> + */
>> +#define pt_index(pt, va) _Generic((pt), \
>> +    struct lvl1_pd * : XEN_PT_INDEX_LVL(1, (va)), \
>> +    struct lvl2_pd * : XEN_PT_INDEX_LVL(2, (va)), \
>> +    struct lvl3_pd * : XEN_PT_INDEX_LVL(3, (va)), \
>> +    struct lvl4_pt * : XEN_PT_INDEX_LVL(4, (va)))
>> +
>> +#define pt_entry(pt, va) (&((pt)->entries[pt_index((pt), (va))]))
>> +
>> +typedef struct
>> +{
>> +    __be64 pde;
>> +} pde_t;
>> +
>> +typedef struct
>> +{
>> +    __be64 pte;
>> +} pte_t;
>> +
>> +struct lvl1_pd
>> +{
>> +    pde_t entries[XEN_PT_ENTRIES_LVL(1)];
>> +} __aligned(XEN_PT_SIZE_LVL(1));
>> +
>> +struct lvl2_pd
>> +{
>> +    pde_t entries[XEN_PT_ENTRIES_LVL(2)];
>> +} __aligned(XEN_PT_SIZE_LVL(2));
>> +
>> +struct lvl3_pd
>> +{
>> +    pde_t entries[XEN_PT_ENTRIES_LVL(3)];
>> +} __aligned(XEN_PT_SIZE_LVL(3));
>> +
>> +struct lvl4_pt
>> +{
>> +    pte_t entries[XEN_PT_ENTRIES_LVL(4)];
>> +} __aligned(XEN_PT_SIZE_LVL(4));
>> +
>> +static inline pte_t paddr_to_pte(paddr_t paddr, unsigned long flags)
>> +{
>> +    paddr_t paddr_aligned = paddr & PTE_RPN_MASK;
>> +
>> +    return (pte_t){ .pte = cpu_to_be64(paddr_aligned | flags | PTE_LEAF) };
>> +}
>> +
>> +static inline pde_t paddr_to_pde(paddr_t paddr, unsigned long flags, unsigned long nls)
> 
> Nit: Overlong line.
>

My bad -- feel free to fix this.

>> --- a/xen/arch/ppc/include/asm/processor.h
>> +++ b/xen/arch/ppc/include/asm/processor.h
>> @@ -133,6 +133,40 @@ struct cpu_user_regs
>>      uint32_t entry_vector;
>>  };
>>
>> +static __inline__ void sync(void)
>> +{
>> +    asm volatile ( "sync" );
>> +}
>> +
>> +static __inline__ void isync(void)
>> +{
>> +    asm volatile ( "isync" );
>> +}
> 
> Why __inline__, not inline, ...
> 
>> +static inline unsigned long mfmsr(void)
> 
> ... as you have here any below?
>

This was an oversight -- the sync/isync routines were copied from the
old Xen port. Feel free to change it to inline.

> Jan

Thanks,
Shawn

