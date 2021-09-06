Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E10674014FF
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 04:24:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179315.325566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mN4Iq-0004y0-Su; Mon, 06 Sep 2021 02:24:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179315.325566; Mon, 06 Sep 2021 02:24:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mN4Iq-0004vd-PW; Mon, 06 Sep 2021 02:24:08 +0000
Received: by outflank-mailman (input) for mailman id 179315;
 Mon, 06 Sep 2021 02:24:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AiNf=N4=linaro.org=takahiro.akashi@srs-us1.protection.inumbo.net>)
 id 1mN4Ip-0004vX-T6
 for xen-devel@lists.xen.org; Mon, 06 Sep 2021 02:24:07 +0000
Received: from mail-pj1-x102d.google.com (unknown [2607:f8b0:4864:20::102d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a15e629f-1d3c-455a-8653-b9e4a053d60b;
 Mon, 06 Sep 2021 02:24:06 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 n13-20020a17090a4e0d00b0017946980d8dso3340172pjh.5
 for <xen-devel@lists.xen.org>; Sun, 05 Sep 2021 19:24:05 -0700 (PDT)
Received: from laputa (p784a2304.tkyea130.ap.so-net.ne.jp. [120.74.35.4])
 by smtp.gmail.com with ESMTPSA id b7sm5582312pfl.195.2021.09.05.19.23.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Sep 2021 19:24:04 -0700 (PDT)
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
X-Inumbo-ID: a15e629f-1d3c-455a-8653-b9e4a053d60b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=TIye2OuKCRdKK2inz4e7KcA5V+jm8PQZVNAbxUlcF9M=;
        b=ugJmyzJYLmTJvdVs2vfCx6yDxQZp2kbg8om7kdStgI1azE3b3NpW5qCcscYjm1HgC7
         0S76RUOxRRMB9DW6xpkkbmtB6hDTxL0QtdONXvmwXW3ovHbnhTz9lRi/H0QJElADrgPR
         VC/oHUaSKizAnxCRfK43xQXtznpVEeV8UGJZXPfFSbCd6nCGKJ8r7lHeX7GeDQ9V+xru
         ibhLrT25bjKCDD6V1xfNLfN2tkMq9i2ChFJeg1gpFGAEiP+8liY5o3PC3Am56bFvKYb1
         X73JlQzIvZ5LtUn8xy3KwwitUu0ZeZko324byhqkUtaO+/fgWzN7py2yQQMBH0jSEU5s
         yiBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=TIye2OuKCRdKK2inz4e7KcA5V+jm8PQZVNAbxUlcF9M=;
        b=UngTuoNSphFBxHKHdIk8Vrvhi8eRTxRvxEgLVbNKeFmZ8V0mAXWnlx5SylzHiFwa8O
         oWmh18gMYQERNQtLwfMrnCnMZWJlXcvsPjMvvXC9c3X7VIVDQ187mL1j6OSXuPJY0YeO
         t2xm0YJPCOJ1LIU4y1rCwldGf1Tm+qoxh2v2furI/8QEVnWHfrxvDeMaH7JSpj3vxstA
         EWdsBgF5CTgQS8QBiHP0XrPEFA5AP163S+l7TTlEJ3I19PgIRbJbvlOhu2Ckv87DK6iK
         ZKMgS0MktntscIRoqCWa2UzSmvluribb3/Oxnq/zLuh0g9N4+wYe6glQbu0gVdYHu+ZM
         KvUQ==
X-Gm-Message-State: AOAM530XvEnXcjATh0kVNWU57oLsECF+u2lbPMyloot1tgpP1LwHuoML
	b8DG2j9/WzWVdy2wm+MRhyxKgg==
X-Google-Smtp-Source: ABdhPJwCO1zSOXyxpTWEILD/F2gLRiZRWkwd2ZxF74/o/wUpG2r2d3jsgevbkR2rmE4PDW1bcWPNoQ==
X-Received: by 2002:a17:90a:de04:: with SMTP id m4mr11661221pjv.187.1630895045015;
        Sun, 05 Sep 2021 19:24:05 -0700 (PDT)
Date: Mon, 6 Sep 2021 11:23:56 +0900
From: AKASHI Takahiro <takahiro.akashi@linaro.org>
To: Alex Benn??e <alex.bennee@linaro.org>
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Stratos Mailing List <stratos-dev@op-lists.linaro.org>,
	virtio-dev@lists.oasis-open.org,
	Arnd Bergmann <arnd.bergmann@linaro.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Carl van Schaik <cvanscha@qti.qualcomm.com>, pratikp@quicinc.com,
	Srivatsa Vaddagiri <vatsa@codeaurora.org>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>, Wei.Chen@arm.com,
	olekstysh@gmail.com, Oleksandr_Tyshchenko@epam.com,
	Bertrand.Marquis@arm.com, Artem_Mygaiev@epam.com, julien@xen.org,
	jgross@suse.com, paul@xen.org, xen-devel@lists.xen.org,
	Elena Afanasova <eafanasova@gmail.com>
Subject: Re: Enabling hypervisor agnosticism for VirtIO backends
Message-ID: <20210906022356.GD40187@laputa>
References: <87v94ldrqq.fsf@linaro.org>
 <alpine.DEB.2.21.2108041055390.9768@sstabellini-ThinkPad-T480s>
 <YRuSPT9075NuWRYS@stefanha-x1.localdomain>
 <875yvkh1p1.fsf@linaro.org>
 <20210903080609.GD47953@laputa>
 <87czpqq9qu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87czpqq9qu.fsf@linaro.org>

Alex,

On Fri, Sep 03, 2021 at 10:28:06AM +0100, Alex Benn??e wrote:
> 
> AKASHI Takahiro <takahiro.akashi@linaro.org> writes:
> 
> > Alex,
> >
> > On Wed, Sep 01, 2021 at 01:53:34PM +0100, Alex Benn??e wrote:
> >> 
> >> Stefan Hajnoczi <stefanha@redhat.com> writes:
> >> 
> >> > [[PGP Signed Part:Undecided]]
> >> > On Wed, Aug 04, 2021 at 12:20:01PM -0700, Stefano Stabellini wrote:
> >> >> > Could we consider the kernel internally converting IOREQ messages from
> >> >> > the Xen hypervisor to eventfd events? Would this scale with other kernel
> >> >> > hypercall interfaces?
> >> >> > 
> >> >> > So any thoughts on what directions are worth experimenting with?
> >> >>  
> >> >> One option we should consider is for each backend to connect to Xen via
> >> >> the IOREQ interface. We could generalize the IOREQ interface and make it
> >> >> hypervisor agnostic. The interface is really trivial and easy to add.
> >> >> The only Xen-specific part is the notification mechanism, which is an
> >> >> event channel. If we replaced the event channel with something else the
> >> >> interface would be generic. See:
> >> >> https://gitlab.com/xen-project/xen/-/blob/staging/xen/include/public/hvm/ioreq.h#L52
> >> >
> >> > There have been experiments with something kind of similar in KVM
> >> > recently (see struct ioregionfd_cmd):
> >> > https://lore.kernel.org/kvm/dad3d025bcf15ece11d9df0ff685e8ab0a4f2edd.1613828727.git.eafanasova@gmail.com/
> >> 
> >> Reading the cover letter was very useful in showing how this provides a
> >> separate channel for signalling IO events to userspace instead of using
> >> the normal type-2 vmexit type event. I wonder how deeply tied the
> >> userspace facing side of this is to KVM? Could it provide a common FD
> >> type interface to IOREQ?
> >
> > Why do you stick to a "FD" type interface?
> 
> I mean most user space interfaces on POSIX start with a file descriptor
> and the usual read/write semantics or a series of ioctls.

Who do you assume is responsible for implementing this kind of
fd semantics, OSs on BE or hypervisor itself?

I think such interfaces can only be easily implemented on type-2 hypervisors.

# In this sense, I don't think rust-vmm, as it is, cannot be
# a general solution.

> >> As I understand IOREQ this is currently a direct communication between
> >> userspace and the hypervisor using the existing Xen message bus. My
> >
> > With IOREQ server, IO event occurrences are notified to BE via Xen's event
> > channel, while the actual contexts of IO events (see struct ioreq in ioreq.h)
> > are put in a queue on a single shared memory page which is to be assigned
> > beforehand with xenforeignmemory_map_resource hypervisor call.
> 
> If we abstracted the IOREQ via the kernel interface you would probably
> just want to put the ioreq structure on a queue rather than expose the
> shared page to userspace. 

Where is that queue?

> >> worry would be that by adding knowledge of what the underlying
> >> hypervisor is we'd end up with excess complexity in the kernel. For one
> >> thing we certainly wouldn't want an API version dependency on the kernel
> >> to understand which version of the Xen hypervisor it was running on.
> >
> > That's exactly what virtio-proxy in my proposal[1] does; All the hypervisor-
> > specific details of IO event handlings are contained in virtio-proxy
> > and virtio BE will communicate with virtio-proxy through a virtqueue
> > (yes, virtio-proxy is seen as yet another virtio device on BE) and will
> > get IO event-related *RPC* callbacks, either MMIO read or write, from
> > virtio-proxy.
> >
> > See page 8 (protocol flow) and 10 (interfaces) in [1].
> 
> There are two areas of concern with the proxy approach at the moment.
> The first is how the bootstrap of the virtio-proxy channel happens and

As I said, from BE point of view, virtio-proxy would be seen
as yet another virtio device by which BE could talk to "virtio
proxy" vm or whatever else.

This way we guarantee BE's hypervisor-agnosticism instead of having
"common" hypervisor interfaces. That is the base of my idea.

> the second is how many context switches are involved in a transaction.
> Of course with all things there is a trade off. Things involving the
> very tightest latency would probably opt for a bare metal backend which
> I think would imply hypervisor knowledge in the backend binary.

In configuration phase of virtio device, the latency won't be a big matter.
In device operations (i.e. read/write to block devices), if we can
resolve 'mmap' issue, as Oleksandr is proposing right now, the only issue is
how efficiently we can deliver notification to the opposite side. Right?
And this is a very common problem whatever approach we would take.

Anyhow, if we do care the latency in my approach, most of virtio-proxy-
related code can be re-implemented just as a stub (or shim?) library
since the protocols are defined as RPCs.
In this case, however, we would lose the benefit of providing "single binary"
BE.
(I know this is is an arguable requirement, though.)

# Would we better discuss what "hypervisor-agnosticism" means?

-Takahiro Akashi

> >
> > If kvm's ioregionfd can fit into this protocol, virtio-proxy for kvm
> > will hopefully be implemented using ioregionfd.
> >
> > -Takahiro Akashi
> >
> > [1] https://op-lists.linaro.org/pipermail/stratos-dev/2021-August/000548.html
> 
> -- 
> Alex Bennée

