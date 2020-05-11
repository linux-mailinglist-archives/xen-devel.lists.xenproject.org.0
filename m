Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F6A1CE7AB
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2020 23:46:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYGFO-0006Gv-IV; Mon, 11 May 2020 21:46:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MQL3=6Z=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jYGFM-0006Gp-N6
 for xen-devel@lists.xenproject.org; Mon, 11 May 2020 21:46:00 +0000
X-Inumbo-ID: cd5bf946-93d0-11ea-a25b-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cd5bf946-93d0-11ea-a25b-12813bfff9fa;
 Mon, 11 May 2020 21:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589233560;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=uRyRnhqFgzKxenC2tvIs2NePODGr3rM03NA2zgymcN4=;
 b=A2ejr17omt27E73jFOn8TgxW8PfImrUO/T6DHDRHhDJBMeanxwrDTWmK
 5aKtktiku4fomMcxRdigfUPpK+o7pvubPRcVys3ZAjXRcQOGLAd/zBpnf
 u33FOQNK6gqfVgSLDnk5xYbCMJfyQTx657enIgxDGsDh5iTHTb8WwdcBu I=;
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
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: L8L0g6U9Zw1f49zs/whRgmEYhOV4Ql4ZVnjDELpjs82Ywf8cYHtxZf9QMYflpUQXbRCoQxbjd1
 bGXAm/DTTGXkuiKM/gHVx/5WHWt8z3+6alE0VXrfk0rdiYZ34YpR5wKEoDgnJL42e52ZynzfuO
 dGlqKKYo7+1TH3sjkPE4zdi/srSroMC6N+wxqQj5j4Zpx27dtUU2ekuORJH9AaDtBZoRATUK28
 E3KPxQtRQnpoh4goV8liaOiMFelunqPlHw/easV2N+LM8NZlwyXTvMxCEMbZoA7mGha5wdGgoa
 GtA=
X-SBRS: 2.7
X-MesageID: 17253186
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,381,1583211600"; d="scan'208";a="17253186"
Subject: Re: [PATCH 15/16] x86/entry: Adjust guest paths to be shadow stack
 compatible
To: Jan Beulich <jbeulich@suse.com>
References: <20200501225838.9866-1-andrew.cooper3@citrix.com>
 <20200501225838.9866-16-andrew.cooper3@citrix.com>
 <2df78612-2c24-32de-186a-c402e188478c@suse.com>
 <70d7b0e0-a599-6a19-5ace-af4f169545b3@citrix.com>
 <fa78f626-18a1-bd95-b446-8ade5e9282a6@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <b2afaa93-c738-dcfd-cbc7-147e48cd24ee@citrix.com>
Date: Mon, 11 May 2020 22:45:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <fa78f626-18a1-bd95-b446-8ade5e9282a6@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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

On 07/05/2020 17:15, Jan Beulich wrote:
>>>> --- a/xen/arch/x86/x86_64/entry.S
>>>> +++ b/xen/arch/x86/x86_64/entry.S
>>>> @@ -194,6 +194,15 @@ restore_all_guest:
>>>>          movq  8(%rsp),%rcx            # RIP
>>>>          ja    iret_exit_to_guest
>>>>  
>>>> +        /* Clear the supervisor shadow stack token busy bit. */
>>>> +.macro rag_clrssbsy
>>>> +        push %rax
>>>> +        rdsspq %rax
>>>> +        clrssbsy (%rax)
>>>> +        pop %rax
>>>> +.endm
>>>> +        ALTERNATIVE "", rag_clrssbsy, X86_FEATURE_XEN_SHSTK
>>> In principle you could get away without spilling %rax:
>>>
>>>         cmpl  $1,%ecx
>>>         ja    iret_exit_to_guest
>>>
>>>         /* Clear the supervisor shadow stack token busy bit. */
>>> .macro rag_clrssbsy
>>>         rdsspq %rcx
>>>         clrssbsy (%rcx)
>>> .endm
>>>         ALTERNATIVE "", rag_clrssbsy, X86_FEATURE_XEN_SHSTK
>>>         movq  8(%rsp),%rcx            # RIP
>>>         cmpw  $FLAT_USER_CS32,16(%rsp)# CS
>>>         movq  32(%rsp),%rsp           # RSP
>>>         je    1f
>>>         sysretq
>>> 1:      sysretl
>>>
>>>         ALIGN
>>> /* No special register assumptions. */
>>> iret_exit_to_guest:
>>>         movq  8(%rsp),%rcx            # RIP
>>>         andl  $~(X86_EFLAGS_IOPL|X86_EFLAGS_NT|X86_EFLAGS_VM),24(%rsp)
>>>         ...
>>>
>>> Also - what about CLRSSBSY failing? It would seem easier to diagnose
>>> this right here than when getting presumably #DF upon next entry into
>>> Xen. At the very least I think it deserves a comment if an error case
>>> does not get handled.
>> I did consider this, but ultimately decided against it.
>>
>> You can't have an unlikely block inside a alternative block because the
>> jmp's displacement doesn't get fixed up.
> We do fix up unconditional JMP/CALL displacements; I don't
> see why we couldn't also do so for conditional ones.

Only for the first instruction in the block.

We do not decode the entire block of instructions and fix up each
displacement.

>
>>   Keeping everything inline puts
>> an incorrect statically-predicted branch in program flow.
>>
>> Most importantly however, is that the SYSRET path is vastly less common
>> than the IRET path.  There is no easy way to proactively spot problems
>> in the IRET path, which means that conditions leading to a problem are
>> already far more likely to manifest as #DF, so there is very little
>> value in adding complexity to the SYSRET path in the first place.
> The SYSRET path being uncommon is a problem by itself imo, if
> that's indeed the case. I'm sure I've suggested before that
> we convert frames to TRAP_syscall ones whenever possible,
> such that we wouldn't go the slower IRET path.

It is not possible to convert any.

The opportunistic SYSRET logic in Linux loses you performance in
reality.  Its just that the extra conditionals are very highly predicted
and totally dominated by the ring transition cost.

You can create a synthetic test case where the opportunistic logic makes
a performance win, but the chances of encountering real world code where
TRAP_syscall is clear and %r11 and %rcx match flags/rip is 2 ^ 128.

It is very much not worth the extra code and cycles taken to implement.

>>> Somewhat similar for SETSSBSY, except there things get complicated by
>>> it raising #CP instead of setting EFLAGS.CF: Aiui it would require us
>>> to handle #CP on an IST stack in order to avoid #DF there.
>> Right, but having #CP as IST gives us far worse problems.
>>
>> Being able to spot #CP vs #DF doesn't help usefully.  Its still some
>> arbitrary period of time after the damage was done.
>>
>> Any nesting of #CP (including fault on IRET out) results in losing
>> program state and entering an infinite loop.
>>
>> The cases which end up as #DF are properly fatal to the system, and we
>> at least get a clean crash out it.
> May I suggest that all of this gets spelled out in at least
> the description of the patch, so that it can be properly
> understood (and, if need be, revisited) later on?

Is this really the right patch to do that?

I do eventually plan to put a whole load of this kinds of details into
the hypervisor guide.

~Andrew

