Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2621D149A
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2020 15:24:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYrMq-0004bh-7W; Wed, 13 May 2020 13:24:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dqM3=63=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jYrMp-0004ba-Dl
 for xen-devel@lists.xenproject.org; Wed, 13 May 2020 13:24:11 +0000
X-Inumbo-ID: 06fc3330-951d-11ea-a375-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 06fc3330-951d-11ea-a375-12813bfff9fa;
 Wed, 13 May 2020 13:24:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 66C71ACA1;
 Wed, 13 May 2020 13:24:11 +0000 (UTC)
Subject: Re: [PATCH v8 09/12] x86emul: support FXSAVE/FXRSTOR
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <60cc730f-2a1c-d7a6-74fe-64f3c9308831@suse.com>
 <ea1db2c5-3dd7-f1c8-c051-e39f0dffc94e@suse.com>
 <4f0da795-a148-e1f3-bd97-caeb84d702cb@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <017ea483-cda8-7dec-883d-b877e3965b94@suse.com>
Date: Wed, 13 May 2020 15:24:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <4f0da795-a148-e1f3-bd97-caeb84d702cb@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
 Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 08.05.2020 21:31, Andrew Cooper wrote:
> On 05/05/2020 09:16, Jan Beulich wrote:
>> @@ -8125,6 +8154,47 @@ x86_emulate(
>>      case X86EMUL_OPC(0x0f, 0xae): case X86EMUL_OPC_66(0x0f, 0xae): /* Grp15 */
>>          switch ( modrm_reg & 7 )
>>          {
>> +#if !defined(X86EMUL_NO_FPU) || !defined(X86EMUL_NO_MMX) || \
>> +    !defined(X86EMUL_NO_SIMD)
>> +        case 0: /* fxsave */
>> +        case 1: /* fxrstor */
>> +            generate_exception_if(vex.pfx, EXC_UD);
>> +            vcpu_must_have(fxsr);
>> +            generate_exception_if(ea.type != OP_MEM, EXC_UD);
>> +            generate_exception_if(!is_aligned(ea.mem.seg, ea.mem.off, 16,
>> +                                              ctxt, ops),
>> +                                  EXC_GP, 0);
>> +            fail_if(!ops->blk);
>> +            op_bytes =
>> +#ifdef __x86_64__
>> +                !mode_64bit() ? offsetof(struct x86_fxsr, xmm[8]) :
>> +#endif
>> +                sizeof(struct x86_fxsr);
>> +            if ( amd_like(ctxt) )
>> +            {
>> +                if ( !ops->read_cr ||
>> +                     ops->read_cr(4, &cr4, ctxt) != X86EMUL_OKAY )
>> +                    cr4 = X86_CR4_OSFXSR;
> 
> Why do we want to assume OSFXSR in the case of a read_cr() failure,
> rather than bailing on the entire instruction?

I prefer to assume "normal" operation over failing in such
cases. We have a few similar examples elsewhere. I'll add
a comment t this effect.

>> @@ -11819,6 +11891,77 @@ int x86_emul_blk(
>>  
>>  #endif /* X86EMUL_NO_FPU */
>>  
>> +#if !defined(X86EMUL_NO_FPU) || !defined(X86EMUL_NO_MMX) || \
>> +    !defined(X86EMUL_NO_SIMD)
>> +
>> +    case blk_fxrstor:
>> +    {
>> +        struct x86_fxsr *fxsr = FXSAVE_AREA;
>> +
>> +        ASSERT(!data);
>> +        ASSERT(bytes == sizeof(*fxsr));
>> +        ASSERT(state->op_bytes <= bytes);
>> +
>> +        if ( state->op_bytes < sizeof(*fxsr) )
>> +        {
>> +            if ( state->rex_prefix & REX_W )
>> +            {
>> +                /*
>> +                 * The only way to force fxsaveq on a wide range of gas
>> +                 * versions. On older versions the rex64 prefix works only if
>> +                 * we force an addressing mode that doesn't require extended
>> +                 * registers.
>> +                 */
>> +                asm volatile ( ".byte 0x48; fxsave (%1)"
>> +                               : "=m" (*fxsr) : "R" (fxsr) );
>> +            }
>> +            else
>> +                asm volatile ( "fxsave %0" : "=m" (*fxsr) );
>> +        }
>> +
>> +        memcpy(fxsr, ptr, min(state->op_bytes,
>> +                              (unsigned int)offsetof(struct x86_fxsr, _)));
>> +        memset(fxsr->_, 0, sizeof(*fxsr) - offsetof(struct x86_fxsr, _));
> 
> I'm completely lost trying to follow what's going on here.  Why are we
> constructing something different to what the guest gave us?

This part of the structure may not get written by FXSAVE. Hence
I'd prefer to assume it has unknown contents (which we shouldn't
leak) over assuming this would never get written (and hence
remain zeroed). Furthermore we mean to pass this to FXRSTOR,
which we know can raise #GP in principle. While this is a legacy
insns and hence unlikely to change in behavior, it seems more
safe to have well known values in at least the reserved range.

I'll add an abbreviated variant of this as a comment.

>> +
>> +        generate_exception_if(fxsr->mxcsr & ~mxcsr_mask, EXC_GP, 0);
>> +
>> +        if ( state->rex_prefix & REX_W )
>> +        {
>> +            /* See above for why operand/constraints are this way. */
>> +            asm volatile ( ".byte 0x48; fxrstor (%0)"
>> +                           :: "R" (fxsr), "m" (*fxsr) );
>> +        }
>> +        else
>> +            asm volatile ( "fxrstor %0" :: "m" (*fxsr) );
>> +        break;
>> +    }
>> +
>> +    case blk_fxsave:
>> +    {
>> +        struct x86_fxsr *fxsr = FXSAVE_AREA;
>> +
>> +        ASSERT(!data);
>> +        ASSERT(bytes == sizeof(*fxsr));
>> +        ASSERT(state->op_bytes <= bytes);
>> +
>> +        if ( state->rex_prefix & REX_W )
>> +        {
>> +            /* See above for why operand/constraint are this way. */
>> +            asm volatile ( ".byte 0x48; fxsave (%0)"
>> +                           :: "R" (state->op_bytes < sizeof(*fxsr) ? fxsr : ptr)
>> +                           : "memory" );
>> +        }
>> +        else
>> +            asm volatile ( "fxsave (%0)"
>> +                           :: "r" (state->op_bytes < sizeof(*fxsr) ? fxsr : ptr)
>> +                           : "memory" );
>> +        if ( state->op_bytes < sizeof(*fxsr) )
>> +            memcpy(ptr, fxsr, state->op_bytes);
> 
> I think this logic would be clearer to follow with:
> 
> void *buf = state->op_bytes < sizeof(*fxsr) ? fxsr : ptr;
> 
> ...
> 
> if ( buf != ptr )
>     memcpy(ptr, fxsr, state->op_bytes);
> 
> This more clearly highlights the "we either fxsave'd straight into the
> destination pointer, or into a local buffer if we only want a subset"
> property.

Ah, yes, and by having buf (or really repurposed fxsr) have
proper type I can then also avoid the memory clobbers, making
the asm()s more similar to the ones used for FXRSTOR emulation.

>> --- a/xen/arch/x86/x86_emulate.c
>> +++ b/xen/arch/x86/x86_emulate.c
>> @@ -42,6 +42,8 @@
>>      }                                                      \
>>  })
>>  
>> +#define FXSAVE_AREA current->arch.fpu_ctxt
> 
> How safe is this?  Don't we already use this buffer to recover the old
> state in the case of an exception?

For a memory write fault after having updated register state
already, yes. But that can't be the case here. Nevertheless
forcing me to look at this again turned up a bug: We need to
set state->fpu_ctrl in order to keep {,hvmemul_}put_fpu()
from trying to replace FIP/FOP/FDP.

Jan

