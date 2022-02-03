Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB214A7D00
	for <lists+xen-devel@lfdr.de>; Thu,  3 Feb 2022 01:45:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264459.457559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFQEs-0007uh-BU; Thu, 03 Feb 2022 00:44:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264459.457559; Thu, 03 Feb 2022 00:44:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFQEs-0007rH-8S; Thu, 03 Feb 2022 00:44:42 +0000
Received: by outflank-mailman (input) for mailman id 264459;
 Thu, 03 Feb 2022 00:44:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VklA=SS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nFQEr-0007rB-3p
 for xen-devel@lists.xenproject.org; Thu, 03 Feb 2022 00:44:41 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76bdf27b-848a-11ec-8f75-fffcc8bd4f1a;
 Thu, 03 Feb 2022 01:44:38 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B64D060F6D;
 Thu,  3 Feb 2022 00:44:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE2A2C004E1;
 Thu,  3 Feb 2022 00:44:35 +0000 (UTC)
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
X-Inumbo-ID: 76bdf27b-848a-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643849076;
	bh=mBlyg4NA2FUdQEXT3MfDiueasuutyPNVUNbFYnChHng=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jvN/YSe5jNIOrg9315rj8jNRwC/qNPGgMZ6WekIlxsqxZPvf1uQD23LkqvpcFWm6I
	 XiG6IaywyNDYrDYeWuS2Xok4HBI9dMcOOciNdUg0iZFmeE6RqY9x+v8qQlDwHu6w8b
	 xSSTFPKqRizUqN/zVskdACBKld1ubb0ivXs2cJi8FxYGrAdU4LfZ3UTKz/9NR2NEbh
	 ZF2jK4gih0/ngpb4hlrIFGHNEmUTeDnXdPmr90eFfvaFokCVLDV7kCXIvpuUNUxg+n
	 C5e2cdw4hHs+PyG4HIaQECKzJBGvlouHYg0FAPKU57osLLtd9ELRGiPKN0ABFHhKEP
	 o4beZpsFMT40A==
Date: Wed, 2 Feb 2022 16:44:34 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    stefanos@xilinx.com, julien@xen.org, Volodymyr_Babchuk@epam.com, 
    bertrand.marquis@arm.com, Ayan Kumar Halder <ayankuma@xilinx.com>
Subject: Re: [XEN v6 3/3] xen/arm64: io: Support instructions (for which ISS
 is not valid) on emulated MMIO region using ioreq handler
In-Reply-To: <20220202173017.48463-4-ayankuma@xilinx.com>
Message-ID: <alpine.DEB.2.22.394.2202021609320.4074808@ubuntu-linux-20-04-desktop>
References: <20220202173017.48463-1-ayankuma@xilinx.com> <20220202173017.48463-4-ayankuma@xilinx.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 2 Feb 2022, Ayan Kumar Halder wrote:
> When an instruction is trapped in Xen due to translation fault, Xen checks if
> the ISS is valid. If not, Xen tries to resolve the translation fault using
> p2m page tables. In case if it is a data abort, Xen will try to map the mmio
> region to the guest (ie tries to emulate the mmio region).
> 
> If it is not successfull, then it tries to decode the instruction.
> It saves the decoding state, rn and imm9 to ioreq. Whenever the vcpu handles
> the ioreq successfully, it will read the decoding state to determine if the
> instruction decoded was a ldr/str post indexing (ie INSTR_LDR_STR_POSTINDEXING).
> If so, it uses these details to post increment rn.
> 
> Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>

Typically, we try to avoid introducing code in one patch, then moving it
to a different place in the next patch. We try to add code where it
needs to be directly in the first place.

Most of my feedback below is really to do things directly in patch #2.
It could be that once you do that, there is nothing left here in patch
#3 and you could even drop it.


> ---
> 
> Changelog :-
> 
> v2..v5 - Provided in cover letter.
> 
> v6 - 1. Introduced a new field('enum instr_decode_state state') inside
> 'struct instr_details'. This holds the decoding state of the instruction.
> This is later read by the post_increment_register() to determine if rn needs to
> be incremented. Also, this is read by the callers of try_decode_instruction()
> to determine if the instruction was valid or ignored or to be retried or
> error or decoded successfully.
> 
> 2. Also stored 'instr_details' inside 'struct ioreq'. This enables
> arch_ioreq_complete_mmio() to invoke post_increment_register() without decoding
> the instruction again.
> 
> 3. Check hsr.dabt.valid in do_trap_stage2_abort_guest(). If it is not valid,
> then decode the instruction. This ensures that try_handle_mmio() is invoked only
> when the instruction is either valid or decoded successfully.
> 
> 4. Inside do_trap_stage2_abort_guest(), if hsr.dabt.valid is not set, then
> resolve the translation fault before trying to decode the instruction. If
> translation fault is resolved, then return to the guest to execute the instruction
> again.
> 
>  xen/arch/arm/arm64/traps.c      |  4 +++
>  xen/arch/arm/decode.c           |  1 +
>  xen/arch/arm/decode.h           |  9 ------
>  xen/arch/arm/include/asm/mmio.h | 13 ++++++++
>  xen/arch/arm/io.c               | 56 ++++++++++-----------------------
>  xen/arch/arm/ioreq.c            | 13 +++++---
>  xen/arch/arm/traps.c            | 56 +++++++++++++++++++++++++++++++--
>  xen/include/public/hvm/ioreq.h  | 19 +++++------
>  8 files changed, 108 insertions(+), 63 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/traps.c b/xen/arch/arm/arm64/traps.c
> index 4de2206801..505a843b07 100644
> --- a/xen/arch/arm/arm64/traps.c
> +++ b/xen/arch/arm/arm64/traps.c
> @@ -52,6 +52,10 @@ void post_increment_register(const struct instr_details *instr)
>      struct cpu_user_regs *regs = guest_cpu_user_regs();
>      register_t val;
>  
> +    /* Currently, we handle only ldr/str post indexing instructions */
> +    if ( instr->state != INSTR_LDR_STR_POSTINDEXING )
> +        return;

This change should be in patch #2


>      /*
>       * Handle when rn = SP
>       * Refer ArmV8 ARM DDI 0487G.b, Page - D1-2463 "Stack pointer register selection"
> diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
> index 3f2d2a3f62..0a4d9d2772 100644
> --- a/xen/arch/arm/decode.c
> +++ b/xen/arch/arm/decode.c
> @@ -147,6 +147,7 @@ static int decode_arm64(register_t pc, mmio_info_t *info)
>  
>      update_dabt(dabt, opcode.ldr_str.rt, opcode.ldr_str.size, false);
>  
> +    dabt_instr->state = INSTR_LDR_STR_POSTINDEXING;

This one should also be in patch #2


>      dabt_instr->rn = opcode.ldr_str.rn;
>      dabt_instr->imm9 = opcode.ldr_str.imm9;
>  
> diff --git a/xen/arch/arm/decode.h b/xen/arch/arm/decode.h
> index 5efd72405e..6a09b07b46 100644
> --- a/xen/arch/arm/decode.h
> +++ b/xen/arch/arm/decode.h
> @@ -52,15 +52,6 @@ union instr {
>  #define POST_INDEX_FIXED_MASK   0x3B200C00
>  #define POST_INDEX_FIXED_VALUE  0x38000400
>  
> -enum instr_decode_state
> -{
> -    INSTR_ERROR, /* Error encountered while decoding the instruction */
> -    INSTR_VALID, /* ISS is valid, so there is no need to decode */
> -    INSTR_SUCCESS, /* Instruction is decoded successfully */
> -    INSTR_IGNORE, /* Instruction is to be ignored (similar to NOP) */
> -    INSTR_RETRY /* Instruction is to be retried */
> -};
> -
>  /*
>   * Decode an instruction from pc
>   * /!\ This function is intended to decode an instruction. It considers that the
> diff --git a/xen/arch/arm/include/asm/mmio.h b/xen/arch/arm/include/asm/mmio.h
> index 3354d9c635..f7cdf66a5b 100644
> --- a/xen/arch/arm/include/asm/mmio.h
> +++ b/xen/arch/arm/include/asm/mmio.h
> @@ -26,12 +26,23 @@
>  
>  #define MAX_IO_HANDLER  16
>  
> +enum instr_decode_state
> +{
> +    INSTR_ERROR,                    /* Error encountered while decoding the instruction */
> +    INSTR_VALID,                    /* ISS is valid, so there is no need to decode */
> +    INSTR_LDR_STR_POSTINDEXING,     /* Instruction is decoded successfully.
> +                                       It is ldr/str post indexing */
> +    INSTR_IGNORE,                   /* Instruction is to be ignored (similar to NOP) */
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
> @@ -77,6 +88,8 @@ void register_mmio_handler(struct domain *d,
>  int domain_io_init(struct domain *d, int max_count);
>  void domain_io_free(struct domain *d);
>  
> +void try_decode_instruction(const struct cpu_user_regs *regs,
> +                            mmio_info_t *info);
>  
>  #endif  /* __ASM_ARM_MMIO_H__ */
>  
> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
> index 1011327058..46726637c6 100644
> --- a/xen/arch/arm/io.c
> +++ b/xen/arch/arm/io.c
> @@ -95,8 +95,8 @@ static const struct mmio_handler *find_mmio_handler(struct domain *d,
>      return handler;
>  }
>  
> -enum instr_decode_state try_decode_instruction(const struct cpu_user_regs *regs,
> -                                               mmio_info_t *info)
> +void try_decode_instruction(const struct cpu_user_regs *regs,
> +                            mmio_info_t *info)
>  {
>      int rc;
>  
> @@ -111,27 +111,37 @@ enum instr_decode_state try_decode_instruction(const struct cpu_user_regs *regs,
>          if ( rc )
>          {
>              gprintk(XENLOG_DEBUG, "Unable to decode instruction\n");
> -            return INSTR_ERROR;
> +            info->dabt_instr.state = INSTR_ERROR;
> +            return;
>          }
>      }
>  
>      /* If ISS is valid, then no need to decode the instruction any further */
>      if (info->dabt.valid)
> -        return INSTR_VALID;
> +    {
> +        info->dabt_instr.state = INSTR_VALID;
> +        return;
> +    }
>  
>      /*
>       * Xen should not decode the instruction when it was trapped due to
>       * translation fault.
>       */
>      if ( info->dabt.s1ptw )
> -        return INSTR_RETRY;
> +    {
> +        info->dabt_instr.state = INSTR_RETRY;
> +        return;
> +    }
>  
>      /*
>       * If the fault occurred due to cache maintenance or address translation
>       * instructions, then Xen needs to ignore these instructions.
>       */
>      if ( info->dabt.cache )
> -        return INSTR_IGNORE;
> +    {
> +        info->dabt_instr.state = INSTR_IGNORE;
> +        return;
> +    }
>  
>      /*
>       * Armv8 processor does not provide a valid syndrome for decoding some
> @@ -142,10 +152,8 @@ enum instr_decode_state try_decode_instruction(const struct cpu_user_regs *regs,
>      if ( rc )
>      {
>          gprintk(XENLOG_ERR, "Unable to decode instruction\n");
> -        return INSTR_ERROR;
> +        info->dabt_instr.state = INSTR_ERROR;
>      }
> -    else
> -        return INSTR_SUCCESS;
>  }
>  
>  enum io_state try_handle_mmio(struct cpu_user_regs *regs,
> @@ -160,7 +168,6 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>          .dabt = dabt
>      };
>      int rc;
> -    enum instr_decode_state state;
>  
>      ASSERT(hsr.ec == HSR_EC_DATA_ABORT_LOWER_EL);
>  
> @@ -174,25 +181,6 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>          return rc;
>      }
>  
> -    state = try_decode_instruction(regs, &info);
> -
> -    /*
> -     * If the instruction was to be ignored by Xen, then it should return to the
> -     * caller which will increment the PC, so that the guest can execute the
> -     * next instruction.
> -     */
> -    if ( state == INSTR_IGNORE )
> -        return IO_HANDLED;
> -    /*
> -     * If Xen could not decode the instruction for any reason, then it should
> -     * ask the caller to abort the guest.
> -     */
> -    else if ( state == INSTR_ERROR )
> -        return IO_ABORT;
> -    /* When the instruction needs to be retried by the guest */
> -    else if ( state == INSTR_RETRY )
> -        return IO_UNHANDLED;
>
>      /*
>       * At this point, we know that the instruction is either valid or has been
>       * decoded successfully. Thus, Xen should be allowed to execute the
> @@ -203,16 +191,6 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>      else
>          rc = handle_read(handler, v, &info);
>  
> -    /*
> -     * If the instruction was decoded and has executed successfully on the MMIO
> -     * region, then Xen should execute the next part of the instruction. (for eg
> -     * increment the rn if it is a post-indexing instruction.
> -     */
> -    if ( (rc == IO_HANDLED) && (state == INSTR_SUCCESS) )
> -    {
> -        post_increment_register(&info.dabt_instr);
> -    }
> -
>      return rc;
>  }
>  
> diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
> index 308650b400..d8909aa903 100644
> --- a/xen/arch/arm/ioreq.c
> +++ b/xen/arch/arm/ioreq.c
> @@ -23,10 +23,13 @@
>  
>  #include <public/hvm/ioreq.h>
>  
> +#include "decode.h"
> +
>  enum io_state handle_ioserv(struct cpu_user_regs *regs, struct vcpu *v)
>  {
>      const union hsr hsr = { .bits = regs->hsr };
> -    const struct hsr_dabt dabt = hsr.dabt;
> +    struct hsr_dabt dabt = hsr.dabt;
> +
>      /* Code is similar to handle_read */
>      register_t r = v->io.req.data;
>  
> @@ -61,10 +64,13 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
>           */
>          .df = 0,
>          .data = get_user_reg(regs, info->dabt.reg),
> +        .dabt_instr = &info->dabt_instr,
>          .state = STATE_IOREQ_READY,
>      };
>      struct ioreq_server *s = NULL;
>      enum io_state rc;
> +    bool instr_decoded = false;
> +    const union hsr hsr = { .bits = regs->hsr };
>  
>      if ( vio->req.state != STATE_IOREQ_NONE )
>      {
> @@ -76,9 +82,6 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
>      if ( !s )
>          return IO_UNHANDLED;
>  
> -    if ( !info->dabt.valid )
> -        return IO_ABORT;
> -
>      vio->req = p;
>  
>      rc = ioreq_send(s, &p, 0);
> @@ -95,6 +98,7 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
>  bool arch_ioreq_complete_mmio(void)
>  {
>      struct vcpu *v = current;
> +    struct instr_details *dabt_instr = v->io.req.dabt_instr;

As Julien suggested, we can add the instruction details to vcpu_io (not
v->io.req).


>      struct cpu_user_regs *regs = guest_cpu_user_regs();
>      const union hsr hsr = { .bits = regs->hsr };
>  
> @@ -106,6 +110,7 @@ bool arch_ioreq_complete_mmio(void)
>  
>      if ( handle_ioserv(regs, v) == IO_HANDLED )
>      {
> +        post_increment_register(dabt_instr);
>          advance_pc(regs, hsr);
>          return true;
>      }

This change should also be in the previous patch.


> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index 9339d12f58..6cce2379fa 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -1906,6 +1906,7 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
>      paddr_t gpa;
>      uint8_t fsc = xabt.fsc & ~FSC_LL_MASK;
>      bool is_data = (hsr.ec == HSR_EC_DATA_ABORT_LOWER_EL);
> +    mmio_info_t info;
>  
>      /*
>       * If this bit has been set, it means that this stage-2 abort is caused
> @@ -1959,6 +1960,51 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
>          return;
>      }
>      case FSC_FLT_TRANS:
> +
> +        info.gpa = gpa;
> +        info.dabt = hsr.dabt;
> +
> +        /* Check if the ISS is valid. */
> +        if ( !hsr.dabt.valid )
> +        {
> +
> +            /*
> +             * Assumption :- Most of the times when we get a translation fault
> +             * and the ISS is invalid, the underlying cause is that the page
> +             * tables have not been set up correctly.
> +             * First check if the translation fault can be resolved by the
> +             * P2M subsystem. If that's the case nothing else to do.
> +             */
> +            if ( p2m_resolve_translation_fault(current->domain,
> +                                           gaddr_to_gfn(gpa)) )
> +                return;
> +
> +            if ( is_data && try_map_mmio(gaddr_to_gfn(gpa)) )
> +                return;
> +
> +            try_decode_instruction(regs, &info);
> +
> +            /*
> +             * If the instruction was to be ignored by Xen, then it should return to the
> +             * caller which will increment the PC, so that the guest can execute the
> +             * next instruction.
> +             */
> +            if ( info.dabt_instr.state == INSTR_IGNORE )
> +            {
> +                advance_pc(regs, hsr);
> +                return;
> +            }
> +            /*
> +             * If Xen could not decode the instruction for any reason, then it should
> +             * ask the caller to abort the guest.
> +             */
> +            else if ( info.dabt_instr.state == INSTR_ERROR )
> +                goto inject_abt;
> +            /* When the instruction needs to be retried by the guest */
> +            else if ( info.dabt_instr.state == INSTR_RETRY )
> +                return;
> +        }

It is best to add the code directly here in the first place, rather than
adding it to try_handle_mmio first, then moving it here.

I think we should move the two calls to p2m_resolve_translation_fault
and try_map_mmio to a function to avoid repetation:

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 6cce2379fa..e3da9ed7c3 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -1893,6 +1893,23 @@ static bool try_map_mmio(gfn_t gfn)
     return !map_regions_p2mt(d, gfn, 1, mfn, p2m_mmio_direct_c);
 }
 
+static inline void check_p2m(bool is_data, paddr_t gpa)
+{
+    /*
+     * Assumption :- Most of the times when we get a translation fault
+     * and the ISS is invalid, the underlying cause is that the page
+     * tables have not been set up correctly.
+     * First check if the translation fault can be resolved by the
+     * P2M subsystem. If that's the case nothing else to do.
+     */
+    if ( p2m_resolve_translation_fault(current->domain,
+                gaddr_to_gfn(gpa)) )
+        return;
+
+    if ( is_data && try_map_mmio(gaddr_to_gfn(gpa)) )
+        return;
+}
+
 static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
                                        const union hsr hsr)
 {
@@ -1968,19 +1985,7 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
         if ( !hsr.dabt.valid )
         {
 
-            /*
-             * Assumption :- Most of the times when we get a translation fault
-             * and the ISS is invalid, the underlying cause is that the page
-             * tables have not been set up correctly.
-             * First check if the translation fault can be resolved by the
-             * P2M subsystem. If that's the case nothing else to do.
-             */
-            if ( p2m_resolve_translation_fault(current->domain,
-                                           gaddr_to_gfn(gpa)) )
-                return;
-
-            if ( is_data && try_map_mmio(gaddr_to_gfn(gpa)) )
-                return;
+            check_p2m(is_data, gpa);
 
             try_decode_instruction(regs, &info);
 
@@ -2038,15 +2043,7 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
             }
         }
 
-        /* First check if the translation fault can be resolved by the
-         * P2M subsystem. If that's the case nothing else to do.
-         */
-        if ( p2m_resolve_translation_fault(current->domain,
-                                           gaddr_to_gfn(gpa)) )
-            return;
-
-        if ( is_data && try_map_mmio(gaddr_to_gfn(gpa)) )
-            return;
+        check_p2m(is_data, gpa);
 
         break;
     default:



>          /*
>           * Attempt first to emulate the MMIO as the data abort will
>           * likely happen in an emulated region.
> @@ -1975,6 +2021,13 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
>                  goto inject_abt;
>              case IO_HANDLED:
>                  advance_pc(regs, hsr);
> +                /*
> +                 * If the instruction was decoded and has executed successfully
> +                 * on the MMIO region, then Xen should execute the next part of
> +                 * the instruction. (for eg increment the rn if it is a
> +                 * post-indexing instruction.
> +                 */
> +                post_increment_register(&info.dabt_instr);

I would introduce the post_increment_register() call here directly in
patch #2, rather than introducing it first in one place, then moving it
in the next patch


>                  return;
>              case IO_RETRY:
>                  /* finish later */
> @@ -1985,8 +2038,7 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
>              }
>          }
>  
> -        /*
> -         * First check if the translation fault can be resolved by the
> +        /* First check if the translation fault can be resolved by the
>           * P2M subsystem. If that's the case nothing else to do.
>           */

Spurious change


>          if ( p2m_resolve_translation_fault(current->domain,
> diff --git a/xen/include/public/hvm/ioreq.h b/xen/include/public/hvm/ioreq.h
> index c511fae8e7..e4183960d8 100644
> --- a/xen/include/public/hvm/ioreq.h
> +++ b/xen/include/public/hvm/ioreq.h
> @@ -50,19 +50,20 @@
>   * SEGMENT |BUS   |DEV   |FN    |OFFSET
>   */
>  struct ioreq {
> -    uint64_t addr;          /* physical address */
> -    uint64_t data;          /* data (or paddr of data) */
> -    uint32_t count;         /* for rep prefixes */
> -    uint32_t size;          /* size in bytes */
> -    uint32_t vp_eport;      /* evtchn for notifications to/from device model */
> +    uint64_t addr;                   /* physical address */
> +    uint64_t data;                   /* data (or paddr of data) */
> +    uint32_t count;                  /* for rep prefixes */
> +    uint32_t size;                   /* size in bytes */
> +    uint32_t vp_eport;               /* evtchn for notifications to/from device model */
>      uint16_t _pad0;
>      uint8_t state:4;
> -    uint8_t data_is_ptr:1;  /* if 1, data above is the guest paddr
> -                             * of the real data to use. */
> -    uint8_t dir:1;          /* 1=read, 0=write */
> +    uint8_t data_is_ptr:1;           /* if 1, data above is the guest paddr
> +                                      * of the real data to use. */
> +    uint8_t dir:1;                   /* 1=read, 0=write */
>      uint8_t df:1;
>      uint8_t _pad1:1;
> -    uint8_t type;           /* I/O type */
> +    uint8_t type;                     /* I/O type */
> +    struct instr_details *dabt_instr; /* when the instruction is decoded */
>  };
>  typedef struct ioreq ioreq_t;

This structure is a public interface (public as in exposed and used by
other project.) We cannot change it easily as we need to maintain
backward compatibility. In any case, I don't think that changing struct
ioreq is required for what we are trying to achieve with this patch.

