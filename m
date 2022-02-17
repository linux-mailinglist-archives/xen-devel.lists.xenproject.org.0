Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B99B24BA1E0
	for <lists+xen-devel@lfdr.de>; Thu, 17 Feb 2022 14:49:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274784.470370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKh9c-00053L-O2; Thu, 17 Feb 2022 13:49:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274784.470370; Thu, 17 Feb 2022 13:49:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKh9c-00051S-Ko; Thu, 17 Feb 2022 13:49:04 +0000
Received: by outflank-mailman (input) for mailman id 274784;
 Thu, 17 Feb 2022 13:49:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ek+T=TA=linaro.org=vincent.guittot@srs-se1.protection.inumbo.net>)
 id 1nKh9a-00051I-Vo
 for xen-devel@lists.xenproject.org; Thu, 17 Feb 2022 13:49:03 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c4b574a-8ff8-11ec-8723-dd0c611c5f35;
 Thu, 17 Feb 2022 14:49:00 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id a42so8359683ljq.13
 for <xen-devel@lists.xenproject.org>; Thu, 17 Feb 2022 05:49:01 -0800 (PST)
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
X-Inumbo-ID: 5c4b574a-8ff8-11ec-8723-dd0c611c5f35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+VzvwP9q9rcxg9/70qSfTmhKlUJ83T/9udBSY0she1U=;
        b=AKK51VNRvS70KYO4rkGwcq0iW5aui916+YnAkVgxvpTK56lPgdgnJEpqDk8XMOm1XI
         N4zQGvihzrWQjcK14FnpQo5RUrl1F9STEt1BiD/6jO1X5HskCO9iQ/+GONqef8Urr18/
         TWdLEzG/i1YBv64p2p+l7A/58VwO5dkr5ko/MAupeChhrM1p9kriAJO29ivAKxXaLxPe
         qm4xL3mYNHi3Nv7B7yYFYjfnWvoRbLgqVohCJycoQLCEWk/e95nNkybd9WMTc9AOPenA
         SvOE0ZXprtmvey7axaDe5iGjy92BWjQbB2Fyv4ZIguyZdcbSEjFIMN6m6QaXKn3yNj26
         jn2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+VzvwP9q9rcxg9/70qSfTmhKlUJ83T/9udBSY0she1U=;
        b=QuzOhAARQWMT7EwP4UFumJL9g8a2PW90PGH5CoZZz7/yAhOhPMCW3Up4JyQSpjWKFx
         Y0A7FKkkkZ2Vj1HUldHXrLulNECE6x2RQLSXRUXj9yCvEPr0es+ghAwV6MbRIRX8+vLw
         F8XceyFfNDfgfIqiT60Q8h09suuQnLCb/WrmuMG0dwq3VcOMjQiKgyRCOrZKx+MwhifV
         1IiW8MVbieL6yXoV+uN6Y9crktR273Om377HjBueb413oQSBZisOO1DdhvGVEaxiidvs
         Un1/hKg2tB+c2R4IfL/3Ut94iwgWDSIDf3HGi6Wa5R2yMKQ1iqxkyDhDBO7bicYaKv5i
         XhwA==
X-Gm-Message-State: AOAM53141RDno7sT/+Iv1G1hDDy3WaBXygfN4NNVRCWdEMdIOQL4BX8L
	v3HMLepKLKQs3UfCL2yuFPCCE2NAvkBsD5Hn3Urqkw==
X-Google-Smtp-Source: ABdhPJzO3R9aNlX4bduIHjzZh9O3CSJPNdQ4O50S560P0SMmepintzmcbbr2U/DXPDTJXJSC4gKeWTRy7uJwNanEvaY=
X-Received: by 2002:a2e:bd82:0:b0:241:130d:90b3 with SMTP id
 o2-20020a2ebd82000000b00241130d90b3mr2234881ljq.383.1645105740337; Thu, 17
 Feb 2022 05:49:00 -0800 (PST)
MIME-Version: 1.0
References: <87h79bgd1m.fsf@linaro.org> <alpine.DEB.2.22.394.2202071419270.2091381@ubuntu-linux-20-04-desktop>
 <CAKfTPtB1ONsxA1Rch8AO+UrPRZsHrCgF1_-F-kh9U_Xu2M47aA@mail.gmail.com> <alpine.DEB.2.22.394.2202161256350.43738@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2202161256350.43738@ubuntu-linux-20-04-desktop>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 17 Feb 2022 14:48:45 +0100
Message-ID: <CAKfTPtCtwnHXS143LQM-HDuZv8BOHSMDrQjh1cJqiBUci--smA@mail.gmail.com>
Subject: Re: Metadata and signalling channels for Zephyr virtio-backends on Xen
To: Stefano Stabellini <stefano.stabellini@xilinx.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	stratos-dev@op-lists.linaro.org, xen-devel@lists.xenproject.org, 
	AKASHI Takahiro <takahiro.akashi@linaro.org>, Arnd Bergmann <arnd.bergmann@linaro.org>, 
	Christopher Clark <christopher.w.clark@gmail.com>, Dmytro Firsov <dmytro_firsov@epam.com>, 
	Julien Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Oleksandr_Tyshchenko@epam.com, Artem_Mygaiev@epam.com, 
	bertrand.marquis@arm.com, Wei.Chen@arm.com, Ed.Doxat@arm.com, 
	Oleksii_Moisieiev@epam.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 16 Feb 2022 at 22:45, Stefano Stabellini
<stefano.stabellini@xilinx.com> wrote:
>
> On Tue, 15 Feb 2022, Vincent Guittot wrote:
> > On Tue, 8 Feb 2022 at 01:16, Stefano Stabellini
> > <stefano.stabellini@xilinx.com> wrote:
> > >
> > > On Mon, 7 Feb 2022, Alex Benn=C3=A9e wrote:
> > > > Hi Stefano,
> > > >
> > > > Vincent gave an update on his virtio-scmi work at the last Stratos =
sync
> > > > call and the discussion moved onto next steps.
> > >
> > > Hi Alex,
> > >
> > > I don't know the specifics of virtio-scmi, but if it is about power,
> > > clocks, reset, etc. like the original SCMI protocol, then virtio-scmi=
 is
> >
> > virtio-scmi is one transport channel that support SCMI protocol
> >
> > > likely going to be very different from all the other virtio frontends
> >
> > The virtio-scmi front-end is merged mainline
> >
> > > and backends. That's because SCMI requires a full view of the system,
> > > which is different from something like virtio-net that is limited to =
the
> > > emulation of 1 device. For this reason, it is likely that the
> > > virtio-scmi backend would be a better fit in Xen itself, rather than =
run
> > > in userspace inside a VM.
> >
> > Not sure what you mean when you say that SCMI requires a full view of
> > the system.
>
> SCMI can be used to read the status of resources in the system and
> typically leads to a full view of the system's resources.
>
> If I assign the USB controller to a VM, I expect that VM to only "see"
> the USB controller and any attached USB peripherals, in addition to the
> other regular virtual resources that a VM commonly has.
>
> If I assign SCMI to a VM, I expect the VM to "see" everything in the
> system thanks to the SCMI probing functions. Unless we only assign a
> single SCMI channel with limited capabilities to the VM, like EPAM's
> patch series on xen-devel is doing.


>
>
> > If you are referring to the system wide resources which
> > reset or power up/down the whole SoC, this is not really what we are
> > targeting here. Those system wide resources should already be handled
> > by a dedicated power coprocessor. In our case, the IPs of the SoC will
> > be handled by different VMs but those IPs are usually sharing common
> > resources like a parent PLL , a power domain or a clock gating reg as
> > few examples. Because all those VMs can't directly set these resources
> > without taking into account others and because the power coprocessor
> > doesn't have an unlimited number of channels, we add an SCMI backend
> > that will gather and proxy the VM request before accessing the
> > register that gates some clocks IP as an example or before powering
> > down an external regulator shared between the camera and another
> > device.
>
> Do you know what would be the expected number of SCMI channels available
> in a "normal" deployment?

I don't have a fixed value but it can comes from few to hundreds
depending of the product

>
> My expectation was that there would be enough SCMI channels to give one
> for each VM in a common embedded scenario, where the number of VMs is
> typically not very high. If we have enought channels so that we can
> assign each channel to a different VM maybe we can get away without a
> proxy?

If you have enough HW channels per VM then you don't need anything
including what EPAM is proposing. But part of my requirement is that
we don't have enough HW resources and we don't want to update the
secure power coprocessor for each and every product.

In SCMI, each channel/agent can have its own view of available
resources; Typically only the ATF/PSCI channel can power off the whole
system but not OSPMs agent

>
>
> > This SCMI backend will most probably also send request with
> > OSPM permission access to the power coprocessor once aggregating all
> > the VMs ' request
>
> Please correct me if I am wrong, but I would have expected the SCMI
> firmware to be able to do reference counting on the hardware resources
> and therefore be able to handle the case where:

The example that I have in mind is :
current case: Linux takes care of a clock divider that provides clocks
for let say video decoder and SD controller but its parent is a system
clock shared with others subsystem which is managed by the power
coprocessor.
Linux will 1st send a request to the coprocessor to enable system
clock. Then it will set the divider and probably ungates the clock at
HW IP level

Now we move the sdcard in VMA and the video decoder in VMB.
The SCMI server VM will take care of the clock divider and clock gating reg=
ister
VMA will send a request to SCMI backend which aggregates/refcounts its
request with VMB request. When it needs to enable the clock divider,
It will 1st send a request to the coprocessor for the system clock.

The coprocessor stays unchanged and the SCMI backend can be adjusted
per product.

>
> - we have 2 VMs
> - each VM has its own SCMI channel
> - a VM requests power-off on 1 resource also used by the other VM

yes it has refcounting but you assume that you have enough HW channels.
It also implies that the coprocessor firmware is different for each
and every end product because you will have to adjust the scmi
permission of each channel

>
> My understanding of the SCMI protocol is that the SCMI firmware
> implementation should detect that the resource in question is also
> in-use by another VM/channel and thus it would refuse the power-off
> operation. (For your information, that is also how the Xilinx EEMI
> protocol works.)
>
> Reference counting is a key requirement for a good multi-channel
> implementation. If SCMI doesn't support it today, then we have a
> problem with SCMI multi-channel, regardless of virtualization.channels
>
>
> > We are using virtio-cmi protocol because it has the main advantage of
> > not being tied to an hypervisor
>
> That is a valuable goal, which is a bit different from the goal of
> finding the best SCMI architecture for Xen, and that's OK. Let's see if
> we can find any common ground and synergies we can exploit to improve
> both goals. I'll join the Stratos meeting tomorrow.

Great

>
>
> > In our PoC, the SCMI backend is running with zehyr and reuse the same
> > software that can run in the power coprocessor which helps splitting
> > what is critical and must be handled by power coprocessor and what is
> > not critical for the system (what is usually managed by linux directly
> > when their no hypervisor involved typically)
> >
> >
> > > FYI, a good and promising approach to handle both SCMI and SCPI is th=
e
> > > series recently submitted by EPAM to mediate SCMI and SCPI requests i=
n
> > > Xen: https://marc.info/?l=3Dxen-devel&m=3D163947444032590
> > >
> > > (Another "special" virtio backend is virtio-iommu for similar reasons=
:
> > > the guest p2m address mappings and also the IOMMU drivers are in Xen.
> > > It is not immediately clear whether a virtio-iommu backend would need=
 to
> > > be in Xen or run as a process in dom0/domU.)
> > >
> > > On the other hand, for all the other "normal" protocols (e.g.
> > > virtio-net, virtio-block, etc.) the backend would naturally run as a
> > > process in dom0 or domU (e.g. QEMU in Dom0) as one would expect.
> > >
> > >
> > > > Currently the demo setup
> > > > is intermediated by a double-ended vhost-user daemon running on the
> > > > devbox acting as a go between a number of QEMU instances representi=
ng
> > > > the front and back-ends. You can view the architecture with Vincent=
s
> > > > diagram here:
> > > >
> > > >   https://docs.google.com/drawings/d/1YSuJUSjEdTi2oEUq4oG4A9pBKSEJT=
Ap6hhcHKKhmYHs/edit?usp=3Dsharing
> > > >
> > > > The key virtq handling is done over the special carve outs of share=
d
> > > > memory between the front end and guest. However the signalling is
> > > > currently over a virtio device on the backend. This is useful for t=
he
> > > > PoC but obviously in a real system we don't have a hidden POSIX sys=
tem
> > > > acting as a go between not to mention the additional latency it cau=
ses
> > > > with all those context switches.
> > > >
> > > > I was hoping we could get some more of the Xen experts to the next
> > > > Stratos sync (17th Feb) to go over approaches for a properly hosted=
 on
> > > > Xen approach. From my recollection (Vincent please correct me if I'=
m
> > > > wrong) of last week the issues that need solving are:
> > >
> > > Unfortunately I have a regular conflict which prevents me from being
> > > able to join the Stratos calls. However, I can certainly make myself
> > > available for one call (unless something unexpected comes up).
> > >
> > >
> > > >  * How to handle configuration steps as FE guests come up
> > > >
> > > > The SCMI server will be a long running persistent backend because i=
t is
> > > > managing real HW resources. However the guests may be ephemeral (or=
 just
> > > > restarted) so we can't just hard-code everything in a DTB. While th=
e
> > > > virtio-negotiation in the config space covers most things we still =
need
> > > > information like where in the guests address space the shared memor=
y
> > > > lives and at what offset into that the queues are created. As far a=
s I'm
> > > > aware the canonical source of domain information is XenStore
> > > > (https://wiki.xenproject.org/wiki/XenStore) but this relies on a Do=
m0
> > > > type approach. Is there an alternative for dom0less systems or do w=
e
> > > > need a dom0-light approach, for example using STR-21 (Ensure Zephyr=
 can
> > > > run cleanly as a Dom0 guest) providing just enough services for FE'=
s to
> > > > register metadata and BE's to read it?
> > >
> > > I'll try to answer the question for a generic virtio frontend and
> > > backend instead (not SCMI because SCMI is unique due to the reasons
> > > above.)
> > >
> > > Yes, xenstore is the easiest way to exchange configuration informatio=
n
> > > between domains. I think EPAM used xenstore to exchange the
> > > configuration information in their virtio-block demo. There is a way =
to
> > > use xenstore even between dom0less VMs:
> > > https://marc.info/?l=3Dxen-devel&m=3D164340547602391 Not just xenstor=
e but
> > > full PV drivers too. However, in the dom0less case xenstore is going =
to
> > > become available some time after boot, not immediately at startup tim=
e.
> > > That's because you need to wait until xenstored is up and running.
> > >
> > > There are other ways to send data from one VM to another which are
> > > available immediately at boot, such as Argo and static shared memory.
> > >
> > > But dom0less is all about static partitioning, so it makes sense to
> > > exploit the build-time tools to the fullest. In the dom0less case, we
> > > already know what is going to run on the target before it is even tur=
ned
> > > on. As an example, we might have already prepared an environment with=
 3
> > > VMs using Yocto and ImageBuilder. We could also generate all
> > > configurations needed and place them inside each VMs using Yocto's
> > > standard tools and ImageBuilder. So for dom0less, I recommend to go v=
ia
> > > a different route and pre-generate the configuration directly where
> > > needed instead of doing dynamic discovery.
> > >
> > >
> > > >  * How to handle mapping of memory
> > > >
> > > > AIUI the Xen model is the FE guest explicitly makes grant table req=
uests
> > > > to expose portions of it's memory to other domains. Can the BE quer=
y the
> > > > hypervisor itself to discover the available grants or does it requi=
re
> > > > coordination with Dom0/XenStore for that information to be availabl=
e to
> > > > the BE domain?
> > >
> > > Typically the frontend passes grant table references to the backend
> > > (i.e. instead of plain guest physical addresses on the virtio ring.)
> > > Then, the backend maps the grants; Xen checks that the mapping is
> > > allowed.
> > >
> > > We might be able to use the same model with virtio devices. A special
> > > pseudo-IOMMU driver in Linux would return a grant table reference and=
 an
> > > offset as "DMA address". The "DMA address" is passed to the virtio
> > > backend over the virtio ring. The backend would map the grant table
> > > reference using the regular grant table hypercalls.
> > >
> > >
> > > >  * How to handle signalling
> > > >
> > > > I guess this requires a minimal implementation of the IOREQ calls f=
or
> > > > Zephyr so we can register the handler in the backend? Does the IORE=
Q API
> > > > allow for a IPI style notifications using the global GIC IRQs?
> > > >
> > > > Forgive the incomplete notes from the Stratos sync, I was trying to=
 type
> > > > while participating in the discussion so hopefully this email captu=
res
> > > > what was missed:
> > > >
> > > >   https://linaro.atlassian.net/wiki/spaces/STR/pages/28682518685/20=
22-02-03+Project+Stratos+Sync+Meeting+Notes
> > >
> > > Yes, any emulation backend (including virtio backends) would require =
an
> > > IOREQ implementation, which includes notifications via event channels=
.
> > > Event channels are delivered as a GIC PPI interrupt to the Linux kern=
el.
> > > Then, the kernel sends the notification to userspace via a file
> > > descriptor.
> >

