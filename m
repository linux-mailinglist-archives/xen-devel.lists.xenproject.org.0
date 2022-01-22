Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA2D49690B
	for <lists+xen-devel@lfdr.de>; Sat, 22 Jan 2022 02:04:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259484.447880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nB4pE-0000M9-Fw; Sat, 22 Jan 2022 01:04:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259484.447880; Sat, 22 Jan 2022 01:04:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nB4pE-0000Im-CD; Sat, 22 Jan 2022 01:04:16 +0000
Received: by outflank-mailman (input) for mailman id 259484;
 Sat, 22 Jan 2022 01:04:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zp6W=SG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nB4pC-0000If-CX
 for xen-devel@lists.xenproject.org; Sat, 22 Jan 2022 01:04:14 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34e10c1b-7b1f-11ec-bc18-3156f6d857e4;
 Sat, 22 Jan 2022 02:04:11 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D8386B82161;
 Sat, 22 Jan 2022 01:04:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECB6EC340E1;
 Sat, 22 Jan 2022 01:04:07 +0000 (UTC)
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
X-Inumbo-ID: 34e10c1b-7b1f-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1642813448;
	bh=PRGQmpWqs5jLaHz2GX9yNuBYNnoRyHK4X3NlHkA7ufI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ASC0bOiwu873DrrC0dnEUTaoHjJyfJZRAXbIFxOlZXa1R2YvilcO1D/w7pTJvH2jb
	 JHGUNppoGACDoWnuU9kwMLNu9oD2lxlyfW5iFWGhy0HUw8JmvPV7fUzVC+7imWID1B
	 ChSFUdWZgBFKTucrCcmC/f6nSdX4URuMtOTwxOFzw4FktHlFe8TrCwmJLA0J1Ng7Yf
	 AY191FjUDmDaSqPf0mhRLLjeqwaFbFfjUvgnXdH1CbbCsBn508PjHo348asZ4EzSrY
	 eL9roDhSDlIXZdpfQo0TA8Y8EatIahRq6NkNdyw/6VbJtcvQ9k8WUpHRDGzl/848ow
	 tntEhToY1ZwvQ==
Date: Fri, 21 Jan 2022 17:04:05 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    stefanos@xilinx.com, julien@xen.org, Volodymyr_Babchuk@epam.com, 
    bertrand.marquis@arm.com, andre.przywara@arm.com, jbeulich@suse.com, 
    wei.chen@arm.com, Ayan Kumar Halder <ayankuma@xilinx.com>
Subject: Re: [XEN v3] xen/arm64: io: Decode ldr/str post-indexing
 instructions
In-Reply-To: <20220120215527.28138-1-ayankuma@xilinx.com>
Message-ID: <alpine.DEB.2.22.394.2201211613530.27308@ubuntu-linux-20-04-desktop>
References: <20220120215527.28138-1-ayankuma@xilinx.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 20 Jan 2022, Ayan Kumar Halder wrote:
> At the moment, Xen is only handling data abort with valid syndrome (i.e.
> ISV=0). Unfortunately, this doesn't cover all the instructions a domain
> could use to access MMIO regions.
> 
> For instance, a baremetal OS can use any of the following instructions, where
> x1 contains the address of the MMIO region:
> 
> 1.      ldr     x2,    [x1],    #4
> 2.      ldr     w2,    [x1],    #-4
> 3.      ldr     x2,    [x1],    #-8
> 4.      ldr     w2,    [x1],    #4
> 5.      ldrh    w2,    [x1],    #8
> 6.      ldrb    w2,    [x1],    #16
> 7.      str     x2,    [x1],    #4
> 8.      str     w2,    [x1],    #-4
> 9.      strh    w2,    [x1],    #8
> 10.     strb    w2,    [x1],    #16
> 
> In the following two instructions, sp contains the address of the MMIO region:-
> 11.     ldrb    w2,    [sp],    #16
> 12.     ldrb    wzr,   [sp],    #16
> 
> In order to handle post-indexing store/load instructions (like those mentioned
> above), Xen will need to fetch and decode the instruction.
> 
> This patch only cover post-index store/load instructions from AArch64 mode.
> For now, this is left unimplemented for trap from AArch32 mode.
> 
> Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>

This is a lot better, thanks!


> ---
> 
> Changelog :-
> v2 - 1. Updated the rn register after reading from it. (Pointed by Julien,
>         Stefano)
>      2. Used a union to represent the instruction opcode (Suggestd by Bertrand)
>      3. Fixed coding style issues (Pointed by Julien)
>      4. In the previous patch, I was updating dabt->sign based on the signedness
>         of imm9. This was incorrect. As mentioned in ARMv8 ARM  DDI 0487G.b,
>         Page 3221, SSE indicates the signedness of the data item loaded. In our
>         case, the data item loaded is always unsigned.
> 
> v3- 1. Handled all the variants of ldr/str (ie 64, 32, 16, 8 bit variants).
>        Thus, I have removed the check for "instr->code.opc == 0" (Suggested by
>        Andre)
>     2. Handled the scenario when rn = SP, rt = XZR (Suggested by Jan, Andre)
>     3. Added restriction for "rt != rn" (Suggested by Andre)
>     4. Moved union ldr_str_instr_class {} to decode.h. This is the header included
>        by io.c and decode.c (where the union is referred). (Suggested by Jan)
>     5. Indentation and typo fixes (Suggested by Jan)
> 
> Changes suggested but could not be considered due to reasons :-
>     1. Using accessor macros instead of bitfields for "ldr_str_instr_class". (Andre)
>        Reason - I could not find a simple way to represent 9 bit signed integer
>        (ie imm9) without using bitfields. If I use accessor macros, then I need
>        to manually calculate two's complement to obtain the value when signed
>        bit is present.
> 
>     2. I/D cache cohenerncy (Andre)
>        Reason :- I could not see any instruction to flush the I cache.
>        Refer https://developer.arm.com/documentation/ddi0596/2021-12/Base-Instructions/IC--Instruction-Cache-operation--an-alias-of-SYS-?lang=en#sa_ic_op
>        So, this patch assumes that the I/D caches are coherent.
> 
>  xen/arch/arm/decode.c | 78 ++++++++++++++++++++++++++++++++++++++++++-
>  xen/arch/arm/decode.h | 29 +++++++++++++++-
>  xen/arch/arm/io.c     | 66 ++++++++++++++++++++++++++++++++----
>  3 files changed, 165 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
> index 792c2e92a7..f1c59ddd1a 100644
> --- a/xen/arch/arm/decode.c
> +++ b/xen/arch/arm/decode.c
> @@ -84,6 +84,76 @@ bad_thumb2:
>      return 1;
>  }
>  
> +static int decode_loadstore_postindexing(register_t pc,
> +                                         struct hsr_dabt *dabt,
> +                                         union ldr_str_instr_class *instr)
> +{
> +    if ( raw_copy_from_guest(&instr->value, (void * __user)pc, sizeof (instr)) )
> +        return -EFAULT;
> +
> +    /*
> +     * Rn -ne Rt for ldr/str instruction.
> +     * Check https://developer.arm.com/documentation/dui0802/a/CIHGJHED
> +     * (Register restrictions)
> +     *
> +     * The only exception for this is when rn = 31. It denotes SP ("Use of SP")
> +     *
> +     * And when rt = 31, it denotes wzr/xzr. (Refer
> +     * https://developer.arm.com/documentation/den0024/a/ARMv8-Registers/AArch64-special-registers
> +     * "There is no register called X31 or W31. Many instructions are encoded
> +     * such that the number 31 represents the zero register, ZR (WZR/XZR)."
> +     */
> +    if ( (instr->code.rn == instr->code.rt) && (instr->code.rn != 31) )
> +        return -EINVAL;
>
> +    /* First, let's check for the fixed values */
> +    if ( !((instr->code.fixed1 == 1) && (instr->code.fixed2 == 0) &&
> +         (instr->code.fixed3 == 0) && (instr->code.fixed4 == 7)) )
> +    {
> +        gprintk(XENLOG_ERR, "Cannot decode instruction 0x%x",instr->value);
> +        gprintk(XENLOG_ERR, "Decoding not supported for instructions other than"
> +            " ldr/str post indexing\n");
> +        goto bad_32bit_loadstore;
> +    }

Maybe this is a useless optimization but I would write this using masks
and bitwise opts:

#define POST_INDX_FIXED_MASK  0x38200c00
#define POST_INDX_FIXED_VALUE 0x38000400

if ( (instr->value & POST_INDX_FIXED_MASK) != POST_INDX_FIXED_VALUE )
    goto bad_32bit_loadstore;



> +    if ( instr->code.v != 0 )
> +    {
> +        gprintk(XENLOG_ERR,
> +            "ldr/str post indexing for vector types are not supported\n");
> +        goto bad_32bit_loadstore;
> +    }
> +
> +    /* Check for STR (immediate) - 32 bit variant */
> +    if ( instr->code.opc == 0 )
> +    {
> +        dabt->write = 1;
> +    }
> +    /* Check for LDR (immediate) - 32 bit variant */
> +    else if ( instr->code.opc == 1 )
> +    {
> +        dabt->write = 0;
> +    }
> +    else
> +    {
> +        gprintk(XENLOG_ERR,
> +            "Decoding ldr/str post indexing is not supported for this variant\n");
> +        goto bad_32bit_loadstore;
> +    }
> +
> +    gprintk(XENLOG_INFO,
> +        "instr->code.rt = 0x%x, instr->code.size = 0x%x, instr->code.imm9 = %d\n",
> +        instr->code.rt, instr->code.size, instr->code.imm9);
> +
> +    update_dabt(dabt, instr->code.rt, instr->code.size, false);
> +    dabt->valid = 1;
> +
> +    return 0;
> +
> + bad_32bit_loadstore:
> +    gprintk(XENLOG_ERR, "unhandled 32bit Arm instruction 0x%x\n", instr->value);
> +    return 1;
> +}
> +
>  static int decode_thumb(register_t pc, struct hsr_dabt *dabt)
>  {
>      uint16_t instr;
> @@ -150,11 +220,17 @@ bad_thumb:
>      return 1;
>  }
>  
> -int decode_instruction(const struct cpu_user_regs *regs, struct hsr_dabt *dabt)
> +int decode_instruction(const struct cpu_user_regs *regs, struct hsr_dabt *dabt,
> +                       union ldr_str_instr_class *instr)
>  {
>      if ( is_32bit_domain(current->domain) && regs->cpsr & PSR_THUMB )
>          return decode_thumb(regs->pc, dabt);
>  
> +    if ( (is_64bit_domain(current->domain) && !psr_mode_is_32bit(regs)) )
> +    {

We should also check that instr != NULL either here or at the beginning
of decode_loadstore_postindexing


> +        return decode_loadstore_postindexing(regs->pc, dabt, instr);
> +    }
> +
>      /* TODO: Handle ARM instruction */
>      gprintk(XENLOG_ERR, "unhandled ARM instruction\n");
>  
> diff --git a/xen/arch/arm/decode.h b/xen/arch/arm/decode.h
> index 4613763bdb..5c918c9bed 100644
> --- a/xen/arch/arm/decode.h
> +++ b/xen/arch/arm/decode.h
> @@ -23,6 +23,32 @@
>  #include <asm/regs.h>
>  #include <asm/processor.h>
>  
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
> +union ldr_str_instr_class {
> +    uint32_t value;
> +    struct ldr_str {
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
> +    } code;
> +};
> +
>  /**
>   * Decode an instruction from pc
>   * /!\ This function is not intended to fully decode an instruction. It
> @@ -35,7 +61,8 @@
>   */
>  
>  int decode_instruction(const struct cpu_user_regs *regs,
> -                       struct hsr_dabt *dabt);
> +                       struct hsr_dabt *dabt,
> +                       union ldr_str_instr_class *instr);
>  
>  #endif /* __ARCH_ARM_DECODE_H_ */
>  
> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
> index 729287e37c..acb483f235 100644
> --- a/xen/arch/arm/io.c
> +++ b/xen/arch/arm/io.c
> @@ -65,6 +65,39 @@ static enum io_state handle_write(const struct mmio_handler *handler,
>      return ret ? IO_HANDLED : IO_ABORT;
>  }
>  
> +static void post_increment_register(union ldr_str_instr_class *instr)
> +{
> +    struct cpu_user_regs *regs = guest_cpu_user_regs();
> +    unsigned int val;

register_t val


> +    /* handle when rn = SP */
> +    if ( instr->code.rn == 31 )
> +    {
> +        if ( (regs->cpsr & PSR_MODE_MASK) == PSR_MODE_EL1h )
> +        {
> +            val = regs->sp_el1;

I think you need to #ifdef ARM64 the entire function because sp_el1 is
aarch64 only. Also, it might be better to move post_increment_register
to decode.c to keep is closer to the other half of the relevant code. I
don't feel strongly about it though, if other reviewers prefer to keep
it here, it is only fine by me.


> +        }
> +        else
> +        {
> +            BUG();

BUG is not a good idea in this code path because it might allow a guest
to cause a hypervisor crash. Instead you could print an error and
call:

    domain_crash(current->domain);

But I think it would be even better to add a check:

if ( (regs->cpsr & PSR_MODE_MASK) != PSR_MODE_EL1h )
{
    goto bad_32bit_loadstore;
}

in decode_loadstore_postindexing or in decode_instruction so that if get
here we are sure that we can handle the post-indexing instruction
completely.


> +        }
> +    }
> +    else
> +    {
> +        val = get_user_reg(regs, instr->code.rn);
> +    }
> +    val += instr->code.imm9;
> +    if ( instr->code.rn == 31 )
> +    {
> +        regs->sp_el1 = val;
> +    }
> +    else
> +    {
> +        set_user_reg(regs, instr->code.rn, val);
> +    }
> +}
> +
>  /* This function assumes that mmio regions are not overlapped */
>  static int cmp_mmio_handler(const void *key, const void *elem)
>  {
> @@ -106,14 +139,29 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>          .gpa = gpa,
>          .dabt = dabt
>      };
> +    int rc;
> +    union ldr_str_instr_class instr = {0};
>  
>      ASSERT(hsr.ec == HSR_EC_DATA_ABORT_LOWER_EL);
>  
> +    /*
> +     * Armv8 processor does not provide a valid syndrome for post-indexing
> +     * ldr/str instructions. So in order to process these instructions,
> +     * Xen must decode them.
> +     */
> +    if ( !info.dabt.valid )
> +    {
> +        rc = decode_instruction(regs, &info.dabt, &instr);
> +        if ( rc )
> +        {
> +            gprintk(XENLOG_DEBUG, "Unable to decode instruction\n");
> +            return IO_ABORT;
> +        }
> +    }
> +
>      handler = find_mmio_handler(v->domain, info.gpa);
>      if ( !handler )
>      {
> -        int rc;
> -
>          rc = try_fwd_ioserv(regs, v, &info);
>          if ( rc == IO_HANDLED )
>              return handle_ioserv(regs, v);
> @@ -122,7 +170,7 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>      }
>  
>      /* All the instructions used on emulated MMIO region should be valid */
> -    if ( !dabt.valid )
> +    if ( !info.dabt.valid )
>          return IO_ABORT;

Is this check still necessary given the new info.dabt.valid check above?


>      /*
> @@ -134,7 +182,7 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>      {
>          int rc;
>  
> -        rc = decode_instruction(regs, &info.dabt);
> +        rc = decode_instruction(regs, &info.dabt, NULL);
>          if ( rc )
>          {
>              gprintk(XENLOG_DEBUG, "Unable to decode instruction\n");
> @@ -143,9 +191,15 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>      }
>  
>      if ( info.dabt.write )
> -        return handle_write(handler, v, &info);
> +        rc = handle_write(handler, v, &info);
>      else
> -        return handle_read(handler, v, &info);
> +        rc = handle_read(handler, v, &info);
> +
> +    if ( instr.value != 0 )
> +    {
> +        post_increment_register(&instr);
> +    }
> +    return rc;
>  }
>  
>  void register_mmio_handler(struct domain *d,

