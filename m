Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44975615D61
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 09:12:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435559.689032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oq8pn-00040D-Ia; Wed, 02 Nov 2022 08:10:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435559.689032; Wed, 02 Nov 2022 08:10:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oq8pn-0003yQ-Fa; Wed, 02 Nov 2022 08:10:51 +0000
Received: by outflank-mailman (input) for mailman id 435559;
 Wed, 02 Nov 2022 08:10:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O0pi=3C=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oq8pl-0003yK-Lz
 for xen-devel@lists.xenproject.org; Wed, 02 Nov 2022 08:10:49 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9643b7f-5a85-11ed-8fd0-01056ac49cbb;
 Wed, 02 Nov 2022 09:10:48 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id v1so23293374wrt.11
 for <xen-devel@lists.xenproject.org>; Wed, 02 Nov 2022 01:10:44 -0700 (PDT)
Received: from [192.168.1.93] (adsl-187.109.242.224.tellas.gr.
 [109.242.224.187]) by smtp.gmail.com with ESMTPSA id
 ay41-20020a05600c1e2900b003cf7055c014sm1287541wmb.1.2022.11.02.01.10.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Nov 2022 01:10:43 -0700 (PDT)
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
X-Inumbo-ID: d9643b7f-5a85-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eMBuq5CoXkQ4fqzvV9vBUnZhop/W2kXkogfgclXugYY=;
        b=C53ZC/Qhj8Mg6fNVzm0xEU1Z2i4VbfntxJzbQH5+nEsAGiIWqGdU8wXLxhNuqdbCJg
         09z0Zg9iW7OUV9OWbgyqZXbyuQ3eEGy2iC9sjkl4/x+Lmi5Oj7cHiguHBlCrosycBqqc
         ePhmWGx+5nxp5UMZgWoaEq5ggyPhyUPmATrOWrJxMHLYtGk5pM4+P580XijCtfvJD+M4
         ZqMfSKUp+TDoRU6cSW8v15v3DucctzIs2zfkP456VIBBTUTFgXLBf/ZJ99/X6VUrTN/4
         j6PPnwc64YBoMirWdx2h+/smDK2HJHVyhOtC6aZ+ttjc87fU0wob/l4o9RE+gb18fgTd
         sZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eMBuq5CoXkQ4fqzvV9vBUnZhop/W2kXkogfgclXugYY=;
        b=iv0t0mmHmiVm+Bo143djJhyeZ5sweCn2JtjTjbCk4JHje5rhgPHPdhVUu6ySxN3/mA
         /lvSZZdaCGbCiiy/FCxChT9FpVoQahaQAyUYGeK1lCc1PilC17L9dU2R8eiB2Z2uuasj
         F094zFMp4AdSlKZSyZ5VPRuVO/b1qpsVttEYXhD1syLX04/uWZGyda+8o9C+a1bkmrU6
         6xbRX8/gkiwkO4YFdXVZC6Xc8FyvMj53Jzb/jMomyYz+Vcdjj2f6+DqjdOsSoj3x9syW
         u5R0zF0CQg5zKK5lcVWK07CVhzl4+P5sSuQ0JtAO3/+jgwfa++JTHGQy+wsA/eqbFCS6
         ZhNg==
X-Gm-Message-State: ACrzQf0099zEpj757TowTtBXAkGFJZ1qEGdih2haPT6oZm06rxNPnwlb
	/layhL6DU4r6rXa8zqhfVrI=
X-Google-Smtp-Source: AMsMyM4POZR72D2GYnJY8hrzJPy9HcYjNd16EB2DudhUO/otLjkbUYS3VQnwE03cSt+b0V96Dxpd5A==
X-Received: by 2002:adf:ef82:0:b0:234:ef87:dc8d with SMTP id d2-20020adfef82000000b00234ef87dc8dmr14514531wro.297.1667376643687;
        Wed, 02 Nov 2022 01:10:43 -0700 (PDT)
Message-ID: <333c0344-af4a-ca15-c568-b1782e4ba1dd@gmail.com>
Date: Wed, 2 Nov 2022 10:10:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [XEN v2 10/12] xen/Arm: GICv3: Use ULL instead of UL for 64bits
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20221031151326.22634-1-ayankuma@amd.com>
 <20221031151326.22634-11-ayankuma@amd.com>
 <ef8d46ce-479f-8f03-f126-9ee71dc9ebb3@gmail.com>
 <0a8b2d0e-1352-cb69-f567-e63b5bbbabef@amd.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <0a8b2d0e-1352-cb69-f567-e63b5bbbabef@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/1/22 16:43, Ayan Kumar Halder wrote:
> 
> On 01/11/2022 10:03, Xenia Ragiadakou wrote:
>> Hi Ayan,
> Hi Xenia,
>>
>> On 10/31/22 17:13, Ayan Kumar Halder wrote:
>>> "unsigned long long" is defined as 64 bits on AArch64 and AArch32
>>> Thus, one should this instead of "unsigned long" which is 32 bits
>>> on AArch32.
>>>
>>> Also use 'PRIx64' instead of 'lx' or 'llx' to print uint64_t.
>>>
>>> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
>>> ---
>>>
>>> Changed from :-
>>> v1 - 1. Replace PRIu64 with PRIx64 so that the values are printed in 
>>> hex as
>>> desired.
>>> 2. Use ULL in GITS_BASER_RO_MASK as MMIO registers are always unsigned.
>>>
>>>   xen/arch/arm/gic-v3-lpi.c              |  8 ++++----
>>>   xen/arch/arm/gic-v3.c                  |  4 ++--
>>>   xen/arch/arm/include/asm/gic_v3_defs.h |  2 +-
>>>   xen/arch/arm/include/asm/gic_v3_its.h  |  2 +-
>>>   xen/arch/arm/vgic-v3-its.c             | 17 +++++++++--------
>>>   5 files changed, 17 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
>>> index 61d90eb386..9ca74bc321 100644
>>> --- a/xen/arch/arm/gic-v3-lpi.c
>>> +++ b/xen/arch/arm/gic-v3-lpi.c
>>> @@ -134,7 +134,7 @@ void gicv3_set_redist_address(paddr_t address, 
>>> unsigned int redist_id)
>>>   uint64_t gicv3_get_redist_address(unsigned int cpu, bool use_pta)
>>>   {
>>>       if ( use_pta )
>>> -        return per_cpu(lpi_redist, cpu).redist_addr & GENMASK(51, 16);
>>> +        return per_cpu(lpi_redist, cpu).redist_addr & 
>>> GENMASK_ULL(51, 16);
>>>       else
>>>           return per_cpu(lpi_redist, cpu).redist_id << 16;
>>>   }
>>> @@ -253,7 +253,7 @@ static int gicv3_lpi_allocate_pendtable(unsigned 
>>> int cpu)
>>>           return -ENOMEM;
>>>         /* Make sure the physical address can be encoded in the 
>>> register. */
>>> -    if ( virt_to_maddr(pendtable) & ~GENMASK(51, 16) )
>>> +    if ( virt_to_maddr(pendtable) & ~GENMASK_ULL(51, 16) )
>>>       {
>>>           xfree(pendtable);
>>>           return -ERANGE;
>>> @@ -281,7 +281,7 @@ static int gicv3_lpi_set_pendtable(void __iomem 
>>> *rdist_base)
>>>           return -ENOMEM;
>>>       }
>>>   -    ASSERT(!(virt_to_maddr(pendtable) & ~GENMASK(51, 16)));
>>> +    ASSERT(!(virt_to_maddr(pendtable) & ~GENMASK_ULL(51, 16)));
>>>         val  = GIC_BASER_CACHE_RaWaWb << 
>>> GICR_PENDBASER_INNER_CACHEABILITY_SHIFT;
>>>       val |= GIC_BASER_CACHE_SameAsInner << 
>>> GICR_PENDBASER_OUTER_CACHEABILITY_SHIFT;
>>> @@ -329,7 +329,7 @@ static int gicv3_lpi_set_proptable(void __iomem * 
>>> rdist_base)
>>>               return -ENOMEM;
>>>             /* Make sure the physical address can be encoded in the 
>>> register. */
>>> -        if ( (virt_to_maddr(table) & ~GENMASK(51, 12)) )
>>> +        if ( (virt_to_maddr(table) & ~GENMASK_ULL(51, 12)) )
>>>           {
>>>               xfree(table);
>>>               return -ERANGE;
>>> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
>>> index 8b4b168e78..d8ce0f46c6 100644
>>> --- a/xen/arch/arm/gic-v3.c
>>> +++ b/xen/arch/arm/gic-v3.c
>>> @@ -417,12 +417,12 @@ static void gicv3_dump_state(const struct vcpu *v)
>>>       if ( v == current )
>>>       {
>>>           for ( i = 0; i < gicv3_info.nr_lrs; i++ )
>>> -            printk("   HW_LR[%d]=%llx\n", i, gicv3_ich_read_lr(i));
>>> +            printk("   HW_LR[%d]=%" PRIx64 "\n", i, 
>>> gicv3_ich_read_lr(i));
>>>       }
>>>       else
>>>       {
>>>           for ( i = 0; i < gicv3_info.nr_lrs; i++ )
>>> -            printk("   VCPU_LR[%d]=%llx\n", i, v->arch.gic.v3.lr[i]);
>>> +            printk("   VCPU_LR[%d]=%" PRIx64 "\n", i, 
>>> v->arch.gic.v3.lr[i]);
>>>       }
>>>   }
>>>   diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h 
>>> b/xen/arch/arm/include/asm/gic_v3_defs.h
>>> index 87115f8b25..3a24bd4825 100644
>>> --- a/xen/arch/arm/include/asm/gic_v3_defs.h
>>> +++ b/xen/arch/arm/include/asm/gic_v3_defs.h
>>> @@ -195,7 +195,7 @@
>>>     #define ICH_SGI_IRQMODE_SHIFT        40
>>>   #define ICH_SGI_IRQMODE_MASK         0x1
>>> -#define ICH_SGI_TARGET_OTHERS        1UL
>>> +#define ICH_SGI_TARGET_OTHERS        1ULL
>>>   #define ICH_SGI_TARGET_LIST          0
>>>   #define ICH_SGI_IRQ_SHIFT            24
>>>   #define ICH_SGI_IRQ_MASK             0xf
>>> diff --git a/xen/arch/arm/include/asm/gic_v3_its.h 
>>> b/xen/arch/arm/include/asm/gic_v3_its.h
>>> index fae3f6ecef..5ae50b18ea 100644
>>> --- a/xen/arch/arm/include/asm/gic_v3_its.h
>>> +++ b/xen/arch/arm/include/asm/gic_v3_its.h
> Changes not required as ITS is not supported on AArch32 v8R GIC.
>>> @@ -38,7 +38,7 @@
>>>   #define GITS_PIDR2                      GICR_PIDR2
>>>     /* Register bits */
>>> -#define GITS_VALID_BIT                  BIT(63, UL)
>>> +#define GITS_VALID_BIT                  BIT(63, ULL)
>>>     #define GITS_CTLR_QUIESCENT             BIT(31, UL)
>>>   #define GITS_CTLR_ENABLE                BIT(0, UL)
>>
>> It seems that you forgot GITS_BASER_INDIRECT, that is BIT(62, UL).
>>
>>> diff --git a/xen/arch/arm/vgic-v3-its.c b/xen/arch/arm/vgic-v3-its.c
>>> index 58d939b85f..c5e02b2c41 100644
>>> --- a/xen/arch/arm/vgic-v3-its.c
>>> +++ b/xen/arch/arm/vgic-v3-its.c
> Changes not required as ITS is not supported on AArch32 v8R GIC.
>>> @@ -96,13 +96,13 @@ typedef uint16_t coll_table_entry_t;
>>>    * in the lowest 5 bits of the word.
>>>    */
>>>   typedef uint64_t dev_table_entry_t;
>>> -#define DEV_TABLE_ITT_ADDR(x) ((x) & GENMASK(51, 8))
>>> +#define DEV_TABLE_ITT_ADDR(x) ((x) & GENMASK_ULL(51, 8))
>>>   #define DEV_TABLE_ITT_SIZE(x) (BIT(((x) & GENMASK(4, 0)) + 1, UL))
>>>   #define DEV_TABLE_ENTRY(addr, bits)                     \
>>>           (((addr) & GENMASK(51, 8)) | (((bits) - 1) & GENMASK(4, 0)))
>>>     #define GITS_BASER_RO_MASK       (GITS_BASER_TYPE_MASK | \
>>> -                                  (0x1fL << 
>>> GITS_BASER_ENTRY_SIZE_SHIFT))
>>> +                                  (0x1ULL << 
>>> GITS_BASER_ENTRY_SIZE_SHIFT))
>>
>> You have accidently dropped 'f' from the mask.
> 
> Yes, actually I intentionally dropped it.
> 
> AFAIU, 'fL' represent a floating point literal. This does not make sense 
> are the MMIO registers are always unsigned long (32 bit) or unsigned 
> long long (64 bit).

Probably you got a bit confused. Here f is just a hex digit. The 
expression cannot be a hex floating point literal because there is no 
exponent part.

> 
> So, I corrected it.
> 
>>
>> I noticed that you change to ULL only a part of GENMASK and BIT 
>> occurences, I cannot see why. Maybe I m missing sth.
> Actually, I am trying to change only where the shift exceeds 32 bits.
>>
>> Also, with patch [XEN v2 12/12] xen/Arm: GICv3: Enable GICv3 for 
>> AArch32, you disable ITS support for arm32, so it seems that those 
>> changes in ITS related files are not required (not that do any harm to 
>> have).
> 
> Sorry, this is my mistake. I should not have changed gic_v3_its.h or 
> vgic-v3-its.c as they are not used for AArch32 v8R GIC.
> 
> I will fix this in v3.
> 
> - Ayan
> 
>>
>>>     /*
>>>    * The physical address is encoded slightly differently depending on
>>> @@ -112,10 +112,10 @@ typedef uint64_t dev_table_entry_t;
>>>   static paddr_t get_baser_phys_addr(uint64_t reg)
>>>   {
>>>       if ( reg & BIT(9, UL) )
>>> -        return (reg & GENMASK(47, 16)) |
>>> +        return (reg & GENMASK_ULL(47, 16)) |
>>>                   ((reg & GENMASK(15, 12)) << 36);
>>>       else
>>> -        return reg & GENMASK(47, 12);
>>> +        return reg & GENMASK_ULL(47, 12);
>>>   }
>>>     /* Must be called with the ITS lock held. */
>>> @@ -414,7 +414,7 @@ static int update_lpi_property(struct domain *d, 
>>> struct pending_irq *p)
>>>       if ( !d->arch.vgic.rdists_enabled )
>>>           return 0;
>>>   -    addr = d->arch.vgic.rdist_propbase & GENMASK(51, 12);
>>> +    addr = d->arch.vgic.rdist_propbase & GENMASK_ULL(51, 12);
>>>         ret = access_guest_memory_by_ipa(d, addr + p->irq - LPI_OFFSET,
>>>                                        &property, sizeof(property), 
>>> false);
>>> @@ -897,7 +897,8 @@ out_unlock:
>>>     static void dump_its_command(uint64_t *command)
>>>   {
>>> -    gdprintk(XENLOG_WARNING, "  cmd 0x%02lx: %016lx %016lx %016lx 
>>> %016lx\n",
>>> +    gdprintk(XENLOG_WARNING, "  cmd 0x%" PRIx64 ": %" PRIx64
>>> +             "%" PRIx64 "%" PRIx64 "%" PRIx64 "\n",
>>>                its_cmd_get_command(command),
>>>                command[0], command[1], command[2], command[3]);
>>>   }
>>> @@ -909,7 +910,7 @@ static void dump_its_command(uint64_t *command)
>>>    */
>>>   static int vgic_its_handle_cmds(struct domain *d, struct virt_its 
>>> *its)
>>>   {
>>> -    paddr_t addr = its->cbaser & GENMASK(51, 12);
>>> +    paddr_t addr = its->cbaser & GENMASK_ULL(51, 12);
>>>       uint64_t command[4];
>>>         ASSERT(spin_is_locked(&its->vcmd_lock));
>>> @@ -1122,7 +1123,7 @@ read_as_zero_64:
>>>     read_impl_defined:
>>>       printk(XENLOG_G_DEBUG
>>> -           "%pv: vGITS: RAZ on implementation defined register 
>>> offset %#04lx\n",
>>> +           "%pv: vGITS: RAZ on implementation defined register 
>>> offset %" PRIx64 "#04llx\n",
>>>              v, info->gpa & 0xffff);
>>>       *r = 0;
>>>       return 1;
>>

-- 
Xenia

