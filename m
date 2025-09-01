Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6363FB3E354
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 14:39:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104679.1455712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut3oE-0007Yw-8O; Mon, 01 Sep 2025 12:38:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104679.1455712; Mon, 01 Sep 2025 12:38:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut3oE-0007WX-4Z; Mon, 01 Sep 2025 12:38:54 +0000
Received: by outflank-mailman (input) for mailman id 1104679;
 Mon, 01 Sep 2025 12:38:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oCw/=3M=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1ut3oC-0007WR-R8
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 12:38:53 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9cd7aab8-8730-11f0-8adc-4578a1afcccb;
 Mon, 01 Sep 2025 14:38:51 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-55f687fd3bdso3909652e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 05:38:50 -0700 (PDT)
Received: from [192.168.0.110] ([91.123.151.69])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f676dd3desm2902402e87.25.2025.09.01.05.38.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 05:38:49 -0700 (PDT)
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
X-Inumbo-ID: 9cd7aab8-8730-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756730330; x=1757335130; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W5KZDGAU6uHsI56YAmTJsS6NA4BS5GthUdRh1R6Wor0=;
        b=JJfZQhZ5DTtzJBRdZy+7LZoQ1AuZc5lX5GUspWJQQ4hXsiw22T5Vr+FivDS7ofC2+m
         tA9H8tiINoKXTOsHqQxNy9ogdi9ui0AAVVlZPhUe4uE0HkVt1i73EQ5RrqLoUVQ5baRO
         HET7jzFA7jeKAys3ERkQNJJ/rw03AMeOjVONuEwz9NCt0QeQ1TASP6DcgqifiB4LeV0K
         5EJy2WemoyfA8fFwBzewjn2PU4evqFMnZPF6Idma315kUSrSMcRgzt1CkgnYoNiDzRlI
         vZ9Sl57FLvlaF82GfXVyyQtT3fBUYi3lHU5eCyQm8SphxmL7T+pn0xJhcRhZ76/CmqwS
         /SGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756730330; x=1757335130;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W5KZDGAU6uHsI56YAmTJsS6NA4BS5GthUdRh1R6Wor0=;
        b=a162tcPR9UNT3ULyRlo8VBhstq15Sst7fdJHIYpUtktYIeE1adCOL1R+vGqy56zLvG
         ORZ6i8vD8CqoLKKftcnoqoL0vk+BbdDLVXn2aCatZ8LQ/RTvvS8UCw5PO/6Ib9omaj0A
         CtFeIwyk5bbmvUWU/Nv6pV8KG89+5uMwz+tPpAmaJILwUAXfr17kocJ/vc0hFgUShlU5
         BFlq8mgT2d3CriF1KFXMOr0JDELu2D44lM61uICVn2knDxuD02uM6XjBdY0z2RklsP45
         ZbsmgPvqyHgfyDhlBvEKX6cHkPkQfBRHpRcLJumdQc1j2VOEDEvlkJ6RhDfxa2VdREcN
         pSTw==
X-Forwarded-Encrypted: i=1; AJvYcCWFZqzPHvoNFWmIYZKJkvhimrUNOiXlSq3HQLYewRgLIK76esqy8zpPVYvnDFW/lJgR5slIvnQvi4U=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw+jFFSNgbTie5PFQG0QoM00y06ZurtY9A/xDhzZ0I/YW/vDx67
	o0cTBY6000l9SWDW8gFw8jbcMW7PhkFNXGWg7cRWTXtFbcLdsSGhhCu+
X-Gm-Gg: ASbGncuRfAIXMYWCc9QG7lBVQGnffRR73sIzJQmfUPysl7Clk6BjcjP5AGbKQOU6+4u
	KdvMJROwhFSdfy0LpDg89D6labKvrvhb+U+Wh+qtH5E65rRlGRnWiAT+bk34Y/kXKQVA4YD034b
	14ydjhcq6byMCoEpn5W/57E0nPu4RFyxrVVOpD7mrgkcs8nujJPwyhxnzya/VVhxI5mKtpn1vyn
	RuJd4s8srQqslC4vuTuyB7D+XPC7dwn0C5o0KP3z3mINyYYgtN7QRAjiolY29Yrvo/q/eGsm13m
	SrWb5AQegKd3sAYq1Zhd+ev/2t1BFl/ltN+GWhbQ2KS3tzgRZlNuNhqTnMXQM+6K79cZvF8e2wB
	e0H8M7YfY9Fo6qETWBHleolmLlg==
X-Google-Smtp-Source: AGHT+IHA5cb7okNZqRUj5D753WyAv/0lvyTfAMafRDwdW1I0uhD/gq1TDtceAvHvxHOSQNtcLVhkGQ==
X-Received: by 2002:a05:6512:671c:b0:55f:6c08:a15a with SMTP id 2adb3069b0e04-55f70905fe3mr1748753e87.32.1756730329785;
        Mon, 01 Sep 2025 05:38:49 -0700 (PDT)
Message-ID: <a915e7d0-2a90-4d5b-b6da-fec3f7b62795@gmail.com>
Date: Mon, 1 Sep 2025 15:38:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/12] xen/arm: vgic-v3: add emulation of GICv3.1 eSPI
 registers
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1756481577.git.leonid_komarianskyi@epam.com>
 <6fda233a1a2f0362062ff9a6e80ee223d33815cf.1756481577.git.leonid_komarianskyi@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <6fda233a1a2f0362062ff9a6e80ee223d33815cf.1756481577.git.leonid_komarianskyi@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 29.08.25 19:06, Leonid Komarianskyi wrote:


Hello Leonid

> Implemented support for GICv3.1 extended SPI registers for vGICv3,
> allowing the emulation of eSPI-specific behavior for guest domains.
> The implementation includes read and write emulation for eSPI-related
> registers (e.g., GICD_ISENABLERnE, GICD_IROUTERnE, and others),
> following a similar approach to the handling of regular SPIs.
> 
> The eSPI registers, previously located in reserved address ranges,
> are now adjusted to support MMIO read and write operations correctly
> when CONFIG_GICV3_ESPI is enabled.
> 
> The availability of eSPIs and the number of emulated extended SPIs
> for guest domains is reported by setting the appropriate bits in the
> GICD_TYPER register, based on the number of eSPIs requested by the
> domain and supported by the hardware. In cases where the configuration
> option is disabled, the hardware does not support eSPIs, or the domain
> does not request such interrupts, the functionality remains unchanged.
> 
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
> 
> ---
> Changes in V5:
> - since eSPI-specific defines and macros are now available even when the
>    appropriate config is disabled, this allows us to remove many
>    #ifdef guards and reuse the existing code for regular SPIs for eSPIs as
>    well, as eSPIs are processed similarly. This improves code readability
>    and consolidates the register ranges for SPIs and eSPIs in a single
>    place, simplifying future changes or fixes for SPIs and their
>    counterparts from the extended range
> - moved vgic_ext_rank_offset() from
>    [08/12] xen/arm: vgic: add resource management for extended SPIs
>    as the function was unused before this patch
> - added stub implementation of vgic_ext_rank_offset() when CONFIG_GICV3_ESPI=n
> - removed unnecessary defines for reserved ranges, which were introduced in
>    V4 to reduce the number of #ifdefs. The issue is now resolved by
>    allowing the use of SPI-specific offsets and reworking the logic


Looks very good now, thanks. Just one NIT and one question below ...

> 
> Changes in V4:
> - added missing RAZ and write ignore eSPI-specific registers ranges:
>    GICD_NSACRnE and GICD_IGRPMODRnE
> - changed previously reserved range to cover GICD_NSACRnE and
>    GICD_IGRPMODRnE
> - introduced GICD_RESERVED_RANGE<n>_START/END defines to remove
>    hardcoded values and reduce the number of ifdefs
> - fixed reserved ranges with eSPI option enabled: added missing range
>    0x0F30-0x0F7C
> - updated the logic for domains that do not support eSPI, but Xen is
>    compiled with the eSPI option. Now, prior to other MMIO checks, we
>    verify whether eSPI is available for the domain or not. If not, it
>    behaves as it does currently - RAZ and WI
> - fixed print for GICD_ICACTIVERnE
> - fixed new lines formatting for switch-case
> 
> Changes in V3:
> - changed vgic_store_irouter parameters - instead of offset virq is
>    used, to remove the additional bool espi parameter and simplify
>    checks. Also, adjusted parameters for regular SPI. Since the offset
>    parameter was used only for calculating virq number and then reused for
>    finding rank offset, it will not affect functionality.
> - fixed formatting for goto lables - added newlines after condition
> - fixed logs for GICD_ISACTIVERnE and GICD_ICACTIVERnE handlers
> - removed #ifdefs in 2 places where they were adjacent and could be merged
> 
> Changes in V2:
> - add missing rank index conversion for pending and inflight irqs
> ---
>   xen/arch/arm/include/asm/vgic.h |   4 +
>   xen/arch/arm/vgic-v3.c          | 198 ++++++++++++++++++++++++++------
>   xen/arch/arm/vgic.c             |  23 ++++
>   3 files changed, 192 insertions(+), 33 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgic.h
> index 3aa22114ba..103bc3c74b 100644
> --- a/xen/arch/arm/include/asm/vgic.h
> +++ b/xen/arch/arm/include/asm/vgic.h
> @@ -314,6 +314,10 @@ extern struct vgic_irq_rank *vgic_rank_offset(struct vcpu *v,
>                                                 unsigned int b,
>                                                 unsigned int n,
>                                                 unsigned int s);
> +extern struct vgic_irq_rank *vgic_ext_rank_offset(struct vcpu *v,
> +                                                  unsigned int b,
> +                                                  unsigned int n,
> +                                                  unsigned int s);
>   extern struct vgic_irq_rank *vgic_rank_irq(struct vcpu *v, unsigned int irq);
>   extern void vgic_disable_irqs(struct vcpu *v, uint32_t r, unsigned int n);
>   extern void vgic_enable_irqs(struct vcpu *v, uint32_t r, unsigned int n);
> diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
> index 4369c55177..b5d766c98f 100644
> --- a/xen/arch/arm/vgic-v3.c
> +++ b/xen/arch/arm/vgic-v3.c
> @@ -111,13 +111,10 @@ static uint64_t vgic_fetch_irouter(struct vgic_irq_rank *rank,
>    * Note the offset will be aligned to the appropriate boundary.
>    */
>   static void vgic_store_irouter(struct domain *d, struct vgic_irq_rank *rank,
> -                               unsigned int offset, uint64_t irouter)
> +                               unsigned int virq, uint64_t irouter)
>   {
>       struct vcpu *new_vcpu, *old_vcpu;
> -    unsigned int virq;
> -
> -    /* There is 1 vIRQ per IROUTER */
> -    virq = offset / NR_BYTES_PER_IROUTER;
> +    unsigned int offset;
>   
>       /*
>        * The IROUTER0-31, used for SGIs/PPIs, are reserved and should
> @@ -685,13 +682,20 @@ static int __vgic_v3_distr_common_mmio_read(const char *name, struct vcpu *v,
>       {
>       case VRANGE32(GICD_IGROUPR, GICD_IGROUPRN):
>       case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
> +    case VRANGE32(GICD_IGROUPRnE, GICD_IGROUPRnEN):
> +    case VRANGE32(GICD_IGRPMODRnE, GICD_IGRPMODRnEN):
>           /* We do not implement security extensions for guests, read zero */
>           if ( dabt.size != DABT_WORD ) goto bad_width;
>           goto read_as_zero;
>   
>       case VRANGE32(GICD_ISENABLER, GICD_ISENABLERN):
> +    case VRANGE32(GICD_ISENABLERnE, GICD_ISENABLERnEN):
>           if ( dabt.size != DABT_WORD ) goto bad_width;
> -        rank = vgic_rank_offset(v, 1, reg - GICD_ISENABLER, DABT_WORD);
> +        if ( reg >= GICD_ISENABLERnE )
> +            rank = vgic_ext_rank_offset(v, 1, reg - GICD_ISENABLERnE,
> +                                        DABT_WORD);
> +        else
> +            rank = vgic_rank_offset(v, 1, reg - GICD_ISENABLER, DABT_WORD);
>           if ( rank == NULL ) goto read_as_zero;
>           vgic_lock_rank(v, rank, flags);
>           *r = vreg_reg32_extract(rank->ienable, info);
> @@ -699,8 +703,13 @@ static int __vgic_v3_distr_common_mmio_read(const char *name, struct vcpu *v,
>           return 1;
>   
>       case VRANGE32(GICD_ICENABLER, GICD_ICENABLERN):
> +    case VRANGE32(GICD_ICENABLERnE, GICD_ICENABLERnEN):
>           if ( dabt.size != DABT_WORD ) goto bad_width;
> -        rank = vgic_rank_offset(v, 1, reg - GICD_ICENABLER, DABT_WORD);
> +        if ( reg >= GICD_ICENABLERnE )
> +            rank = vgic_ext_rank_offset(v, 1, reg - GICD_ICENABLERnE,
> +                                        DABT_WORD);
> +        else
> +            rank = vgic_rank_offset(v, 1, reg - GICD_ICENABLER, DABT_WORD);
>           if ( rank == NULL ) goto read_as_zero;
>           vgic_lock_rank(v, rank, flags);
>           *r = vreg_reg32_extract(rank->ienable, info);
> @@ -710,20 +719,29 @@ static int __vgic_v3_distr_common_mmio_read(const char *name, struct vcpu *v,
>       /* Read the pending status of an IRQ via GICD/GICR is not supported */
>       case VRANGE32(GICD_ISPENDR, GICD_ISPENDRN):
>       case VRANGE32(GICD_ICPENDR, GICD_ICPENDRN):
> +    case VRANGE32(GICD_ISPENDRnE, GICD_ISPENDRnEN):
> +    case VRANGE32(GICD_ICPENDRnE, GICD_ICPENDRnEN):
>           goto read_as_zero;
>   
>       /* Read the active status of an IRQ via GICD/GICR is not supported */
>       case VRANGE32(GICD_ISACTIVER, GICD_ISACTIVERN):
>       case VRANGE32(GICD_ICACTIVER, GICD_ICACTIVERN):
> +    case VRANGE32(GICD_ISACTIVERnE, GICD_ISACTIVERnEN):
> +    case VRANGE32(GICD_ICACTIVERnE, GICD_ICACTIVERnEN):
>           goto read_as_zero;
>   
>       case VRANGE32(GICD_IPRIORITYR, GICD_IPRIORITYRN):
> +    case VRANGE32(GICD_IPRIORITYRnE, GICD_IPRIORITYRnEN):
>       {
>           uint32_t ipriorityr;
>           uint8_t rank_index;
>   
>           if ( dabt.size != DABT_BYTE && dabt.size != DABT_WORD ) goto bad_width;
> -        rank = vgic_rank_offset(v, 8, reg - GICD_IPRIORITYR, DABT_WORD);
> +        if ( reg >= GICD_IPRIORITYRnE )
> +            rank = vgic_ext_rank_offset(v, 8, reg - GICD_IPRIORITYRnE,
> +                                        DABT_WORD);
> +        else
> +            rank = vgic_rank_offset(v, 8, reg - GICD_IPRIORITYR, DABT_WORD);
>           if ( rank == NULL ) goto read_as_zero;
>           rank_index = REG_RANK_INDEX(8, reg - GICD_IPRIORITYR, DABT_WORD);
>   
> @@ -737,11 +755,15 @@ static int __vgic_v3_distr_common_mmio_read(const char *name, struct vcpu *v,
>       }
>   
>       case VRANGE32(GICD_ICFGR, GICD_ICFGRN):
> +    case VRANGE32(GICD_ICFGRnE, GICD_ICFGRnEN):
>       {
>           uint32_t icfgr;
>   
>           if ( dabt.size != DABT_WORD ) goto bad_width;
> -        rank = vgic_rank_offset(v, 2, reg - GICD_ICFGR, DABT_WORD);
> +        if ( reg >= GICD_ICFGRnE )
> +            rank = vgic_ext_rank_offset(v, 2, reg - GICD_ICFGRnE, DABT_WORD);
> +        else
> +            rank = vgic_rank_offset(v, 2, reg - GICD_ICFGR, DABT_WORD);
>           if ( rank == NULL ) goto read_as_zero;
>           vgic_lock_rank(v, rank, flags);
>           icfgr = rank->icfg[REG_RANK_INDEX(2, reg - GICD_ICFGR, DABT_WORD)];
> @@ -782,46 +804,81 @@ static int __vgic_v3_distr_common_mmio_write(const char *name, struct vcpu *v,
>       {
>       case VRANGE32(GICD_IGROUPR, GICD_IGROUPRN):
>       case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
> +    case VRANGE32(GICD_IGROUPRnE, GICD_IGROUPRnEN):
> +    case VRANGE32(GICD_IGRPMODRnE, GICD_IGRPMODRnEN):
>           /* We do not implement security extensions for guests, write ignore */
>           goto write_ignore_32;
>   
>       case VRANGE32(GICD_ISENABLER, GICD_ISENABLERN):
> +    case VRANGE32(GICD_ISENABLERnE, GICD_ISENABLERnEN):
>           if ( dabt.size != DABT_WORD ) goto bad_width;
> -        rank = vgic_rank_offset(v, 1, reg - GICD_ISENABLER, DABT_WORD);
> +        if ( reg >= GICD_ISENABLERnE )
> +            rank = vgic_ext_rank_offset(v, 1, reg - GICD_ISENABLERnE,
> +                                        DABT_WORD);
> +        else
> +            rank = vgic_rank_offset(v, 1, reg - GICD_ISENABLER, DABT_WORD);
>           if ( rank == NULL ) goto write_ignore;
>           vgic_lock_rank(v, rank, flags);
>           tr = rank->ienable;
>           vreg_reg32_setbits(&rank->ienable, r, info);
> -        vgic_enable_irqs(v, (rank->ienable) & (~tr), rank->index);
> +        if ( reg >= GICD_ISENABLERnE )
> +            vgic_enable_irqs(v, (rank->ienable) & (~tr),
> +                             EXT_RANK_IDX2NUM(rank->index));
> +        else
> +            vgic_enable_irqs(v, (rank->ienable) & (~tr), rank->index);
>           vgic_unlock_rank(v, rank, flags);
>           return 1;
>   
>       case VRANGE32(GICD_ICENABLER, GICD_ICENABLERN):
> +    case VRANGE32(GICD_ICENABLERnE, GICD_ICENABLERnEN):
>           if ( dabt.size != DABT_WORD ) goto bad_width;
> -        rank = vgic_rank_offset(v, 1, reg - GICD_ICENABLER, DABT_WORD);
> +        if ( reg >= GICD_ICENABLERnE )
> +            rank = vgic_ext_rank_offset(v, 1, reg - GICD_ICENABLERnE,
> +                                        DABT_WORD);
> +        else
> +            rank = vgic_rank_offset(v, 1, reg - GICD_ICENABLER, DABT_WORD);
>           if ( rank == NULL ) goto write_ignore;
>           vgic_lock_rank(v, rank, flags);
>           tr = rank->ienable;
>           vreg_reg32_clearbits(&rank->ienable, r, info);
> -        vgic_disable_irqs(v, (~rank->ienable) & tr, rank->index);
> +        if ( reg >= GICD_ICENABLERnE )
> +            vgic_disable_irqs(v, (~rank->ienable) & tr,
> +                              EXT_RANK_IDX2NUM(rank->index));
> +        else
> +            vgic_disable_irqs(v, (~rank->ienable) & tr, rank->index);
>           vgic_unlock_rank(v, rank, flags);
>           return 1;
>   
>       case VRANGE32(GICD_ISPENDR, GICD_ISPENDRN):
> +    case VRANGE32(GICD_ISPENDRnE, GICD_ISPENDRnEN):
>           if ( dabt.size != DABT_WORD ) goto bad_width;
> -        rank = vgic_rank_offset(v, 1, reg - GICD_ISPENDR, DABT_WORD);
> +        if ( reg >= GICD_ISPENDRnE )
> +            rank = vgic_ext_rank_offset(v, 1, reg - GICD_ISPENDRnE, DABT_WORD);
> +        else
> +            rank = vgic_rank_offset(v, 1, reg - GICD_ISPENDR, DABT_WORD);
>           if ( rank == NULL ) goto write_ignore;
>   
> -        vgic_set_irqs_pending(v, r, rank->index);
> +        if ( reg >= GICD_ISPENDRnE )
> +            vgic_set_irqs_pending(v, r, EXT_RANK_IDX2NUM(rank->index));
> +        else
> +            vgic_set_irqs_pending(v, r, rank->index);
>   
>           return 1;
>   
>       case VRANGE32(GICD_ICPENDR, GICD_ICPENDRN):
> +    case VRANGE32(GICD_ICPENDRnE, GICD_ICPENDRnEN):
>           if ( dabt.size != DABT_WORD ) goto bad_width;
> -        rank = vgic_rank_offset(v, 1, reg - GICD_ICPENDR, DABT_WORD);
> +        if ( reg >= GICD_ICPENDRnE )
> +            rank = vgic_ext_rank_offset(v, 1, reg - GICD_ICPENDRnE, DABT_WORD);
> +        else
> +            rank = vgic_rank_offset(v, 1, reg - GICD_ICPENDR, DABT_WORD);
>           if ( rank == NULL ) goto write_ignore;
>   
> -        vgic_check_inflight_irqs_pending(v, rank->index, r);
> +        if ( reg >= GICD_ICPENDRnE )
> +            vgic_check_inflight_irqs_pending(v,
> +                                             EXT_RANK_IDX2NUM(rank->index), r);
> +        else
> +            vgic_check_inflight_irqs_pending(v, rank->index, r);
>   
>           goto write_ignore;
>   
> @@ -838,16 +895,38 @@ static int __vgic_v3_distr_common_mmio_write(const char *name, struct vcpu *v,
>                  v, name, r, reg - GICD_ICACTIVER);
>           goto write_ignore_32;
>   
> +    case VRANGE32(GICD_ISACTIVERnE, GICD_ISACTIVERnEN):
> +        if ( dabt.size != DABT_WORD )
> +            goto bad_width;
> +        printk(XENLOG_G_ERR
> +               "%pv: %s: unhandled word write %#"PRIregister" to ISACTIVER%dE\n",
> +               v, name, r, reg - GICD_ISACTIVERnE);
> +        return 0;
> +
> +    case VRANGE32(GICD_ICACTIVERnE, GICD_ICACTIVERnEN):
> +        printk(XENLOG_G_ERR
> +               "%pv: %s: unhandled word write %#"PRIregister" to ICACTIVER%dE\n",
> +               v, name, r, reg - GICD_ICACTIVERnE);
> +        goto write_ignore_32;


NIT: I would group with regular SPI ranges (taking into account that all 
other ranges were already grouped including the read accesses), 
something like that (non tested):

      case VRANGE32(GICD_ISACTIVER, GICD_ISACTIVERN):
+    case VRANGE32(GICD_ISACTIVERnE, GICD_ISACTIVERnEN):
          if ( dabt.size != DABT_WORD ) goto bad_width;
-        printk(XENLOG_G_ERR
-               "%pv: %s: unhandled word write %#"PRIregister" to 
ISACTIVER%d\n",
-               v, name, r, reg - GICD_ISACTIVER);
+        if ( reg >= GICD_ISACTIVERnE )
+            printk(XENLOG_G_ERR
+                   "%pv: %s: unhandled word write %#"PRIregister" to 
ISACTIVER%dE\n",
+                   v, name, r, reg - GICD_ISACTIVERnE);
+        else
+            printk(XENLOG_G_ERR
+                   "%pv: %s: unhandled word write %#"PRIregister" to 
ISACTIVER%d\n",
+                   v, name, r, reg - GICD_ISACTIVER);
          return 0;

      case VRANGE32(GICD_ICACTIVER, GICD_ICACTIVERN):
-        printk(XENLOG_G_ERR
-               "%pv: %s: unhandled word write %#"PRIregister" to 
ICACTIVER%d\n",
-               v, name, r, reg - GICD_ICACTIVER);
+    case VRANGE32(GICD_ICACTIVERnE, GICD_ICACTIVERnEN):
+        if ( reg >= GICD_ICACTIVERnE )
+            printk(XENLOG_G_ERR
+                   "%pv: %s: unhandled word write %#"PRIregister" to 
ICACTIVER%dE\n",
+                   v, name, r, reg - GICD_ICACTIVERnE);
+        else
+            printk(XENLOG_G_ERR
+                   "%pv: %s: unhandled word write %#"PRIregister" to 
ICACTIVER%d\n",
+                   v, name, r, reg - GICD_ICACTIVER);
          goto write_ignore_32;


> +
>       case VRANGE32(GICD_IPRIORITYR, GICD_IPRIORITYRN):
> +    case VRANGE32(GICD_IPRIORITYRnE, GICD_IPRIORITYRnEN):
>       {
> -        uint32_t *ipriorityr, priority;
> +        uint32_t *ipriorityr, priority, offset;
>   
>           if ( dabt.size != DABT_BYTE && dabt.size != DABT_WORD ) goto bad_width;
> -        rank = vgic_rank_offset(v, 8, reg - GICD_IPRIORITYR, DABT_WORD);
> +        if ( reg >= GICD_IPRIORITYRnE ) {
> +            offset = reg - GICD_IPRIORITYRnE;
> +            rank = vgic_ext_rank_offset(v, 8, offset, DABT_WORD);
> +        }
> +        else
> +        {
> +            offset = reg - GICD_IPRIORITYR;
> +            rank = vgic_rank_offset(v, 8, offset, DABT_WORD);
> +        }
>           if ( rank == NULL ) goto write_ignore;
>           vgic_lock_rank(v, rank, flags);
> -        ipriorityr = &rank->ipriorityr[REG_RANK_INDEX(8, reg - GICD_IPRIORITYR,
> -                                                      DABT_WORD)];
> +        ipriorityr = &rank->ipriorityr[REG_RANK_INDEX(8, offset, DABT_WORD)];

Here


>           priority = ACCESS_ONCE(*ipriorityr);
>           vreg_reg32_update(&priority, r, info);
>           ACCESS_ONCE(*ipriorityr) = priority;
> @@ -859,10 +938,14 @@ static int __vgic_v3_distr_common_mmio_write(const char *name, struct vcpu *v,
>           goto write_ignore_32;
>   
>       case VRANGE32(GICD_ICFGR + 4, GICD_ICFGRN): /* PPI + SPIs */
> +    case VRANGE32(GICD_ICFGRnE, GICD_ICFGRnEN):
>           /* ICFGR1 for PPI's, which is implementation defined
>              if ICFGR1 is programmable or not. We chose to program */
>           if ( dabt.size != DABT_WORD ) goto bad_width;
> -        rank = vgic_rank_offset(v, 2, reg - GICD_ICFGR, DABT_WORD);
> +        if ( reg >= GICD_ICFGRnE )
> +            rank = vgic_ext_rank_offset(v, 2, reg - GICD_ICFGRnE, DABT_WORD);
> +        else
> +            rank = vgic_rank_offset(v, 2, reg - GICD_ICFGR, DABT_WORD);
>           if ( rank == NULL ) goto write_ignore;
>           vgic_lock_rank(v, rank, flags);
>           vreg_reg32_update(&rank->icfg[REG_RANK_INDEX(2, reg - GICD_ICFGR,
> @@ -1129,6 +1212,16 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v, mmio_info_t *info,
>               typer |= GICD_TYPE_LPIS;
>   
>           typer |= (v->domain->arch.vgic.intid_bits - 1) << GICD_TYPE_ID_BITS_SHIFT;
> +#ifdef CONFIG_GICV3_ESPI
> +        if ( v->domain->arch.vgic.nr_espis > 0 )
> +        {
> +            /* Set eSPI support bit for the domain */
> +            typer |= GICD_TYPER_ESPI;
> +            /* Set ESPI range bits */
> +            typer |= (DIV_ROUND_UP(v->domain->arch.vgic.nr_espis, 32) - 1)
> +                       << GICD_TYPER_ESPI_RANGE_SHIFT;
> +        }
> +#endif
>   
>           *r = vreg_reg32_extract(typer, info);
>   
> @@ -1194,6 +1287,16 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v, mmio_info_t *info,
>       case VRANGE32(GICD_IPRIORITYR, GICD_IPRIORITYRN):
>       case VRANGE32(GICD_ICFGR, GICD_ICFGRN):
>       case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
> +    case VRANGE32(GICD_IGROUPRnE, GICD_IGROUPRnEN):
> +    case VRANGE32(GICD_ISENABLERnE, GICD_ISENABLERnEN):
> +    case VRANGE32(GICD_ICENABLERnE, GICD_ICENABLERnEN):
> +    case VRANGE32(GICD_ISPENDRnE, GICD_ISPENDRnEN):
> +    case VRANGE32(GICD_ICPENDRnE, GICD_ICPENDRnEN):
> +    case VRANGE32(GICD_ISACTIVERnE, GICD_ISACTIVERnEN):
> +    case VRANGE32(GICD_ICACTIVERnE, GICD_ICACTIVERnEN):
> +    case VRANGE32(GICD_IPRIORITYRnE, GICD_IPRIORITYRnEN):
> +    case VRANGE32(GICD_ICFGRnE, GICD_ICFGRnEN):
> +    case VRANGE32(GICD_IGRPMODRnE, GICD_IGRPMODRnEN):
>           /*
>            * Above all register are common with GICR and GICD
>            * Manage in common
> @@ -1201,6 +1304,7 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v, mmio_info_t *info,
>           return __vgic_v3_distr_common_mmio_read("vGICD", v, info, gicd_reg, r);
>   
>       case VRANGE32(GICD_NSACR, GICD_NSACRN):
> +    case VRANGE32(GICD_NSACRnE, GICD_NSACRnEN):
>           /* We do not implement security extensions for guests, read zero */
>           goto read_as_zero_32;
>   
> @@ -1216,16 +1320,21 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v, mmio_info_t *info,
>           /* Replaced with GICR_ISPENDR0. So ignore write */
>           goto read_as_zero_32;
>   
> -    case VRANGE32(0x0F30, 0x60FC):
> +    case VRANGE32(0x0F30, 0x0FFC):
>           goto read_reserved;
>   
>       case VRANGE64(GICD_IROUTER32, GICD_IROUTER1019):
> +    case VRANGE64(GICD_IROUTERnE, GICD_IROUTERnEN):
>       {
>           uint64_t irouter;
>   
>           if ( !vgic_reg64_check_access(dabt) ) goto bad_width;
> -        rank = vgic_rank_offset(v, 64, gicd_reg - GICD_IROUTER,
> -                                DABT_DOUBLE_WORD);
> +        if ( gicd_reg >= GICD_IROUTERnE )
> +            rank = vgic_ext_rank_offset(v, 64, gicd_reg - GICD_IROUTERnE,
> +                                        DABT_DOUBLE_WORD);
> +        else
> +            rank = vgic_rank_offset(v, 64, gicd_reg - GICD_IROUTER,
> +                                    DABT_DOUBLE_WORD);
>           if ( rank == NULL ) goto read_as_zero;
>           vgic_lock_rank(v, rank, flags);
>           irouter = vgic_fetch_irouter(rank, gicd_reg - GICD_IROUTER);

Here you use the same offset for regular and extended SPI ranges 
(gicd_reg - GICD_IROUTER) ...


> @@ -1235,8 +1344,8 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v, mmio_info_t *info,
>   
>           return 1;
>       }
> -
> -    case VRANGE32(0x7FE0, 0xBFFC):
> +    case VRANGE32(0x3700, 0x60FC):
> +    case VRANGE32(0xA004, 0xBFFC):
>           goto read_reserved;
>   
>       case VRANGE32(0xC000, 0xFFCC):
> @@ -1382,12 +1491,23 @@ static int vgic_v3_distr_mmio_write(struct vcpu *v, mmio_info_t *info,
>       case VRANGE32(GICD_IPRIORITYR, GICD_IPRIORITYRN):
>       case VRANGE32(GICD_ICFGR, GICD_ICFGRN):
>       case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
> +    case VRANGE32(GICD_IGROUPRnE, GICD_IGROUPRnEN):
> +    case VRANGE32(GICD_ISENABLERnE, GICD_ISENABLERnEN):
> +    case VRANGE32(GICD_ICENABLERnE, GICD_ICENABLERnEN):
> +    case VRANGE32(GICD_ISPENDRnE, GICD_ISPENDRnEN):
> +    case VRANGE32(GICD_ICPENDRnE, GICD_ICPENDRnEN):
> +    case VRANGE32(GICD_ISACTIVERnE, GICD_ISACTIVERnEN):
> +    case VRANGE32(GICD_ICACTIVERnE, GICD_ICACTIVERnEN):
> +    case VRANGE32(GICD_IPRIORITYRnE, GICD_IPRIORITYRnEN):
> +    case VRANGE32(GICD_ICFGRnE, GICD_ICFGRnEN):
> +    case VRANGE32(GICD_IGRPMODRnE, GICD_IGRPMODRnEN):
>           /* Above registers are common with GICR and GICD
>            * Manage in common */
>           return __vgic_v3_distr_common_mmio_write("vGICD", v, info,
>                                                    gicd_reg, r);
>   
>       case VRANGE32(GICD_NSACR, GICD_NSACRN):
> +    case VRANGE32(GICD_NSACRnE, GICD_NSACRnEN):
>           /* We do not implement security extensions for guests, write ignore */
>           goto write_ignore_32;
>   
> @@ -1405,26 +1525,38 @@ static int vgic_v3_distr_mmio_write(struct vcpu *v, mmio_info_t *info,
>           if ( dabt.size != DABT_WORD ) goto bad_width;
>           return 0;
>   
> -    case VRANGE32(0x0F30, 0x60FC):
> +    case VRANGE32(0x0F30, 0x0FFC):
>           goto write_reserved;
>   
>       case VRANGE64(GICD_IROUTER32, GICD_IROUTER1019):
> +    case VRANGE64(GICD_IROUTERnE, GICD_IROUTERnEN):
>       {
>           uint64_t irouter;
> +        unsigned int offset, virq;
>   
>           if ( !vgic_reg64_check_access(dabt) ) goto bad_width;
> -        rank = vgic_rank_offset(v, 64, gicd_reg - GICD_IROUTER,
> -                                DABT_DOUBLE_WORD);
> +        if ( gicd_reg >= GICD_IROUTERnE ) {
> +            offset = gicd_reg - GICD_IROUTERnE;
> +            rank = vgic_ext_rank_offset(v, 64, offset, DABT_DOUBLE_WORD);
> +        } else {
> +            offset = gicd_reg - GICD_IROUTER;
> +            rank = vgic_rank_offset(v, 64, offset, DABT_DOUBLE_WORD);
> +        }
>           if ( rank == NULL ) goto write_ignore;
>           vgic_lock_rank(v, rank, flags);
> -        irouter = vgic_fetch_irouter(rank, gicd_reg - GICD_IROUTER);
> +        irouter = vgic_fetch_irouter(rank, offset);

  ... But here you use different offsets for regular and extended SPI 
ranges (gicd_reg - GICD_IROUTER vs gicd_reg - GICD_IROUTERnE). Could you 
please clarify why (what did I miss)?


>           vreg_reg64_update(&irouter, r, info);
> -        vgic_store_irouter(v->domain, rank, gicd_reg - GICD_IROUTER, irouter);
> +        if ( gicd_reg >= GICD_IROUTERnE )
> +            virq = ESPI_IDX2INTID(offset / NR_BYTES_PER_IROUTER);
> +        else
> +            virq = offset / NR_BYTES_PER_IROUTER;
> +        vgic_store_irouter(v->domain, rank, virq, irouter);
>           vgic_unlock_rank(v, rank, flags);
>           return 1;
>       }
>   
> -    case VRANGE32(0x7FE0, 0xBFFC):
> +    case VRANGE32(0x3700, 0x60FC):
> +    case VRANGE32(0xA004, 0xBFFC):
>           goto write_reserved;
>   
>       case VRANGE32(0xC000, 0xFFCC):
> diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
> index c9b9528c66..27ffdf316c 100644
> --- a/xen/arch/arm/vgic.c
> +++ b/xen/arch/arm/vgic.c
> @@ -193,6 +193,18 @@ int domain_vgic_register(struct domain *d, unsigned int *mmio_count)
>   }
>   
>   #ifdef CONFIG_GICV3_ESPI
> +/*
> + * The function behavior is the same as for regular SPIs (vgic_rank_offset),
> + * but it operates with extended SPI ranks.
> + */
> +struct vgic_irq_rank *vgic_ext_rank_offset(struct vcpu *v, unsigned int b,
> +                                           unsigned int n, unsigned int s)
> +{
> +    unsigned int rank = REG_RANK_NR(b, (n >> s));
> +
> +    return vgic_get_rank(v, rank + EXT_RANK_MIN);
> +}
> +
>   static unsigned int vgic_num_spi_lines(struct domain *d)
>   {
>       return d->arch.vgic.nr_spis + d->arch.vgic.nr_espis;
> @@ -241,6 +253,17 @@ struct pending_irq *espi_to_pending(struct domain *d, unsigned int irq)
>   {
>       return NULL;
>   }
> +
> +/*
> + * It is expected that, in the case of CONFIG_GICV3_ESPI=n, the function will
> + * return NULL. In this scenario, mmio_read/mmio_write will be treated as
> + * RAZ/WI, as expected.
> + */
> +struct vgic_irq_rank *vgic_ext_rank_offset(struct vcpu *v, unsigned int b,
> +                                           unsigned int n, unsigned int s)
> +{
> +    return NULL;
> +}
>   #endif
>   
>   static unsigned int vgic_num_alloc_irqs(struct domain *d)


