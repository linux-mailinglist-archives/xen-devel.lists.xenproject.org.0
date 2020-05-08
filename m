Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED59B1CB099
	for <lists+xen-devel@lfdr.de>; Fri,  8 May 2020 15:39:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jX3CG-0007p7-MO; Fri, 08 May 2020 13:37:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Ij8=6W=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jX3CE-0007p2-PP
 for xen-devel@lists.xenproject.org; Fri, 08 May 2020 13:37:46 +0000
X-Inumbo-ID: 18fab830-9131-11ea-b9cf-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 18fab830-9131-11ea-b9cf-bc764e2007e4;
 Fri, 08 May 2020 13:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588945065;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DhRphIvf7sjTNx/Wdze4Otwlur5WjDj9hFxA790+fD4=;
 b=NEnGGbNDvW4foFuJhA/kF8U/5oqeBaQQmnTun4q37lfBfob7X3wTyQGA
 OmrXoDPwp7yqtfSOlgwfKda76GdEuIXwovUElWK5mR1RTZVaf7aEJxceK
 ienkSxsJJGs8SzRo14NKQgArRUhL/nhCXjlaNP4zHYhdEo0hA1dk/qBhg 0=;
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: giKtkqNoDW9oR34EmkmnjJ8mXDFhqKJtornAa3jOob5klNe1NexDMVIDS3n7vVPal2zCMy+aes
 RfXBBkhAnY4vsBHU1yXcaiNDtE3wRFNrZTD0gYACwXWfXneVq5kHFUbe8hyRIfN3t95sJO+fZH
 lUIt6HK449gy1/pennObmNI6XdwTTApfomUUMbUucBTDJ4h/mxQRsh5TLTBGTarYgA+dsRQe4Z
 ZQljPMT1g7TKGoet8RZrpDUThTJB4YZVRrEhiE0uTXXNwkcF+Be9QuoXKYPSDFuSG1nnwoTDT8
 h2U=
X-SBRS: 2.7
X-MesageID: 17349962
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,367,1583211600"; d="scan'208";a="17349962"
Date: Fri, 8 May 2020 15:37:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v8 08/12] x86emul: support FLDENV and FRSTOR
Message-ID: <20200508133720.GH1353@Air-de-Roger>
References: <60cc730f-2a1c-d7a6-74fe-64f3c9308831@suse.com>
 <09fe2c18-0037-af71-93be-87261051e2a2@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <09fe2c18-0037-af71-93be-87261051e2a2@suse.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, May 05, 2020 at 10:16:20AM +0200, Jan Beulich wrote:
> While the Intel SDM claims that FRSTOR itself may raise #MF upon
> completion, this was confirmed by Intel to be a doc error which will be
> corrected in due course; behavior is like FLDENV, and like old hard copy
> manuals describe it. Otherwise we'd have to emulate the insn by filling
> st(N) in suitable order, followed by FLDENV.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v7: New.
> 
> --- a/tools/tests/x86_emulator/test_x86_emulator.c
> +++ b/tools/tests/x86_emulator/test_x86_emulator.c
> @@ -2442,6 +2442,27 @@ int main(int argc, char **argv)
>      else
>          printf("skipped\n");
>  
> +    printf("%-40s", "Testing fldenv 8(%edx)...");

Likely a stupid question, but why the added 8? edx will contain the
memory address used to save the sate by fnstenv, so I would expect
fldenv to just load from there?

> +    if ( stack_exec && cpu_has_fpu )
> +    {
> +        asm volatile ( "fnstenv %0\n\t"
> +                       "fninit"
> +                       : "=m" (res[2]) :: "memory" );

Why do you need the memory clobber here? I assume it's because res is
of type unsigned int and hence doesn't have the right size that
fnstenv will actually write to?

> +        zap_fpsel(&res[2], true);
> +        instr[0] = 0xd9; instr[1] = 0x62; instr[2] = 0x08;
> +        regs.eip = (unsigned long)&instr[0];
> +        regs.edx = (unsigned long)res;
> +        rc = x86_emulate(&ctxt, &emulops);
> +        asm volatile ( "fnstenv %0" : "=m" (res[9]) :: "memory" );
> +        if ( (rc != X86EMUL_OKAY) ||
> +             memcmp(res + 2, res + 9, 28) ||
> +             (regs.eip != (unsigned long)&instr[3]) )
> +            goto fail;
> +        printf("okay\n");
> +    }
> +    else
> +        printf("skipped\n");
> +
>      printf("%-40s", "Testing 16-bit fnsave (%ecx)...");
>      if ( stack_exec && cpu_has_fpu )
>      {
> @@ -2468,6 +2489,31 @@ int main(int argc, char **argv)
>              goto fail;
>          printf("okay\n");
>      }
> +    else
> +        printf("skipped\n");
> +
> +    printf("%-40s", "Testing frstor (%edx)...");
> +    if ( stack_exec && cpu_has_fpu )
> +    {
> +        const uint16_t seven = 7;
> +
> +        asm volatile ( "fninit\n\t"
> +                       "fld1\n\t"
> +                       "fidivs %1\n\t"
> +                       "fnsave %0\n\t"
> +                       : "=&m" (res[0]) : "m" (seven) : "memory" );
> +        zap_fpsel(&res[0], true);
> +        instr[0] = 0xdd; instr[1] = 0x22;
> +        regs.eip = (unsigned long)&instr[0];
> +        regs.edx = (unsigned long)res;
> +        rc = x86_emulate(&ctxt, &emulops);
> +        asm volatile ( "fnsave %0" : "=m" (res[27]) :: "memory" );
> +        if ( (rc != X86EMUL_OKAY) ||
> +             memcmp(res, res + 27, 108) ||
> +             (regs.eip != (unsigned long)&instr[2]) )
> +            goto fail;
> +        printf("okay\n");
> +    }
>      else
>          printf("skipped\n");
>  
> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> @@ -857,6 +857,7 @@ struct x86_emulate_state {
>          blk_NONE,
>          blk_enqcmd,
>  #ifndef X86EMUL_NO_FPU
> +        blk_fld, /* FLDENV, FRSTOR */
>          blk_fst, /* FNSTENV, FNSAVE */
>  #endif
>          blk_movdir,
> @@ -4948,21 +4949,14 @@ x86_emulate(
>                  dst.bytes = 4;
>                  emulate_fpu_insn_memdst(b, modrm_reg & 7, dst.val);
>                  break;
> -            case 4: /* fldenv - TODO */
> -                state->fpu_ctrl = true;
> -                goto unimplemented_insn;
> -            case 5: /* fldcw m2byte */
> -                state->fpu_ctrl = true;
> -            fpu_memsrc16:
> -                if ( (rc = ops->read(ea.mem.seg, ea.mem.off, &src.val,
> -                                     2, ctxt)) != X86EMUL_OKAY )
> -                    goto done;
> -                emulate_fpu_insn_memsrc(b, modrm_reg & 7, src.val);
> -                break;
> +            case 4: /* fldenv */
> +                /* Raise #MF now if there are pending unmasked exceptions. */
> +                emulate_fpu_insn_stub(0xd9, 0xd0 /* fnop */);

Maybe it would make sense to have a wrapper for fnop?

> +                /* fall through */
>              case 6: /* fnstenv */
>                  fail_if(!ops->blk);
> -                state->blk = blk_fst;
> -                /* REX is meaningless for this insn by this point. */
> +                state->blk = modrm_reg & 2 ? blk_fst : blk_fld;
> +                /* REX is meaningless for these insns by this point. */
>                  rex_prefix = in_protmode(ctxt, ops);
>                  if ( (rc = ops->blk(ea.mem.seg, ea.mem.off, NULL,
>                                      op_bytes > 2 ? sizeof(struct x87_env32)
> @@ -4972,6 +4966,14 @@ x86_emulate(
>                      goto done;
>                  state->fpu_ctrl = true;
>                  break;
> +            case 5: /* fldcw m2byte */
> +                state->fpu_ctrl = true;
> +            fpu_memsrc16:
> +                if ( (rc = ops->read(ea.mem.seg, ea.mem.off, &src.val,
> +                                     2, ctxt)) != X86EMUL_OKAY )
> +                    goto done;
> +                emulate_fpu_insn_memsrc(b, modrm_reg & 7, src.val);
> +                break;
>              case 7: /* fnstcw m2byte */
>                  state->fpu_ctrl = true;
>              fpu_memdst16:
> @@ -5124,13 +5126,14 @@ x86_emulate(
>                  dst.bytes = 8;
>                  emulate_fpu_insn_memdst(b, modrm_reg & 7, dst.val);
>                  break;
> -            case 4: /* frstor - TODO */
> -                state->fpu_ctrl = true;
> -                goto unimplemented_insn;
> +            case 4: /* frstor */
> +                /* Raise #MF now if there are pending unmasked exceptions. */
> +                emulate_fpu_insn_stub(0xd9, 0xd0 /* fnop */);
> +                /* fall through */
>              case 6: /* fnsave */
>                  fail_if(!ops->blk);
> -                state->blk = blk_fst;
> -                /* REX is meaningless for this insn by this point. */
> +                state->blk = modrm_reg & 2 ? blk_fst : blk_fld;
> +                /* REX is meaningless for these insns by this point. */
>                  rex_prefix = in_protmode(ctxt, ops);
>                  if ( (rc = ops->blk(ea.mem.seg, ea.mem.off, NULL,
>                                      op_bytes > 2 ? sizeof(struct x87_env32) + 80
> @@ -11648,6 +11651,89 @@ int x86_emul_blk(
>  
>  #ifndef X86EMUL_NO_FPU
>  
> +    case blk_fld:
> +        ASSERT(!data);
> +
> +        /* state->rex_prefix carries CR0.PE && !EFLAGS.VM setting */
> +        switch ( bytes )
> +        {
> +        case sizeof(fpstate.env):
> +        case sizeof(fpstate):
> +            memcpy(&fpstate.env, ptr, sizeof(fpstate.env));
> +            if ( !state->rex_prefix )
> +            {
> +                unsigned int fip = fpstate.env.mode.real.fip_lo +
> +                                   (fpstate.env.mode.real.fip_hi << 16);
> +                unsigned int fdp = fpstate.env.mode.real.fdp_lo +
> +                                   (fpstate.env.mode.real.fdp_hi << 16);
> +                unsigned int fop = fpstate.env.mode.real.fop;
> +
> +                fpstate.env.mode.prot.fip = fip & 0xf;
> +                fpstate.env.mode.prot.fcs = fip >> 4;
> +                fpstate.env.mode.prot.fop = fop;
> +                fpstate.env.mode.prot.fdp = fdp & 0xf;
> +                fpstate.env.mode.prot.fds = fdp >> 4;

I've found the layouts in the SDM vol. 1, but I haven't been able to
found the translation mechanism from real to protected. Could you
maybe add a reference here?

> +            }
> +
> +            if ( bytes == sizeof(fpstate.env) )
> +                ptr = NULL;
> +            else
> +                ptr += sizeof(fpstate.env);
> +            break;
> +
> +        case sizeof(struct x87_env16):
> +        case sizeof(struct x87_env16) + sizeof(fpstate.freg):
> +        {
> +            const struct x87_env16 *env = ptr;
> +
> +            fpstate.env.fcw = env->fcw;
> +            fpstate.env.fsw = env->fsw;
> +            fpstate.env.ftw = env->ftw;
> +
> +            if ( state->rex_prefix )
> +            {
> +                fpstate.env.mode.prot.fip = env->mode.prot.fip;
> +                fpstate.env.mode.prot.fcs = env->mode.prot.fcs;
> +                fpstate.env.mode.prot.fdp = env->mode.prot.fdp;
> +                fpstate.env.mode.prot.fds = env->mode.prot.fds;
> +                fpstate.env.mode.prot.fop = 0; /* unknown */
> +            }
> +            else
> +            {
> +                unsigned int fip = env->mode.real.fip_lo +
> +                                   (env->mode.real.fip_hi << 16);
> +                unsigned int fdp = env->mode.real.fdp_lo +
> +                                   (env->mode.real.fdp_hi << 16);
> +                unsigned int fop = env->mode.real.fop;
> +
> +                fpstate.env.mode.prot.fip = fip & 0xf;
> +                fpstate.env.mode.prot.fcs = fip >> 4;
> +                fpstate.env.mode.prot.fop = fop;
> +                fpstate.env.mode.prot.fdp = fdp & 0xf;
> +                fpstate.env.mode.prot.fds = fdp >> 4;

This looks mostly the same as the translation done above, so maybe
could be abstracted anyway in a macro to avoid the code repetition?
(ie: fpstate_real_to_prot(src, dst) or some such).

Thanks, Roger.

