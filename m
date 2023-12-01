Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C628001EA
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 04:10:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645256.1007326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8tu5-0008Em-R7; Fri, 01 Dec 2023 03:09:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645256.1007326; Fri, 01 Dec 2023 03:09:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8tu5-0008CH-ON; Fri, 01 Dec 2023 03:09:21 +0000
Received: by outflank-mailman (input) for mailman id 645256;
 Fri, 01 Dec 2023 03:09:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QmaB=HM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r8tu3-0008Af-Rx
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 03:09:19 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02e39036-8ff7-11ee-9b0f-b553b5be7939;
 Fri, 01 Dec 2023 04:09:16 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id D644AB8460F;
 Fri,  1 Dec 2023 03:09:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EB66C433C9;
 Fri,  1 Dec 2023 03:09:13 +0000 (UTC)
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
X-Inumbo-ID: 02e39036-8ff7-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701400155;
	bh=phjQR8JbHlcd128mywIFmoYoSk+lvwB8cAN5LEYu2ZQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=teOHTqveaTaBUaNVXcPrVDCyf0eE3f0Zs232XCfPjwJvwoSMT0AFfbLPZd/8NrKfF
	 veVVhz4S5sIoH29bE+lrlPQwOVTH6dvtGc2Px0l/pGyjmMhJVuWRXIcVKpVGCiXFet
	 sZ1gwFbftkz8AwQNQeCCbTHxGVRE8ao5x6raahIT5AOKJCpxN0jKoaUlXm630C1qv/
	 a/qEZtv7Oq5QJ59NfpQkOOWkf/d5thxLjlwm/CRRSgfFguiBbbPJgwTu3PUc+YZtEX
	 PVMDYkPadYoKNEaseb3Z2EPhcsmAKPujulQ9TNfiUJ7tKsr5nvarW47uYgKNQe9wHr
	 IDB9Umdq2cFjQ==
Date: Thu, 30 Nov 2023 19:09:12 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Jiqian Chen <Jiqian.Chen@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, 
    Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, 
    Stewart Hildebrand <Stewart.Hildebrand@amd.com>, 
    Alex Deucher <Alexander.Deucher@amd.com>, 
    Xenia Ragiadakou <xenia.ragiadakou@amd.com>, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    Huang Rui <Ray.Huang@amd.com>, Honglei Huang <Honglei1.Huang@amd.com>, 
    Julia Zhang <Julia.Zhang@amd.com>
Subject: Re: [RFC XEN PATCH v2 3/3] tools: Add new function to get gsi from
 irq
In-Reply-To: <ZWheuUjLxShoQ_qn@macbook>
Message-ID: <alpine.DEB.2.22.394.2311301907370.110490@ubuntu-linux-20-04-desktop>
References: <20231124104136.3263722-1-Jiqian.Chen@amd.com> <20231124104136.3263722-4-Jiqian.Chen@amd.com> <ZWX4R9UEE6oXiqaz@macbook> <alpine.DEB.2.22.394.2311291937170.3533093@ubuntu-linux-20-04-desktop> <alpine.DEB.2.22.394.2311291956130.3533093@ubuntu-linux-20-04-desktop>
 <ZWheuUjLxShoQ_qn@macbook>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2084307848-1701400155=:110490"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2084307848-1701400155=:110490
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 30 Nov 2023, Roger Pau Monné wrote:
> On Wed, Nov 29, 2023 at 08:02:40PM -0800, Stefano Stabellini wrote:
> > n Wed, 29 Nov 2023, Stefano Stabellini wrote:
> > > On Tue, 28 Nov 2023, Roger Pau Monné wrote:
> > > > On Fri, Nov 24, 2023 at 06:41:36PM +0800, Jiqian Chen wrote:
> > > > > In PVH dom0, it uses the linux local interrupt mechanism,
> > > > > when it allocs irq for a gsi, it is dynamic, and follow
> > > > > the principle of applying first, distributing first. And
> > > > > if you debug the kernel codes, you will find the irq
> > > > > number is alloced from small to large, but the applying
> > > > > gsi number is not, may gsi 38 comes before gsi 28, that
> > > > > causes the irq number is not equal with the gsi number.
> > > > > And when we passthrough a device, QEMU will use its gsi
> > > > > number to do mapping actions, see xen_pt_realize->
> > > > > xc_physdev_map_pirq, but the gsi number is got from file
> > > > > /sys/bus/pci/devices/xxxx:xx:xx.x/irq in current code,
> > > > > so it will fail when mapping.
> > > > > And in current codes, there is no method to translate
> > > > > irq to gsi for userspace.
> > > > 
> > > > I think it would be cleaner to just introduce a new sysfs node that
> > > > contains the gsi if a device is using one (much like the irq sysfs
> > > > node)?
> > > > 
> > > > Such ioctl to translate from IRQ to GSI has nothing to do with Xen, so
> > > > placing it in privcmd does seem quite strange to me.  I understand
> > > > that for passthrough we need the GSI, but such translation layer from
> > > > IRQ to GSI is all Linux internal, and it would be much simpler to just
> > > > expose the GSI in sysfs IMO.
> > > 
> > > Maybe something to add to drivers/xen/sys-hypervisor.c in Linux.
> > > Juergen what do you think?
> > 
> > Let me also add that privcmd.c is already a Linux specific interface.
> > Although it was born to be a Xen hypercall "proxy" in reality today we
> > have a few privcmd ioctls that don't translate into hypercalls. So I
> > don't think that adding IOCTL_PRIVCMD_GSI_FROM_IRQ would be a problem.
> 
> Maybe not all ioctls translate to hypercalls (I guess you are
> referring to the IOCTL_PRIVCMD_RESTRICT ioctl), but they are specific
> Xen actions.  Getting the GSI used by a device has nothing do to with
> Xen.
> 
> IMO drivers/xen/sys-hypervisor.c is also not appropriate, but I'm not
> the maintainer of any of those components.
> 
> There's nothing Xen specific about fetching the GSI associated with a
> PCI device.  The fact that Xen needs it for passthrough is just a red
> herring, further cases where the GSI is needed might arise outside of
> Xen, and hence such node would better be placed in a generic
> location.  The right location should be /sys/bus/pci/devices/<sbdf>/gsi.

That might be true but /sys/bus/pci/devices/<sbdf>/gsi is a non-Xen
generic interface and the maintainers of that portion of Linux code
might have a different opinion. We'll have to see.
--8323329-2084307848-1701400155=:110490--

