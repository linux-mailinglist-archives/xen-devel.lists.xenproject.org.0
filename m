Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6122EB383E6
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 15:44:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096082.1450884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urGRx-0006vp-3v; Wed, 27 Aug 2025 13:44:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096082.1450884; Wed, 27 Aug 2025 13:44:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urGRx-0006su-0l; Wed, 27 Aug 2025 13:44:29 +0000
Received: by outflank-mailman (input) for mailman id 1096082;
 Wed, 27 Aug 2025 13:44:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BCET=3H=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1urGRv-0006so-Op
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 13:44:27 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f276479c-834b-11f0-aeb2-fb57b961d000;
 Wed, 27 Aug 2025 15:44:26 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-55ce5243f6dso7332173e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 27 Aug 2025 06:44:26 -0700 (PDT)
Received: from [192.168.0.110] ([91.123.151.69])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35c20123sm2830243e87.68.2025.08.27.06.44.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Aug 2025 06:44:24 -0700 (PDT)
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
X-Inumbo-ID: f276479c-834b-11f0-aeb2-fb57b961d000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756302266; x=1756907066; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SQUYcwoWEyv3/kVUqRL3MNbyDx5dY8DehRbYIKGYuCs=;
        b=IiaYVVA+83sZmecF08iW1rdjUxnROk4o564vpJNhIsoBJSSnRsXWD4RfrNRhNlvtq6
         K1wagrW2+aFtyop3SG6dJ+/iuOIWREXJrQj6mHsbQgcyGuQ9YQsNJJ3ffMeZMGnD19W3
         DYMFHGCxRvzDWAlZbR+ZSiO75ctwCMOA85tIvy5aLoHSjjznmFps55NeSoft3Dct+qc5
         bIRRAA9P69RGwZ8f+Wfu1bsAe7iVrZl2+ztt7UywRX6Uoplo9Q1phEwiKEhI9h8ZIuJM
         1p/R2grveJO5jnugT/5i8ouaw8dxkkHXIWjjqz50rRGtJQ8z4IgXN7GJa35nI9wuVx7g
         SM7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756302266; x=1756907066;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SQUYcwoWEyv3/kVUqRL3MNbyDx5dY8DehRbYIKGYuCs=;
        b=NYLy3bwphR4bgfJicxhybURRBk+qRN2lbq28U0hHknYyN59oVLOpcH9fdeLPifnh15
         Eh9PWyIm/z3eFLNhILgziQ0BtV+s13aJzzwPRPUemi+rExZqV//XwXa4QjxX3l/OyfSo
         DFujeHrpfJU5GzpxVrUM4WMzKwHYK7ycx/C9SVLLQyto6ZWRhs5zG5AFEzUB8uMQxepq
         qYo9beGkfH4JeFjSYNZ1m5ZENu83z7uqWEO17ZwoNUk8SMQ2gwnl9Ky1cHFVKt6FO8Lz
         Y2NY18u7KXJhW4g2nhUZyY5pnNCu6ZdG0GC7wfU92lBA2Tn0s0cXPdJhc5nGyez4pjBg
         3MqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNByoBatOR4GMQ/npeUt1kK/NKqsY5rH+710nFl6OmQ2yKJL5otSG+uPtq5rQrGt7rcEg7wQVfpec=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzzLwKOJK7os1xwIHGuIxX+ZnAs91dyiN6GE3bfc3LPicyCgiYu
	LQsK5kMnrBAUaBLTJ/kKrXL9/y1b7oGpIJrKOlnW2WFmI02EssBKgYaX
X-Gm-Gg: ASbGncupwsj7iVTU3moeYSYpUJ85s9bOkxCrO8Bruzw5AbeEGaR2gklYS2ZtbxO9DGy
	2xjmS1cO8+hgIu9izCpSjfNKrjaUY4tYZ8+v+lYka0YXr8zOcVC/SN6bsH2Q793grFDHfTAr/fI
	x+D8kiG0cAAhctyVn0ZM0mdRnzcyovSp2i6nW0aIpZUw5qaaKxt6JJBUIMsTLKt02GE060d7aC3
	NNxAnUwdGyYBN/R8t1OqvRI5w5jayBWftglRbxyhjHa6IhRApcFiNFItIG5K5SIghqkbFbGxU4x
	VOOpBmQJwnTcaoAIjsNnztKAJ6leLVZqoXB2sGEMz2KYLYUlPpZ0N1ojTt7W+yf8yNWKnKve1Ni
	TjSoiFvk7PVQg1P/08vMMuuKEmz4sHGhPqHUNIERPniUiMQA=
X-Google-Smtp-Source: AGHT+IF5OQfuHLS9bx2NxGVm44L1hzyeRBTseXmnUjPy8HHqQDvTnOdShtpnl/eJibjuWTbod1PdmA==
X-Received: by 2002:a05:6512:3e13:b0:55c:e95e:cd63 with SMTP id 2adb3069b0e04-55f0ccce878mr5726122e87.30.1756302265317;
        Wed, 27 Aug 2025 06:44:25 -0700 (PDT)
Message-ID: <7b0e2df4-9666-4f7b-9ada-9f1000200fd3@gmail.com>
Date: Wed, 27 Aug 2025 16:44:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/11] xen/arm: vgic-v3: add emulation of GICv3.1 eSPI
 registers
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1756216942.git.leonid_komarianskyi@epam.com>
 <642a994d712a8c9df7aed9dec22124564db83c7e.1756216943.git.leonid_komarianskyi@epam.com>
 <5a84d20c-5136-4151-8801-b0fbccaf23d7@gmail.com>
 <d71bd33e-ec09-47e5-af68-b8a79c78971d@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <d71bd33e-ec09-47e5-af68-b8a79c78971d@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 27.08.25 14:13, Leonid Komarianskyi wrote:
> Hello Oleksandr,

Hello Leonid

> 
> Thank you for your close review.
> 
> On 26.08.25 22:57, Oleksandr Tyshchenko wrote:
>>
>>
>> On 26.08.25 17:05, Leonid Komarianskyi wrote:
>>
>> Hello Leonid
>>
>>
>>> Implemented support for GICv3.1 extended SPI registers for vGICv3,
>>> allowing the emulation of eSPI-specific behavior for guest domains.
>>> The implementation includes read and write emulation for eSPI-related
>>> registers (e.g., GICD_ISENABLERnE, GICD_IROUTERnE, and others),
>>> following a similar approach to the handling of regular SPIs.
>>>
>>> The eSPI registers, previously located in reserved address ranges,
>>> are now adjusted to support MMIO read and write operations correctly
>>> when CONFIG_GICV3_ESPI is enabled.
>>>
>>> The availability of eSPIs and the number of emulated extended SPIs
>>> for guest domains is reported by setting the appropriate bits in the
>>> GICD_TYPER register, based on the number of eSPIs requested by the
>>> domain and supported by the hardware. In cases where the configuration
>>> option is disabled, the hardware does not support eSPIs, or the domain
>>> does not request such interrupts, the functionality remains unchanged.
>>>
>>> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
>>>
>>> ---
>>> Changes in V2:
>>> - add missing rank index conversion for pending and inflight irqs
>>>
>>> Changes in V3:
>>> - changed vgic_store_irouter parameters - instead of offset virq is
>>>     used, to remove the additional bool espi parameter and simplify
>>>     checks. Also, adjusted parameters for regular SPI. Since the offset
>>>     parameter was used only for calculating virq number and then reused
>>> for
>>>     finding rank offset, it will not affect functionality.
>>> - fixed formatting for goto lables - added newlines after condition
>>> - fixed logs for GICD_ISACTIVERnE and GICD_ICACTIVERnE handlers
>>> - removed #ifdefs in 2 places where they were adjacent and could be
>>> merged
>>> ---
>>>    xen/arch/arm/vgic-v3.c | 275 +++++++++++++++++++++++++++++++++++++++--
>>>    1 file changed, 266 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
>>> index 4369c55177..56c539bb1b 100644
>>> --- a/xen/arch/arm/vgic-v3.c
>>> +++ b/xen/arch/arm/vgic-v3.c
>>> @@ -111,13 +111,10 @@ static uint64_t vgic_fetch_irouter(struct
>>> vgic_irq_rank *rank,
>>>     * Note the offset will be aligned to the appropriate boundary.
>>>     */
>>>    static void vgic_store_irouter(struct domain *d, struct
>>> vgic_irq_rank *rank,
>>> -                               unsigned int offset, uint64_t irouter)
>>> +                               unsigned int virq, uint64_t irouter)
>>>    {
>>>        struct vcpu *new_vcpu, *old_vcpu;
>>> -    unsigned int virq;
>>> -
>>> -    /* There is 1 vIRQ per IROUTER */
>>> -    virq = offset / NR_BYTES_PER_IROUTER;
>>> +    unsigned int offset;
>>>        /*
>>>         * The IROUTER0-31, used for SGIs/PPIs, are reserved and should
>>> @@ -685,6 +682,9 @@ static int __vgic_v3_distr_common_mmio_read(const
>>> char *name, struct vcpu *v,
>>>        {
>>>        case VRANGE32(GICD_IGROUPR, GICD_IGROUPRN):
>>>        case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
>>> +#ifdef CONFIG_GICV3_ESPI
>>> +    case VRANGE32(GICD_IGROUPRnE, GICD_IGROUPRnEN):
>>> +#endif
>>>            /* We do not implement security extensions for guests, read
>>> zero */
>>>            if ( dabt.size != DABT_WORD ) goto bad_width;
>>>            goto read_as_zero;
>>> @@ -710,11 +710,19 @@ static int
>>> __vgic_v3_distr_common_mmio_read(const char *name, struct vcpu *v,
>>>        /* Read the pending status of an IRQ via GICD/GICR is not
>>> supported */
>>>        case VRANGE32(GICD_ISPENDR, GICD_ISPENDRN):
>>>        case VRANGE32(GICD_ICPENDR, GICD_ICPENDRN):
>>> +#ifdef CONFIG_GICV3_ESPI
>>> +    case VRANGE32(GICD_ISPENDRnE, GICD_ISPENDRnEN):
>>> +    case VRANGE32(GICD_ICPENDRnE, GICD_ICPENDRnEN):
>>> +#endif
>>>            goto read_as_zero;
>>>        /* Read the active status of an IRQ via GICD/GICR is not
>>> supported */
>>>        case VRANGE32(GICD_ISACTIVER, GICD_ISACTIVERN):
>>>        case VRANGE32(GICD_ICACTIVER, GICD_ICACTIVERN):
>>> +#ifdef CONFIG_GICV3_ESPI
>>> +    case VRANGE32(GICD_ISACTIVERnE, GICD_ISACTIVERnEN):
>>> +    case VRANGE32(GICD_ICACTIVERnE, GICD_ICACTIVERnEN):
>>> +#endif
>>>            goto read_as_zero;
>>>        case VRANGE32(GICD_IPRIORITYR, GICD_IPRIORITYRN):
>>> @@ -752,6 +760,69 @@ static int __vgic_v3_distr_common_mmio_read(const
>>> char *name, struct vcpu *v,
>>>            return 1;
>>>        }
>>> +#ifdef CONFIG_GICV3_ESPI
>>> +    case VRANGE32(GICD_ISENABLERnE, GICD_ISENABLERnEN):
>>> +        if ( dabt.size != DABT_WORD )
>>> +            goto bad_width;
>>> +        rank = vgic_ext_rank_offset(v, 1, reg - GICD_ISENABLERnE,
>>> DABT_WORD);
>>> +        if ( rank == NULL )
>>> +            goto read_as_zero;
>>> +        vgic_lock_rank(v, rank, flags);
>>> +        *r = vreg_reg32_extract(rank->ienable, info);
>>> +        vgic_unlock_rank(v, rank, flags);
>>> +        return 1;
>>> +
>>> +    case VRANGE32(GICD_ICENABLERnE, GICD_ICENABLERnEN):
>>> +        if ( dabt.size != DABT_WORD )
>>> +            goto bad_width;
>>> +        rank = vgic_ext_rank_offset(v, 1, reg - GICD_ICENABLERnE,
>>> DABT_WORD);
>>> +        if ( rank == NULL )
>>> +            goto read_as_zero;
>>> +        vgic_lock_rank(v, rank, flags);
>>> +        *r = vreg_reg32_extract(rank->ienable, info);
>>> +        vgic_unlock_rank(v, rank, flags);
>>> +        return 1;
>>> +
>>> +    case VRANGE32(GICD_IPRIORITYRnE, GICD_IPRIORITYRnEN):
>>> +    {
>>> +        uint32_t ipriorityr;
>>> +        uint8_t rank_index;
>>> +
>>> +        if ( dabt.size != DABT_BYTE && dabt.size != DABT_WORD )
>>> +            goto bad_width;
>>> +        rank = vgic_ext_rank_offset(v, 8, reg - GICD_IPRIORITYRnE,
>>> DABT_WORD);
>>> +        if ( rank == NULL )
>>> +            goto read_as_zero;
>>> +        rank_index = REG_RANK_INDEX(8, reg - GICD_IPRIORITYRnE,
>>> DABT_WORD);
>>> +
>>> +        vgic_lock_rank(v, rank, flags);
>>> +        ipriorityr = ACCESS_ONCE(rank->ipriorityr[rank_index]);
>>> +        vgic_unlock_rank(v, rank, flags);
>>> +
>>> +        *r = vreg_reg32_extract(ipriorityr, info);
>>> +
>>> +        return 1;
>>> +    }
>>> +
>>> +    case VRANGE32(GICD_ICFGRnE, GICD_ICFGRnEN):
>>> +    {
>>> +        uint32_t icfgr;
>>> +
>>> +        if ( dabt.size != DABT_WORD )
>>> +            goto bad_width;
>>> +        rank = vgic_ext_rank_offset(v, 2, reg - GICD_ICFGRnE,
>>> DABT_WORD);
>>> +        if ( rank == NULL )
>>> +            goto read_as_zero;
>>> +        vgic_lock_rank(v, rank, flags);
>>> +        icfgr = rank->icfg[REG_RANK_INDEX(2, reg - GICD_ICFGRnE,
>>> DABT_WORD)];
>>> +        vgic_unlock_rank(v, rank, flags);
>>> +
>>> +        *r = vreg_reg32_extract(icfgr, info);
>>> +
>>> +        return 1;
>>> +    }
>>> +#endif
>>> +
>>>        default:
>>>            printk(XENLOG_G_ERR
>>>                   "%pv: %s: unhandled read r%d offset %#08x\n",
>>> @@ -782,6 +853,9 @@ static int __vgic_v3_distr_common_mmio_write(const
>>> char *name, struct vcpu *v,
>>>        {
>>>        case VRANGE32(GICD_IGROUPR, GICD_IGROUPRN):
>>>        case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
>>> +#ifdef CONFIG_GICV3_ESPI
>>> +    case VRANGE32(GICD_IGROUPRnE, GICD_IGROUPRnEN):
>>> +#endif
>>>            /* We do not implement security extensions for guests, write
>>> ignore */
>>>            goto write_ignore_32;
>>> @@ -871,6 +945,99 @@ static int
>>> __vgic_v3_distr_common_mmio_write(const char *name, struct vcpu *v,
>>>            vgic_unlock_rank(v, rank, flags);
>>>            return 1;
>>> +#ifdef CONFIG_GICV3_ESPI
>>> +    case VRANGE32(GICD_ISENABLERnE, GICD_ISENABLERnEN):
>>> +        if ( dabt.size != DABT_WORD )
>>> +            goto bad_width;
>>> +        rank = vgic_ext_rank_offset(v, 1, reg - GICD_ISENABLERnE,
>>> DABT_WORD);
>>> +        if ( rank == NULL )
>>> +            goto write_ignore;
>>> +        vgic_lock_rank(v, rank, flags);
>>> +        tr = rank->ienable;
>>> +        vreg_reg32_setbits(&rank->ienable, r, info);
>>> +        vgic_enable_irqs(v, (rank->ienable) & (~tr),
>>> EXT_RANK_IDX2NUM(rank->index));
>>> +        vgic_unlock_rank(v, rank, flags);
>>> +        return 1;
>>> +
>>> +    case VRANGE32(GICD_ICENABLERnE, GICD_ICENABLERnEN):
>>> +        if ( dabt.size != DABT_WORD )
>>> +            goto bad_width;
>>> +        rank = vgic_ext_rank_offset(v, 1, reg - GICD_ICENABLERnE,
>>> DABT_WORD);
>>> +        if ( rank == NULL )
>>> +            goto write_ignore;
>>> +        vgic_lock_rank(v, rank, flags);
>>> +        tr = rank->ienable;
>>> +        vreg_reg32_clearbits(&rank->ienable, r, info);
>>> +        vgic_disable_irqs(v, (~rank->ienable) & tr,
>>> EXT_RANK_IDX2NUM(rank->index));
>>> +        vgic_unlock_rank(v, rank, flags);
>>> +        return 1;
>>> +
>>> +    case VRANGE32(GICD_ISPENDRnE, GICD_ISPENDRnEN):
>>> +        if ( dabt.size != DABT_WORD )
>>> +            goto bad_width;
>>> +        rank = vgic_ext_rank_offset(v, 1, reg - GICD_ISPENDRnE,
>>> DABT_WORD);
>>> +        if ( rank == NULL )
>>> +            goto write_ignore;
>>> +
>>> +        vgic_set_irqs_pending(v, r, EXT_RANK_IDX2NUM(rank->index));
>>> +
>>> +        return 1;
>>> +
>>> +    case VRANGE32(GICD_ICPENDRnE, GICD_ICPENDRnEN):
>>> +        if ( dabt.size != DABT_WORD )
>>> +            goto bad_width;
>>> +        rank = vgic_ext_rank_offset(v, 1, reg - GICD_ICPENDRnE,
>>> DABT_WORD);
>>> +        if ( rank == NULL )
>>> +            goto write_ignore;
>>> +
>>> +        vgic_check_inflight_irqs_pending(v, EXT_RANK_IDX2NUM(rank-
>>>> index), r);
>>> +
>>> +        goto write_ignore;
>>> +    case VRANGE32(GICD_ISACTIVERnE, GICD_ISACTIVERnEN):
>>> +        if ( dabt.size != DABT_WORD )
>>> +            goto bad_width;
>>> +        printk(XENLOG_G_ERR
>>> +               "%pv: %s: unhandled word write %#"PRIregister" to
>>> ISACTIVER%dE\n",
>>> +               v, name, r, reg - GICD_ISACTIVERnE);
>>> +        return 0;
>>
>> Guest write access to GICD_ISACTIVER<n>E will lead to abort. But, I know
>> you just repeated the logic for regular GICD_ISACTIVER<n>.
>>
>>
> 
> Could you please clarify the scenario in which it leads to an abort?
> Since it is actually a stub case, it should just print an error message
> and that's it..

"return 0;" will lead to injecting a fault into the guest.

  Do you mean that, in this case, we need to goto
> write_ignore_32 label instead of returning 0?

My comment was not a direct request to change anything, but rather 
thinking out loud.

Unfortunally, I cannot answer why regular GICD_ISACTIVER<n> is emulated
in that way, but perhaps the injecting fault into the guest is the 
lesser evil than emulating it incorrectly...

Interestingly, for GICv2 we have a slighly relaxed version; it looks 
like writing 0 will not cause an abort and will be WI.
25f9e80201f3688e0c4d5c4e43e4b6143b441c52
xen/arm: Ignore write to GICD_ISACTIVERn registers (vgic-v2)

Now, with the introduction of extended GICD_ISACTIVER<n>E you retained 
the logic. One thing that needs mentioning is that before your series,
guest write access to extended GICD_ISACTIVER<n>E would be WI, but
with your series and CONFIG_GICV3_ESPI=y it will be an abort even
if running on GIC3 HW where eSPI is not supported.

At least, I would mention that in the patch description.


> 
>>> +
>>> +    case VRANGE32(GICD_ICACTIVERnE, GICD_ICACTIVERnEN):
>>> +        printk(XENLOG_G_ERR
>>> +               "%pv: %s: unhandled word write %#"PRIregister" to
>>> ICACTIVER%dE\n",
>>> +               v, name, r, reg - GICD_ICACTIVER);
>>
>> s/GICD_ICACTIVER/GICD_ICACTIVERnE
>>
>>
> 
> I will fix that in V4.
> 
>>> +        goto write_ignore_32;


[snip]

