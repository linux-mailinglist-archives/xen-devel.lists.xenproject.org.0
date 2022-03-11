Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8AF4D57D1
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 02:59:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288639.489520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSUZ9-0002pF-7J; Fri, 11 Mar 2022 01:59:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288639.489520; Fri, 11 Mar 2022 01:59:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSUZ9-0002nQ-3v; Fri, 11 Mar 2022 01:59:39 +0000
Received: by outflank-mailman (input) for mailman id 288639;
 Fri, 11 Mar 2022 01:59:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8RDm=TW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nSUZ7-0002nK-Cs
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 01:59:37 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e62c8b77-a0de-11ec-8eba-a37418f5ba1a;
 Fri, 11 Mar 2022 02:59:35 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E3AACB824C7;
 Fri, 11 Mar 2022 01:59:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0BFEC340E8;
 Fri, 11 Mar 2022 01:59:31 +0000 (UTC)
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
X-Inumbo-ID: e62c8b77-a0de-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646963972;
	bh=TP2QHoLbLWo/yoHssUP0NSw9VEr2vUTbAGTNwOHLcj4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PXu2Q6xTMDytpBVx8odLOXqYGb2SF5/R/q5Qmr/jXKMcIcFvPdMPyfaYiJVYHfLcL
	 evDTr51/5IvY+P8OtWXu2Fxven+pR7uqhj4mUOxugQv7oD3P/Ajnbd2hX7eDiPx7Py
	 d1tN5H0m+HA25iAbPHF0NSG4i32b16yp1+6pthel7WVVxu0+WyrGYyrHpvYcaONCfa
	 lgGR40/GoY82jzBdovcdv5Fs8+GGd5vR85mrotuVBvmeQEDvIbSH8i1y91monT+eWF
	 STjjeT6r5yLpQg7br6MjP0J+dlxK0vq7vsk1Ne2QSa+oQxEbqxeK1rl5Nlia0XvrLc
	 oKpgLM1sCROBA==
Date: Thu, 10 Mar 2022 17:59:31 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    stefanos@xilinx.com, julien@xen.org, Volodymyr_Babchuk@epam.com, 
    bertrand.marquis@arm.com, andrew.cooper3@citrix.com, 
    george.dunlap@citrix.com, jbeulich@suse.com, wl@xen.org, paul@xen.org, 
    roger.pau@citrix.com, Ayan Kumar Halder <ayankuma@xilinx.com>
Subject: Re: [XEN v10 2/4] xen/arm64: io: Support instructions (for which
 ISS is not valid) on emulated MMIO region using MMIO/ioreq handler
In-Reply-To: <20220310174501.62040-3-ayankuma@xilinx.com>
Message-ID: <alpine.DEB.2.22.394.2203101759210.3261@ubuntu-linux-20-04-desktop>
References: <20220310174501.62040-1-ayankuma@xilinx.com> <20220310174501.62040-3-ayankuma@xilinx.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 10 Mar 2022, Ayan Kumar Halder wrote:
> When an instruction is trapped in Xen due to translation fault, Xen
> checks if the ISS is invalid (for data abort) or it is an instruction
> abort. If so, Xen tries to resolve the translation fault using p2m page
> tables. In case of data abort, Xen will try to map the mmio region to
> the guest (ie tries to emulate the mmio region).
> 
> If the ISS is not valid and it is a data abort, then Xen tries to
> decode the instruction. In case of ioreq, Xen  saves the decoding state,
> rn and imm9 to vcpu_io. Whenever the vcpu handles the ioreq successfully,
> it will read the decoding state to determine if the instruction decoded
> was a ldr/str post indexing (ie INSTR_LDR_STR_POSTINDEXING). If so, it
> uses these details to post increment rn.
> 
> In case of mmio handler, if the mmio operation was successful, then Xen
> retrives the decoding state, rn and imm9. For state ==
> INSTR_LDR_STR_POSTINDEXING, Xen will update rn.
> 
> If there is an error encountered while decoding/executing the instruction,
> Xen will forward the abort to the guest.
> 
> Also, the logic to infer the type of instruction has been moved from
> try_handle_mmio() to try_decode_instruction() which is called before.
> try_handle_mmio() is solely responsible for handling the mmio operation.
> 
> Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> 
> Changelog :-
> 
> v2..v5 - Mentioned in the cover letter.
> 
> v6 - 1. Mantained the decoding state of the instruction. This is used by the
> caller to either abort the guest or retry or ignore or perform read/write on
> the mmio region.
> 
> 2. try_decode() invokes decoding for both aarch64 and thumb state. (Previously
> it used to invoke decoding only for aarch64 state). Thus, it handles all the
> checking of the registers before invoking any decoding of instruction.
> try_decode_instruction_invalid_iss() has thus been removed.
> 
> 3. Introduced a new field('enum instr_decode_state state') inside
> 'struct instr_details'. This holds the decoding state of the instruction.
> This is later read by the post_increment_register() to determine if rn needs to
> be incremented. Also, this is read by the callers of try_decode_instruction()
> to determine if the instruction was valid or ignored or to be retried or
> error or decoded successfully.
> 
> 4. Also stored 'instr_details' inside 'struct ioreq'. This enables
> arch_ioreq_complete_mmio() to invoke post_increment_register() without decoding
> the instruction again.
> 
> 5. Check hsr.dabt.valid in do_trap_stage2_abort_guest(). If it is not valid,
> then decode the instruction. This ensures that try_handle_mmio() is invoked only
> when the instruction is either valid or decoded successfully.
> 
> 6. Inside do_trap_stage2_abort_guest(), if hsr.dabt.valid is not set, then
> resolve the translation fault before trying to decode the instruction. If
> translation fault is resolved, then return to the guest to execute the instruction
> again.
> 
> 
> v7 - 1. Moved the decoding instruction details ie instr_details from 'struct ioreq'
> to 'struct vcpu_io'.
> 
> 2. The instruction is decoded only when we get a data abort.
> 
> 3. Replaced ASSERT_UNREACHABLE() with domain_crash(). The reason being asserts
> can be disabled in some builds. In this scenario when the guest's cpsr is in an
> erroneous state, Xen should crash the guest.
> 
> 4. Introduced check_p2m() which invokes p2m_resolve_translation_fault() and
> try_map_mmio() to resolve translation fault by configuring the page tables. This
> gets invoked first if ISS is invalid and it is an instruction abort. If it is
> a data abort and hsr.dabt.s1ptw is set or try_handle_mmio() returns IO_UNHANDLED,
> then check_p2m() gets invoked again.
> 
> 
> v8 - 1. Removed the handling of data abort when info->dabt.cache is set. This will
> be implemented in a subsequent patch. (Not as part of this series)
> 
> 2. When the data abort is due to access to stage 1 translation tables, Xen will
> try to fix the mapping of the page table for the corresponding address. If this
> returns an error, Xen will abort the guest. Else, it will ask the guest to retry
> the instruction.
> 
> 3. Changed v->io.info.dabt_instr from pointer to variable. The reason being that
> arch_ioreq_complete_mmio() is called from leave_hypervisor_to_guest().
> That is after do_trap_stage2_abort_guest()  has been invoked. So the original
> variable will be no longer valid.
> 
> 4. Some other style issues pointed out in v7.
> 
> 
> v9 - 1. Ensure that "Erratum 766422" is handled only when ISS is valid.
> 
> 2. Whenever Xen receives and instruction abort or data abort (with invalid ISS),
> Xen should first try to resolve the p2m translation fault or see if it it needs
> to map a MMIO region. If it succeeds, it should return to the guest to retry the
> instruction.
> 
> 3. Removed handling of "dabt.s1ptw == 1" aborts. This is addressed in patch3 as
> it is an existing bug in codebase.
> 
> 4. Various style issues pointed by Julien in v8.
> 
> 
> v10 - 1. Set 'dabt.valid=1' when the instruction is fully decoded. This is
> checked in try_handle_mmio() and try_fwd_ioserv().
> 
> 2. Various other style issues pointed in v9.
> 
>  xen/arch/arm/arm32/traps.c        | 11 ++++
>  xen/arch/arm/arm64/traps.c        | 52 ++++++++++++++++++
>  xen/arch/arm/decode.c             |  2 +
>  xen/arch/arm/include/asm/domain.h |  4 ++
>  xen/arch/arm/include/asm/mmio.h   | 17 +++++-
>  xen/arch/arm/include/asm/traps.h  |  2 +
>  xen/arch/arm/io.c                 | 90 +++++++++++++++++++------------
>  xen/arch/arm/ioreq.c              |  8 ++-
>  xen/arch/arm/traps.c              | 77 ++++++++++++++++++++------
>  xen/arch/x86/include/asm/ioreq.h  |  3 ++
>  xen/include/xen/sched.h           |  2 +
>  11 files changed, 214 insertions(+), 54 deletions(-)
> 
> diff --git a/xen/arch/arm/arm32/traps.c b/xen/arch/arm/arm32/traps.c
> index 9c9790a6d1..159e3cef8b 100644
> --- a/xen/arch/arm/arm32/traps.c
> +++ b/xen/arch/arm/arm32/traps.c
> @@ -18,9 +18,11 @@
>  
>  #include <xen/lib.h>
>  #include <xen/kernel.h>
> +#include <xen/sched.h>
>  
>  #include <public/xen.h>
>  
> +#include <asm/mmio.h>
>  #include <asm/processor.h>
>  #include <asm/traps.h>
>  
> @@ -82,6 +84,15 @@ void do_trap_data_abort(struct cpu_user_regs *regs)
>          do_unexpected_trap("Data Abort", regs);
>  }
>  
> +void post_increment_register(const struct instr_details *instr)
> +{
> +    /*
> +     * We have not implemented decoding of post indexing instructions for 32 bit.
> +     * Thus, this should be unreachable.
> +     */
> +    domain_crash(current->domain);
> +}
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/arch/arm/arm64/traps.c b/xen/arch/arm/arm64/traps.c
> index 9113a15c7a..6ce4a1fa8c 100644
> --- a/xen/arch/arm/arm64/traps.c
> +++ b/xen/arch/arm/arm64/traps.c
> @@ -17,6 +17,7 @@
>   */
>  
>  #include <xen/lib.h>
> +#include <xen/sched.h>
>  
>  #include <asm/hsr.h>
>  #include <asm/system.h>
> @@ -44,6 +45,57 @@ void do_bad_mode(struct cpu_user_regs *regs, int reason)
>      panic("bad mode\n");
>  }
>  
> +void post_increment_register(const struct instr_details *instr)
> +{
> +    struct cpu_user_regs *regs = guest_cpu_user_regs();
> +    register_t val = 0;
> +    uint8_t psr_mode = (regs->cpsr & PSR_MODE_MASK);
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
> +    if ( instr->rn == 31 )
> +    {
> +        switch ( psr_mode )
> +        {
> +        case PSR_MODE_EL1h:
> +            val = regs->sp_el1;
> +            break;
> +        case PSR_MODE_EL1t:
> +        case PSR_MODE_EL0t:
> +            val = regs->sp_el0;
> +            break;
> +
> +        default:
> +            domain_crash(current->domain);
> +            return;
> +        }
> +    }
> +    else
> +        val = get_user_reg(regs, instr->rn);
> +
> +    val += instr->imm9;
> +
> +    if ( instr->rn == 31 )
> +    {
> +        if ( (regs->cpsr & PSR_MODE_MASK) == PSR_MODE_EL1h )
> +            regs->sp_el1 = val;
> +        else
> +            regs->sp_el0 = val;
> +    }
> +    else
> +        set_user_reg(regs, instr->rn, val);
> +}
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
> index 3add87e83a..f5f6562600 100644
> --- a/xen/arch/arm/decode.c
> +++ b/xen/arch/arm/decode.c
> @@ -146,8 +146,10 @@ static int decode_arm64(register_t pc, mmio_info_t *info)
>  
>      update_dabt(dabt, opcode.ldr_str.rt, opcode.ldr_str.size, false);
>  
> +    dabt_instr->state = INSTR_LDR_STR_POSTINDEXING;
>      dabt_instr->rn = opcode.ldr_str.rn;
>      dabt_instr->imm9 = opcode.ldr_str.imm9;
> +    dabt->valid = 1;
>  
>      return 0;
>  
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> index c56f6e4398..ed63c2b6f9 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -281,6 +281,10 @@ static inline void arch_vcpu_block(struct vcpu *v) {}
>  /* vPCI is not available on Arm */
>  #define has_vpci(d)    ({ (void)(d); false; })
>  
> +struct arch_vcpu_io {
> +    struct instr_details dabt_instr; /* when the instruction is decoded */
> +};
> +
>  #endif /* __ASM_DOMAIN_H__ */
>  
>  /*
> diff --git a/xen/arch/arm/include/asm/mmio.h b/xen/arch/arm/include/asm/mmio.h
> index 3354d9c635..ca259a79c2 100644
> --- a/xen/arch/arm/include/asm/mmio.h
> +++ b/xen/arch/arm/include/asm/mmio.h
> @@ -26,12 +26,24 @@
>  
>  #define MAX_IO_HANDLER  16
>  
> +enum instr_decode_state
> +{
> +    INSTR_ERROR,                    /* Error encountered while decoding instr */
> +    INSTR_VALID,                    /* ISS is valid, so no need to decode */
> +    /*
> +     * Instruction is decoded successfully. It is a ldr/str post indexing
> +     * instruction.
> +     */
> +    INSTR_LDR_STR_POSTINDEXING,
> +};
> +
>  typedef struct
>  {
>      struct hsr_dabt dabt;
>      struct instr_details {
>          unsigned long rn:5;
>          signed int imm9:9;
> +        enum instr_decode_state state;
>      } dabt_instr;
>      paddr_t gpa;
>  } mmio_info_t;
> @@ -69,14 +81,15 @@ struct vmmio {
>  };
>  
>  enum io_state try_handle_mmio(struct cpu_user_regs *regs,
> -                              const union hsr hsr,
> -                              paddr_t gpa);
> +                              mmio_info_t *info);
>  void register_mmio_handler(struct domain *d,
>                             const struct mmio_handler_ops *ops,
>                             paddr_t addr, paddr_t size, void *priv);
>  int domain_io_init(struct domain *d, int max_count);
>  void domain_io_free(struct domain *d);
>  
> +void try_decode_instruction(const struct cpu_user_regs *regs,
> +                            mmio_info_t *info);
>  
>  #endif  /* __ASM_ARM_MMIO_H__ */
>  
> diff --git a/xen/arch/arm/include/asm/traps.h b/xen/arch/arm/include/asm/traps.h
> index 2ed2b85c6f..95c46ad391 100644
> --- a/xen/arch/arm/include/asm/traps.h
> +++ b/xen/arch/arm/include/asm/traps.h
> @@ -109,6 +109,8 @@ static inline register_t sign_extend(const struct hsr_dabt dabt, register_t r)
>      return r;
>  }
>  
> +void post_increment_register(const struct instr_details *instr);
> +
>  #endif /* __ASM_ARM_TRAPS__ */
>  /*
>   * Local variables:
> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
> index fad103bdbd..fd903b7b03 100644
> --- a/xen/arch/arm/io.c
> +++ b/xen/arch/arm/io.c
> @@ -102,57 +102,79 @@ static const struct mmio_handler *find_mmio_handler(struct domain *d,
>      return handler;
>  }
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
> +        {
> +            rc = decode_instruction(regs, info);
> +            if ( rc )
> +            {
> +                gprintk(XENLOG_DEBUG, "Unable to decode instruction\n");
> +                info->dabt_instr.state = INSTR_ERROR;
> +            }
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
>  enum io_state try_handle_mmio(struct cpu_user_regs *regs,
> -                              const union hsr hsr,
> -                              paddr_t gpa)
> +                              mmio_info_t *info)
>  {
>      struct vcpu *v = current;
>      const struct mmio_handler *handler = NULL;
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
> +    if ( !info->dabt.valid )
>      {
> -        int rc;
> +        ASSERT_UNREACHABLE();
> +        return IO_ABORT;
> +    }
>  
> -        rc = try_fwd_ioserv(regs, v, &info);
> +    handler = find_mmio_handler(v->domain, info->gpa);
> +    if ( !handler )
> +    {
> +        rc = try_fwd_ioserv(regs, v, info);
>          if ( rc == IO_HANDLED )
>              return handle_ioserv(regs, v);
>  
>          return rc;
>      }
>  
> -    /* All the instructions used on emulated MMIO region should be valid */
> -    if ( !dabt.valid )
> -        return IO_ABORT;
> -
>      /*
> -     * Erratum 766422: Thumb store translation fault to Hypervisor may
> -     * not have correct HSR Rt value.
> +     * At this point, we know that the instruction is either valid or has been
> +     * decoded successfully. Thus, Xen should be allowed to execute the
> +     * instruction on the emulated MMIO region.
>       */
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
> +        return handle_write(handler, v, info);
>      else
> -        return handle_read(handler, v, &info);
> +        return handle_read(handler, v, info);
>  }
>  
>  void register_mmio_handler(struct domain *d,
> diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
> index 308650b400..cc9bf23213 100644
> --- a/xen/arch/arm/ioreq.c
> +++ b/xen/arch/arm/ioreq.c
> @@ -47,6 +47,8 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
>                               struct vcpu *v, mmio_info_t *info)
>  {
>      struct vcpu_io *vio = &v->io;
> +    struct instr_details instr = info->dabt_instr;
> +    struct hsr_dabt dabt = info->dabt;
>      ioreq_t p = {
>          .type = IOREQ_TYPE_COPY,
>          .addr = info->gpa,
> @@ -76,10 +78,10 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
>      if ( !s )
>          return IO_UNHANDLED;
>  
> -    if ( !info->dabt.valid )
> -        return IO_ABORT;
> +    ASSERT(dabt.valid);
>  
>      vio->req = p;
> +    vio->info.dabt_instr = instr;
>  
>      rc = ioreq_send(s, &p, 0);
>      if ( rc != IO_RETRY || v->domain->is_shutting_down )
> @@ -95,6 +97,7 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
>  bool arch_ioreq_complete_mmio(void)
>  {
>      struct vcpu *v = current;
> +    struct instr_details dabt_instr = v->io.info.dabt_instr;
>      struct cpu_user_regs *regs = guest_cpu_user_regs();
>      const union hsr hsr = { .bits = regs->hsr };
>  
> @@ -106,6 +109,7 @@ bool arch_ioreq_complete_mmio(void)
>  
>      if ( handle_ioserv(regs, v) == IO_HANDLED )
>      {
> +        post_increment_register(&dabt_instr);
>          advance_pc(regs, hsr);
>          return true;
>      }
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index 7a1b679b8c..53652d7781 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -1893,6 +1893,21 @@ static bool try_map_mmio(gfn_t gfn)
>      return !map_regions_p2mt(d, gfn, 1, mfn, p2m_mmio_direct_c);
>  }
>  
> +static inline bool check_p2m(bool is_data, paddr_t gpa)
> +{
> +    /*
> +     * First check if the translation fault can be resolved by the P2M subsystem.
> +     * If that's the case nothing else to do.
> +     */
> +    if ( p2m_resolve_translation_fault(current->domain , gaddr_to_gfn(gpa)) )
> +        return true;
> +
> +    if ( is_data && try_map_mmio(gaddr_to_gfn(gpa)) )
> +        return true;
> +
> +    return false;
> +}
> +
>  static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
>                                         const union hsr hsr)
>  {
> @@ -1906,6 +1921,8 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
>      paddr_t gpa;
>      uint8_t fsc = xabt.fsc & ~FSC_LL_MASK;
>      bool is_data = (hsr.ec == HSR_EC_DATA_ABORT_LOWER_EL);
> +    mmio_info_t info;
> +    enum io_state state;
>  
>      /*
>       * If this bit has been set, it means that this stage-2 abort is caused
> @@ -1959,21 +1976,52 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
>          return;
>      }
>      case FSC_FLT_TRANS:
> +    {
> +        info.gpa = gpa;
> +        info.dabt = hsr.dabt;
> +
>          /*
> -         * Attempt first to emulate the MMIO as the data abort will
> -         * likely happen in an emulated region.
> -         *
> -         * Note that emulated region cannot be executed
> +         * Assumption :- Most of the times when we get a data abort and the ISS
> +         * is invalid or an instruction abort, the underlying cause is that the
> +         * page tables have not been set up correctly.
>           */
> -        if ( is_data )
> +        if ( !is_data || !info.dabt.valid )
>          {
> -            enum io_state state = try_handle_mmio(regs, hsr, gpa);
> +            if ( check_p2m(is_data, gpa) )
> +                return;
>  
> -            switch ( state )
> -            {
> +            /*
> +             * If the instruction abort could not be resolved by setting the
> +             * appropriate bits in the translation table, then Xen should
> +             * forward the abort to the guest.
> +             */
> +            if ( !is_data )
> +                goto inject_abt;
> +        }
> +
> +        try_decode_instruction(regs, &info);
> +
> +        /*
> +         * If Xen could not decode the instruction or encountered an error
> +         * while decoding, then it should forward the abort to the guest.
> +         */
> +        if ( info.dabt_instr.state == INSTR_ERROR )
> +            goto inject_abt;
> +
> +        state = try_handle_mmio(regs, &info);
> +
> +        switch ( state )
> +        {
>              case IO_ABORT:
>                  goto inject_abt;
>              case IO_HANDLED:
> +                /*
> +                 * If the instruction was decoded and has executed successfully
> +                 * on the MMIO region, then Xen should execute the next part of
> +                 * the instruction. (for eg increment the rn if it is a
> +                 * post-indexing instruction.
> +                 */
> +                post_increment_register(&info.dabt_instr);
>                  advance_pc(regs, hsr);
>                  return;
>              case IO_RETRY:
> @@ -1982,21 +2030,18 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
>              case IO_UNHANDLED:
>                  /* IO unhandled, try another way to handle it. */
>                  break;
> -            }
>          }
>  
>          /*
> -         * First check if the translation fault can be resolved by the
> -         * P2M subsystem. If that's the case nothing else to do.
> +         * If the instruction syndrome was invalid, then we already checked if
> +         * this was due to a P2M fault. So no point to check again as the result
> +         * will be the same.
>           */
> -        if ( p2m_resolve_translation_fault(current->domain,
> -                                           gaddr_to_gfn(gpa)) )
> -            return;
> -
> -        if ( is_data && try_map_mmio(gaddr_to_gfn(gpa)) )
> +        if ( (info.dabt_instr.state == INSTR_VALID) && check_p2m(is_data, gpa) )
>              return;
>  
>          break;
> +    }
>      default:
>          gprintk(XENLOG_WARNING,
>                  "Unsupported FSC: HSR=%#"PRIregister" DFSC=%#x\n",
> diff --git a/xen/arch/x86/include/asm/ioreq.h b/xen/arch/x86/include/asm/ioreq.h
> index d06ce9a6ea..ecfe7f9fdb 100644
> --- a/xen/arch/x86/include/asm/ioreq.h
> +++ b/xen/arch/x86/include/asm/ioreq.h
> @@ -26,6 +26,9 @@
>  #include <asm/hvm/ioreq.h>
>  #endif
>  
> +struct arch_vcpu_io {
> +};
> +
>  #endif /* __ASM_X86_IOREQ_H__ */
>  
>  /*
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 10ea969c7a..406d9bc610 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -160,6 +160,8 @@ struct vcpu_io {
>      /* I/O request in flight to device model. */
>      enum vio_completion  completion;
>      ioreq_t              req;
> +    /* Arch specific info pertaining to the io request */
> +    struct arch_vcpu_io  info;
>  };
>  
>  struct vcpu
> -- 
> 2.17.1
> 
> 

