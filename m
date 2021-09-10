Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 845D84065D0
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 04:51:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183847.332217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOWcp-0003GJ-IH; Fri, 10 Sep 2021 02:50:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183847.332217; Fri, 10 Sep 2021 02:50:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOWcp-0003EC-Ev; Fri, 10 Sep 2021 02:50:47 +0000
Received: by outflank-mailman (input) for mailman id 183847;
 Fri, 10 Sep 2021 02:50:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OOxz=OA=linaro.org=takahiro.akashi@srs-us1.protection.inumbo.net>)
 id 1mOWcn-0003E6-Tt
 for xen-devel@lists.xen.org; Fri, 10 Sep 2021 02:50:45 +0000
Received: from mail-pg1-x533.google.com (unknown [2607:f8b0:4864:20::533])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2d094094-e35f-4dc6-8f25-3bdbfeb5e8c2;
 Fri, 10 Sep 2021 02:50:43 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id w7so500049pgk.13
 for <xen-devel@lists.xen.org>; Thu, 09 Sep 2021 19:50:43 -0700 (PDT)
Received: from laputa (p784a2304.tkyea130.ap.so-net.ne.jp. [120.74.35.4])
 by smtp.gmail.com with ESMTPSA id u24sm3732106pfm.81.2021.09.09.19.50.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 19:50:42 -0700 (PDT)
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
X-Inumbo-ID: 2d094094-e35f-4dc6-8f25-3bdbfeb5e8c2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SyqNjTfXjvn5KMtNqk1SycXkvMuo8jFzXwCGc//gy2A=;
        b=dXMF46b+INFby5XLocLnw07Iql5h1tQuPSb1hmzlIrcKrr2T9prHxo1QdYlpak2HAN
         ADIqRCy23U90hwFnwPKyxNw/0CYp4vykPDR3mEV8ysBd/GxYfbNC+GOwr6qz71WkbSAR
         8vmnmpJWovBAC7w1VaMTZg7f+0YxUggAegqqY2Bqsx3TyvIanbNc8T+UW3qH14C7ijWg
         nER12MDDZeE2FlFoyMHfZsv3+uXyzeYODKN1M8oHUzPrqJPN1ktm+dk4M0dpepYEhIJT
         b5/kDNw6LIObZ5JD826O2byaCat3dCh29OURsojwIhth9ipP+KZObJCGpMyCn3c7ROhQ
         wKsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SyqNjTfXjvn5KMtNqk1SycXkvMuo8jFzXwCGc//gy2A=;
        b=RYGgisYr0EVBtx4C1VD9TLzxBBctcaaG+nNC01QoF3Cn0/KH+B+LyWJ3K7Qo3kPg3n
         IcdR1jp3WruLmto2CCUa4akNoCwwv2IjHLuK+ZGuexQozJDPT3me1N1PLqmjEHwaYvYI
         mLAxusuoeKm5is9OJOCp/TDpz59uOThmkpuTobpwsV2qoTTWbK8o9fMvVHH++zvEXXI1
         dyl8UmRmB15ZbMwADkUZGv6CBKezOgfsZuQlb2BIBSywrxa5GqGNj9eI3rvHwb3AaDNy
         UQCkB7ExYg3RTeln24/ZQJK4SDUH6dsmofNy0ocoEknGNOKY7efxdTAueQtLYK1t24rl
         zNzg==
X-Gm-Message-State: AOAM531I4ZiCIzVMID+IW9U0UD/LDO8bt64FAtZ8u/k2VJAFVo0YTfdB
	bCTwYMosdqd63KwBH3yVQUz32Q==
X-Google-Smtp-Source: ABdhPJwf8Mldf8MGcdJrItBBr12CMt3FqyFuCQZs/DtoJ/nw7hKXlNdjizY88FhDskrTlFGfNhIe8g==
X-Received: by 2002:a05:6a00:26cb:b0:408:f3b8:bdad with SMTP id p11-20020a056a0026cb00b00408f3b8bdadmr6132023pfw.48.1631242242691;
        Thu, 09 Sep 2021 19:50:42 -0700 (PDT)
Date: Fri, 10 Sep 2021 11:50:34 +0900
From: AKASHI Takahiro <takahiro.akashi@linaro.org>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Alex Benn??e <alex.bennee@linaro.org>, Wei Chen <Wei.Chen@arm.com>,
	Paul Durrant <paul@xen.org>,
	Stratos Mailing List <stratos-dev@op-lists.linaro.org>,
	virtio-dev@lists.oasis-open.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Arnd Bergmann <arnd.bergmann@linaro.org>,
	Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>,
	Carl van Schaik <cvanscha@qti.qualcomm.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Artem Mygaiev <Artem_Mygaiev@epam.com>,
	Xen-devel <xen-devel@lists.xen.org>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>,
	Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
	Elena Afanasova <eafanasova@gmail.com>,
	James McKenzie <james@bromium.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Rich Persaud <persaur@gmail.com>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	Jason Andryuk <jandryuk@gmail.com>,
	eric chanudet <eric.chanudet@gmail.com>,
	Roger Pau Monn?? <roger.pau@citrix.com>
Subject: Re: [Stratos-dev] Enabling hypervisor agnosticism for VirtIO backends
Message-ID: <20210910025034.GC42777@laputa>
References: <87v94ldrqq.fsf@linaro.org>
 <alpine.DEB.2.21.2108041055390.9768@sstabellini-ThinkPad-T480s>
 <YRuSPT9075NuWRYS@stefanha-x1.localdomain>
 <875yvkh1p1.fsf@linaro.org>
 <20210903080609.GD47953@laputa>
 <87czpqq9qu.fsf@linaro.org>
 <20210906022356.GD40187@laputa>
 <CACMJ4GaJyAnguzAEH87DSNN_+GhEa5jRbw11hVj-yWMAXx8V7w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACMJ4GaJyAnguzAEH87DSNN_+GhEa5jRbw11hVj-yWMAXx8V7w@mail.gmail.com>

On Mon, Sep 06, 2021 at 07:41:48PM -0700, Christopher Clark wrote:
> On Sun, Sep 5, 2021 at 7:24 PM AKASHI Takahiro via Stratos-dev <
> stratos-dev@op-lists.linaro.org> wrote:
> 
> > Alex,
> >
> > On Fri, Sep 03, 2021 at 10:28:06AM +0100, Alex Benn??e wrote:
> > >
> > > AKASHI Takahiro <takahiro.akashi@linaro.org> writes:
> > >
> > > > Alex,
> > > >
> > > > On Wed, Sep 01, 2021 at 01:53:34PM +0100, Alex Benn??e wrote:
> > > >>
> > > >> Stefan Hajnoczi <stefanha@redhat.com> writes:
> > > >>
> > > >> > [[PGP Signed Part:Undecided]]
> > > >> > On Wed, Aug 04, 2021 at 12:20:01PM -0700, Stefano Stabellini wrote:
> > > >> >> > Could we consider the kernel internally converting IOREQ
> > messages from
> > > >> >> > the Xen hypervisor to eventfd events? Would this scale with
> > other kernel
> > > >> >> > hypercall interfaces?
> > > >> >> >
> > > >> >> > So any thoughts on what directions are worth experimenting with?
> > > >> >>
> > > >> >> One option we should consider is for each backend to connect to
> > Xen via
> > > >> >> the IOREQ interface. We could generalize the IOREQ interface and
> > make it
> > > >> >> hypervisor agnostic. The interface is really trivial and easy to
> > add.
> > > >> >> The only Xen-specific part is the notification mechanism, which is
> > an
> > > >> >> event channel. If we replaced the event channel with something
> > else the
> > > >> >> interface would be generic. See:
> > > >> >>
> > https://gitlab.com/xen-project/xen/-/blob/staging/xen/include/public/hvm/ioreq.h#L52
> > > >> >
> > > >> > There have been experiments with something kind of similar in KVM
> > > >> > recently (see struct ioregionfd_cmd):
> > > >> >
> > https://lore.kernel.org/kvm/dad3d025bcf15ece11d9df0ff685e8ab0a4f2edd.1613828727.git.eafanasova@gmail.com/
> > > >>
> > > >> Reading the cover letter was very useful in showing how this provides
> > a
> > > >> separate channel for signalling IO events to userspace instead of
> > using
> > > >> the normal type-2 vmexit type event. I wonder how deeply tied the
> > > >> userspace facing side of this is to KVM? Could it provide a common FD
> > > >> type interface to IOREQ?
> > > >
> > > > Why do you stick to a "FD" type interface?
> > >
> > > I mean most user space interfaces on POSIX start with a file descriptor
> > > and the usual read/write semantics or a series of ioctls.
> >
> > Who do you assume is responsible for implementing this kind of
> > fd semantics, OSs on BE or hypervisor itself?
> >
> > I think such interfaces can only be easily implemented on type-2
> > hypervisors.
> >
> > # In this sense, I don't think rust-vmm, as it is, cannot be
> > # a general solution.
> >
> > > >> As I understand IOREQ this is currently a direct communication between
> > > >> userspace and the hypervisor using the existing Xen message bus. My
> > > >
> > > > With IOREQ server, IO event occurrences are notified to BE via Xen's
> > event
> > > > channel, while the actual contexts of IO events (see struct ioreq in
> > ioreq.h)
> > > > are put in a queue on a single shared memory page which is to be
> > assigned
> > > > beforehand with xenforeignmemory_map_resource hypervisor call.
> > >
> > > If we abstracted the IOREQ via the kernel interface you would probably
> > > just want to put the ioreq structure on a queue rather than expose the
> > > shared page to userspace.
> >
> > Where is that queue?
> >
> > > >> worry would be that by adding knowledge of what the underlying
> > > >> hypervisor is we'd end up with excess complexity in the kernel. For
> > one
> > > >> thing we certainly wouldn't want an API version dependency on the
> > kernel
> > > >> to understand which version of the Xen hypervisor it was running on.
> > > >
> > > > That's exactly what virtio-proxy in my proposal[1] does; All the
> > hypervisor-
> > > > specific details of IO event handlings are contained in virtio-proxy
> > > > and virtio BE will communicate with virtio-proxy through a virtqueue
> > > > (yes, virtio-proxy is seen as yet another virtio device on BE) and will
> > > > get IO event-related *RPC* callbacks, either MMIO read or write, from
> > > > virtio-proxy.
> > > >
> > > > See page 8 (protocol flow) and 10 (interfaces) in [1].
> > >
> > > There are two areas of concern with the proxy approach at the moment.
> > > The first is how the bootstrap of the virtio-proxy channel happens and
> >
> > As I said, from BE point of view, virtio-proxy would be seen
> > as yet another virtio device by which BE could talk to "virtio
> > proxy" vm or whatever else.
> >
> > This way we guarantee BE's hypervisor-agnosticism instead of having
> > "common" hypervisor interfaces. That is the base of my idea.
> >
> > > the second is how many context switches are involved in a transaction.
> > > Of course with all things there is a trade off. Things involving the
> > > very tightest latency would probably opt for a bare metal backend which
> > > I think would imply hypervisor knowledge in the backend binary.
> >
> > In configuration phase of virtio device, the latency won't be a big matter.
> > In device operations (i.e. read/write to block devices), if we can
> > resolve 'mmap' issue, as Oleksandr is proposing right now, the only issue
> > is
> > how efficiently we can deliver notification to the opposite side. Right?
> > And this is a very common problem whatever approach we would take.
> >
> > Anyhow, if we do care the latency in my approach, most of virtio-proxy-
> > related code can be re-implemented just as a stub (or shim?) library
> > since the protocols are defined as RPCs.
> > In this case, however, we would lose the benefit of providing "single
> > binary"
> > BE.
> > (I know this is is an arguable requirement, though.)
> >
> > # Would we better discuss what "hypervisor-agnosticism" means?
> >
> Is there a call that you could recommend that we join to discuss this and
> the topics of this thread?

Stratos call?
Alex should have more to say.

-Takahiro Akashi


> There is definitely interest in pursuing a new interface for Argo that can
> be implemented in other hypervisors and enable guest binary portability
> between them, at least on the same hardware architecture, with VirtIO
> transport as a primary use case.
> 
> The notes from the Xen Summit Design Session on VirtIO Cross-Project BoF
> for Xen and Guest OS, which include context about the several separate
> approaches to VirtIO on Xen, have now been posted here:
> https://lists.xenproject.org/archives/html/xen-devel/2021-09/msg00472.html
> 
> Christopher
> 
> 
> 
> > -Takahiro Akashi
> >
> >
> >

