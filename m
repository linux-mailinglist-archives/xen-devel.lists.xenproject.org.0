Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC824B3B4B
	for <lists+xen-devel@lfdr.de>; Sun, 13 Feb 2022 13:21:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270964.465287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJDqo-0001Az-Um; Sun, 13 Feb 2022 12:19:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270964.465287; Sun, 13 Feb 2022 12:19:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJDqo-00019A-R0; Sun, 13 Feb 2022 12:19:34 +0000
Received: by outflank-mailman (input) for mailman id 270964;
 Sun, 13 Feb 2022 12:19:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nJDqm-000194-K5
 for xen-devel@lists.xenproject.org; Sun, 13 Feb 2022 12:19:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nJDqm-0008Lz-Ac; Sun, 13 Feb 2022 12:19:32 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nJDqm-0006iN-4n; Sun, 13 Feb 2022 12:19:32 +0000
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
	bh=H1OhpEfaf7zVs6t7T7nrliV14lWX9YMX8nzaHgAZefg=; b=NaqPkwwbflAohkET9s8XEPdZSg
	JZ9fdwqqTNYdr7RuO6ZBwb1uINDGvdkwH5Ug6L8o19UcXo+XZKiCzHSkFuIM2wcO4JwuLTAoihv2v
	5a8G8qxHV9SpllAQT9/zmWng0yPU+RnPkmd2PZMLstQMQOmMHzS62er7TFWwBPxxzxw4=;
Message-ID: <1599e2f3-0a34-020a-dd42-5ba87dad555d@xen.org>
Date: Sun, 13 Feb 2022 12:19:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [XEN v8 2/2] xen/arm64: io: Support instructions (for which ISS
 is not valid) on emulated MMIO region using MMIO/ioreq handler
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, Ayan Kumar Halder <ayankuma@xilinx.com>
References: <20220212233433.46018-1-ayankuma@xilinx.com>
 <20220212233433.46018-3-ayankuma@xilinx.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220212233433.46018-3-ayankuma@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 12/02/2022 23:34, Ayan Kumar Halder wrote:
> 
>   xen/arch/arm/arm32/traps.c        |  7 +++
>   xen/arch/arm/arm64/traps.c        | 47 +++++++++++++++
>   xen/arch/arm/decode.c             |  1 +
>   xen/arch/arm/include/asm/domain.h |  4 ++
>   xen/arch/arm/include/asm/mmio.h   | 15 ++++-
>   xen/arch/arm/include/asm/traps.h  |  2 +
>   xen/arch/arm/io.c                 | 98 ++++++++++++++++++++-----------
>   xen/arch/arm/ioreq.c              |  7 ++-
>   xen/arch/arm/traps.c              | 80 +++++++++++++++++++++----
>   xen/arch/x86/include/asm/ioreq.h  |  3 +

This change technically needs an ack from the x86 maintainers. And...

>   xen/include/xen/sched.h           |  2 +

this one for anyone from THE REST (Stefano and I are part of it). Please 
use scripts/add_maintainers.pl to automatically add the relevant 
maintainers in CC.

>   11 files changed, 217 insertions(+), 49 deletions(-)
> 
> diff --git a/xen/arch/arm/arm32/traps.c b/xen/arch/arm/arm32/traps.c
> index 9c9790a6d1..70c6238196 100644
> --- a/xen/arch/arm/arm32/traps.c
> +++ b/xen/arch/arm/arm32/traps.c
> @@ -18,9 +18,11 @@
>   
>   #include <xen/lib.h>
>   #include <xen/kernel.h>
> +#include <xen/sched.h>
>   
>   #include <public/xen.h>
>   
> +#include <asm/mmio.h>
>   #include <asm/processor.h>
>   #include <asm/traps.h>
>   
> @@ -82,6 +84,11 @@ void do_trap_data_abort(struct cpu_user_regs *regs)
>           do_unexpected_trap("Data Abort", regs);
>   }
>   
> +void post_increment_register(const struct instr_details *instr)
> +{
> +    domain_crash(current->domain);


Please add a comment explaning why this is resulting to a domain crash. 
AFAICT, this is because this should not be reachable (yet) for 32-bit.


> +}
> +
>   /*
>    * Local variables:
>    * mode: C
> diff --git a/xen/arch/arm/arm64/traps.c b/xen/arch/arm/arm64/traps.c
> index 9113a15c7a..a6766689b3 100644
> --- a/xen/arch/arm/arm64/traps.c
> +++ b/xen/arch/arm/arm64/traps.c
> @@ -23,6 +23,7 @@
>   #include <asm/processor.h>
>   
>   #include <public/xen.h>
> +#include <xen/sched.h>

The headers should ordered so <xen/*.h> are first, then <asm/*.h>, then 
<public/*.h>. They should then be ordered alphabetically within each of 
the category.

So, this new header should be included right after <xen/lib.h>

[...]

> diff --git a/xen/arch/arm/include/asm/mmio.h b/xen/arch/arm/include/asm/mmio.h
> index 3354d9c635..745130b7fe 100644
> --- a/xen/arch/arm/include/asm/mmio.h
> +++ b/xen/arch/arm/include/asm/mmio.h
> @@ -26,12 +26,22 @@
>   
>   #define MAX_IO_HANDLER  16
>   
> +enum instr_decode_state
> +{
> +    INSTR_ERROR,                    /* Error encountered while decoding instr */
> +    INSTR_VALID,                    /* ISS is valid, so no need to decode */
> +    INSTR_LDR_STR_POSTINDEXING,     /* Instruction is decoded successfully.
> +                                       It is ldr/str post indexing */

Coding style: multiple-line comments for Xen should be:

/*
  * ...
  * ...
  */

In this case, I would simply move the comment on top.

[...]

> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
> index a289d393f9..203466b869 100644
> --- a/xen/arch/arm/io.c
> +++ b/xen/arch/arm/io.c
> @@ -95,57 +95,87 @@ static const struct mmio_handler *find_mmio_handler(struct domain *d,
>       return handler;
>   }
>   
> +void try_decode_instruction(const struct cpu_user_regs *regs,
> +                            mmio_info_t *info)
> +{
> +    int rc;
> +
> +    /*
> +     * Erratum 766422: Thumb store translation fault to Hypervisor may
> +     * not have correct HSR Rt value.
> +     */
> +    if ( check_workaround_766422() && (regs->cpsr & PSR_THUMB) &&
> +         info->dabt.write )
> +    {
> +        rc = decode_instruction(regs, info);
> +        if ( rc )
> +        {
> +            gprintk(XENLOG_DEBUG, "Unable to decode instruction\n");
> +            info->dabt_instr.state = INSTR_ERROR;
> +            return;
> +        }
> +    }

At the moment, the errata would only be handled when the ISS is valid. 
Now, you are moving it before we know if it is valid. Can you explain why?

[...]

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
> +    handler = find_mmio_handler(v->domain, info->gpa);
>       if ( !handler )
>       {
> -        int rc;
> -
> -        rc = try_fwd_ioserv(regs, v, &info);
> +        rc = try_fwd_ioserv(regs, v, info);
>           if ( rc == IO_HANDLED )
>               return handle_ioserv(regs, v);
>   
>           return rc;
>       }
>   
> -    /* All the instructions used on emulated MMIO region should be valid */
> -    if ( !dabt.valid )
> -        return IO_ABORT;
> -

AFAIU, the assumption is now try_handle_mmio() and try_fwd_ioserv() will 
always be called when dabt.valid == 1. I think it would still be good to 
check that assumption.

So I would move the check at the beginning of try_handle_mmio() and add 
an ASSERT_UNREACHABLE in the if(). Something like:

if ( !dabt.valid )
{
     ASSERT_UNREACHABLE();
     return IO_ABORT;
}

>       /*
> -     * Erratum 766422: Thumb store translation fault to Hypervisor may
> -     * not have correct HSR Rt value.
> +     * At this point, we know that the instruction is either valid or has been
> +     * decoded successfully. Thus, Xen should be allowed to execute the
> +     * instruction on the emulated MMIO region.
>        */
> -    if ( check_workaround_766422() && (regs->cpsr & PSR_THUMB) &&
> -         dabt.write )
> -    {
> -        int rc;
> -
> -        rc = decode_instruction(regs, &info);
> -        if ( rc )
> -        {
> -            gprintk(XENLOG_DEBUG, "Unable to decode instruction\n");
> -            return IO_ABORT;
> -        }
> -    }
> -
> -    if ( info.dabt.write )
> -        return handle_write(handler, v, &info);
> +    if ( info->dabt.write )
> +        rc = handle_write(handler, v, info);
>       else
> -        return handle_read(handler, v, &info);
> +        rc = handle_read(handler, v, info);
> +
> +    return rc;

It looks like there are some left-over of the previous approach. It is 
fine to return directly from each branch.


>   }
>   
>   void register_mmio_handler(struct domain *d,
> diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
> index 308650b400..3c0a935ccf 100644
> --- a/xen/arch/arm/ioreq.c
> +++ b/xen/arch/arm/ioreq.c
> @@ -47,6 +47,7 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
>                                struct vcpu *v, mmio_info_t *info)
>   {
>       struct vcpu_io *vio = &v->io;
> +    struct dabt_instr instr = info->dabt_instr;
>       ioreq_t p = {
>           .type = IOREQ_TYPE_COPY,
>           .addr = info->gpa,
> @@ -76,10 +77,8 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
>       if ( !s )
>           return IO_UNHANDLED;
>   
> -    if ( !info->dabt.valid )
> -        return IO_ABORT;
> -

For this one, I would switch to ASSERT(dabt.valid);

>       vio->req = p;
> +    vio->info.dabt_instr = instr;
>   
>       rc = ioreq_send(s, &p, 0);
>       if ( rc != IO_RETRY || v->domain->is_shutting_down )
> @@ -95,6 +94,7 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
>   bool arch_ioreq_complete_mmio(void)
>   {
>       struct vcpu *v = current;
> +    struct instr_details dabt_instr = v->io.info.dabt_instr;
>       struct cpu_user_regs *regs = guest_cpu_user_regs();
>       const union hsr hsr = { .bits = regs->hsr };
>   
> @@ -106,6 +106,7 @@ bool arch_ioreq_complete_mmio(void)
>   
>       if ( handle_ioserv(regs, v) == IO_HANDLED )
>       {
> +        post_increment_register(&dabt_instr);
>           advance_pc(regs, hsr);
>           return true;
>       }
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index 9339d12f58..455e51cdbe 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -1893,6 +1893,21 @@ static bool try_map_mmio(gfn_t gfn)
>       return !map_regions_p2mt(d, gfn, 1, mfn, p2m_mmio_direct_c);
>   }
>   
> +static inline bool check_p2m(bool is_data, paddr_t gpa)
> +{
> +    /*
> +     * First check if the translation fault can be resolved by the P2M subsystem.
> +     * If that's the case nothing else to do.
> +     */
> +    if ( p2m_resolve_translation_fault(current->domain,gaddr_to_gfn(gpa)) )

Coding style: missing space before and after the comma.

> +        return true;
> +
> +    if ( is_data && try_map_mmio(gaddr_to_gfn(gpa)) )
> +        return true;
> +
> +    return false;
> +}
> +
>   static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
>                                          const union hsr hsr)
>   {
> @@ -1906,6 +1921,7 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
>       paddr_t gpa;
>       uint8_t fsc = xabt.fsc & ~FSC_LL_MASK;
>       bool is_data = (hsr.ec == HSR_EC_DATA_ABORT_LOWER_EL);
> +    mmio_info_t info;
>   
>       /*
>        * If this bit has been set, it means that this stage-2 abort is caused
> @@ -1959,6 +1975,25 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
>           return;
>       }
>       case FSC_FLT_TRANS:
> +    {
> +        info.gpa = gpa;
> +        info.dabt = hsr.dabt;
> +
> +        /* Check that the ISS is invalid and it is not data abort. */

This comment looks a bit pointless. You are writing literally what the 
check is doing. But you don't really explain why. I think you want to 
move some of the commint with the if here.

However,...

> +        if ( !hsr.dabt.valid && !is_data )

... this code can be reached by Instruction Abort and Data Abort. So you 
can't use hsr.dabt. Instead, you should use xabt (or check is_data first).

If you use xabt, you will notice that the 'valid' bit is not existent
because the instruction syndrome only exists for data abort.

But then, I don't understand why this is only restricted to instruction 
abort. As I wrote in the previous versions and on IRC, there are valid 
use cases to trap a data abort with invalid syndrome. Below...


> +        {
> +
> +            /*
> +             * Assumption :- Most of the times when we get a translation fault
> +             * and the ISS is invalid, the underlying cause is that the page
> +             * tables have not been set up correctly.
> +             */
> +            if ( check_p2m(is_data, gpa) )
> +                return;
> +            else
> +                goto inject_abt;
> +        }
> +
>           /*
>            * Attempt first to emulate the MMIO as the data abort will
>            * likely happen in an emulated region.
> @@ -1967,13 +2002,45 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
>            */
>           if ( is_data )
>           {
> -            enum io_state state = try_handle_mmio(regs, hsr, gpa);
> +            enum io_state state;
> +
> +            try_decode_instruction(regs, &info);
> +
> +            /*
> +             * If Xen could not decode the instruction for any reason, then it
> +             * should ask the caller to abort the guest.
> +             */
> +            if ( info.dabt_instr.state == INSTR_ERROR )
> +                goto inject_abt;

... this will inject a data abort to the guest when we can't decode. 
This is not what we want. We should check whether this is a P2M 
translation fault or we need to map an MMIO region.

In pseudo-code, this would look like:

if ( !is_data || hsr.dabt.valid )
{
     if ( check_p2m() )
       return;


     if ( !is_data )
        goto inject_dabt;

     decode_instruction();
     if ( !dabt.invalid )
       goto inject_dabt;
}

try_handle_mmio();

if ( instruction was not decoded )
   check_p2m();

Cheers,

-- 
Julien Grall

