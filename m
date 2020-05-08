Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5631CB66B
	for <lists+xen-devel@lfdr.de>; Fri,  8 May 2020 19:58:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jX7GD-0007W3-O8; Fri, 08 May 2020 17:58:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M6n8=6W=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jX7GC-0007Vy-0x
 for xen-devel@lists.xenproject.org; Fri, 08 May 2020 17:58:08 +0000
X-Inumbo-ID: 77ff70f4-9155-11ea-a046-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 77ff70f4-9155-11ea-a046-12813bfff9fa;
 Fri, 08 May 2020 17:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588960686;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=/tf9G9INhMmqoNYZkaphDXy3MgbO46SRIyBkWWuGLHU=;
 b=K1ADmkVepQ5PEdmmxpNQJG2NxjudQatIenwsaZmwhbIuo61Xj9f1EHIW
 MM3oqvpeAf4bVPCShkJ+1G25tMiRd2K2XUIdCmiE3A2yX4hZ0xe+K3dbt
 OEHUbyANiB7lWyOZiZT2lApbHCXi4W8yK5UXAOfEPhGBFYgb+oehOJCp9 M=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
X-Ironport-Dmarc-Check-Result: validskip
IronPort-SDR: gyVkSe73blWrzgYSCiLjGo7tQ2jpcm4KhpC+06ODWtfwDeeD3FWLAn+sohllwxnDL9Vj3y3eAU
 UXs3rLX1sg9R0HN44Q38gFXQp+PkgvnnJRXA3OULRE3wDIeBaqs4mGGc5LZL2/Dyd7aUjHHPEW
 darn0VQghrjoedm3s6bfAXyDenPbmP2pKV82SNakMSGgoDBpnYt2GP1ZX02IuiJvCV8q5gyeRB
 1zENulD1Uj0jKk7EpYW74xv7CDE9PvT8Zn/x7D7I6msnUlg9UHnP6fBmzyVAlTewc5mStrbXDF
 KfA=
X-SBRS: 2.7
X-MesageID: 17782050
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,368,1583211600"; d="scan'208";a="17782050"
Subject: Re: [PATCH v8 07/12] x86emul: support FNSTENV and FNSAVE
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <60cc730f-2a1c-d7a6-74fe-64f3c9308831@suse.com>
 <9a2afbb1-af92-2c7d-9fde-d8d8e4563a2a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <0e222090-c989-45b5-65be-efb09e7b9bb9@citrix.com>
Date: Fri, 8 May 2020 18:58:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <9a2afbb1-af92-2c7d-9fde-d8d8e4563a2a@suse.com>
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

On 05/05/2020 09:15, Jan Beulich wrote:
> To avoid introducing another boolean into emulator state, the
> rex_prefix field gets (ab)used to convey the real/VM86 vs protected mode
> info (affecting structure layout, albeit not size) to x86_emul_blk().
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> TBD: The full 16-bit padding fields in the 32-bit structures get filled
>      with all ones by modern CPUs (i.e. other than the comment says for

You really mean "unlike" here, rather than "other".  They do not have
the same meaning in this context.

(I think you're also missing a "what", which I'm guessing is just an
oversight.)

>      FIP and FDP). We may want to mirror this as well (for the real mode
>      variant), even if those fields' contents are unspecified.

This is surprising behaviour, but I expect it dates back to external x87
processors and default MMIO behaviour.

If it is entirely consistent, it match be nice to match.  OTOH, the
manuals are very clear that it is reserved, which I think gives us the
liberty to use the easier implementation.

> ---
> v7: New.
>
> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> @@ -897,6 +900,50 @@ struct x86_emulate_state {
>  #define PTR_POISON NULL /* 32-bit builds are for user-space, so NULL is OK. */
>  #endif
>  
> +#ifndef X86EMUL_NO_FPU
> +struct x87_env16 {
> +    uint16_t fcw;
> +    uint16_t fsw;
> +    uint16_t ftw;
> +    union {
> +        struct {
> +            uint16_t fip_lo;
> +            uint16_t fop:11, :1, fip_hi:4;
> +            uint16_t fdp_lo;
> +            uint16_t :12, fdp_hi:4;
> +        } real;
> +        struct {
> +            uint16_t fip;
> +            uint16_t fcs;
> +            uint16_t fdp;
> +            uint16_t fds;
> +        } prot;
> +    } mode;
> +};
> +
> +struct x87_env32 {
> +    uint32_t fcw:16, :16;
> +    uint32_t fsw:16, :16;
> +    uint32_t ftw:16, :16;

uint16_t fcw, :16;
uint16_t fsw, :16;
uint16_t ftw, :16;

which reduces the number of 16 bit bitfields.

> +    union {
> +        struct {
> +            /* some CPUs/FPUs also store the full FIP here */
> +            uint32_t fip_lo:16, :16;
> +            uint32_t fop:11, :1, fip_hi:16, :4;
> +            /* some CPUs/FPUs also store the full FDP here */
> +            uint32_t fdp_lo:16, :16;
> +            uint32_t :12, fdp_hi:16, :4;

Annoyingly, two of these lines can't use uint16_t.  I'm torn as to
whether to suggest converting the other two which can.

> +        } real;
> +        struct {
> +            uint32_t fip;
> +            uint32_t fcs:16, fop:11, :5;
> +            uint32_t fdp;
> +            uint32_t fds:16, :16;

These two can be converted safely.

> @@ -4912,9 +4959,19 @@ x86_emulate(
>                      goto done;
>                  emulate_fpu_insn_memsrc(b, modrm_reg & 7, src.val);
>                  break;
> -            case 6: /* fnstenv - TODO */
> +            case 6: /* fnstenv */
> +                fail_if(!ops->blk);
> +                state->blk = blk_fst;
> +                /* REX is meaningless for this insn by this point. */
> +                rex_prefix = in_protmode(ctxt, ops);

Code like this is why I have such a strong objection to obfuscating macros.

It reads as if you're updating a local variable, alongside a comment
explaining that it is meaningless.

It is critically important for clarity that the comment state that
you're (ab)using the field to pass information into ->blk(), and I'd go
so far as suggesting

/*state->*/rex_prefix = in_protmode(ctxt, ops);

to reinforce the point that rex_prefix isn't a local variable, seeing
the obfuscation prevents a real state->rex_prefix from working.

> +                if ( (rc = ops->blk(ea.mem.seg, ea.mem.off, NULL,
> +                                    op_bytes > 2 ? sizeof(struct x87_env32)
> +                                                 : sizeof(struct x87_env16),
> +                                    &_regs.eflags,
> +                                    state, ctxt)) != X86EMUL_OKAY )
> +                    goto done;
>                  state->fpu_ctrl = true;
> -                goto unimplemented_insn;
> +                break;
>              case 7: /* fnstcw m2byte */
>                  state->fpu_ctrl = true;
>              fpu_memdst16:
> @@ -5068,9 +5125,21 @@ x86_emulate(
>                  emulate_fpu_insn_memdst(b, modrm_reg & 7, dst.val);
>                  break;
>              case 4: /* frstor - TODO */
> -            case 6: /* fnsave - TODO */
>                  state->fpu_ctrl = true;
>                  goto unimplemented_insn;
> +            case 6: /* fnsave */
> +                fail_if(!ops->blk);
> +                state->blk = blk_fst;
> +                /* REX is meaningless for this insn by this point. */
> +                rex_prefix = in_protmode(ctxt, ops);
> +                if ( (rc = ops->blk(ea.mem.seg, ea.mem.off, NULL,
> +                                    op_bytes > 2 ? sizeof(struct x87_env32) + 80
> +                                                 : sizeof(struct x87_env16) + 80,
> +                                    &_regs.eflags,
> +                                    state, ctxt)) != X86EMUL_OKAY )
> +                    goto done;
> +                state->fpu_ctrl = true;
> +                break;
>              case 7: /* fnstsw m2byte */
>                  state->fpu_ctrl = true;
>                  goto fpu_memdst16;
> @@ -11542,6 +11611,12 @@ int x86_emul_blk(
>      switch ( state->blk )
>      {
>          bool zf;
> +        struct {
> +            struct x87_env32 env;
> +            struct {
> +               uint8_t bytes[10];
> +            } freg[8];
> +        } fpstate;
>  
>          /*
>           * Throughout this switch(), memory clobbers are used to compensate
> @@ -11571,6 +11646,93 @@ int x86_emul_blk(
>              *eflags |= X86_EFLAGS_ZF;
>          break;
>  
> +#ifndef X86EMUL_NO_FPU
> +
> +    case blk_fst:
> +        ASSERT(!data);
> +
> +        if ( bytes > sizeof(fpstate.env) )
> +            asm ( "fnsave %0" : "=m" (fpstate) );
> +        else
> +            asm ( "fnstenv %0" : "=m" (fpstate.env) );

We have 4 possible sizes to deal with here - the 16 and 32bit formats of
prot vs real/vm86 modes, and it is not clear (code wise) why
sizeof(fpstate.env) is a suitable boundary.

Given that these are legacy instructions and not a hotpath in the
slightest, it is possibly faster (by removing the branch) and definitely
more obvious to use fnsave unconditionally, and derive all of the
smaller layouts that way.

Critically however, it prevents us from needing a CVE/XSA if ... [bottom
comment]

> +
> +        /* state->rex_prefix carries CR0.PE && !EFLAGS.VM setting */
> +        switch ( bytes )
> +        {
> +        case sizeof(fpstate.env):
> +        case sizeof(fpstate):

These case labels don't match up in any kind of obvious way to the
caller.  I think you need /* 32bit FNSAVE */ and /* 32bit FNSTENV */
here, and

> +            if ( !state->rex_prefix )

if ( !state->rex_prefix ) /* Convert 32bit prot to 32bit real/vm86 format */

here.

> +            {
> +                unsigned int fip = fpstate.env.mode.prot.fip +
> +                                   (fpstate.env.mode.prot.fcs << 4);
> +                unsigned int fdp = fpstate.env.mode.prot.fdp +
> +                                   (fpstate.env.mode.prot.fds << 4);
> +                unsigned int fop = fpstate.env.mode.prot.fop;
> +
> +                memset(&fpstate.env.mode, 0, sizeof(fpstate.env.mode));
> +                fpstate.env.mode.real.fip_lo = fip;
> +                fpstate.env.mode.real.fip_hi = fip >> 16;
> +                fpstate.env.mode.real.fop = fop;
> +                fpstate.env.mode.real.fdp_lo = fdp;
> +                fpstate.env.mode.real.fdp_hi = fdp >> 16;
> +            }
> +            memcpy(ptr, &fpstate.env, sizeof(fpstate.env));
> +            if ( bytes == sizeof(fpstate.env) )
> +                ptr = NULL;
> +            else
> +                ptr += sizeof(fpstate.env);
> +            break;
> +
> +        case sizeof(struct x87_env16):
> +        case sizeof(struct x87_env16) + sizeof(fpstate.freg):

Similarly, this wants /* 16bit FNSAVE */ and /* 16bit FNSTENV */.  I'm
tempted to suggest a literal 80 rather than sizeof(fpstate.freg) to
match the caller.

> +            if ( state->rex_prefix )

/* Convert 32bit prot to 16bit prot format */

> +            {
> +                struct x87_env16 *env = ptr;
> +
> +                env->fcw = fpstate.env.fcw;
> +                env->fsw = fpstate.env.fsw;
> +                env->ftw = fpstate.env.ftw;
> +                env->mode.prot.fip = fpstate.env.mode.prot.fip;
> +                env->mode.prot.fcs = fpstate.env.mode.prot.fcs;
> +                env->mode.prot.fdp = fpstate.env.mode.prot.fdp;
> +                env->mode.prot.fds = fpstate.env.mode.prot.fds;
> +            }
> +            else
> +            {

/* Convert 32bit prot to 16bit real/vm86 format */

> +                unsigned int fip = fpstate.env.mode.prot.fip +
> +                                   (fpstate.env.mode.prot.fcs << 4);
> +                unsigned int fdp = fpstate.env.mode.prot.fdp +
> +                                   (fpstate.env.mode.prot.fds << 4);
> +                struct x87_env16 env = {
> +                    .fcw = fpstate.env.fcw,
> +                    .fsw = fpstate.env.fsw,
> +                    .ftw = fpstate.env.ftw,
> +                    .mode.real.fip_lo = fip,
> +                    .mode.real.fip_hi = fip >> 16,
> +                    .mode.real.fop = fpstate.env.mode.prot.fop,
> +                    .mode.real.fdp_lo = fdp,
> +                    .mode.real.fdp_hi = fdp >> 16
> +                };
> +
> +                memcpy(ptr, &env, sizeof(env));
> +            }
> +            if ( bytes == sizeof(struct x87_env16) )
> +                ptr = NULL;
> +            else
> +                ptr += sizeof(struct x87_env16);
> +            break;
> +
> +        default:
> +            ASSERT_UNREACHABLE();
> +            return X86EMUL_UNHANDLEABLE;
> +        }
> +
> +        if ( ptr )
> +            memcpy(ptr, fpstate.freg, sizeof(fpstate.freg));

... we get here accidentally, and then copy stack rubble into the guest.

~Andrew

> +        break;
> +
> +#endif /* X86EMUL_NO_FPU */
> +
>      case blk_movdir:
>          switch ( bytes )
>          {
>


