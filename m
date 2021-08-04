Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA633E08AE
	for <lists+xen-devel@lfdr.de>; Wed,  4 Aug 2021 21:20:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163991.300174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBMR3-0001vU-3I; Wed, 04 Aug 2021 19:20:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163991.300174; Wed, 04 Aug 2021 19:20:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBMR2-0001t6-W9; Wed, 04 Aug 2021 19:20:12 +0000
Received: by outflank-mailman (input) for mailman id 163991;
 Wed, 04 Aug 2021 19:20:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K6bJ=M3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mBMR1-0001sf-Hy
 for xen-devel@lists.xen.org; Wed, 04 Aug 2021 19:20:11 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fbb3b118-f558-11eb-9b94-12813bfff9fa;
 Wed, 04 Aug 2021 19:20:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E4C0E600D4;
 Wed,  4 Aug 2021 19:20:07 +0000 (UTC)
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
X-Inumbo-ID: fbb3b118-f558-11eb-9b94-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628104808;
	bh=Tk9svFucHVQX1rX4rjlyf5bPS3OyLOg2jFYkj8R7lYY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MLH5gTRhcouaIHypk5GnwGkq9f6kN/HVIONZniQHWrGk7PT0M1jGZvdGEdiCsA0F/
	 GYSPg7bOslkzhu8Fb6cA7KeMQ4ApMVvn/3I5v4vzE8rnaIdVm9NgpiMMC4c54Be3PQ
	 QKNMeXWA+UXgP3VAFJTSFs0cTh6IWqvQ2wOJQIBeJvj6+6l5sEX2Ub6RfvuhaoR4sk
	 ywa4NwI9aqHUWf2scDXL1byokWhYs172QqnZw1fA4vTfjQjWlOhv/hrdLX5ydqCMLH
	 OUJpNcb2piK3TO8q0nIHQG1PwqE4FOEmQWKBDSYyOcMkGRxK3SMH8qj1iJyf2Nnlyw
	 8tW2A56IMP3jw==
Date: Wed, 4 Aug 2021 12:20:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
cc: Stratos Mailing List <stratos-dev@op-lists.linaro.org>, 
    virtio-dev@lists.oasis-open.org, Arnd Bergmann <arnd.bergmann@linaro.org>, 
    Viresh Kumar <viresh.kumar@linaro.org>, 
    AKASHI Takahiro <takahiro.akashi@linaro.org>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, stefanha@redhat.com, 
    Jan Kiszka <jan.kiszka@siemens.com>, 
    Carl van Schaik <cvanscha@qti.qualcomm.com>, pratikp@quicinc.com, 
    Srivatsa Vaddagiri <vatsa@codeaurora.org>, 
    Jean-Philippe Brucker <jean-philippe@linaro.org>, 
    Mathieu Poirier <mathieu.poirier@linaro.org>, Wei.Chen@arm.com, 
    olekstysh@gmail.com, Oleksandr_Tyshchenko@epam.com, 
    Bertrand.Marquis@arm.com, Artem_Mygaiev@epam.com, julien@xen.org, 
    jgross@suse.com, paul@xen.org, xen-devel@lists.xen.org
Subject: Re: Enabling hypervisor agnosticism for VirtIO backends
In-Reply-To: <87v94ldrqq.fsf@linaro.org>
Message-ID: <alpine.DEB.2.21.2108041055390.9768@sstabellini-ThinkPad-T480s>
References: <87v94ldrqq.fsf@linaro.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1515917732-1628099743=:9768"
Content-ID: <alpine.DEB.2.21.2108041056110.9768@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1515917732-1628099743=:9768
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2108041056111.9768@sstabellini-ThinkPad-T480s>

CCing people working on Xen+VirtIO and IOREQs. Not trimming the original
email to let them read the full context.

My comments below are related to a potential Xen implementation, not
because it is the only implementation that matters, but because it is
the one I know best.

Also, please see this relevant email thread:
https://marc.info/?l=xen-devel&m=162373754705233&w=2


On Wed, 4 Aug 2021, Alex Bennée wrote:
> Hi,
> 
> One of the goals of Project Stratos is to enable hypervisor agnostic
> backends so we can enable as much re-use of code as possible and avoid
> repeating ourselves. This is the flip side of the front end where
> multiple front-end implementations are required - one per OS, assuming
> you don't just want Linux guests. The resultant guests are trivially
> movable between hypervisors modulo any abstracted paravirt type
> interfaces.
> 
> In my original thumb nail sketch of a solution I envisioned vhost-user
> daemons running in a broadly POSIX like environment. The interface to
> the daemon is fairly simple requiring only some mapped memory and some
> sort of signalling for events (on Linux this is eventfd). The idea was a
> stub binary would be responsible for any hypervisor specific setup and
> then launch a common binary to deal with the actual virtqueue requests
> themselves.
> 
> Since that original sketch we've seen an expansion in the sort of ways
> backends could be created. There is interest in encapsulating backends
> in RTOSes or unikernels for solutions like SCMI. There interest in Rust
> has prompted ideas of using the trait interface to abstract differences
> away as well as the idea of bare-metal Rust backends.
> 
> We have a card (STR-12) called "Hypercall Standardisation" which
> calls for a description of the APIs needed from the hypervisor side to
> support VirtIO guests and their backends. However we are some way off
> from that at the moment as I think we need to at least demonstrate one
> portable backend before we start codifying requirements. To that end I
> want to think about what we need for a backend to function.
> 
> Configuration
> =============
> 
> In the type-2 setup this is typically fairly simple because the host
> system can orchestrate the various modules that make up the complete
> system. In the type-1 case (or even type-2 with delegated service VMs)
> we need some sort of mechanism to inform the backend VM about key
> details about the system:
> 
>   - where virt queue memory is in it's address space
>   - how it's going to receive (interrupt) and trigger (kick) events
>   - what (if any) resources the backend needs to connect to
> 
> Obviously you can elide over configuration issues by having static
> configurations and baking the assumptions into your guest images however
> this isn't scalable in the long term. The obvious solution seems to be
> extending a subset of Device Tree data to user space but perhaps there
> are other approaches?
> 
> Before any virtio transactions can take place the appropriate memory
> mappings need to be made between the FE guest and the BE guest.

> Currently the whole of the FE guests address space needs to be visible
> to whatever is serving the virtio requests. I can envision 3 approaches:
> 
>  * BE guest boots with memory already mapped
> 
>  This would entail the guest OS knowing where in it's Guest Physical
>  Address space is already taken up and avoiding clashing. I would assume
>  in this case you would want a standard interface to userspace to then
>  make that address space visible to the backend daemon.
> 
>  * BE guests boots with a hypervisor handle to memory
> 
>  The BE guest is then free to map the FE's memory to where it wants in
>  the BE's guest physical address space.

I cannot see how this could work for Xen. There is no "handle" to give
to the backend if the backend is not running in dom0. So for Xen I think
the memory has to be already mapped and the mapping probably done by the
toolstack (also see below.) Or we would have to invent a new Xen
hypervisor interface and Xen virtual machine privileges to allow this
kind of mapping.

If we run the backend in Dom0 that we have no problems of course.


> To activate the mapping will
>  require some sort of hypercall to the hypervisor. I can see two options
>  at this point:
> 
>   - expose the handle to userspace for daemon/helper to trigger the
>     mapping via existing hypercall interfaces. If using a helper you
>     would have a hypervisor specific one to avoid the daemon having to
>     care too much about the details or push that complexity into a
>     compile time option for the daemon which would result in different
>     binaries although a common source base.
> 
>   - expose a new kernel ABI to abstract the hypercall differences away
>     in the guest kernel. In this case the userspace would essentially
>     ask for an abstract "map guest N memory to userspace ptr" and let
>     the kernel deal with the different hypercall interfaces. This of
>     course assumes the majority of BE guests would be Linux kernels and
>     leaves the bare-metal/unikernel approaches to their own devices.
> 
> Operation
> =========
> 
> The core of the operation of VirtIO is fairly simple. Once the
> vhost-user feature negotiation is done it's a case of receiving update
> events and parsing the resultant virt queue for data. The vhost-user
> specification handles a bunch of setup before that point, mostly to
> detail where the virt queues are set up FD's for memory and event
> communication. This is where the envisioned stub process would be
> responsible for getting the daemon up and ready to run. This is
> currently done inside a big VMM like QEMU but I suspect a modern
> approach would be to use the rust-vmm vhost crate. It would then either
> communicate with the kernel's abstracted ABI or be re-targeted as a
> build option for the various hypervisors.

One thing I mentioned before to Alex is that Xen doesn't have VMMs the
way they are typically envisioned and described in other environments.
Instead, Xen has IOREQ servers. Each of them connects independently to
Xen via the IOREQ interface. E.g. today multiple QEMUs could be used as
emulators for a single Xen VM, each of them connecting to Xen
independently via the IOREQ interface.

The component responsible for starting a daemon and/or setting up shared
interfaces is the toolstack: the xl command and the libxl/libxc
libraries.

Oleksandr and others I CCed have been working on ways for the toolstack
to create virtio backends and setup memory mappings. They might be able
to provide more info on the subject. I do think we miss a way to provide
the configuration to the backend and anything else that the backend
might require to start doing its job.


> One question is how to best handle notification and kicks. The existing
> vhost-user framework uses eventfd to signal the daemon (although QEMU
> is quite capable of simulating them when you use TCG). Xen has it's own
> IOREQ mechanism. However latency is an important factor and having
> events go through the stub would add quite a lot.

Yeah I think, regardless of anything else, we want the backends to
connect directly to the Xen hypervisor.


> Could we consider the kernel internally converting IOREQ messages from
> the Xen hypervisor to eventfd events? Would this scale with other kernel
> hypercall interfaces?
> 
> So any thoughts on what directions are worth experimenting with?
 
One option we should consider is for each backend to connect to Xen via
the IOREQ interface. We could generalize the IOREQ interface and make it
hypervisor agnostic. The interface is really trivial and easy to add.
The only Xen-specific part is the notification mechanism, which is an
event channel. If we replaced the event channel with something else the
interface would be generic. See:
https://gitlab.com/xen-project/xen/-/blob/staging/xen/include/public/hvm/ioreq.h#L52

I don't think that translating IOREQs to eventfd in the kernel is a
good idea: if feels like it would be extra complexity and that the
kernel shouldn't be involved as this is a backend-hypervisor interface.
Also, eventfd is very Linux-centric and we are trying to design an
interface that could work well for RTOSes too. If we want to do
something different, both OS-agnostic and hypervisor-agnostic, perhaps
we could design a new interface. One that could be implementable in the
Xen hypervisor itself (like IOREQ) and of course any other hypervisor
too.


There is also another problem. IOREQ is probably not be the only
interface needed. Have a look at
https://marc.info/?l=xen-devel&m=162373754705233&w=2. Don't we also need
an interface for the backend to inject interrupts into the frontend? And
if the backend requires dynamic memory mappings of frontend pages, then
we would also need an interface to map/unmap domU pages.

These interfaces are a lot more problematic than IOREQ: IOREQ is tiny
and self-contained. It is easy to add anywhere. A new interface to
inject interrupts or map pages is more difficult to manage because it
would require changes scattered across the various emulators.
--8323329-1515917732-1628099743=:9768--

