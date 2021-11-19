Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE13E457576
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 18:27:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228153.394716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo7f2-0003T2-NE; Fri, 19 Nov 2021 17:26:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228153.394716; Fri, 19 Nov 2021 17:26:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo7f2-0003Qx-K9; Fri, 19 Nov 2021 17:26:52 +0000
Received: by outflank-mailman (input) for mailman id 228153;
 Fri, 19 Nov 2021 17:26:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mo7f0-0003QV-7f
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 17:26:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mo7ez-0004XS-Me; Fri, 19 Nov 2021 17:26:49 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.20.70]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mo7ez-00082P-Fw; Fri, 19 Nov 2021 17:26:49 +0000
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
	bh=U5dnynHItuKNkRyATJgUnaJ9FKE9f4aAg4CAIDjAJao=; b=dYSbn9gAWTV5u3YqPIl8XYUs7S
	A2cYfp3c7HtoEFvyQ/MsR4jn5wGH21aiZysW7B31pxaCXXwETDu4smSSg7pIWhtRLJqYxD7Zug2wk
	KW914dJiPkX9TphOFeMys86lXSjaA83N7wrUUsgx+QA7MuGynBBqlBCKgxr/xSr/2Wuc=;
Message-ID: <647a76f8-fea9-57b3-eb64-82a67adba1fb@xen.org>
Date: Fri, 19 Nov 2021 17:26:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [RFC PATCH] Added the logic to decode 32 bit ldr/str
 post-indexing instructions
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@xilinx.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com, rahul.singh@arm.com,
 ayankuma@xilinx.com
References: <20211119165202.42442-1-ayankuma@xilinx.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211119165202.42442-1-ayankuma@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 19/11/2021 16:52, Ayan Kumar Halder wrote:
> At present, post indexing instructions are not emulated by Xen.

Can you explain in the commit message why this is a problem?

> When Xen gets the exception, EL2_ESR.ISV bit not set. Thus as a
> result, data abort is triggered.
> 
> Added the logic to decode ldr/str post indexing instructions.
> With this, Xen can decode instructions like these:-
> ldr w2, [x1], #4
> Thus, domU can read ioreg with post indexing instructions.
Hmmm.... Don't you also need to update the register x1 after the 
instruction was emulated?

> 
> Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
> ---
> Note to reviewer:-
> This patch is based on an issue discussed in
> https://lists.xenproject.org/archives/html/xen-devel/2021-11/msg00969.html
> "Xen/ARM - Query about a data abort seen while reading GICD registers"
> 
> 
>   xen/arch/arm/decode.c | 77 +++++++++++++++++++++++++++++++++++++++++++
>   xen/arch/arm/io.c     | 14 ++++++--
>   2 files changed, 88 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
> index 792c2e92a7..7b60bedbc5 100644
> --- a/xen/arch/arm/decode.c
> +++ b/xen/arch/arm/decode.c
> @@ -84,6 +84,80 @@ bad_thumb2:
>       return 1;
>   }
>   
> +static inline int32_t extract32(uint32_t value, int start, int length)

Any reason to have start and length signed?

> +{
> +    int32_t ret;
> +
> +    if ( !(start >= 0 && length > 0 && length <= 32 - start) )
> +        return -EINVAL;
> +
> +    ret = (value >> start) & (~0U >> (32 - length));

This would be easier to read if you use GENMASK().

> +
> +    return ret;
> +}
> +
> +static int decode_64bit_loadstore_postindexing(register_t pc, struct hsr_dabt *dabt)
> +{
> +    uint32_t instr;
> +    int size;
> +    int v;
> +    int opc;
> +    int rt;
> +    int imm9;

Should all those variables need to be signed?

> +
> +    /* For details on decoding, refer to Armv8 Architecture reference manual
> +     * Section - "Load/store register (immediate post-indexed)", Pg 318
The page number varies between revision of the Armv8 spec. So can you 
specify which version you used?

> +    */

The coding style for comment in Xen is:

/*
  * Foo
  * Bar
  */

> +    if ( raw_copy_from_guest(&instr, (void * __user)pc, sizeof (instr)) )
> +        return -EFAULT;
> +
> +    /* First, let's check for the fixed values */
> +
> +    /*  As per the "Encoding table for the Loads and Stores group", Pg 299

Same question here about the version.

> +     * op4 = 1 - Load/store register (immediate post-indexed)
> +     */

Coding style.

> +    if ( extract32(instr, 10, 2) != 1 )
> +        goto bad_64bit_loadstore;
> +
> +    /* For the following, refer to "Load/store register (immediate post-indexed)"
> +     * to get the fixed values at various bit positions.
> +     */
> +    if ( extract32(instr, 21, 1) != 0 )
> +        goto bad_64bit_loadstore;
> +
> +    if ( extract32(instr, 24, 2) != 0 )
> +        goto bad_64bit_loadstore;
> +
> +    if ( extract32(instr, 27, 3) != 7 )
> +        goto bad_64bit_loadstore;
> +
> +    size = extract32(instr, 30, 2);
> +    v = extract32(instr, 26, 1);
> +    opc = extract32(instr, 22, 1);
> +
> +    /* At the moment, we support STR(immediate) - 32 bit variant and
> +     * LDR(immediate) - 32 bit variant only.
> +     */

Coding style.

> +    if (!((size==2) && (v==0) && ((opc==0) || (opc==1))))
>

The coding style for this should be:

if ( !(( size == 2 ) && ( ... ) ... ) )

  +        goto bad_64bit_loadstore;
> +
> +    rt = extract32(instr, 0, 5);
> +    imm9 = extract32(instr, 12, 9);
> +
> +    if ( imm9 < 0 )
> +        update_dabt(dabt, rt, size, true);
> +    else
> +        update_dabt(dabt, rt, size, false);

This could be simplified with:

update_dabt(dabt, rt, size, imm9 < 0);

> +
> +    dabt->valid = 1;
> +
> +
> +    return 0;
> +bad_64bit_loadstore:
> +    gprintk(XENLOG_ERR, "unhandled 64bit instruction 0x%x\n", instr);
> +    return 1;
> +}
> +
>   static int decode_thumb(register_t pc, struct hsr_dabt *dabt)
>   {
>       uint16_t instr;
> @@ -155,6 +229,9 @@ int decode_instruction(const struct cpu_user_regs *regs, struct hsr_dabt *dabt)
>       if ( is_32bit_domain(current->domain) && regs->cpsr & PSR_THUMB )
>           return decode_thumb(regs->pc, dabt);
>   
> +    if ( is_64bit_domain(current->domain) )

You can still run 32-bit code in 64-bit domain. So I think you want to 
check the SPSR mode.

> +        return decode_64bit_loadstore_postindexing(regs->pc, dabt);
> +
>       /* TODO: Handle ARM instruction */
>       gprintk(XENLOG_ERR, "unhandled ARM instruction\n");

I think this comment should now be updated to "unhandled 32-bit ...".

>   
> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
> index 729287e37c..49e80358c0 100644
> --- a/xen/arch/arm/io.c
> +++ b/xen/arch/arm/io.c
> @@ -106,14 +106,13 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>           .gpa = gpa,
>           .dabt = dabt
>       };
> +    int rc;
>   
>       ASSERT(hsr.ec == HSR_EC_DATA_ABORT_LOWER_EL);
>   
>       handler = find_mmio_handler(v->domain, info.gpa);
>       if ( !handler )
>       {
> -        int rc;
> -
>           rc = try_fwd_ioserv(regs, v, &info);
>           if ( rc == IO_HANDLED )
>               return handle_ioserv(regs, v);
> @@ -123,7 +122,16 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>   
>       /* All the instructions used on emulated MMIO region should be valid */
>       if ( !dabt.valid )
> -        return IO_ABORT;
> +    {
> +        /*
> +         * Post indexing ldr/str instructions are not emulated by Xen. So, the
> +         * ISS is invalid. In such a scenario, we try to manually decode the
> +         * instruction from the program counter.

I am afraid this is wrong. The problem here is the processor didn't 
provide a valid syndrom for post-indexing ldr/str instructions. So in 
order to support them, Xen must decode.

> +         */
> +        rc = decode_instruction(regs, &info.dabt);

I actually expect this to also be useful when forwarding the I/O to 
device-model. So I would move the decoding earlier in the code and the 
check of dabt.valid earlier.

> +        if ( rc )
> +            return IO_ABORT;
> +    }
>   
>       /*
>        * Erratum 766422: Thumb store translation fault to Hypervisor may
> 

Cheers,

-- 
Julien Grall

