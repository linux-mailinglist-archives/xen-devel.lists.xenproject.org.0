Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6A122860F
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 18:43:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxvLE-0008Cj-Mp; Tue, 21 Jul 2020 16:42:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eoy0=BA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jxvLC-0008Ce-LP
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 16:42:06 +0000
X-Inumbo-ID: 1c544436-cb71-11ea-8576-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1c544436-cb71-11ea-8576-bc764e2007e4;
 Tue, 21 Jul 2020 16:42:05 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BF9EA207BB;
 Tue, 21 Jul 2020 16:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595349725;
 bh=lykWmdVeGNWnPl+dJlt+xFuRfHrrA3E3hZtNRghIMnU=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=mHqCXNbfrQZ5Hx9t09buaTY0xsGdbEXP6E893JZL8VU1sEgkd4FtLW4lne6yxa5it
 qn+ciGXE2fPNsrgzuHihD8VtZOtIu6tsQf7dDf+A5u/sfx5BV5aUHIYMotSue23/kt
 uVKkp7h+qL1N/ghozCiwDSgXMulD46eYV32l8SrQ=
Date: Tue, 21 Jul 2020 09:42:04 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: Virtio in Xen on Arm (based on IOREQ concept)
In-Reply-To: <8f125464-a0c2-dd71-6d51-eaf13259e727@xen.org>
Message-ID: <alpine.DEB.2.21.2007210939510.32544@sstabellini-ThinkPad-T480s>
References: <CAPD2p-nthLq5NaU32u8pVaa-ub=a9-LOPenupntTYdS-cu31jQ@mail.gmail.com>
 <20200717150039.GV7191@Air-de-Roger>
 <8f4e0c0d-b3d4-9dd3-ce20-639539321968@gmail.com>
 <alpine.DEB.2.21.2007201326060.32544@sstabellini-ThinkPad-T480s>
 <56e512af-993b-1364-be56-fc4be5d88519@xen.org>
 <87k0yxuf89.fsf@linaro.org> <8f125464-a0c2-dd71-6d51-eaf13259e727@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1593658400-1595349725=:32544"
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <andr2000@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Oleksandr <olekstysh@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Artem Mygaiev <joculator@gmail.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1593658400-1595349725=:32544
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 21 Jul 2020, Julien Grall wrote:
> Hi Alex,
> 
> Thank you for your feedback!
> 
> On 21/07/2020 15:15, Alex Bennée wrote:
> > Julien Grall <julien@xen.org> writes:
> > 
> > > (+ Andree for the vGIC).
> > > 
> > > Hi Stefano,
> > > 
> > > On 20/07/2020 21:38, Stefano Stabellini wrote:
> > > > On Fri, 17 Jul 2020, Oleksandr wrote:
> > > > > > > *A few word about solution:*
> > > > > > > As it was mentioned at [1], in order to implement virtio-mmio Xen
> > > > > > > on Arm
> > > > > > Any plans for virtio-pci? Arm seems to be moving to the PCI bus, and
> > > > > > it would be very interesting from a x86 PoV, as I don't think
> > > > > > virtio-mmio is something that you can easily use on x86 (or even use
> > > > > > at all).
> > > > > 
> > > > > Being honest I didn't consider virtio-pci so far. Julien's PoC (we are
> > > > > based
> > > > > on) provides support for the virtio-mmio transport
> > > > > 
> > > > > which is enough to start working around VirtIO and is not as complex
> > > > > as
> > > > > virtio-pci. But it doesn't mean there is no way for virtio-pci in Xen.
> > > > > 
> > > > > I think, this could be added in next steps. But the nearest target is
> > > > > virtio-mmio approach (of course if the community agrees on that).
> > > 
> > > > Aside from complexity and easy-of-development, are there any other
> > > > architectural reasons for using virtio-mmio?
> > > 
> > <snip>
> > > > 
> > > > For instance, what's your take on notifications with virtio-mmio? How
> > > > are they modelled today?
> > > 
> > > The backend will notify the frontend using an SPI. The other way around
> > > (frontend -> backend) is based on an MMIO write.
> > > 
> > > We have an interface to allow the backend to control whether the
> > > interrupt level (i.e. low, high). However, the "old" vGIC doesn't handle
> > > properly level interrupts. So we would end up to treat level interrupts
> > > as edge.
> > > 
> > > Technically, the problem is already existing with HW interrupts, but the
> > > HW should fire it again if the interrupt line is still asserted. Another
> > > issue is the interrupt may fire even if the interrupt line was
> > > deasserted (IIRC this caused some interesting problem with the Arch
> > > timer).
> > > 
> > > I am a bit concerned that the issue will be more proeminent for virtual
> > > interrupts. I know that we have some gross hack in the vpl011 to handle
> > > a level interrupts. So maybe it is time to switch to the new vGIC?
> > > 
> > > > Are they good enough or do we need MSIs?
> > > 
> > > I am not sure whether virtio-mmio supports MSIs. However for virtio-pci,
> > > MSIs is going to be useful to improve performance. This may mean to
> > > expose an ITS, so we would need to add support for guest.
> > 
> > virtio-mmio doesn't support MSI's at the moment although there have been
> > proposals to update the spec to allow them. At the moment the cost of
> > reading the ISR value and then writing an ack in vm_interrupt:
> > 
> > 	/* Read and acknowledge interrupts */
> > 	status = readl(vm_dev->base + VIRTIO_MMIO_INTERRUPT_STATUS);
> > 	writel(status, vm_dev->base + VIRTIO_MMIO_INTERRUPT_ACK);
> > 
> 
> Hmmmm, the current way to handle MMIO is the following:
>     * pause the vCPU
>     * Forward the access to the backend domain
>     * Schedule the backend domain
>     * Wait for the access to be handled
>     * unpause the vCPU
> 
> So the sequence is going to be fairly expensive on Xen.
> 
> > puts an extra vmexit cost to trap an emulate each exit. Getting an MSI
> > via an exitless access to the GIC would be better I think.
> > I'm not quite
> > sure what the path to IRQs from Xen is.
> 
> vmexit on Xen on Arm is pretty cheap compare to KVM as we don't save a lot of
> things. In this situation, they handling an extra trap for the interrupt is
> likely to be meaningless compare to the sequence above.

+1


> I am assuming the sequence is also going to be used by the MSIs, right?
> 
> It feels to me that it would be worth spending time to investigate the cost of
> that sequence. It might be possible to optimize the ACK and avoid to wait for
> the backend to handle the access.

+1
--8323329-1593658400-1595349725=:32544--

