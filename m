Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 558854D57C4
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 02:56:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288635.489508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSUUe-00029a-O1; Fri, 11 Mar 2022 01:55:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288635.489508; Fri, 11 Mar 2022 01:55:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSUUe-00027f-IV; Fri, 11 Mar 2022 01:55:00 +0000
Received: by outflank-mailman (input) for mailman id 288635;
 Fri, 11 Mar 2022 01:54:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8RDm=TW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nSUUc-00027X-Ra
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 01:54:58 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e00fd4f-a0de-11ec-853a-5f4723681683;
 Fri, 11 Mar 2022 02:54:55 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id BEADBCE26E4;
 Fri, 11 Mar 2022 01:54:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A3A7C340E8;
 Fri, 11 Mar 2022 01:54:46 +0000 (UTC)
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
X-Inumbo-ID: 3e00fd4f-a0de-11ec-853a-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646963687;
	bh=Vp7eqyHq8TCWGeGwv1NmbBeghan1MnKK0nA5j+35Yu8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=C1WoB5iopCoqc4IbxZIRxG9aQ/aG3qWI18+BrgKUhgjKagR4xh7eEWaWWseHJA4dS
	 IqibHDVvZLERf/y3h8Yqdn5lPAAZ4JT79F71dwoQ/MFm0R2cmxxHixSzj+4YIl3d3s
	 W/QY/SzdqJoWnmpT74r4FJ9c7QQ2GGWmWHrKTckykJo+J/zcxsdNMtXNp0oaaSJX3U
	 Ex6PRw0WP65jRlB3rhIY4suwRUSsgvF6lKejbnPWnlk/YxtK/riCrVQr+vKMHhDIgT
	 hLLGhsqPpSiUYgDSp1bWZGfOXx0CrUCDGMlYN51t3LU7N1184VJYiOWGWSIc1y9K+y
	 52JQV4HlonIWw==
Date: Thu, 10 Mar 2022 17:54:45 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    stefanos@xilinx.com, julien@xen.org, Volodymyr_Babchuk@epam.com, 
    bertrand.marquis@arm.com, andrew.cooper3@citrix.com, 
    george.dunlap@citrix.com, jbeulich@suse.com, wl@xen.org, paul@xen.org, 
    roger.pau@citrix.com, Ayan Kumar Halder <ayankuma@xilinx.com>
Subject: Re: [XEN v10 1/4] xen/arm64: Decode ldr/str post increment
 operations
In-Reply-To: <20220310174501.62040-2-ayankuma@xilinx.com>
Message-ID: <alpine.DEB.2.22.394.2203101752260.3261@ubuntu-linux-20-04-desktop>
References: <20220310174501.62040-1-ayankuma@xilinx.com> <20220310174501.62040-2-ayankuma@xilinx.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 10 Mar 2022, Ayan Kumar Halder wrote:
> At the moment, Xen does not decode any of the arm64 instructions. This
> means that when hsr_dabt.isv == 0, Xen cannot handle those instructions.
> This will lead to Xen to abort the guests (from which those instructions
> originate).
> 
> With this patch, Xen is able to decode ldr/str post indexing instructions.
> These are a subset of instructions for which hsr_dabt.isv == 0.
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
> In the subsequent patch, decode_arm64() will get invoked when
> hsr_dabt.isv == 0.
> 
> Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Note that if there are no changes (or small changes) to a patch and
previously someone gave his reviewed-by, it is customary to keep the tag
in the next version of the series.

I.e. you should have added my Reviewed-by directly to the commit message
in v10. See https://marc.info/?l=xen-devel&m=164635451928651


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
> v8 - 1. Removed some un-necessary header files inclusion.
>      2. Some style changes pointed out in v7.
> 
> v9 - 1. Rebased on top of the master.
>      2. Renamed psr_mode_is_32bit to regs_mode_is_32bit.
> 
> v10 - 1. No change.
> 
>  xen/arch/arm/decode.c           | 79 ++++++++++++++++++++++++++++++++-
>  xen/arch/arm/decode.h           | 48 +++++++++++++++++---
>  xen/arch/arm/include/asm/mmio.h |  4 ++
>  xen/arch/arm/io.c               |  2 +-
>  4 files changed, 124 insertions(+), 9 deletions(-)
> 
> diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
> index 792c2e92a7..3add87e83a 100644
> --- a/xen/arch/arm/decode.c
> +++ b/xen/arch/arm/decode.c
> @@ -84,6 +84,78 @@ bad_thumb2:
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
> +        return 1;
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
> +                "Decoding instruction 0x%x is not supported\n", opcode.value);
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
> @@ -150,10 +222,13 @@ bad_thumb:
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
> +    if ( !regs_mode_is_32bit(regs) )
> +        return decode_arm64(regs->pc, info);
>  
>      /* TODO: Handle ARM instruction */
>      gprintk(XENLOG_ERR, "unhandled ARM instruction\n");
> diff --git a/xen/arch/arm/decode.h b/xen/arch/arm/decode.h
> index 4613763bdb..13db8ac968 100644
> --- a/xen/arch/arm/decode.h
> +++ b/xen/arch/arm/decode.h
> @@ -23,19 +23,55 @@
>  #include <asm/regs.h>
>  #include <asm/processor.h>
>  
> -/**
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
> +        signed int imm9:9;     /* imm9 */
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
> +/*
>   * Decode an instruction from pc
> - * /!\ This function is not intended to fully decode an instruction. It
> - * considers that the instruction is valid.
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
> index 1a066f9ae5..fad103bdbd 100644
> --- a/xen/arch/arm/io.c
> +++ b/xen/arch/arm/io.c
> @@ -141,7 +141,7 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
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
> 

