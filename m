Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA1D1CB854
	for <lists+xen-devel@lfdr.de>; Fri,  8 May 2020 21:33:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jX8iy-0007H3-BT; Fri, 08 May 2020 19:31:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M6n8=6W=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jX8iw-0007Gy-Ie
 for xen-devel@lists.xenproject.org; Fri, 08 May 2020 19:31:54 +0000
X-Inumbo-ID: 91ca2e90-9162-11ea-a061-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 91ca2e90-9162-11ea-a061-12813bfff9fa;
 Fri, 08 May 2020 19:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588966314;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Yj1X4kaVtelg71QUbAwLQpZu8oQuNOJ2I/AnJIv7FYY=;
 b=aSxgq4NZ4vJXXRxsJeGxJc1dAW5Hgem7PSpVdYHDdRQUCveHhgFByeYx
 DRzLyLUSEkZMn0dRQN4HZT+ydKXG2Dz8Xw+j4QEdNRb+273tEnVUR4jYg
 Mbl3/omoFYppe1SZSqUlrUH2XmOtwf4t3a6D1f94gBsH4nu1Sj2BiCkf8 Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
X-Ironport-Dmarc-Check-Result: validskip
IronPort-SDR: oE/DjZX68ROKNquvq5Vr+v0FJ9oCOFaV+zzDy1p95J/CtDSnKC7v3WU2PfSYZN8v2kK9NEEHc8
 S5ZRa3sQZZDflDbitG11hsJHFuWyaS1U7fife9Th52LHALRY5c4fIUv2Nh3SPAO9NO+AGn14Bq
 LIjUbGX35JJAxbGYodmgyq9Aoi9RG29G3KDx1d68G1huwhqLIZkG8sFFXkbwR8ydZt1iJ+AB8A
 +8KaSjH+3+qhScvZUCj87MbpLrLfpXtWK/psCvG7lVQqeaOAY7ic+n/VSQoc7MT8QG/wQY9GVK
 wVM=
X-SBRS: 2.7
X-MesageID: 17361964
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,368,1583211600"; d="scan'208";a="17361964"
Subject: Re: [PATCH v8 09/12] x86emul: support FXSAVE/FXRSTOR
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <60cc730f-2a1c-d7a6-74fe-64f3c9308831@suse.com>
 <ea1db2c5-3dd7-f1c8-c051-e39f0dffc94e@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <4f0da795-a148-e1f3-bd97-caeb84d702cb@citrix.com>
Date: Fri, 8 May 2020 20:31:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <ea1db2c5-3dd7-f1c8-c051-e39f0dffc94e@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 05/05/2020 09:16, Jan Beulich wrote:
> Note that FPU selector handling as well as MXCSR mask saving for now
> does not honor differences between host and guest visible featuresets.
>
> While for Intel operation of the insns with CR4.OSFXSR=0 is
> implementation dependent, use the easiest solution there: Simply don't
> look at the bit in the first place. For AMD and alike the behavior is
> well defined, so it gets handled together with FFXSR.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v8: Respect EFER.FFXSE and CR4.OSFXSR. Correct wrong X86EMUL_NO_*
>     dependencies. Reduce #ifdef-ary.
> v7: New.
>
> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> @@ -953,6 +958,29 @@ typedef union {
>      uint32_t data32[16];
>  } mmval_t;
>  
> +struct x86_fxsr {
> +    uint16_t fcw;
> +    uint16_t fsw;
> +    uint16_t ftw:8, :8;

uint8_t

> +    uint16_t fop;
> +    union {
> +        struct {
> +            uint32_t offs;
> +            uint32_t sel:16, :16;

uint16_t

> +        };
> +        uint64_t addr;
> +    } fip, fdp;
> +    uint32_t mxcsr;
> +    uint32_t mxcsr_mask;
> +    struct {
> +        uint8_t data[10];
> +        uint8_t _[6];

I'd be tempted to suggest uint16_t :16, :16, :16; here, which gets rid
of the named field, or explicitly rsvd to match below.

> +    } fpreg[8];
> +    uint64_t __attribute__ ((aligned(16))) xmm[16][2];
> +    uint64_t _[6];

This field however is used below.  It would be clearer being named 'rsvd'.

> +    uint64_t avl[6];
> +};
> +
>  /*
>   * While proper alignment gets specified above, this doesn't get honored by
>   * the compiler for automatic variables. Use this helper to instantiate a
> @@ -1910,6 +1938,7 @@ amd_like(const struct x86_emulate_ctxt *
>  #define vcpu_has_cmov()        (ctxt->cpuid->basic.cmov)
>  #define vcpu_has_clflush()     (ctxt->cpuid->basic.clflush)
>  #define vcpu_has_mmx()         (ctxt->cpuid->basic.mmx)
> +#define vcpu_has_fxsr()        (ctxt->cpuid->basic.fxsr)
>  #define vcpu_has_sse()         (ctxt->cpuid->basic.sse)
>  #define vcpu_has_sse2()        (ctxt->cpuid->basic.sse2)
>  #define vcpu_has_sse3()        (ctxt->cpuid->basic.sse3)
> @@ -8125,6 +8154,47 @@ x86_emulate(
>      case X86EMUL_OPC(0x0f, 0xae): case X86EMUL_OPC_66(0x0f, 0xae): /* Grp15 */
>          switch ( modrm_reg & 7 )
>          {
> +#if !defined(X86EMUL_NO_FPU) || !defined(X86EMUL_NO_MMX) || \
> +    !defined(X86EMUL_NO_SIMD)
> +        case 0: /* fxsave */
> +        case 1: /* fxrstor */
> +            generate_exception_if(vex.pfx, EXC_UD);
> +            vcpu_must_have(fxsr);
> +            generate_exception_if(ea.type != OP_MEM, EXC_UD);
> +            generate_exception_if(!is_aligned(ea.mem.seg, ea.mem.off, 16,
> +                                              ctxt, ops),
> +                                  EXC_GP, 0);
> +            fail_if(!ops->blk);
> +            op_bytes =
> +#ifdef __x86_64__
> +                !mode_64bit() ? offsetof(struct x86_fxsr, xmm[8]) :
> +#endif
> +                sizeof(struct x86_fxsr);
> +            if ( amd_like(ctxt) )
> +            {
> +                if ( !ops->read_cr ||
> +                     ops->read_cr(4, &cr4, ctxt) != X86EMUL_OKAY )
> +                    cr4 = X86_CR4_OSFXSR;

Why do we want to assume OSFXSR in the case of a read_cr() failure,
rather than bailing on the entire instruction?

> +                if ( !ops->read_msr ||
> +                     ops->read_msr(MSR_EFER, &msr_val, ctxt) != X86EMUL_OKAY )
> +                    msr_val = 0;
> +                if ( !(cr4 & X86_CR4_OSFXSR) ||
> +                     (mode_64bit() && mode_ring0() && (msr_val & EFER_FFXSE)) )
> +                    op_bytes = offsetof(struct x86_fxsr, xmm[0]);

This is a very peculiar optimisation in AMD processors...  (but your
logic here does agree with the description AFAICT)

> +            }
> +            /*
> +             * This could also be X86EMUL_FPU_mmx, but it shouldn't be
> +             * X86EMUL_FPU_xmm, as we don't want CR4.OSFXSR checked.
> +             */
> +            get_fpu(X86EMUL_FPU_fpu);
> +            state->blk = modrm_reg & 1 ? blk_fxrstor : blk_fxsave;
> +            if ( (rc = ops->blk(ea.mem.seg, ea.mem.off, NULL,
> +                                sizeof(struct x86_fxsr), &_regs.eflags,
> +                                state, ctxt)) != X86EMUL_OKAY )
> +                goto done;
> +            break;
> +#endif /* X86EMUL_NO_{FPU,MMX,SIMD} */
> +
>  #ifndef X86EMUL_NO_SIMD
>          case 2: /* ldmxcsr */
>              generate_exception_if(vex.pfx, EXC_UD);
> @@ -11611,6 +11681,8 @@ int x86_emul_blk(
>      struct x86_emulate_state *state,
>      struct x86_emulate_ctxt *ctxt)
>  {
> +    int rc = X86EMUL_OKAY;
> +
>      switch ( state->blk )
>      {
>          bool zf;
> @@ -11819,6 +11891,77 @@ int x86_emul_blk(
>  
>  #endif /* X86EMUL_NO_FPU */
>  
> +#if !defined(X86EMUL_NO_FPU) || !defined(X86EMUL_NO_MMX) || \
> +    !defined(X86EMUL_NO_SIMD)
> +
> +    case blk_fxrstor:
> +    {
> +        struct x86_fxsr *fxsr = FXSAVE_AREA;
> +
> +        ASSERT(!data);
> +        ASSERT(bytes == sizeof(*fxsr));
> +        ASSERT(state->op_bytes <= bytes);
> +
> +        if ( state->op_bytes < sizeof(*fxsr) )
> +        {
> +            if ( state->rex_prefix & REX_W )
> +            {
> +                /*
> +                 * The only way to force fxsaveq on a wide range of gas
> +                 * versions. On older versions the rex64 prefix works only if
> +                 * we force an addressing mode that doesn't require extended
> +                 * registers.
> +                 */
> +                asm volatile ( ".byte 0x48; fxsave (%1)"
> +                               : "=m" (*fxsr) : "R" (fxsr) );
> +            }
> +            else
> +                asm volatile ( "fxsave %0" : "=m" (*fxsr) );
> +        }
> +
> +        memcpy(fxsr, ptr, min(state->op_bytes,
> +                              (unsigned int)offsetof(struct x86_fxsr, _)));
> +        memset(fxsr->_, 0, sizeof(*fxsr) - offsetof(struct x86_fxsr, _));

I'm completely lost trying to follow what's going on here.  Why are we
constructing something different to what the guest gave us?

> +
> +        generate_exception_if(fxsr->mxcsr & ~mxcsr_mask, EXC_GP, 0);
> +
> +        if ( state->rex_prefix & REX_W )
> +        {
> +            /* See above for why operand/constraints are this way. */
> +            asm volatile ( ".byte 0x48; fxrstor (%0)"
> +                           :: "R" (fxsr), "m" (*fxsr) );
> +        }
> +        else
> +            asm volatile ( "fxrstor %0" :: "m" (*fxsr) );
> +        break;
> +    }
> +
> +    case blk_fxsave:
> +    {
> +        struct x86_fxsr *fxsr = FXSAVE_AREA;
> +
> +        ASSERT(!data);
> +        ASSERT(bytes == sizeof(*fxsr));
> +        ASSERT(state->op_bytes <= bytes);
> +
> +        if ( state->rex_prefix & REX_W )
> +        {
> +            /* See above for why operand/constraint are this way. */
> +            asm volatile ( ".byte 0x48; fxsave (%0)"
> +                           :: "R" (state->op_bytes < sizeof(*fxsr) ? fxsr : ptr)
> +                           : "memory" );
> +        }
> +        else
> +            asm volatile ( "fxsave (%0)"
> +                           :: "r" (state->op_bytes < sizeof(*fxsr) ? fxsr : ptr)
> +                           : "memory" );
> +        if ( state->op_bytes < sizeof(*fxsr) )
> +            memcpy(ptr, fxsr, state->op_bytes);

I think this logic would be clearer to follow with:

void *buf = state->op_bytes < sizeof(*fxsr) ? fxsr : ptr;

...

if ( buf != ptr )
    memcpy(ptr, fxsr, state->op_bytes);

This more clearly highlights the "we either fxsave'd straight into the
destination pointer, or into a local buffer if we only want a subset"
property.

> --- a/xen/arch/x86/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate.c
> @@ -42,6 +42,8 @@
>      }                                                      \
>  })
>  
> +#define FXSAVE_AREA current->arch.fpu_ctxt

How safe is this?  Don't we already use this buffer to recover the old
state in the case of an exception?

~Andrew

