Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9E81CB6FD
	for <lists+xen-devel@lfdr.de>; Fri,  8 May 2020 20:20:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jX7b8-0000rp-Nt; Fri, 08 May 2020 18:19:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M6n8=6W=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jX7b7-0000rk-IH
 for xen-devel@lists.xenproject.org; Fri, 08 May 2020 18:19:45 +0000
X-Inumbo-ID: 7dad4596-9158-11ea-a04d-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7dad4596-9158-11ea-a04d-12813bfff9fa;
 Fri, 08 May 2020 18:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588961985;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=NpeuG5CrKL/UohQSxc3MzgpR9FmZIavGI5ZvTQk8K5g=;
 b=OJs49vLk9Sh0UeFbVnzl+P5wFz6xMEpgACsY4mWT1IKcDDB3LLI7SoPF
 mnVdRadX4mLoS9VEjvLCS/6VEVP0Khingx4pSRZFKWpNbWfvxMYnfXUrB
 hz3EgbWxIXZZsJqHxMEiMMBDUZxdS+kt3IO6sDL6dog4fqrlTDG2Z5b3o 8=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
X-Ironport-Dmarc-Check-Result: validskip
IronPort-SDR: aUFSsr0S6ZCJ7OemU0LGUhNWgv+Bv31p3ZQMqR5oaLNaaOG3H73cj9ao2OCtoXLU4vCij45ijB
 dQl6UjFuAy3uHiz3a4kQjadMONQx9YtDuYgSL736V1izkkl6Fn7Mrb4OhtKznqELUWZkjpg+NH
 TQAhxvtelSy8HKhQz+dRTRUQG1pkDiOWavcgLr0RLmd827+Q50eNomDn2Onr75UUCJycMI1Edt
 BJY96P0/MPLMbaXTO433RM5ZSgToDoD9l2XAwlJly8ASZMyiQrcaKgloMakctSvrvaCt1okkEr
 Lgs=
X-SBRS: 2.7
X-MesageID: 17085663
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,368,1583211600"; d="scan'208";a="17085663"
Subject: Re: [PATCH v8 08/12] x86emul: support FLDENV and FRSTOR
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <60cc730f-2a1c-d7a6-74fe-64f3c9308831@suse.com>
 <09fe2c18-0037-af71-93be-87261051e2a2@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <f60dbeea-1054-486f-d1f5-ab9da46c951a@citrix.com>
Date: Fri, 8 May 2020 19:19:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <09fe2c18-0037-af71-93be-87261051e2a2@suse.com>
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
> While the Intel SDM claims that FRSTOR itself may raise #MF upon
> completion, this was confirmed by Intel to be a doc error which will be
> corrected in due course; behavior is like FLDENV, and like old hard copy
> manuals describe it. Otherwise we'd have to emulate the insn by filling
> st(N) in suitable order, followed by FLDENV.

I wouldn't bother calling this out at all.  We know the doc is going to
be corrected in the next revision, and "what we would have done if the
docs error was in fact accurate" only adds confusion to an already
complicated change.

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

The commit message should however note that the larger-than-expected
diff is purely code motion for case 5, to arrange fldenv to fall though
into fstenv.

Alternatively, could be pulled out into an earlier patch.

> +            case 4: /* fldenv */
> +                /* Raise #MF now if there are pending unmasked exceptions. */
> +                emulate_fpu_insn_stub(0xd9, 0xd0 /* fnop */);
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

The same comments about comments apply here from the previous patch.

~Andrew

