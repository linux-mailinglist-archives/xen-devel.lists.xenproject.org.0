Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE984993FED
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 09:48:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812698.1225490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy4wg-0002qe-Jv; Tue, 08 Oct 2024 07:47:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812698.1225490; Tue, 08 Oct 2024 07:47:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy4wg-0002p9-HD; Tue, 08 Oct 2024 07:47:50 +0000
Received: by outflank-mailman (input) for mailman id 812698;
 Tue, 08 Oct 2024 07:47:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TTuH=RE=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sy4wf-0002p3-Hi
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 07:47:49 +0000
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [2607:f8b0:4864:20::c36])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9bbbcb11-8549-11ef-99a2-01e77a169b0f;
 Tue, 08 Oct 2024 09:47:47 +0200 (CEST)
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-5e1c63c9822so3003416eaf.0
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2024 00:47:47 -0700 (PDT)
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
X-Inumbo-ID: 9bbbcb11-8549-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728373666; x=1728978466; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M+yAkcApRDaTj3RIrU3CRAMx4qZBSDaLuIfOAql1WOs=;
        b=PxgVA+1W/WGkuz1dZCfyDCwDcYmNUL9+l7aRwbUYGse3cuSC1c7LtKZRsgj3CTtYmz
         NTdLZd6hzaIOw+/fVuxE4dPW42CSH7qTy6WelvzwBN/Nf/wQIeaCadJj9I2xpeLPTx37
         ARC3gVmbJCiZ5ik4iyyRm5FqSi8T3kc8Aizpg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728373666; x=1728978466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M+yAkcApRDaTj3RIrU3CRAMx4qZBSDaLuIfOAql1WOs=;
        b=F06phUf1rz3J2/c0CTO3VPZZ4Z8S/+7+OngubLhtipVqV0dZdVehJdUbAz4i2iyo26
         KqfGQk3l5YH3Z9y9ggLPiaCC2FrXtpK+vhJDo/Zeh3Q4IENlOVdK1hoX7DjepbKs0yrW
         6jH2QH8PNo1aw0W0LkhUzcb7AiVtcXo9kVA2E0GijWamPH/QViCebGHXK2iQ2kjuokKT
         ESc3QcwLB3TDIOp8I+4BgGV8LMZDx3uijKVGWvUH4FSNRhtjD6OkuCDQUHFG6k+1D1hN
         lJqk68XcHkZeDnbmstgjtlPDGagIQtKqNugHio1tbN34fsVE3Tqbeh6+0jXkkBM/bHG2
         BR7w==
X-Gm-Message-State: AOJu0Yz9Yb88lO1cZ1DmKBA2atp1mtQdu2gLPQT/FFR2F4vzG0XHKFxH
	ZGXPib3H3awCG9KDAYkXMK6AN7b2W5YZizIbDBpCTyzqxdmv0HkpaBYrujEAh0cFJ8JtsHZFu64
	S7VHjXgCbcXInBCInDWDsjZxi8SnM5mFWDTJKZw==
X-Google-Smtp-Source: AGHT+IGX97qMDx3i5+ZluNnIZpm/ACE+qh4xbwifx80Q6FGVwt9NCl1EF3xWgvOdo0Om7vjThPtd1+17b5l0EXT4qF0=
X-Received: by 2002:a05:6870:8a10:b0:268:9f88:18ef with SMTP id
 586e51a60fabf-287c1da9e99mr8281258fac.13.1728373665604; Tue, 08 Oct 2024
 00:47:45 -0700 (PDT)
MIME-Version: 1.0
References: <20241007155240.17186-1-alejandro.vallejo@cloud.com> <20241007155240.17186-2-alejandro.vallejo@cloud.com>
In-Reply-To: <20241007155240.17186-2-alejandro.vallejo@cloud.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Tue, 8 Oct 2024 08:47:34 +0100
Message-ID: <CACHz=ZhGt7Lw5vHY-Ykc0_ouutMnurhWg2AQTkUF1MYXyp=fRw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] x86/fpu: Combine fpu_ctxt and xsave_area in arch_vcpu
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 7, 2024 at 4:52=E2=80=AFPM Alejandro Vallejo
<alejandro.vallejo@cloud.com> wrote:
>
> fpu_ctxt is either a pointer to the legacy x87/SSE save area (used by FXS=
AVE) or
> a pointer aliased with xsave_area that points to its fpu_sse subfield. Su=
ch
> subfield is at the base and is identical in size and layout to the legacy
> buffer.
>
> This patch merges the 2 pointers in the arch_vcpu into a single XSAVE are=
a. In
> the very rare case in which the host doesn't support XSAVE all we're doin=
g is
> wasting a tiny amount of memory and trading those for a lot more simplici=
ty in
> the code.
>
> While at it, dedup the setup logic in vcpu_init_fpu() and integrate it
> into xstate_alloc_save_area().
>
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> --
> v4:
>   * Amend commit message with extra note about deduping vcpu_init_fpu()
>   * Remove comment on top of cpu_user_regs (though I really think there
>     ought to be a credible one, in one form or another).
>   * Remove cast from blk.c so FXSAVE_AREA is "void *"
>   * Simplify comment in xstate_alloc_save_area() for the "host has no
>     XSAVE" case.
> ---
>  xen/arch/x86/domctl.c             |  6 ++++-
>  xen/arch/x86/hvm/emulate.c        |  4 +--
>  xen/arch/x86/hvm/hvm.c            |  6 ++++-
>  xen/arch/x86/i387.c               | 45 +++++--------------------------
>  xen/arch/x86/include/asm/domain.h |  6 -----
>  xen/arch/x86/x86_emulate/blk.c    |  2 +-
>  xen/arch/x86/xstate.c             | 12 ++++++---
>  7 files changed, 28 insertions(+), 53 deletions(-)
>
> diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
> index 96d816cf1a7d..2d115395da90 100644
> --- a/xen/arch/x86/domctl.c
> +++ b/xen/arch/x86/domctl.c
> @@ -1379,7 +1379,11 @@ void arch_get_info_guest(struct vcpu *v, vcpu_gues=
t_context_u c)
>  #define c(fld) (c.nat->fld)
>  #endif
>
> -    memcpy(&c.nat->fpu_ctxt, v->arch.fpu_ctxt, sizeof(c.nat->fpu_ctxt));
> +    BUILD_BUG_ON(sizeof(c.nat->fpu_ctxt) !=3D
> +                 sizeof(v->arch.xsave_area->fpu_sse));
> +    memcpy(&c.nat->fpu_ctxt, &v->arch.xsave_area->fpu_sse,
> +           sizeof(c.nat->fpu_ctxt));
> +
>      if ( is_pv_domain(d) )
>          c(flags =3D v->arch.pv.vgc_flags & ~(VGCF_i387_valid|VGCF_in_ker=
nel));
>      else
> diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
> index aa97ca1cbffd..f2bc6967dfcb 100644
> --- a/xen/arch/x86/hvm/emulate.c
> +++ b/xen/arch/x86/hvm/emulate.c
> @@ -2371,7 +2371,7 @@ static int cf_check hvmemul_get_fpu(
>          alternative_vcall(hvm_funcs.fpu_dirty_intercept);
>      else if ( type =3D=3D X86EMUL_FPU_fpu )
>      {
> -        const fpusse_t *fpu_ctxt =3D curr->arch.fpu_ctxt;
> +        const fpusse_t *fpu_ctxt =3D &curr->arch.xsave_area->fpu_sse;
>
>          /*
>           * Latch current register state so that we can back out changes
> @@ -2411,7 +2411,7 @@ static void cf_check hvmemul_put_fpu(
>
>      if ( aux )
>      {
> -        fpusse_t *fpu_ctxt =3D curr->arch.fpu_ctxt;
> +        fpusse_t *fpu_ctxt =3D &curr->arch.xsave_area->fpu_sse;
>          bool dval =3D aux->dval;
>          int mode =3D hvm_guest_x86_mode(curr);
>
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 7b2e1c9813d6..77fe282118f7 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -914,7 +914,11 @@ static int cf_check hvm_save_cpu_ctxt(struct vcpu *v=
, hvm_domain_context_t *h)
>
>      if ( v->fpu_initialised )
>      {
> -        memcpy(ctxt.fpu_regs, v->arch.fpu_ctxt, sizeof(ctxt.fpu_regs));
> +        BUILD_BUG_ON(sizeof(ctxt.fpu_regs) !=3D
> +                     sizeof(v->arch.xsave_area->fpu_sse));
> +        memcpy(ctxt.fpu_regs, &v->arch.xsave_area->fpu_sse,
> +               sizeof(ctxt.fpu_regs));
> +
>          ctxt.flags =3D XEN_X86_FPU_INITIALISED;
>      }
>
> diff --git a/xen/arch/x86/i387.c b/xen/arch/x86/i387.c
> index 134e0bece519..fbb9d3584a3d 100644
> --- a/xen/arch/x86/i387.c
> +++ b/xen/arch/x86/i387.c
> @@ -39,7 +39,7 @@ static inline void fpu_xrstor(struct vcpu *v, uint64_t =
mask)
>  /* Restore x87 FPU, MMX, SSE and SSE2 state */
>  static inline void fpu_fxrstor(struct vcpu *v)
>  {
> -    const fpusse_t *fpu_ctxt =3D v->arch.fpu_ctxt;
> +    const fpusse_t *fpu_ctxt =3D &v->arch.xsave_area->fpu_sse;
>
>      /*
>       * Some CPUs don't save/restore FDP/FIP/FOP unless an exception
> @@ -151,7 +151,7 @@ static inline void fpu_xsave(struct vcpu *v)
>  /* Save x87 FPU, MMX, SSE and SSE2 state */
>  static inline void fpu_fxsave(struct vcpu *v)
>  {
> -    fpusse_t *fpu_ctxt =3D v->arch.fpu_ctxt;
> +    fpusse_t *fpu_ctxt =3D &v->arch.xsave_area->fpu_sse;
>      unsigned int fip_width =3D v->domain->arch.x87_fip_width;
>
>      if ( fip_width !=3D 4 )
> @@ -212,7 +212,7 @@ void vcpu_restore_fpu_nonlazy(struct vcpu *v, bool ne=
ed_stts)
>       * above) we also need to restore full state, to prevent subsequentl=
y
>       * saving state belonging to another vCPU.
>       */
> -    if ( v->arch.fully_eager_fpu || (v->arch.xsave_area && xstate_all(v)=
) )
> +    if ( v->arch.fully_eager_fpu || xstate_all(v) )
>      {
>          if ( cpu_has_xsave )
>              fpu_xrstor(v, XSTATE_ALL);
> @@ -299,44 +299,14 @@ void save_fpu_enable(void)
>  /* Initialize FPU's context save area */
>  int vcpu_init_fpu(struct vcpu *v)
>  {
> -    int rc;
> -
>      v->arch.fully_eager_fpu =3D opt_eager_fpu;
> -
> -    if ( (rc =3D xstate_alloc_save_area(v)) !=3D 0 )
> -        return rc;
> -
> -    if ( v->arch.xsave_area )
> -        v->arch.fpu_ctxt =3D &v->arch.xsave_area->fpu_sse;
> -    else
> -    {
> -        BUILD_BUG_ON(__alignof(v->arch.xsave_area->fpu_sse) < 16);
> -        v->arch.fpu_ctxt =3D _xzalloc(sizeof(v->arch.xsave_area->fpu_sse=
),
> -                                    __alignof(v->arch.xsave_area->fpu_ss=
e));
> -        if ( v->arch.fpu_ctxt )
> -        {
> -            fpusse_t *fpu_sse =3D v->arch.fpu_ctxt;
> -
> -            fpu_sse->fcw =3D FCW_DEFAULT;
> -            fpu_sse->mxcsr =3D MXCSR_DEFAULT;
> -        }
> -        else
> -            rc =3D -ENOMEM;
> -    }
> -
> -    return rc;
> +    return xstate_alloc_save_area(v);
>  }
>
>  void vcpu_setup_fpu(struct vcpu *v, struct xsave_struct *xsave_area,
>                      const void *data, unsigned int fcw_default)
>  {
> -    /*
> -     * For the entire function please note that vcpu_init_fpu() (above) =
points
> -     * v->arch.fpu_ctxt into v->arch.xsave_area when XSAVE is available.=
 Hence
> -     * accesses through both pointers alias one another, and the shorter=
 form
> -     * is used here.
> -     */
> -    fpusse_t *fpu_sse =3D v->arch.fpu_ctxt;
> +    fpusse_t *fpu_sse =3D &v->arch.xsave_area->fpu_sse;
>
>      ASSERT(!xsave_area || xsave_area =3D=3D v->arch.xsave_area);
>
> @@ -373,10 +343,7 @@ void vcpu_setup_fpu(struct vcpu *v, struct xsave_str=
uct *xsave_area,
>  /* Free FPU's context save area */
>  void vcpu_destroy_fpu(struct vcpu *v)
>  {
> -    if ( v->arch.xsave_area )
> -        xstate_free_save_area(v);
> -    else
> -        xfree(v->arch.fpu_ctxt);
> +    xstate_free_save_area(v);
>  }
>
>  /*
> diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm=
/domain.h
> index 5219c4fb0f69..b79d6badd71c 100644
> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -591,12 +591,6 @@ struct pv_vcpu
>
>  struct arch_vcpu
>  {
> -    /*
> -     * guest context (mirroring struct vcpu_guest_context) common
> -     * between pv and hvm guests
> -     */
> -
> -    void              *fpu_ctxt;
>      struct cpu_user_regs user_regs;
>
>      /* Debug registers. */
> diff --git a/xen/arch/x86/x86_emulate/blk.c b/xen/arch/x86/x86_emulate/bl=
k.c
> index e790f4f90056..08a05f8453f7 100644
> --- a/xen/arch/x86/x86_emulate/blk.c
> +++ b/xen/arch/x86/x86_emulate/blk.c
> @@ -11,7 +11,7 @@
>      !defined(X86EMUL_NO_SIMD)
>  # ifdef __XEN__
>  #  include <asm/xstate.h>
> -#  define FXSAVE_AREA current->arch.fpu_ctxt
> +#  define FXSAVE_AREA ((void *)&current->arch.xsave_area->fpu_sse)

Could you use "struct x86_fxsr *" instead of "void*" ?
Maybe adding another "struct x86_fxsr fxsr" inside the anonymous
fpu_sse union would help here.

>  # else
>  #  define FXSAVE_AREA get_fpu_save_area()
>  # endif
> diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
> index 57a0749f0d54..af9e345a7ace 100644
> --- a/xen/arch/x86/xstate.c
> +++ b/xen/arch/x86/xstate.c
> @@ -508,9 +508,15 @@ int xstate_alloc_save_area(struct vcpu *v)
>      unsigned int size;
>
>      if ( !cpu_has_xsave )
> -        return 0;
> -
> -    if ( !is_idle_vcpu(v) || !cpu_has_xsavec )
> +    {
> +        /*
> +         * On non-XSAVE systems, we allocate an XSTATE buffer for simpli=
city.
> +         * XSTATE is backwards compatible to FXSAVE, and only one cachel=
ine
> +         * larger.
> +         */
> +        size =3D XSTATE_AREA_MIN_SIZE;
> +    }
> +    else if ( !is_idle_vcpu(v) || !cpu_has_xsavec )
>      {
>          size =3D xsave_cntxt_size;
>          BUG_ON(size < XSTATE_AREA_MIN_SIZE);

Frediano

