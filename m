Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A7961476A
	for <lists+xen-devel@lfdr.de>; Tue,  1 Nov 2022 11:04:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.433410.686378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opo7h-00053b-P7; Tue, 01 Nov 2022 10:03:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 433410.686378; Tue, 01 Nov 2022 10:03:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opo7h-00051C-MD; Tue, 01 Nov 2022 10:03:57 +0000
Received: by outflank-mailman (input) for mailman id 433410;
 Tue, 01 Nov 2022 10:03:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Jvn=3B=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1opo7g-000516-6W
 for xen-devel@lists.xenproject.org; Tue, 01 Nov 2022 10:03:56 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e75f2d1-59cc-11ed-8fd0-01056ac49cbb;
 Tue, 01 Nov 2022 11:03:55 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id ud5so35788427ejc.4
 for <xen-devel@lists.xenproject.org>; Tue, 01 Nov 2022 03:03:54 -0700 (PDT)
Received: from [192.168.1.93] (adsl-235.109.242.227.tellas.gr.
 [109.242.227.235]) by smtp.gmail.com with ESMTPSA id
 c6-20020a056402120600b0045d74aa401fsm4252237edw.60.2022.11.01.03.03.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Nov 2022 03:03:53 -0700 (PDT)
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
X-Inumbo-ID: 7e75f2d1-59cc-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pLZyi3m4upOobw/vrzl2QEmnc3If0RLESFCBklnfykE=;
        b=of0y8ico/TkElz8j7a/DqF1Lcp0s/JuPZnqMS0gmmV2q5SOdRvizShcK9IpRLIl9yJ
         1XOtGT/wIwW4g8+Ajh6x6DqkFsj0ejlmigKyxRHKH/Khsx2yHgfptMxQwT0Ij5I56Sfd
         plyLkZqcABasXNMRtofNzv6T9M0ezy6DsGxqEEFsvhzl97kEKlZVbn2OlYR6tn2ftjsL
         tCSKdVSRITrCZtwKMArotEUWkvlF5a1+Q/QbacfgqAH6zjATyD3PLAoaC3CO3e+EtSf9
         RG8TpNOIcNBYKCj+cQAQnM7qDsg7nSooQa+YVK9dxBJ8GqYqkQOylBF+iqfElgu819qp
         eryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pLZyi3m4upOobw/vrzl2QEmnc3If0RLESFCBklnfykE=;
        b=5o+FBgYahWLWmXWePx6D7B9+84tVzNVA1+f1338LS+POwsIxxxNfXWFVyNMiFTpPAN
         PsFEBjkWWHkQR/a741drCUS86rnZdeITupdc+jAHMg5i+ZQ8seFCWS74gzoOple7xQCc
         mk+nTpWCwbKl1FEx3gy3OD3ZDboLiziWo0KjdaiV6T9WezXeBbTDAIUvcoECLZdG4i3B
         +xP6kzBLjLYj4BWWCALoEpi/UCG7p+7C0K+EMAJquq6TSa+qjJ8cHKs4pi99CIvKFx4a
         byspjNdNyvS+ALopDEv6CoNN6S+mgBXbQYUUomMbLwSMFbLyCKPKq+sG2zj5R4SBcjXB
         7UqA==
X-Gm-Message-State: ACrzQf0zDbCYH3xi3Z4tUSK7aKETdDMLX7uvLQOW/qGFEee30uvGNBwu
	NFEVuIaRywIQkTcJEpjCJq4=
X-Google-Smtp-Source: AMsMyM6GHVGZaP6VAV7CT6oJmlkhOYz1A3Kc8V+53SX6rkcJB+AEA8lTU3yTW0fta/aCOgEZeHPNBw==
X-Received: by 2002:a17:907:2c47:b0:7a4:7673:d6ee with SMTP id hf7-20020a1709072c4700b007a47673d6eemr17751568ejc.397.1667297034309;
        Tue, 01 Nov 2022 03:03:54 -0700 (PDT)
Message-ID: <ef8d46ce-479f-8f03-f126-9ee71dc9ebb3@gmail.com>
Date: Tue, 1 Nov 2022 12:03:52 +0200
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
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <20221031151326.22634-11-ayankuma@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 10/31/22 17:13, Ayan Kumar Halder wrote:
> "unsigned long long" is defined as 64 bits on AArch64 and AArch32
> Thus, one should this instead of "unsigned long" which is 32 bits
> on AArch32.
> 
> Also use 'PRIx64' instead of 'lx' or 'llx' to print uint64_t.
> 
> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
> ---
> 
> Changed from :-
> v1 - 1. Replace PRIu64 with PRIx64 so that the values are printed in hex as
> desired.
> 2. Use ULL in GITS_BASER_RO_MASK as MMIO registers are always unsigned.
> 
>   xen/arch/arm/gic-v3-lpi.c              |  8 ++++----
>   xen/arch/arm/gic-v3.c                  |  4 ++--
>   xen/arch/arm/include/asm/gic_v3_defs.h |  2 +-
>   xen/arch/arm/include/asm/gic_v3_its.h  |  2 +-
>   xen/arch/arm/vgic-v3-its.c             | 17 +++++++++--------
>   5 files changed, 17 insertions(+), 16 deletions(-)
> 
> diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
> index 61d90eb386..9ca74bc321 100644
> --- a/xen/arch/arm/gic-v3-lpi.c
> +++ b/xen/arch/arm/gic-v3-lpi.c
> @@ -134,7 +134,7 @@ void gicv3_set_redist_address(paddr_t address, unsigned int redist_id)
>   uint64_t gicv3_get_redist_address(unsigned int cpu, bool use_pta)
>   {
>       if ( use_pta )
> -        return per_cpu(lpi_redist, cpu).redist_addr & GENMASK(51, 16);
> +        return per_cpu(lpi_redist, cpu).redist_addr & GENMASK_ULL(51, 16);
>       else
>           return per_cpu(lpi_redist, cpu).redist_id << 16;
>   }
> @@ -253,7 +253,7 @@ static int gicv3_lpi_allocate_pendtable(unsigned int cpu)
>           return -ENOMEM;
>   
>       /* Make sure the physical address can be encoded in the register. */
> -    if ( virt_to_maddr(pendtable) & ~GENMASK(51, 16) )
> +    if ( virt_to_maddr(pendtable) & ~GENMASK_ULL(51, 16) )
>       {
>           xfree(pendtable);
>           return -ERANGE;
> @@ -281,7 +281,7 @@ static int gicv3_lpi_set_pendtable(void __iomem *rdist_base)
>           return -ENOMEM;
>       }
>   
> -    ASSERT(!(virt_to_maddr(pendtable) & ~GENMASK(51, 16)));
> +    ASSERT(!(virt_to_maddr(pendtable) & ~GENMASK_ULL(51, 16)));
>   
>       val  = GIC_BASER_CACHE_RaWaWb << GICR_PENDBASER_INNER_CACHEABILITY_SHIFT;
>       val |= GIC_BASER_CACHE_SameAsInner << GICR_PENDBASER_OUTER_CACHEABILITY_SHIFT;
> @@ -329,7 +329,7 @@ static int gicv3_lpi_set_proptable(void __iomem * rdist_base)
>               return -ENOMEM;
>   
>           /* Make sure the physical address can be encoded in the register. */
> -        if ( (virt_to_maddr(table) & ~GENMASK(51, 12)) )
> +        if ( (virt_to_maddr(table) & ~GENMASK_ULL(51, 12)) )
>           {
>               xfree(table);
>               return -ERANGE;
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index 8b4b168e78..d8ce0f46c6 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -417,12 +417,12 @@ static void gicv3_dump_state(const struct vcpu *v)
>       if ( v == current )
>       {
>           for ( i = 0; i < gicv3_info.nr_lrs; i++ )
> -            printk("   HW_LR[%d]=%llx\n", i, gicv3_ich_read_lr(i));
> +            printk("   HW_LR[%d]=%" PRIx64 "\n", i, gicv3_ich_read_lr(i));
>       }
>       else
>       {
>           for ( i = 0; i < gicv3_info.nr_lrs; i++ )
> -            printk("   VCPU_LR[%d]=%llx\n", i, v->arch.gic.v3.lr[i]);
> +            printk("   VCPU_LR[%d]=%" PRIx64 "\n", i, v->arch.gic.v3.lr[i]);
>       }
>   }
>   
> diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/include/asm/gic_v3_defs.h
> index 87115f8b25..3a24bd4825 100644
> --- a/xen/arch/arm/include/asm/gic_v3_defs.h
> +++ b/xen/arch/arm/include/asm/gic_v3_defs.h
> @@ -195,7 +195,7 @@
>   
>   #define ICH_SGI_IRQMODE_SHIFT        40
>   #define ICH_SGI_IRQMODE_MASK         0x1
> -#define ICH_SGI_TARGET_OTHERS        1UL
> +#define ICH_SGI_TARGET_OTHERS        1ULL
>   #define ICH_SGI_TARGET_LIST          0
>   #define ICH_SGI_IRQ_SHIFT            24
>   #define ICH_SGI_IRQ_MASK             0xf
> diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/include/asm/gic_v3_its.h
> index fae3f6ecef..5ae50b18ea 100644
> --- a/xen/arch/arm/include/asm/gic_v3_its.h
> +++ b/xen/arch/arm/include/asm/gic_v3_its.h
> @@ -38,7 +38,7 @@
>   #define GITS_PIDR2                      GICR_PIDR2
>   
>   /* Register bits */
> -#define GITS_VALID_BIT                  BIT(63, UL)
> +#define GITS_VALID_BIT                  BIT(63, ULL)
>   
>   #define GITS_CTLR_QUIESCENT             BIT(31, UL)
>   #define GITS_CTLR_ENABLE                BIT(0, UL)

It seems that you forgot GITS_BASER_INDIRECT, that is BIT(62, UL).

> diff --git a/xen/arch/arm/vgic-v3-its.c b/xen/arch/arm/vgic-v3-its.c
> index 58d939b85f..c5e02b2c41 100644
> --- a/xen/arch/arm/vgic-v3-its.c
> +++ b/xen/arch/arm/vgic-v3-its.c
> @@ -96,13 +96,13 @@ typedef uint16_t coll_table_entry_t;
>    * in the lowest 5 bits of the word.
>    */
>   typedef uint64_t dev_table_entry_t;
> -#define DEV_TABLE_ITT_ADDR(x) ((x) & GENMASK(51, 8))
> +#define DEV_TABLE_ITT_ADDR(x) ((x) & GENMASK_ULL(51, 8))
>   #define DEV_TABLE_ITT_SIZE(x) (BIT(((x) & GENMASK(4, 0)) + 1, UL))
>   #define DEV_TABLE_ENTRY(addr, bits)                     \
>           (((addr) & GENMASK(51, 8)) | (((bits) - 1) & GENMASK(4, 0)))
>   
>   #define GITS_BASER_RO_MASK       (GITS_BASER_TYPE_MASK | \
> -                                  (0x1fL << GITS_BASER_ENTRY_SIZE_SHIFT))
> +                                  (0x1ULL << GITS_BASER_ENTRY_SIZE_SHIFT))

You have accidently dropped 'f' from the mask.

I noticed that you change to ULL only a part of GENMASK and BIT 
occurences, I cannot see why. Maybe I m missing sth.

Also, with patch [XEN v2 12/12] xen/Arm: GICv3: Enable GICv3 for 
AArch32, you disable ITS support for arm32, so it seems that those 
changes in ITS related files are not required (not that do any harm to 
have).

>   
>   /*
>    * The physical address is encoded slightly differently depending on
> @@ -112,10 +112,10 @@ typedef uint64_t dev_table_entry_t;
>   static paddr_t get_baser_phys_addr(uint64_t reg)
>   {
>       if ( reg & BIT(9, UL) )
> -        return (reg & GENMASK(47, 16)) |
> +        return (reg & GENMASK_ULL(47, 16)) |
>                   ((reg & GENMASK(15, 12)) << 36);
>       else
> -        return reg & GENMASK(47, 12);
> +        return reg & GENMASK_ULL(47, 12);
>   }
>   
>   /* Must be called with the ITS lock held. */
> @@ -414,7 +414,7 @@ static int update_lpi_property(struct domain *d, struct pending_irq *p)
>       if ( !d->arch.vgic.rdists_enabled )
>           return 0;
>   
> -    addr = d->arch.vgic.rdist_propbase & GENMASK(51, 12);
> +    addr = d->arch.vgic.rdist_propbase & GENMASK_ULL(51, 12);
>   
>       ret = access_guest_memory_by_ipa(d, addr + p->irq - LPI_OFFSET,
>                                        &property, sizeof(property), false);
> @@ -897,7 +897,8 @@ out_unlock:
>   
>   static void dump_its_command(uint64_t *command)
>   {
> -    gdprintk(XENLOG_WARNING, "  cmd 0x%02lx: %016lx %016lx %016lx %016lx\n",
> +    gdprintk(XENLOG_WARNING, "  cmd 0x%" PRIx64 ": %" PRIx64
> +             "%" PRIx64 "%" PRIx64 "%" PRIx64 "\n",
>                its_cmd_get_command(command),
>                command[0], command[1], command[2], command[3]);
>   }
> @@ -909,7 +910,7 @@ static void dump_its_command(uint64_t *command)
>    */
>   static int vgic_its_handle_cmds(struct domain *d, struct virt_its *its)
>   {
> -    paddr_t addr = its->cbaser & GENMASK(51, 12);
> +    paddr_t addr = its->cbaser & GENMASK_ULL(51, 12);
>       uint64_t command[4];
>   
>       ASSERT(spin_is_locked(&its->vcmd_lock));
> @@ -1122,7 +1123,7 @@ read_as_zero_64:
>   
>   read_impl_defined:
>       printk(XENLOG_G_DEBUG
> -           "%pv: vGITS: RAZ on implementation defined register offset %#04lx\n",
> +           "%pv: vGITS: RAZ on implementation defined register offset %" PRIx64 "#04llx\n",
>              v, info->gpa & 0xffff);
>       *r = 0;
>       return 1;

-- 
Xenia

