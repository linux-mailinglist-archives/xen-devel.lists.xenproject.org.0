Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A31DC997C7
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2019 17:10:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0ofm-0004a7-VB; Thu, 22 Aug 2019 15:06:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Rn+r=WS=gmail.com=rianquinn@srs-us1.protection.inumbo.net>)
 id 1i0ofl-0004a2-N8
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2019 15:06:45 +0000
X-Inumbo-ID: 73115442-c4ee-11e9-8980-bc764e2007e4
Received: from mail-ed1-x542.google.com (unknown [2a00:1450:4864:20::542])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 73115442-c4ee-11e9-8980-bc764e2007e4;
 Thu, 22 Aug 2019 15:06:42 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id r12so8442129edo.5
 for <xen-devel@lists.xenproject.org>; Thu, 22 Aug 2019 08:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/hvWVlRLq7YzCsAeuFWhHyKuvENzxcNywrC65tXXTlA=;
 b=QjLv9agOT+bfS/OgSxPW3xThXDaJ8MdMS2u28DJSg+foKNabuLxGY6U5KOCmJziePn
 osEXQ9EuLigIh2i4YiVgXFVWNYLczUQuhGlfRsg6Del5lW5lP/wiJlV5A3nBAaK5G2c1
 C1vog7PNh6ri/Fv4t3SQEzHH1IkseQPBIaRJrV8Ks30yNqvmQN0gXHcLCDaelnFDbqLK
 NePq7qTmjRuHVThubd+dant/r11QpbOFA3J3lfdlCzfbWCxK5g8QcriaThM/iLq0uVvt
 EJsk/w2t/BCv/QpqA5Ktqzq5V4aR8+SjQ5NWGBvVqzvFjLFddnitgLXf37ksWhueAiz7
 uqPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/hvWVlRLq7YzCsAeuFWhHyKuvENzxcNywrC65tXXTlA=;
 b=XLY843I/bEeqi/gctFczHZg9ADFoRqEr+F6fR3ojFeyXYO9NhMO7PFcz/tYyear8lA
 gkCHDLFUIEv2MwpzRI500gnIteMGXfTkW/hIX74baka8uWet59yJhOZbsaYQvKf6T8Nz
 sDuaBSXVCsXkGqxcjtcNu4K8o88lNfjVjHF9UIufbmagLWpxu0oVEAbq8v+8lTnGmTXM
 zjgt47wggjAXPvj3XMx8OMLJb27M0inI3dhoxctTx9k5Zcd81RAgZW7HEVHEkO3JyLD5
 TbWfhzQwy0endiXIox2daXygOA4nt+NSzOWxqKNQr/uOpCeItg3juPFiaWKLALB/BPEn
 tHXw==
X-Gm-Message-State: APjAAAX7W4NRpi2xrTNi4DdH0voKVDTlXjl7jpIcoZnlfs0EuGsVO8M7
 /GuTXTY13zZJ99zi1M3s8bWwERFi3b9fkoNS/+o=
X-Google-Smtp-Source: APXvYqwxEUebwEmSANOuFD6UnoXK8H9gEwc5VQ85LBabsD2ELz3N6XDu9vEuGXneNQ4qGdMvr5C47KaRBZoaUl9d8mg=
X-Received: by 2002:a17:906:3144:: with SMTP id
 e4mr35598232eje.31.1566486401812; 
 Thu, 22 Aug 2019 08:06:41 -0700 (PDT)
MIME-Version: 1.0
References: <15a4c482-1207-1d8a-fd2a-dc4f25956c27@cs.rochester.edu>
 <79c7b71f-0b61-2799-4a79-644536a9c891@citrix.com>
 <d55da430-0d73-8a92-73e7-99e1aa70680c@cs.rochester.edu>
 <5b190182-4938-52b4-eeb2-df77224711c3@citrix.com>
In-Reply-To: <5b190182-4938-52b4-eeb2-df77224711c3@citrix.com>
From: Rian Quinn <rianquinn@gmail.com>
Date: Thu, 22 Aug 2019 15:06:29 +0000
Message-ID: <CANmpu8U3W1+Jh6KiQTndZRSd5Nw081E2FcYig1Jx3tpT5gxrow@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] More questions about Xen memory layout/usage,
 access to guest memory
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Johnson,
 Ethan" <ejohns48@cs.rochester.edu>
Content-Type: multipart/mixed; boundary="===============7601984360019468245=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============7601984360019468245==
Content-Type: multipart/alternative; boundary="0000000000008690090590b609f5"

--0000000000008690090590b609f5
Content-Type: text/plain; charset="UTF-8"

I can at least confirm that no emulation is needed to execute a Linux
guest, even with the Xen PVH interface, but I don't think that works out of
the box today with Xen, something we are currently working on and will
hopefully have some more data near the end of the year. x2APIC helps, but
it takes some work to convince Linux to use that currently. The trick is to
avoid PortIO and, where possible, MMIO interfaces.

Rian

On Thu, Aug 22, 2019 at 1:53 PM Andrew Cooper <andrew.cooper3@citrix.com>
wrote:

> On 22/08/2019 03:06, Johnson, Ethan wrote:
> > On 8/17/2019 7:04 AM, Andrew Cooper wrote:
> >>> Similarly, to what extent does the dom0 (or other such
> >>> privileged domain) utilize "foreign memory maps" to reach into another
> >>> guest's memory? I understand that this is necessary when creating a
> >>> guest, for live migration, and for QEMU to emulate stuff for HVM
> guests;
> >>> but for PVH, is it ever necessary for Xen or the dom0 to "forcibly"
> >>> access a guest's memory?
> >> I'm not sure what you mean by forcibly.  Dom0 has the ability to do so,
> >> if it chooses.  There is no "force" about it.
> >>
> >> Debuggers and/or Introspection are other reasons why dom0 might chose to
> >> map guest RAM, but I think you've covered the common cases.
> >>
> >>> (I ask because the research project I'm working on is seeking to
> protect
> >>> guests from a compromised hypervisor and dom0, so I need to limit
> >>> outside access to a guest's memory to explicitly shared pages that the
> >>> guest will treat as untrusted - not storing any secrets there, vetting
> >>> input as necessary, etc.)
> >> Sorry to come along with roadblocks, but how on earth do you intend to
> >> prevent a compromised Xen from accessing guest memory?  A compromised
> >> Xen can do almost anything it likes, and without recourse.  This is
> >> ultimately why technologies such as Intel SGX or AMD Secure Encrypted VM
> >> are coming along, because only the hardware itself is in a position to
> >> isolate an untrusted hypervisor/kernel from guest data.
> >>
> >> For dom0, that's perhaps easier.  You could reference count the number
> >> of foreign mappings into the domain as it is created, and refuse to
> >> unpause the guests vcpus until the foreign map count has dropped to 0.
> > We're using a technique where privileged system software (in this case,
> > the hypervisor) is compiled to a virtual instruction set (based on LLVM
> > IR) that limits its access to hardware features and its view of
> > available memory. These limitations are/can be enforced in a variety of
> > ways but the main techniques we're employing are software fault
> > isolation (i.e., memory loads and stores in privileged code are
> > instrumented with checks to ensure they aren't accessing forbidden
> > regions), and mediation of page table updates (by modifying privileged
> > software to make page table updates through a virtual instruction set
> > interface, very similarly to how Xen PV guests make page table updates
> > through hypercalls which gives Xen the opportunity to ensure mappings
> > aren't made to protected regions).
> >
> > Our technique is based on that used by the "Virtual Ghost" project (see
> > https://dl.acm.org/citation.cfm?id=2541986 for the paper; direct PDF
> > link: http://sva.cs.illinois.edu/pubs/VirtualGhost-ASPLOS-2014.pdf),
> > which does something similar to protect applications from a compromised
> > operating system kernel without relying on something like a hypervisor
> > operating at a higher privileged level. We're looking to extend that
> > approach to hypervisors to protect guest VMs from a compromised
> hypervisor.
>
> I have come across that paper before.
>
> The extra language safety (which is effectively what this is) should
> make it harder to compromise the hypervisor (and this is certainly a
> good thing), but nothing at this level will get in the way of an
> actually-compromised piece of ring 0 code from doing whatever it wants.
>
> Suffice it to say that I'll be delighted if someone managed to
> demonstrate me wrong.
>
> >
> >>> Again, this mostly boils down to: under what circumstances, if ever,
> >>> does Xen ever "force" access to any part of a guest's memory?
> >>> (Particularly for PV(H). Clearly that must happen for HVM since, by
> >>> definition, the guest is unaware there's a hypervisor controlling its
> >>> world and emulating hardware behavior, and thus is in no position to
> >>> cooperatively/voluntarily give the hypervisor and dom0 access to its
> >>> memory.)
> >> There are cases for all guest types where Xen will need to emulate
> >> instructions.  Xen will access guest memory in order to perfom
> >> architecturally correct actions, which generally starts with reading the
> >> instruction under %rip.
> >>
> >> For PV guests, this almost entirely restricted to guest-kernel
> >> operations which are privileged in nature.  Access to MSRs, writes to
> >> pagetables, etc.
> >>
> >> For HVM and PVH guests, while PVH means "HVM without Qemu", it doesn't
> >> be a complete absence of emulation.  The Local APIC is emulated by Xen
> >> in most cases, as a bare minimum, but for example, the LMSW instruction
> >> on AMD hardware doesn't have any intercept decoding to help the
> >> hypervisor out when a guest uses the instruction.
> >>
> >> ~Andrew
> > I've found a number of files in the Xen source tree which seem to be
> > related to instruction/x86 platform emulation:
> >
> > arch/x86/x86_emulate.c
> > arch/x86/hvm/emulate.c
> > arch/x86/hvm/vmx/realmode.c
> > arch/x86/hvm/svm/emulate.c
> > arch/x86/pv/emulate.c
> > arch/x86/pv/emul-priv-op.c
> > arch/x86/x86_emulate/x86_emulate.c
> >
> > The last of these, in particular, looks especially hairy (it seems to
> > support emulation of essentially the entire x86 instruction set through
> > a quite impressive edifice of switch statements).
>
> Lovely, isn't it.  For Introspection, we need to be able to emulate an
> instruction which took a permission fault (including No Execute), was
> sent to the analysis engine, and deemed ok to continue.
>
> Other users of emulation are arch/x86/pv/ro-page-fault.c and
> arch/x86/mm/shadow/multi.c
>
> That said, most of these can be ignored in common cases.  vmx/realmode.c
> is only for pre-Westmere Intel CPUs which lack the unrestricted_guest
> feature.  svm/emulate.c is only for K8 hardware which lacks the NRIPS
> feature.
>
> > How does all of this fit into the big picture of how Xen virtualizes the
> > different types of VMs (PV/HVM/PVH)?
>
> Consider this "core x86 support".  All areas which need to emulate an
> instruction for whatever reason use this function.  (We previously had
> multiple areas of code each doing subsets of x86 instruction
> decode/execute, and it was an even bigger mess.)
>
> > My impression (from reading the original "Xen and the Art of
> > Virtualization" SOSP '03 paper that describes the basic architecture)
> > had been that PV guests, in particular, used hypercalls in place of all
> > privileged operations that the guest kernel would otherwise need to
> > execute in ring 0; and that all other (unprivileged) operations could
> > execute natively on the CPU without requiring emulation. From what
> > you're saying (and what I'm seeing in the source code), though, it
> > sounds like in reality things are a bit fuzzier - that there are some
> > operations that Xen traps and emulates instead of explicitly
> > paravirtualizing.
>
> Correct.  Few theories survive contact with the real world.
>
> Some emulation, such as writeable_pagetable support was added to make it
> easier to port guests to being PV.  In this case, writes to pagetables
> are trapped an emulated, as if an equivalent hypercall had been made.
> Sure, its slower than the hypercall, but its far easier to get started
> with.
>
> Some emulation is a consequence of of CPUs changing in the 16 years
> since that paper was published, and some emulation is a stopgap for
> things which really should be paravirtualised properly.  A whole load of
> speculative security fits into this category, as we haven't had time to
> fix it nicely, following the panic of simply fixing it safely.
>
> > Likewise, the Xen design described in the SOSP paper discussed guest I/O
> > as something that's fully paravirtualized, taking place not through
> > emulation of either memory-mapped or port I/O but rather through ring
> > buffers shared between the guest and dom0 via grant tables.
>
> This is still correct and accurate.  Paravirtual split front/back driver
> pairs for network and block are by far the most efficient way of
> shuffling data in and out of the VM.
>
> > I was a bit
> > confused to find I/O emulation code under arch/x86/pv (see e.g.
> > arch/x86/pv/emul-priv-op.c) that seems to be talking about "ports" and
> > the like. Is this another example of things being fuzzier in reality
> > than in the "theoretical" PV design?
>
> This is "general x86 architecture".  Xen handles all exceptions,
> including from PV userspace (possibly being naughty), so at a bare
> minimum needs to filter those which should be handed to the guest kernel
> to deal with.
>
> When it comes to x86 Port IO, it is a critical point of safety that Xen
> runs with IOPL set to 0, or a guest kernel could modify the real
> interrupt flag with a popf instruction.  As a result, all `in` and `out`
> instructions trap with a #GP fault.
>
> Guest userspace could use use iopl() to logically gain access to IO
> ports, after which `in` and `out` instructions would not fault.  Also,
> these instructions don't fault in kernel context.  In both cases, Xen
> has to filter between actually passing the IO request to hardware (if
> the guest is suitably configured), or terminating it defaults, so it
> fails in a manner consistent with how x86 behaves.
>
> For VT-x/SVM guests, filtering of #GP faults happens before the VMExit
> so Xen doesn't have to handle those, but still has to handle all IO
> accesses which are fine (permission wise) according to the guest kernel.
>
> > What devices, if any, are emulated rather than paravirtualized for a PV
> guest?
>
> Look for XEN_X86_EMU_* throughout the code.  Those are all the discrete
> devices which Xen may emulate, for both kinds of guests.  There is a
> very restricted set of valid combinations.
>
> PV dom0's get an emulated PIT to partially forward to real hardware.
> ISTR it is legacy for some laptops where DRAM refresh was still
> configured off timer 1.  I doubt it is revenant these days.
>
> > I know that for PVH, you
> > mentioned that the Local APIC is (at a minimum) emulated, along with
> > some special instructions; is that true for classic PV as well?
>
> Classic PV guests don't get a Local APIC.  They are required to use the
> event channel interface instead.
>
> > For HVM, obviously anything that can't be virtualized natively by the
> > hardware needs to be emulated by Xen/QEMU (since the guest kernel isn't
> > expected to be cooperative to issue PV hypercalls instead); but I would
> > expect emulation to be limited to the relatively small subset of the ISA
> > that VMX/SVM can't natively virtualize. Yet I see that x86_emulate.c
> > supports emulating just about everything. Under what circumstances does
> > Xen actually need to put all that emulation code to use?
>
> Introspection, as I said earlier, which is potentially any instruction.
>
> MMIO regions (including to the Local APIC when it is in xAPIC mode, and
> hardware acceleration isn't available) can be the target of any
> instruction with a memory operand.  While mov is by far the most common
> instruction, other instructions such as and/or/xadd are used in some
> cases.  Various of the vector moves (movups/movaps/movnti) are very
> common with framebuffers.
>
> The cfc/cf8 IO ports are used for PCI Config space accesses, which all
> kernels try to use, and any kernel with real devices need to use.  The
> alternative is the the MMCFG scheme which is plain MMIO as above.
>
> > I'm also wondering just how much of this is Xen's responsibility vs.
> > QEMU's. I understand that when QEMU is used on its own (i.e., not with
> > Xen), it uses dynamic binary recompilation to handle the parts of the
> > ISA that can't be virtualized natively in lower-privilege modes. Does
> > Xen only use QEMU for emulating off-CPU devices (interrupt controller,
> > non-paravirtualized disk/network/graphics/etc.), or does it ever employ
> > any of QEMU's x86 emulation support in addition to Xen's own emulation
> code?
>
> We only use QEMU for off-CPU devices.  For performance reasons, some of
> the interrupt emulation (IO-APIC in particular), and timer emulation
> (HPET, PIT) is done in Xen, even when it would locally be part of the
> motherboard if we were looking for a clear delineation of where Xen
> stops and QEMU starts.
>
> > Is there any particular place in the code where I can go to get a
> > comprehensive "list" (or other such summary) of which parts of the ISA
> > and off-CPU system are emulated for each respective guest type (PV, HVM,
> > and PVH)?
>
> XEN_X86_EMU_* should cover you here.
>
> > I realize that the difference between HVM and PVH is more of a
> > continuum than a line; what I'm especially interested in is, what's the
> > *bare minimum* of emulation required for a PVH guest that's using as
> > much paravirtualization as possible? (That's the setting I'm looking to
> > target for my research on protecting guests from a compromised
> > hypervisor, since I'm trying to minimize the scope of interactions
> > between the guest and hypervisor/dom0 that our virtual instruction set
> > layer needs to mediate.)
>
> If you are using PVH guests, on not-ancient hardware, and you can
> persuade the guest kernel to use x2APIC mode, and without using any
> ins/outs instructions, then you just might be able to get away without
> any x86_emulate() at all.
>
> x2APIC mode has an MSR-based interface rather than an MMIO interface,
> which means that the VMExit intercept information alone is sufficient to
> work out exactly what to do, and ins/outs is the only other instructions
> (which come to mind) liable to trap and need emulator support above and
> beyond the intercept information.
>
> That said, whatever you do here is going to have to cope with dom0 and
> all the requirements for keeping the system running.  Depending on
> exactly how you're approaching the problem, it might be possible to
> declare that out of scope and leave it to one side.
>
> > On a somewhat related note, I also have a question about a particular
> > piece of code in arch/x86/pv/emul-priv-op.c, namely the function
> > io_emul_stub_setup(). It looks like it is, at runtime, crafting a
> > function that switches to the guest register context, emulates a
> > particular I/O operation, then switches back to the host register
> > context. This caught our attention while we were implementing Control
> > Flow Integrity (CFI) instrumentation for Xen (which is necessary for us
> > to enforce the software fault isolation (SFI) instrumentation that
> > provides our memory protections). Why does Xen use dynamically-generated
> > code here? Is it just for implementation convenience (i.e., to improve
> > the generalizability of the code)?
>
> This mechanism is for dom0 only, and exists because some firmware is
> terrible.
>
> Some AML in ACPI tables uses an IO port to generate an SMI, and has an
> API which uses the GPRs.  It turns out things go rather wrong when Xen
> intercepts the IO instruction, and replays it to hardware in Xen's GPR
> context, rather than the guest kernels.
>
> This bodge swaps Xen's and dom0's GPRs just around the IO instruction,
> so the SMI API gets its parameters properly, and the results get fed
> back properly into AML.
>
> There is a related hypercall, SCHEDOP_pin_override, used by dom0,
> because sometimes the AML really does need to execute on CPU0, and not
> wherever dom0's vcpu0 happens to be executing.
>
> > Thanks again for all your time and effort spent answering my questions.
> > I know I'm throwing a lot of unusual questions out there - this
> > back-and-forth has been very helpful for me in figuring out *what*
> > questions I need to be asking in the first place to understand what's
> > feasible to do in the Xen architecture and how I might go about doing
> > it. :-)
>
> Not a problem in the slightest.
>
> ~Andrew
>
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel

--0000000000008690090590b609f5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I can at least confirm that no emulation is needed to=
 execute a Linux guest, even with the Xen PVH interface, but I don&#39;t th=
ink that works out of the box today with Xen, something we are currently wo=
rking on and will hopefully have some more data near the end of the year. x=
2APIC helps, but it takes some work to convince Linux to use that currently=
. The trick is to avoid PortIO and, where possible, MMIO interfaces. <br></=
div><div><br></div><div>Rian<br></div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 22, 2019 at 1:53 PM Andre=
w Cooper &lt;<a href=3D"mailto:andrew.cooper3@citrix.com">andrew.cooper3@ci=
trix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On 22/08/2019 03:06, Johnson, Ethan wrote:<br>
&gt; On 8/17/2019 7:04 AM, Andrew Cooper wrote:<br>
&gt;&gt;&gt; Similarly, to what extent does the dom0 (or other such<br>
&gt;&gt;&gt; privileged domain) utilize &quot;foreign memory maps&quot; to =
reach into another<br>
&gt;&gt;&gt; guest&#39;s memory? I understand that this is necessary when c=
reating a<br>
&gt;&gt;&gt; guest, for live migration, and for QEMU to emulate stuff for H=
VM guests;<br>
&gt;&gt;&gt; but for PVH, is it ever necessary for Xen or the dom0 to &quot=
;forcibly&quot;<br>
&gt;&gt;&gt; access a guest&#39;s memory?<br>
&gt;&gt; I&#39;m not sure what you mean by forcibly.=C2=A0 Dom0 has the abi=
lity to do so,<br>
&gt;&gt; if it chooses.=C2=A0 There is no &quot;force&quot; about it.<br>
&gt;&gt;<br>
&gt;&gt; Debuggers and/or Introspection are other reasons why dom0 might ch=
ose to<br>
&gt;&gt; map guest RAM, but I think you&#39;ve covered the common cases.<br=
>
&gt;&gt;<br>
&gt;&gt;&gt; (I ask because the research project I&#39;m working on is seek=
ing to protect<br>
&gt;&gt;&gt; guests from a compromised hypervisor and dom0, so I need to li=
mit<br>
&gt;&gt;&gt; outside access to a guest&#39;s memory to explicitly shared pa=
ges that the<br>
&gt;&gt;&gt; guest will treat as untrusted - not storing any secrets there,=
 vetting<br>
&gt;&gt;&gt; input as necessary, etc.)<br>
&gt;&gt; Sorry to come along with roadblocks, but how on earth do you inten=
d to<br>
&gt;&gt; prevent a compromised Xen from accessing guest memory?=C2=A0 A com=
promised<br>
&gt;&gt; Xen can do almost anything it likes, and without recourse.=C2=A0 T=
his is<br>
&gt;&gt; ultimately why technologies such as Intel SGX or AMD Secure Encryp=
ted VM<br>
&gt;&gt; are coming along, because only the hardware itself is in a positio=
n to<br>
&gt;&gt; isolate an untrusted hypervisor/kernel from guest data.<br>
&gt;&gt;<br>
&gt;&gt; For dom0, that&#39;s perhaps easier.=C2=A0 You could reference cou=
nt the number<br>
&gt;&gt; of foreign mappings into the domain as it is created, and refuse t=
o<br>
&gt;&gt; unpause the guests vcpus until the foreign map count has dropped t=
o 0.<br>
&gt; We&#39;re using a technique where privileged system software (in this =
case, <br>
&gt; the hypervisor) is compiled to a virtual instruction set (based on LLV=
M <br>
&gt; IR) that limits its access to hardware features and its view of <br>
&gt; available memory. These limitations are/can be enforced in a variety o=
f <br>
&gt; ways but the main techniques we&#39;re employing are software fault <b=
r>
&gt; isolation (i.e., memory loads and stores in privileged code are <br>
&gt; instrumented with checks to ensure they aren&#39;t accessing forbidden=
 <br>
&gt; regions), and mediation of page table updates (by modifying privileged=
 <br>
&gt; software to make page table updates through a virtual instruction set =
<br>
&gt; interface, very similarly to how Xen PV guests make page table updates=
 <br>
&gt; through hypercalls which gives Xen the opportunity to ensure mappings =
<br>
&gt; aren&#39;t made to protected regions).<br>
&gt;<br>
&gt; Our technique is based on that used by the &quot;Virtual Ghost&quot; p=
roject (see <br>
&gt; <a href=3D"https://dl.acm.org/citation.cfm?id=3D2541986" rel=3D"norefe=
rrer" target=3D"_blank">https://dl.acm.org/citation.cfm?id=3D2541986</a> fo=
r the paper; direct PDF <br>
&gt; link: <a href=3D"http://sva.cs.illinois.edu/pubs/VirtualGhost-ASPLOS-2=
014.pdf" rel=3D"noreferrer" target=3D"_blank">http://sva.cs.illinois.edu/pu=
bs/VirtualGhost-ASPLOS-2014.pdf</a>), <br>
&gt; which does something similar to protect applications from a compromise=
d <br>
&gt; operating system kernel without relying on something like a hypervisor=
 <br>
&gt; operating at a higher privileged level. We&#39;re looking to extend th=
at <br>
&gt; approach to hypervisors to protect guest VMs from a compromised hyperv=
isor.<br>
<br>
I have come across that paper before.<br>
<br>
The extra language safety (which is effectively what this is) should<br>
make it harder to compromise the hypervisor (and this is certainly a<br>
good thing), but nothing at this level will get in the way of an<br>
actually-compromised piece of ring 0 code from doing whatever it wants.<br>
<br>
Suffice it to say that I&#39;ll be delighted if someone managed to<br>
demonstrate me wrong.<br>
<br>
&gt;<br>
&gt;&gt;&gt; Again, this mostly boils down to: under what circumstances, if=
 ever,<br>
&gt;&gt;&gt; does Xen ever &quot;force&quot; access to any part of a guest&=
#39;s memory?<br>
&gt;&gt;&gt; (Particularly for PV(H). Clearly that must happen for HVM sinc=
e, by<br>
&gt;&gt;&gt; definition, the guest is unaware there&#39;s a hypervisor cont=
rolling its<br>
&gt;&gt;&gt; world and emulating hardware behavior, and thus is in no posit=
ion to<br>
&gt;&gt;&gt; cooperatively/voluntarily give the hypervisor and dom0 access =
to its<br>
&gt;&gt;&gt; memory.)<br>
&gt;&gt; There are cases for all guest types where Xen will need to emulate=
<br>
&gt;&gt; instructions.=C2=A0 Xen will access guest memory in order to perfo=
m<br>
&gt;&gt; architecturally correct actions, which generally starts with readi=
ng the<br>
&gt;&gt; instruction under %rip.<br>
&gt;&gt;<br>
&gt;&gt; For PV guests, this almost entirely restricted to guest-kernel<br>
&gt;&gt; operations which are privileged in nature.=C2=A0 Access to MSRs, w=
rites to<br>
&gt;&gt; pagetables, etc.<br>
&gt;&gt;<br>
&gt;&gt; For HVM and PVH guests, while PVH means &quot;HVM without Qemu&quo=
t;, it doesn&#39;t<br>
&gt;&gt; be a complete absence of emulation.=C2=A0 The Local APIC is emulat=
ed by Xen<br>
&gt;&gt; in most cases, as a bare minimum, but for example, the LMSW instru=
ction<br>
&gt;&gt; on AMD hardware doesn&#39;t have any intercept decoding to help th=
e<br>
&gt;&gt; hypervisor out when a guest uses the instruction.<br>
&gt;&gt;<br>
&gt;&gt; ~Andrew<br>
&gt; I&#39;ve found a number of files in the Xen source tree which seem to =
be <br>
&gt; related to instruction/x86 platform emulation:<br>
&gt;<br>
&gt; arch/x86/x86_emulate.c<br>
&gt; arch/x86/hvm/emulate.c<br>
&gt; arch/x86/hvm/vmx/realmode.c<br>
&gt; arch/x86/hvm/svm/emulate.c<br>
&gt; arch/x86/pv/emulate.c<br>
&gt; arch/x86/pv/emul-priv-op.c<br>
&gt; arch/x86/x86_emulate/x86_emulate.c<br>
&gt;<br>
&gt; The last of these, in particular, looks especially hairy (it seems to =
<br>
&gt; support emulation of essentially the entire x86 instruction set throug=
h <br>
&gt; a quite impressive edifice of switch statements).<br>
<br>
Lovely, isn&#39;t it.=C2=A0 For Introspection, we need to be able to emulat=
e an<br>
instruction which took a permission fault (including No Execute), was<br>
sent to the analysis engine, and deemed ok to continue.<br>
<br>
Other users of emulation are arch/x86/pv/ro-page-fault.c and<br>
arch/x86/mm/shadow/multi.c<br>
<br>
That said, most of these can be ignored in common cases.=C2=A0 vmx/realmode=
.c<br>
is only for pre-Westmere Intel CPUs which lack the unrestricted_guest<br>
feature.=C2=A0 svm/emulate.c is only for K8 hardware which lacks the NRIPS<=
br>
feature.<br>
<br>
&gt; How does all of this fit into the big picture of how Xen virtualizes t=
he <br>
&gt; different types of VMs (PV/HVM/PVH)?<br>
<br>
Consider this &quot;core x86 support&quot;.=C2=A0 All areas which need to e=
mulate an<br>
instruction for whatever reason use this function.=C2=A0 (We previously had=
<br>
multiple areas of code each doing subsets of x86 instruction<br>
decode/execute, and it was an even bigger mess.)<br>
<br>
&gt; My impression (from reading the original &quot;Xen and the Art of <br>
&gt; Virtualization&quot; SOSP &#39;03 paper that describes the basic archi=
tecture) <br>
&gt; had been that PV guests, in particular, used hypercalls in place of al=
l <br>
&gt; privileged operations that the guest kernel would otherwise need to <b=
r>
&gt; execute in ring 0; and that all other (unprivileged) operations could =
<br>
&gt; execute natively on the CPU without requiring emulation. From what <br=
>
&gt; you&#39;re saying (and what I&#39;m seeing in the source code), though=
, it <br>
&gt; sounds like in reality things are a bit fuzzier - that there are some =
<br>
&gt; operations that Xen traps and emulates instead of explicitly <br>
&gt; paravirtualizing.<br>
<br>
Correct.=C2=A0 Few theories survive contact with the real world.<br>
<br>
Some emulation, such as writeable_pagetable support was added to make it<br=
>
easier to port guests to being PV.=C2=A0 In this case, writes to pagetables=
<br>
are trapped an emulated, as if an equivalent hypercall had been made.=C2=A0=
<br>
Sure, its slower than the hypercall, but its far easier to get started with=
.<br>
<br>
Some emulation is a consequence of of CPUs changing in the 16 years<br>
since that paper was published, and some emulation is a stopgap for<br>
things which really should be paravirtualised properly.=C2=A0 A whole load =
of<br>
speculative security fits into this category, as we haven&#39;t had time to=
<br>
fix it nicely, following the panic of simply fixing it safely.<br>
<br>
&gt; Likewise, the Xen design described in the SOSP paper discussed guest I=
/O <br>
&gt; as something that&#39;s fully paravirtualized, taking place not throug=
h <br>
&gt; emulation of either memory-mapped or port I/O but rather through ring =
<br>
&gt; buffers shared between the guest and dom0 via grant tables.<br>
<br>
This is still correct and accurate.=C2=A0 Paravirtual split front/back driv=
er<br>
pairs for network and block are by far the most efficient way of<br>
shuffling data in and out of the VM.<br>
<br>
&gt; I was a bit <br>
&gt; confused to find I/O emulation code under arch/x86/pv (see e.g. <br>
&gt; arch/x86/pv/emul-priv-op.c) that seems to be talking about &quot;ports=
&quot; and <br>
&gt; the like. Is this another example of things being fuzzier in reality <=
br>
&gt; than in the &quot;theoretical&quot; PV design?<br>
<br>
This is &quot;general x86 architecture&quot;.=C2=A0 Xen handles all excepti=
ons,<br>
including from PV userspace (possibly being naughty), so at a bare<br>
minimum needs to filter those which should be handed to the guest kernel<br=
>
to deal with.<br>
<br>
When it comes to x86 Port IO, it is a critical point of safety that Xen<br>
runs with IOPL set to 0, or a guest kernel could modify the real<br>
interrupt flag with a popf instruction.=C2=A0 As a result, all `in` and `ou=
t`<br>
instructions trap with a #GP fault.<br>
<br>
Guest userspace could use use iopl() to logically gain access to IO<br>
ports, after which `in` and `out` instructions would not fault.=C2=A0 Also,=
<br>
these instructions don&#39;t fault in kernel context.=C2=A0 In both cases, =
Xen<br>
has to filter between actually passing the IO request to hardware (if<br>
the guest is suitably configured), or terminating it defaults, so it<br>
fails in a manner consistent with how x86 behaves.<br>
<br>
For VT-x/SVM guests, filtering of #GP faults happens before the VMExit<br>
so Xen doesn&#39;t have to handle those, but still has to handle all IO<br>
accesses which are fine (permission wise) according to the guest kernel.<br=
>
<br>
&gt; What devices, if any, are emulated rather than paravirtualized for a P=
V guest?<br>
<br>
Look for XEN_X86_EMU_* throughout the code.=C2=A0 Those are all the discret=
e<br>
devices which Xen may emulate, for both kinds of guests.=C2=A0 There is a<b=
r>
very restricted set of valid combinations.<br>
<br>
PV dom0&#39;s get an emulated PIT to partially forward to real hardware.<br=
>
ISTR it is legacy for some laptops where DRAM refresh was still<br>
configured off timer 1.=C2=A0 I doubt it is revenant these days.<br>
<br>
&gt; I know that for PVH, you <br>
&gt; mentioned that the Local APIC is (at a minimum) emulated, along with <=
br>
&gt; some special instructions; is that true for classic PV as well?<br>
<br>
Classic PV guests don&#39;t get a Local APIC.=C2=A0 They are required to us=
e the<br>
event channel interface instead.<br>
<br>
&gt; For HVM, obviously anything that can&#39;t be virtualized natively by =
the <br>
&gt; hardware needs to be emulated by Xen/QEMU (since the guest kernel isn&=
#39;t <br>
&gt; expected to be cooperative to issue PV hypercalls instead); but I woul=
d <br>
&gt; expect emulation to be limited to the relatively small subset of the I=
SA <br>
&gt; that VMX/SVM can&#39;t natively virtualize. Yet I see that x86_emulate=
.c <br>
&gt; supports emulating just about everything. Under what circumstances doe=
s <br>
&gt; Xen actually need to put all that emulation code to use?<br>
<br>
Introspection, as I said earlier, which is potentially any instruction.<br>
<br>
MMIO regions (including to the Local APIC when it is in xAPIC mode, and<br>
hardware acceleration isn&#39;t available) can be the target of any<br>
instruction with a memory operand.=C2=A0 While mov is by far the most commo=
n<br>
instruction, other instructions such as and/or/xadd are used in some<br>
cases.=C2=A0 Various of the vector moves (movups/movaps/movnti) are very<br=
>
common with framebuffers.<br>
<br>
The cfc/cf8 IO ports are used for PCI Config space accesses, which all<br>
kernels try to use, and any kernel with real devices need to use.=C2=A0 The=
<br>
alternative is the the MMCFG scheme which is plain MMIO as above.<br>
<br>
&gt; I&#39;m also wondering just how much of this is Xen&#39;s responsibili=
ty vs. <br>
&gt; QEMU&#39;s. I understand that when QEMU is used on its own (i.e., not =
with <br>
&gt; Xen), it uses dynamic binary recompilation to handle the parts of the =
<br>
&gt; ISA that can&#39;t be virtualized natively in lower-privilege modes. D=
oes <br>
&gt; Xen only use QEMU for emulating off-CPU devices (interrupt controller,=
 <br>
&gt; non-paravirtualized disk/network/graphics/etc.), or does it ever emplo=
y <br>
&gt; any of QEMU&#39;s x86 emulation support in addition to Xen&#39;s own e=
mulation code?<br>
<br>
We only use QEMU for off-CPU devices.=C2=A0 For performance reasons, some o=
f<br>
the interrupt emulation (IO-APIC in particular), and timer emulation<br>
(HPET, PIT) is done in Xen, even when it would locally be part of the<br>
motherboard if we were looking for a clear delineation of where Xen<br>
stops and QEMU starts.<br>
<br>
&gt; Is there any particular place in the code where I can go to get a <br>
&gt; comprehensive &quot;list&quot; (or other such summary) of which parts =
of the ISA <br>
&gt; and off-CPU system are emulated for each respective guest type (PV, HV=
M, <br>
&gt; and PVH)?<br>
<br>
XEN_X86_EMU_* should cover you here.<br>
<br>
&gt; I realize that the difference between HVM and PVH is more of a <br>
&gt; continuum than a line; what I&#39;m especially interested in is, what&=
#39;s the <br>
&gt; *bare minimum* of emulation required for a PVH guest that&#39;s using =
as <br>
&gt; much paravirtualization as possible? (That&#39;s the setting I&#39;m l=
ooking to <br>
&gt; target for my research on protecting guests from a compromised <br>
&gt; hypervisor, since I&#39;m trying to minimize the scope of interactions=
 <br>
&gt; between the guest and hypervisor/dom0 that our virtual instruction set=
 <br>
&gt; layer needs to mediate.)<br>
<br>
If you are using PVH guests, on not-ancient hardware, and you can<br>
persuade the guest kernel to use x2APIC mode, and without using any<br>
ins/outs instructions, then you just might be able to get away without<br>
any x86_emulate() at all.<br>
<br>
x2APIC mode has an MSR-based interface rather than an MMIO interface,<br>
which means that the VMExit intercept information alone is sufficient to<br=
>
work out exactly what to do, and ins/outs is the only other instructions<br=
>
(which come to mind) liable to trap and need emulator support above and<br>
beyond the intercept information.<br>
<br>
That said, whatever you do here is going to have to cope with dom0 and<br>
all the requirements for keeping the system running.=C2=A0 Depending on<br>
exactly how you&#39;re approaching the problem, it might be possible to<br>
declare that out of scope and leave it to one side.<br>
<br>
&gt; On a somewhat related note, I also have a question about a particular =
<br>
&gt; piece of code in arch/x86/pv/emul-priv-op.c, namely the function <br>
&gt; io_emul_stub_setup(). It looks like it is, at runtime, crafting a <br>
&gt; function that switches to the guest register context, emulates a <br>
&gt; particular I/O operation, then switches back to the host register <br>
&gt; context. This caught our attention while we were implementing Control =
<br>
&gt; Flow Integrity (CFI) instrumentation for Xen (which is necessary for u=
s <br>
&gt; to enforce the software fault isolation (SFI) instrumentation that <br=
>
&gt; provides our memory protections). Why does Xen use dynamically-generat=
ed <br>
&gt; code here? Is it just for implementation convenience (i.e., to improve=
 <br>
&gt; the generalizability of the code)?<br>
<br>
This mechanism is for dom0 only, and exists because some firmware is<br>
terrible.<br>
<br>
Some AML in ACPI tables uses an IO port to generate an SMI, and has an<br>
API which uses the GPRs.=C2=A0 It turns out things go rather wrong when Xen=
<br>
intercepts the IO instruction, and replays it to hardware in Xen&#39;s GPR<=
br>
context, rather than the guest kernels.<br>
<br>
This bodge swaps Xen&#39;s and dom0&#39;s GPRs just around the IO instructi=
on,<br>
so the SMI API gets its parameters properly, and the results get fed<br>
back properly into AML.<br>
<br>
There is a related hypercall, SCHEDOP_pin_override, used by dom0,<br>
because sometimes the AML really does need to execute on CPU0, and not<br>
wherever dom0&#39;s vcpu0 happens to be executing.<br>
<br>
&gt; Thanks again for all your time and effort spent answering my questions=
. <br>
&gt; I know I&#39;m throwing a lot of unusual questions out there - this <b=
r>
&gt; back-and-forth has been very helpful for me in figuring out *what* <br=
>
&gt; questions I need to be asking in the first place to understand what&#3=
9;s <br>
&gt; feasible to do in the Xen architecture and how I might go about doing =
<br>
&gt; it. :-)<br>
<br>
Not a problem in the slightest.<br>
<br>
~Andrew<br>
<br>
_______________________________________________<br>
Xen-devel mailing list<br>
<a href=3D"mailto:Xen-devel@lists.xenproject.org" target=3D"_blank">Xen-dev=
el@lists.xenproject.org</a><br>
<a href=3D"https://lists.xenproject.org/mailman/listinfo/xen-devel" rel=3D"=
noreferrer" target=3D"_blank">https://lists.xenproject.org/mailman/listinfo=
/xen-devel</a></blockquote></div>

--0000000000008690090590b609f5--


--===============7601984360019468245==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7601984360019468245==--

