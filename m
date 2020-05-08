Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CD01CB271
	for <lists+xen-devel@lfdr.de>; Fri,  8 May 2020 17:04:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jX4Xl-0007MZ-SZ; Fri, 08 May 2020 15:04:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t3Kb=6W=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jX4Xk-0007MQ-Mt
 for xen-devel@lists.xenproject.org; Fri, 08 May 2020 15:04:04 +0000
X-Inumbo-ID: 27bbffc6-913d-11ea-b9cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 27bbffc6-913d-11ea-b9cf-bc764e2007e4;
 Fri, 08 May 2020 15:04:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9CF03AE65;
 Fri,  8 May 2020 15:04:05 +0000 (UTC)
Subject: Re: [PATCH v8 08/12] x86emul: support FLDENV and FRSTOR
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <60cc730f-2a1c-d7a6-74fe-64f3c9308831@suse.com>
 <09fe2c18-0037-af71-93be-87261051e2a2@suse.com>
 <20200508133720.GH1353@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4b6f4353-066e-351d-597d-4455193ff95f@suse.com>
Date: Fri, 8 May 2020 17:04:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200508133720.GH1353@Air-de-Roger>
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
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 08.05.2020 15:37, Roger Pau Monné wrote:
> On Tue, May 05, 2020 at 10:16:20AM +0200, Jan Beulich wrote:
>> --- a/tools/tests/x86_emulator/test_x86_emulator.c
>> +++ b/tools/tests/x86_emulator/test_x86_emulator.c
>> @@ -2442,6 +2442,27 @@ int main(int argc, char **argv)
>>      else
>>          printf("skipped\n");
>>  
>> +    printf("%-40s", "Testing fldenv 8(%edx)...");
> 
> Likely a stupid question, but why the added 8? edx will contain the
> memory address used to save the sate by fnstenv, so I would expect
> fldenv to just load from there?

The 8 is just to vary ModR/M encodings acrosss the various
tests - it's an arbitrary choice.

>> +    if ( stack_exec && cpu_has_fpu )
>> +    {
>> +        asm volatile ( "fnstenv %0\n\t"
>> +                       "fninit"
>> +                       : "=m" (res[2]) :: "memory" );
> 
> Why do you need the memory clobber here? I assume it's because res is
> of type unsigned int and hence doesn't have the right size that
> fnstenv will actually write to?

Correct.

>> @@ -4948,21 +4949,14 @@ x86_emulate(
>>                  dst.bytes = 4;
>>                  emulate_fpu_insn_memdst(b, modrm_reg & 7, dst.val);
>>                  break;
>> -            case 4: /* fldenv - TODO */
>> -                state->fpu_ctrl = true;
>> -                goto unimplemented_insn;
>> -            case 5: /* fldcw m2byte */
>> -                state->fpu_ctrl = true;
>> -            fpu_memsrc16:
>> -                if ( (rc = ops->read(ea.mem.seg, ea.mem.off, &src.val,
>> -                                     2, ctxt)) != X86EMUL_OKAY )
>> -                    goto done;
>> -                emulate_fpu_insn_memsrc(b, modrm_reg & 7, src.val);
>> -                break;
>> +            case 4: /* fldenv */
>> +                /* Raise #MF now if there are pending unmasked exceptions. */
>> +                emulate_fpu_insn_stub(0xd9, 0xd0 /* fnop */);
> 
> Maybe it would make sense to have a wrapper for fnop?

I'm not convinced that would be worth it.

>> @@ -11648,6 +11651,89 @@ int x86_emul_blk(
>>  
>>  #ifndef X86EMUL_NO_FPU
>>  
>> +    case blk_fld:
>> +        ASSERT(!data);
>> +
>> +        /* state->rex_prefix carries CR0.PE && !EFLAGS.VM setting */
>> +        switch ( bytes )
>> +        {
>> +        case sizeof(fpstate.env):
>> +        case sizeof(fpstate):
>> +            memcpy(&fpstate.env, ptr, sizeof(fpstate.env));
>> +            if ( !state->rex_prefix )
>> +            {
>> +                unsigned int fip = fpstate.env.mode.real.fip_lo +
>> +                                   (fpstate.env.mode.real.fip_hi << 16);
>> +                unsigned int fdp = fpstate.env.mode.real.fdp_lo +
>> +                                   (fpstate.env.mode.real.fdp_hi << 16);
>> +                unsigned int fop = fpstate.env.mode.real.fop;
>> +
>> +                fpstate.env.mode.prot.fip = fip & 0xf;
>> +                fpstate.env.mode.prot.fcs = fip >> 4;
>> +                fpstate.env.mode.prot.fop = fop;
>> +                fpstate.env.mode.prot.fdp = fdp & 0xf;
>> +                fpstate.env.mode.prot.fds = fdp >> 4;
> 
> I've found the layouts in the SDM vol. 1, but I haven't been able to
> found the translation mechanism from real to protected. Could you
> maybe add a reference here?

A reference to some piece of documentation? I don't think this
is spelled out anywhere. It's also only one of various possible
ways of doing the translation, but among them the most flexible
one for possible consumers of the data (because of using the
smallest possible offsets into the segments).

>> +            }
>> +
>> +            if ( bytes == sizeof(fpstate.env) )
>> +                ptr = NULL;
>> +            else
>> +                ptr += sizeof(fpstate.env);
>> +            break;
>> +
>> +        case sizeof(struct x87_env16):
>> +        case sizeof(struct x87_env16) + sizeof(fpstate.freg):
>> +        {
>> +            const struct x87_env16 *env = ptr;
>> +
>> +            fpstate.env.fcw = env->fcw;
>> +            fpstate.env.fsw = env->fsw;
>> +            fpstate.env.ftw = env->ftw;
>> +
>> +            if ( state->rex_prefix )
>> +            {
>> +                fpstate.env.mode.prot.fip = env->mode.prot.fip;
>> +                fpstate.env.mode.prot.fcs = env->mode.prot.fcs;
>> +                fpstate.env.mode.prot.fdp = env->mode.prot.fdp;
>> +                fpstate.env.mode.prot.fds = env->mode.prot.fds;
>> +                fpstate.env.mode.prot.fop = 0; /* unknown */
>> +            }
>> +            else
>> +            {
>> +                unsigned int fip = env->mode.real.fip_lo +
>> +                                   (env->mode.real.fip_hi << 16);
>> +                unsigned int fdp = env->mode.real.fdp_lo +
>> +                                   (env->mode.real.fdp_hi << 16);
>> +                unsigned int fop = env->mode.real.fop;
>> +
>> +                fpstate.env.mode.prot.fip = fip & 0xf;
>> +                fpstate.env.mode.prot.fcs = fip >> 4;
>> +                fpstate.env.mode.prot.fop = fop;
>> +                fpstate.env.mode.prot.fdp = fdp & 0xf;
>> +                fpstate.env.mode.prot.fds = fdp >> 4;
> 
> This looks mostly the same as the translation done above, so maybe
> could be abstracted anyway in a macro to avoid the code repetition?
> (ie: fpstate_real_to_prot(src, dst) or some such).

Just the 5 assignments could be put in an inline function, but
if we also wanted to abstract away the declarations with their
initializers, it would need to be a macro because of the
different types of fpstate.env and *env. While I'd generally
prefer inline functions, the macro would have the benefit that
it could be #define-d / #undef-d right inside this case block.
Thoughts? 

Jan

