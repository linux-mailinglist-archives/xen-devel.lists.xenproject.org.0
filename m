Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E090535F50A
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 15:43:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110645.211196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWfnN-00052N-To; Wed, 14 Apr 2021 13:43:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110645.211196; Wed, 14 Apr 2021 13:43:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWfnN-00051y-QH; Wed, 14 Apr 2021 13:43:05 +0000
Received: by outflank-mailman (input) for mailman id 110645;
 Wed, 14 Apr 2021 13:43:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=35og=JL=goodmis.org=rostedt@kernel.org>)
 id 1lWfnM-00051t-Ho
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 13:43:04 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cc90edb3-2595-4841-961f-4655d508c43f;
 Wed, 14 Apr 2021 13:43:03 +0000 (UTC)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7569E611AD;
 Wed, 14 Apr 2021 13:43:02 +0000 (UTC)
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
X-Inumbo-ID: cc90edb3-2595-4841-961f-4655d508c43f
Date: Wed, 14 Apr 2021 09:43:00 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Giuseppe Eletto <giuseppe.eletto@edu.unito.it>,
 <linux-trace-devel@vger.kernel.org>, <xen-devel@lists.xenproject.org>,
 Dario Faggioli <dfaggioli@suse.com>, Enrico Bini <enrico.bini@unito.it>
Subject: Re: A KernelShark plugin for Xen traces analysis
Message-ID: <20210414094300.7fbd6887@gandalf.local.home>
In-Reply-To: <094c4b3f-3988-c51f-3a69-cfbc8d6a45bf@citrix.com>
References: <CALTQNB5X1+G33Qoh5nNxttQe_GkzKvJFLfEXQszsc6XYr+NgUA@mail.gmail.com>
	<20210413114614.4971caff@gandalf.local.home>
	<094c4b3f-3988-c51f-3a69-cfbc8d6a45bf@citrix.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 14 Apr 2021 11:07:33 +0100
Andrew Cooper <andrew.cooper3@citrix.com> wrote:

> On 13/04/2021 16:46, Steven Rostedt wrote:
> > Hi Giuseppe,
> >
> > On Tue, 13 Apr 2021 16:28:36 +0200
> > Giuseppe Eletto <giuseppe.eletto@edu.unito.it> wrote:
> > =20
> >> Hello,
> >> I want to share with you a new plugin developed by me, under the
> >> supervision of Dario Faggioli, which allows the new version of KernelS=
hark
> >> (the v2-beta) to open and view the Xen traces created using the "xentr=
ace" tool.
> >>
> >> In fact, KernelShark is a well known tool for graphical visualization
> >> Linux kernel traces, obtained via "ftrace" and "trace-cmd". Anyway tha=
nks
> >> to its modular architecture, it is now possible to implement plugins w=
hich
> >> open and display traces with arbitrary format, for example, as in in
> >> this case, traces of the Xen hypervisor. =20
> > I'm guessing you have trace events coming from Xen itself?
> >
> > =20
> >> For more information on how to build the plugin and/or
> >> to view the source code I leave the repository below:
> >> https://github.com/giuseppe998e/kernelshark-xentrace-plugin
> >>
> >>
> >> In short:
> >>
> >> $ sudo apt install git build-essential libjson-c-dev
> >> $ git clone --recurse-submodules
> >> https://github.com/giuseppe998e/kernelshark-xentrace-plugin.git
> >> $ cd kernelshark-xentrace-plugin/
> >> $ make
> >>
> >> $ export XEN_CPUHZ=3D3G # Sets the CPU frequency ((G)hz/(M)hz/(K)hz/hz)
> >> $ kernelshark -p out/ks-xentrace.so trace.xen
> >>
> >>
> >> You will need the development version of KernelShark, available here:
> >> https://git.kernel.org/pub/scm/utils/trace-cmd/kernel-shark.git =20
> > This will soon be the main repository, as we are going to deprecate the
> > version in the trace-cmd.git repo soon. And because libtracecmd 1.0 has
> > already been released.
> >
> > =20
> >> A screenshot of the plugin in action is available here:
> >> https://github.com/giuseppe998e/kernelshark-xentrace-plugin/raw/master=
/.github/img/ks-xentrace.png
> >>
> >> I'm happy to receive whatever feedback you may have about it,
> >> and to answer any question.
> >> =20
> > Thanks for doing this. What would be nice is to have the xen traces alo=
ng
> > side the linux tracing. Perhaps we can update trace-cmd agent to work w=
ith
> > Xen as well. Does xen implement vsock or some other way to communicate
> > between the guests and the Dom0 kernel? If not, we should add one. The =
you
> > could do the following:
> >
> >  1. On each guest, run as root: trace-cmd agent --xen
> >  2. On Dom0 run: trace-cmd record -e (events on Dom0) \
> >      --xen (commands to do tracing in Xen HV) \
> >      -A <guest-name1> -e (events on guest)
> >
> > And then you would get a trace.dat file for Dom0 and the guest, and also
> > have a trace file for Xen (however that is done). And then on KernelSha=
rk,
> > we have a KVM plugin in development that does this. But you can do the =
same
> > with Xen.
> >
> > For KVM, we have:
> >
> >  1. On each guest: trace-cmd agent
> >  2. On the host: trace-cmd record -e kvm -e sched -e irq \
> >       -A guest-name -e all
> >     The above produces trace.dat for the host trace, and=20
> >      trace-<guest-name>.dat for the guest.
> >  3. kernelshark trace.dat -a trace-Fedora21.dat
> >
> > (I have a guest called Fedora21).
> >
> >   http://rostedt.org/private/kernelshark-kvm.png
> >
> > Where you can see the kvm hypervisor task KVM-2356 is the host task run=
ning
> > the guest VCPU 0, and you see the switch between the two.
> >
> > Perhaps we can do something like that with Xen as well. The plugin is s=
till
> > in the works, but should be published soon. And when it is, you could u=
se
> > that as a template for Xen. =20
>=20
> A possibly tangential question.=C2=A0 Where does KernelShark's idea of CP=
Us
> (i.e. real logical threads) come from?

It comes from the plugin that parses the file.

KernelShark can take multiple inputs. We have a plugin internally at VMware
that can read trace data from ESX and produces CPUs and Tasks on top of
them. In ESX tasks are actually called "Worlds".

>=20
> In a Xen system, dom0 is just a VM, and particularly on larger servers,
> may not be as many vcpus as the system has logical threads.

Yes, I have some idea of how Xen works. When I was hired at Red Hat in
2006, my first job was to work on Xen. I even ported "logdev" (the
predecessor to ftrace) to the Xen hypervisor).

>=20
> This causes major problems for `perf` support under Xen, which assumes
> that the kernel's idea of CPUs matches that of the system.

Things are different with KernelShark.

>=20
> When rendering a trace including Xen data, Xen can provide the real
> system CPUs, and dom0 wants to be rendered as a VM under Xen, similar to
> trace-Fedora21 in your screenshot above.=C2=A0 (Obviously, if you're doing
> nested virt, things need to start nesting.)

Right.

What I would envision how this would work, is that you would produce a
set of tracing files. One for each guest (including Dom0), and one for the
Xen hypervisor itself. The trick is to have a way to synchronize the time
stamps. What we just did with KVM is to have all the tracing record the
CPUs TSC, including the shift and multiplier that the CPU might change for
the guests. Then we have a way to convert the TSC to nanoseconds. This way
all tracing data has the same clock. It's somewhat complicated to get
right, and requires access to how the guests clocks are modified by the CPU.

For KVM, each machine has a unique id and is stored in the trace.dat files.
We have the host store a mapping of what thread represents which guest VCPU
(virtual CPU). Then the "-a" option tells KernelShark to append the
tracing data as a dependency. I would imagine we can have something like
this:

 kernelshark xen.dat -a trace-dom0.dat -a trace-guest1.dat -a trace-guest2.=
dat

The Xen plugin would then need to read the how the threads in xen.dat map
to the virtual CPUs of each of the guest files. Which would give you the
layering.

To give you a better idea about the CPU mappings, before I enabled the KVM
combo plugin (that maps the VCPUS with the host threads), kernelshark comes
up like this:

  http://rostedt.org/private/kernel-shark-kvm2.png

Where the first 8 plots represent the host CPUs and the next two represent
the guest CPUs.

Finally, we have been thinking about nesting VMs. It's been in our thoughts
from the beginning, and we worked to make sure that the design can be
extended to handle it. We haven't done anything with nested VM mappings, as
we are trying to sort out all the issues with just mapping a single guest to
host. ;-)  But yes, when we do support nested VMs, We could show the host
thread, the guest-host thread, then the top guest CPU stacked on top of
each other.

As everything is done via plugins, the options are limitless ;-)

-- Steve

