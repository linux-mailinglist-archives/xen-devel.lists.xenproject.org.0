Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Bl5Os7lEmqW5AYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 13:49:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A79C5C23CF
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 13:49:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1318641.1586768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wR7KK-0002e0-LT; Sun, 24 May 2026 11:49:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1318641.1586768; Sun, 24 May 2026 11:49:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wR7KK-0002bK-If; Sun, 24 May 2026 11:49:04 +0000
Received: by outflank-mailman (input) for mailman id 1318641;
 Sun, 24 May 2026 11:49:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1wR7KJ-0002bE-Cu
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 11:49:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wR7KJ-0040IE-02;
 Sun, 24 May 2026 11:49:03 +0000
Received: from [2a02:8012:3a1:0:94ee:8228:5d9d:4ee8]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wR7KI-005SVi-2f;
 Sun, 24 May 2026 11:49:02 +0000
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
	bh=0sCDsEJ2c38OOthNnE62AdvHvXG+vDtuDbYcaiC5uL4=; b=ePyHE88Fn1ftJj505JQkIBUrLk
	qtLPOw6kpZILoEqg8ve9LvzKrKLQHE7Pd7J2ML0JqVNBwVK+cxTtn1GhiiBbrtcP63GjcJswlJhzK
	PabeeXT92a9/4ZZZKqFzfCB2dI1NAhYxhmSTdCYDHFxStWZBGcJ/sGDwAS1VgNEN86iU=;
Message-ID: <648f587f-8621-472d-9b2c-e88fe11444a4@xen.org>
Date: Sun, 24 May 2026 12:49:01 +0100
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
 <6d1806aa-b009-407a-9a7a-476f9f4deb70@xen.org>
 <f7e7f42c-43f1-436a-9d06-ab44619f2da0@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <f7e7f42c-43f1-436a-9d06-ab44619f2da0@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_DKIM_ALLOW(-0.20)[xen.org:s=20200302mail];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,epam.com:email];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:milan_djokic@epam.com,m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[xen.org];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[xen.org:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: 6A79C5C23CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Milan,

On 18/05/2026 01:17, Milan Djokic wrote:
> Hi Julien,
> 
> On 4/14/26 10:10, Julien Grall wrote:
>> Hi Milan,
>>
>> On 31/03/2026 10:52, Milan Djokic wrote:
>>> From: Rahul Singh <rahul.singh@arm.com>
>>>
>>> Add initial support for various emulated registers for virtual SMMUv3
>>> for guests and also add support for virtual cmdq and eventq.
>>>
>>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>>> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
>>> ---
>>>    xen/drivers/passthrough/arm/smmu-v3.h  |   6 +
>>>    xen/drivers/passthrough/arm/vsmmu-v3.c | 286 +++++++++++++++++++++ 
>>> ++++
>>>    2 files changed, 292 insertions(+)
>>>
>>> diff --git a/xen/drivers/passthrough/arm/smmu-v3.h b/xen/drivers/ 
>>> passthrough/arm/smmu-v3.h
>>> index 3fb13b7e21..fab4fd5a26 100644
>>> --- a/xen/drivers/passthrough/arm/smmu-v3.h
>>> +++ b/xen/drivers/passthrough/arm/smmu-v3.h
>>> @@ -60,6 +60,12 @@
>>>    #define IDR5_VAX            GENMASK(11, 10)
>>>    #define IDR5_VAX_52_BIT            1
>>> +#define ARM_SMMU_IIDR            0x18
>>> +#define IIDR_PRODUCTID            GENMASK(31, 20)
>>> +#define IIDR_VARIANT            GENMASK(19, 16)
>>> +#define IIDR_REVISION            GENMASK(15, 12)
>>> +#define IIDR_IMPLEMENTER        GENMASK(11, 0)
>>> +
>>>    #define ARM_SMMU_CR0            0x20
>>>    #define CR0_ATSCHK            (1 << 4)
>>>    #define CR0_CMDQEN            (1 << 3)
>>> diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/ 
>>> passthrough/arm/vsmmu-v3.c
>>> index e36f200ba5..3ae1e62a50 100644
>>> --- a/xen/drivers/passthrough/arm/vsmmu-v3.c
>>> +++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
>>> @@ -3,25 +3,307 @@
>>>    #include <xen/param.h>
>>>    #include <xen/sched.h>
>>>    #include <asm/mmio.h>
>>> +#include <asm/vgic-emul.h>
>>
>> vgic-emul.h is intended to only be used in the vGIC code. I am fine if
>> you want to use it in vsmmu-v3.c but it needs to be renamed. Maybe to
>> vdev-emul.h.
>>
> 
> Sure, I'll rename it
> 
>>>    #include <asm/viommu.h>
>>> +#include <asm/vreg.h>
>>> +
>>> +#include "smmu-v3.h"
>>> +
>>> +/* Register Definition */
>>> +#define ARM_SMMU_IDR2       0x8
>>> +#define ARM_SMMU_IDR3       0xc
>>> +#define ARM_SMMU_IDR4       0x10
>>> +#define IDR0_TERM_MODEL     (1 << 26)
>>> +#define IDR3_RIL            (1 << 10)
>>> +#define CR0_RESERVED        0xFFFFFC20
>>
>> AFAIU, this is covering all the bits defined by the SMMU spec. But some
>> of them are optional. Does this mean we will expose those optional 
>> features?
>>
> 
> Right now only mandatory features are supported (SMMU_EN, CMDQ, EVTQ). 
> Most of the optional features are not advertised in the IDR registers, 
> so guests are not expected to enable or use them via CR0.

Guests are not trusted by default. So what is the guest tries to set them?

> 
> 
>>> +#define SMMU_IDR1_SIDSIZE   16
>>> +#define SMMU_CMDQS          19
>>
>> Can you add some details how you decided the size of the command and ...
>>
>>> +#define SMMU_EVTQS          19
>>
>> ... even queues?
>>
> 
> The CMDQ/EVTQ sizes are currently set to the architectural maximum. 
> Since there is no direct dependency on the underlying hardware queue 
> sizes, using the maximum supported value seemed like the simplest option.
> 
>>> +#define DWORDS_BYTES        8
>>> +#define ARM_SMMU_IIDR_VAL   0x12
>>
>> I am not sure which implementer this is referring to. But how do you
>> plan to handle errata? Are we sure they can always be handled by Xen?
>>
> 
> This is currently a dummy value used to avoid triggering guest driver 
> errata/quirk paths. I will replace it with a more meaningful value. 
> Using the Arm implementer ID with the remaining fields cleared should be 
> sufficient.

I am not sure to understand why would that value be unused. Do you have 
more details?

> 
> My expectation is that errata handling should remain in Xen rather than 
> the guest.

I am not fully convinced you will be able to apply all the errata in the 
hypervisor. At least with close to no cost.

[...]

>>>    /* Struct to hold the vIOMMU ops and vIOMMU type */
>>>    extern const struct viommu_desc __read_mostly *cur_viommu;
>>> +/* virtual smmu queue */
>>> +struct arm_vsmmu_queue {
>>> +    uint64_t    q_base; /* base register */
>>> +    uint32_t    prod;
>>> +    uint32_t    cons;
>>> +    uint8_t     ent_size;
>>> +    uint8_t     max_n_shift;
>>> +};
>>> +
>>>    struct virt_smmu {
>>>        struct      domain *d;
>>>        struct      list_head viommu_list;
>>> +    uint8_t     sid_split;
>>> +    uint32_t    features;
>>> +    uint32_t    cr[3];
>>> +    uint32_t    cr0ack;
>>> +    uint32_t    gerror;
>>> +    uint32_t    gerrorn;
>>> +    uint32_t    strtab_base_cfg;
>>> +    uint64_t    strtab_base;
>>> +    uint32_t    irq_ctrl;
>>> +    uint64_t    gerror_irq_cfg0;
>>> +    uint64_t    evtq_irq_cfg0;
>>> +    struct      arm_vsmmu_queue evtq, cmdq;
>>>    };
>>>    static int vsmmuv3_mmio_write(struct vcpu *v, mmio_info_t *info,
>>>                                  register_t r, void *priv)
>>>    {
>>> +    struct virt_smmu *smmu = priv;
>>> +    uint64_t reg;
>>> +    uint32_t reg32;
>>
>> Looking at this helper and the read one, I am bit surprised there is no
>> lock taken nor we check the access size.  Can you explain why?
>>
>> For instance, we should not allow 64-bit access on 32-bit register. The
>> rest of the size (8-bit and 16-bit) is IMP DEFINED so it may be easier
>> just not allow them.
>>
> 
> Most of the configuration registers are expected to be accessed in a 
> serialized manner by the guest driver, during driver initialization.

I am afraid we can't trust the guest to do the right thing... So we need 
to make sure this could not lead to an invalid state in the emulation.

Furthermore, on baremetal, when a two pCPUs are trying to write to the 
same address, you will be able to see value A or value B but not a mix. 
Without a lock, I don't believe this is upheld in your implementation.

[...]

>> NIT: The vIOMMU is per-domain so it is sufficient to print "%pd".
>>
>>> +               v, info->dabt.reg, (unsigned long)info->gpa & 0xffff);
>>> +        return IO_ABORT;
>>
>> Per section 6 of the SMMU:
>>
>> "
>> For all pages except Page 1, undefined register locations are RES0. For
>> Page 1, access to undefined/Reserved
>> register locations is CONSTRAINED UNPREDICTABLE and an implementation
>> has one of the following behaviors:
>> [...]
>> "
>>
>> Here you seem to implement page0 so the default case should be write
>> ignore and therefore IO_HANDLED should be returned. BTW, you don't seem
>> to handle page1. Is this going to be handled later on?
>>
> 
>    From page1, right now only EVTQ registers are emulated. PRI is not 
> supported, but might be needed in the future for the PCI support (PRI 
> queue registers also belong to page1, but not emulated atm)
> So I think that page1 will be handled when PCI support is completed.

I am a bit confused with this answer. Are you saying you will handle 
page1 for the event queue register in another patch in this series?

> 
>>> +    }
>>> +
>>>        return IO_HANDLED;
>>>    }
>>>    static int vsmmuv3_mmio_read(struct vcpu *v, mmio_info_t *info,
>>>                                 register_t *r, void *priv)
>>>    {
>>> +    struct virt_smmu *smmu = priv;
>>> +    uint64_t reg;
>>> +
>>> +    switch ( info->gpa & 0xffff )
>>> +    {
>>> +    case VREG32(ARM_SMMU_IDR0):
>>> +        reg  = FIELD_PREP(IDR0_S1P, 1) | FIELD_PREP(IDR0_TTF, 2) |
>>
>> As the page-table will be used by the HW, shouldn't TTF reflect what the
>> HW supports? This would allow the vIOMMU to work for 32-bit domains.
>>
> 
> If my understanding is correct, Xen SMMU driver only supports AArch64 
> table format, so I think that we can't advertise 32-bit table format in 
> the emulation layer even if the hardware supports it.

Do you mind pointing me to the code? The page-tables are shared between 
the SMMU and the CPU. So we ought to support both.

Cheers,

-- 
Julien Grall


