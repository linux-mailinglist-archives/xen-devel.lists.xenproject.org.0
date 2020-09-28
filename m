Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3AE27AEAE
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 15:08:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMsse-0003Go-RC; Mon, 28 Sep 2020 13:07:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HPfX=DF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kMssd-0003Gi-19
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 13:07:47 +0000
X-Inumbo-ID: a418389d-b536-4569-93a9-bfa83c070f65
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a418389d-b536-4569-93a9-bfa83c070f65;
 Mon, 28 Sep 2020 13:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1601298465;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=DaG6hRrs0K3ShVFOyImkEMlqCs00qtgg0Hg7Jv0m+P8=;
 b=Quvd46AAunfVRaYSwGI9cxlQ32jgwj+7Y6jnhJSvawGqpjeQCWnBVoIH
 ew3pifGvZIwO1+drv3gNZm3aUHVQQ2VZmXGC2WSlax3Msd1GWdujgwVXq
 0sM1RH/4ffP1FUx7/44hT4JE8g6/E03CXN6PrvqW1rkJKEuyoM9BjX+1w 0=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: /Wik1sQKEksgtETuShOnGStYteEuJMuHuoa2ZmNsJLMgSthGuzYYrdnAQGoTTkWr/laYIHtMnP
 nMjyMYpTb9cbSp9L048wTc7+PSHYhdsbqiybpBu/6WY3Fh6/iA4Zj1oLHteSuyTuySeBTQIxiq
 CJ0DUjNG6MR83BHTc2rOSkurdDbjmDXj7gNDF/uzU/hPdvSCCo0eF+nZO23neHsICcJkYrLPqM
 c7qbAiUDtEMzWDVfVn1d9hePbpsqXrFnuQnjrI+sUCUmNA0qDu5tICY1NIkWaYaPXGH442jmwN
 EAU=
X-SBRS: None
X-MesageID: 28031111
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,313,1596513600"; d="scan'208";a="28031111"
Subject: Re: [PATCH 3/3] x86/pv: Inject #UD for missing SYSCALL callbacks
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Andy Lutomirski <luto@kernel.org>, Manuel Bouyer
 <bouyer@antioche.eu.org>
References: <20200923101848.29049-1-andrew.cooper3@citrix.com>
 <20200923101848.29049-4-andrew.cooper3@citrix.com>
 <ed891c94-63a4-496c-6817-1b88ac4c004b@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <0a4f11a4-efe7-0a58-1e25-b394a1a10b3c@citrix.com>
Date: Mon, 28 Sep 2020 14:05:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ed891c94-63a4-496c-6817-1b88ac4c004b@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24/09/2020 15:56, Jan Beulich wrote:
> On 23.09.2020 12:18, Andrew Cooper wrote:
>> Despite appearing to be a deliberate design choice of early PV64, the
>> resulting behaviour for unregistered SYSCALL callbacks creates an untenable
>> testability problem for Xen.  Furthermore, the behaviour is undocumented,
>> bizarre, and inconsistent with related behaviour in Xen, and very liable
>> introduce a security vulnerability into a PV guest if the author hasn't
>> studied Xen's assembly code in detail.
>>
>> There are two different bugs here.
>>
>> 1) The current logic confuses the registered entrypoints, and may deliver a
>>    SYSCALL from 32bit userspace to the 64bit entry, when only a 64bit
>>    entrypoint is registered.
>>
>>    This has been the case ever since 2007 (c/s cd75d47348b) but up until
>>    2018 (c/s dba899de14) the wrong selectors would be handed to the guest for
>>    a 32bit SYSCALL entry, making it appear as if it a 64bit entry all along.
> I'm not sure what you derive the last half sentence from. To a 32-bit
> PV guest, nothing can make things look like being 64-bit.

Right, but what part of this discussion is relevant to 32bit PV guests,
when we're discussing junk data being passed to the 64bit SYSCALL entry?

> And as you
> did say in your 2018 change, FLAT_KERNEL_SS == FLAT_USER_SS32.

And? Mode is determined by CS, not SS.  A kernel suffering this failure
will find a CS claiming to be FLAT_RING1_DS/RPL3, and not
FLAT_COMPAT_USER_CS.

Even if we presume for a moment that multiplexing was a sensible plan,
there were 13 years where you couldn't rationally distinguish the two
conditions.

Considering the very obvious chaos which occurs when you try to
HYPERCALL_iret with the bogus frame, either noone ever encountered it,
or everyone used the Linux way which was to blindly overwrite Xen's
selectors with the knowledge (and by this, I mean expectation) that the
two entrypoints distinguished the originating mode.

Linux doesn't go wrong because it registers both entrypoints, but
anything else using similar logic (and only one registered entrypoint)
would end up returning to 32bit userspace in 64bit mode.

> As to the "confusion" of entry points - before the compat mode entry
> path was introduced, a 64-bit guest could only register a single
> entry point.

The fact that MSR_LSTAR and MSR_CSTAR are separate in the AMD64 spec is
a very good hint that that is how software should/would expect things to
behave.

The timing and content of c/s 02410e06fea7, which introduced the first
use of SYSCALL, looks suspiciously like it was designed to the Intel
manual, seeing as it failed to configure MSR_CSTAR entirely.

The CSTAR "fix" came later in c/s 6c94cfd1491 "Various bug fixes", which
introduced the confusion of the two entrypoints, and still hadn't been
tested on AMD as it would return to 32bit userspace in 64bit mode.

c/s 091e799a840c was the commit which introduced the syscall entrypoint.

> Hence guests at the time had to multiplex 32- and 64-bit
> user mode entry from this one code path. In order to avoid regressing
> any such guest, the falling back to using the 64-bit entry point was
> chosen. Effectively what you propose is to regress such guests now,
> rather than back then.

I completely believe that you deliberately avoided changing the existing
behaviour at the time.

I just don't find it credible that the multiplexing was a deliberate and
informed design choice originally, when it looks very much like an
accident, and was so broken for more than a decade following.

I'm not trying to ascribe blame.  I can see exactly how this happened,
especially given how broken 32bit SYSCALL was AMD (how many OSes
realised they needed to have #DB in a task gate to be safe, considering
that basically the same bug took everyone by surprise a couple of years
ago).  32bit code never used SYSCALL, so multiplexing never got used in
practice, which is why the bugs remained hidden for 13 years, and which
is why changing the behaviour now doesn't break anything.

>>    Xen would malfunction under these circumstances, if it were a PV guest.
>>    Linux would as well, but PVOps has always registered both entrypoints and
>>    discarded the Xen-provided selectors.  NetBSD really does malfunction as a
>>    consequence (benignly now, but a VM DoS before the 2018 Xen selector fix).
>>
>> 2) In the case that neither SYSCALL callbacks are registered, the guest will
>>    be crashed when userspace executes a SYSCALL instruction, which is a
>>    userspace => kernel DoS.
>>
>>    This has been the case ever since the introduction of 64bit PV support, but
>>    behaves unlike all other SYSCALL/SYSENTER callbacks in Xen, which yield
>>    #GP/#UD in userspace before the callback is registered, and are therefore
>>    safe by default.
> I agree this part is an improvement.
>
>> This change does constitute a change in the PV ABI, for corner cases of a PV
>> guest kernel registering neither callback, or not registering the 32bit
>> callback when running on AMD/Hygon hardware.
>>
>> It brings the behaviour in line with PV32 SYSCALL/SYSENTER, and PV64
>> SYSENTER (safe by default, until explicitly enabled), as well as native
>> hardware (always delivered to the single applicable callback).
> Albeit an OS running natively and setting EFER.SCE is obliged to set both
> entry points; they can't have one without the other (and not be vulnerable).
> Since it's unclear what the PV equivalent of EFER.SCE is, I don't think
> comparing this particular aspect of the behavior makes a lot of sense.

A 32bit PV guest doesn't have EFER.SCE, but the act of registering the
SYSCALL32 entry point "enables" a 32bit SYSCALL to work (i.e. not #GP).

Neither type of PV guest has MSR_SYSENTER_CS, but the act of registering
the SYSENTER entry point "enables" SYSENTER to work (i.e. not #GP, if
you can call the fairly bogus resulting state "working".)

The asymmetry here is that a 64bit PV guest will be DoS'd before it
registers at least one of the two SYSCALL entry points.

>> Most importantly however, and the primary reason for the change, is that it
>> lets us actually test the PV entrypoints to prove correct behaviour.
> You mean "test the absence of PV entry points" here?

No, but that sentence clearly didn't come out right.

What I meant to say was that it lets us sensibly test all of Xen's fast
system call entrypoints, under all of the states which a PV guest can
configure.

>
>> --- a/xen/arch/x86/x86_64/entry.S
>> +++ b/xen/arch/x86/x86_64/entry.S
>> @@ -26,18 +26,30 @@
>>  /* %rbx: struct vcpu */
>>  ENTRY(switch_to_kernel)
>>          leaq  VCPU_trap_bounce(%rbx),%rdx
>> -        /* TB_eip = (32-bit syscall && syscall32_addr) ?
>> -         *          syscall32_addr : syscall_addr */
>> -        xor   %eax,%eax
>> +
>> +        /* TB_eip = 32-bit syscall ? syscall32_addr : syscall_addr */
>> +        mov   VCPU_syscall32_addr(%rbx), %ecx
>> +        mov   VCPU_syscall_addr(%rbx), %rax
>>          cmpw  $FLAT_USER_CS32,UREGS_cs(%rsp)
>> -        cmoveq VCPU_syscall32_addr(%rbx),%rax
>> -        testq %rax,%rax
>> -        cmovzq VCPU_syscall_addr(%rbx),%rax
>> -        movq  %rax,TRAPBOUNCE_eip(%rdx)
>> +        cmove %rcx, %rax
>> +
>>          /* TB_flags = VGCF_syscall_disables_events ? TBF_INTERRUPT : 0 */
>>          btl   $_VGCF_syscall_disables_events,VCPU_guest_context_flags(%rbx)
>>          setc  %cl
>>          leal  (,%rcx,TBF_INTERRUPT),%ecx
>> +
>> +        test  %rax, %rax
>> +UNLIKELY_START(z, syscall_no_callback) /* TB_eip == 0 => #UD */
>> +        movq  VCPU_trap_ctxt(%rbx), %rdi
>> +        movl  $X86_EXC_UD, UREGS_entry_vector(%rsp)
>> +        subl  $2, UREGS_rip(%rsp)
>> +        movl  X86_EXC_UD * TRAPINFO_sizeof + TRAPINFO_eip(%rdi), %eax
> I guess you mean "movq ..., %rax"? Iirc 32-bit guests don't even get through
> here.

Oops - you're quite right.  This only passes testing because XTF is
linked at 1M.

~Andrew

