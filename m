Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BE23EC398
	for <lists+xen-devel@lfdr.de>; Sat, 14 Aug 2021 17:38:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167007.304849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEvjW-0006Ch-Rs; Sat, 14 Aug 2021 15:38:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167007.304849; Sat, 14 Aug 2021 15:38:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEvjW-0006A7-O6; Sat, 14 Aug 2021 15:38:02 +0000
Received: by outflank-mailman (input) for mailman id 167007;
 Sat, 14 Aug 2021 15:38:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=itrD=NF=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mEvjV-00069W-Vc
 for xen-devel@lists.xen.org; Sat, 14 Aug 2021 15:38:02 +0000
Received: from mail-wm1-x335.google.com (unknown [2a00:1450:4864:20::335])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b4a4f1e7-543f-460e-9154-8e1b0aac7b0d;
 Sat, 14 Aug 2021 15:37:56 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 w21-20020a7bc1150000b02902e69ba66ce6so8804708wmi.1
 for <xen-devel@lists.xen.org>; Sat, 14 Aug 2021 08:37:56 -0700 (PDT)
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
X-Inumbo-ID: b4a4f1e7-543f-460e-9154-8e1b0aac7b0d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=URJcXGL0b260lpuAUm45ktGMt5jJtT0HI4iDrItDnyY=;
        b=UdqzIZCiHFb0/E8NimEPMKjyTzpLCw3iPYszSSQUtzaJQdeLih7Ser5CJmA5Q9K6g6
         HYRSz3llSG2NTqlK8HBixS8lxmNkY6tv6QxrF+fX4KVj3w+0cBrF3dfiwzAvaTkvFRl9
         SnYDYQnnPG2Dds6v+rI+KFyLcjT9ClMbhXwvFY/Zv20EfqaHJPuK1Z0h/9lro3k7/OIp
         XxqvlAU2weQP5DY1d/L0kw45cGdP5VRu5ZKzKnG+ez+IxciIYLtgBzoE8QUegATvDBcS
         tHJI4JwITkJwkEf7qPV3vDTQci6tIFTS9T3C6A14AYKA/uEKg8gotSDxJU7WFMZB1Iaa
         QaEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=URJcXGL0b260lpuAUm45ktGMt5jJtT0HI4iDrItDnyY=;
        b=mb3em9uAvkO3MwjkdB1+wpSQdInN3eVAn00pGuBWEIQbVJV3x92BtuJpjvZq+lh6ce
         20azLYXkRf25XYX2JBGEVYMF57McaLOymRdBumgzgjJ+RfmgAAoL/Gn14VC8Du4oFxJ2
         NZSsusF9RDEdRWn3v61esGeFzjtQJqlPzRN0r1B4JRyArQmAHxuYGB/FfcBskxdv5ZBY
         r+I/FgbndwrgfP8fowpv8f+a15hNFbVjS9tvkg8cXVbXxoZWgcVBvs5s37wvwhg1I6Ea
         XQxqMmLtVPvtsi91ulIt+klOI2sU19P4peAFXjtsqUcrLFmW164Kw9KXuKBigF8Tk9rx
         haFg==
X-Gm-Message-State: AOAM5305ZzAb+sdYWB6xeAc21zUeqEtj3GP8TxQiBxP8VR19P/zP/z49
	JSBxeNjKDKSfOO558LVq62uaEsLQTJHphGxaUVU=
X-Google-Smtp-Source: ABdhPJwgcMwHzRft+Q+Du7nRaw6pyVw43I1+Fv7DubGUgEhKGbmlAFMxtdinuh2+ZWyZS6hcjs6dVFK1kkq6PPOGaCk=
X-Received: by 2002:a1c:7503:: with SMTP id o3mr7833835wmc.129.1628955475705;
 Sat, 14 Aug 2021 08:37:55 -0700 (PDT)
MIME-Version: 1.0
References: <87v94ldrqq.fsf@linaro.org> <alpine.DEB.2.21.2108041055390.9768@sstabellini-ThinkPad-T480s>
 <20210811062748.GB54169@laputa>
In-Reply-To: <20210811062748.GB54169@laputa>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Date: Sat, 14 Aug 2021 18:37:44 +0300
Message-ID: <CAPD2p-mMeY=MDbAdLGrmmioSkJo147aMDrK=Qzr=PCa4jztGGg@mail.gmail.com>
Subject: Re: Enabling hypervisor agnosticism for VirtIO backends
To: AKASHI Takahiro <takahiro.akashi@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: "Alex Benn??e" <alex.bennee@linaro.org>, 
	Stratos Mailing List <stratos-dev@op-lists.linaro.org>, virtio-dev@lists.oasis-open.org, 
	Arnd Bergmann <arnd.bergmann@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Stefano Stabellini <stefano.stabellini@xilinx.com>, stefanha@redhat.com, 
	Jan Kiszka <jan.kiszka@siemens.com>, Carl van Schaik <cvanscha@qti.qualcomm.com>, pratikp@quicinc.com, 
	Srivatsa Vaddagiri <vatsa@codeaurora.org>, Jean-Philippe Brucker <jean-philippe@linaro.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Wei Chen <Wei.Chen@arm.com>, 
	Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>, 
	Artem Mygaiev <Artem_Mygaiev@epam.com>, Julien Grall <julien@xen.org>, Juergen Gross <jgross@suse.com>, 
	Paul Durrant <paul@xen.org>, Xen Devel <xen-devel@lists.xen.org>
Content-Type: multipart/alternative; boundary="0000000000007c03fa05c986c0a8"

--0000000000007c03fa05c986c0a8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello, all.

Please see some comments below. And sorry for the possible format issues.

On Wed, Aug 11, 2021 at 9:27 AM AKASHI Takahiro <takahiro.akashi@linaro.org=
>
wrote:

> On Wed, Aug 04, 2021 at 12:20:01PM -0700, Stefano Stabellini wrote:
> > CCing people working on Xen+VirtIO and IOREQs. Not trimming the origina=
l
> > email to let them read the full context.
> >
> > My comments below are related to a potential Xen implementation, not
> > because it is the only implementation that matters, but because it is
> > the one I know best.
>
> Please note that my proposal (and hence the working prototype)[1]
> is based on Xen's virtio implementation (i.e. IOREQ) and particularly
> EPAM's virtio-disk application (backend server).
> It has been, I believe, well generalized but is still a bit biased
> toward this original design.
>
> So I hope you like my approach :)
>
> [1]
> https://op-lists.linaro.org/pipermail/stratos-dev/2021-August/000546.html
>
> Let me take this opportunity to explain a bit more about my approach belo=
w.
>
> > Also, please see this relevant email thread:
> > https://marc.info/?l=3Dxen-devel&m=3D162373754705233&w=3D2
> >
> >
> > On Wed, 4 Aug 2021, Alex Benn=C3=A9e wrote:
> > > Hi,
> > >
> > > One of the goals of Project Stratos is to enable hypervisor agnostic
> > > backends so we can enable as much re-use of code as possible and avoi=
d
> > > repeating ourselves. This is the flip side of the front end where
> > > multiple front-end implementations are required - one per OS, assumin=
g
> > > you don't just want Linux guests. The resultant guests are trivially
> > > movable between hypervisors modulo any abstracted paravirt type
> > > interfaces.
> > >
> > > In my original thumb nail sketch of a solution I envisioned vhost-use=
r
> > > daemons running in a broadly POSIX like environment. The interface to
> > > the daemon is fairly simple requiring only some mapped memory and som=
e
> > > sort of signalling for events (on Linux this is eventfd). The idea wa=
s
> a
> > > stub binary would be responsible for any hypervisor specific setup an=
d
> > > then launch a common binary to deal with the actual virtqueue request=
s
> > > themselves.
> > >
> > > Since that original sketch we've seen an expansion in the sort of way=
s
> > > backends could be created. There is interest in encapsulating backend=
s
> > > in RTOSes or unikernels for solutions like SCMI. There interest in Ru=
st
> > > has prompted ideas of using the trait interface to abstract differenc=
es
> > > away as well as the idea of bare-metal Rust backends.
> > >
> > > We have a card (STR-12) called "Hypercall Standardisation" which
> > > calls for a description of the APIs needed from the hypervisor side t=
o
> > > support VirtIO guests and their backends. However we are some way off
> > > from that at the moment as I think we need to at least demonstrate on=
e
> > > portable backend before we start codifying requirements. To that end =
I
> > > want to think about what we need for a backend to function.
> > >
> > > Configuration
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >
> > > In the type-2 setup this is typically fairly simple because the host
> > > system can orchestrate the various modules that make up the complete
> > > system. In the type-1 case (or even type-2 with delegated service VMs=
)
> > > we need some sort of mechanism to inform the backend VM about key
> > > details about the system:
> > >
> > >   - where virt queue memory is in it's address space
> > >   - how it's going to receive (interrupt) and trigger (kick) events
> > >   - what (if any) resources the backend needs to connect to
> > >
> > > Obviously you can elide over configuration issues by having static
> > > configurations and baking the assumptions into your guest images
> however
> > > this isn't scalable in the long term. The obvious solution seems to b=
e
> > > extending a subset of Device Tree data to user space but perhaps ther=
e
> > > are other approaches?
> > >
> > > Before any virtio transactions can take place the appropriate memory
> > > mappings need to be made between the FE guest and the BE guest.
> >
> > > Currently the whole of the FE guests address space needs to be visibl=
e
> > > to whatever is serving the virtio requests. I can envision 3
> approaches:
> > >
> > >  * BE guest boots with memory already mapped
> > >
> > >  This would entail the guest OS knowing where in it's Guest Physical
> > >  Address space is already taken up and avoiding clashing. I would
> assume
> > >  in this case you would want a standard interface to userspace to the=
n
> > >  make that address space visible to the backend daemon.
>
> Yet another way here is that we would have well known "shared memory"
> between
> VMs. I think that Jailhouse's ivshmem gives us good insights on this matt=
er
> and that it can even be an alternative for hypervisor-agnostic solution.
>
> (Please note memory regions in ivshmem appear as a PCI device and can be
> mapped locally.)
>
> I want to add this shared memory aspect to my virtio-proxy, but
> the resultant solution would eventually look similar to ivshmem.
>
> > >  * BE guests boots with a hypervisor handle to memory
> > >
> > >  The BE guest is then free to map the FE's memory to where it wants i=
n
> > >  the BE's guest physical address space.
> >
> > I cannot see how this could work for Xen. There is no "handle" to give
> > to the backend if the backend is not running in dom0. So for Xen I thin=
k
> > the memory has to be already mapped
>
> In Xen's IOREQ solution (virtio-blk), the following information is expect=
ed
> to be exposed to BE via Xenstore:
> (I know that this is a tentative approach though.)
>    - the start address of configuration space
>    - interrupt number
>    - file path for backing storage
>    - read-only flag
> And the BE server have to call a particular hypervisor interface to
> map the configuration space.
>

Yes, Xenstore was chosen as a simple way to pass configuration info to the
backend running in a non-toolstack domain.
I remember, there was a wish to avoid using Xenstore in Virtio backend
itself if possible, so for non-toolstack domain, this could done with
adjusting devd (daemon that listens for devices and launches backends)
to read backend configuration from the Xenstore anyway and pass it to the
backend via command line arguments.

But, if ...


>
> In my approach (virtio-proxy), all those Xen (or hypervisor)-specific
> stuffs are contained in virtio-proxy, yet another VM, to hide all details=
.
>

... the solution how to overcome that is already found and proven to work
then even better.



>
> # My point is that a "handle" is not mandatory for executing mapping.
>
> > and the mapping probably done by the
> > toolstack (also see below.) Or we would have to invent a new Xen
> > hypervisor interface and Xen virtual machine privileges to allow this
> > kind of mapping.
>
> > If we run the backend in Dom0 that we have no problems of course.
>
> One of difficulties on Xen that I found in my approach is that calling
> such hypervisor intefaces (registering IOREQ, mapping memory) is only
> allowed on BE servers themselvies and so we will have to extend those
> interfaces.
> This, however, will raise some concern on security and privilege
> distribution
> as Stefan suggested.
>

We also faced policy related issues with Virtio backend running in other
than Dom0 domain in a "dummy" xsm mode. In our target system we run the
backend in a driver
domain (we call it DomD) where the underlying H/W resides. We trust it, so
we wrote policy rules (to be used in "flask" xsm mode) to provide it with a
little bit more privileges than a simple DomU had.
Now it is permitted to issue device-model, resource and memory mappings,
etc calls.


> >
> >
> > > To activate the mapping will
> > >  require some sort of hypercall to the hypervisor. I can see two
> options
> > >  at this point:
> > >
> > >   - expose the handle to userspace for daemon/helper to trigger the
> > >     mapping via existing hypercall interfaces. If using a helper you
> > >     would have a hypervisor specific one to avoid the daemon having t=
o
> > >     care too much about the details or push that complexity into a
> > >     compile time option for the daemon which would result in differen=
t
> > >     binaries although a common source base.
> > >
> > >   - expose a new kernel ABI to abstract the hypercall differences awa=
y
> > >     in the guest kernel. In this case the userspace would essentially
> > >     ask for an abstract "map guest N memory to userspace ptr" and let
> > >     the kernel deal with the different hypercall interfaces. This of
> > >     course assumes the majority of BE guests would be Linux kernels a=
nd
> > >     leaves the bare-metal/unikernel approaches to their own devices.
> > >
> > > Operation
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >
> > > The core of the operation of VirtIO is fairly simple. Once the
> > > vhost-user feature negotiation is done it's a case of receiving updat=
e
> > > events and parsing the resultant virt queue for data. The vhost-user
> > > specification handles a bunch of setup before that point, mostly to
> > > detail where the virt queues are set up FD's for memory and event
> > > communication. This is where the envisioned stub process would be
> > > responsible for getting the daemon up and ready to run. This is
> > > currently done inside a big VMM like QEMU but I suspect a modern
> > > approach would be to use the rust-vmm vhost crate. It would then eith=
er
> > > communicate with the kernel's abstracted ABI or be re-targeted as a
> > > build option for the various hypervisors.
> >
> > One thing I mentioned before to Alex is that Xen doesn't have VMMs the
> > way they are typically envisioned and described in other environments.
> > Instead, Xen has IOREQ servers. Each of them connects independently to
> > Xen via the IOREQ interface. E.g. today multiple QEMUs could be used as
> > emulators for a single Xen VM, each of them connecting to Xen
> > independently via the IOREQ interface.
> >
> > The component responsible for starting a daemon and/or setting up share=
d
> > interfaces is the toolstack: the xl command and the libxl/libxc
> > libraries.
>
> I think that VM configuration management (or orchestration in Startos
> jargon?) is a subject to debate in parallel.
> Otherwise, is there any good assumption to avoid it right now?
>
> > Oleksandr and others I CCed have been working on ways for the toolstack
> > to create virtio backends and setup memory mappings. They might be able
> > to provide more info on the subject. I do think we miss a way to provid=
e
> > the configuration to the backend and anything else that the backend
> > might require to start doing its job.
>

Yes, some work has been done for the toolstack to handle Virtio MMIO
devices in
general and Virtio block devices in particular. However, it has not been
upstreaned yet.
Updated patches on review now:
https://lore.kernel.org/xen-devel/1621626361-29076-1-git-send-email-oleksty=
sh@gmail.com/

There is an additional (also important) activity to improve/fix foreign
memory mapping on Arm which I am also involved in.
The foreign memory mapping is proposed to be used for Virtio backends
(device emulators) if there is a need to run guest OS completely unmodified=
.
Of course, the more secure way would be to use grant memory mapping.
Brietly, the main difference between them is that with foreign mapping the
backend
can map any guest memory it wants to map, but with grant mapping it is
allowed to map only what was previously granted by the frontend.

So, there might be a problem if we want to pre-map some guest memory in
advance or to cache mappings in the backend in order to improve performance
(because the mapping/unmapping guest pages every request requires a lot of
back and forth to Xen + P2M updates). In a nutshell, currently, in order to
map a guest page into the backend address space we need to steal a real
physical page from the backend domain. So, with the said optimizations we
might end up with no free memory in the backend domain (see XSA-300).
And what we try to achieve is to not waste a real domain memory at all by
providing safe non-allocated-yet (so unused) address space for the foreign
(and grant) pages to be mapped into, this enabling work implies Xen and
Linux (and likely DTB bindings) changes. However, as it turned out, for
this to work in a proper and safe way some prereq work needs to be done.
You can find the related Xen discussion at:
https://lore.kernel.org/xen-devel/1627489110-25633-1-git-send-email-oleksty=
sh@gmail.com/



> >
> >
> > > One question is how to best handle notification and kicks. The existi=
ng
> > > vhost-user framework uses eventfd to signal the daemon (although QEMU
> > > is quite capable of simulating them when you use TCG). Xen has it's o=
wn
> > > IOREQ mechanism. However latency is an important factor and having
> > > events go through the stub would add quite a lot.
> >
> > Yeah I think, regardless of anything else, we want the backends to
> > connect directly to the Xen hypervisor.
>
> In my approach,
>  a) BE -> FE: interrupts triggered by BE calling a hypervisor interface
>               via virtio-proxy
>  b) FE -> BE: MMIO to config raises events (in event channels), which is
>               converted to a callback to BE via virtio-proxy
>               (Xen's event channel is internnally implemented by
> interrupts.)
>
> I don't know what "connect directly" means here, but sending interrupts
> to the opposite side would be best efficient.
> Ivshmem, I suppose, takes this approach by utilizing PCI's msi-x mechanis=
m.
>

Agree that MSI would be more efficient than SPI...
At the moment, in order to notify the frontend, the backend issues a
specific device-model call to query Xen to inject a corresponding SPI to
the guest.



>
> >
> > > Could we consider the kernel internally converting IOREQ messages fro=
m
> > > the Xen hypervisor to eventfd events? Would this scale with other
> kernel
> > > hypercall interfaces?
> > >
> > > So any thoughts on what directions are worth experimenting with?
> >
> > One option we should consider is for each backend to connect to Xen via
> > the IOREQ interface. We could generalize the IOREQ interface and make i=
t
> > hypervisor agnostic. The interface is really trivial and easy to add.
>
> As I said above, my proposal does the same thing that you mentioned here =
:)
> The difference is that I do call hypervisor interfaces via virtio-proxy.
>
> > The only Xen-specific part is the notification mechanism, which is an
> > event channel. If we replaced the event channel with something else the
> > interface would be generic. See:
> >
> https://gitlab.com/xen-project/xen/-/blob/staging/xen/include/public/hvm/=
ioreq.h#L52
> >
> > I don't think that translating IOREQs to eventfd in the kernel is a
> > good idea: if feels like it would be extra complexity and that the
> > kernel shouldn't be involved as this is a backend-hypervisor interface.
>
> Given that we may want to implement BE as a bare-metal application
> as I did on Zephyr, I don't think that the translation would not be
> a big issue, especially on RTOS's.
> It will be some kind of abstraction layer of interrupt handling
> (or nothing but a callback mechanism).
>
> > Also, eventfd is very Linux-centric and we are trying to design an
> > interface that could work well for RTOSes too. If we want to do
> > something different, both OS-agnostic and hypervisor-agnostic, perhaps
> > we could design a new interface. One that could be implementable in the
> > Xen hypervisor itself (like IOREQ) and of course any other hypervisor
> > too.
> >
> >
> > There is also another problem. IOREQ is probably not be the only
> > interface needed. Have a look at
> > https://marc.info/?l=3Dxen-devel&m=3D162373754705233&w=3D2. Don't we al=
so need
> > an interface for the backend to inject interrupts into the frontend? An=
d
> > if the backend requires dynamic memory mappings of frontend pages, then
> > we would also need an interface to map/unmap domU pages.
>
> My proposal document might help here; All the interfaces required for
> virtio-proxy (or hypervisor-related interfaces) are listed as
> RPC protocols :)
>
> > These interfaces are a lot more problematic than IOREQ: IOREQ is tiny
> > and self-contained. It is easy to add anywhere. A new interface to
> > inject interrupts or map pages is more difficult to manage because it
> > would require changes scattered across the various emulators.
>
> Exactly. I have no confident yet that my approach will also apply
> to other hypervisors than Xen.
> Technically, yes, but whether people can accept it or not is a different
> matter.
>
> Thanks,
> -Takahiro Akashi
>
>

--=20
Regards,

Oleksandr Tyshchenko

--0000000000007c03fa05c986c0a8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello, all.</div><div><br></div><div>Please see some =
comments below. And sorry for the possible format issues.</div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 11, 20=
21 at 9:27 AM AKASHI Takahiro &lt;<a href=3D"mailto:takahiro.akashi@linaro.=
org" target=3D"_blank">takahiro.akashi@linaro.org</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Aug 04, 2021 at 12=
:20:01PM -0700, Stefano Stabellini wrote:<br>
&gt; CCing people working on Xen+VirtIO and IOREQs. Not trimming the origin=
al<br>
&gt; email to let them read the full context.<br>
&gt; <br>
&gt; My comments below are related to a potential Xen implementation, not<b=
r>
&gt; because it is the only implementation that matters, but because it is<=
br>
&gt; the one I know best.<br>
<br>
Please note that my proposal (and hence the working prototype)[1]<br>
is based on Xen&#39;s virtio implementation (i.e. IOREQ) and particularly<b=
r>
EPAM&#39;s virtio-disk application (backend server).<br>
It has been, I believe, well generalized but is still a bit biased<br>
toward this original design.<br>
<br>
So I hope you like my approach :)<br>
<br>
[1] <a href=3D"https://op-lists.linaro.org/pipermail/stratos-dev/2021-Augus=
t/000546.html" rel=3D"noreferrer" target=3D"_blank">https://op-lists.linaro=
.org/pipermail/stratos-dev/2021-August/000546.html</a><br>
<br>
Let me take this opportunity to explain a bit more about my approach below.=
<br>
<br>
&gt; Also, please see this relevant email thread:<br>
&gt; <a href=3D"https://marc.info/?l=3Dxen-devel&amp;m=3D162373754705233&am=
p;w=3D2" rel=3D"noreferrer" target=3D"_blank">https://marc.info/?l=3Dxen-de=
vel&amp;m=3D162373754705233&amp;w=3D2</a><br>
&gt; <br>
&gt; <br>
&gt; On Wed, 4 Aug 2021, Alex Benn=C3=A9e wrote:<br>
&gt; &gt; Hi,<br>
&gt; &gt; <br>
&gt; &gt; One of the goals of Project Stratos is to enable hypervisor agnos=
tic<br>
&gt; &gt; backends so we can enable as much re-use of code as possible and =
avoid<br>
&gt; &gt; repeating ourselves. This is the flip side of the front end where=
<br>
&gt; &gt; multiple front-end implementations are required - one per OS, ass=
uming<br>
&gt; &gt; you don&#39;t just want Linux guests. The resultant guests are tr=
ivially<br>
&gt; &gt; movable between hypervisors modulo any abstracted paravirt type<b=
r>
&gt; &gt; interfaces.<br>
&gt; &gt; <br>
&gt; &gt; In my original thumb nail sketch of a solution I envisioned vhost=
-user<br>
&gt; &gt; daemons running in a broadly POSIX like environment. The interfac=
e to<br>
&gt; &gt; the daemon is fairly simple requiring only some mapped memory and=
 some<br>
&gt; &gt; sort of signalling for events (on Linux this is eventfd). The ide=
a was a<br>
&gt; &gt; stub binary would be responsible for any hypervisor specific setu=
p and<br>
&gt; &gt; then launch a common binary to deal with the actual virtqueue req=
uests<br>
&gt; &gt; themselves.<br>
&gt; &gt; <br>
&gt; &gt; Since that original sketch we&#39;ve seen an expansion in the sor=
t of ways<br>
&gt; &gt; backends could be created. There is interest in encapsulating bac=
kends<br>
&gt; &gt; in RTOSes or unikernels for solutions like SCMI. There interest i=
n Rust<br>
&gt; &gt; has prompted ideas of using the trait interface to abstract diffe=
rences<br>
&gt; &gt; away as well as the idea of bare-metal Rust backends.<br>
&gt; &gt; <br>
&gt; &gt; We have a card (STR-12) called &quot;Hypercall Standardisation&qu=
ot; which<br>
&gt; &gt; calls for a description of the APIs needed from the hypervisor si=
de to<br>
&gt; &gt; support VirtIO guests and their backends. However we are some way=
 off<br>
&gt; &gt; from that at the moment as I think we need to at least demonstrat=
e one<br>
&gt; &gt; portable backend before we start codifying requirements. To that =
end I<br>
&gt; &gt; want to think about what we need for a backend to function.<br>
&gt; &gt; <br>
&gt; &gt; Configuration<br>
&gt; &gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &gt; <br>
&gt; &gt; In the type-2 setup this is typically fairly simple because the h=
ost<br>
&gt; &gt; system can orchestrate the various modules that make up the compl=
ete<br>
&gt; &gt; system. In the type-1 case (or even type-2 with delegated service=
 VMs)<br>
&gt; &gt; we need some sort of mechanism to inform the backend VM about key=
<br>
&gt; &gt; details about the system:<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0- where virt queue memory is in it&#39;s address spac=
e<br>
&gt; &gt;=C2=A0 =C2=A0- how it&#39;s going to receive (interrupt) and trigg=
er (kick) events<br>
&gt; &gt;=C2=A0 =C2=A0- what (if any) resources the backend needs to connec=
t to<br>
&gt; &gt; <br>
&gt; &gt; Obviously you can elide over configuration issues by having stati=
c<br>
&gt; &gt; configurations and baking the assumptions into your guest images =
however<br>
&gt; &gt; this isn&#39;t scalable in the long term. The obvious solution se=
ems to be<br>
&gt; &gt; extending a subset of Device Tree data to user space but perhaps =
there<br>
&gt; &gt; are other approaches?<br>
&gt; &gt; <br>
&gt; &gt; Before any virtio transactions can take place the appropriate mem=
ory<br>
&gt; &gt; mappings need to be made between the FE guest and the BE guest.<b=
r>
&gt; <br>
&gt; &gt; Currently the whole of the FE guests address space needs to be vi=
sible<br>
&gt; &gt; to whatever is serving the virtio requests. I can envision 3 appr=
oaches:<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 * BE guest boots with memory already mapped<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 This would entail the guest OS knowing where in it&#39;s Gu=
est Physical<br>
&gt; &gt;=C2=A0 Address space is already taken up and avoiding clashing. I =
would assume<br>
&gt; &gt;=C2=A0 in this case you would want a standard interface to userspa=
ce to then<br>
&gt; &gt;=C2=A0 make that address space visible to the backend daemon.<br>
<br>
Yet another way here is that we would have well known &quot;shared memory&q=
uot; between<br>
VMs. I think that Jailhouse&#39;s ivshmem gives us good insights on this ma=
tter<br>
and that it can even be an alternative for hypervisor-agnostic solution. <b=
r>
<br>
(Please note memory regions in ivshmem appear as a PCI device and can be<br=
>
mapped locally.)<br>
<br>
I want to add this shared memory aspect to my virtio-proxy, but<br>
the resultant solution would eventually look similar to ivshmem.<br>
<br>
&gt; &gt;=C2=A0 * BE guests boots with a hypervisor handle to memory<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 The BE guest is then free to map the FE&#39;s memory to whe=
re it wants in<br>
&gt; &gt;=C2=A0 the BE&#39;s guest physical address space.<br>
&gt; <br>
&gt; I cannot see how this could work for Xen. There is no &quot;handle&quo=
t; to give<br>
&gt; to the backend if the backend is not running in dom0. So for Xen I thi=
nk<br>
&gt; the memory has to be already mapped<br>
<br>
In Xen&#39;s IOREQ solution (virtio-blk), the following information is expe=
cted<br>
to be exposed to BE via Xenstore:<br>
(I know that this is a tentative approach though.)<br>
=C2=A0 =C2=A0- the start address of configuration space<br>
=C2=A0 =C2=A0- interrupt number<br>
=C2=A0 =C2=A0- file path for backing storage<br>
=C2=A0 =C2=A0- read-only flag<br>
And the BE server have to call a particular hypervisor interface to<br>
map the configuration space.<br></blockquote><div>=C2=A0</div><div>Yes, Xen=
store was chosen=C2=A0as a simple way to pass configuration info to the bac=
kend running in a non-toolstack domain.</div><div>I remember, there was a w=
ish to avoid using Xenstore in Virtio backend itself if possible, so for=C2=
=A0non-toolstack domain, this could done with adjusting devd (daemon that l=
istens for devices and launches backends)</div><div>to read backend configu=
ration from the Xenstore=C2=A0anyway and pass it to the backend via command=
 line arguments.=C2=A0</div><div><br></div><div>But, if ...</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
In my approach (virtio-proxy), all those Xen (or hypervisor)-specific<br>
stuffs are contained in virtio-proxy, yet another VM, to hide all details.<=
br></blockquote><div>=C2=A0</div><div>... the solution how to=C2=A0overcome=
 that is already found and proven to work then even better.=C2=A0</div><div=
><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
<br>
# My point is that a &quot;handle&quot; is not mandatory for executing mapp=
ing.<br>
<br>
&gt; and the mapping probably done by the<br>
&gt; toolstack (also see below.) Or we would have to invent a new Xen<br>
&gt; hypervisor interface and Xen virtual machine privileges to allow this<=
br>
&gt; kind of mapping.<br>
<br>
&gt; If we run the backend in Dom0 that we have no problems of course.<br>
<br>
One of difficulties on Xen that I found in my approach is that calling<br>
such hypervisor intefaces (registering IOREQ, mapping memory) is only<br>
allowed on BE servers themselvies and so we will have to extend those<br>
interfaces.<br>
This, however, will raise some concern on security and privilege distributi=
on<br>
as Stefan suggested.<br></blockquote><div><br></div><div>We also faced poli=
cy=C2=A0related issues with Virtio backend running in other than Dom0 domai=
n in a &quot;dummy&quot; xsm mode. In our target system we run the backend =
in a driver</div><div>domain (we call it DomD) where the underlying=C2=A0H/=
W resides. We trust it, so we wrote policy rules (to be used in &quot;flask=
&quot; xsm mode) to provide it with a little bit more privileges than a sim=
ple DomU had.</div><div>Now it is permitted to issue device-model, resource=
 and memory mappings, etc calls.</div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
&gt; <br>
&gt; <br>
&gt; &gt; To activate the mapping will<br>
&gt; &gt;=C2=A0 require some sort of hypercall to the hypervisor. I can see=
 two options<br>
&gt; &gt;=C2=A0 at this point:<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0- expose the handle to userspace for daemon/helper to=
 trigger the<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0mapping via existing hypercall interfaces. If =
using a helper you<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0would have a hypervisor specific one to avoid =
the daemon having to<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0care too much about the details or push that c=
omplexity into a<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0compile time option for the daemon which would=
 result in different<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0binaries although a common source base.<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0- expose a new kernel ABI to abstract the hypercall d=
ifferences away<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0in the guest kernel. In this case the userspac=
e would essentially<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0ask for an abstract &quot;map guest N memory t=
o userspace ptr&quot; and let<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0the kernel deal with the different hypercall i=
nterfaces. This of<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0course assumes the majority of BE guests would=
 be Linux kernels and<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0leaves the bare-metal/unikernel approaches to =
their own devices.<br>
&gt; &gt; <br>
&gt; &gt; Operation<br>
&gt; &gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &gt; <br>
&gt; &gt; The core of the operation of VirtIO is fairly simple. Once the<br=
>
&gt; &gt; vhost-user feature negotiation is done it&#39;s a case of receivi=
ng update<br>
&gt; &gt; events and parsing the resultant virt queue for data. The vhost-u=
ser<br>
&gt; &gt; specification handles a bunch of setup before that point, mostly =
to<br>
&gt; &gt; detail where the virt queues are set up FD&#39;s for memory and e=
vent<br>
&gt; &gt; communication. This is where the envisioned stub process would be=
<br>
&gt; &gt; responsible for getting the daemon up and ready to run. This is<b=
r>
&gt; &gt; currently done inside a big VMM like QEMU but I suspect a modern<=
br>
&gt; &gt; approach would be to use the rust-vmm vhost crate. It would then =
either<br>
&gt; &gt; communicate with the kernel&#39;s abstracted ABI or be re-targete=
d as a<br>
&gt; &gt; build option for the various hypervisors.<br>
&gt; <br>
&gt; One thing I mentioned before to Alex is that Xen doesn&#39;t have VMMs=
 the<br>
&gt; way they are typically envisioned and described in other environments.=
<br>
&gt; Instead, Xen has IOREQ servers. Each of them connects independently to=
<br>
&gt; Xen via the IOREQ interface. E.g. today multiple QEMUs could be used a=
s<br>
&gt; emulators for a single Xen VM, each of them connecting to Xen<br>
&gt; independently via the IOREQ interface.<br>
&gt; <br>
&gt; The component responsible for starting a daemon and/or setting up shar=
ed<br>
&gt; interfaces is the toolstack: the xl command and the libxl/libxc<br>
&gt; libraries.<br>
<br>
I think that VM configuration management (or orchestration in Startos<br>
jargon?) is a subject to debate in parallel.<br>
Otherwise, is there any good assumption to avoid it right now?<br>
<br>
&gt; Oleksandr and others I CCed have been working on ways for the toolstac=
k<br>
&gt; to create virtio backends and setup memory mappings. They might be abl=
e<br>
&gt; to provide more info on the subject. I do think we miss a way to provi=
de<br>
&gt; the configuration to the backend and anything else that the backend<br=
>
&gt; might require to start doing its job.<br></blockquote><div>=C2=A0</div=
><div>Yes, some work has been done for the toolstack to handle Virtio MMIO =
devices in<br>general and Virtio block devices in particular. However, it h=
as not been upstreaned yet.<br>Updated patches on review now: <br><a href=
=3D"https://lore.kernel.org/xen-devel/1621626361-29076-1-git-send-email-ole=
kstysh@gmail.com/">https://lore.kernel.org/xen-devel/1621626361-29076-1-git=
-send-email-olekstysh@gmail.com/</a><br><br>There is an additional (also im=
portant) activity to improve/fix foreign memory mapping on Arm which I am a=
lso involved in.<br>The foreign memory mapping is proposed to be used for V=
irtio backends (device emulators) if there is a need to run guest OS comple=
tely unmodified.<br>Of course, the more secure way would be to use grant me=
mory mapping. Brietly, the main difference between them is that with foreig=
n mapping the backend<br>can map any guest memory it wants to map, but with=
 grant mapping it is allowed to map only what was previously granted by the=
 frontend.<br><br>So, there might be a problem if we want to pre-map some g=
uest memory in advance or to cache mappings in the backend in order to impr=
ove performance (because the mapping/unmapping guest pages every request re=
quires a lot of back and forth to Xen + P2M updates). In a nutshell, curren=
tly, in order to map a guest page into the backend address space we need to=
 steal a real physical page from the backend domain. So, with the said opti=
mizations we might end up with no free memory in the backend domain (see XS=
A-300). And=C2=A0what we try to achieve is to not waste a real domain memor=
y at all by providing safe non-allocated-yet (so unused) address space for =
the foreign (and grant) pages to be mapped into, this enabling work implies=
 Xen and Linux (and likely DTB bindings) changes. However, as it turned out=
, for this to work in a proper and safe way some prereq work needs to be do=
ne. =C2=A0<br>You can find the related Xen discussion at:<br><a href=3D"htt=
ps://lore.kernel.org/xen-devel/1627489110-25633-1-git-send-email-olekstysh@=
gmail.com/">https://lore.kernel.org/xen-devel/1627489110-25633-1-git-send-e=
mail-olekstysh@gmail.com/</a><br></div><div><br></div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
&gt; <br>
&gt; <br>
&gt; &gt; One question is how to best handle notification and kicks. The ex=
isting<br>
&gt; &gt; vhost-user framework uses eventfd to signal the daemon (although =
QEMU<br>
&gt; &gt; is quite capable of simulating them when you use TCG). Xen has it=
&#39;s own<br>
&gt; &gt; IOREQ mechanism. However latency is an important factor and havin=
g<br>
&gt; &gt; events go through the stub would add quite a lot.<br>
&gt; <br>
&gt; Yeah I think, regardless of anything else, we want the backends to<br>
&gt; connect directly to the Xen hypervisor.<br>
<br>
In my approach,<br>
=C2=A0a) BE -&gt; FE: interrupts triggered by BE calling a hypervisor inter=
face<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 via virtio-proxy<br>
=C2=A0b) FE -&gt; BE: MMIO to config raises events (in event channels), whi=
ch is<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 converted to a callback to=
 BE via virtio-proxy<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (Xen&#39;s event channel i=
s internnally implemented by interrupts.)<br>
<br>
I don&#39;t know what &quot;connect directly&quot; means here, but sending =
interrupts<br>
to the opposite side would be best efficient.<br>
Ivshmem, I suppose, takes this approach by utilizing PCI&#39;s msi-x mechan=
ism.<br></blockquote><div>=C2=A0</div><div>Agree that MSI would be more=C2=
=A0efficient than SPI...</div><div>At the moment, in order to notify the fr=
ontend, the backend issues a specific device-model call to query Xen to inj=
ect=C2=A0a corresponding SPI to the guest.=C2=A0 =C2=A0=C2=A0</div><div><br=
></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; <br>
&gt; &gt; Could we consider the kernel internally converting IOREQ messages=
 from<br>
&gt; &gt; the Xen hypervisor to eventfd events? Would this scale with other=
 kernel<br>
&gt; &gt; hypercall interfaces?<br>
&gt; &gt; <br>
&gt; &gt; So any thoughts on what directions are worth experimenting with?<=
br>
&gt;=C2=A0 <br>
&gt; One option we should consider is for each backend to connect to Xen vi=
a<br>
&gt; the IOREQ interface. We could generalize the IOREQ interface and make =
it<br>
&gt; hypervisor agnostic. The interface is really trivial and easy to add.<=
br>
<br>
As I said above, my proposal does the same thing that you mentioned here :)=
<br>
The difference is that I do call hypervisor interfaces via virtio-proxy.<br=
>
<br>
&gt; The only Xen-specific part is the notification mechanism, which is an<=
br>
&gt; event channel. If we replaced the event channel with something else th=
e<br>
&gt; interface would be generic. See:<br>
&gt; <a href=3D"https://gitlab.com/xen-project/xen/-/blob/staging/xen/inclu=
de/public/hvm/ioreq.h#L52" rel=3D"noreferrer" target=3D"_blank">https://git=
lab.com/xen-project/xen/-/blob/staging/xen/include/public/hvm/ioreq.h#L52</=
a><br>
&gt; <br>
&gt; I don&#39;t think that translating IOREQs to eventfd in the kernel is =
a<br>
&gt; good idea: if feels like it would be extra complexity and that the<br>
&gt; kernel shouldn&#39;t be involved as this is a backend-hypervisor inter=
face.<br>
<br>
Given that we may want to implement BE as a bare-metal application<br>
as I did on Zephyr, I don&#39;t think that the translation would not be<br>
a big issue, especially on RTOS&#39;s.<br>
It will be some kind of abstraction layer of interrupt handling<br>
(or nothing but a callback mechanism).<br>
<br>
&gt; Also, eventfd is very Linux-centric and we are trying to design an<br>
&gt; interface that could work well for RTOSes too. If we want to do<br>
&gt; something different, both OS-agnostic and hypervisor-agnostic, perhaps=
<br>
&gt; we could design a new interface. One that could be implementable in th=
e<br>
&gt; Xen hypervisor itself (like IOREQ) and of course any other hypervisor<=
br>
&gt; too.<br>
&gt; <br>
&gt; <br>
&gt; There is also another problem. IOREQ is probably not be the only<br>
&gt; interface needed. Have a look at<br>
&gt; <a href=3D"https://marc.info/?l=3Dxen-devel&amp;m=3D162373754705233&am=
p;w=3D2" rel=3D"noreferrer" target=3D"_blank">https://marc.info/?l=3Dxen-de=
vel&amp;m=3D162373754705233&amp;w=3D2</a>. Don&#39;t we also need<br>
&gt; an interface for the backend to inject interrupts into the frontend? A=
nd<br>
&gt; if the backend requires dynamic memory mappings of frontend pages, the=
n<br>
&gt; we would also need an interface to map/unmap domU pages.<br>
<br>
My proposal document might help here; All the interfaces required for<br>
virtio-proxy (or hypervisor-related interfaces) are listed as<br>
RPC protocols :)<br>
<br>
&gt; These interfaces are a lot more problematic than IOREQ: IOREQ is tiny<=
br>
&gt; and self-contained. It is easy to add anywhere. A new interface to<br>
&gt; inject interrupts or map pages is more difficult to manage because it<=
br>
&gt; would require changes scattered across the various emulators.<br>
<br>
Exactly. I have no confident yet that my approach will also apply<br>
to other hypervisors than Xen.<br>
Technically, yes, but whether people can accept it or not is a different<br=
>
matter.<br>
<br>
Thanks,<br>
-Takahiro Akashi<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><span style=
=3D"background-color:rgb(255,255,255)"><font size=3D"2"><span style=3D"colo=
r:rgb(51,51,51);font-family:Arial,sans-serif">Regards,</span></font></span>=
</div><div dir=3D"ltr"><br></div><div dir=3D"ltr"><div><span style=3D"backg=
round-color:rgb(255,255,255)"><font size=3D"2">Oleksandr Tyshchenko</font><=
/span></div></div></div></div></div></div></div></div>

--0000000000007c03fa05c986c0a8--

