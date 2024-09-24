Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36782984ECD
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 01:17:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803371.1213904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stEm2-0001iG-Jm; Tue, 24 Sep 2024 23:16:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803371.1213904; Tue, 24 Sep 2024 23:16:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stEm2-0001gl-Gy; Tue, 24 Sep 2024 23:16:50 +0000
Received: by outflank-mailman (input) for mailman id 803371;
 Tue, 24 Sep 2024 23:16:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=325E=QW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1stEm1-0001gf-0R
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 23:16:49 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11b7aac8-7acb-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 01:16:47 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 05AA6A43966;
 Tue, 24 Sep 2024 23:16:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D93BC4CEC4;
 Tue, 24 Sep 2024 23:16:44 +0000 (UTC)
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
X-Inumbo-ID: 11b7aac8-7acb-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727219805;
	bh=SZLmb9VQ9zDGXnOGuXKRN8Vm7e/3QEb5HI0s6Z8Efuc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QBWOd9PniogsIUtZyFtzgxcn6zntmhE5+PaPei/zi+/CERi8qlY4VcWLV/tim3Gu9
	 iKSQ36tWNcycKTpgwLf1pLPcIa5QVOtghVJLth1BHHfi1Xp3PloGci/OBgWVn34J6O
	 gJSXFIiSgcTym0O9Fl6eXSNWnXGm4Ao8glIJPG8jIBC6qu5eZ8hGkFfQl5yXtSQKpC
	 VXOXeR2UiA3BD0RPED4891Anh1KZQtjv7HvVuXeJyurFOVnkM1SXU81D1ZNTG2nbHM
	 yEK2WLFwHgzmm8ggthoITn4xOIRqwjNVvbb4VVhm0Iz41RXQhhGsgV0IdrKgufgPcd
	 CY1Tz4lzSMvHg==
Date: Tue, 24 Sep 2024 16:16:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: "Edgar E. Iglesias" <edgar.iglesias@amd.com>, 
    "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
    xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, 
    dpsmith@apertussolutions.com
Subject: Re: [PATCH v1 2/6] xen/arm: Reserve resources for virtio-pci
In-Reply-To: <7b867cf0-9d4b-4067-ac56-a7d6b3d440f5@xen.org>
Message-ID: <alpine.DEB.2.22.394.2409241559150.1417852@ubuntu-linux-20-04-desktop>
References: <20240924162359.1390487-1-edgar.iglesias@gmail.com> <20240924162359.1390487-3-edgar.iglesias@gmail.com> <465cb8b5-5f46-42ce-be8f-a38c1c23a805@xen.org> <ZvLyzZ8n-QgrYOCW@zapote> <7b867cf0-9d4b-4067-ac56-a7d6b3d440f5@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1353379977-1727218876=:1417852"
Content-ID: <alpine.DEB.2.22.394.2409241601180.1417852@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1353379977-1727218876=:1417852
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2409241601181.1417852@ubuntu-linux-20-04-desktop>

On Tue, 24 Sep 2024, Julien Grall wrote:
> On 24/09/2024 18:11, Edgar E. Iglesias wrote:
> > On Tue, Sep 24, 2024 at 05:35:20PM +0100, Julien Grall wrote:
> > > Hi Edgar,
> > > 
> > > On 24/09/2024 17:23, Edgar E. Iglesias wrote:
> > > > From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> > > > 
> > > > Reserve memory ranges and interrupt lines for an externally
> > > > emulated PCI controller (e.g by QEMU) dedicated to hosting
> > > > Virtio devices and potentially other emulated devices.
> > > > 
> > > > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> > > > ---
> > > >    xen/include/public/arch-arm.h | 17 +++++++++++++++++
> > > >    1 file changed, 17 insertions(+)
> > > > 
> > > > diff --git a/xen/include/public/arch-arm.h
> > > > b/xen/include/public/arch-arm.h
> > > > index e19f0251a6..654b827715 100644
> > > > --- a/xen/include/public/arch-arm.h
> > > > +++ b/xen/include/public/arch-arm.h
> > > > @@ -494,6 +494,20 @@ typedef uint64_t xen_callback_t;
> > > >    #define GUEST_RAM1_BASE   xen_mk_ullong(0x0200000000) /* 952GB of RAM
> > > > @ 8GB */
> > > >    #define GUEST_RAM1_SIZE   xen_mk_ullong(0xee00000000)
> > > > +/* Virtio PCI - Ordered by decreasing size to keep things aligned */
> > > > +#define GUEST_VIRTIO_PCI_PREFETCH_MEM_TYPE  xen_mk_ullong(0x43000000)
> > > > +#define GUEST_VIRTIO_PCI_PREFETCH_MEM_BASE
> > > > xen_mk_ullong(0x0f000000000)
> > > > +#define GUEST_VIRTIO_PCI_PREFETCH_MEM_SIZE  xen_mk_ullong(0x100000000)
> > > > +
> > > > +#define GUEST_VIRTIO_PCI_ECAM_BASE
> > > > (GUEST_VIRTIO_PCI_PREFETCH_MEM_BASE + \
> > > > +
> > > > GUEST_VIRTIO_PCI_PREFETCH_MEM_SIZE)
> > > > +#define GUEST_VIRTIO_PCI_ECAM_SIZE      xen_mk_ullong(0x10000000)
> > > > +
> > > > +#define GUEST_VIRTIO_PCI_MEM_TYPE         xen_mk_ullong(0x02000000)
> > > > +#define GUEST_VIRTIO_PCI_MEM_BASE         (GUEST_VIRTIO_PCI_ECAM_BASE +
> > > > \
> > > > +                                           GUEST_VIRTIO_PCI_ECAM_SIZE)
> > > > +#define GUEST_VIRTIO_PCI_MEM_SIZE         xen_mk_ullong(0x00002000000)
> > > 
> > > Why is this specific to virtio PCI? However, I am not entirely convinced
> > > we
> > > should have a second PCI hostbridge exposed to the guest for a few
> > > reasons:
> > >    1. This require to reserve yet another range in the address space
> > > (could
> > > be solved with a more dynamic layout)
> > >    2. From your instructions, the guest needs to explicitly do a PCI
> > > rescan.
> 
> Another big advantage I forgot to mention is disaggregation. In a world where
> the hostbridge is handled in Xen, you could have a PCI device emulated by dom0
> while the other is emulated by a stub domain.
> 
> > > 
> > > So rather than having a second hostbridge, have you considered to extend
> > > the
> > > existing hostbridge (implemented in Xen) to support a mix of physical PCI
> > > device and virtual one?
> > > 
> > 
> > Thanks Julien,
> > 
> > It's briefly come up in a couple of discussions but I haven't looked
> > carefully at it. It is a good idea and it's probably worth prototyping
> > to see what the gaps are in hypercall interfaces, QEMU support etc.
> 
> I also vaguely recall to discuss it on xen-devel. But I couldn't find the
> discussion... :(.
> 
> I think all the hypercalls should be there but will require some plumbing in
> Xen on Arm. QEMU should be able to request Xen to forward configuration access
> for a given PCI device (see XEN_DMOP_IO_RANGE_PCI). They will then be
> forwarded to QEMU using IOREQ_TYPE_PCI_CONFIG.
> 
> We also have an hypercall to be able to inject interrupts from QEMU (see
> XEN_DMOP_set_irq_level).

Hi Julien,

Yes, I remember a thread on xen-devel too about this topic when EPAM
suggested a similar two-hostbridges approach. I was one of the people
suggesting to use a single hostbridge at the time.

However, when we looked at the implementation more closely, the
two-hostbridge approach was easier to get up and running. It works
(almost) out of the box. Currently, we have the two-hostbridge solution
working on both ARM and x86 to enable virtio-pci to work alongside vPCI
in Dom0less/Hyperlaunch configurations.

While I think that a single hostbridge is better architecturally, it is
important to consider that virtio is moving toward a new transport
(virtio-msg, Bertrand is also involved) which does not require a
hostbridge. This new transport is key for all our use-cases as it
addresses safety requirements and supports AMP configurations without a
shared hypervisor between the frontend and backend. Edgar is one of the
top contributors to virtio-msg. Given this, I don't think it's
worthwhile to invest much effort in virtio-pci, as it will be replaced
soon in embedded applications.

Cheers,
Stefano
--8323329-1353379977-1727218876=:1417852--

