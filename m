Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FEE74E004
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 23:09:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561411.877852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIy7s-0001Ni-NS; Mon, 10 Jul 2023 21:08:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561411.877852; Mon, 10 Jul 2023 21:08:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIy7s-0001Lr-Jx; Mon, 10 Jul 2023 21:08:56 +0000
Received: by outflank-mailman (input) for mailman id 561411;
 Mon, 10 Jul 2023 21:08:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=atS4=C4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qIy7q-0001Ll-VY
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 21:08:54 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f86650c5-1f65-11ee-8611-37d641c3527e;
 Mon, 10 Jul 2023 23:08:52 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0B8DD611FE;
 Mon, 10 Jul 2023 21:08:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0033C433C8;
 Mon, 10 Jul 2023 21:08:48 +0000 (UTC)
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
X-Inumbo-ID: f86650c5-1f65-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689023330;
	bh=1RigCnDsZjZm2CJMHPZcxT1GYO4ucMyFDXXUYEdpraY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WRFP8dZS6HfUhys4FzGFR9EO173OuuuMYD2bQsDbxGOzpsfREr8/xTDLJsDgEL2jp
	 QrplQtMckL3M890SkTfAdf3Xy81MkdlLwlz06UF2Y5wybL7B3JLYf0DkS1JSpGUX8w
	 0jCc3DscevAjzMXaczrIKaFq1kPI/mGSmjgFFw0PN1NkzanBqLVS6Bj515yay/BvyD
	 1JEcBh0JuAtWL/+w8d9Szt24vXaJBjr7YiBHastp4fHwbpChVa3ysuzGQ94jFEk1Jv
	 cYU6FVlQke8Mo53R4Ss08j0iuYZv1vVB0GmJ7NIut20POs3GZcXtZ2LSbtQrgZ5hz2
	 hJVM2m+3hJlOg==
Date: Mon, 10 Jul 2023 14:08:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Xenia Ragiadakou <xenia.ragiadakou@amd.com>, 
    Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: Re: [XEN PATCH] x86/emul: fix violations of MISRA C:2012 Rule 8.3
 on parameter names
In-Reply-To: <149e5516d0db712916912fce8ab9c8285023e7c8.1688997768.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2307101408390.761183@ubuntu-linux-20-04-desktop>
References: <149e5516d0db712916912fce8ab9c8285023e7c8.1688997768.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 10 Jul 2023, Federico Serafini wrote:
> The headline of MISRA C:2012 Rule 8.3 states that:
> "All declarations of an object or function shall use the same names and
> type qualifiers".
> 
> Change parameter names to meet the following requirements:
> 1) keep consistency between declarations and the corresponding
>    definitions thus fixing violations of the Rule 8.3;
> 2) use the globally-adopted shorthands (e.g., 's' to denote a 'state');
> 3) keep adjacent declarations consistent with respect to the parameter
>    names that are used.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/x86/x86_emulate/x86_emulate.c | 54 +++++++++++++-------------
>  xen/arch/x86/x86_emulate/x86_emulate.h | 26 ++++++-------
>  2 files changed, 40 insertions(+), 40 deletions(-)
> 
> diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
> index be2e3c6b11..2de1be7996 100644
> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> @@ -8446,12 +8446,12 @@ int x86_emul_rmw(
>      void *ptr,
>      unsigned int bytes,
>      uint32_t *eflags,
> -    struct x86_emulate_state *state,
> +    struct x86_emulate_state *s,
>      struct x86_emulate_ctxt *ctxt)
>  {
>      unsigned long *dst = ptr;
>  
> -    ASSERT(bytes == state->op_bytes);
> +    ASSERT(bytes == s->op_bytes);
>  
>  /*
>   * We cannot use Jcc below, as this code executes with the guest status flags
> @@ -8469,23 +8469,23 @@ int x86_emul_rmw(
>      ".L" #op "%=:\n\t" \
>      #op
>  
> -    switch ( state->rmw )
> +    switch ( s->rmw )
>      {
>  #define UNOP(op) \
>      case rmw_##op: \
>          _emulate_1op(COND_LOCK(op), dst, bytes, *eflags, \
> -                     "c" ((long)state->lock_prefix) ); \
> +                     "c" ((long)s->lock_prefix) ); \
>          break
>  #define BINOP(op, sfx) \
>      case rmw_##op: \
>          _emulate_2op_SrcV##sfx(COND_LOCK(op), \
> -                               state->ea.val, dst, bytes, *eflags, \
> -                               "c" ((long)state->lock_prefix) ); \
> +                               s->ea.val, dst, bytes, *eflags, \
> +                               "c" ((long)s->lock_prefix) ); \
>          break
>  #define SHIFT(op) \
>      case rmw_##op: \
> -        ASSERT(!state->lock_prefix); \
> -        _emulate_2op_SrcB(#op, state->ea.val, dst, bytes, *eflags); \
> +        ASSERT(!s->lock_prefix); \
> +        _emulate_2op_SrcB(#op, s->ea.val, dst, bytes, *eflags); \
>          break
>  
>      BINOP(adc, );
> @@ -8514,46 +8514,46 @@ int x86_emul_rmw(
>  #undef SHIFT
>  
>      case rmw_not:
> -        switch ( state->op_bytes )
> +        switch ( s->op_bytes )
>          {
>          case 1:
>              asm ( COND_LOCK(notb) " %0"
> -                  : "+m" (*dst) : "c" ((long)state->lock_prefix) );
> +                  : "+m" (*dst) : "c" ((long)s->lock_prefix) );
>              break;
>          case 2:
>              asm ( COND_LOCK(notw) " %0"
> -                  : "+m" (*dst) : "c" ((long)state->lock_prefix) );
> +                  : "+m" (*dst) : "c" ((long)s->lock_prefix) );
>              break;
>          case 4:
>              asm ( COND_LOCK(notl) " %0"
> -                  : "+m" (*dst) : "c" ((long)state->lock_prefix) );
> +                  : "+m" (*dst) : "c" ((long)s->lock_prefix) );
>              break;
>  #ifdef __x86_64__
>          case 8:
>              asm ( COND_LOCK(notq) " %0"
> -                  : "+m" (*dst) : "c" ((long)state->lock_prefix) );
> +                  : "+m" (*dst) : "c" ((long)s->lock_prefix) );
>              break;
>  #endif
>          }
>          break;
>  
>      case rmw_shld:
> -        ASSERT(!state->lock_prefix);
> +        ASSERT(!s->lock_prefix);
>          _emulate_2op_SrcV_nobyte("shld",
> -                                 state->ea.val, dst, bytes, *eflags,
> -                                 "c" (state->ea.orig_val) );
> +                                 s->ea.val, dst, bytes, *eflags,
> +                                 "c" (s->ea.orig_val) );
>          break;
>  
>      case rmw_shrd:
> -        ASSERT(!state->lock_prefix);
> +        ASSERT(!s->lock_prefix);
>          _emulate_2op_SrcV_nobyte("shrd",
> -                                 state->ea.val, dst, bytes, *eflags,
> -                                 "c" (state->ea.orig_val) );
> +                                 s->ea.val, dst, bytes, *eflags,
> +                                 "c" (s->ea.orig_val) );
>          break;
>  
>      case rmw_xadd:
>          *eflags &= ~EFLAGS_MASK;
> -        switch ( state->op_bytes )
> +        switch ( s->op_bytes )
>          {
>              unsigned long dummy;
>  
> @@ -8562,11 +8562,11 @@ int x86_emul_rmw(
>              asm ( "" \
>                    COND_LOCK(xadd) " %"#mod"[reg], %[mem]; " \
>                    _POST_EFLAGS("[efl]", "[msk]", "[tmp]") \
> -                  : [reg] "+" #cst (state->ea.val), \
> +                  : [reg] "+" #cst (s->ea.val), \
>                      [mem] "+m" (*dst), \
>                      [efl] "+g" (*eflags), \
>                      [tmp] "=&r" (dummy) \
> -                  : "c" ((long)state->lock_prefix), \
> +                  : "c" ((long)s->lock_prefix), \
>                      [msk] "i" (EFLAGS_MASK) ); \
>              break
>          XADD(1, q, b);
> @@ -8580,21 +8580,21 @@ int x86_emul_rmw(
>          break;
>  
>      case rmw_xchg:
> -        switch ( state->op_bytes )
> +        switch ( s->op_bytes )
>          {
>          case 1:
> -            asm ( "xchg %b0, %b1" : "+q" (state->ea.val), "+m" (*dst) );
> +            asm ( "xchg %b0, %b1" : "+q" (s->ea.val), "+m" (*dst) );
>              break;
>          case 2:
> -            asm ( "xchg %w0, %w1" : "+r" (state->ea.val), "+m" (*dst) );
> +            asm ( "xchg %w0, %w1" : "+r" (s->ea.val), "+m" (*dst) );
>              break;
>          case 4:
>  #ifdef __x86_64__
> -            asm ( "xchg %k0, %k1" : "+r" (state->ea.val), "+m" (*dst) );
> +            asm ( "xchg %k0, %k1" : "+r" (s->ea.val), "+m" (*dst) );
>              break;
>          case 8:
>  #endif
> -            asm ( "xchg %0, %1" : "+r" (state->ea.val), "+m" (*dst) );
> +            asm ( "xchg %0, %1" : "+r" (s->ea.val), "+m" (*dst) );
>              break;
>          }
>          break;
> diff --git a/xen/arch/x86/x86_emulate/x86_emulate.h b/xen/arch/x86/x86_emulate/x86_emulate.h
> index 40d5054fb7..698750267a 100644
> --- a/xen/arch/x86/x86_emulate/x86_emulate.h
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.h
> @@ -746,36 +746,36 @@ x86_decode_insn(
>          struct x86_emulate_ctxt *ctxt));
>  
>  unsigned int
> -x86_insn_opsize(const struct x86_emulate_state *state);
> +x86_insn_opsize(const struct x86_emulate_state *s);
>  int
> -x86_insn_modrm(const struct x86_emulate_state *state,
> +x86_insn_modrm(const struct x86_emulate_state *s,
>                 unsigned int *rm, unsigned int *reg);
>  unsigned long
> -x86_insn_operand_ea(const struct x86_emulate_state *state,
> +x86_insn_operand_ea(const struct x86_emulate_state *s,
>                      enum x86_segment *seg);
>  unsigned long
> -x86_insn_immediate(const struct x86_emulate_state *state,
> +x86_insn_immediate(const struct x86_emulate_state *s,
>                     unsigned int nr);
>  unsigned int
> -x86_insn_length(const struct x86_emulate_state *state,
> +x86_insn_length(const struct x86_emulate_state *s,
>                  const struct x86_emulate_ctxt *ctxt);
>  bool cf_check
> -x86_insn_is_mem_access(const struct x86_emulate_state *state,
> +x86_insn_is_mem_access(const struct x86_emulate_state *s,
>                         const struct x86_emulate_ctxt *ctxt);
>  bool cf_check
> -x86_insn_is_mem_write(const struct x86_emulate_state *state,
> +x86_insn_is_mem_write(const struct x86_emulate_state *s,
>                        const struct x86_emulate_ctxt *ctxt);
>  bool cf_check
> -x86_insn_is_portio(const struct x86_emulate_state *state,
> +x86_insn_is_portio(const struct x86_emulate_state *s,
>                     const struct x86_emulate_ctxt *ctxt);
>  bool cf_check
> -x86_insn_is_cr_access(const struct x86_emulate_state *state,
> +x86_insn_is_cr_access(const struct x86_emulate_state *s,
>                        const struct x86_emulate_ctxt *ctxt);
>  
>  #if !defined(__XEN__) || defined(NDEBUG)
> -static inline void x86_emulate_free_state(struct x86_emulate_state *state) {}
> +static inline void x86_emulate_free_state(struct x86_emulate_state *s) {}
>  #else
> -void x86_emulate_free_state(struct x86_emulate_state *state);
> +void x86_emulate_free_state(struct x86_emulate_state *s);
>  #endif
>  
>  #ifdef __XEN__
> @@ -800,7 +800,7 @@ x86_emul_rmw(
>      void *ptr,
>      unsigned int bytes,
>      uint32_t *eflags,
> -    struct x86_emulate_state *state,
> +    struct x86_emulate_state *s,
>      struct x86_emulate_ctxt *ctxt);
>  int
>  x86_emul_blk(
> @@ -808,7 +808,7 @@ x86_emul_blk(
>      void *data,
>      unsigned int bytes,
>      uint32_t *eflags,
> -    struct x86_emulate_state *state,
> +    struct x86_emulate_state *s,
>      struct x86_emulate_ctxt *ctxt);
>  
>  static inline void x86_emul_hw_exception(
> -- 
> 2.34.1
> 

