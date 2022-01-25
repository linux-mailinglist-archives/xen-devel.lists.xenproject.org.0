Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7A449BF4E
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 00:03:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260592.450354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCUpr-000377-I0; Tue, 25 Jan 2022 23:02:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260592.450354; Tue, 25 Jan 2022 23:02:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCUpr-00034U-D7; Tue, 25 Jan 2022 23:02:47 +0000
Received: by outflank-mailman (input) for mailman id 260592;
 Tue, 25 Jan 2022 23:02:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nCUpp-00034O-AF
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 23:02:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nCUpo-0000ZZ-RS; Tue, 25 Jan 2022 23:02:44 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.30.43]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nCUpo-0003MD-G5; Tue, 25 Jan 2022 23:02:44 +0000
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
	bh=yYgmtS9iUR6TbfBy4T7HFKeTTdNYFDRD7roAb0Ppj1Q=; b=orubdRdP4QsnGpiertE/FCZWHo
	68kVgoi1Hsn8dyfBbJJ4sR+KLOnHuF3lxZP60q/kn6fNVtg3xbFwGOXM1aY6eYhkWCd9N1wbPmFbf
	sbK9K8wBVjd+R6d8nIjKWtrDwBK1Ts0RAuCYry5dwND2OcAS2vNWQiGddcei1xUX2VQU=;
Message-ID: <8eb4949c-aa9f-38fd-682e-7620b5f9e03c@xen.org>
Date: Tue, 25 Jan 2022 23:02:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [XEN v4] xen/arm64: io: Decode ldr/str post-indexing instructions
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, andre.przywara@arm.com, jbeulich@suse.com,
 wei.chen@arm.com, Ayan Kumar Halder <ayankuma@xilinx.com>
References: <20220125211808.23810-1-ayankuma@xilinx.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220125211808.23810-1-ayankuma@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 25/01/2022 21:18, Ayan Kumar Halder wrote:
> At the moment, Xen is only handling data abort with valid syndrome (i.e.
> ISV=0). Unfortunately, this doesn't cover all the instructions a domain
> could use to access MMIO regions.
> 
> For instance, a baremetal OS can use any of the following instructions, where
> x1 contains the address of the MMIO region:
> 
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
> In the following two instructions, Rn could theoretically be stack pointer which
> might contain the address of the MMIO region:-
> 11.     ldrb    w2,    [Rn],    #1
> 12.     ldrb    wzr,   [Rn],    #1
> 
> In order to handle post-indexing store/load instructions (like those mentioned
> above), Xen will need to fetch and decode the instruction.
> 
> This patch only cover post-index store/load instructions from AArch64 mode.
> For now, this is left unimplemented for trap from AArch32 mode.
> 
> Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
> ---
> 
> Changelog :-
> v2 - 1. Updated the rn register after reading from it. (Pointed by Julien,
>          Stefano)
>       2. Used a union to represent the instruction opcode (Suggestd by Bertrand)
>       3. Fixed coding style issues (Pointed by Julien)
>       4. In the previous patch, I was updating dabt->sign based on the signedness
>          of imm9. This was incorrect. As mentioned in ARMv8 ARM  DDI 0487G.b,
>          Page 3221, SSE indicates the signedness of the data item loaded. In our
>          case, the data item loaded is always unsigned.
> 
> v3- 1. Handled all the variants of ldr/str (ie 64, 32, 16, 8 bit variants).
>         Thus, I have removed the check for "instr->code.opc == 0" (Suggested by
>         Andre)
>      2. Handled the scenario when rn = SP, rt = XZR (Suggested by Jan, Andre)
>      3. Added restriction for "rt != rn" (Suggested by Andre)
>      4. Moved union ldr_str_instr_class {} to decode.h. This is the header included
>         by io.c and decode.c (where the union is referred). (Suggested by Jan)
>      5. Indentation and typo fixes (Suggested by Jan)
> 
> v4- 1. Fixed the patch as per Stefano's comments on v3. They are as follows :-
>          1.1 Use macros to determine the fixed values in the instruction opcode
>          1.2 Checked if instr != NULL
>          1.3 Changed some data types and added #define ARM_64 for AArch64 specific
>              code
>          1.4 Moved post_increment_register() to decode.c so that the decoding
>              logic is confined to a single file.
>          1.5 Moved some checks from post_increment_register() to
>              decode_loadstore_postindexing()
>          1.6 Removed a duplicate check
>      2. Updated the commit message as per Andre's comments.
>      3. Changed the names of a label and some comments. *32bit* was erroneously
>         mentioned in a label and comments in decode_loadstore_postindexing()
>         although the function handled all variants of ldr/str post indexing.
> 
>   xen/arch/arm/decode.c | 124 +++++++++++++++++++++++++++++++++++++++++-
>   xen/arch/arm/decode.h |  41 +++++++++++++-
>   xen/arch/arm/io.c     |  41 +++++++++++---
>   3 files changed, 195 insertions(+), 11 deletions(-)
> 
> diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
> index 792c2e92a7..0c12af7afa 100644
> --- a/xen/arch/arm/decode.c
> +++ b/xen/arch/arm/decode.c
> @@ -84,6 +84,101 @@ bad_thumb2:
>       return 1;
>   }
>   
> +static int decode_loadstore_postindexing(register_t pc,

This is only handling AArch64 instruction. So please add aarch64 (or 
arm64) in the name.

> +                                         struct hsr_dabt *dabt,
> +                                         union ldr_str_instr_class *instr)
> +{
> +    struct cpu_user_regs *regs = guest_cpu_user_regs();
> +
> +    if ( instr == NULL )

Wouldn't it be a programming error? If so, should it be ASSERT(...)?

> +    {
> +        gprintk(XENLOG_ERR, "instr should not be NULL\n");
> +        return -EINVAL;
> +    }
> +
> +    if ( raw_copy_from_guest(&instr->value, (void * __user)pc, sizeof (instr)) )
> +    {
> +        gprintk(XENLOG_ERR, "Could not copy the instruction from PC\n");
> +        return -EFAULT;
> +    }
> +
> +    /*
> +     * Rn -ne Rt for ldr/str instruction.
> +     * Check https://developer.arm.com/documentation/dui0802/a/CIHGJHED
> +     * (Register restrictions)

I find a bit odd that you are pointing to 3 different spec (Compiler, 
Cortex-A, Arm Arm). Can we please use only the Arm Arm? It should 
contain everything we need...

> +     *
> +     * The only exception for this is when rn = 31. It denotes SP ("Use of SP")
> +     *
> +     * And when rt = 31, it denotes wzr/xzr. (Refer
> +     * https://developer.arm.com/documentation/den0024/a/ARMv8-Registers/AArch64-special-registers

Same here.

Also, please avoid URL and use the document reference (e.g. ARM DDI 
0487F.c for the Arm Arm) are they are easy to find on google.

> +     * "There is no register called X31 or W31. Many instructions are encoded
> +     * such that the number 31 represents the zero register, ZR (WZR/XZR)."
> +     */
> +    if ( (instr->code.rn == instr->code.rt) && (instr->code.rn != 31) )
> +    {
> +        gprintk(XENLOG_ERR, "Rn should not be equal to Rt except for r31\n");
> +        return -EINVAL;
> +    }
> +
> +    /* First, let's check for the fixed values */
> +    if ( (instr->value & POST_INDEX_FIXED_MASK) != POST_INDEX_FIXED_VALUE )
> +    {
> +        gprintk(XENLOG_ERR, "Cannot decode instruction 0x%x",instr->value);
> +        gprintk(XENLOG_ERR, "Decoding not supported for instructions other than"
> +            " ldr/str post indexing\n");

Please don't split the message. Instead, it should be:

gprintk(XENLOG_ERR,
         "...");

But I would combine the two messages and simply write:

"Decoding instruction 0x%x is not supported". Not need to say that we 
support only ldr/str post indexing.

> +        goto bad_loadstore;

I am a bit confused why some of the error path is using error and other 
goto. Can you clarify it?

> +    }
> +
> +    /*
> +     * Handle when rn = SP
> +     * Refer ArmV8 ARM DDI 0487G.b, Page - D1-2463 "Stack pointer register selection"
> +     * As we are interested in handling exceptions only from EL1 in AArch64 state,
> +     * thus M[3:0] == EL1h (Page - C5-480 "When exception taken from AArch64 state:")

I read the last sentence as "We only support decoding from instruction 
run at EL1". But I can't find a check guarantee that.

> +     */
> +    if ( (instr->code.rn == 31) && ((regs->cpsr & PSR_MODE_MASK) != PSR_MODE_EL1h) )
> +    {
> +        gprintk(XENLOG_ERR, "SP is valid only for EL1h\n");
> +        goto bad_loadstore;
> +    }
> +
> +    if ( instr->code.v != 0 )
> +    {
> +        gprintk(XENLOG_ERR,
> +            "ldr/str post indexing for vector types are not supported\n");
> +        goto bad_loadstore;
> +    }
> +
> +    /* Check for STR (immediate) */
> +    if ( instr->code.opc == 0 )
> +    {
> +        dabt->write = 1;
> +    }

Coding style: We don't use {} for single line. In this case, it would 
also result to have a more readable code.

> +    /* Check for LDR (immediate) */
> +    else if ( instr->code.opc == 1 )
> +    {
> +        dabt->write = 0;
> +    }

Same.

> +    else
> +    {
> +        gprintk(XENLOG_ERR,
> +            "Decoding ldr/str post indexing is not supported for this variant\n");

The indentation looks wrong here.

> +        goto bad_loadstore;
> +    }
> +
> +    gprintk(XENLOG_INFO,
> +        "instr->code.rt = 0x%x, instr->code.size = 0x%x, instr->code.imm9 = %d\n",
> +        instr->code.rt, instr->code.size, instr->code.imm9);

The indentation looks wrong here.

> +
> +    update_dabt(dabt, instr->code.rt, instr->code.size, false);
> +    dabt->valid = 1;
> +
> +    return 0;
> +
> + bad_loadstore:
> +    gprintk(XENLOG_ERR, "unhandled Arm instruction 0x%x\n", instr->value);
> +    return 1;
> +}
> +
>   static int decode_thumb(register_t pc, struct hsr_dabt *dabt)
>   {
>       uint16_t instr;
> @@ -150,17 +245,44 @@ bad_thumb:
>       return 1;
>   }
>   
> -int decode_instruction(const struct cpu_user_regs *regs, struct hsr_dabt *dabt)
> +int decode_instruction(const struct cpu_user_regs *regs, struct hsr_dabt *dabt,
> +                       union ldr_str_instr_class *instr)

I would like to avoid make the assumption that the instr we decode will 
always be a store/load. So please rename it to something more generic.

>   {
>       if ( is_32bit_domain(current->domain) && regs->cpsr & PSR_THUMB )
>           return decode_thumb(regs->pc, dabt);
>   
> +    if ( (is_64bit_domain(current->domain) && !psr_mode_is_32bit(regs)) )

The first part could be dropped because if psr_mode_is_32bit returns 0 
then it must mean the domain is 64-bit.

> +    {
> +        return decode_loadstore_postindexing(regs->pc, dabt, instr);
> +    }

Coding style: Please drop the {}.

> +
>       /* TODO: Handle ARM instruction */
>       gprintk(XENLOG_ERR, "unhandled ARM instruction\n");
>   
>       return 1;
>   }
>   
> +#if CONFIG_ARM_64
> +void post_increment_register(union ldr_str_instr_class *instr)

instr should not be modified, so please use const. Also, it would be 
preferrable to pass the regs in parameter. So the none of the decoding 
code relies on the current regs.

Furthermore, decode.c should only contain code to update the syndrome 
and in theory Arm could decide to provide an valid syndrome in future 
revision. So I would move this code in io.c (or maybe traps.c).

> +{
> +    struct cpu_user_regs *regs = guest_cpu_user_regs();
> +    register_t val;
> +
> +    /* handle when rn = SP */
> +    if ( instr->code.rn == 31 )
> +        val = regs->sp_el1;
> +    else
> +        val = get_user_reg(regs, instr->code.rn);
> +
> +    val += instr->code.imm9;
> +
> +    if ( instr->code.rn == 31 )
> +        regs->sp_el1 = val;
> +    else
> +        set_user_reg(regs, instr->code.rn, val);
> +}
> +#endif
> +
>   /*
>    * Local variables:
>    * mode: C
> diff --git a/xen/arch/arm/decode.h b/xen/arch/arm/decode.h
> index 4613763bdb..511cd4a05f 100644
> --- a/xen/arch/arm/decode.h
> +++ b/xen/arch/arm/decode.h
> @@ -23,6 +23,35 @@
>   #include <asm/regs.h>
>   #include <asm/processor.h>
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

Looking at the code, post_increment_register() only care about 'rn' and 
'imm9'. So rather than exposing the full instruction, could we instead 
provide the strict minimum? I.e something like:

struct
{
      enum instr_type; /* Unknown, ldr/str post increment */
      union
      {
          struct
          {
            register; /* Register to increment */
            imm;      /* Immediate to add */
          } ldr_str;
      }
      uint64_t register;
}

> +
> +#define POST_INDEX_FIXED_MASK   0x3B200C00
> +#define POST_INDEX_FIXED_VALUE  0x38000400
> +
>   /**
>    * Decode an instruction from pc
>    * /!\ This function is not intended to fully decode an instruction. It
> @@ -35,8 +64,18 @@
>    */
>   
>   int decode_instruction(const struct cpu_user_regs *regs,
> -                       struct hsr_dabt *dabt);
> +                       struct hsr_dabt *dabt,
> +                       union ldr_str_instr_class *instr);
>   
> +/**
> + * Update the register value for Rn
> + * /!\ This function is used to update the register value for Rn when a

NIT: I would drop /!\ because this looks more the description of the 
function rather than a warning.

> + * post indexing ldr/str instruction is decoded.
> + *
> + * This function will get:
> + * - The post indexing ldr/str instruction opcode
> + */
> +void post_increment_register(union ldr_str_instr_class *instr);
>   #endif /* __ARCH_ARM_DECODE_H_ */
>   
>   /*
> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
> index 729287e37c..b9c15e1fe7 100644
> --- a/xen/arch/arm/io.c
> +++ b/xen/arch/arm/io.c
> @@ -106,14 +106,29 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>           .gpa = gpa,
>           .dabt = dabt
>       };
> +    int rc;
> +    union ldr_str_instr_class instr = {0};
>   
>       ASSERT(hsr.ec == HSR_EC_DATA_ABORT_LOWER_EL);
>   
> +    /*
> +     * Armv8 processor does not provide a valid syndrome for post-indexing
> +     * ldr/str instructions. So in order to process these instructions,
> +     * Xen must decode them.
> +     */

This sort of comments will become stall if we decide to add more 
decoding. So I would keep the comments in io.c generic (i.e. no mention 
of load/store).

> +    if ( !info.dabt.valid )

I would rather prefer if we keep using dabt.valid here rather than 
info.dabt.valid. It is shorter and keep consistent with how it was 
checked before.

> +    {
> +        rc = decode_instruction(regs, &info.dabt, &instr);
> +        if ( rc )
> +        {
> +            gprintk(XENLOG_DEBUG, "Unable to decode instruction\n");
> +            return IO_ABORT;
> +        }
> +    }
> +
>       handler = find_mmio_handler(v->domain, info.gpa);
>       if ( !handler )
>       {
> -        int rc;
> -
>           rc = try_fwd_ioserv(regs, v, &info);
>           if ( rc == IO_HANDLED )
>               return handle_ioserv(regs, v);
> @@ -121,10 +136,6 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>           return rc;
>       }
>   
> -    /* All the instructions used on emulated MMIO region should be valid */
> -    if ( !dabt.valid )
> -        return IO_ABORT;
> -

I think moving if ( !dabt.valid ) earlier should be part of a pre-patch. 
This would allows us to backport it as we don't want to forward the I/O 
to an IOREQ server if ISV=0.

>       /*
>        * Erratum 766422: Thumb store translation fault to Hypervisor may
>        * not have correct HSR Rt value.
> @@ -134,7 +145,7 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>       {
>           int rc;
>   
> -        rc = decode_instruction(regs, &info.dabt);
> +        rc = decode_instruction(regs, &info.dabt, NULL);

Could we combine the two decode_instruction()?

>           if ( rc )
>           {
>               gprintk(XENLOG_DEBUG, "Unable to decode instruction\n");
> @@ -143,9 +154,21 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>       }
>   
>       if ( info.dabt.write )
> -        return handle_write(handler, v, &info);
> +        rc = handle_write(handler, v, &info);
>       else
> -        return handle_read(handler, v, &info);
> +        rc = handle_read(handler, v, &info);
> +
> +#if CONFIG_ARM_64

Rather than using #ifdef here, I prefer if provide a stub for 
post_increment_register() that contains ASSERT_UNREACHABLE(). So the 
code in io.c is more arch-agnostic.

> +    if ( (is_64bit_domain(current->domain) && !psr_mode_is_32bit(regs)) )

This is a fairly expensive check. Can we avoid it and instead rely on 
the instruction to be decoded?

> +    {
> +        if ( instr.value != 0 )

I would prefer if we carry a boolean to indicate whether we manually 
decoded the instruction. The main advantage is one doesn't need to check 
in the Arm Arm to figure out that the 0x0 will never result to a valid 
instruction (it is thankfully used for UDF).

> +        {
> +            post_increment_register(&instr);
> +        }
> +    }
> +#endif
> +
> +    return rc;
>   }
>   
>   void register_mmio_handler(struct domain *d,

Cheers,

-- 
Julien Grall

