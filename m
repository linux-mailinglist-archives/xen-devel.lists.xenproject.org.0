Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F28A4A51EB
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 22:56:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263317.456005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEedu-0000Lh-Ub; Mon, 31 Jan 2022 21:55:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263317.456005; Mon, 31 Jan 2022 21:55:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEedu-0000JH-RW; Mon, 31 Jan 2022 21:55:22 +0000
Received: by outflank-mailman (input) for mailman id 263317;
 Mon, 31 Jan 2022 21:55:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nEedt-0000JB-FB
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 21:55:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nEedr-0004RV-7z; Mon, 31 Jan 2022 21:55:19 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235] helo=[10.95.141.2])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nEedq-0003uQ-UD; Mon, 31 Jan 2022 21:55:19 +0000
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
	bh=5K/YUJy7hKgahKrxFihVLmxPaSmvuqDqBzPar4TNNm8=; b=nn4VwZHbM4V9gziOpKYl/ReNff
	7Cxy9/c/jT/QiPpzbyA9+4EE7w9DqFFUpcPDe2wonqydEtHGYWUvjP7nee5aUIix7fscURw8fHA1z
	bK+Nw2eGVgD5Ytx4ubHWgzHVb8fJluGZ0v1SXBiKg/1acNLDcWKLXN9dQ61ukPyMnj0g=;
Message-ID: <e07068aa-91b8-ebdf-db17-7173f417ad33@xen.org>
Date: Mon, 31 Jan 2022 21:55:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [XEN v5] xen/arm64: io: Decode ldr/str post-indexing instructions
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, Ayan Kumar Halder <ayankuma@xilinx.com>
References: <20220131193728.2980-1-ayankuma@xilinx.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220131193728.2980-1-ayankuma@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 31/01/2022 19:37, Ayan Kumar Halder wrote:
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
> Xen will not decode the instructions if the data abort is caused by stage1
> translation table walk or cache instructions. In the former scenario, it will
> try to update the page tables and in the latter scenario, it will ignore the
> instruction (ie simply increment the program counter).
> 
> If Xen is unable to decode the instructions, it will abort the guest.
> 
> This patch only cover post-index store/load instructions from AArch64 mode.
> For now, AArch32 mode is left unimplemented.
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
> v5- 1. Renamed decode_loadstore_postindexing() to decode_arm64(). The reason
>         being this will be extended in future to support more instructions for
>         which hsr_badt.isv = 0
>      2. Introduce a function try_decode_instruction_invalid_iss() to determine
>         if the instruction needs to be decoded before invoking decode_instruction().
> 
>         It checks :-
>         2.1  dabt->s1ptw - Returns IO_UNHANDLED
>         2.2  dabt->cache - Returns IO_IGNORED. (new enum instroduced to let the
>              caller know that the instruction needs to be ignored by Xen. Thus
>              the caller needs to increment the PC and return to the guest.
> 
>      3. Invoked try_decode_instruction_invalid_iss() from the following 2 places :-
>          3.a - try_handle_mmio() - When we have determined that there is a valid
>                mmio handler.
>          3.b - try_fwd_ioserv()
>          When ioserver completes the io request, the acknowledgement is sent via
>          handle_ioserv(). Here, we need to increment the register. As there is no
>          common data shared between try_fwd_ioserv() and handle_ioserv(), we need
>          to decode the instruction again in handle_ioserv() to determine rn, imm9.
> 
>          (NOTE to Reviewers) - This does not feel correct. However, I could not
>          think of a better approach. Please provide your inputs.
> 
>      4. Augumented struct hsr_dabt{} with struct hsr_dabt_instr_details{} to hold
>         rn and imm9. This is passed to post_increment_register() to update rn.
>      5. Other style changes as suggested in v4.
> 
>   Patch has been based on the comments received on the following two patches:-
>   1. https://lists.xenproject.org/archives/html/xen-devel/2022-01/msg01245.html
>   2. https://lists.xenproject.org/archives/html/xen-devel/2022-01/msg01279.html
> 
>   xen/arch/arm/arm32/traps.c  |  7 ++++
>   xen/arch/arm/arm64/traps.c  | 42 +++++++++++++++++++++
>   xen/arch/arm/decode.c       | 73 +++++++++++++++++++++++++++++++++++++
>   xen/arch/arm/decode.h       | 42 ++++++++++++++++++++-
>   xen/arch/arm/io.c           | 66 +++++++++++++++++++++++++++------
>   xen/arch/arm/ioreq.c        | 35 +++++++++++++++++-
>   xen/arch/arm/traps.c        |  1 +
>   xen/include/asm-arm/hsr.h   |  5 +++
>   xen/include/asm-arm/mmio.h  |  1 +
>   xen/include/asm-arm/traps.h |  1 +
>   10 files changed, 258 insertions(+), 15 deletions(-)

This patch is continuing to grow and it is getting more difficult to 
review. Can it be split in at least two parts?

1) Decode ldr/str
2) Plumb the code

> 
> diff --git a/xen/arch/arm/arm32/traps.c b/xen/arch/arm/arm32/traps.c
> index 9c9790a6d1..62a91e8728 100644
> --- a/xen/arch/arm/arm32/traps.c
> +++ b/xen/arch/arm/arm32/traps.c
> @@ -24,6 +24,8 @@
>   #include <asm/processor.h>
>   #include <asm/traps.h>
>   
> +struct hsr_dabt_instr_details;

Please don't do that. If you need to forward declare it, then it should 
be in traps.h.

> +
>   void do_trap_reset(struct cpu_user_regs *regs)
>   {
>       do_unexpected_trap("Reset", regs);
> @@ -82,6 +84,11 @@ void do_trap_data_abort(struct cpu_user_regs *regs)
>           do_unexpected_trap("Data Abort", regs);
>   }
>   
> +void post_increment_register(const struct hsr_dabt_instr_details *instr_details)
> +{
> +    ASSERT_UNREACHABLE();
> +}
> +
>   /*
>    * Local variables:
>    * mode: C
> diff --git a/xen/arch/arm/arm64/traps.c b/xen/arch/arm/arm64/traps.c
> index 9113a15c7a..482751496f 100644
> --- a/xen/arch/arm/arm64/traps.c
> +++ b/xen/arch/arm/arm64/traps.c
> @@ -18,9 +18,11 @@
>   
>   #include <xen/lib.h>
>   
> +#include <asm/current.h>
>   #include <asm/hsr.h>
>   #include <asm/system.h>
>   #include <asm/processor.h>
> +#include <asm/regs.h>
>   
>   #include <public/xen.h>
>   
> @@ -31,6 +33,8 @@ static const char *handler[]= {
>           "Error"
>   };
>   
> +struct hsr_dabt_instr_details;

Same here.

> +
>   void do_bad_mode(struct cpu_user_regs *regs, int reason)
>   {
>       union hsr hsr = { .bits = regs->hsr };
> @@ -44,6 +48,44 @@ void do_bad_mode(struct cpu_user_regs *regs, int reason)
>       panic("bad mode\n");
>   }
>   
> +void post_increment_register(const struct hsr_dabt_instr_details *instr_details)
> +{
> +    struct cpu_user_regs *regs = guest_cpu_user_regs();
> +    register_t val;
> +
> +    /*
> +     * Handle when rn = SP
> +     * Refer ArmV8 ARM DDI 0487G.b, Page - D1-2463 "Stack pointer register selection"
> +     * t = SP_EL0
> +     * h = SP_ELx
> +     * and M[3:0] (Page - C5-474 "When exception taken from AArch64 state:")
> +     */
> +    if (instr_details->rn == 31 )
> +    {
> +        if ( (regs->cpsr & PSR_MODE_MASK) == PSR_MODE_EL1h )
> +            val = regs->sp_el1;
> +        else if ( ((regs->cpsr & PSR_MODE_MASK) == PSR_MODE_EL1t) ||
> +                    ((regs->cpsr & PSR_MODE_MASK) == PSR_MODE_EL0t) )
> +            val = regs->sp_el0;
> +        else
> +            ASSERT_UNREACHABLE();
> +    }
> +    else
> +        val = get_user_reg(regs, instr_details->rn);
> +
> +    val += instr_details->imm9;
> +
> +    if ( instr_details->rn == 31 )
> +    {
> +        if ( (regs->cpsr & PSR_MODE_MASK) == PSR_MODE_EL1h )
> +            regs->sp_el1 = val;
> +        else
> +            regs->sp_el0 = val;
> +    }
> +    else
> +        set_user_reg(regs, instr_details->rn, val);
> +}
> +
>   /*
>    * Local variables:
>    * mode: C
> diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
> index 792c2e92a7..63376adc7c 100644
> --- a/xen/arch/arm/decode.c
> +++ b/xen/arch/arm/decode.c
> @@ -84,6 +84,76 @@ bad_thumb2:
>       return 1;
>   }
>   
> +static int decode_arm64(register_t pc, struct hsr_dabt *dabt)
> +{
> +    union instr opcode = {0};
> +
> +    if ( raw_copy_from_guest(&opcode.value, (void * __user)pc, sizeof (opcode)) )
> +    {
> +        gprintk(XENLOG_ERR, "Could not copy the instruction from PC\n");
> +        goto bad_loadstore;
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
> +            "Decoding instruction 0x%x is not supported",opcode.value);

Coding style. The string should start on the same column as XENLOG_ERR. 
Also, missing space after the comma.

> +        goto bad_loadstore;
> +    }
> +
> +    if ( opcode.ldr_str.v != 0 )
> +    {
> +        gprintk(XENLOG_ERR,
> +            "ldr/str post indexing for vector types are not supported\n");

Same here.


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
> +            "Decoding ldr/str post indexing is not supported for this variant\n");

Same here.

> +        goto bad_loadstore;
> +    }
> +
> +    gprintk(XENLOG_INFO,
> +        "opcode->ldr_str.rt = 0x%x, opcode->ldr_str.size = 0x%x, opcode->ldr_str.imm9 = %d\n",
> +        opcode.ldr_str.rt, opcode.ldr_str.size, opcode.ldr_str.imm9);

Same here.

> +
> +    update_dabt(dabt, opcode.ldr_str.rt, opcode.ldr_str.size, false);
> +
> +    dabt->dabt_instr.rn = opcode.ldr_str.rn;
> +    dabt->dabt_instr.imm9 = opcode.ldr_str.imm9;
> +
> +    return 0;
> +
> + bad_loadstore:
> +    gprintk(XENLOG_ERR, "unhandled Arm instruction 0x%x\n", opcode.value);
> +    return 1;
> +}
> +
>   static int decode_thumb(register_t pc, struct hsr_dabt *dabt)
>   {
>       uint16_t instr;
> @@ -155,6 +225,9 @@ int decode_instruction(const struct cpu_user_regs *regs, struct hsr_dabt *dabt)
>       if ( is_32bit_domain(current->domain) && regs->cpsr & PSR_THUMB )
>           return decode_thumb(regs->pc, dabt);
>   
> +    if ( !psr_mode_is_32bit(regs) )
> +        return decode_arm64(regs->pc, dabt);
> +
>       /* TODO: Handle ARM instruction */
>       gprintk(XENLOG_ERR, "unhandled ARM instruction\n");
>   
> diff --git a/xen/arch/arm/decode.h b/xen/arch/arm/decode.h
> index 4613763bdb..7080da9ab6 100644
> --- a/xen/arch/arm/decode.h
> +++ b/xen/arch/arm/decode.h
> @@ -23,9 +23,47 @@
>   #include <asm/regs.h>
>   #include <asm/processor.h>
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

The union and POST_INEX_FIXED_* defines only seem to be used within 
decode.c. So can they be moved to avoid polluting the header? (This was 
my original aim with avoid to use the union).

> +
> +/*
> + * Try to decode an instruction when ISS is invalid
> + * This function determines if the instruction is to be decoded on the basis of
> + * the attributes in 'struct hsr_dabt'. If so, then invokes decode_instruction().
> + * If not, it returns an appropriate io_state.
> + */
> +enum io_state try_decode_instruction_invalid_iss(const struct cpu_user_regs *regs,
> +                                                 struct hsr_dabt *dabt);
> +
> +/*
>    * Decode an instruction from pc
> - * /!\ This function is not intended to fully decode an instruction. It
> + * This function is not intended to fully decode an instruction. It

Why is /!\ is dropped? But then, is this comment still accurate given 
that you will now fully decode an instruction?

>    * considers that the instruction is valid.
>    *
>    * This function will get:
> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
> index 14d39222f2..dede7d59b0 100644
> --- a/xen/arch/arm/io.c
> +++ b/xen/arch/arm/io.c
> @@ -95,6 +95,35 @@ static const struct mmio_handler *find_mmio_handler(struct domain *d,
>       return handler;
>   }
>   
> +enum io_state try_decode_instruction_invalid_iss(const struct cpu_user_regs *regs,
> +                                                 struct hsr_dabt *dabt)
> +{
> +    int rc;
> +
> +    /*
> +     * Xen should not decode the instruction when it was trapped due to
> +     * translation fault.
> +     */
> +    if ( dabt->s1ptw )
> +        return IO_UNHANDLED;
> +
> +    /*
> +     * If the fault occurred due to cache maintenance or address translation
> +     * instructions, then Xen needs to ignore these instructions.
> +     */
> +    if ( dabt->cache )
> +        return IO_IGNORED;

IMO, IO_IGNORED is the same as IO_HANDLED because ignoring an access is 
a form of handling it. We are using it like that in a few places.

> +
> +    rc = decode_instruction(regs, dabt);
> +    if ( rc )
> +    {
> +        gprintk(XENLOG_ERR, "Unable to decode instruction\n");
> +        return IO_ABORT;
> +    }
> +    else
> +        return IO_HANDLED;

I think you are misusing io_state here. The I/O has not been handled 
yet. You only managed to decode it... IOW, the I/O access may still 
technically fail afterwards.

> +}
> +
>   enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>                                 const union hsr hsr,
>                                 paddr_t gpa)
> @@ -106,21 +135,14 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>           .gpa = gpa,
>           .dabt = dabt
>       };
> +    int rc;
> +    bool instr_decoded = false;
>   
>       ASSERT(hsr.ec == HSR_EC_DATA_ABORT_LOWER_EL);
>   
> -    /* All the instructions used on emulated MMIO region should be valid */
> -    if ( !dabt.valid )
> -    {
> -        gprintk(XENLOG_DEBUG, "No valid instruction syndrome for data abort\n");
> -        return IO_ABORT;
> -    }
> -

It looks like this patch is based on your other patch. However, you said 
there will be no v2. So please rebase it.

>       handler = find_mmio_handler(v->domain, info.gpa);
>       if ( !handler )
>       {
> -        int rc;
> -
>           rc = try_fwd_ioserv(regs, v, &info);
>           if ( rc == IO_HANDLED )
>               return handle_ioserv(regs, v);
> @@ -128,6 +150,21 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>           return rc;
>       }
>   
> +    /*
> +     * Armv8 processor does not provide a valid syndrome for decoding some
> +     * instructions. So in order to process these instructions, Xen must
> +     * decode them.
> +     */
> +    if ( !dabt.valid )
> +    {
> +        rc = try_decode_instruction_invalid_iss(regs, &info.dabt);
> +
> +        if ( rc != IO_HANDLED)
> +            return rc;
> +        else
> +            instr_decoded = true;
> +    }
> +
>       /*
>        * Erratum 766422: Thumb store translation fault to Hypervisor may
>        * not have correct HSR Rt value.
> @@ -146,9 +183,16 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>       }
>   
>       if ( info.dabt.write )
> -        return handle_write(handler, v, &info);
> +        rc = handle_write(handler, v, &info);
>       else
> -        return handle_read(handler, v, &info);
> +        rc = handle_read(handler, v, &info);
> +
> +    if ( instr_decoded )
> +    {
> +        post_increment_register(&info.dabt.dabt_instr);
> +    }

I thought I mentionned before. I don't think this is correct to call 
post_increment_register() if rc is not equal IO_HANDLED. We want to let 
the guest know there was an abort and let the guest handling it (and 
possibly retry).

If you increment/decrement the register, then the next execution would 
end up to be wrong.

> +
> +    return rc;
>   }
>   
>   void register_mmio_handler(struct domain *d,
> diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
> index 308650b400..f19fb46f72 100644
> --- a/xen/arch/arm/ioreq.c
> +++ b/xen/arch/arm/ioreq.c
> @@ -23,16 +23,35 @@
>   
>   #include <public/hvm/ioreq.h>
>   
> +#include "decode.h"
> +
>   enum io_state handle_ioserv(struct cpu_user_regs *regs, struct vcpu *v)
>   {
>       const union hsr hsr = { .bits = regs->hsr };
> -    const struct hsr_dabt dabt = hsr.dabt;
> +    struct hsr_dabt dabt = hsr.dabt;
> +
>       /* Code is similar to handle_read */
>       register_t r = v->io.req.data;
>   
>       /* We are done with the IO */
>       v->io.req.state = STATE_IOREQ_NONE;
>   
> +    /*
> +     * Note that we have already decoded the instruction in try_fwd_ioserv().
> +     * We decode the instruction again to obtain rn and imm9. This will be used
> +     * to do the post increment.
> +     * Also there is no need to check whether the instruction can be decoded or
> +     * was successfully decoded. The reason being if there was an error, then
> +     * try_fwd_ioserv() would have returned error and this function would not
> +     * have been called. Thus, there is an assumption that handle_iosev() is
> +     * invoked when try_fwd_ioserv() has returned successfully.

I am afraid this is not a correct assumption. Another vCPU can modify 
the instruction between the two decoding. So the right solution is to 
stash the information for latter consumption.

> +     */
> +    if ( !dabt.valid )
> +    {
> +        decode_instruction(regs, &dabt);
> +        post_increment_register(&dabt.dabt_instr);
> +    }
> +
>       if ( dabt.write )
>           return IO_HANDLED;
>   
> @@ -65,6 +84,8 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
>       };
>       struct ioreq_server *s = NULL;
>       enum io_state rc;
> +    bool instr_decoded = false;
> +    const union hsr hsr = { .bits = regs->hsr };
>   
>       if ( vio->req.state != STATE_IOREQ_NONE )
>       {
> @@ -76,8 +97,18 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
>       if ( !s )
>           return IO_UNHANDLED;
>   
> +    /*
> +     * Armv8 processor does not provide a valid syndrome for decoding some
> +     * instructions (for eg post-indexing ldr/str instructions). So in order to
> +     * process these instructions, Xen must decode them.
> +     */
>       if ( !info->dabt.valid )
> -        return IO_ABORT;
> +    {
> +        rc = try_decode_instruction_invalid_iss(regs, &info->dabt);
> +
> +        if ( rc != IO_HANDLED)
> +            return rc;
> +    }

As you pointed out previously, the field SAS (Syndrome Access Size) is 
invalid when the ISV=0. So the decoding needs to be done *before* we 
select the IOREQ server.

But as I said, this would result to decode the instruciton when this is 
not necessary. This is where Stefano's suggestion in [1] is useful.

For ISV=0, it will be a lot more common to trap because of a P2M 
translation fault (of the MMIO is not mapped). So we should call that 
first and then, if it still not resolved, try to decode the instruction.

With that in place, you are avoiding the issue in try_fwd_ioserv().

Can you please coordinate with Stefano?

>   
>       vio->req = p;
>   
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index 219ab3c3fb..2958e4b697 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -1979,6 +1979,7 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
>               {
>               case IO_ABORT:
>                   goto inject_abt;
> +            case IO_IGNORED:
>               case IO_HANDLED:
>                   advance_pc(regs, hsr);
>                   return;
> diff --git a/xen/include/asm-arm/hsr.h b/xen/include/asm-arm/hsr.h
> index 9b91b28c48..2d1fbec2ab 100644
> --- a/xen/include/asm-arm/hsr.h
> +++ b/xen/include/asm-arm/hsr.h
> @@ -143,6 +143,11 @@ union hsr {
>           unsigned long valid:1; /* Syndrome Valid */
>           unsigned long len:1;   /* Instruction length */
>           unsigned long ec:6;    /* Exception Class */
> +
> +        struct hsr_dabt_instr_details {
> +            unsigned long rn:5;
> +            signed int imm9:9;
> +        } dabt_instr; /* Data abort details obtained from instr decoding */

The header hsr.h is describing structure used by the Arm Arm. In 
particular, this change will at least impact the size of union hsr and I 
am concerned there may be other consequences.

What I meant by augmented dabt is something like:

struct {
    hsr_dabt dabt;
    struct instr_details {
    }
}

In fact looking at the code, I think we can add your new structure in 
mmio_info_t.

>       } dabt; /* HSR_EC_DATA_ABORT_* */
>   
>       /* Contain the common bits between DABT and IABT */
> diff --git a/xen/include/asm-arm/mmio.h b/xen/include/asm-arm/mmio.h
> index 7ab873cb8f..0cf00bc5a7 100644
> --- a/xen/include/asm-arm/mmio.h
> +++ b/xen/include/asm-arm/mmio.h
> @@ -36,6 +36,7 @@ enum io_state
>   {
>       IO_ABORT,       /* The IO was handled by the helper and led to an abort. */
>       IO_HANDLED,     /* The IO was successfully handled by the helper. */
> +    IO_IGNORED,     /* The IO was ignored by the helper. */
>       IO_UNHANDLED,   /* The IO was not handled by the helper. */
>       IO_RETRY,       /* Retry the emulation for some reason */
>   };
> diff --git a/xen/include/asm-arm/traps.h b/xen/include/asm-arm/traps.h
> index 2ed2b85c6f..bd22c6575d 100644
> --- a/xen/include/asm-arm/traps.h
> +++ b/xen/include/asm-arm/traps.h
> @@ -109,6 +109,7 @@ static inline register_t sign_extend(const struct hsr_dabt dabt, register_t r)
>       return r;
>   }
>   
> +void post_increment_register(const struct hsr_dabt_instr_details *instr_details);

Coding style: Let's keep the newline before #endif.

>   #endif /* __ASM_ARM_TRAPS__ */
>   /*
>    * Local variables:

Cheers,

[1] alpine.DEB.2.22.394.2201271327430.27308@ubuntu-linux-20-04-desktop

-- 
Julien Grall

