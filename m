Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCED4A7D01
	for <lists+xen-devel@lfdr.de>; Thu,  3 Feb 2022 01:45:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264463.457570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFQFM-0008N8-Kd; Thu, 03 Feb 2022 00:45:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264463.457570; Thu, 03 Feb 2022 00:45:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFQFM-0008LH-HT; Thu, 03 Feb 2022 00:45:12 +0000
Received: by outflank-mailman (input) for mailman id 264463;
 Thu, 03 Feb 2022 00:45:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VklA=SS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nFQFL-0008IN-FU
 for xen-devel@lists.xenproject.org; Thu, 03 Feb 2022 00:45:11 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88e36a5f-848a-11ec-8eb8-a37418f5ba1a;
 Thu, 03 Feb 2022 01:45:10 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 71F8D60C0D;
 Thu,  3 Feb 2022 00:45:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 728E5C004E1;
 Thu,  3 Feb 2022 00:45:06 +0000 (UTC)
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
X-Inumbo-ID: 88e36a5f-848a-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643849106;
	bh=Im11H1L8ze4uYI16QQMbKAIM4DiPehczorWfQ+SjV9k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oQMu22llX6KshLzFLQo29sBaaIixan6KOlZTdSQKoAiboSl1M8cWn2SxpjNPONUF4
	 wKoyijKTgy5ASRRf/PVsqo/LXgScSiwmvGANCNtnNrs1IQdmSXpXXZ2kPBbk3xtdsF
	 a2YRLAe0kl2Fx2gRDJAmonmGTVs1jzoXNxgDS5AvX0pPFbvOi7uyOUg4xob7TQ1NHC
	 Nv9BZW24WHRXDujt/1trxQyuNt0/lERrVoHkJAB6HEy0+JrKX7wvNseqS+jiEEhbq4
	 5XmGEfTQPtboY4DX4DzztKZvtk4xjEoY7Swse2WqiX1OfsyTtq02N+QRaozCvKvnI9
	 El6gJPMRWNm5Q==
Date: Wed, 2 Feb 2022 16:45:05 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>, 
    xen-devel@lists.xenproject.org, stefanos@xilinx.com, julien@xen.org, 
    Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com, 
    Ayan Kumar Halder <ayankuma@xilinx.com>
Subject: Re: [XEN v6 2/3] xen/arm64: io: Support instructions (for which ISS
 is not valid) on emulated MMIO region using MMIO handler
In-Reply-To: <alpine.DEB.2.22.394.2202021553210.4074808@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2202021644410.4074808@ubuntu-linux-20-04-desktop>
References: <20220202173017.48463-1-ayankuma@xilinx.com> <20220202173017.48463-3-ayankuma@xilinx.com> <alpine.DEB.2.22.394.2202021553210.4074808@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-788060652-1643849106=:4074808"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-788060652-1643849106=:4074808
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 2 Feb 2022, Stefano Stabellini wrote:
> On Wed, 2 Feb 2022, Ayan Kumar Halder wrote:
> > For instructions on MMIO regions emulated by Xen, Xen reads the
> > remaining bits of the HSR. It determines if the instruction is to be
> > ignored, retried or decoded. If it gets an error while decoding the
> > instruction, then it sends an abort to the guest.
> > 
> > If the instruction is valid or successfully decoded, Xen tries to
> > execute the instruction for the emulated MMIO region. If the instruction
> > was successfully executed, then Xen determines if the instruction needs
> > further processing. For eg:- In case of ldr/str post indexing on arm64,
> > the rn register needs to be updated.
> > 
> > Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
> > ---
> > 
> > Changelog :-
> > 
> > v2..v5 - Mentioned in the cover letter.
> > 
> > v6 - 1. Mantained the decoding state of the instruction. This is used by the
> > caller to either abort the guest or retry or ignore or perform read/write on
> > the mmio region.
> > 
> > 2. try_decode() invokes decoding for both aarch64 and thumb state. (Previously
> > it used to invoke decoding only for aarch64 state). Thus, it handles all the
> > checking of the registers before invoking any decoding of instruction.
> > try_decode_instruction_invalid_iss() has thus been removed.
> > 
> >  xen/arch/arm/arm32/traps.c       |   6 ++
> >  xen/arch/arm/arm64/traps.c       |  41 ++++++++++++
> >  xen/arch/arm/decode.h            |  12 +++-
> >  xen/arch/arm/include/asm/traps.h |   2 +
> >  xen/arch/arm/io.c                | 108 +++++++++++++++++++++++++------
> >  5 files changed, 148 insertions(+), 21 deletions(-)
> > 
> > diff --git a/xen/arch/arm/arm32/traps.c b/xen/arch/arm/arm32/traps.c
> > index 9c9790a6d1..6ad9a31499 100644
> > --- a/xen/arch/arm/arm32/traps.c
> > +++ b/xen/arch/arm/arm32/traps.c
> > @@ -21,6 +21,7 @@
> >  
> >  #include <public/xen.h>
> >  
> > +#include <asm/mmio.h>
> >  #include <asm/processor.h>
> >  #include <asm/traps.h>
> >  
> > @@ -82,6 +83,11 @@ void do_trap_data_abort(struct cpu_user_regs *regs)
> >          do_unexpected_trap("Data Abort", regs);
> >  }
> >  
> > +void post_increment_register(const struct instr_details *instr)
> > +{
> > +    ASSERT_UNREACHABLE();
> > +}
> > +
> >  /*
> >   * Local variables:
> >   * mode: C
> > diff --git a/xen/arch/arm/arm64/traps.c b/xen/arch/arm/arm64/traps.c
> > index 9113a15c7a..4de2206801 100644
> > --- a/xen/arch/arm/arm64/traps.c
> > +++ b/xen/arch/arm/arm64/traps.c
> > @@ -18,9 +18,12 @@
> >  
> >  #include <xen/lib.h>
> >  
> > +#include <asm/current.h>
> >  #include <asm/hsr.h>
> > +#include <asm/mmio.h>
> >  #include <asm/system.h>
> >  #include <asm/processor.h>
> > +#include <asm/regs.h>
> >  
> >  #include <public/xen.h>
> >  
> > @@ -44,6 +47,44 @@ void do_bad_mode(struct cpu_user_regs *regs, int reason)
> >      panic("bad mode\n");
> >  }
> >  
> > +void post_increment_register(const struct instr_details *instr)
> > +{
> > +    struct cpu_user_regs *regs = guest_cpu_user_regs();
> > +    register_t val;

val needs to be initialized:

traps.c: In function ‘post_increment_register’:
traps.c:79:9: error: ‘val’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
   79 |     val += instr->imm9;
      |     ~~~~^~~~~~~~~~~~~~



> > +    /*
> > +     * Handle when rn = SP
> > +     * Refer ArmV8 ARM DDI 0487G.b, Page - D1-2463 "Stack pointer register selection"
> > +     * t = SP_EL0
> > +     * h = SP_ELx
> > +     * and M[3:0] (Page - C5-474 "When exception taken from AArch64 state:")
> > +     */
> > +    if (instr->rn == 31 )
> > +    {
> > +        if ( (regs->cpsr & PSR_MODE_MASK) == PSR_MODE_EL1h )
> > +            val = regs->sp_el1;
> > +        else if ( ((regs->cpsr & PSR_MODE_MASK) == PSR_MODE_EL1t) ||
> > +                    ((regs->cpsr & PSR_MODE_MASK) == PSR_MODE_EL0t) )
> > +            val = regs->sp_el0;
> > +        else
> > +            ASSERT_UNREACHABLE();
> > +    }
> > +    else
> > +        val = get_user_reg(regs, instr->rn);
> > +
> > +    val += instr->imm9;
> > +
> > +    if ( instr->rn == 31 )
> > +    {
> > +        if ( (regs->cpsr & PSR_MODE_MASK) == PSR_MODE_EL1h )
> > +            regs->sp_el1 = val;
> > +        else
> > +            regs->sp_el0 = val;
> > +    }
> > +    else
> > +        set_user_reg(regs, instr->rn, val);
> > +}
> > +
> >  /*
> >   * Local variables:
> >   * mode: C
> > diff --git a/xen/arch/arm/decode.h b/xen/arch/arm/decode.h
> > index fe7512a053..5efd72405e 100644
> > --- a/xen/arch/arm/decode.h
> > +++ b/xen/arch/arm/decode.h
> > @@ -52,7 +52,17 @@ union instr {
> >  #define POST_INDEX_FIXED_MASK   0x3B200C00
> >  #define POST_INDEX_FIXED_VALUE  0x38000400
> >  
> > -/* Decode an instruction from pc
> > +enum instr_decode_state
> > +{
> > +    INSTR_ERROR, /* Error encountered while decoding the instruction */
> > +    INSTR_VALID, /* ISS is valid, so there is no need to decode */
> > +    INSTR_SUCCESS, /* Instruction is decoded successfully */
> > +    INSTR_IGNORE, /* Instruction is to be ignored (similar to NOP) */
> > +    INSTR_RETRY /* Instruction is to be retried */
> > +};
> > +
> > +/*
> > + * Decode an instruction from pc
> >   * /!\ This function is intended to decode an instruction. It considers that the
> >   * instruction is valid.
> >   *
> > diff --git a/xen/arch/arm/include/asm/traps.h b/xen/arch/arm/include/asm/traps.h
> > index 2ed2b85c6f..95c46ad391 100644
> > --- a/xen/arch/arm/include/asm/traps.h
> > +++ b/xen/arch/arm/include/asm/traps.h
> > @@ -109,6 +109,8 @@ static inline register_t sign_extend(const struct hsr_dabt dabt, register_t r)
> >      return r;
> >  }
> >  
> > +void post_increment_register(const struct instr_details *instr);
> > +
> >  #endif /* __ASM_ARM_TRAPS__ */
> >  /*
> >   * Local variables:
> > diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
> > index a289d393f9..1011327058 100644
> > --- a/xen/arch/arm/io.c
> > +++ b/xen/arch/arm/io.c
> > @@ -95,6 +95,59 @@ static const struct mmio_handler *find_mmio_handler(struct domain *d,
> >      return handler;
> >  }
> >  
> > +enum instr_decode_state try_decode_instruction(const struct cpu_user_regs *regs,
> > +                                               mmio_info_t *info)
> > +{
> > +    int rc;
> > +
> > +    /*
> > +     * Erratum 766422: Thumb store translation fault to Hypervisor may
> > +     * not have correct HSR Rt value.
> > +     */
> > +    if ( check_workaround_766422() && (regs->cpsr & PSR_THUMB) &&
> > +         info->dabt.write )
> > +    {
> > +        rc = decode_instruction(regs, info);
> > +        if ( rc )
> > +        {
> > +            gprintk(XENLOG_DEBUG, "Unable to decode instruction\n");
> > +            return INSTR_ERROR;
> > +        }
> 
> It looks like we want a "return" here? But it should work either way
> because it should return with the if ( info->dabt.valid ) check right
> after anyway.
> 
> 
> > +    }
> > +
> > +    /* If ISS is valid, then no need to decode the instruction any further */
> > +    if (info->dabt.valid)
> > +        return INSTR_VALID;
> 
> code style
> 
> 
> > +    /*
> > +     * Xen should not decode the instruction when it was trapped due to
> > +     * translation fault.
> > +     */
> > +    if ( info->dabt.s1ptw )
> > +        return INSTR_RETRY;
> > +
> > +    /*
> > +     * If the fault occurred due to cache maintenance or address translation
> > +     * instructions, then Xen needs to ignore these instructions.
> > +     */
> > +    if ( info->dabt.cache )
> > +        return INSTR_IGNORE;
> > +
> > +    /*
> > +     * Armv8 processor does not provide a valid syndrome for decoding some
> > +     * instructions. So in order to process these instructions, Xen must
> > +     * decode them.
> > +     */
> > +    rc = decode_instruction(regs, info);
> > +    if ( rc )
> > +    {
> > +        gprintk(XENLOG_ERR, "Unable to decode instruction\n");
> > +        return INSTR_ERROR;
> > +    }
> > +    else
> > +        return INSTR_SUCCESS;
> > +}
> > +
> >  enum io_state try_handle_mmio(struct cpu_user_regs *regs,
> >                                const union hsr hsr,
> >                                paddr_t gpa)
> > @@ -106,14 +159,14 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
> >          .gpa = gpa,
> >          .dabt = dabt
> >      };
> > +    int rc;
> > +    enum instr_decode_state state;
> >  
> >      ASSERT(hsr.ec == HSR_EC_DATA_ABORT_LOWER_EL);
> >  
> >      handler = find_mmio_handler(v->domain, info.gpa);
> >      if ( !handler )
> >      {
> > -        int rc;
> > -
> >          rc = try_fwd_ioserv(regs, v, &info);
> >          if ( rc == IO_HANDLED )
> >              return handle_ioserv(regs, v);
> > @@ -121,31 +174,46 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
> >          return rc;
> >      }
> >  
> > -    /* All the instructions used on emulated MMIO region should be valid */
> > -    if ( !dabt.valid )
> > +    state = try_decode_instruction(regs, &info);
> 
> We still have the issue that try_fwd_ioserv (called above) doesn't work
> properly if !dabt.valid. I think we need to call try_decode_instruction
> and do the "state" checks before find_mmio_handler/try_fwd_ioserv.
> 
> 
> > +    /*
> > +     * If the instruction was to be ignored by Xen, then it should return to the
> > +     * caller which will increment the PC, so that the guest can execute the
> > +     * next instruction.
> > +     */
> > +    if ( state == INSTR_IGNORE )
> > +        return IO_HANDLED;
> > +    /*
> > +     * If Xen could not decode the instruction for any reason, then it should
> > +     * ask the caller to abort the guest.
> > +     */
> > +    else if ( state == INSTR_ERROR )
> >          return IO_ABORT;
> > +    /* When the instruction needs to be retried by the guest */
> > +    else if ( state == INSTR_RETRY )
> > +        return IO_UNHANDLED;
> >  
> >      /*
> > -     * Erratum 766422: Thumb store translation fault to Hypervisor may
> > -     * not have correct HSR Rt value.
> > +     * At this point, we know that the instruction is either valid or has been
> > +     * decoded successfully. Thus, Xen should be allowed to execute the
> > +     * instruction on the emulated MMIO region.
> >       */
> > -    if ( check_workaround_766422() && (regs->cpsr & PSR_THUMB) &&
> > -         dabt.write )
> > -    {
> > -        int rc;
> > +    if ( info.dabt.write )
> > +        rc = handle_write(handler, v, &info);
> > +    else
> > +        rc = handle_read(handler, v, &info);
> >  
> > -        rc = decode_instruction(regs, &info);
> > -        if ( rc )
> > -        {
> > -            gprintk(XENLOG_DEBUG, "Unable to decode instruction\n");
> > -            return IO_ABORT;
> > -        }
> > +    /*
> > +     * If the instruction was decoded and has executed successfully on the MMIO
> > +     * region, then Xen should execute the next part of the instruction. (for eg
> > +     * increment the rn if it is a post-indexing instruction.
> > +     */
> > +    if ( (rc == IO_HANDLED) && (state == INSTR_SUCCESS) )
> > +    {
> > +        post_increment_register(&info.dabt_instr);
> >      }
> 
> We need to call post_increment_register also from arch_ioreq_complete_mmio for the IOREQ case.
> 
> 
> > -    if ( info.dabt.write )
> > -        return handle_write(handler, v, &info);
> > -    else
> > -        return handle_read(handler, v, &info);
> > +    return rc;
> >  }
> >  
> >  void register_mmio_handler(struct domain *d,
> > -- 
> > 2.17.1
> > 
> 
--8323329-788060652-1643849106=:4074808--

