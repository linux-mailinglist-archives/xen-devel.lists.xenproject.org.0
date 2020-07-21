Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91759228519
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 18:14:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxuuF-0005jG-0r; Tue, 21 Jul 2020 16:14:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eoy0=BA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jxuuD-0005iW-EV
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 16:14:13 +0000
X-Inumbo-ID: 35b4c1fd-cb6d-11ea-a104-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 35b4c1fd-cb6d-11ea-a104-12813bfff9fa;
 Tue, 21 Jul 2020 16:14:11 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1974E2073A;
 Tue, 21 Jul 2020 16:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595348050;
 bh=o37mSLsBpei9M8OpR/mn+lg5+r6LO58MP71JMJFXW8s=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=uuwy9Q+0XIt3ZFQPA9Km5xNRxjFNYWzh+GQf6rJ86Z+l/OJSlu+zm9X2c/cpEjv/8
 9NcNUtS5cqJwNwr7XE1+l2E99TheM8EPjSJgSeN7R4MgndB/LOUuGEVv1bkGCJbFev
 4Lb0BLrByLIrpNaPqTxabblrQMk+8eFNvF4TdABg=
Date: Tue, 21 Jul 2020 09:14:08 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: Virtio in Xen on Arm (based on IOREQ concept)
In-Reply-To: <87mu3tufhn.fsf@linaro.org>
Message-ID: <alpine.DEB.2.21.2007210901480.32544@sstabellini-ThinkPad-T480s>
References: <CAPD2p-nthLq5NaU32u8pVaa-ub=a9-LOPenupntTYdS-cu31jQ@mail.gmail.com>
 <20200717150039.GV7191@Air-de-Roger>
 <8f4e0c0d-b3d4-9dd3-ce20-639539321968@gmail.com>
 <20200720091722.GF7191@Air-de-Roger>
 <10eaec62-2c48-52ae-d113-1681c87e3d59@xen.org>
 <20200720102023.GH7191@Air-de-Roger>
 <alpine.DEB.2.21.2007201322060.32544@sstabellini-ThinkPad-T480s>
 <390f3a67-5ca5-d9bd-f13a-2c5920bad45a@xen.org> <87mu3tufhn.fsf@linaro.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-76670381-1595348050=:32544"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Oleksandr Andrushchenko <andr2000@gmail.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Oleksandr <olekstysh@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Artem Mygaiev <joculator@gmail.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-76670381-1595348050=:32544
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 21 Jul 2020, Alex Bennée wrote:
> Julien Grall <julien@xen.org> writes:
> 
> > Hi Stefano,
> >
> > On 20/07/2020 21:37, Stefano Stabellini wrote:
> >> On Mon, 20 Jul 2020, Roger Pau Monné wrote:
> >>> On Mon, Jul 20, 2020 at 10:40:40AM +0100, Julien Grall wrote:
> >>>>
> >>>>
> >>>> On 20/07/2020 10:17, Roger Pau Monné wrote:
> >>>>> On Fri, Jul 17, 2020 at 09:34:14PM +0300, Oleksandr wrote:
> >>>>>> On 17.07.20 18:00, Roger Pau Monné wrote:
> >>>>>>> On Fri, Jul 17, 2020 at 05:11:02PM +0300, Oleksandr Tyshchenko wrote:
> >>>>>>> Do you have any plans to try to upstream a modification to the VirtIO
> >>>>>>> spec so that grants (ie: abstract references to memory addresses) can
> >>>>>>> be used on the VirtIO ring?
> >>>>>>
> >>>>>> But VirtIO spec hasn't been modified as well as VirtIO infrastructure in the
> >>>>>> guest. Nothing to upsteam)
> >>>>>
> >>>>> OK, so there's no intention to add grants (or a similar interface) to
> >>>>> the spec?
> >>>>>
> >>>>> I understand that you want to support unmodified VirtIO frontends, but
> >>>>> I also think that long term frontends could negotiate with backends on
> >>>>> the usage of grants in the shared ring, like any other VirtIO feature
> >>>>> negotiated between the frontend and the backend.
> >>>>>
> >>>>> This of course needs to be on the spec first before we can start
> >>>>> implementing it, and hence my question whether a modification to the
> >>>>> spec in order to add grants has been considered.
> >>>> The problem is not really the specification but the adoption in the
> >>>> ecosystem. A protocol based on grant-tables would mostly only be used by Xen
> >>>> therefore:
> >>>>     - It may be difficult to convince a proprietary OS vendor to invest
> >>>> resource on implementing the protocol
> >>>>     - It would be more difficult to move in/out of Xen ecosystem.
> >>>>
> >>>> Both, may slow the adoption of Xen in some areas.
> >>>
> >>> Right, just to be clear my suggestion wasn't to force the usage of
> >>> grants, but whether adding something along this lines was in the
> >>> roadmap, see below.
> >>>
> >>>> If one is interested in security, then it would be better to work with the
> >>>> other interested parties. I think it would be possible to use a virtual
> >>>> IOMMU for this purpose.
> >>>
> >>> Yes, I've also heard rumors about using the (I assume VirtIO) IOMMU in
> >>> order to protect what backends can map. This seems like a fine idea,
> >>> and would allow us to gain the lost security without having to do the
> >>> whole work ourselves.
> >>>
> >>> Do you know if there's anything published about this? I'm curious
> >>> about how and where in the system the VirtIO IOMMU is/should be
> >>> implemented.
> >> 
> >> Not yet (as far as I know), but we have just started some discussons on
> >> this topic within Linaro.
> >> 
> >> 
> >> You should also be aware that there is another proposal based on
> >> pre-shared-memory and memcpys to solve the virtio security issue:
> >> 
> >> https://marc.info/?l=linux-kernel&m=158807398403549
> >> 
> >> It would be certainly slower than the "virtio IOMMU" solution but it
> >> would take far less time to develop and could work as a short-term
> >> stop-gap.
> >
> > I don't think I agree with this blank statement. In the case of "virtio 
> > IOMMU", you would need to potentially map/unmap pages every request 
> > which would result to a lot of back and forth to the hypervisor.

Yes, that's true.


> Can a virtio-iommu just set bounds when a device is initialised as to
> where memory will be in the kernel address space?

First let me premise to avoid possible miscommunication that what Julien
and I are calling "virtio IOMMU" is not an existing virtio-iommu driver
of some sort, but an idea for a cross-domain virtual IOMMU for the sake
of the frontends to explicitly permit memory to be accessed by the
backends. Hopefully it was clear already but better be sure :-)


If you are asking whether it would be possible to use the virtual IOMMU
just to setup memory at startup time, then it certainly could, but
effectively we would end up with one of the following scenarios:

1) one pre-shared bounce buffer
Effectively the same as https://marc.info/?l=linux-kernel&m=158807398403549
still requires memcpys
could still be nicer than Qualcomm's proposal because easier to
configure?

2) all domU memory allowed access to the backend
Not actually any more secure than placing the backends in dom0


Otherwise we need the dynamic maps/unmaps.

For completeness, if we could write the whole software stack from
scratch, it would also be possible to architect a protocol (like
virtio-net) and the software stack above it to always allocate memory
from a given buffer (the pre-shared buffer), hence greatly reducing the
amount of required memcpys, maybe even down to zero. In reality, most
interfaces in Linux and POSIX userspace expect the application to be the
one providing the buffer, hence they would require memcpys in the kernel
to move data between the user-provided buffers and the pre-shared buffers.
--8323329-76670381-1595348050=:32544--

