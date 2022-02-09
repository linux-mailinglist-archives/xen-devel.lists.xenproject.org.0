Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1390B4AE64F
	for <lists+xen-devel@lfdr.de>; Wed,  9 Feb 2022 02:30:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268743.462689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHbnQ-0003Uk-Nv; Wed, 09 Feb 2022 01:29:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268743.462689; Wed, 09 Feb 2022 01:29:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHbnQ-0003S6-JJ; Wed, 09 Feb 2022 01:29:24 +0000
Received: by outflank-mailman (input) for mailman id 268743;
 Wed, 09 Feb 2022 01:29:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c0q/=SY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nHbnO-0003S0-Rr
 for xen-devel@lists.xenproject.org; Wed, 09 Feb 2022 01:29:22 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b41905c7-8947-11ec-8eb8-a37418f5ba1a;
 Wed, 09 Feb 2022 02:29:21 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 90BB2B81DFB;
 Wed,  9 Feb 2022 01:29:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8774C004E1;
 Wed,  9 Feb 2022 01:29:17 +0000 (UTC)
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
X-Inumbo-ID: b41905c7-8947-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644370158;
	bh=AzbPld7VgTSAOJC6/t+aJBT5ygQ1s5ec8szITG8qizQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qe0kzPk1cYxiVDI0dH7Sp0wfBurJQcaPiflkrPQ4JgYICOj1m7t1ochWiELoQJQy8
	 KdpUgCAblHL7CzTwhFxYOd5Qppv9UUCIB8/yMvKQXTWQdofNKeGxdroBETU1JTEMK/
	 tuEDYKpFc5mzZ1rb+kG06UlwTo2kE+TNE/HfXwQUF7vGyDgQds+qwnMO0aIJHm7LJO
	 OOzLfLaXpMvC2aEN7qI9237NPsQ8E/ej7+2PJSqIL1M6xsXO8ux3Fsvx3Wgp5ETJBl
	 3vBFwW2zpIRsZfU4HxyvZ2wxG1PlReMk0eLYIjFglTrDIgx5/CZjRB7ocNPgsMx4i3
	 z4lT/MBVXwvbw==
Date: Tue, 8 Feb 2022 17:29:17 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
cc: xen-devel@lists.xenproject.org, ayankuma@xilinx.com, 
    sstabellini@kernel.org, stefanos@xilinx.com, julien@xen.org, 
    Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
Subject: Re: [XEN v7 1/2] xen/arm64: Decode ldr/str post increment
 operations
In-Reply-To: <20220205225816.5952-2-ayankuma@xilinx.com>
Message-ID: <alpine.DEB.2.22.394.2202081725170.2091381@ubuntu-linux-20-04-desktop>
References: <20220205225816.5952-1-ayankuma@xilinx.com> <20220205225816.5952-2-ayankuma@xilinx.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 5 Feb 2022, Ayan Kumar Halder wrote:
> At the moment, Xen does not decode any of the arm64 instructions. This
> means that hsr_dabt.isv = 0, Xen cannot handle those instructions. This
> will lead to Xen abort the guests (from which those instructions
> originated).
> 
> With this patch, Xen is able to decode ldr/str post indexing instructions.
> These are a subset of instructions for which hsr_dabt.isv = 0
> 
> The following instructions are now supported by Xen :-
> 1.      ldr     x2,    [x1],    #8
> 2.      ldr     w2,    [x1],    #-4
> 3.      ldr     x2,    [x1],    #-8
> 4.      ldr     w2,    [x1],    #4
> 5.      ldrh    w2,    [x1],    #2
> 6.      ldrb    w2,    [x1],    #1
> 7.      str     x2,    [x1],    #8
> 8.      str     w2,    [x1],    #-4
> 9.      strh    w2,    [x1],    #2
> 10.     strb    w2,    [x1],    #1
> 
> In the subsequent patches, decode_arm64() will get invoked when
> hsr_dabt.isv=0.
> 
> Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>

This patch looks good to me. Only minor comments below.


> ---
> 
> Changelog :-
> 
> v2..v5 - Mentioned in the cover letter.
> 
> v6 - 1. Fixed the code style issues as mentioned in v5.
> 
> v7 - No change.
> 
>  xen/arch/arm/decode.c           | 80 ++++++++++++++++++++++++++++++++-
>  xen/arch/arm/decode.h           | 49 +++++++++++++++++---
>  xen/arch/arm/include/asm/mmio.h |  4 ++
>  xen/arch/arm/io.c               |  2 +-
>  4 files changed, 125 insertions(+), 10 deletions(-)
> 
> diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
> index 792c2e92a7..3f2d2a3f62 100644
> --- a/xen/arch/arm/decode.c
> +++ b/xen/arch/arm/decode.c
> @@ -23,6 +23,7 @@
>  #include <xen/types.h>
>  
>  #include <asm/current.h>
> +#include <asm/mmio.h>

it doesn't look like this is needed


>  #include "decode.h"
>  
> @@ -84,6 +85,78 @@ bad_thumb2:
>      return 1;
>  }
>  
> +static int decode_arm64(register_t pc, mmio_info_t *info)
> +{
> +    union instr opcode = {0};
> +    struct hsr_dabt *dabt = &info->dabt;
> +    struct instr_details *dabt_instr = &info->dabt_instr;
> +
> +    if ( raw_copy_from_guest(&opcode.value, (void * __user)pc, sizeof (opcode)) )
> +    {
> +        gprintk(XENLOG_ERR, "Could not copy the instruction from PC\n");
> +        goto bad_loadstore;

this should just return 1 (no need to print the other error message
after the label bad_loadstore).


> +    }
> +
> +    /*
> +     * Refer Arm v8 ARM DDI 0487G.b, Page - C6-1107
> +     * "Shared decode for all encodings" (under ldr immediate)
> +     * If n == t && n != 31, then the return value is implementation defined
> +     * (can be WBSUPPRESS, UNKNOWN, UNDEFINED or NOP). Thus, we do not support
> +     * this. This holds true for ldrb/ldrh immediate as well.
> +     *
> +     * Also refer, Page - C6-1384, the above described behaviour is same for
> +     * str immediate. This holds true for strb/strh immediate as well
> +     */
> +    if ( (opcode.ldr_str.rn == opcode.ldr_str.rt) && (opcode.ldr_str.rn != 31) )
> +    {
> +        gprintk(XENLOG_ERR, "Rn should not be equal to Rt except for r31\n");
> +        goto bad_loadstore;
> +    }
> +
> +    /* First, let's check for the fixed values */
> +    if ( (opcode.value & POST_INDEX_FIXED_MASK) != POST_INDEX_FIXED_VALUE )
> +    {
> +        gprintk(XENLOG_ERR,
> +                "Decoding instruction 0x%x is not supported", opcode.value);
> +        goto bad_loadstore;
> +    }
> +
> +    if ( opcode.ldr_str.v != 0 )
> +    {
> +        gprintk(XENLOG_ERR,
> +                "ldr/str post indexing for vector types are not supported\n");
> +        goto bad_loadstore;
> +    }
> +
> +    /* Check for STR (immediate) */
> +    if ( opcode.ldr_str.opc == 0 )
> +        dabt->write = 1;
> +    /* Check for LDR (immediate) */
> +    else if ( opcode.ldr_str.opc == 1 )
> +        dabt->write = 0;
> +    else
> +    {
> +        gprintk(XENLOG_ERR,
> +                "Decoding ldr/str post indexing is not supported for this variant\n");
> +        goto bad_loadstore;
> +    }
> +
> +    gprintk(XENLOG_INFO,
> +            "opcode->ldr_str.rt = 0x%x, opcode->ldr_str.size = 0x%x, opcode->ldr_str.imm9 = %d\n",
> +            opcode.ldr_str.rt, opcode.ldr_str.size, opcode.ldr_str.imm9);
> +
> +    update_dabt(dabt, opcode.ldr_str.rt, opcode.ldr_str.size, false);
> +
> +    dabt_instr->rn = opcode.ldr_str.rn;
> +    dabt_instr->imm9 = opcode.ldr_str.imm9;
> +
> +    return 0;
> +
> + bad_loadstore:
> +    gprintk(XENLOG_ERR, "unhandled Arm instruction 0x%x\n", opcode.value);
> +    return 1;
> +}
> +
>  static int decode_thumb(register_t pc, struct hsr_dabt *dabt)
>  {
>      uint16_t instr;
> @@ -150,10 +223,13 @@ bad_thumb:
>      return 1;
>  }
>  
> -int decode_instruction(const struct cpu_user_regs *regs, struct hsr_dabt *dabt)
> +int decode_instruction(const struct cpu_user_regs *regs, mmio_info_t *info)
>  {
>      if ( is_32bit_domain(current->domain) && regs->cpsr & PSR_THUMB )
> -        return decode_thumb(regs->pc, dabt);
> +        return decode_thumb(regs->pc, &info->dabt);
> +
> +    if ( !psr_mode_is_32bit(regs) )
> +        return decode_arm64(regs->pc, info);
>  
>      /* TODO: Handle ARM instruction */
>      gprintk(XENLOG_ERR, "unhandled ARM instruction\n");
> diff --git a/xen/arch/arm/decode.h b/xen/arch/arm/decode.h
> index 4613763bdb..fe7512a053 100644
> --- a/xen/arch/arm/decode.h
> +++ b/xen/arch/arm/decode.h
> @@ -23,19 +23,54 @@
>  #include <asm/regs.h>
>  #include <asm/processor.h>
>  
> -/**
> - * Decode an instruction from pc
> - * /!\ This function is not intended to fully decode an instruction. It
> - * considers that the instruction is valid.
> +/*
> + * Refer to the ARMv8 ARM (DDI 0487G.b), Section C4.1.4 Loads and Stores
> + * Page 318 specifies the following bit pattern for
> + * "load/store register (immediate post-indexed)".
> + *
> + * 31 30 29  27 26 25  23   21 20              11   9         4       0
> + * ___________________________________________________________________
> + * |size|1 1 1 |V |0 0 |opc |0 |      imm9     |0 1 |  Rn     |  Rt   |
> + * |____|______|__|____|____|__|_______________|____|_________|_______|
> + */
> +union instr {
> +    uint32_t value;
> +    struct {
> +        unsigned int rt:5;     /* Rt register */
> +        unsigned int rn:5;     /* Rn register */
> +        unsigned int fixed1:2; /* value == 01b */
> +        signed int imm9:9;            /* imm9 */
> +        unsigned int fixed2:1; /* value == 0b */
> +        unsigned int opc:2;    /* opc */
> +        unsigned int fixed3:2; /* value == 00b */
> +        unsigned int v:1;      /* vector */
> +        unsigned int fixed4:3; /* value == 111b */
> +        unsigned int size:2;   /* size */
> +    } ldr_str;
> +};
> +
> +#define POST_INDEX_FIXED_MASK   0x3B200C00
> +#define POST_INDEX_FIXED_VALUE  0x38000400
> +
> +/* Decode an instruction from pc

code style:

/*
 * Decode an instruction from pc


> + * /!\ This function is intended to decode an instruction. It considers that the
> + * instruction is valid.
>   *
> - * This function will get:
> - *  - The transfer register
> + * In case of thumb mode, this function will get:
> + *  - The transfer register (ie Rt)
>   *  - Sign bit
>   *  - Size
> + *
> + * In case of arm64 mode, this function will get:
> + * - The transfer register (ie Rt)
> + * - The source register (ie Rn)
> + * - Size
> + * - Immediate offset
> + * - Read or write
>   */
>  
>  int decode_instruction(const struct cpu_user_regs *regs,
> -                       struct hsr_dabt *dabt);
> +                       mmio_info_t *info);
>  
>  #endif /* __ARCH_ARM_DECODE_H_ */
>  
> diff --git a/xen/arch/arm/include/asm/mmio.h b/xen/arch/arm/include/asm/mmio.h
> index 7ab873cb8f..3354d9c635 100644
> --- a/xen/arch/arm/include/asm/mmio.h
> +++ b/xen/arch/arm/include/asm/mmio.h
> @@ -29,6 +29,10 @@
>  typedef struct
>  {
>      struct hsr_dabt dabt;
> +    struct instr_details {
> +        unsigned long rn:5;
> +        signed int imm9:9;
> +    } dabt_instr;
>      paddr_t gpa;
>  } mmio_info_t;
>  
> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
> index 729287e37c..a289d393f9 100644
> --- a/xen/arch/arm/io.c
> +++ b/xen/arch/arm/io.c
> @@ -134,7 +134,7 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>      {
>          int rc;
>  
> -        rc = decode_instruction(regs, &info.dabt);
> +        rc = decode_instruction(regs, &info);
>          if ( rc )
>          {
>              gprintk(XENLOG_DEBUG, "Unable to decode instruction\n");
> -- 
> 2.17.1
> 

