Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 150163FFB8C
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 10:07:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177820.323522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM4DN-0002Nm-MV; Fri, 03 Sep 2021 08:06:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177820.323522; Fri, 03 Sep 2021 08:06:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM4DN-0002LU-JJ; Fri, 03 Sep 2021 08:06:21 +0000
Received: by outflank-mailman (input) for mailman id 177820;
 Fri, 03 Sep 2021 08:06:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X61r=NZ=linaro.org=takahiro.akashi@srs-us1.protection.inumbo.net>)
 id 1mM4DM-0002LO-7F
 for xen-devel@lists.xen.org; Fri, 03 Sep 2021 08:06:20 +0000
Received: from mail-pj1-x102f.google.com (unknown [2607:f8b0:4864:20::102f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d96f000e-9f50-4c59-b499-15ab5ce0d2d4;
 Fri, 03 Sep 2021 08:06:19 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 j10-20020a17090a94ca00b00181f17b7ef7so3322057pjw.2
 for <xen-devel@lists.xen.org>; Fri, 03 Sep 2021 01:06:18 -0700 (PDT)
Received: from laputa (p784a44f4.tkyea130.ap.so-net.ne.jp. [120.74.68.244])
 by smtp.gmail.com with ESMTPSA id r8sm5109955pgp.30.2021.09.03.01.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 01:06:17 -0700 (PDT)
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
X-Inumbo-ID: d96f000e-9f50-4c59-b499-15ab5ce0d2d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=VSDI1b+kKShx1vFtwYGy2PerZEjlalFPEQbbPa66J9o=;
        b=Gorjw3gj2HqBc5LgjLHiFLqx01XeiuFebKz7161NrET5y7DATwcbm57599urNvtfwj
         Ag9PWaYhiOreAYtCB90WdV1AwXwKbFMtiOXd/XNQ082HRZMqLb50cyYPG/exk9xYjPho
         ToB0C1NGznEQirewsZZlxFDl6icG8eGgoykh+Q2XqjjI4Jb9AEB7ZJbQ2f7Dm3TrlfDd
         M7R7aF/Z/kkgxdEhNbnn2K1g/wmnNVAc8K+xA9wUrCHc2UuUy2zoMjWcOEfq6SgFbRKW
         6nVyjcbAsw4HDXpWErmzkNRqZlkUfW9y2kInKspLlg/WcSTsDAkpxA/ssSxnonlOH/GE
         aidA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=VSDI1b+kKShx1vFtwYGy2PerZEjlalFPEQbbPa66J9o=;
        b=lwc46S5kRapBDek1R+Mz5eJFB1uVMhTQVlvPb7mHVy2T66OMmS1AmPN5QgyiOUjiag
         Ulv4V1SG7OUt4s+zmTncqlLCYAee2zDsaF2qhT9ybrZgJ6UoY1fYGEypGHt8UXBYnQjB
         ZERO3lukUlGN50cRQGukNQgd0HMhoXZM6/Qn3VmFqW2a/5XxD0qhP8jG2zC/abb3TlNf
         MwWOfqPvo2Vn11wFxZh5qRKkRotffRuzAyeP/DjmoIBCUsRy8i/U4pFUy7lH2gmhZ4tD
         8f0Gq9IWWIPZI5pjkUAEy8B2Vczv176AakMzmvihCKlE7QWmVCmrvlQEK3nElEHaIMXB
         yBTA==
X-Gm-Message-State: AOAM5316mHk23jJl+F0lJOMr1hCJVo06nUH8MvMdBa47xL/PHjMHMfqf
	wuPe9jcGYk9EczVLTLl4TV/tJw==
X-Google-Smtp-Source: ABdhPJxqaZrzFD1/AwE3AQ1yYzaaKX9bSU33Qt7iVq3Iz0X2S2enbVNdAp2/mMETg7+Q06fRunv4Bg==
X-Received: by 2002:a17:90b:1085:: with SMTP id gj5mr2165236pjb.66.1630656377947;
        Fri, 03 Sep 2021 01:06:17 -0700 (PDT)
Date: Fri, 3 Sep 2021 17:06:09 +0900
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
Message-ID: <20210903080609.GD47953@laputa>
References: <87v94ldrqq.fsf@linaro.org>
 <alpine.DEB.2.21.2108041055390.9768@sstabellini-ThinkPad-T480s>
 <YRuSPT9075NuWRYS@stefanha-x1.localdomain>
 <875yvkh1p1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <875yvkh1p1.fsf@linaro.org>

Alex,

On Wed, Sep 01, 2021 at 01:53:34PM +0100, Alex Benn??e wrote:
> 
> Stefan Hajnoczi <stefanha@redhat.com> writes:
> 
> > [[PGP Signed Part:Undecided]]
> > On Wed, Aug 04, 2021 at 12:20:01PM -0700, Stefano Stabellini wrote:
> >> > Could we consider the kernel internally converting IOREQ messages from
> >> > the Xen hypervisor to eventfd events? Would this scale with other kernel
> >> > hypercall interfaces?
> >> > 
> >> > So any thoughts on what directions are worth experimenting with?
> >>  
> >> One option we should consider is for each backend to connect to Xen via
> >> the IOREQ interface. We could generalize the IOREQ interface and make it
> >> hypervisor agnostic. The interface is really trivial and easy to add.
> >> The only Xen-specific part is the notification mechanism, which is an
> >> event channel. If we replaced the event channel with something else the
> >> interface would be generic. See:
> >> https://gitlab.com/xen-project/xen/-/blob/staging/xen/include/public/hvm/ioreq.h#L52
> >
> > There have been experiments with something kind of similar in KVM
> > recently (see struct ioregionfd_cmd):
> > https://lore.kernel.org/kvm/dad3d025bcf15ece11d9df0ff685e8ab0a4f2edd.1613828727.git.eafanasova@gmail.com/
> 
> Reading the cover letter was very useful in showing how this provides a
> separate channel for signalling IO events to userspace instead of using
> the normal type-2 vmexit type event. I wonder how deeply tied the
> userspace facing side of this is to KVM? Could it provide a common FD
> type interface to IOREQ?

Why do you stick to a "FD" type interface?

> As I understand IOREQ this is currently a direct communication between
> userspace and the hypervisor using the existing Xen message bus. My

With IOREQ server, IO event occurrences are notified to BE via Xen's event
channel, while the actual contexts of IO events (see struct ioreq in ioreq.h)
are put in a queue on a single shared memory page which is to be assigned
beforehand with xenforeignmemory_map_resource hypervisor call.

> worry would be that by adding knowledge of what the underlying
> hypervisor is we'd end up with excess complexity in the kernel. For one
> thing we certainly wouldn't want an API version dependency on the kernel
> to understand which version of the Xen hypervisor it was running on.

That's exactly what virtio-proxy in my proposal[1] does; All the hypervisor-
specific details of IO event handlings are contained in virtio-proxy
and virtio BE will communicate with virtio-proxy through a virtqueue
(yes, virtio-proxy is seen as yet another virtio device on BE) and will
get IO event-related *RPC* callbacks, either MMIO read or write, from
virtio-proxy.

See page 8 (protocol flow) and 10 (interfaces) in [1].

If kvm's ioregionfd can fit into this protocol, virtio-proxy for kvm
will hopefully be implemented using ioregionfd.

-Takahiro Akashi

[1] https://op-lists.linaro.org/pipermail/stratos-dev/2021-August/000548.html

> >> There is also another problem. IOREQ is probably not be the only
> >> interface needed. Have a look at
> >> https://marc.info/?l=xen-devel&m=162373754705233&w=2. Don't we also need
> >> an interface for the backend to inject interrupts into the frontend? And
> >> if the backend requires dynamic memory mappings of frontend pages, then
> >> we would also need an interface to map/unmap domU pages.
> >> 
> >> These interfaces are a lot more problematic than IOREQ: IOREQ is tiny
> >> and self-contained. It is easy to add anywhere. A new interface to
> >> inject interrupts or map pages is more difficult to manage because it
> >> would require changes scattered across the various emulators.
> >
> > Something like ioreq is indeed necessary to implement arbitrary devices,
> > but if you are willing to restrict yourself to VIRTIO then other
> > interfaces are possible too because the VIRTIO device model is different
> > from the general purpose x86 PIO/MMIO that Xen's ioreq seems to
> > support.
> 
> It's true our focus is just VirtIO which does support alternative
> transport options however most implementations seem to be targeting
> virtio-mmio for it's relative simplicity and understood semantics
> (modulo a desire for MSI to reduce round trip latency handling
> signalling).
> 
> >
> > Stefan
> >
> > [[End of PGP Signed Part]]
> 
> 
> -- 
> Alex Bennée

