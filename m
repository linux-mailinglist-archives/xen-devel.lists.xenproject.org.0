Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 878E019255A
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 11:21:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH37u-00014t-Vg; Wed, 25 Mar 2020 10:19:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=grKZ=5K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jH37t-00014o-Rx
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 10:19:09 +0000
X-Inumbo-ID: 0fab59b4-6e82-11ea-85c5-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0fab59b4-6e82-11ea-85c5-12813bfff9fa;
 Wed, 25 Mar 2020 10:19:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CACECAD11;
 Wed, 25 Mar 2020 10:19:06 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <cfeb8fcf-3ba6-674c-17a9-93be9e746930@suse.com>
 <78b62646-6fd4-e5b3-bc09-783bb017eaaa@suse.com>
 <9af3c1bb-5b8f-4ff5-c9ce-2f34af652814@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <75958d0a-9b63-6f70-a38b-471994c45f5f@suse.com>
Date: Wed, 25 Mar 2020 11:19:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <9af3c1bb-5b8f-4ff5-c9ce-2f34af652814@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [Xen-devel] [PATCH 7/7] x86emul: support SYSRET
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 25.03.2020 11:00, Andrew Cooper wrote:
> On 24/03/2020 16:29, Jan Beulich wrote:
>> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
>> @@ -5975,6 +5975,60 @@ x86_emulate(
>>              goto done;
>>          break;
>>  
>> +    case X86EMUL_OPC(0x0f, 0x07): /* sysret */
>> +        vcpu_must_have(syscall);
>> +        /* Inject #UD if syscall/sysret are disabled. */
>> +        fail_if(!ops->read_msr);
>> +        if ( (rc = ops->read_msr(MSR_EFER, &msr_val, ctxt)) != X86EMUL_OKAY )
>> +            goto done;
>> +        generate_exception_if((msr_val & EFER_SCE) == 0, EXC_UD);
> 
> (as with the SYSCALL side), no need for the vcpu_must_have(syscall) as
> well as this check.

Hmm, yes, we do so elsewhere too, so I'll adjust this there and here.

>> +        generate_exception_if(!amd_like(ctxt) && !mode_64bit(), EXC_UD);
>> +        generate_exception_if(!mode_ring0(), EXC_GP, 0);
>> +        generate_exception_if(!in_protmode(ctxt, ops), EXC_GP, 0);
>> +
> 
> The Intel SYSRET vulnerability checks regs->rcx for canonicity here, and
> raises #GP here.
> 
> I see you've got it below, but this is where the Intel pseudocode puts
> it, before MSR_STAR gets read, and logically it should be grouped with
> the other excpetions.

I had it here first, then moved it down to avoid yet another mode_64bit()
instance. I didn't see why the ordering would matter for the overall
result, on the basis that the STAR read ought not to fail under normal
circumstances. I'll move it back where it was since you ask for it.

>> +        if ( (rc = ops->read_msr(MSR_STAR, &msr_val, ctxt)) != X86EMUL_OKAY )
>> +            goto done;
>> +        sreg.sel = ((msr_val >> 48) + 8) | 3; /* SELECTOR_RPL_MASK */
> 
> This would be the logical behaviour...
> 
> AMD CPUs |3 into %cs.sel, but don't make an equivalent adjustment for
> %ss.sel, and simply take MSR_START.SYSRET_CS + 8.
> 
> If you aren't careful with MSR_STAR, SYSRET will return to userspace
> with mismatching RPL/DPL and userspace can really find itself with an
> %ss with an RPL of 0.  (Of course, when you take an interrupt and
> attempt to IRET back to this context, things fall apart).
> 
> I discovered this entirely by accident in XTF, but it is confirmed by
> careful reading of the AMD SYSRET pseudocode.

I did notice this in their pseudocode, but it looked too wrong to
be true. Will change.

>> +        cs.sel = op_bytes == 8 ? sreg.sel + 8 : sreg.sel - 8;
>> +
>> +        cs.base = sreg.base = 0; /* flat segment */
>> +        cs.limit = sreg.limit = ~0u; /* 4GB limit */
>> +        cs.attr = 0xcfb; /* G+DB+P+DPL3+S+Code */
>> +        sreg.attr = 0xcf3; /* G+DB+P+DPL3+S+Data */
> 
> Again, that would be the logical behaviour...
> 
> AMD CPU's don't update anything but %ss.sel, and even comment the fact
> in pseudocode now.
> 
> This was discovered by Andy Luto, where he found that taking an
> interrupt (unconditionally sets %ss to NUL), and opportunistic sysret
> back to 32bit userspace lets userspace see a sane %ss value, but with
> the attrs still empty, and the stack unusable.
> 
>> +
>> +#ifdef __x86_64__
>> +        if ( mode_64bit() )
>> +        {
>> +            if ( op_bytes == 8 )
>> +            {
>> +                cs.attr = 0xafb; /* L+DB+P+DPL3+S+Code */
>> +                generate_exception_if(!is_canonical_address(_regs.rcx) &&
>> +                                      !amd_like(ctxt), EXC_GP, 0);
> 
> Wherever this ends up living, I think it needs calling out with a
> comment /* CVE-xxx, Intel privilege escalation hole */, as it is a very
> subtle piece of vendor specific behaviour.
> 
> Do we have a Centaur/other CPU to try with?  I'd err on the side of
> going with == Intel rather than !AMD to avoid introducing known
> vulnerabilities into models which stand half a chance of not being affected.

I'd rather not - this exception behavior is spelled out by the
SDM, and hence imo pretty likely to be followed by clones.
While I do have a VIA box somewhere, it's not stable enough to
run for more than a couple of minutes.

>> +                _regs.rip = _regs.rcx;
>> +            }
>> +            else
>> +                _regs.rip = _regs.ecx;
>> +
>> +            _regs.eflags = _regs.r11 & ~(X86_EFLAGS_RF | X86_EFLAGS_VM);
>> +        }
>> +        else
>> +#endif
>> +        {
>> +            _regs.r(ip) = _regs.ecx;
>> +            _regs.eflags |= X86_EFLAGS_IF;
>> +        }
>> +
>> +        fail_if(!ops->write_segment);
>> +        if ( (rc = ops->write_segment(x86_seg_cs, &cs, ctxt)) != X86EMUL_OKAY ||
>> +             (!amd_like(ctxt) &&
>> +              (rc = ops->write_segment(x86_seg_ss, &sreg,
>> +                                       ctxt)) != X86EMUL_OKAY) )
> 
> Oh - here is the AMD behaviour with %ss, but its not quite correct.
> 
> AFAICT, the correct behaviour is to read the old %ss on AMD-like, set
> flat attributes on Intel, and write back normally, because %ss.sel does
> get updated.

Oh, of course - I meant to, got distracted, and then forgot. Will fix.

Jan

