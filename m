Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5681CFA4F
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2020 18:14:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYXYE-0003bZ-VA; Tue, 12 May 2020 16:14:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sh4E=62=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jYXYD-0003bQ-FI
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 16:14:37 +0000
X-Inumbo-ID: abd963f8-946b-11ea-b9cf-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id abd963f8-946b-11ea-b9cf-bc764e2007e4;
 Tue, 12 May 2020 16:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589300075;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=MYHVgIVo9jvXLejtNrbXy9XdAcnvJU2n1xm/4DSuPGs=;
 b=LxST1de8ynfu+u7OarlRGMJ1uaHZEZv0MTT+VFoY46PmJUUkFKln7g/6
 k8czC1DwtVKDhw/tFHSiZ08LVZgvHUzsElHiLzTOM/ueTm7txH+p2SxXe
 voF3XHAkOXhR+egubJWiuKivEqU2KICA+hy5wEgH7PwaDZL0T9ekcsjWW I=;
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
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: mgzBGGFjidN/99PQ2OrbS9ToHCO1nogmQvIc/fAxbuJRXysrFvTimlBMYM5sHZUaIFXOuaiSej
 Po6hdEOPLVnqE0ZhXtUAqJ/SUUhyqyIxWfBJ139LS0BrK8bKE6WTRdyL+/TqrN/XHnk4l8N16r
 vamD8OQqXl4P3ukWK2vtoFyf9gJufgNXoVWVM8h/RVeHUfYtuvSlbfyf4SRXQk9g72kJMIi2as
 NmUpksrptk1aEzggKrNVT2EpNe7BtWg02AqGPzLrA+J/sfbfghqNM5NAbN2T3bn2aqR97stUUL
 HQ4=
X-SBRS: 2.7
X-MesageID: 18027030
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,384,1583211600"; d="scan'208";a="18027030"
Subject: Re: [PATCH 12/16] x86/extable: Adjust extable handling to be shadow
 stack compatible
To: Jan Beulich <jbeulich@suse.com>
References: <20200501225838.9866-1-andrew.cooper3@citrix.com>
 <20200501225838.9866-13-andrew.cooper3@citrix.com>
 <1e80c672-9308-f7ad-67ea-69d83d69bc03@suse.com>
 <974f631e-3a82-3da4-124d-f4bf2bef89e2@citrix.com>
 <59fcdaf0-f877-7a90-9bf4-9e41b1bbcea7@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <876b7c21-8354-8461-12b2-baf19b0426de@citrix.com>
Date: Tue, 12 May 2020 17:14:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <59fcdaf0-f877-7a90-9bf4-9e41b1bbcea7@suse.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 12/05/2020 15:31, Jan Beulich wrote:
> On 11.05.2020 23:09, Andrew Cooper wrote:
>> On 07/05/2020 14:35, Jan Beulich wrote:
>>> On 02.05.2020 00:58, Andrew Cooper wrote:
>>>> --- a/xen/arch/x86/traps.c
>>>> +++ b/xen/arch/x86/traps.c
>>>> @@ -778,6 +778,28 @@ static bool exception_fixup(struct cpu_user_regs *regs, bool print)
>>>>                 vec_name(regs->entry_vector), regs->error_code,
>>>>                 _p(regs->rip), _p(regs->rip), _p(fixup));
>>>>  
>>>> +    if ( IS_ENABLED(CONFIG_XEN_SHSTK) )
>>>> +    {
>>>> +        unsigned long ssp;
>>>> +
>>>> +        asm ("rdsspq %0" : "=r" (ssp) : "0" (1) );
>>>> +        if ( ssp != 1 )
>>>> +        {
>>>> +            unsigned long *ptr = _p(ssp);
>>>> +
>>>> +            /* Search for %rip in the shadow stack, ... */
>>>> +            while ( *ptr != regs->rip )
>>>> +                ptr++;
>>> Wouldn't it be better to bound the loop, as it shouldn't search past
>>> (strictly speaking not even to) the next page boundary? Also you
>>> don't care about the top of the stack (being the to be restored SSP),
>>> do you? I.e. maybe
>>>
>>>             while ( *++ptr != regs->rip )
>>>                 ;
>>>
>>> ?
>>>
>>> And then - isn't searching for a specific RIP value alone prone to
>>> error, in case a it matches an ordinary return address? I.e.
>>> wouldn't you better search for a matching RIP accompanied by a
>>> suitable pointer into the shadow stack and a matching CS value?
>>> Otherwise, ...
>>>
>>>> +            ASSERT(ptr[1] == __HYPERVISOR_CS);
>>> ... also assert that ptr[-1] points into the shadow stack?
>> So this is the problem I was talking about that the previous contexts
>> SSP isn't stored anywhere helpful.
>>
>> What we are in practice doing is looking 2 or 3 words up the shadow
>> stack (depending on exactly how deep our call graph is), to the shadow
>> IRET frame matching the real IRET frame which regs is pointing to.
>>
>> Both IRET frames were pushed in the process of generating the exception,
>> and we've already matched regs->rip to the exception table record.  We
>> need to fix up regs->rip and the shadow lip to the fixup address.
>>
>> As we are always fixing up an exception generated from Xen context, we
>> know that ptr[1] == __HYPERVISOR_CS, and *ptr[-1] = &ptr[2], as we
>> haven't switched shadow stack as part of taking this exception. 
>> However, this second point is fragile to exception handlers moving onto IST.
>>
>> We can't encounter regs->rip in the shadow stack between the current SSP
>> and the IRET frame we're looking to fix up, or we would have taken a
>> recursive fault and not reached exception_fixup() to begin with.
> I'm afraid I don't follow here. Consider a function (also)
> involved in exception handling having this code sequence:
>
>     call    func
>     mov     (%rax), %eax
>
> If the fault we're handling occured on the MOV and
> exception_fixup() is a descendant of func(), then the first
> instance of an address on the shadow stack pointing at this
> MOV is going to be the one which did not fault.

No.  The moment `call func` returns, the address you're looking to match
is rubble no longer on the stack.  Numerically, it will be located at
SSP-8 when the fault for MOV is generated.

In this exact case, it would be clobbered by the shadow IRET frame, but
even if it was deeper in the call tree, we would still never encounter
it from waking up the shadow stack from SSP.

The only things you will find on the shadow stack is the shadow IRET
frame, handle_exception_saved(), do_*(), fixup_exception(), except that
I'd not like to fix the behaviour to require exactly two function calls
of depth for fixup_exception().

>> Therefore, the loop is reasonably bounded in all cases.
>>
>> Sadly, there is no RDSS instruction, so we can't actually use shadow
>> stack reads to spot if we underflowed the shadow stack, and there is no
>> useful alternative to panic() if we fail to find the shadow IRET frame.
> But afaics you don't panic() in this case. Instead you continue
> looping until (presumably) you hit some form of fault.
>
>>>> --- a/xen/arch/x86/x86_64/entry.S
>>>> +++ b/xen/arch/x86/x86_64/entry.S
>>>> @@ -708,7 +708,16 @@ exception_with_ints_disabled:
>>>>          call  search_pre_exception_table
>>>>          testq %rax,%rax                 # no fixup code for faulting EIP?
>>>>          jz    1b
>>>> -        movq  %rax,UREGS_rip(%rsp)
>>>> +        movq  %rax,UREGS_rip(%rsp)      # fixup regular stack
>>>> +
>>>> +#ifdef CONFIG_XEN_SHSTK
>>>> +        mov    $1, %edi
>>>> +        rdsspq %rdi
>>>> +        cmp    $1, %edi
>>>> +        je     .L_exn_shstk_done
>>>> +        wrssq  %rax, (%rdi)             # fixup shadow stack
>>>> +.L_exn_shstk_done:
>>>> +#endif
>>> Again avoid the conditional jump by using alternatives patching?
>> Well - that depends on whether we're likely to gain any new content in
>> the pre exception table.
>>
>> As it stands, it is only the IRET(s) to userspace so would be safe to
>> turn this into an unconditional alternative.  Even in the crash case, we
>> won't be returning to guest context after having started the crash
>> teardown path.
> Ah, right - perhaps indeed better keep it as is then.

That was my reasoning.  It is a path we expect to execute never with
well behaved guests, so I erred on the safe side.

~Andrew

