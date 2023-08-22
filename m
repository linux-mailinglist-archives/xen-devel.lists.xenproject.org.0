Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62300784CFB
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 00:48:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588736.920325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYaAF-0005TD-MX; Tue, 22 Aug 2023 22:47:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588736.920325; Tue, 22 Aug 2023 22:47:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYaAF-0005Q1-Ie; Tue, 22 Aug 2023 22:47:55 +0000
Received: by outflank-mailman (input) for mailman id 588736;
 Tue, 22 Aug 2023 22:47:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SWhE=EH=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qYaAE-0005Pv-6Z
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 22:47:54 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec978956-413d-11ee-8782-cb3800f73035;
 Wed, 23 Aug 2023 00:47:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id E08D08284EB8;
 Tue, 22 Aug 2023 17:47:50 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id gwz7t3zSptTL; Tue, 22 Aug 2023 17:47:49 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id B50ED82852D4;
 Tue, 22 Aug 2023 17:47:49 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 321fouMU8AdC; Tue, 22 Aug 2023 17:47:49 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 5592F8284EB8;
 Tue, 22 Aug 2023 17:47:49 -0500 (CDT)
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
X-Inumbo-ID: ec978956-413d-11ee-8782-cb3800f73035
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com B50ED82852D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1692744469; bh=3l3hLjZKSbyFk7NSZfPTtihlIO/zJo0R0cIRozFZlr4=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=Q71gX37w4Ymye8diHo51HM/us9YFmR5w65jOJuxmh8PZII+CvquNXwSuz4dYU27Mh
	 ljgmCPcIMklFC/gUA6TiUijBe9RWxzYkWGJEeNaXcBgVo8arhPNJ/MlNEfmLRImBvD
	 FOysOGj0EQu/75TWzW8ZESgxf6Z03/mp+spzlbU0=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <e2945a92-b12f-1a50-3618-d8eec73cee80@raptorengineering.com>
Date: Tue, 22 Aug 2023 17:47:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 3/3] xen/ppc: Implement initial Radix MMU support
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1691620546.git.sanastasio@raptorengineering.com>
 <6bacc1ca18273654229672e6ba2741da01a92f04.1691620546.git.sanastasio@raptorengineering.com>
 <17a21607-1c41-c073-94bd-6d2cc1eea2b7@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <17a21607-1c41-c073-94bd-6d2cc1eea2b7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/14/23 8:27 AM, Jan Beulich wrote:
> On 10.08.2023 00:48, Shawn Anastasio wrote:
>> --- /dev/null
>> +++ b/xen/arch/ppc/include/asm/page.h
>> @@ -0,0 +1,181 @@
>> +#ifndef _ASM_PPC_PAGE_H
>> +#define _ASM_PPC_PAGE_H
>> +
>> +#include <xen/types.h>
>> +
>> +#include <asm/bitops.h>
>> +#include <asm/byteorder.h>
>> +
>> +#define PDE_VALID     PPC_BIT(0)
>> +#define PDE_NLB_MASK  0xfffffffffffffUL
>> +#define PDE_NLB_SHIFT 5UL
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
>> +#define PTE_RPN_MASK  0x1fffffffffffUL
>> +#define PTE_RPN_SHIFT 12UL
> 
> I still don't understand why you need two constants here. Even more so that
> now all their uses are as (PTE_RPN_MASK << PTE_RPN_SHIFT). With (only)
> 
> #define PTE_RPN_MASK  0x1fffffffffff000UL
> 
> instead, as indicated before, you would then (should the need arise) have
> this usable with MASK_EXTR() / MASK_INSR(). The again you likely know much
> better than me what further uses are going to appear.

Yes, this patch was submitted before I saw your follow-up comment to my
MASK_EXTR/INSR comment, but I agree now that just having a single mask
constant with the shift built-in would be perfectly adequate. I'll make
that change.

> 
>> --- /dev/null
>> +++ b/xen/arch/ppc/include/asm/regs.h
>> @@ -0,0 +1,138 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU General Public License
>> + * along with this program; if not, write to the Free Software
>> + * Foundation, 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
> 
> There's still an SPDX header and a full license here.
>

Will fix.

>> --- /dev/null
>> +++ b/xen/arch/ppc/mm-radix.c
>> @@ -0,0 +1,265 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +#include <xen/init.h>
>> +#include <xen/kernel.h>
>> +#include <xen/types.h>
>> +#include <xen/lib.h>
>> +
>> +#include <asm/bitops.h>
>> +#include <asm/byteorder.h>
>> +#include <asm/early_printk.h>
>> +#include <asm/mm.h>
>> +#include <asm/page.h>
>> +#include <asm/processor.h>
>> +#include <asm/regs.h>
>> +#include <asm/msr.h>
>> +
>> +void enable_mmu(void);
>> +
>> +#define INITIAL_LVL1_PD_COUNT      1
>> +#define INITIAL_LVL2_LVL3_PD_COUNT 2
>> +#define INITIAL_LVL4_PT_COUNT      256
>> +
>> +static size_t initial_lvl1_pd_pool_used;
>> +static struct lvl1_pd initial_lvl1_pd_pool[INITIAL_LVL1_PD_COUNT];
>> +
>> +static size_t initial_lvl2_lvl3_pd_pool_used;
>> +static struct lvl2_pd initial_lvl2_lvl3_pd_pool[INITIAL_LVL2_LVL3_PD_COUNT];
>> +
>> +static size_t initial_lvl4_pt_pool_used;
>> +static struct lvl4_pt initial_lvl4_pt_pool[INITIAL_LVL4_PT_COUNT];
> 
> The initial_lvl..._pool_used variables can likely all be __initdata?
>

Yes, that's reasonable. I'll do that.

>> +static void __init setup_initial_mapping(struct lvl1_pd *lvl1,
>> +                                         vaddr_t map_start,
>> +                                         vaddr_t map_end,
>> +                                         paddr_t phys_base)
>> +{
>> +    uint64_t page_addr;
>> +
>> +    if ( map_start & ~PAGE_MASK )
>> +    {
>> +        early_printk("Xen _start be aligned to 64k (PAGE_SIZE) boundary\n");
>> +        die();
>> +    }
>> +
>> +    if ( phys_base & ~PAGE_MASK )
>> +    {
>> +        early_printk("Xen should be loaded at 64k (PAGE_SIZE) boundary\n");
>> +        die();
>> +    }
>> +
>> +    for ( page_addr = map_start; page_addr < map_end; page_addr += PAGE_SIZE )
>> +    {
>> +        struct lvl2_pd *lvl2;
>> +        struct lvl3_pd *lvl3;
>> +        struct lvl4_pt *lvl4;
>> +        pde_t *pde;
>> +        pte_t *pte;
>> +
>> +        /* Allocate LVL 2 PD if necessary */
>> +        pde = pt_entry(lvl1, page_addr);
>> +        if ( !pde_is_valid(*pde) )
>> +        {
>> +            lvl2 = lvl2_pd_pool_alloc();
>> +            *pde = paddr_to_pde(__pa(lvl2), PDE_VALID,
>> +                                XEN_PT_ENTRIES_LOG2_LVL_2);
>> +        }
>> +        else
>> +            lvl2 = (struct lvl2_pd *)__va(pde_to_paddr(*pde));
> 
> I don't think the cast here (and similar ones below) is needed.
>

Good catch. Will drop the explicit casts.

>> +static void __init setup_partition_table(struct lvl1_pd *root)
>> +{
>> +    unsigned long ptcr;
>> +
>> +    /* Configure entry for LPID 0 to enable Radix and point to root PD */
>> +    uint64_t patb0 = RTS_FIELD | __pa(root) | XEN_PT_ENTRIES_LOG2_LVL_1 |
>> +                     PATB0_HR;
>> +    uint64_t patb1 = __pa(initial_prtb) | (PRTB_SIZE_LOG2 - 12) | PATB1_GR;
>> +    initial_patb[0].patb0 = cpu_to_be64(patb0);
>> +    initial_patb[0].patb1 = cpu_to_be64(patb1);
> 
> Nit: Blank line please between declaration(s) and statement(s).
>

Will fix.

>> +    ptcr = __pa(initial_patb) | (PATB_SIZE_LOG2 - 12);
>> +    mtspr(SPRN_PTCR, ptcr);
>> +}
>> +
>> +static void __init setup_process_table(struct lvl1_pd *root)
>> +{
>> +    /* Configure entry for PID 0 to point to root PD */
>> +    uint64_t prtb0 = RTS_FIELD | __pa(root) | XEN_PT_ENTRIES_LOG2_LVL_1;
>> +    initial_prtb[0].prtb0 = cpu_to_be64(prtb0);
> 
> Same here then.
>

Ditto.

> Jan

Thanks,
Shawn

