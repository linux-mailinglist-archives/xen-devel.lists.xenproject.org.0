Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 454C74CD266
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 11:30:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284151.483332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ5BF-0005hr-Ou; Fri, 04 Mar 2022 10:29:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284151.483332; Fri, 04 Mar 2022 10:29:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ5BF-0005g4-LI; Fri, 04 Mar 2022 10:29:01 +0000
Received: by outflank-mailman (input) for mailman id 284151;
 Fri, 04 Mar 2022 10:29:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nQ5BE-0005fy-HJ
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 10:29:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nQ5BD-0007jz-SL; Fri, 04 Mar 2022 10:28:59 +0000
Received: from [54.239.6.187] (helo=[192.168.25.28])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nQ5BD-0004jP-LB; Fri, 04 Mar 2022 10:28:59 +0000
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
	bh=g2tV0PRGymFXbypaqKS4sgHZ2GxeiwIPRGRA0O8a4AU=; b=SgM1bYyjowl9dR+nmCUX38fxHM
	WIp0rm9ff1Xcti+SugAyp9r0ZqeI3Ma9+Fl3nrppPqsTFT7wKzrctZFD9uBDtu4OSuuVttJQbyGli
	Dwpw+FWouLRKbk/lW4djbSkzftaPa1HhJ93I0OrTsHuSFqniyBRSHcyW2B44BlErNBP4=;
Message-ID: <d41241f9-de9d-e681-2768-d44531722069@xen.org>
Date: Fri, 4 Mar 2022 10:28:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [XEN v9 2/4] xen/arm64: io: Support instructions (for which ISS
 is not valid) on emulated MMIO region using MMIO/ioreq handler
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, andrew.cooper3@citrix.com,
 george.dunlap@citrix.com, jbeulich@suse.com, wl@xen.org, paul@xen.org,
 roger.pau@citrix.com, Ayan Kumar Halder <ayankuma@xilinx.com>
References: <20220301124022.10168-1-ayankuma@xilinx.com>
 <20220301124022.10168-3-ayankuma@xilinx.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220301124022.10168-3-ayankuma@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 01/03/2022 12:40, Ayan Kumar Halder wrote:
> +void post_increment_register(const struct instr_details *instr)
> +{
> +    struct cpu_user_regs *regs = guest_cpu_user_regs();
> +    register_t val = 0;
> +
> +    /* Currently, we handle only ldr/str post indexing instructions */
> +    if ( instr->state != INSTR_LDR_STR_POSTINDEXING )
> +        return;
> +
> +    /*
> +     * Handle when rn = SP
> +     * Refer ArmV8 ARM DDI 0487G.b, Page - D1-2463 "Stack pointer register
> +     * selection"
> +     * t = SP_EL0
> +     * h = SP_ELx
> +     * and M[3:0] (Page - C5-474 "When exception taken from AArch64 state:")
> +     */
> +    if (instr->rn == 31 )
> +    {
> +        if ( (regs->cpsr & PSR_MODE_MASK) == PSR_MODE_EL1h )
> +            val = regs->sp_el1;
> +        else if ( ((regs->cpsr & PSR_MODE_MASK) == PSR_MODE_EL1t) ||
> +                    ((regs->cpsr & PSR_MODE_MASK) == PSR_MODE_EL0t) )

You are using 3 times regs->cpsr & PSR_MODE_MASK. Can you introduce a 
temporary variable?

Alternatively, a switch could be used here.

[...]

> diff --git a/xen/arch/arm/include/asm/mmio.h b/xen/arch/arm/include/asm/mmio.h
> index 3354d9c635..ef2c57a2d5 100644
> --- a/xen/arch/arm/include/asm/mmio.h
> +++ b/xen/arch/arm/include/asm/mmio.h
> @@ -26,12 +26,24 @@
>   
>   #define MAX_IO_HANDLER  16
>   
> +enum instr_decode_state
> +{
> +    INSTR_ERROR,                    /* Error encountered while decoding instr */
> +    INSTR_VALID,                    /* ISS is valid, so no need to decode */
> +    /*
> +     * Instruction is decoded successfully. It is a ldr/str post indexing
> +     * instruction.
> +     */
> +    INSTR_LDR_STR_POSTINDEXING

NIT: Please add ',' even for the last item. This would reduce the diff 
if we add new one.

> +};
> +
>   typedef struct
>   {
>       struct hsr_dabt dabt;
>       struct instr_details {
>           unsigned long rn:5;
>           signed int imm9:9;
> +        enum instr_decode_state state;
>       } dabt_instr;
>       paddr_t gpa;
>   } mmio_info_t;
> @@ -69,14 +81,15 @@ struct vmmio {
>   };
>   
>   enum io_state try_handle_mmio(struct cpu_user_regs *regs,
> -                              const union hsr hsr,
> -                              paddr_t gpa);
> +                              mmio_info_t *info);
>   void register_mmio_handler(struct domain *d,
>                              const struct mmio_handler_ops *ops,
>                              paddr_t addr, paddr_t size, void *priv);
>   int domain_io_init(struct domain *d, int max_count);
>   void domain_io_free(struct domain *d);
>   
> +void try_decode_instruction(const struct cpu_user_regs *regs,
> +                            mmio_info_t *info);
>   
>   #endif  /* __ASM_ARM_MMIO_H__ */
>   
> diff --git a/xen/arch/arm/include/asm/traps.h b/xen/arch/arm/include/asm/traps.h
> index 2ed2b85c6f..95c46ad391 100644
> --- a/xen/arch/arm/include/asm/traps.h
> +++ b/xen/arch/arm/include/asm/traps.h
> @@ -109,6 +109,8 @@ static inline register_t sign_extend(const struct hsr_dabt dabt, register_t r)
>       return r;
>   }
>   
> +void post_increment_register(const struct instr_details *instr);
> +
>   #endif /* __ASM_ARM_TRAPS__ */
>   /*
>    * Local variables:
> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
> index fad103bdbd..bea69ffb08 100644
> --- a/xen/arch/arm/io.c
> +++ b/xen/arch/arm/io.c
> @@ -102,57 +102,79 @@ static const struct mmio_handler *find_mmio_handler(struct domain *d,
>       return handler;
>   }
>   
> +void try_decode_instruction(const struct cpu_user_regs *regs,
> +                            mmio_info_t *info)
> +{
> +    int rc;
> +
> +    if ( info->dabt.valid )
> +    {
> +        info->dabt_instr.state = INSTR_VALID;
> +
> +        /*
> +         * Erratum 766422: Thumb store translation fault to Hypervisor may
> +         * not have correct HSR Rt value.
> +         */
> +        if ( check_workaround_766422() && (regs->cpsr & PSR_THUMB) &&
> +             info->dabt.write )

This change is not explained in the commit message. TBH, I think it 
should be separate but I am not going to request that at v9.

> +        {
> +            rc = decode_instruction(regs, info);
> +            if ( rc )
> +            {
> +                gprintk(XENLOG_DEBUG, "Unable to decode instruction\n");
> +                info->dabt_instr.state = INSTR_ERROR;
> +        }
> +        return;
> +    }
> +
> +    /*
> +     * Armv8 processor does not provide a valid syndrome for decoding some
> +     * instructions. So in order to process these instructions, Xen must
> +     * decode them.
> +     */
> +    rc = decode_instruction(regs, info);
> +    if ( rc )
> +    {
> +        gprintk(XENLOG_ERR, "Unable to decode instruction\n");
> +        info->dabt_instr.state = INSTR_ERROR;
> +    }
> +}
> +
>   enum io_state try_handle_mmio(struct cpu_user_regs *regs,
> -                              const union hsr hsr,
> -                              paddr_t gpa)
> +                              mmio_info_t *info)
>   {
>       struct vcpu *v = current;
>       const struct mmio_handler *handler = NULL;
> -    const struct hsr_dabt dabt = hsr.dabt;
> -    mmio_info_t info = {
> -        .gpa = gpa,
> -        .dabt = dabt
> -    };
> +    int rc;
>   
> -    ASSERT(hsr.ec == HSR_EC_DATA_ABORT_LOWER_EL);
> +    ASSERT(info->dabt.ec == HSR_EC_DATA_ABORT_LOWER_EL);
>   
> -    handler = find_mmio_handler(v->domain, info.gpa);
> -    if ( !handler )
> +    if ( !((info->dabt_instr.state == INSTR_VALID) || (info->dabt_instr.state == INSTR_LDR_STR_POSTINDEXING)) )

This check will become quite large if we decode more class. I would 
instead set the dabt.valid bit whenever we successfully decoded the 
instruction and check that if dabt.valid here.

>       {
> -        int rc;
> +        ASSERT_UNREACHABLE();
> +        return IO_ABORT;
> +    }

[...]

> @@ -1982,21 +2030,18 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
>               case IO_UNHANDLED:
>                   /* IO unhandled, try another way to handle it. */
>                   break;
> -            }
>           }
>   
>           /*
> -         * First check if the translation fault can be resolved by the
> -         * P2M subsystem. If that's the case nothing else to do.
> +         * If the instruction syndrome was invalid, then we already checked if
> +         * this was due to a P2M fault. So no point to check again as the result
> +         * will be the same.
>            */
> -        if ( p2m_resolve_translation_fault(current->domain,
> -                                           gaddr_to_gfn(gpa)) )
> -            return;
> -
> -        if ( is_data && try_map_mmio(gaddr_to_gfn(gpa)) )
> +        if ( info.dabt.valid && check_p2m(is_data, gpa) )

This check would need to be adjusted to check the instruction state is 
INSTR_VALID.

Cheers,

-- 
Julien Grall

