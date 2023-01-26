Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DAD67D664
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 21:27:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485207.752254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL8qI-0007Ti-Qe; Thu, 26 Jan 2023 20:27:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485207.752254; Thu, 26 Jan 2023 20:27:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL8qI-0007Ry-Nk; Thu, 26 Jan 2023 20:27:30 +0000
Received: by outflank-mailman (input) for mailman id 485207;
 Thu, 26 Jan 2023 20:27:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4vwE=5X=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1pL8qH-0007Rs-S3
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 20:27:29 +0000
Received: from ppsw-42.srv.uis.cam.ac.uk (ppsw-42.srv.uis.cam.ac.uk
 [131.111.8.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8b6b4eb-9db7-11ed-b8d1-410ff93cb8f0;
 Thu, 26 Jan 2023 21:27:26 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:49568)
 by ppsw-42.srv.uis.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1pL8q4-000eKb-G5 (Exim 4.96) (return-path <amc96@srcf.net>);
 Thu, 26 Jan 2023 20:27:17 +0000
Received: from [10.80.2.8] (default-46-102-197-194.interdsl.co.uk
 [46.102.197.194]) (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id B374A1FA26;
 Thu, 26 Jan 2023 20:27:16 +0000 (GMT)
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
X-Inumbo-ID: d8b6b4eb-9db7-11ed-b8d1-410ff93cb8f0
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <df86e0a6-1415-3fd3-5202-faff5edfc271@srcf.net>
Date: Thu, 26 Jan 2023 20:27:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <930254a6-d0c8-4910-982a-bfd227187240@suse.com>
 <8ee98cc0-21d3-100a-ffcc-37cd466e7761@suse.com>
 <718f6fd0-cb96-6f72-87ff-7382582d89f9@srcf.net>
 <fa38f305-df29-4178-2279-17a084fdf2cd@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH v3 1/4] x86/spec-ctrl: add logic to issue IBPB on exit to
 guest
In-Reply-To: <fa38f305-df29-4178-2279-17a084fdf2cd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/01/2023 8:02 am, Jan Beulich wrote:
> On 25.01.2023 22:10, Andrew Cooper wrote:
>> On 25/01/2023 3:25 pm, Jan Beulich wrote:
>>> In order to be able to defer the context switch IBPB to the last
>>> possible point, add logic to the exit-to-guest paths to issue the
>>> barrier there, including the "IBPB doesn't flush the RSB/RAS"
>>> workaround. Since alternatives, for now at least, can't nest, emit JMP
>>> to skip past both constructs where both are needed. This may be more
>>> efficient anyway, as the sequence of NOPs is pretty long.
>> It is very uarch specific as to when a jump is less overhead than a line
>> of nops.
>>
>> In all CPUs liable to be running Xen, even unconditional jumps take up
>> branch prediction resource, because all branch prediction is pre-decode
>> these days, so branch locations/types/destinations all need deriving
>> from %rip and "history" alone.
>>
>> So whether a branch or a line of nops is better is a tradeoff between
>> how much competition there is for branch prediction resource, and how
>> efficiently the CPU can brute-force its way through a long line of nops.
>>
>> But a very interesting datapoint.  It turns out that AMD Zen4 CPUs
>> macrofuse adjacent nops, including longnops, because it reduces the
>> amount of execute/retire resources required.  And a lot of
>> kernel/hypervisor fastpaths have a lot of nops these days.
>>
>>
>> For us, the "can't nest" is singularly more important than any worry
>> about uarch behaviour.  We've frankly got much lower hanging fruit than
>> worring about one branch vs a few nops.
>>
>>> LFENCEs are omitted - for HVM a VM entry is immanent, which already
>>> elsewhere we deem sufficiently serializing an event. For 32-bit PV
>>> we're going through IRET, which ought to be good enough as well. While
>>> 64-bit PV may use SYSRET, there are several more conditional branches
>>> there which are all unprotected.
>> Privilege changes are serialsing-ish, and this behaviour has been
>> guaranteed moving forwards, although not documented coherently.
>>
>> CPL (well - privilege, which includes SMM, root/non-root, etc) is not
>> written speculatively.  So any logic which needs to modify privilege has
>> to block until it is known to be an architectural execution path.
>>
>> This gets us "lfence-like" or "dispatch serialising" behaviour, which is
>> also the reason why INT3 is our go-to speculation halting instruction. 
>> Microcode has to be entirely certain we are going to deliver an
>> interrupt/exception/etc before it can start reading the IDT/etc.
>>
>> Either way, we've been promised that all instructions like IRET,
>> SYS{CALL,RET,ENTER,EXIT}, VM{RUN,LAUNCH,RESUME} (and ERET{U,S} in the
>> future FRED world) do, and shall continue to not execute speculatively.
>>
>> Which in practice means we don't need to worry about Spectre-v1 attack
>> against codepaths which hit an exit-from-xen path, in terms of skipping
>> protections.
>>
>> We do need to be careful about memory accesses and potential double
>> dereferences, but all the data is on the top of the stack for XPTI
>> reasons.  About the only concern is v->arch.msrs->* in the HVM path, and
>> we're fine with the current layout (AFAICT).
>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> I have to admit that I'm not really certain about the placement of the
>>> IBPB wrt the MSR_SPEC_CTRL writes. For now I've simply used "opposite of
>>> entry".
>> It really doesn't matter.  They're independent operations that both need
>> doing, and are fully serialising so can't parallelise.
>>
>> But on this note, WRMSRNS and WRMSRLIST are on the horizon.  The CPUs
>> which implement these instructions are the ones which also ought not to
>> need any adjustments in the exit paths.  So I think it is specifically
>> not worth trying to make any effort to turn *these* WRMSR's into more
>> optimised forms.
>>
>> But WRMSRLIST was designed specifically for this kind of usecase
>> (actually, more for the main context switch path) where you can prepare
>> the list of MSRs in memory, including the ability to conditionally skip
>> certain entries by adjusting the index field.
>>
>>
>> It occurs to me, having written this out, is that what we actually want
>> to do is have slightly custom not-quite-alternative blocks.  We have a
>> sequence of independent code blocks, and a small block at the end that
>> happens to contain an IRET.
>>
>> We could remove the nops at boot time if we treated it as one large
>> region, with the IRET at the end also able to have a variable position,
>> and assembles the "active" blocks tightly from the start.  Complications
>> would include adjusting the IRET extable entry, but this isn't
>> insurmountable.  Entrypoints are a bit more tricky but could be done by
>> packing from the back forward, and adjusting the entry position.
>>
>> Either way, something to ponder.  (It's also possible that it doesn't
>> make a measurable difference until we get to FRED, at which point we
>> have a set of fresh entry-points to write anyway, and a slight glimmer
>> of hope of not needing to pollute them with speculation workarounds...)
>>
>>> Since we're going to run out of SCF_* bits soon and since the new flag
>>> is meaningful only in struct cpu_info's spec_ctrl_flags, we could choose
>>> to widen that field to 16 bits right away and then use bit 8 (or higher)
>>> for the purpose here.
>> I really don't think it matters.  We've got plenty of room, and the
>> flexibility to shuffle, in both structures.  It's absolutely not worth
>> trying to introduce asymmetries to save 1 bit.
> Thanks for all the comments up to here. Just to clarify - I've not spotted
> anything there that would result in me being expected to take any action.

I'm tempted to suggest dropping the sentence about "might be more
efficient".  It's not necessary at all IMO, and it's probably not
correct if you were to compare an atom microserver vs a big Xeon.

For the lfences paragraph, I'd suggest rephrasing to something like this:

"As with all other conditional blocks on exit-to-guest paths, no
Spectre-v1 protections are necessary as execution will imminently be
hitting a serialising event."

The commentary on IRET/SYSRET and other jumps is adding confusion to
matter which is known to be safe.

>
>>> --- a/xen/arch/x86/include/asm/current.h
>>> +++ b/xen/arch/x86/include/asm/current.h
>>> @@ -55,9 +55,13 @@ struct cpu_info {
>>>  
>>>      /* See asm/spec_ctrl_asm.h for usage. */
>>>      unsigned int shadow_spec_ctrl;
>>> +    /*
>>> +     * spec_ctrl_flags can be accessed as a 32-bit entity and hence needs
>>> +     * placing suitably.
>> I'd suggest "is accessed as a 32-bit entity, and wants aligning suitably" ?
> I've tried to choose the wording carefully: The 32-bit access is in an
> alternative block, so doesn't always come into play. Hence the "may",
> not "is". Alignment alone also isn't sufficient here (and mis-aligning
> isn't merely a performance problem) - the following three bytes also
> need to be valid to access in the first place. Hence "needs" and
> "placing", not "wants" and "aligning".

"can" is actually a very ambiguous, and one valid interpretation of the
sentence is "spec_ctrl_fags is permitted to be accessed as a 32bit
quantity, but isn't actually accessed in that way".

In this case, we mean "it *is* accessed as a 32bit entity, in certain
cases".

So what about:

"spec_ctrl_flags is accessed as a 32-bit entity in some cases.  Place it
so it can be used as if it were an int."

?

>
>> If I've followed the logic correctly.  (I can't say I was specifically
>> aware that the bit test instructions didn't have byte forms, but I
>> suspect such instruction forms would be very very niche.)
> Yes, there not being byte forms of BT* is the sole reason here.
>
>>> --- a/xen/arch/x86/include/asm/spec_ctrl.h
>>> +++ b/xen/arch/x86/include/asm/spec_ctrl.h
>>> @@ -36,6 +36,8 @@
>>>  #define SCF_verw       (1 << 3)
>>>  #define SCF_ist_ibpb   (1 << 4)
>>>  #define SCF_entry_ibpb (1 << 5)
>>> +#define SCF_exit_ibpb_bit 6
>>> +#define SCF_exit_ibpb  (1 << SCF_exit_ibpb_bit)
>> One option to avoid the second define is to use ILOG2() with btrl.
> Specifically not. The assembler doesn't know the conditional operator,
> and the pre-processor won't collapse the expression resulting from
> expanding ilog2().

Oh that's dull.

I suspect we could construct equivalent logic with an .if/.else chain,
but I have no idea if the order of evaluation would be conducive to
doing so as part of evaluating an immediate operand.  We would
specifically not want something that ended looking like `ilog2 const
"btrl $" ",%eax"`, even though I could see how to make that work.

It would be nice if we could make something suitable here, but if not we
can live with the second _bit constant.

>
>>> @@ -272,6 +293,14 @@
>>>  #define SPEC_CTRL_EXIT_TO_PV                                            \
>>>      ALTERNATIVE "",                                                     \
>>>          DO_SPEC_CTRL_EXIT_TO_GUEST, X86_FEATURE_SC_MSR_PV;              \
>>> +    ALTERNATIVE __stringify(jmp PASTE(.Lscexitpv_done, __LINE__)),      \
>>> +        __stringify(DO_SPEC_CTRL_EXIT_IBPB                              \
>>> +                    disp=(PASTE(.Lscexitpv_done, __LINE__) -            \
>>> +                          PASTE(.Lscexitpv_rsb, __LINE__))),            \
>>> +        X86_FEATURE_IBPB_EXIT_PV;                                       \
>>> +PASTE(.Lscexitpv_rsb, __LINE__):                                        \
>>> +    ALTERNATIVE "", DO_OVERWRITE_RSB, X86_BUG_IBPB_NO_RET;              \
>>> +PASTE(.Lscexitpv_done, __LINE__):                                       \
>>>      DO_SPEC_CTRL_COND_VERW
>> What's wrong with the normal %= trick?
> We're in a C macro here which is then used in assembly code. %= only
> works in asm(), though. If we were in an assembler macro, I'd have
> used \@. Yet wrapping the whole thing in an assembler macro would, for
> my taste, hide too much information from the use sites (in particular
> the X86_{FEATURE,BUG}_* which are imo relevant to be visible there).
>
>>   The use of __LINE__ makes this
>> hard to subsequently livepatch, so I'd prefer to avoid it if possible.
> Yes, I was certainly aware this would be a concern. I couldn't think of
> a (forward looking) clean solution, though: Right now we have only one
> use per source file (the native and compat PV entry.S), so we could use
> a context-independent label name. But as you say above, for FRED we're
> likely to get new entry points, and they're likely better placed in the
> same files.

I was going to suggest using __COUNTER__ but I've just realised why that
wont work.

But on further consideration, this might be ok for livepatching, so long
as __LINE__ is only ever used with a local label name.  By the time it
has been compiled to a binary, the label name wont survive; only the
resulting displacement will.

I think we probably want to merge this with TEMP_NAME() (perhaps as
UNIQ_NAME(), as it will have to move elsewhere to become common with
this) to avoid proliferating our livepatching reasoning.

~Andrew

