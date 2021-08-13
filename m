Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C81503EAF86
	for <lists+xen-devel@lfdr.de>; Fri, 13 Aug 2021 07:12:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166628.304145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEPT1-00042Z-Su; Fri, 13 Aug 2021 05:10:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166628.304145; Fri, 13 Aug 2021 05:10:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEPT1-0003zz-Pu; Fri, 13 Aug 2021 05:10:51 +0000
Received: by outflank-mailman (input) for mailman id 166628;
 Fri, 13 Aug 2021 05:10:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fUGX=NE=linaro.org=takahiro.akashi@srs-us1.protection.inumbo.net>)
 id 1mEPT0-0003zt-CS
 for xen-devel@lists.xen.org; Fri, 13 Aug 2021 05:10:50 +0000
Received: from mail-pl1-x62b.google.com (unknown [2607:f8b0:4864:20::62b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e4eb541-7f29-47ee-b1d0-0e04e3daf6d1;
 Fri, 13 Aug 2021 05:10:46 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id e19so10338131pla.10
 for <xen-devel@lists.xen.org>; Thu, 12 Aug 2021 22:10:46 -0700 (PDT)
Received: from laputa (pdb6272e8.tkyea130.ap.so-net.ne.jp. [219.98.114.232])
 by smtp.gmail.com with ESMTPSA id g19sm475037pjl.25.2021.08.12.22.10.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 22:10:45 -0700 (PDT)
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
X-Inumbo-ID: 1e4eb541-7f29-47ee-b1d0-0e04e3daf6d1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=uDve4X7h8e8+uUqd0ZdOH0jv/o3f2LQrqEakHw/ja08=;
        b=TB/x0SMvGRKPYfx1/6yzgN0De41ffm8XOyPB8zlAoEwQAiejjn3/2NwiLRHC6THP5L
         zI5GYwAfCZ9A46FUZnkZ4X3hr3p3HHxykfjZyR/gs7lcBErQ9zjV2u1bYMSi084uWeUV
         lRbpQ/g5rnGHhSnvp5ROkllQRhABt3w8nru6n4KvvIOtppTDsdw4AGAyuhZt6/h6NVev
         neJsp4LugUF4hmd/prqZDOj3DX/tce5/YswRb5LCVGIh/Rx5F/q3oubrFIOpyYt7MJYY
         DOQ/znqdcEyL9lBAcK8QxkgUyVv1cFY+XSGQgzaw7MrLeZcjRsfdBHGY3gpwjak4boy+
         Spiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=uDve4X7h8e8+uUqd0ZdOH0jv/o3f2LQrqEakHw/ja08=;
        b=o0Z9rMJNXX2MmGX9/pgnFdrTxhF3PmBwfwJ/1Zo5nLeMUGa6NhuZm+QhiGPKgIGdr8
         E32mv1WyybS139wEwb8BdaLf0NiMLSOeMDzBlJv843OybBIpzXh8SgtDj4oekY85XD/w
         +N8TILPg45ZNc4t0Se56kqB2I9lQHTBLDXBSMxE4anWri4yFtqUAVCckJqkQ0Nl/5qvJ
         OU1CvPNSdI1vH3lI4O+5uPdPnqxLFiyNU1syripqTjSMalH/n7QCVFC0KxzP9LSFhmVS
         3pbUWA5NmbBQZLZAbZ66jYbojKoiG1jwdjPZ/bSPnYWaB5wy+ZjVdr3Xin83as7WemOx
         WdGg==
X-Gm-Message-State: AOAM5333bqFfGDJw0ZHzdNPAcD0BLzKy4hOlrfNUau0pShQ3e5nEuuDa
	sZtiR3TXh3FpLrfsnT28UJn5Qw==
X-Google-Smtp-Source: ABdhPJyif4UnArl6HX/KgdVqwjCT4kmq89eYVfXEoyFzqHtVpSsjLxuY9Iiz8QRWCQcvnrVOoBOFVQ==
X-Received: by 2002:a17:90a:2f88:: with SMTP id t8mr860094pjd.2.1628831445717;
        Thu, 12 Aug 2021 22:10:45 -0700 (PDT)
Date: Fri, 13 Aug 2021 14:10:38 +0900
From: AKASHI Takahiro <takahiro.akashi@linaro.org>
To: Fran??ois Ozog <francois.ozog@linaro.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, paul@xen.org,
	Stratos Mailing List <stratos-dev@op-lists.linaro.org>,
	virtio-dev@lists.oasis-open.org,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Arnd Bergmann <arnd.bergmann@linaro.org>, jgross@suse.com,
	julien@xen.org, Carl van Schaik <cvanscha@qti.qualcomm.com>,
	Bertrand.Marquis@arm.com, stefanha@redhat.com,
	Artem_Mygaiev@epam.com, xen-devel@lists.xen.org,
	olekstysh@gmail.com, Oleksandr_Tyshchenko@epam.com
Subject: Re: [Stratos-dev] Enabling hypervisor agnosticism for VirtIO backends
Message-ID: <20210813051038.GA77540@laputa>
References: <87v94ldrqq.fsf@linaro.org>
 <alpine.DEB.2.21.2108041055390.9768@sstabellini-ThinkPad-T480s>
 <0100017b33e585a5-06d4248e-b1a7-485e-800c-7ead89e5f916-000000@email.amazonses.com>
 <CAHFG_=WKjJ1riKtaWC8jm13shc3RtVsNNqd3j9WD9Fq0NeRS2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHFG_=WKjJ1riKtaWC8jm13shc3RtVsNNqd3j9WD9Fq0NeRS2Q@mail.gmail.com>

Hi François,

On Thu, Aug 12, 2021 at 09:55:52AM +0200, Fran??ois Ozog wrote:
> I top post as I find it difficult to identify where to make the comments.

Thank you for the posting. 
I think that we should first discuss more about the goal/requirements/
practical use cases for the framework.

> 1) BE acceleration
> Network and storage backends may actually be executed in SmartNICs. As
> virtio 1.1 is hardware friendly, there may be SmartNICs with virtio 1.1 PCI
> VFs. Is it a valid use case for the generic BE framework to be used in this
> context?
> DPDK is used in some BE to significantly accelerate switching. DPDK is also
> used sometimes in guests. In that case, there are no event injection but
> just high performance memory scheme. Is this considered as a use case?

I'm not quite familiar with DPDK but it seems to be heavily reliant
on not only virtqueues but also kvm/linux features/functionality, say,
according to [1].
I'm afraid that DPDK is not suitable for primary (at least, initial)
target use.
# In my proposal, virtio-proxy, I have in mind the assumption that we would
# create BE VM as a baremetal application on RTOS (and/or unikernel.)

But as far as virtqueue is concerned, I think we can discuss in general
technical details as Alex suggested, including:
- sharing or mapping memory regions for data payload
- efficient notification mechanism

[1] https://www.redhat.com/en/blog/journey-vhost-users-realm

> 2) Virtio as OS HAL
> Panasonic CTO has been calling for a virtio based HAL and based on the
> teachings of Google GKI, an internal HAL seem inevitable in the long term.
> Virtio is then a contender to Google promoted Android HAL. Could the
> framework be used in that context?

In this case, where will the implementation of "HAL" reside?
I don't think the portability of "HAL" code (as a set of virtio BEs)
is a requirement here.

-Takahiro Akashi

> On Wed, 11 Aug 2021 at 08:28, AKASHI Takahiro via Stratos-dev <
> stratos-dev@op-lists.linaro.org> wrote:
> 
> > On Wed, Aug 04, 2021 at 12:20:01PM -0700, Stefano Stabellini wrote:
> > > CCing people working on Xen+VirtIO and IOREQs. Not trimming the original
> > > email to let them read the full context.
> > >
> > > My comments below are related to a potential Xen implementation, not
> > > because it is the only implementation that matters, but because it is
> > > the one I know best.
> >
> > Please note that my proposal (and hence the working prototype)[1]
> > is based on Xen's virtio implementation (i.e. IOREQ) and particularly
> > EPAM's virtio-disk application (backend server).
> > It has been, I believe, well generalized but is still a bit biased
> > toward this original design.
> >
> > So I hope you like my approach :)
> >
> > [1]
> > https://op-lists.linaro.org/pipermail/stratos-dev/2021-August/000546.html
> >
> > Let me take this opportunity to explain a bit more about my approach below.
> >
> > > Also, please see this relevant email thread:
> > > https://marc.info/?l=xen-devel&m=162373754705233&w=2
> > >
> > >
> > > On Wed, 4 Aug 2021, Alex Bennée wrote:
> > > > Hi,
> > > >
> > > > One of the goals of Project Stratos is to enable hypervisor agnostic
> > > > backends so we can enable as much re-use of code as possible and avoid
> > > > repeating ourselves. This is the flip side of the front end where
> > > > multiple front-end implementations are required - one per OS, assuming
> > > > you don't just want Linux guests. The resultant guests are trivially
> > > > movable between hypervisors modulo any abstracted paravirt type
> > > > interfaces.
> > > >
> > > > In my original thumb nail sketch of a solution I envisioned vhost-user
> > > > daemons running in a broadly POSIX like environment. The interface to
> > > > the daemon is fairly simple requiring only some mapped memory and some
> > > > sort of signalling for events (on Linux this is eventfd). The idea was
> > a
> > > > stub binary would be responsible for any hypervisor specific setup and
> > > > then launch a common binary to deal with the actual virtqueue requests
> > > > themselves.
> > > >
> > > > Since that original sketch we've seen an expansion in the sort of ways
> > > > backends could be created. There is interest in encapsulating backends
> > > > in RTOSes or unikernels for solutions like SCMI. There interest in Rust
> > > > has prompted ideas of using the trait interface to abstract differences
> > > > away as well as the idea of bare-metal Rust backends.
> > > >
> > > > We have a card (STR-12) called "Hypercall Standardisation" which
> > > > calls for a description of the APIs needed from the hypervisor side to
> > > > support VirtIO guests and their backends. However we are some way off
> > > > from that at the moment as I think we need to at least demonstrate one
> > > > portable backend before we start codifying requirements. To that end I
> > > > want to think about what we need for a backend to function.
> > > >
> > > > Configuration
> > > > =============
> > > >
> > > > In the type-2 setup this is typically fairly simple because the host
> > > > system can orchestrate the various modules that make up the complete
> > > > system. In the type-1 case (or even type-2 with delegated service VMs)
> > > > we need some sort of mechanism to inform the backend VM about key
> > > > details about the system:
> > > >
> > > >   - where virt queue memory is in it's address space
> > > >   - how it's going to receive (interrupt) and trigger (kick) events
> > > >   - what (if any) resources the backend needs to connect to
> > > >
> > > > Obviously you can elide over configuration issues by having static
> > > > configurations and baking the assumptions into your guest images
> > however
> > > > this isn't scalable in the long term. The obvious solution seems to be
> > > > extending a subset of Device Tree data to user space but perhaps there
> > > > are other approaches?
> > > >
> > > > Before any virtio transactions can take place the appropriate memory
> > > > mappings need to be made between the FE guest and the BE guest.
> > >
> > > > Currently the whole of the FE guests address space needs to be visible
> > > > to whatever is serving the virtio requests. I can envision 3
> > approaches:
> > > >
> > > >  * BE guest boots with memory already mapped
> > > >
> > > >  This would entail the guest OS knowing where in it's Guest Physical
> > > >  Address space is already taken up and avoiding clashing. I would
> > assume
> > > >  in this case you would want a standard interface to userspace to then
> > > >  make that address space visible to the backend daemon.
> >
> > Yet another way here is that we would have well known "shared memory"
> > between
> > VMs. I think that Jailhouse's ivshmem gives us good insights on this matter
> > and that it can even be an alternative for hypervisor-agnostic solution.
> >
> > (Please note memory regions in ivshmem appear as a PCI device and can be
> > mapped locally.)
> >
> > I want to add this shared memory aspect to my virtio-proxy, but
> > the resultant solution would eventually look similar to ivshmem.
> >
> > > >  * BE guests boots with a hypervisor handle to memory
> > > >
> > > >  The BE guest is then free to map the FE's memory to where it wants in
> > > >  the BE's guest physical address space.
> > >
> > > I cannot see how this could work for Xen. There is no "handle" to give
> > > to the backend if the backend is not running in dom0. So for Xen I think
> > > the memory has to be already mapped
> >
> > In Xen's IOREQ solution (virtio-blk), the following information is expected
> > to be exposed to BE via Xenstore:
> > (I know that this is a tentative approach though.)
> >    - the start address of configuration space
> >    - interrupt number
> >    - file path for backing storage
> >    - read-only flag
> > And the BE server have to call a particular hypervisor interface to
> > map the configuration space.
> >
> > In my approach (virtio-proxy), all those Xen (or hypervisor)-specific
> > stuffs are contained in virtio-proxy, yet another VM, to hide all details.
> >
> > # My point is that a "handle" is not mandatory for executing mapping.
> >
> > > and the mapping probably done by the
> > > toolstack (also see below.) Or we would have to invent a new Xen
> > > hypervisor interface and Xen virtual machine privileges to allow this
> > > kind of mapping.
> >
> > > If we run the backend in Dom0 that we have no problems of course.
> >
> > One of difficulties on Xen that I found in my approach is that calling
> > such hypervisor intefaces (registering IOREQ, mapping memory) is only
> > allowed on BE servers themselvies and so we will have to extend those
> > interfaces.
> > This, however, will raise some concern on security and privilege
> > distribution
> > as Stefan suggested.
> > >
> > >
> > > > To activate the mapping will
> > > >  require some sort of hypercall to the hypervisor. I can see two
> > options
> > > >  at this point:
> > > >
> > > >   - expose the handle to userspace for daemon/helper to trigger the
> > > >     mapping via existing hypercall interfaces. If using a helper you
> > > >     would have a hypervisor specific one to avoid the daemon having to
> > > >     care too much about the details or push that complexity into a
> > > >     compile time option for the daemon which would result in different
> > > >     binaries although a common source base.
> > > >
> > > >   - expose a new kernel ABI to abstract the hypercall differences away
> > > >     in the guest kernel. In this case the userspace would essentially
> > > >     ask for an abstract "map guest N memory to userspace ptr" and let
> > > >     the kernel deal with the different hypercall interfaces. This of
> > > >     course assumes the majority of BE guests would be Linux kernels and
> > > >     leaves the bare-metal/unikernel approaches to their own devices.
> > > >
> > > > Operation
> > > > =========
> > > >
> > > > The core of the operation of VirtIO is fairly simple. Once the
> > > > vhost-user feature negotiation is done it's a case of receiving update
> > > > events and parsing the resultant virt queue for data. The vhost-user
> > > > specification handles a bunch of setup before that point, mostly to
> > > > detail where the virt queues are set up FD's for memory and event
> > > > communication. This is where the envisioned stub process would be
> > > > responsible for getting the daemon up and ready to run. This is
> > > > currently done inside a big VMM like QEMU but I suspect a modern
> > > > approach would be to use the rust-vmm vhost crate. It would then either
> > > > communicate with the kernel's abstracted ABI or be re-targeted as a
> > > > build option for the various hypervisors.
> > >
> > > One thing I mentioned before to Alex is that Xen doesn't have VMMs the
> > > way they are typically envisioned and described in other environments.
> > > Instead, Xen has IOREQ servers. Each of them connects independently to
> > > Xen via the IOREQ interface. E.g. today multiple QEMUs could be used as
> > > emulators for a single Xen VM, each of them connecting to Xen
> > > independently via the IOREQ interface.
> > >
> > > The component responsible for starting a daemon and/or setting up shared
> > > interfaces is the toolstack: the xl command and the libxl/libxc
> > > libraries.
> >
> > I think that VM configuration management (or orchestration in Startos
> > jargon?) is a subject to debate in parallel.
> > Otherwise, is there any good assumption to avoid it right now?
> >
> > > Oleksandr and others I CCed have been working on ways for the toolstack
> > > to create virtio backends and setup memory mappings. They might be able
> > > to provide more info on the subject. I do think we miss a way to provide
> > > the configuration to the backend and anything else that the backend
> > > might require to start doing its job.
> > >
> > >
> > > > One question is how to best handle notification and kicks. The existing
> > > > vhost-user framework uses eventfd to signal the daemon (although QEMU
> > > > is quite capable of simulating them when you use TCG). Xen has it's own
> > > > IOREQ mechanism. However latency is an important factor and having
> > > > events go through the stub would add quite a lot.
> > >
> > > Yeah I think, regardless of anything else, we want the backends to
> > > connect directly to the Xen hypervisor.
> >
> > In my approach,
> >  a) BE -> FE: interrupts triggered by BE calling a hypervisor interface
> >               via virtio-proxy
> >  b) FE -> BE: MMIO to config raises events (in event channels), which is
> >               converted to a callback to BE via virtio-proxy
> >               (Xen's event channel is internnally implemented by
> > interrupts.)
> >
> > I don't know what "connect directly" means here, but sending interrupts
> > to the opposite side would be best efficient.
> > Ivshmem, I suppose, takes this approach by utilizing PCI's msi-x mechanism.
> >
> > >
> > > > Could we consider the kernel internally converting IOREQ messages from
> > > > the Xen hypervisor to eventfd events? Would this scale with other
> > kernel
> > > > hypercall interfaces?
> > > >
> > > > So any thoughts on what directions are worth experimenting with?
> > >
> > > One option we should consider is for each backend to connect to Xen via
> > > the IOREQ interface. We could generalize the IOREQ interface and make it
> > > hypervisor agnostic. The interface is really trivial and easy to add.
> >
> > As I said above, my proposal does the same thing that you mentioned here :)
> > The difference is that I do call hypervisor interfaces via virtio-proxy.
> >
> > > The only Xen-specific part is the notification mechanism, which is an
> > > event channel. If we replaced the event channel with something else the
> > > interface would be generic. See:
> > >
> > https://gitlab.com/xen-project/xen/-/blob/staging/xen/include/public/hvm/ioreq.h#L52
> > >
> > > I don't think that translating IOREQs to eventfd in the kernel is a
> > > good idea: if feels like it would be extra complexity and that the
> > > kernel shouldn't be involved as this is a backend-hypervisor interface.
> >
> > Given that we may want to implement BE as a bare-metal application
> > as I did on Zephyr, I don't think that the translation would not be
> > a big issue, especially on RTOS's.
> > It will be some kind of abstraction layer of interrupt handling
> > (or nothing but a callback mechanism).
> >
> > > Also, eventfd is very Linux-centric and we are trying to design an
> > > interface that could work well for RTOSes too. If we want to do
> > > something different, both OS-agnostic and hypervisor-agnostic, perhaps
> > > we could design a new interface. One that could be implementable in the
> > > Xen hypervisor itself (like IOREQ) and of course any other hypervisor
> > > too.
> > >
> > >
> > > There is also another problem. IOREQ is probably not be the only
> > > interface needed. Have a look at
> > > https://marc.info/?l=xen-devel&m=162373754705233&w=2. Don't we also need
> > > an interface for the backend to inject interrupts into the frontend? And
> > > if the backend requires dynamic memory mappings of frontend pages, then
> > > we would also need an interface to map/unmap domU pages.
> >
> > My proposal document might help here; All the interfaces required for
> > virtio-proxy (or hypervisor-related interfaces) are listed as
> > RPC protocols :)
> >
> > > These interfaces are a lot more problematic than IOREQ: IOREQ is tiny
> > > and self-contained. It is easy to add anywhere. A new interface to
> > > inject interrupts or map pages is more difficult to manage because it
> > > would require changes scattered across the various emulators.
> >
> > Exactly. I have no confident yet that my approach will also apply
> > to other hypervisors than Xen.
> > Technically, yes, but whether people can accept it or not is a different
> > matter.
> >
> > Thanks,
> > -Takahiro Akashi
> >
> > --
> > Stratos-dev mailing list
> > Stratos-dev@op-lists.linaro.org
> > https://op-lists.linaro.org/mailman/listinfo/stratos-dev
> >
> 
> 
> -- 
> François-Frédéric Ozog | *Director Business Development*
> T: +33.67221.6485
> francois.ozog@linaro.org | Skype: ffozog

