Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DzeJ5ui3mkeGwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 22:24:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8B93FE574
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 22:24:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1282092.1564805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCkJY-0006hG-GB; Tue, 14 Apr 2026 20:24:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282092.1564805; Tue, 14 Apr 2026 20:24:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCkJY-0006eQ-CE; Tue, 14 Apr 2026 20:24:52 +0000
Received: by outflank-mailman (input) for mailman id 1282092;
 Tue, 14 Apr 2026 20:24:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1wCkJW-0006Xg-RI
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 20:24:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wCkJW-001nTv-1X;
 Tue, 14 Apr 2026 20:24:50 +0000
Received: from [2a02:8012:3a1:0:6452:fdce:8dbd:9a39]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wCkJW-0036wi-16;
 Tue, 14 Apr 2026 20:24:50 +0000
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
	bh=QFBLfe5i/9JqZBRgUFAj7nWhiJfRTY56kNhSbwiwTQk=; b=0S9RfB0x6qrJPSFDae9jphUcrr
	nyjl6xNGf4BS8hZvn7h05Fc1npFScMmKPEJLlg7f+PJdnIN45iYenX5xFcJbo/VaEFimam6Du+hPc
	Zq8clk9jv2X3Otb/auFuSMV6psCOjfTd6Nw6t7MPo4JZH65g6UBN/wKN5zq3wjeTYuVo=;
Message-ID: <6d1806aa-b009-407a-9a7a-476f9f4deb70@xen.org>
Date: Tue, 14 Apr 2026 17:10:37 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/23] xen/arm: vsmmuv3: Add support for registers
 emulation
Content-Language: en-GB
To: Milan Djokic <milan_djokic@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1774918270.git.milan_djokic@epam.com>
 <25adb33c4be3932c2d946cf7757c933eb042476c.1774918270.git.milan_djokic@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <25adb33c4be3932c2d946cf7757c933eb042476c.1774918270.git.milan_djokic@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[xen.org:s=20200302mail];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,xen.org:dkim,xen.org:mid];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:milan_djokic@epam.com,m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[xen.org];
	FORGED_SENDER(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[xen.org:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5E8B93FE574
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Milan,

On 31/03/2026 10:52, Milan Djokic wrote:
> From: Rahul Singh <rahul.singh@arm.com>
> 
> Add initial support for various emulated registers for virtual SMMUv3
> for guests and also add support for virtual cmdq and eventq.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
> ---
>   xen/drivers/passthrough/arm/smmu-v3.h  |   6 +
>   xen/drivers/passthrough/arm/vsmmu-v3.c | 286 +++++++++++++++++++++++++
>   2 files changed, 292 insertions(+)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.h b/xen/drivers/passthrough/arm/smmu-v3.h
> index 3fb13b7e21..fab4fd5a26 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.h
> +++ b/xen/drivers/passthrough/arm/smmu-v3.h
> @@ -60,6 +60,12 @@
>   #define IDR5_VAX			GENMASK(11, 10)
>   #define IDR5_VAX_52_BIT			1
>   
> +#define ARM_SMMU_IIDR			0x18
> +#define IIDR_PRODUCTID			GENMASK(31, 20)
> +#define IIDR_VARIANT			GENMASK(19, 16)
> +#define IIDR_REVISION			GENMASK(15, 12)
> +#define IIDR_IMPLEMENTER		GENMASK(11, 0)
> +
>   #define ARM_SMMU_CR0			0x20
>   #define CR0_ATSCHK			(1 << 4)
>   #define CR0_CMDQEN			(1 << 3)
> diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrough/arm/vsmmu-v3.c
> index e36f200ba5..3ae1e62a50 100644
> --- a/xen/drivers/passthrough/arm/vsmmu-v3.c
> +++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
> @@ -3,25 +3,307 @@
>   #include <xen/param.h>
>   #include <xen/sched.h>
>   #include <asm/mmio.h>
> +#include <asm/vgic-emul.h>

vgic-emul.h is intended to only be used in the vGIC code. I am fine if 
you want to use it in vsmmu-v3.c but it needs to be renamed. Maybe to 
vdev-emul.h.

>   #include <asm/viommu.h>
> +#include <asm/vreg.h>
> +
> +#include "smmu-v3.h"
> +
> +/* Register Definition */
> +#define ARM_SMMU_IDR2       0x8
> +#define ARM_SMMU_IDR3       0xc
> +#define ARM_SMMU_IDR4       0x10
> +#define IDR0_TERM_MODEL     (1 << 26)
> +#define IDR3_RIL            (1 << 10)
> +#define CR0_RESERVED        0xFFFFFC20

AFAIU, this is covering all the bits defined by the SMMU spec. But some 
of them are optional. Does this mean we will expose those optional features?

> +#define SMMU_IDR1_SIDSIZE   16
> +#define SMMU_CMDQS          19

Can you add some details how you decided the size of the command and ...

> +#define SMMU_EVTQS          19

... even queues?

> +#define DWORDS_BYTES        8
> +#define ARM_SMMU_IIDR_VAL   0x12

I am not sure which implementer this is referring to. But how do you 
plan to handle errata? Are we sure they can always be handled by Xen?

>   
>   /* Struct to hold the vIOMMU ops and vIOMMU type */
>   extern const struct viommu_desc __read_mostly *cur_viommu;
>   
> +/* virtual smmu queue */
> +struct arm_vsmmu_queue {
> +    uint64_t    q_base; /* base register */
> +    uint32_t    prod;
> +    uint32_t    cons;
> +    uint8_t     ent_size;
> +    uint8_t     max_n_shift;
> +};
> +
>   struct virt_smmu {
>       struct      domain *d;
>       struct      list_head viommu_list;
> +    uint8_t     sid_split;
> +    uint32_t    features;
> +    uint32_t    cr[3];
> +    uint32_t    cr0ack;
> +    uint32_t    gerror;
> +    uint32_t    gerrorn;
> +    uint32_t    strtab_base_cfg;
> +    uint64_t    strtab_base;
> +    uint32_t    irq_ctrl;
> +    uint64_t    gerror_irq_cfg0;
> +    uint64_t    evtq_irq_cfg0;
> +    struct      arm_vsmmu_queue evtq, cmdq;
>   };
>   
>   static int vsmmuv3_mmio_write(struct vcpu *v, mmio_info_t *info,
>                                 register_t r, void *priv)
>   {
> +    struct virt_smmu *smmu = priv;
> +    uint64_t reg;
> +    uint32_t reg32;

Looking at this helper and the read one, I am bit surprised there is no 
lock taken nor we check the access size.  Can you explain why?

For instance, we should not allow 64-bit access on 32-bit register. The 
rest of the size (8-bit and 16-bit) is IMP DEFINED so it may be easier 
just not allow them.

> +
> +    switch ( info->gpa & 0xffff )
> +    {
> +    case VREG32(ARM_SMMU_CR0):
 > +        reg32 = smmu->cr[0];> +        vreg_reg32_update(&reg32, r, 
info);
> +        smmu->cr[0] = reg32;
> +        smmu->cr0ack = reg32 & ~CR0_RESERVED;
> +        break;
> +
> +    case VREG32(ARM_SMMU_CR1):
> +        reg32 = smmu->cr[1];
> +        vreg_reg32_update(&reg32, r, info);
> +        smmu->cr[1] = reg32;
> +        break;
> +
> +    case VREG32(ARM_SMMU_CR2):
> +        reg32 = smmu->cr[2];
> +        vreg_reg32_update(&reg32, r, info);
> +        smmu->cr[2] = reg32;
> +        break;
> +
> +    case VREG64(ARM_SMMU_STRTAB_BASE):

Looking at the SMMU spec (6.3.24 in ARM IHI 0070 H.a), the behavior of 
writing to the register is constrained unpredictable before SMMUv3.2, 
but after it should be ignored if SMMU_CR0.SMMUEN == 1.

So this implementation would not be valid for SMMUv3.2 and later. For 
convenience it would be best to just ignore the write (which is also 
valid for SMMUv3.1 and ealier).

> +        reg = smmu->strtab_base;
> +        vreg_reg64_update(&reg, r, info);
> +        smmu->strtab_base = reg;
> +        break;
> +
> +    case VREG32(ARM_SMMU_STRTAB_BASE_CFG):

Similar to above, there are some conditions when this field can be 
written (see 6.3.25).

> +        reg32 = smmu->strtab_base_cfg;
> +        vreg_reg32_update(&reg32, r, info);
> +        smmu->strtab_base_cfg = reg32;
> +
> +        smmu->sid_split = FIELD_GET(STRTAB_BASE_CFG_SPLIT, reg32);

The information for sid_split is already stored in 
``smmu->strtab_base_cfg``. So why do we need to store it differently?

> +        smmu->features |= STRTAB_BASE_CFG_FMT_2LVL;

I haven't checked the rest of the code yet. But from the name, I would 
assume it indicates whether 2-level stream table is supported. From my 
understanding of the specification, this is selectable by the guest OS. 
So why is this unconditionally set?

> +        break;
> +
> +    case VREG32(ARM_SMMU_CMDQ_BASE):

Similar to above, there are some condition when this field is RO.

> +        reg = smmu->cmdq.q_base;
> +        vreg_reg64_update(&reg, r, info);
> +        smmu->cmdq.q_base = reg;
> +        smmu->cmdq.max_n_shift = FIELD_GET(Q_BASE_LOG2SIZE, smmu->cmdq.q_base);
> +        if ( smmu->cmdq.max_n_shift > SMMU_CMDQS )
> +            smmu->cmdq.max_n_shift = SMMU_CMDQS;
> +        break;
> +
> +    case VREG32(ARM_SMMU_CMDQ_PROD):
> +        reg32 = smmu->cmdq.prod;
> +        vreg_reg32_update(&reg32, r, info);
> +        smmu->cmdq.prod = reg32;

AFAIU, this implementation is not yet complete. If so, it would be good 
to mark it as such with a comment of BUG_ON("Not yet implemented"). Same 
for everywhere in this file and the rest of the series.

> +        break;
> +
> +    case VREG32(ARM_SMMU_CMDQ_CONS):
> +        reg32 = smmu->cmdq.cons;
> +        vreg_reg32_update(&reg32, r, info);
> +        smmu->cmdq.cons = reg32;
> +        break;
> +
> +    case VREG32(ARM_SMMU_EVTQ_BASE):
> +        reg = smmu->evtq.q_base;
> +        vreg_reg64_update(&reg, r, info);
> +        smmu->evtq.q_base = reg;
> +        smmu->evtq.max_n_shift = FIELD_GET(Q_BASE_LOG2SIZE, smmu->evtq.q_base);
> +        if ( smmu->cmdq.max_n_shift > SMMU_EVTQS )
> +            smmu->cmdq.max_n_shift = SMMU_EVTQS;
> +        break;
> +
> +    case VREG32(ARM_SMMU_EVTQ_PROD):
> +        reg32 = smmu->evtq.prod;
> +        vreg_reg32_update(&reg32, r, info);
> +        smmu->evtq.prod = reg32;
> +        break;
> +
> +    case VREG32(ARM_SMMU_EVTQ_CONS):
> +        reg32 = smmu->evtq.cons;
> +        vreg_reg32_update(&reg32, r, info);
> +        smmu->evtq.cons = reg32;
> +        break;
> +
> +    case VREG32(ARM_SMMU_IRQ_CTRL):
> +        reg32 = smmu->irq_ctrl;
> +        vreg_reg32_update(&reg32, r, info);
> +        smmu->irq_ctrl = reg32;
> +        break;
> +
> +    case VREG64(ARM_SMMU_GERROR_IRQ_CFG0):
> +        reg = smmu->gerror_irq_cfg0;
> +        vreg_reg64_update(&reg, r, info);
> +        smmu->gerror_irq_cfg0 = reg;
> +        break;
> +
> +    case VREG64(ARM_SMMU_EVTQ_IRQ_CFG0):
> +        reg = smmu->evtq_irq_cfg0;
> +        vreg_reg64_update(&reg, r, info);
> +        smmu->evtq_irq_cfg0 = reg;
> +        break;
> +
> +    case VREG32(ARM_SMMU_GERRORN):
> +        reg = smmu->gerrorn;
> +        vreg_reg64_update(&reg, r, info);
> +        smmu->gerrorn = reg;
> +        break;
> +
> +    default:
> +        printk(XENLOG_G_ERR
> +               "%pv: vSMMUv3: unhandled write r%d offset %"PRIpaddr"\n",

NIT: The vIOMMU is per-domain so it is sufficient to print "%pd".

> +               v, info->dabt.reg, (unsigned long)info->gpa & 0xffff);
> +        return IO_ABORT;

Per section 6 of the SMMU:

"
For all pages except Page 1, undefined register locations are RES0. For 
Page 1, access to undefined/Reserved
register locations is CONSTRAINED UNPREDICTABLE and an implementation 
has one of the following behaviors:
[...]
"

Here you seem to implement page0 so the default case should be write 
ignore and therefore IO_HANDLED should be returned. BTW, you don't seem 
to handle page1. Is this going to be handled later on?

> +    }
> +
>       return IO_HANDLED;
>   }
>   
>   static int vsmmuv3_mmio_read(struct vcpu *v, mmio_info_t *info,
>                                register_t *r, void *priv)
>   {
> +    struct virt_smmu *smmu = priv;
> +    uint64_t reg;
> +
> +    switch ( info->gpa & 0xffff )
> +    {
> +    case VREG32(ARM_SMMU_IDR0):
> +        reg  = FIELD_PREP(IDR0_S1P, 1) | FIELD_PREP(IDR0_TTF, 2) |

As the page-table will be used by the HW, shouldn't TTF reflect what the 
HW supports? This would allow the vIOMMU to work for 32-bit domains.

> +            FIELD_PREP(IDR0_COHACC, 0) | FIELD_PREP(IDR0_ASID16, 1) |

Here you set COHACC to 0 which means the guest OS will have to clean the 
cache every time. This is safe everywhere, but it will have an impact on 
performance. I am not asking to allow COHACC when the HW supports it, 
but I think a TODO would be worth.

For ASID16, shouldn't the value be based on the HW?

As an aside, I guess we don't allow BTM because we only expose a single 
vSMMU?

> +            FIELD_PREP(IDR0_TTENDIAN, 0) | FIELD_PREP(IDR0_STALL_MODEL, 1) |

For TTENDIAN, it is the same as above.

For STALL_MODEL, I think 1 is ok.

> +            FIELD_PREP(IDR0_ST_LVL, 1) | FIELD_PREP(IDR0_TERM_MODEL, 1);

Overall, it feels the value set in IDR0 and IDR1 (below) needs some comment.

> +        *r = vreg_reg32_extract(reg, info);
> +        break;
> +
> +    case VREG32(ARM_SMMU_IDR1):
> +        reg  = FIELD_PREP(IDR1_SIDSIZE, SMMU_IDR1_SIDSIZE) |
> +            FIELD_PREP(IDR1_CMDQS, SMMU_CMDQS) |
> +            FIELD_PREP(IDR1_EVTQS, SMMU_EVTQS);
> +        *r = vreg_reg32_extract(reg, info);
> +        break;
> +
> +    case VREG32(ARM_SMMU_IDR2):
> +        goto read_reserved;
> +
> +    case VREG32(ARM_SMMU_IDR3):
> +        reg  = FIELD_PREP(IDR3_RIL, 0);

I am not sure why we explicitely need to set RIL but not the other fields?

 > +        *r = vreg_reg32_extract(reg, info);> +        break;
> +
> +    case VREG32(ARM_SMMU_IDR4):
> +        goto read_impl_defined;
> +
> +    case VREG32(ARM_SMMU_IDR5):
> +        reg  = FIELD_PREP(IDR5_GRAN4K, 1) | FIELD_PREP(IDR5_GRAN16K, 1) |
> +            FIELD_PREP(IDR5_GRAN64K, 1) | FIELD_PREP(IDR5_OAS, IDR5_OAS_48_BIT);

Similar to the other fields in IDR0, isn't this based on what the HW 
supports?	

> +        *r = vreg_reg32_extract(reg, info);
> +        break;
> +
> +    case VREG32(ARM_SMMU_IIDR):
> +        *r = vreg_reg32_extract(ARM_SMMU_IIDR_VAL, info);
> +        break;
> +
> +    case VREG32(ARM_SMMU_CR0):
> +        *r = vreg_reg32_extract(smmu->cr[0], info);
> +        break;
> +
> +    case VREG32(ARM_SMMU_CR0ACK):
> +        *r = vreg_reg32_extract(smmu->cr0ack, info);
> +        break;
> +
> +    case VREG32(ARM_SMMU_CR1):
> +        *r = vreg_reg32_extract(smmu->cr[1], info);
> +        break;
> +
> +    case VREG32(ARM_SMMU_CR2):
> +        *r = vreg_reg32_extract(smmu->cr[2], info);
> +        break;
> +
> +    case VREG32(ARM_SMMU_STRTAB_BASE):
> +        *r = vreg_reg64_extract(smmu->strtab_base, info);
> +        break;
> +
> +    case VREG32(ARM_SMMU_STRTAB_BASE_CFG):
> +        *r = vreg_reg32_extract(smmu->strtab_base_cfg, info);
> +        break;
> +
> +    case VREG32(ARM_SMMU_CMDQ_BASE):
> +        *r = vreg_reg64_extract(smmu->cmdq.q_base, info);
> +        break;
> +
> +    case VREG32(ARM_SMMU_CMDQ_PROD):
> +        *r = vreg_reg32_extract(smmu->cmdq.prod, info);
> +        break;
> +
> +    case VREG32(ARM_SMMU_CMDQ_CONS):
> +        *r = vreg_reg32_extract(smmu->cmdq.cons, info);
> +        break;
> +
> +    case VREG32(ARM_SMMU_EVTQ_BASE):
> +        *r = vreg_reg64_extract(smmu->evtq.q_base, info);
> +        break;
> +
> +    case VREG32(ARM_SMMU_EVTQ_PROD):
> +        *r = vreg_reg32_extract(smmu->evtq.prod, info);
> +        break;
> +
> +    case VREG32(ARM_SMMU_EVTQ_CONS):
> +        *r = vreg_reg32_extract(smmu->evtq.cons, info);
> +        break;
> +
> +    case VREG32(ARM_SMMU_IRQ_CTRL):
> +    case VREG32(ARM_SMMU_IRQ_CTRLACK):
> +        *r = vreg_reg32_extract(smmu->irq_ctrl, info);
> +        break;
> +
> +    case VREG64(ARM_SMMU_GERROR_IRQ_CFG0):
> +        *r = vreg_reg64_extract(smmu->gerror_irq_cfg0, info);
> +        break;
> +
> +    case VREG64(ARM_SMMU_EVTQ_IRQ_CFG0):
> +        *r = vreg_reg64_extract(smmu->evtq_irq_cfg0, info);
> +        break;
> +
> +    case VREG32(ARM_SMMU_GERROR):
> +        *r = vreg_reg64_extract(smmu->gerror, info);
> +        break;
> +
> +    case VREG32(ARM_SMMU_GERRORN):
> +        *r = vreg_reg64_extract(smmu->gerrorn, info);
> +        break;
> +
> +    default:
> +        printk(XENLOG_G_ERR
> +               "%pv: vSMMUv3: unhandled read r%d offset %"PRIpaddr"\n",
> +               v, info->dabt.reg, (unsigned long)info->gpa & 0xffff);
> +        return IO_ABORT;
> +    }
> +
> +    return IO_HANDLED;
> +
> + read_impl_defined:
> +    printk(XENLOG_G_DEBUG
> +           "%pv: vSMMUv3: RAZ on implementation defined register offset %"PRIpaddr"\n",
> +           v, info->gpa & 0xffff);
> +    *r = 0;
> +    return IO_HANDLED;
> +
> + read_reserved:
> +    printk(XENLOG_G_DEBUG
> +           "%pv: vSMMUv3: RAZ on reserved register offset %"PRIpaddr"\n",
> +           v, info->gpa & 0xffff);
> +    *r = 0;
>       return IO_HANDLED;
>   }
>   
> @@ -39,6 +321,10 @@ static int vsmmuv3_init_single(struct domain *d, paddr_t addr, paddr_t size)
>           return -ENOMEM;
>   
>       smmu->d = d;
> +    smmu->cmdq.q_base = FIELD_PREP(Q_BASE_LOG2SIZE, SMMU_CMDQS);
> +    smmu->cmdq.ent_size = CMDQ_ENT_DWORDS * DWORDS_BYTES;
> +    smmu->evtq.q_base = FIELD_PREP(Q_BASE_LOG2SIZE, SMMU_EVTQS);
> +    smmu->evtq.ent_size = EVTQ_ENT_DWORDS * DWORDS_BYTES;

I understand why we initialize ent_size. But I am not sure to understand 
why we need to initialize q_base. Can you clarify?

>   
>       register_mmio_handler(d, &vsmmuv3_mmio_handler, addr, size, smmu);
>   

Cheers,

-- 
Julien Grall


