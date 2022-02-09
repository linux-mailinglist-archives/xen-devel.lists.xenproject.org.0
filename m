Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E53B4AE65E
	for <lists+xen-devel@lfdr.de>; Wed,  9 Feb 2022 02:51:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268755.462699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHc8E-0006cv-NF; Wed, 09 Feb 2022 01:50:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268755.462699; Wed, 09 Feb 2022 01:50:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHc8E-0006b9-J2; Wed, 09 Feb 2022 01:50:54 +0000
Received: by outflank-mailman (input) for mailman id 268755;
 Wed, 09 Feb 2022 01:50:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c0q/=SY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nHc8C-0006b3-V3
 for xen-devel@lists.xenproject.org; Wed, 09 Feb 2022 01:50:53 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b38db284-894a-11ec-8f75-fffcc8bd4f1a;
 Wed, 09 Feb 2022 02:50:50 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DC81061870;
 Wed,  9 Feb 2022 01:50:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1620C004E1;
 Wed,  9 Feb 2022 01:50:45 +0000 (UTC)
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
X-Inumbo-ID: b38db284-894a-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644371446;
	bh=S3CVGNlN7AFl5B6x2W5L4nV3yuYiwegzzJVch0aiuC4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GixZTAIarnoe2U4MQShIVHB3xbqHdCCJqLikCpyngP1tkEcfI1QVAb5xRM0fDleNI
	 ixG8yJpbfASXKwXQN8W7NIiYmP9zLe34OF0m/yiMu8z1Y234IcQEBkJkUXKBsc78aR
	 7IQcp2bZ2Q0IeRkzwv4NUQcUQFa2NFhR0ZBLM4OpjgjWbgOvJ/4TVFaoTcyz5KjqLe
	 Kk0QfY6nn13GF1zUipeojXwR0S9t5zI+K1fTTcBmv0wBbueQYgiPtlVZkRD4aGlzD4
	 jNqejUmZboH1ig5N8bpwUDQwf34iWbQCk++PLYjXSo7Xyd6AxyXBO8EUzw57JxsMHR
	 ZhA128rj4KUEQ==
Date: Tue, 8 Feb 2022 17:50:45 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
cc: xen-devel@lists.xenproject.org, ayankuma@xilinx.com, 
    sstabellini@kernel.org, stefanos@xilinx.com, julien@xen.org, 
    Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
Subject: Re: [XEN v7 2/2] xen/arm64: io: Support instructions (for which ISS
 is not valid) on emulated MMIO region using MMIO/ioreq handler
In-Reply-To: <20220205225816.5952-3-ayankuma@xilinx.com>
Message-ID: <alpine.DEB.2.22.394.2202081730130.2091381@ubuntu-linux-20-04-desktop>
References: <20220205225816.5952-1-ayankuma@xilinx.com> <20220205225816.5952-3-ayankuma@xilinx.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 5 Feb 2022, Ayan Kumar Halder wrote:
> When an instruction is trapped in Xen due to translation fault, Xen checks if
> the ISS is valid. If not, Xen tries to resolve the translation fault using
> p2m page tables. In case if it is a data abort, Xen will try to map the mmio
> region to the guest (ie tries to emulate the mmio region).
> 
> If the ISS is not valid, then Xen tries to decode the instruction. In case of
> ioreq, Xen  saves the decoding state, rn and imm9 to vcpu_io. Whenever the
> vcpu handles the ioreq successfully, it will read the decoding state to
> determine if the instruction decoded was a ldr/str post indexing (ie
> INSTR_LDR_STR_POSTINDEXING). If so, it uses these details to post increment rn.
> 
> In case of mmio handler, if the mmio operation was successful, then Xen retrives
> the decoding state, rn and imm9. For state == INSTR_LDR_STR_POSTINDEXING, Xen
> will update rn.
> 
> If there is an error encountered while decoding the instruction, Xen will issue
> an abort to the guest. If the instruction was related to cache maintenance, Xen
> will not decode the instruction or do any MMIO operation. Rather it simply
> increments the PC and returns to the guest. If the instruction was trapped due
> to stage1 page translation table walk, Xen will update the page tables and will
> return to the guest so that it can retry the instruction. To handle all these
> different states, we have introduced 'enum instr_decode_state'.
> 
> Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
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
>  xen/arch/arm/arm32/traps.c        |   7 ++
>  xen/arch/arm/arm64/traps.c        |  47 +++++++++++++
>  xen/arch/arm/decode.c             |   1 +
>  xen/arch/arm/decode.h             |   3 +-
>  xen/arch/arm/include/asm/domain.h |   4 ++
>  xen/arch/arm/include/asm/ioreq.h  |   1 +
>  xen/arch/arm/include/asm/mmio.h   |  16 ++++-
>  xen/arch/arm/include/asm/traps.h  |   2 +
>  xen/arch/arm/io.c                 | 108 ++++++++++++++++++++----------
>  xen/arch/arm/ioreq.c              |  12 ++--
>  xen/arch/arm/traps.c              |  85 ++++++++++++++++++++---
>  xen/arch/x86/include/asm/ioreq.h  |   3 +
>  xen/include/xen/sched.h           |   2 +
>  13 files changed, 240 insertions(+), 51 deletions(-)
> 
> diff --git a/xen/arch/arm/arm32/traps.c b/xen/arch/arm/arm32/traps.c
> index 9c9790a6d1..70c6238196 100644
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
> @@ -82,6 +84,11 @@ void do_trap_data_abort(struct cpu_user_regs *regs)
>          do_unexpected_trap("Data Abort", regs);
>  }
>  
> +void post_increment_register(const struct instr_details *instr)
> +{
> +    domain_crash(current->domain);
> +}
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/arch/arm/arm64/traps.c b/xen/arch/arm/arm64/traps.c
> index 9113a15c7a..a6766689b3 100644
> --- a/xen/arch/arm/arm64/traps.c
> +++ b/xen/arch/arm/arm64/traps.c
> @@ -23,6 +23,7 @@
>  #include <asm/processor.h>
>  
>  #include <public/xen.h>
> +#include <xen/sched.h>
>  
>  static const char *handler[]= {
>          "Synchronous Abort",
> @@ -44,6 +45,52 @@ void do_bad_mode(struct cpu_user_regs *regs, int reason)
>      panic("bad mode\n");
>  }
>  
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
> +            val = regs->sp_el0;
> +        else
> +        {
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
> index 3f2d2a3f62..0a4d9d2772 100644
> --- a/xen/arch/arm/decode.c
> +++ b/xen/arch/arm/decode.c
> @@ -147,6 +147,7 @@ static int decode_arm64(register_t pc, mmio_info_t *info)
>  
>      update_dabt(dabt, opcode.ldr_str.rt, opcode.ldr_str.size, false);
>  
> +    dabt_instr->state = INSTR_LDR_STR_POSTINDEXING;
>      dabt_instr->rn = opcode.ldr_str.rn;
>      dabt_instr->imm9 = opcode.ldr_str.imm9;
>  
> diff --git a/xen/arch/arm/decode.h b/xen/arch/arm/decode.h
> index fe7512a053..6a09b07b46 100644
> --- a/xen/arch/arm/decode.h
> +++ b/xen/arch/arm/decode.h
> @@ -52,7 +52,8 @@ union instr {
>  #define POST_INDEX_FIXED_MASK   0x3B200C00
>  #define POST_INDEX_FIXED_VALUE  0x38000400
>  
> -/* Decode an instruction from pc
> +/*
> + * Decode an instruction from pc
>   * /!\ This function is intended to decode an instruction. It considers that the
>   * instruction is valid.
>   *

Ah! It should have been in the previous patch


> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> index 9b3647587a..29efbbd334 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -266,6 +266,10 @@ static inline void arch_vcpu_block(struct vcpu *v) {}
>  /* vPCI is not available on Arm */
>  #define has_vpci(d)    ({ (void)(d); false; })
>  
> +struct arch_vcpu_io {
> +    struct instr_details *dabt_instr; /* when the instruction is decoded */
> +};
> +
>  #endif /* __ASM_DOMAIN_H__ */
>  
>  /*
> diff --git a/xen/arch/arm/include/asm/ioreq.h b/xen/arch/arm/include/asm/ioreq.h
> index 50185978d5..a2f2cf76c7 100644
> --- a/xen/arch/arm/include/asm/ioreq.h
> +++ b/xen/arch/arm/include/asm/ioreq.h
> @@ -52,6 +52,7 @@ static inline void msix_write_completion(struct vcpu *v)
>  {
>  }
>  
> +

Spurious change


>  /* This correlation must not be altered */
>  #define IOREQ_STATUS_HANDLED     IO_HANDLED
>  #define IOREQ_STATUS_UNHANDLED   IO_UNHANDLED
> diff --git a/xen/arch/arm/include/asm/mmio.h b/xen/arch/arm/include/asm/mmio.h
> index 3354d9c635..fb7ff72cdc 100644
> --- a/xen/arch/arm/include/asm/mmio.h
> +++ b/xen/arch/arm/include/asm/mmio.h
> @@ -26,12 +26,23 @@
>  
>  #define MAX_IO_HANDLER  16
>  
> +enum instr_decode_state
> +{
> +    INSTR_ERROR,                    /* Error encountered while decoding instr */
> +    INSTR_VALID,                    /* ISS is valid, so no need to decode */
> +    INSTR_LDR_STR_POSTINDEXING,     /* Instruction is decoded successfully.
> +                                       It is ldr/str post indexing */
> +    INSTR_IGNORE,                   /* Instruction is to be ignored (ie NOP) */
> +    INSTR_RETRY                     /* Instruction is to be retried */
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
> @@ -69,14 +80,15 @@ struct vmmio {
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
> index a289d393f9..25bc7e481a 100644
> --- a/xen/arch/arm/io.c
> +++ b/xen/arch/arm/io.c
> @@ -95,57 +95,97 @@ static const struct mmio_handler *find_mmio_handler(struct domain *d,
>      return handler;
>  }
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
> +
> +    /* If ISS is valid, then no need to decode the instruction any further */
> +    if ( info->dabt.valid )
> +    {
> +        info->dabt_instr.state = INSTR_VALID;
> +        return;
> +    }
> +
> +    /*
> +     * Xen should not decode the instruction when it was trapped due to
> +     * translation fault.
> +     */
> +    if ( info->dabt.s1ptw )
> +    {
> +        info->dabt_instr.state = INSTR_RETRY;
> +        return;
> +    }
> +
> +    /*
> +     * If the fault occurred due to cache maintenance or address translation
> +     * instructions, then Xen needs to ignore these instructions.
> +     */
> +    if ( info->dabt.cache )
> +    {
> +        info->dabt_instr.state = INSTR_IGNORE;
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
> +    handler = find_mmio_handler(v->domain, info->gpa);
>      if ( !handler )
>      {
> -        int rc;
> -
> -        rc = try_fwd_ioserv(regs, v, &info);
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
> +        rc = handle_write(handler, v, info);
>      else
> -        return handle_read(handler, v, &info);
> +        rc = handle_read(handler, v, info);
> +
> +    return rc;
>  }
>  
>  void register_mmio_handler(struct domain *d,
> diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
> index 308650b400..ec830a7a4a 100644
> --- a/xen/arch/arm/ioreq.c
> +++ b/xen/arch/arm/ioreq.c
> @@ -26,7 +26,8 @@
>  enum io_state handle_ioserv(struct cpu_user_regs *regs, struct vcpu *v)
>  {
>      const union hsr hsr = { .bits = regs->hsr };
> -    const struct hsr_dabt dabt = hsr.dabt;
> +    struct hsr_dabt dabt = hsr.dabt;

This change is not needed, right?


>      /* Code is similar to handle_read */
>      register_t r = v->io.req.data;
>  
> @@ -47,6 +48,7 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
>                               struct vcpu *v, mmio_info_t *info)
>  {
>      struct vcpu_io *vio = &v->io;
> +    struct dabt_instr *instr = &info->dabt_instr;
>      ioreq_t p = {
>          .type = IOREQ_TYPE_COPY,
>          .addr = info->gpa,
> @@ -65,6 +67,8 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
>      };
>      struct ioreq_server *s = NULL;
>      enum io_state rc;
> +    bool instr_decoded = false;
> +    const union hsr hsr = { .bits = regs->hsr };

It doesn't look like these two local variables are actually used
anywhere


>      if ( vio->req.state != STATE_IOREQ_NONE )
>      {
> @@ -76,10 +80,8 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
>      if ( !s )
>          return IO_UNHANDLED;
>  
> -    if ( !info->dabt.valid )
> -        return IO_ABORT;
> -
>      vio->req = p;
> +    vio->info.dabt_instr = instr;
>  
>      rc = ioreq_send(s, &p, 0);
>      if ( rc != IO_RETRY || v->domain->is_shutting_down )
> @@ -95,6 +97,7 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
>  bool arch_ioreq_complete_mmio(void)
>  {
>      struct vcpu *v = current;
> +    struct instr_details *dabt_instr = v->io.info.dabt_instr;
>      struct cpu_user_regs *regs = guest_cpu_user_regs();
>      const union hsr hsr = { .bits = regs->hsr };

I don't think that v->io.info.dabt_instr should be a pointer because at
this point the original structure is long gone. The original field was a
local variable mmio_info_t info in do_trap_stage2_abort_guest. So by the
time arch_ioreq_complete_mmio is called, the original variable has been
deallocated.

Instead, v->io.info.dabt_instr should be a "struct instr_details" (no
pointer).


> @@ -106,6 +109,7 @@ bool arch_ioreq_complete_mmio(void)
>  
>      if ( handle_ioserv(regs, v) == IO_HANDLED )
>      {
> +        post_increment_register(dabt_instr);
>          advance_pc(regs, hsr);
>          return true;
>      }
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index 9339d12f58..fb5a2f9634 100644
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
> +    if ( p2m_resolve_translation_fault(current->domain,gaddr_to_gfn(gpa)) )
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
> @@ -1906,6 +1921,7 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
>      paddr_t gpa;
>      uint8_t fsc = xabt.fsc & ~FSC_LL_MASK;
>      bool is_data = (hsr.ec == HSR_EC_DATA_ABORT_LOWER_EL);
> +    mmio_info_t info;
>  
>      /*
>       * If this bit has been set, it means that this stage-2 abort is caused
> @@ -1959,6 +1975,25 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
>          return;
>      }
>      case FSC_FLT_TRANS:
> +    {
> +        info.gpa = gpa;
> +        info.dabt = hsr.dabt;
> +
> +        /* Check that the ISS is invalid and it is not data abort. */
> +        if ( !hsr.dabt.valid && !is_data )
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
>          /*
>           * Attempt first to emulate the MMIO as the data abort will
>           * likely happen in an emulated region.
> @@ -1967,13 +2002,49 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
>           */
>          if ( is_data )
>          {
> -            enum io_state state = try_handle_mmio(regs, hsr, gpa);
> +            enum io_state state;
> +
> +            try_decode_instruction(regs, &info);
> +
> +            /*
> +             * If the instruction was to be ignored by Xen, then it should return
> +             * to the caller which will increment the PC, so that the guest can
> +             * execute the next instruction.
> +             */
> +            if ( info.dabt_instr.state == INSTR_IGNORE )
> +            {
> +                advance_pc(regs, hsr);
> +                return;
> +            }
> +
> +            /*
> +             * If Xen could not decode the instruction for any reason, then it
> +             * should ask the caller to abort the guest.
> +             */
> +            else if ( info.dabt_instr.state == INSTR_ERROR )
> +                goto inject_abt;
> +
> +            /*
> +             * When the instruction needs to be retried by the guest after
> +             * resolving the translation fault.
> +             */
> +            else if ( info.dabt_instr.state == INSTR_RETRY )
> +                goto set_page_tables;
> +
> +            state = try_handle_mmio(regs, &info);
>  
>              switch ( state )
>              {
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
> @@ -1985,18 +2056,12 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
>              }
>          }
>  
> -        /*
> -         * First check if the translation fault can be resolved by the
> -         * P2M subsystem. If that's the case nothing else to do.
> -         */
> -        if ( p2m_resolve_translation_fault(current->domain,
> -                                           gaddr_to_gfn(gpa)) )
> -            return;
> -
> -        if ( is_data && try_map_mmio(gaddr_to_gfn(gpa)) )
> + set_page_tables:
> +        if ( check_p2m(is_data, gpa) )
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
> index 37f78cc4c4..afe5508be8 100644
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

