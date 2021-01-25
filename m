Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B27330239A
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 11:22:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.73975.132957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3z0f-0007UE-FZ; Mon, 25 Jan 2021 10:22:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 73975.132957; Mon, 25 Jan 2021 10:22:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3z0f-0007Tp-CR; Mon, 25 Jan 2021 10:22:13 +0000
Received: by outflank-mailman (input) for mailman id 73975;
 Mon, 25 Jan 2021 10:22:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dw2F=G4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l3z0d-0007Tk-9o
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 10:22:11 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9dcaacdf-0429-4c8f-af7e-7ecf313f2b32;
 Mon, 25 Jan 2021 10:22:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 197C0AD8C;
 Mon, 25 Jan 2021 10:22:09 +0000 (UTC)
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
X-Inumbo-ID: 9dcaacdf-0429-4c8f-af7e-7ecf313f2b32
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611570129; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NQa3RZbEzOpIdwFKyAZJ/pGEXSoKDjgAc85t4Bw1J28=;
	b=dImCtYVpLz7eQ72HPUcDZGqtnV5Sr6dzzAJzNqm1iJw+K/2nuwuMjI5+Nm3aDhFGxyPMLF
	CcSw2hoZ9qDVXG7mvr3GMoZ7ajue77/OFRJVe33CQSNChvJfUR4+TJ7OZeBvX9unk9pXW7
	LsYk6yG4lQJ7HnsQtJXt+3ThizN3Le8=
Subject: Re: [PATCH v2 3/4] x86: Allow non-faulting accesses to non-emulated
 MSRs if policy permits this
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: iwj@xenproject.org, wl@xen.org, anthony.perard@citrix.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, jun.nakajima@intel.com,
 kevin.tian@intel.com, xen-devel@lists.xenproject.org
References: <1611182952-9941-1-git-send-email-boris.ostrovsky@oracle.com>
 <1611182952-9941-4-git-send-email-boris.ostrovsky@oracle.com>
 <c9ee36ca-e19d-0408-d137-8dcee4110ef3@suse.com>
 <dc4ec7c0-c2cf-bf15-a757-7f1836ca801d@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d3aec393-4f3b-140b-2189-5de731ee23ba@suse.com>
Date: Mon, 25 Jan 2021 11:22:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <dc4ec7c0-c2cf-bf15-a757-7f1836ca801d@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22.01.2021 20:52, Boris Ostrovsky wrote:
> On 1/22/21 7:51 AM, Jan Beulich wrote:
>> On 20.01.2021 23:49, Boris Ostrovsky wrote:
>>> +
>>> +    /*
>>> +     * Accesses to unimplemented MSRs as part of emulation of instructions
>>> +     * other than guest's RDMSR/WRMSR should never succeed.
>>> +     */
>>> +    if ( !is_guest_msr_access )
>>> +        ignore_msrs = MSR_UNHANDLED_NEVER;
>>
>> Wouldn't you better "return true" here? Such accesses also
>> shouldn't be logged imo (albeit I agree that's a change from
>> current behavior).
> 
> 
> Yes, that's why I didn't return here. We will be here in !is_guest_msr_access case most likely due to a bug in the emulator so I think we do want to see the error logged.

Why "most likely"?

>>> +    if ( unlikely(ignore_msrs != MSR_UNHANDLED_NEVER) )
>>> +        *val = 0;
>>
>> I don't understand the conditional here, even more so with
>> the respective changelog entry. In any event you don't
>> want to clobber the value ahead of ...
>>
>>> +    if ( likely(ignore_msrs != MSR_UNHANDLED_SILENT) )
>>> +    {
>>> +        if ( is_write )
>>> +            gdprintk(XENLOG_WARNING, "WRMSR 0x%08x val 0x%016"PRIx64
>>> +                    " unimplemented\n", msr, *val);
>>
>> ... logging it.
> 
> 
> True. I dropped !is_write from v1 without considering this.
> 
> As far as the conditional --- dropping it too would be a behavior change. 

Albeit an intentional one then? Plus I think I have trouble
seeing what behavior it would be that would change.

>>> --- a/xen/arch/x86/x86_emulate/x86_emulate.h
>>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.h
>>> @@ -850,4 +850,10 @@ static inline void x86_emul_reset_event(struct x86_emulate_ctxt *ctxt)
>>>      ctxt->event = (struct x86_event){};
>>>  }
>>>  
>>> +static inline bool x86_emul_guest_msr_access(struct x86_emulate_ctxt *ctxt)
>>
>> The parameter wants to be pointer-to-const. In addition I wonder
>> whether this wouldn't better be a sibling to
>> x86_insn_is_cr_access() (without a "state" parameter, which
>> would be unused and unavailable to the callers), which may end
>> up finding further uses down the road.
> 
> 
> "Sibling" in terms of name (yes, it would be) or something else?

Name and (possible) purpose - a validate hook could want to
make use of this, for example.

>>> +{
>>> +    return ctxt->opcode == X86EMUL_OPC(0x0f, 0x32) ||  /* RDMSR */
>>> +           ctxt->opcode == X86EMUL_OPC(0x0f, 0x30);    /* WRMSR */
>>> +}
>>
>> Personally I'd prefer if this was a single comparison:
>>
>>     return (ctxt->opcode | 2) == X86EMUL_OPC(0x0f, 0x32);
>>
>> But maybe nowadays' compilers are capable of this
>> transformation?
> 
> Here is what I've got (not an inline but shouldn't make much difference I'd think)
> 
> ffff82d040385960 <x86_emul_guest_msr_access_2>: # your code
> ffff82d040385960:       8b 47 2c                mov    0x2c(%rdi),%eax
> ffff82d040385963:       83 e0 fd                and    $0xfffffffd,%eax
> ffff82d040385966:       3d 30 00 0f 00          cmp    $0xf0030,%eax
> ffff82d04038596b:       0f 94 c0                sete   %al
> ffff82d04038596e:       c3                      retq
> 
> ffff82d04038596f <x86_emul_guest_msr_access_1>: # my code
> ffff82d04038596f:       8b 47 2c                mov    0x2c(%rdi),%eax
> ffff82d040385972:       83 c8 02                or     $0x2,%eax
> ffff82d040385975:       3d 32 00 0f 00          cmp    $0xf0032,%eax
> ffff82d04038597a:       0f 94 c0                sete   %al
> ffff82d04038597d:       c3                      retq
> 
> 
> So it's a wash in terms of generated code.

True, albeit I guess you got "your code" and "my code" the
wrong way round, as I don't expect the compiler to
translate | into "and".

>> I notice you use this function only from PV priv-op emulation.
>> What about the call paths through hvmemul_{read,write}_msr()?
>> (It's also questionable whether the write paths need this -
>> the only MSR written outside of WRMSR emulation is
>> MSR_SHADOW_GS_BASE, which can't possibly reach the "unhandled"
>> logic anywhere. But maybe better to be future proof here in
>> case new MSR writes appear in the emulator, down the road.)
> 
> 
> Won't we end up in hvm_funcs.msr_write_intercept ops which do call it?

Of course we will - the boolean will very likely need
propagating (a possible alternative being a per-vCPU flag
indicating "in emulator").

Jan

