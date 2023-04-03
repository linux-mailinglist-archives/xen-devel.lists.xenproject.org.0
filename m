Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C4F6D45FC
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 15:42:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517456.802791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjKQh-0005aC-FX; Mon, 03 Apr 2023 13:41:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517456.802791; Mon, 03 Apr 2023 13:41:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjKQh-0005Xj-CD; Mon, 03 Apr 2023 13:41:03 +0000
Received: by outflank-mailman (input) for mailman id 517456;
 Mon, 03 Apr 2023 13:41:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Dtn=72=gmail.com=tamas.k.lengyel@srs-se1.protection.inumbo.net>)
 id 1pjKQf-0005Xd-PG
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 13:41:01 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b01bb91-d225-11ed-85db-49a42c6b2330;
 Mon, 03 Apr 2023 15:40:59 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id v1so29397987wrv.1
 for <xen-devel@lists.xenproject.org>; Mon, 03 Apr 2023 06:40:59 -0700 (PDT)
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
X-Inumbo-ID: 2b01bb91-d225-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680529259;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pJFLvj+kzgAAuR4I2/Wel89bouBKjG12WhBkLGSFURQ=;
        b=WHSRr8THUJaSUtEklr0o/86/+GjCz1jnc8gSlIKp88U5RvaDwKA84e/h9WXAM9LcSx
         Bf3unCTzlPfSWHfIvfYn7KrNnuBRtxse4398WVHT8YZjF0hvq91YFJdzDESZM7HWYx4f
         iVQBdNulbpw4yonCU2ok6LfYZvS/MdyBZwNpq7LaumfqCoWaFqGhUODfy6Ge+2b/uIG3
         0937Eo3rQPJnVm5jENJqn4NK81h1iT59aZod7IhZUt/FcQ4ULX8xq5P/qv2anetDp+8J
         DQjJYwdkt5l23hGbfA3CfFcRuvVoX6k69b1rxxiUjKBbfq39mpWi69ramoCNyLMaz31Q
         lh4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680529259;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pJFLvj+kzgAAuR4I2/Wel89bouBKjG12WhBkLGSFURQ=;
        b=QuRgrTObXiRVSryDh/7E35i36EuvqFQ5sw4WZ5mfbX00fj5HkSBPC2JcRmCkeAa7G+
         WD6bX6yRQMx/LX/GS281m2ASnGRhPDjPaaWkVD763Z/mhAeP/tkORhKfNq/KEZ4qsBUS
         W9dhWF9d9AuJJRt/iurB1eXijQ5ospf2U9ohb2IgvFkub8o4mwcnscFhNo8DgFSnU3jp
         7kdWK142PpewD7UrZt39eJn/iZgJ1pMLxEV2lSWRl8dx/EEODYi/HGHxYGjUf0B5MS48
         t98ZzDu7mCmKKYkGQCllSxgCk67NPBduXR3c4CYrqpUhwHfvRvj/tJXs2C+M/wT4d1IK
         A8lw==
X-Gm-Message-State: AAQBX9f7nvusqwoa+0E/HB9NIwJebMbaa4l1tTJvn+9mtKGA4h8QXKGb
	uYLaqooKCSLSyerflAvad+vC3lRPf+Qtn6wrf1bffpO3OqE=
X-Google-Smtp-Source: AKy350aDobyDVG9z/7nOQ+1yOitdFN3I0fdvQgDKY5Cs8cNF/SeNwb6g5B4WY2Q9UJxleNqCuvKRjxmjXSPmDVAk7eE=
X-Received: by 2002:adf:e98d:0:b0:2c5:7eb5:97a6 with SMTP id
 h13-20020adfe98d000000b002c57eb597a6mr7693051wrm.12.1680529258904; Mon, 03
 Apr 2023 06:40:58 -0700 (PDT)
MIME-Version: 1.0
References: <MN2PR07MB6045100322F58085DD6B1488E4BF9@MN2PR07MB6045.namprd07.prod.outlook.com>
 <c12ff321-e1ad-1377-2158-195594fdbe04@citrix.com> <MN2PR07MB6045B965DD2DA308C55905F9E4BF9@MN2PR07MB6045.namprd07.prod.outlook.com>
 <a1a814cd-9a76-9828-ffab-5590fcd5925f@citrix.com> <BYAPR07MB6040EB2AEC1567C5982FBD51E48E9@BYAPR07MB6040.namprd07.prod.outlook.com>
In-Reply-To: <BYAPR07MB6040EB2AEC1567C5982FBD51E48E9@BYAPR07MB6040.namprd07.prod.outlook.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Mon, 3 Apr 2023 09:40:22 -0400
Message-ID: <CABfawhnOvSGeAQPxdm8Yrm8iRswiZ=r4g+B6ZhLVx4bYV5y7GA@mail.gmail.com>
Subject: Re: Best way to use altp2m to support VMFUNC EPT-switching?
To: "Johnson, Ethan" <ejohns48@cs.rochester.edu>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="00000000000082fece05f86eb58f"

--00000000000082fece05f86eb58f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 29, 2023 at 10:29=E2=80=AFPM Johnson, Ethan <ejohns48@cs.roches=
ter.edu>
wrote:
>
> On 2023-03-16 02:14:18 +0000, Andrew Cooper wrote:
> > Ok, so there is a lot here.  Apologies in advance for the overly long
> > answer.
> >
> > First, while altp2m was developed in parallel with EPTP-switching, we
> > took care to split the vendor neutral parts from the vendor specific
> > bits.  So while we do have VMFUNC support, that's considered "just" a
> > hardware optimisation to speed up the HVMOP_altp2m_switch_p2m hypercall=
.
> >
> > But before you start, it is important to understand your security
> > boundaries.  You've found external mode, and this is all about
> > controlling which aspects of altp2m the guest can invoke itself, and
> > modes other than external let the guest issue HVMOP_altp2m ops itself.
> >
> > If you permit the guest to change views itself, either with VMFUNC, or
> > HVMOP_altp2m_switch_p2m, you have to realise that these are just
> > "regular" CPL0 actions, and can be invoked by any kernel code, not just
> > your driver.  i.e. the union of all primary and alternative views is on=
e
> > single security domain.
> >
> > For some usecases this is fine, but yours doesn't look like it fits in
> > this category.  In particular, no amount of protection on the trampolin=
e
> > pages stops someone writing a VMFUNC instruction elsewhere in kernel
> > space and executing it.
> >
> > (I have seen plenty of research papers try to construct a security
> > boundary around VMFUNC.  I have yet see one that does so robustly, but =
I
> > do enjoy being surprised on occasion...)
> >
> > The first production use this technology I'm aware of was Bitdefender's
> > HVMI, where the guest had no control at all, and was subject to the
> > permission restrictions imposed on it by the agent in dom0.  The agent
> > trapped everything it considered sensitive, including writes to
> > sensitive areas of memory using reduced EPT permissions, and either
> > permitted execution to continue, or took other preventative action.
> >
> > This highlights another key point.  Some entity in the system needs to
> > deal with faults that occur when the guest accidentally (or otherwise)
> > violates the reduced EPT permissions.  #VE is, again, an optimisation t=
o
> > let violations be handled in guest context, rather than taking a VMExit=
,
> > but even with #VE the complicated corner cases are left to the external
> > agent.
> >
> > With HVMI, #VE (but not VMFUNC IIRC) did get used as an optimisation to
> > mitigate the perf hit from Window's Meltdown mitigation electing to use
> > LOCK'd BTS/BTC operations on pagetables (which were write protected
> > behind the scenes), but I'm reliably informed that the hoops required t=
o
> > jump through to make that work, and in particular avoid the notice of
> > PatchGuard, were substantial.
> >
> > Perhaps a more accessible example is
> > https://github.com/intel/kernel-fuzzer-for-xen-project and the
> > underlying libvmi.  There is also a very basic example in
> > tools/misc/xen-access.c in the Xen tree.
> >
> > For your question specifically about mapping other frames, we do have
> > hypercalls to map other frames (its necessary for e.g. mapping BARs of
> > passed-through PCI devices), but for obvious reasons, it's restricted t=
o
> > control software (Qemu) in dom0.  I suspect we don't actually have a
> > hypercall to map MMIO into an alternative view, but it shouldn't be har=
d
> > to add (if you still decide you want it by the end of this email).
> >
> >
> > But on to the specifics of mapping the xAPIC page.  Sorry, but
> > irrespective of altp2m, that is a non-starter, for reasons that date
> > back to ~1997 or thereabouts.
> >
> > It's worth saying that AMD can fully virtualise IPI delivery from one
> > vCPU to another without either taking a VMExit in the common case, sinc=
e
> > Zen1 (IIRC).  Intel has a similar capability since Sapphire Rapids
> > (IIRC).  Xen doesn't support either yet, because there are only so many
> > hours in the day...
> >
> > It is technically possible to map the xAPIC window into a guest, and
> > such a guest could interact the real interrupt controller.  But now
> > you've got the problem that two bits of software (Xen, and your magic
> > piece of guest kernel) are trying to driver the same single interrupt
> > controller.
> >
> > Even if you were to say that the guest would only use ICR to send
> > interrupts, that still doesn't work.  In xAPIC, ICR is formed of two
> > half registers, as it dates from the days of 32bit processors, with a
> > large stride between the two half registers.
> >
> > Therefore, it is a minimum of two separate instructions (set destinatio=
n
> > in ICR_HI, set type/mode/etc in ICR_LO) to send an interrupt.
> >
> > A common bug in kernels is to try and send IPIs when interrupts are
> > enabled, or in NMI context, both of which could interrupt an IPI
> > sequence.  This results in a sequence of writes (from the LAPIC's point
> > of view) of ICR_HI, ICR_HI, ICR_LO, ICR_LO, which causes the outer IPI
> > to be sent with the wrong destination.
> >
> > Guests always execute with IRQs enabled, but can take a VMExit on any
> > arbitrary instruction boundary for other reasons, so the guest kernel
> > can never be sure that ICR_HI hasn't been modified by Xen in the
> > background, even if it used two adjacent instructions to send the IPI.
> >
> > Now, if you were to swap xAPIC for x2APIC, one of the bigger changes wa=
s
> > making ICR a single register, so it could be written atomically.  But
> > now you have an MSR based interface, not an MMIO based interface.
> >
> > It's also worth noting that any system with >254 CPUs is necessarily
> > operating in x2APIC mode (so there isn't an xAPIC window to map, even i=
f
> > you wanted to try), and because of the =C3=86PIC Leak vulnerability, Ic=
eLake
> > and later CPUs are locked into x2APIC mode by firmware, with no option
> > to revert back into xAPIC mode even on smaller systems.
> >
> > On top of that, you've still got the problem of determining the
> > destination.  Even if the guest could send an IPI, it still has to know
> > the physical APIC ID of the CPU the target vCPU is currently scheduled
> > on.  And you'd have to ignore things like the logical mode or
> > destination shorthands, because multi/broadcast IPIs will hit incorrect
> > targets.
> >
> > On top of that, even if you can determine the right destination, how
> > does the target receive the interrupt?  There can only be one entity in
> > the system receiving INTR, and that's Xen.  So you've got to pick some
> > vector that Xen knows what to do with, but isn't otherwise using.
> >
> > Not to mention there's a(nother) giant security hole... A guest able to
> > issue interrupts could just send INIT-SIPI-SIPI and reset the target CP=
U
> > back into real mode behind Xen's back.  Xen will not take kindly to
this.
> >
> >
> > So while I expect there's plenty of room to innovate on the realm switc=
h
> > aspect of EPTP-switching, trying to send IPIs from within guest context
> > is something that I will firmly suggest you avoid.  There are good
> > reasons why it is so complicated to get VMExit-less guest IPIs working.
> >
> > ~Andrew
>
> Thank you for the detailed answers and context. I am somewhat encouraged
to
> note that most of the roadblocks you mentioned are issues we've
specifically
> considered (and think we have solutions for) in our design. :-) We're
using
> some rather exotic compiler-based instrumentation on the guest kernel
(plus
> some tricks with putting the "secure realm"'s page tables in a
nonoverlapping
> guest-physical address range that isn't present in the primary p2m used b=
y
> untrusted code) to prevent the guest from doing things it isn't supposed
to
> with VMFUNC and (x2)APIC access, despite running in ring 0 within non-roo=
t
> mode.
>
> On a more concrete level, I am looking to do the following from within th=
e
> hypervisor (specifically, from within a new hypercall I've added):
>
> 1) Get some (host-)physical memory frames from the domain heap and "pin"
them
> to make sure they won't be swapped out.
>
> 2) Create an altp2m for the calling (current) domain.
>
> 3) Map some of the newly-allocated physical frames into both the domain's
> primary p2m and its altp2m, with R/X permissions.
>
> 4) Map the rest of the physical frames into only the altp2m (as R/W), at =
a
> guest-physical address higher than the end of the main p2m's mapped range
> (such that when the primary p2m is active, the guest cannot access these
> pages without taking a hard VM-exit fault).
>
> I've been poring through Xen's p2m code (e.g. xen/arch/x86/mm/p2m.c) to
try
> to understand how to achieve these goals, but with little success.
Comments
> in the p2m code seem to be rather sparse, and mostly unhelpful for
> understanding (without pre-understood context) what many of the functions
do
> and what is the intended workflow for using them. For instance,
> similarly-named functions like guest_remove_page() and
> guest_physmap_remove_page() seem to operate at different levels of
> abstraction (in terms of memory management, refcount bookkeeping, etc.)
but
> it isn't externally obvious how they're meant to all fit together and be
used
> by client code.
>
> Any suggestions on which p2m (or other) APIs I should be focusing on, and
how
> they're meant to be used, would be greatly appreciated. I suppose in
theory I
> could just bypass p2m entirely, and populate one of the VMCS's
EPTP-switching
> array's slots directly with my own manually constructed paging hierarchy
> (since I'm envisioning the memory layout of our "secure realm" as being
quite
> simple - it only needs a handful of pages). But I'd rather "color within
the
> lines" of the existing APIs if possible, especially since some of the
pages
> will need to be mapped into the existing primary p2m (for the "insecure
> realm") as well.

You can find an example work-flow here to create altp2m's and change memory
permissions in the different views:
https://github.com/xen-project/xen/blob/master/tools/misc/xen-access.c#L517=
.
To add a new page to the VM you can use xc_domain_populate_physmap_exact.
If you add the page after the VM has already booted the main kernel is
unaware of these extra pages that were added but that doesn't mean it can't
try to poke them. Similarly, using any type of memory map to avoid the
kernel accessing these pages is just wishful thinking, the memory map is
after all just a hint to the OS what to look for, not an access-control
mechanism.

Also keep in mind that altp2m's get CoW populated from the hostp2m. You can
still get your altp2m to be "only a couple pages" by either 1) ensuring no
other pages ever get touched while running the vCPU with the altp2m as to
not trigger the CoW mechanism; or 2) manually map change the memaccess
permissions to n on every page you want to be in-accessible in the altp2m.

You'll likely want to have pages like where the IDT and GDT is mapped into
the altp2m, alongside the pagetable pages. An easy way to check what pages
are needed for execution in a given code context is use the VM forking
mechanism, create a fork at the point your code is that you want to run in
the altp2m, singlestep the fork a single instruction, then examine the
fork's EPT using xl debug-keys D. Anything you see that got mapped into the
fork's memory would be similarly needed to be accessible in the altp2m.

Cheers,
Tamas

--00000000000082fece05f86eb58f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Wed, Mar 29, 2023 at 10:29=E2=80=AFPM Johnson, =
Ethan &lt;<a href=3D"mailto:ejohns48@cs.rochester.edu">ejohns48@cs.rocheste=
r.edu</a>&gt; wrote:<br>&gt;<br>&gt; On 2023-03-16 02:14:18 +0000, Andrew C=
ooper wrote:<br>&gt; &gt; Ok, so there is a lot here.=C2=A0 Apologies in ad=
vance for the overly long<br>&gt; &gt; answer.<br>&gt; &gt;<br>&gt; &gt; Fi=
rst, while altp2m was developed in parallel with EPTP-switching, we<br>&gt;=
 &gt; took care to split the vendor neutral parts from the vendor specific<=
br>&gt; &gt; bits.=C2=A0 So while we do have VMFUNC support, that&#39;s con=
sidered &quot;just&quot; a<br>&gt; &gt; hardware optimisation to speed up t=
he HVMOP_altp2m_switch_p2m hypercall.<br>&gt; &gt;<br>&gt; &gt; But before =
you start, it is important to understand your security<br>&gt; &gt; boundar=
ies.=C2=A0 You&#39;ve found external mode, and this is all about<br>&gt; &g=
t; controlling which aspects of altp2m the guest can invoke itself, and<br>=
&gt; &gt; modes other than external let the guest issue HVMOP_altp2m ops it=
self.<br>&gt; &gt;<br>&gt; &gt; If you permit the guest to change views its=
elf, either with VMFUNC, or<br>&gt; &gt; HVMOP_altp2m_switch_p2m, you have =
to realise that these are just<br>&gt; &gt; &quot;regular&quot; CPL0 action=
s, and can be invoked by any kernel code, not just<br>&gt; &gt; your driver=
. =C2=A0i.e. the union of all primary and alternative views is one<br>&gt; =
&gt; single security domain.<br>&gt; &gt;<br>&gt; &gt; For some usecases th=
is is fine, but yours doesn&#39;t look like it fits in<br>&gt; &gt; this ca=
tegory.=C2=A0 In particular, no amount of protection on the trampoline<br>&=
gt; &gt; pages stops someone writing a VMFUNC instruction elsewhere in kern=
el<br>&gt; &gt; space and executing it.<br>&gt; &gt;<br>&gt; &gt; (I have s=
een plenty of research papers try to construct a security<br>&gt; &gt; boun=
dary around VMFUNC.=C2=A0 I have yet see one that does so robustly, but I<b=
r>&gt; &gt; do enjoy being surprised on occasion...)<br>&gt; &gt;<br>&gt; &=
gt; The first production use this technology I&#39;m aware of was Bitdefend=
er&#39;s<br>&gt; &gt; HVMI, where the guest had no control at all, and was =
subject to the<br>&gt; &gt; permission restrictions imposed on it by the ag=
ent in dom0.=C2=A0 The agent<br>&gt; &gt; trapped everything it considered =
sensitive, including writes to<br>&gt; &gt; sensitive areas of memory using=
 reduced EPT permissions, and either<br>&gt; &gt; permitted execution to co=
ntinue, or took other preventative action.<br>&gt; &gt;<br>&gt; &gt; This h=
ighlights another key point.=C2=A0 Some entity in the system needs to<br>&g=
t; &gt; deal with faults that occur when the guest accidentally (or otherwi=
se)<br>&gt; &gt; violates the reduced EPT permissions. =C2=A0#VE is, again,=
 an optimisation to<br>&gt; &gt; let violations be handled in guest context=
, rather than taking a VMExit,<br>&gt; &gt; but even with #VE the complicat=
ed corner cases are left to the external<br>&gt; &gt; agent.<br>&gt; &gt;<b=
r>&gt; &gt; With HVMI, #VE (but not VMFUNC IIRC) did get used as an optimis=
ation to<br>&gt; &gt; mitigate the perf hit from Window&#39;s Meltdown miti=
gation electing to use<br>&gt; &gt; LOCK&#39;d BTS/BTC operations on pageta=
bles (which were write protected<br>&gt; &gt; behind the scenes), but I&#39=
;m reliably informed that the hoops required to<br>&gt; &gt; jump through t=
o make that work, and in particular avoid the notice of<br>&gt; &gt; PatchG=
uard, were substantial.<br>&gt; &gt;<br>&gt; &gt; Perhaps a more accessible=
 example is<br>&gt; &gt; <a href=3D"https://github.com/intel/kernel-fuzzer-=
for-xen-project">https://github.com/intel/kernel-fuzzer-for-xen-project</a>=
 and the<br>&gt; &gt; underlying libvmi.=C2=A0 There is also a very basic e=
xample in<br>&gt; &gt; tools/misc/xen-access.c in the Xen tree.<br>&gt; &gt=
;<br>&gt; &gt; For your question specifically about mapping other frames, w=
e do have<br>&gt; &gt; hypercalls to map other frames (its necessary for e.=
g. mapping BARs of<br>&gt; &gt; passed-through PCI devices), but for obviou=
s reasons, it&#39;s restricted to<br>&gt; &gt; control software (Qemu) in d=
om0.=C2=A0 I suspect we don&#39;t actually have a<br>&gt; &gt; hypercall to=
 map MMIO into an alternative view, but it shouldn&#39;t be hard<br>&gt; &g=
t; to add (if you still decide you want it by the end of this email).<br>&g=
t; &gt;<br>&gt; &gt;<br>&gt; &gt; But on to the specifics of mapping the xA=
PIC page.=C2=A0 Sorry, but<br>&gt; &gt; irrespective of altp2m, that is a n=
on-starter, for reasons that date<br>&gt; &gt; back to ~1997 or thereabouts=
.<br>&gt; &gt;<br>&gt; &gt; It&#39;s worth saying that AMD can fully virtua=
lise IPI delivery from one<br>&gt; &gt; vCPU to another without either taki=
ng a VMExit in the common case, since<br>&gt; &gt; Zen1 (IIRC).=C2=A0 Intel=
 has a similar capability since Sapphire Rapids<br>&gt; &gt; (IIRC).=C2=A0 =
Xen doesn&#39;t support either yet, because there are only so many<br>&gt; =
&gt; hours in the day...<br>&gt; &gt;<br>&gt; &gt; It is technically possib=
le to map the xAPIC window into a guest, and<br>&gt; &gt; such a guest coul=
d interact the real interrupt controller.=C2=A0 But now<br>&gt; &gt; you&#3=
9;ve got the problem that two bits of software (Xen, and your magic<br>&gt;=
 &gt; piece of guest kernel) are trying to driver the same single interrupt=
<br>&gt; &gt; controller.<br>&gt; &gt;<br>&gt; &gt; Even if you were to say=
 that the guest would only use ICR to send<br>&gt; &gt; interrupts, that st=
ill doesn&#39;t work.=C2=A0 In xAPIC, ICR is formed of two<br>&gt; &gt; hal=
f registers, as it dates from the days of 32bit processors, with a<br>&gt; =
&gt; large stride between the two half registers.<br>&gt; &gt;<br>&gt; &gt;=
 Therefore, it is a minimum of two separate instructions (set destination<b=
r>&gt; &gt; in ICR_HI, set type/mode/etc in ICR_LO) to send an interrupt.<b=
r>&gt; &gt;<br>&gt; &gt; A common bug in kernels is to try and send IPIs wh=
en interrupts are<br>&gt; &gt; enabled, or in NMI context, both of which co=
uld interrupt an IPI<br>&gt; &gt; sequence.=C2=A0 This results in a sequenc=
e of writes (from the LAPIC&#39;s point<br>&gt; &gt; of view) of ICR_HI, IC=
R_HI, ICR_LO, ICR_LO, which causes the outer IPI<br>&gt; &gt; to be sent wi=
th the wrong destination.<br>&gt; &gt;<br>&gt; &gt; Guests always execute w=
ith IRQs enabled, but can take a VMExit on any<br>&gt; &gt; arbitrary instr=
uction boundary for other reasons, so the guest kernel<br>&gt; &gt; can nev=
er be sure that ICR_HI hasn&#39;t been modified by Xen in the<br>&gt; &gt; =
background, even if it used two adjacent instructions to send the IPI.<br>&=
gt; &gt;<br>&gt; &gt; Now, if you were to swap xAPIC for x2APIC, one of the=
 bigger changes was<br>&gt; &gt; making ICR a single register, so it could =
be written atomically.=C2=A0 But<br>&gt; &gt; now you have an MSR based int=
erface, not an MMIO based interface.<br>&gt; &gt;<br>&gt; &gt; It&#39;s als=
o worth noting that any system with &gt;254 CPUs is necessarily<br>&gt; &gt=
; operating in x2APIC mode (so there isn&#39;t an xAPIC window to map, even=
 if<br>&gt; &gt; you wanted to try), and because of the =C3=86PIC Leak vuln=
erability, IceLake<br>&gt; &gt; and later CPUs are locked into x2APIC mode =
by firmware, with no option<br>&gt; &gt; to revert back into xAPIC mode eve=
n on smaller systems.<br>&gt; &gt;<br>&gt; &gt; On top of that, you&#39;ve =
still got the problem of determining the<br>&gt; &gt; destination.=C2=A0 Ev=
en if the guest could send an IPI, it still has to know<br>&gt; &gt; the ph=
ysical APIC ID of the CPU the target vCPU is currently scheduled<br>&gt; &g=
t; on.=C2=A0 And you&#39;d have to ignore things like the logical mode or<b=
r>&gt; &gt; destination shorthands, because multi/broadcast IPIs will hit i=
ncorrect<br>&gt; &gt; targets.<br>&gt; &gt;<br>&gt; &gt; On top of that, ev=
en if you can determine the right destination, how<br>&gt; &gt; does the ta=
rget receive the interrupt?=C2=A0 There can only be one entity in<br>&gt; &=
gt; the system receiving INTR, and that&#39;s Xen.=C2=A0 So you&#39;ve got =
to pick some<br>&gt; &gt; vector that Xen knows what to do with, but isn&#3=
9;t otherwise using.<br>&gt; &gt;<br>&gt; &gt; Not to mention there&#39;s a=
(nother) giant security hole... A guest able to<br>&gt; &gt; issue interrup=
ts could just send INIT-SIPI-SIPI and reset the target CPU<br>&gt; &gt; bac=
k into real mode behind Xen&#39;s back.=C2=A0 Xen will not take kindly to t=
his.<br>&gt; &gt;<br>&gt; &gt;<br>&gt; &gt; So while I expect there&#39;s p=
lenty of room to innovate on the realm switch<br>&gt; &gt; aspect of EPTP-s=
witching, trying to send IPIs from within guest context<br>&gt; &gt; is som=
ething that I will firmly suggest you avoid.=C2=A0 There are good<br>&gt; &=
gt; reasons why it is so complicated to get VMExit-less guest IPIs working.=
<br>&gt; &gt;<br>&gt; &gt; ~Andrew<br>&gt;<br>&gt; Thank you for the detail=
ed answers and context. I am somewhat encouraged to<br>&gt; note that most =
of the roadblocks you mentioned are issues we&#39;ve specifically<br>&gt; c=
onsidered (and think we have solutions for) in our design. :-) We&#39;re us=
ing<br>&gt; some rather exotic compiler-based instrumentation on the guest =
kernel (plus<br>&gt; some tricks with putting the &quot;secure realm&quot;&=
#39;s page tables in a nonoverlapping<br>&gt; guest-physical address range =
that isn&#39;t present in the primary p2m used by<br>&gt; untrusted code) t=
o prevent the guest from doing things it isn&#39;t supposed to<br>&gt; with=
 VMFUNC and (x2)APIC access, despite running in ring 0 within non-root<br>&=
gt; mode.<br>&gt;<br>&gt; On a more concrete level, I am looking to do the =
following from within the<br>&gt; hypervisor (specifically, from within a n=
ew hypercall I&#39;ve added):<br>&gt;<br>&gt; 1) Get some (host-)physical m=
emory frames from the domain heap and &quot;pin&quot; them<br>&gt; to make =
sure they won&#39;t be swapped out.<br>&gt;<br>&gt; 2) Create an altp2m for=
 the calling (current) domain.<br>&gt;<br>&gt; 3) Map some of the newly-all=
ocated physical frames into both the domain&#39;s<br>&gt; primary p2m and i=
ts altp2m, with R/X permissions.<br>&gt;<br>&gt; 4) Map the rest of the phy=
sical frames into only the altp2m (as R/W), at a<br>&gt; guest-physical add=
ress higher than the end of the main p2m&#39;s mapped range<br>&gt; (such t=
hat when the primary p2m is active, the guest cannot access these<br>&gt; p=
ages without taking a hard VM-exit fault).<br>&gt;<br>&gt; I&#39;ve been po=
ring through Xen&#39;s p2m code (e.g. xen/arch/x86/mm/p2m.c) to try<br>&gt;=
 to understand how to achieve these goals, but with little success. Comment=
s<br>&gt; in the p2m code seem to be rather sparse, and mostly unhelpful fo=
r<br>&gt; understanding (without pre-understood context) what many of the f=
unctions do<br>&gt; and what is the intended workflow for using them. For i=
nstance,<br>&gt; similarly-named functions like guest_remove_page() and<br>=
&gt; guest_physmap_remove_page() seem to operate at different levels of<br>=
&gt; abstraction (in terms of memory management, refcount bookkeeping, etc.=
) but<br>&gt; it isn&#39;t externally obvious how they&#39;re meant to all =
fit together and be used<br>&gt; by client code.<br>&gt;<br>&gt; Any sugges=
tions on which p2m (or other) APIs I should be focusing on, and how<br>&gt;=
 they&#39;re meant to be used, would be greatly appreciated. I suppose in t=
heory I<br>&gt; could just bypass p2m entirely, and populate one of the VMC=
S&#39;s EPTP-switching<br>&gt; array&#39;s slots directly with my own manua=
lly constructed paging hierarchy<br>&gt; (since I&#39;m envisioning the mem=
ory layout of our &quot;secure realm&quot; as being quite<br>&gt; simple - =
it only needs a handful of pages). But I&#39;d rather &quot;color within th=
e<br>&gt; lines&quot; of the existing APIs if possible, especially since so=
me of the pages<br>&gt; will need to be mapped into the existing primary p2=
m (for the &quot;insecure<br>&gt; realm&quot;) as well.<br><div><br></div><=
div>You can find an example work-flow here to create altp2m&#39;s and chang=
e memory permissions in the different views: <a href=3D"https://github.com/=
xen-project/xen/blob/master/tools/misc/xen-access.c#L517">https://github.co=
m/xen-project/xen/blob/master/tools/misc/xen-access.c#L517</a>. To add a ne=
w page to the VM you can use <span class=3D"gmail-pl-c1 gmail-pl-token">xc_=
domain_populate_physmap_exact. If you add the page after the VM has already=
 booted the main kernel is unaware of these extra pages that were added but=
 that doesn&#39;t mean it can&#39;t try to poke them. Similarly, using any =
type of memory map to avoid the kernel accessing these pages is just wishfu=
l thinking, the memory map is after all just a hint to the OS what to look =
for, not an access-control mechanism.<br></span></div><div><span class=3D"g=
mail-pl-c1 gmail-pl-token"><br></span></div><div><span class=3D"gmail-pl-c1=
 gmail-pl-token">Also keep in mind that altp2m&#39;s get CoW populated from=
 the hostp2m. You can still get your altp2m to be &quot;only a couple pages=
&quot; by either 1) ensuring no other pages ever get touched while running =
the vCPU with the altp2m as to not trigger the CoW mechanism; or 2) manuall=
y map change the memaccess permissions to n on every page you want to be in=
-accessible in the altp2m.</span></div><div><span class=3D"gmail-pl-c1 gmai=
l-pl-token"><br></span></div><div><span class=3D"gmail-pl-c1 gmail-pl-token=
">You&#39;ll likely want to have pages like where the IDT and GDT is mapped=
 into the altp2m, alongside the pagetable pages. An easy way to check what =
pages are needed for execution in a given code context is use the VM forkin=
g mechanism, create a fork at the point your code is that you want to run i=
n the altp2m, singlestep the fork a single instruction, then examine the fo=
rk&#39;s EPT using xl debug-keys D. Anything you see that got mapped into t=
he fork&#39;s memory would be similarly needed to be accessible in the altp=
2m.<br></span></div><div><span class=3D"gmail-pl-c1 gmail-pl-token"><br></s=
pan></div><div><span class=3D"gmail-pl-c1 gmail-pl-token">Cheers,</span></d=
iv><div><span class=3D"gmail-pl-c1 gmail-pl-token">Tamas<br></span>

</div><div><br></div><div><br></div></div>

--00000000000082fece05f86eb58f--

