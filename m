Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3CC1E7D17
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 14:24:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jee3V-0001fa-7L; Fri, 29 May 2020 12:24:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mY44=7L=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jee3T-0001fP-Px
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 12:24:07 +0000
X-Inumbo-ID: 49bb3dc4-a1a7-11ea-a8a4-12813bfff9fa
Received: from ppsw-31.csi.cam.ac.uk (unknown [131.111.8.131])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 49bb3dc4-a1a7-11ea-a8a4-12813bfff9fa;
 Fri, 29 May 2020 12:24:06 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:56290
 helo=[192.168.1.219])
 by ppsw-31.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jee3P-000GC8-MQ (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Fri, 29 May 2020 13:24:04 +0100
Subject: Re: [PATCH v10 2/9] x86emul: rework CMP and TEST emulation
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d2375ecb-f662-99d8-84c2-e9f9c5cf7b9e@suse.com>
 <5843dca9-1a1a-a32e-3cb0-95cd93533723@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <c215f77f-f645-eb08-3ac1-7d9f211e1abf@citrix.com>
Date: Fri, 29 May 2020 13:24:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <5843dca9-1a1a-a32e-3cb0-95cd93533723@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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

On 25/05/2020 15:26, Jan Beulich wrote:
> Unlike similarly encoded insns these don't write their memory operands,

"write to their".

> and hence x86_is_mem_write() should return false for them. However,
> rather than adding special logic there, rework how their emulation gets
> done, by making decoding attributes properly describe the r/o nature of
> their memory operands.

Describe how?  I see you've change the order of operands encoding, but
then override it back?

~Andrew

> Note how this also allows dropping custom LOCK prefix checks.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v10: New.
>
> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> @@ -84,7 +84,7 @@ static const opcode_desc_t opcode_table[
>      ByteOp|DstReg|SrcMem|ModRM, DstReg|SrcMem|ModRM,
>      ByteOp|DstEax|SrcImm, DstEax|SrcImm, 0, ImplicitOps,
>      /* 0x38 - 0x3F */
> -    ByteOp|DstMem|SrcReg|ModRM, DstMem|SrcReg|ModRM,
> +    ByteOp|DstReg|SrcMem|ModRM, DstReg|SrcMem|ModRM,
>      ByteOp|DstReg|SrcMem|ModRM, DstReg|SrcMem|ModRM,
>      ByteOp|DstEax|SrcImm, DstEax|SrcImm, 0, ImplicitOps,
>      /* 0x40 - 0x4F */
> @@ -2481,7 +2481,6 @@ x86_decode_onebyte(
>      case 0x60: /* pusha */
>      case 0x61: /* popa */
>      case 0x62: /* bound */
> -    case 0x82: /* Grp1 (x86/32 only) */
>      case 0xc4: /* les */
>      case 0xc5: /* lds */
>      case 0xce: /* into */
> @@ -2491,6 +2490,14 @@ x86_decode_onebyte(
>          state->not_64bit = true;
>          break;
>  
> +    case 0x82: /* Grp1 (x86/32 only) */
> +        state->not_64bit = true;
> +        /* fall through */
> +    case 0x80: case 0x81: case 0x83: /* Grp1 */
> +        if ( (modrm_reg & 7) == 7 ) /* cmp */
> +            state->desc = (state->desc & ByteOp) | DstNone | SrcMem;
> +        break;
> +
>      case 0x90: /* nop / pause */
>          if ( repe_prefix() )
>              ctxt->opcode |= X86EMUL_OPC_F3(0, 0);
> @@ -2521,6 +2528,11 @@ x86_decode_onebyte(
>          imm2 = insn_fetch_type(uint8_t);
>          break;
>  
> +    case 0xf6: case 0xf7: /* Grp3 */
> +        if ( !(modrm_reg & 6) ) /* test */
> +            state->desc = (state->desc & ByteOp) | DstNone | SrcMem;
> +        break;
> +
>      case 0xff: /* Grp5 */
>          switch ( modrm_reg & 7 )
>          {
> @@ -3928,13 +3940,11 @@ x86_emulate(
>          break;
>  
>      case 0x38: case 0x39: cmp: /* cmp reg,mem */
> -        if ( ops->rmw && dst.type == OP_MEM &&
> -             (rc = read_ulong(dst.mem.seg, dst.mem.off, &dst.val,
> -                              dst.bytes, ctxt, ops)) != X86EMUL_OKAY )
> -            goto done;
> -        /* fall through */
> +        emulate_2op_SrcV("cmp", dst, src, _regs.eflags);
> +        dst.type = OP_NONE;
> +        break;
> +
>      case 0x3a ... 0x3d: /* cmp */
> -        generate_exception_if(lock_prefix, EXC_UD);
>          emulate_2op_SrcV("cmp", src, dst, _regs.eflags);
>          dst.type = OP_NONE;
>          break;
> @@ -4239,7 +4249,9 @@ x86_emulate(
>          case 4: goto and;
>          case 5: goto sub;
>          case 6: goto xor;
> -        case 7: goto cmp;
> +        case 7:
> +            dst.val = imm1;
> +            goto cmp;
>          }
>          break;
>  
> @@ -5233,11 +5245,8 @@ x86_emulate(
>              unsigned long u[2], v;
>  
>          case 0 ... 1: /* test */
> -            generate_exception_if(lock_prefix, EXC_UD);
> -            if ( ops->rmw && dst.type == OP_MEM &&
> -                 (rc = read_ulong(dst.mem.seg, dst.mem.off, &dst.val,
> -                                  dst.bytes, ctxt, ops)) != X86EMUL_OKAY )
> -                goto done;
> +            dst.val = imm1;
> +            dst.bytes = src.bytes;
>              goto test;
>          case 2: /* not */
>              if ( ops->rmw && dst.type == OP_MEM )
>


