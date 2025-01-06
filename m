Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0FEA02D52
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2025 17:06:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865808.1277088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUpcK-0003NJ-KT; Mon, 06 Jan 2025 16:06:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865808.1277088; Mon, 06 Jan 2025 16:06:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUpcK-0003LD-Gc; Mon, 06 Jan 2025 16:06:12 +0000
Received: by outflank-mailman (input) for mailman id 865808;
 Mon, 06 Jan 2025 16:06:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bFJS=T6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tUpcI-0003L7-Ei
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2025 16:06:10 +0000
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [2a00:1450:4864:20::342])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2384500f-cc48-11ef-99a4-01e77a169b0f;
 Mon, 06 Jan 2025 17:06:07 +0100 (CET)
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-4361e89b6daso100139375e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jan 2025 08:06:07 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436611ea3d5sm577248235e9.5.2025.01.06.08.06.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2025 08:06:06 -0800 (PST)
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
X-Inumbo-ID: 2384500f-cc48-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736179567; x=1736784367; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sqtUllqRRSjtiO3bV61StOV77JG434AGCX4IEmWprCk=;
        b=qzThdz303nQvbUVJ8LMWNj6S46AggtzmT5Uxe6ftJtDzkIUpsajd59bbjLMHBFkF07
         lWlaKJvRQSYbA+CL88ffCI+fI7P72aTB8EXsYCISkhn+49KPOeVkzqpcHc0so0nDIBcW
         XvbZSpI5jgcTzxfGj97krLeJjUFhHFd1ZqIQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736179567; x=1736784367;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqtUllqRRSjtiO3bV61StOV77JG434AGCX4IEmWprCk=;
        b=rv9SBSv2IEfYPv4G2uZ8gndm60QRQeHWqZ3Qc/hfADpqaCMLMB2Z5uzsu46/MrW1hd
         RWMmGMeY0dr3wL8bGsZ03oE5pxe4YVKLC9z6JM6PICsw+hA5rg3yf5O1Q2NQf+nFPZ4P
         fm7O/dzAMUAl5BrMqZTRlIASm+LYNuUZp7yBTHnuVCpSVtgnvF0OYA5tE1BcPJQk3hFL
         ApBb6sMkZftBrvXEkGRicVO4kKUzjnmWQfuwV9hVtLHiyWtBqKO1CG4ekq7ZikVMKNin
         xqwoBKSDkcyo2uFVH8wwvxY+TZNFRlIEo+AIB53KJ9C7PD4gYSPveRENQJxkzb1hEKW8
         ihwA==
X-Forwarded-Encrypted: i=1; AJvYcCXY7fcOUI0Bqk+v8xJaW0OBqkFW3nCbGPbfcim+DPeSM5C+Af68+aY1QHPqfnsMQECKZuhyzn7TTMQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyvzMxN3BA8ESR+uacH5aYKC6rHxMAMMslkEkR6MD31Pnfb2tFR
	o0r6kGJP5mBLmU0zYHKR2dwhm3dvm8U/4AG6HqSWi4Nkp5H12IVaHVsFGgyz94A=
X-Gm-Gg: ASbGncttpfBO9HS4u3bSwjg+bS/kdEKOUwiMl38gxcjx6jTDgENpeNz+S/VLrLPbSJg
	W4ejYlnrtVGPrn93RsBwzYNfZlvwnXGDhMJG6JayvKivFYmh1W4MVeQqIK22XFEdoabYu1oLhba
	vgXWcnpuScaEFxCo65hpfPBRBjPZLpqNNUoR9AUp6+15t4bYhs+uUqXrLQ7X1y7fefHhUqxq9IG
	ZW7Ie/cjnQGUys6A7kJ/UkfwThXTsKZkVakm0cpCWpbeATmYM0S3YPez1h3VXxWKDW0EFsCYuOr
	W0mEne5lfvP3YV3KeUd/
X-Google-Smtp-Source: AGHT+IGfr/CLnuBkL/5R0DWvKX8MLzs+iMSzfkJWSkM5xskM+SrfO2rkBWV7QdQdah2YI7JScVO5aw==
X-Received: by 2002:a05:600c:1c87:b0:434:a10f:c3 with SMTP id 5b1f17b1804b1-4366864320emr522028595e9.9.1736179566966;
        Mon, 06 Jan 2025 08:06:06 -0800 (PST)
Message-ID: <0a780f2d-1e49-47bd-8c66-babbc2dd8f63@citrix.com>
Date: Mon, 6 Jan 2025 16:06:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] docs: FRED support in Xen
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250103204704.84067-1-andrew.cooper3@citrix.com>
 <3ff59df0-69f8-426a-ab44-d2cd9b5bf8ea@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <3ff59df0-69f8-426a-ab44-d2cd9b5bf8ea@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/01/2025 2:28 pm, Jan Beulich wrote:
> On 03.01.2025 21:47, Andrew Cooper wrote:
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>
>> An initial RFC discussion and plan.  Open TODOs are at the end.
>>
>> This can be viewed online at:
>>   https://andrewcoop-xen.readthedocs.io/en/docs-devel/hypervisor-guide/x86/fred.html
>>
>> I've got an 8-patch series doing the cpu_user_regs disentangling vs the public
>> API.  That's in pretty good shape now.
>>
>> FRED itself is orders and orders of magnitude more simple than IDT, both in
>> terms of setup and operation, but I'm in the middle of a very large
>> cleanup (35 patches and count) to setup.c and trap.c in order to make FRED
>> able to be cleanly integrated into Xen, and that's still before any of the GS
>> changes to keep PV guests functioning correctly.
>> ---
>>  docs/glossary.rst                   |   7 +
>>  docs/hypervisor-guide/x86/fred.rst  | 215 ++++++++++++++++++++++++++++
>>  docs/hypervisor-guide/x86/index.rst |   1 +
>>  3 files changed, 223 insertions(+)
>>  create mode 100644 docs/hypervisor-guide/x86/fred.rst
>>
>> diff --git a/docs/glossary.rst b/docs/glossary.rst
>> index 6adeec77e14c..18502c0474f7 100644
>> --- a/docs/glossary.rst
>> +++ b/docs/glossary.rst
>> @@ -43,6 +43,13 @@ Glossary
>>       Sapphire Rapids (Server, 2023) CPUs.  AMD support only CET-SS, starting
>>       with Zen3 (Both client and server, 2020) CPUs.
>>  
>> +   FRED
>> +     Flexible Return and Event Delivery is a facility in x86 CPUs which
>> +     overhauls how system calls, interrupt and exception handling works.
>> +
>> +     Intel support for FRED is slated for Panther Lake (Client) and Diamond
>> +     Rapids (Server).
>> +
>>     guest
>>       The term 'guest' has two different meanings, depending on context, and
>>       should not be confused with :term:`domain`.
>> diff --git a/docs/hypervisor-guide/x86/fred.rst b/docs/hypervisor-guide/x86/fred.rst
>> new file mode 100644
>> index 000000000000..68146b79bdfc
>> --- /dev/null
>> +++ b/docs/hypervisor-guide/x86/fred.rst
>> @@ -0,0 +1,215 @@
>> +.. SPDX-License-Identifier: CC-BY-4.0
>> +
>> +FRED: Flexible Return and Event Delivery
>> +========================================
>> +
>> +Overview
>> +--------
>> +
>> +FRED was originally intended to improve performance (reading and parsing the
>> +IDT, GDT/LDT and possibly the TSS is a bottleneck) and to provide an
>> +extensible mechanism to overcome other limitations in the future (e.g. support
>> +for more than 256 interrupt vectors).  During development, FRED was adjusted
>> +substantially to also fix lots of technical debt that had accumulated in the
>> +x86 architecture for the past 40 years, most of which is a fertile source of
>> +crashes and privilege escalation bugs.
>> +
>> +FRED is primarily concerned with establishing a new context when an event is
>> +recognised, and restoring the old context when the event is handled.  This
>> +includes events previously delivered through the IDT (exceptions and
>> +interrupts), as well as ``SYSCALL`` and ``SYSENTER`` instructions which
>> +avoided the IDT in the past for performance reasons.
>> +
>> +FRED strives to achieve that event delivery always establishes a good CPL0
>> +stack (and shadow stack if CET is active), that doesn't clobber still-active
>> +state from an outer nested context, and with the CPL0 GSBASE.
>> +
>> +Technical details
>> +-----------------
>> +
>> +When FRED is active, Rings 1 and 2 cannot be entered at all, Ring0
>> +compatibility mode cant be entered (i.e. Ring0 is strictly 64bit), and
>> +``IRET`` can no longer change privilege.  Call Gates no longer exist.
>> +
>> +A single entrypoint is registered in ``MSR_FRED_CONFIG``.  Entries from Ring3
>> +start at this address, while entries from Ring0 start at +256.  All
>> +interrupts, exceptions and syscalls route these.  VMExits do not, and retain
>> +their prior behaviour.
>> +
>> +There are 4 Stack Levels, SL 0 thru 3 and a notion of Current Stack Level,
>> +replacing the prior IST mechanism.  All stack pointers, and shadow stack
>> +pointers when CET-SS is active, are registered in ``MSR_{R,S}SP_SL{0..3}``.
>> +Supervisor Shadow Stack tokens no longer exist, and are replaced with an
>> +alternative mechanism.
>> +
>> +The IDT is no longer used.  The TSS is no longer used used to hold stack
>> +pointers, nor ``MSR_ISST`` if CET Shadow Stacks are active.  ``MSR_{L,C}STAR``
>> +as well as all SYSENTER MSRs are no longer used.  Under FRED, ``MSR_STAR`` and
>> +``MSR_FMASK`` are used with their previous behaviour extended to all event
>> +deliveries, not just syscalls.
>> +
>> +The instructions ``SWAPGS``, ``CLRSSBSY``, ``SETSSBSY``, ``SYSEXIT`` and
>> +``SYSRET`` unconditionally ``#UD``.  Establishing an initial SSP should use
>> +``RSTORSSP``.  GS maintenance can use the new ``LKGS`` instruction.
>> +
>> +Implementation considerations
>> +-----------------------------
>> +
>> +PV32 guests
>> +"""""""""""
>> +
>> +FRED formally removes the ability to use Rings 1 and 2, which prohibits the
>> +use of PV32 guests.  PV32 guests are already disabled by default in the
>> +presence of CET owing to the difficulty of using Ring 1 with CET active.
>> +Compatibility for PV32 guests is provided by PVShim, which takes care not to
>> +use CET in order to be able to run PV32 guests.  FRED can use the same
>> +approach.
>> +
>> +Initialisation
>> +""""""""""""""
>> +
>> +Exception handling is initialised right at the beginning of ``__start_xen()``
>> +prior to parsing the command line.  Having exception cover this early is
>> +important and wants to remain.
>> +
>> +The determination of whether to use FRED or not needs to account for the
>> +``fred`` and ``pvshim`` command line options, the ``FRED`` and ``LKGS`` CPUID
>> +bits.
>> +
>> +Therefore for simplicity, early exception handling will still use IDT
>> +delivery, and later setup can switch to FRED instead.
>> +
>> +cpu_user_regs vs vm86 segments
>> +""""""""""""""""""""""""""""""
>> +
>> +``struct cpu_user_regs`` exists in the public interface, and is embedded
>> +inside ``struct vcpu_guest_context``.  From an ABI perspective, the layout
>> +needs to remain.  ``struct cpu_user_regs`` is also a common name in Xen,
>> +covering the event information (pushed by hardware and software) and the GPRs
>> +(pushed by software).  From an API perspective, the name needs to remain.
>> +
>> +The data selectors (ds, es, fs, gs) are a vestigial remnant of vm86 mode.
>> +Hardware did push them on exit from vm86 mode, and ``IRET`` would consume them
>> +on the way back in.
>> +
>> +However, vm86 mode isn't usable in Long mode, and these selectors oughtn't to
>> +have survived into the PV64 ABI.  Under FRED, hardware pushes different
>> +information here, which needs accounting for in Xen's view of ``struct
>> +cpu_user_regs``.
>> +
>> +Therefore, the only option is to have the public API provide a struct by a
>> +different name, and provide a compatibility define for the ``!__XEN__`` case,
>> +freeing us up to have a similar but not identical ``struct cpu_user_regs``
>> +which Xen operates on.
>> +
>> +There are several uses of the vm86 fields in Xen:
>> +
>> + #. ``struct vcpu`` embeds a ``struct cpu_user_regs`` to hold GPRs/etc when
>> +    the vCPU is scheduled out.  The vm86 fields are used by the PV logic only
>> +    (``{save,load}_segments()``) and can be moved into separate fields in
>> +    ``struct pv_vcpu``.  PV's ``dom0_construct()`` sets these fields directly,
>> +    and needs a matching adjustment.
>> +
>> + #. As part of ``arch_{get,set}_info_guest()`` during hypercalls.  The
>> +    guest side needs to remain as-is, but the Xen side can rearranged to use
>> +    the new fields from above.
>> +
>> + #. As part of vCPU diagnostics (``show_registers()`` etc).  The ``#DF`` path
>> +    uses the fields as scratch storage for the current register values, while
>> +    the other diagnostics are simply accessing the state of a scheduled-out
>> +    vCPU.
> Unlike for the former 2 points and for the one immediately below, but like for
> the final one below you don't mention what you intend to do. Here I assume it'll
> be reasonably straightforward to use scratch space elsewhere.

https://xenbits.xen.org/gitweb/?p=people/andrewcoop/xen.git;a=shortlog;h=refs/heads/xen-fred
is my working branch if you want to peek at things.

The diagnostics are handled by:

1) "x86/traps: Rework register state printing to use an extra_state struct"
2) "x86/traps: Avoid OoB accesses to print the data selectors"
3) "Revert "x86/traps: 'Fix' safety of read_registers() in #DF path""


Something else you might want to proactively look at.  "x86/idt:
Generate bsp_idt[] at build time".  I figured out how to construct the
IDT at build time, without using an external tool to format the table,
and only some slightly disgusting linker script hackery.

>
>> + #. In HVM's ``hvm_sanitize_regs_fields()``, to poison the fields and make
>> +    them more obvious if used anywhere in HVM context.  This can simply be
>> +    deleted.
>> +
>> + #. In x86_emulate.c's ``put_fpu()``.  As far as I can tell, this is
>> +    completely buggy; the values will be poisoned for HVM guests, and stale
>> +    from the prior context switch for PV guests.
> For HVM guests the ->read_segment() hook will be populated, so the path isn't
> taken (leaving aside the odd case of the hook failing). For PV guests I don't
> see any staleness concern: When the vCPU was switched in, the fields were set
> (restored), weren't they?

There is up to 30ms of guest runtime between the last schedule in and
this emulation, and segment loads don't generally trap for PV guests.

> For the purpose of FRED this doesn't matter much - wherever the values are to
> be held, they'll be taken from by put_fpu().

I maybe wasn't clear.  To support FRED, I need to delete the vm86 fields.

@@ -54,10 +54,6 @@ struct cpu_user_regs
     DECL_REG_LO16(flags); /* rflags.IF == !saved_upcall_mask */
     DECL_REG_LO8(sp);
     uint16_t ss, _pad2[3];
-    uint16_t es, _pad3[3];
-    uint16_t ds, _pad4[3];
-    uint16_t fs, _pad5[3];
-    uint16_t gs, _pad6[3];
+    uint64_t edata, _rsvd;
 };
 
 #undef DECL_REG_HI

es and it's pad overlay FRED's event_data field (CR2, DR6, XFD_ERR).

While I could in principle union es and ds to make this work, there's
also a 64byte alignment requirement for the FRED frame on the stack, so
I do need to make fs/gs disappear some how.

However, these vm86 fields are also the reason why we've had out of
bounds accesses, and I'm looking to make such bugs impossible.

I'm not actually inserting edata quite like that, to avoid swapping one
OoB problem for another.

>
>> +Stack layout
>> +""""""""""""
>> +
>> +Xen's CPU stacks are 8-page (8-page aligned), arranged as::
>> +
>> +  7 - Primary stack (with a struct cpu_info at the top)
>> +  6 - Primary stack
>> +  5 - Primary Shadow Stack (read-only)
>> +  4 - #DF IST stack
>> +  3 - #DB IST stack
>> +  2 - NMI IST stack
>> +  1 - #MC IST stack
>> +  0 - IST Shadow Stacks (4x 1k, read-only)
>> +
>> +which needs mapping into FREDs Stack Levels.
>> +
>> +FRED Stack Levels replace IST.  Most events from Ring3 enter Ring0 at SL0,
>> +including interrupts, and even exceptions with a non-zero Stack Level
>> +configured.  Nested exceptions originate from Ring0 even if they were trying
>> +to push a Ring3 event frame onto the stack, so do follow the Ring0 CSL rules.
>> +
>> +Within Ring0, a stack switch occurs on event delivery if the event has a
>> +higher configured Stack Level (exceptions in ``MSR_FRED_STK_LVLS``, interrupts
>> +in ``MSR_FRED_CONFIG``).  Otherwise, the new event is delivered on the current
>> +stack.
>> +
>> +Under FRED, most sources of ``#DF`` are gone; failure to push a new event
>> +frame onto a stack is the main remaining one, so ``#DF`` needs to be the
>> +highest stack level (SL3) to catch errors at all other stack levels.
>> +
>> +Also, FRED removes the "syscall gap", removing the primary need for ``NMI``,
>> +``#DB`` and ``#MC`` to need separate stacks.
>> +
>> +Therefore, Xen has no need for SL1 or SL2.  Under IDT delivery, we poison the
>> +unused stack pointers with a non-canonical address, but we cannot do that
>> +under FRED; they're held in MSRs and checked at WRMSR time.  Instead, we can
>> +point the SL pairs (RSP + SSP) at each others (regular and shadow stack) guard
>> +pages such that any use of an unused SL will escalate to ``#DF``.
> I may have a language issue here: "each others" reads wrong to me; do you perhaps
> mean "each ones"?

It's poor grammar, but not wrong per say.  I'll try to find a different
way to phrase it.

>
> Further, mainly to double check my own understanding: Almost half of the stack
> area then isn't used anymore when FRED is active: 2 pages for the primary stack,
> 1 page for the primary shadow stack, 1 page for the SL3 stack, and (somewhat
> wastefully) 1 more for the SL3 shadow stack.

This matches my understanding (on the proviso that I've still not wired
up the stack handling yet.  Still cleaning up the initialisation paths.)

>  There'll be 3 unused pages, and
> hence space again to have true guard pages, e.g.
>
>   7 - Primary stack (with a struct cpu_info at the top)
>   6 - Primary stack
>   5 - Guard page
>   4 - Primary Shadow Stack (read-only)
>   3 - Guard page
>   2 - #DF stack
>   1 - #DF Shadow Stack (read-only)
>   0 - Guard page

Shadow stack frames are perfectly good guard pages for regular stacks,
and vice versa.  That's why I set them up as shadow stack pages even
when CET isn't active.

And yes, we could rearrange the stack.  But, there's also a good reason
not to.  Our code has to cope with both IDT and FRED layouts, which is
much easier if they're the same.


> Having reached the bottom of the section, there's one special IST aspect that
> I'm missing, special enough imo to warrant mentioning even if only to state that
> it's (hopefully) going to be irrelevant (i.e. not require replacing by another
> similar hack): {dis,en}able_each_ist() as used by SVM (on the assumption that
> sooner or later AMD is likely to also implement FRED, and that you may already
> know of details of their respective VMCB integration).

AMD haven't said anything about FRED yet, despite a very large number of
software partners asking about it.

However, If AMD were to do FRED, I'd expect it to work just like CET
does today, seeing as there's a proper host/guest split of CR4, and
everything else is in MSRs the guest can't touch.
>> +Still TBD
>> +---------
>> +
>> +Issues/areas I'm aware of, but haven't got a firm plan yet.
>> +
>> +Call Gates
>> +""""""""""
>> +
>> +FRED removes Call Gates, yielding ``#GP[sel]`` instead.  This is how we
>> +emulate call gates for PV32, but emulation is genuinely only wired up for PV32
>> +guests, not for PV64.
>> +
>> +PV64 guests do seem to be able to write Call Gates into their LDT/GDT, but
>> +have the DPL 0'd in common with PV32.  Given the absence of emulation, I think
>> +PV64 can't actually use Call Gates, but given the existing logic this also
>> +seems to be by accident rather than design.
> A partial patch I have to start doing that emulation has a timestamp of 2007.
> Quoting my note there (which I may have posted at some point): "The main issue
> to be resolved is how to distinguish whether a referenced code segment is a
> kernel or user segment, so that the code can know whether to switch the guest
> to kernel mode. Perhaps this can be done by setting _SEGMENT_EC on all user
> segments and clearing it on all kernel ones (in check_descriptor())."
>
> In any event - since no real-world need has surfaced in all this time, I don't
> think the case needs worrying about for FRED.

Ok.  I'll see if I can find a suitable place to state that call gates
don't work for PV64 and that this is unlikely to change.

>
>> +GS handling
>> +"""""""""""
>> +
>> +Xen does not use GS as a per-cpu pointer, but FRED is tied to the common OS
>> +usage.  Therefore, when FRED is active, ``v->arch.pv.gs_base_{user,kernel}``
>> +are logically the opposite way around when running in Xen context.
> But these are our own fields. I think we'd better keep their names in line
> with what they hold. It's the use of the fields which ...
>
>> +Furthermore we cannot use ``SWAPGS`` as part of context switching, and there's
>> +no ``wrgsshadow`` instruction.  All guest GS handling within Xen needs to be
>> +altered.
> ... needs altering then, along with the other adjustments you allude to here.

Yeah, I wasn't very clear.

When in FRED mode, GS_BASE and GS_SHADOW are the opposite way around
(because hardware auto-swapgs's for us), so the way we handle everything
to do with GS needs to change.

~Andrew

