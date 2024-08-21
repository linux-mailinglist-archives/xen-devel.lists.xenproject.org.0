Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D69B69591B5
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2024 02:18:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780796.1190395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgZ1a-0002Pi-3O; Wed, 21 Aug 2024 00:16:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780796.1190395; Wed, 21 Aug 2024 00:16:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgZ1a-0002Ng-0Y; Wed, 21 Aug 2024 00:16:30 +0000
Received: by outflank-mailman (input) for mailman id 780796;
 Wed, 21 Aug 2024 00:16:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0c/y=PU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sgZ1X-0002Na-LB
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2024 00:16:27 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 994f0b74-5f52-11ef-8776-851b0ebba9a2;
 Wed, 21 Aug 2024 02:16:24 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5D28FA40A83;
 Wed, 21 Aug 2024 00:16:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85D3BC4AF09;
 Wed, 21 Aug 2024 00:16:20 +0000 (UTC)
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
X-Inumbo-ID: 994f0b74-5f52-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724199382;
	bh=T152HgXayAAnY4StgiBVjSHbJgJZFAmQr9grhZcCjz4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sbRWn+GYJ3hr9UDoKhWz2MfkfIvKoy2XxSUHUkDVr+cGzaqQcCxdC9tiJAmWJgy+k
	 rVxcWBRmnB4l2PVrgHi2/gvMPXX/YSIgvY//X2A0xsbpQekM7oLoC94xubiHbwV1Og
	 B+LrWi596QlnJ41oVymUlrZOq/fCz8ocq0fFQqdNSJq97O058mI9IJJgS3WNoUgyrV
	 EXxLCiLZhmkMAyR/uN8Ff+gwUJDamI9WLYulF1Ta4esjSzz1SVDUns7FUP2wfOwIxw
	 rM1wOLzLogJDuxAoL0ohZGzCP6WjkQXl01vJOa7lB2mBj61LK6SeQAKBumbw8s1IEI
	 ymau+PVFD8r3g==
Date: Tue, 20 Aug 2024 17:16:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
cc: Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, George Dunlap <gwd@xenproject.org>, 
    Julien Grall <julien@xen.org>, Anthony PERARD <anthony@xenproject.org>, 
    "Daniel P . Smith" <dpsmith@apertussolutions.com>, 
    "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>, 
    "Huang, Ray" <Ray.Huang@amd.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v13 3/6] x86/pvh: Add PHYSDEVOP_setup_gsi for PVH
 dom0
In-Reply-To: <BL1PR12MB58496D2638998EC4DC2572C8E78D2@BL1PR12MB5849.namprd12.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2408201713420.298534@ubuntu-linux-20-04-desktop>
References: <20240816110820.75672-1-Jiqian.Chen@amd.com> <20240816110820.75672-4-Jiqian.Chen@amd.com> <745cd8cc-59c2-44b8-b42b-1e5e0b3026ca@suse.com> <BL1PR12MB58496D2638998EC4DC2572C8E78D2@BL1PR12MB5849.namprd12.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 20 Aug 2024, Chen, Jiqian wrote:
> On 2024/8/19 17:16, Jan Beulich wrote:
> > On 16.08.2024 13:08, Jiqian Chen wrote:
> >> The gsi of a passthrough device must be configured for it to be
> >> able to be mapped into a hvm domU.
> >> But When dom0 is PVH, the gsis may not get registered(see below
> >> clarification), it causes the info of apic, pin and irq not be
> >> added into irq_2_pin list, and the handler of irq_desc is not set,
> >> then when passthrough a device, setting ioapic affinity and vector
> >> will fail.
> >>
> >> To fix above problem, on Linux kernel side, a new code will
> >> need to call PHYSDEVOP_setup_gsi for passthrough devices to
> >> register gsi when dom0 is PVH.
> >>
> >> So, add PHYSDEVOP_setup_gsi into hvm_physdev_op for above
> >> purpose.
> >>
> >> Clarify two questions:
> >> First, why the gsi of devices belong to PVH dom0 can work?
> >> Because when probe a driver to a normal device, it uses the normal
> >> probe function of pci device, in its callstack, it requests irq
> >> and unmask corresponding ioapic of gsi, then trap into xen and
> >> register gsi finally.
> >> Callstack is(on linux kernel side) pci_device_probe->
> >> request_threaded_irq-> irq_startup-> __unmask_ioapic->
> >> io_apic_write, then trap into xen hvmemul_do_io->
> >> hvm_io_intercept-> hvm_process_io_intercept->
> >> vioapic_write_indirect-> vioapic_hwdom_map_gsi-> mp_register_gsi.
> >> So that the gsi can be registered.
> >>
> >> Second, why the gsi of passthrough device can't work when dom0
> >> is PVH?
> >> Because when assign a device to passthrough, it uses the specific
> >> probe function of pciback, in its callstack, it doesn't install a
> >> fake irq handler due to the ISR is not running. So that
> >> mp_register_gsi on Xen side is never called, then the gsi is not
> >> registered.
> >> Callstack is(on linux kernel side) pcistub_probe->pcistub_seize->
> >> pcistub_init_device-> xen_pcibk_reset_device->
> >> xen_pcibk_control_isr->isr_on==0.
> > 
> > So: Underlying XSA-461 was the observation that the very limited set of
> > cases where this fake IRQ handler is installed is an issue. The problem
> > of dealing with "false" IRQs when a line-based interrupt is shared
> > between devices affects all parties, not just Dom0 and not just PV
> > guests. Therefore an alternative to the introduction of a new hypercall
> > would be to simply leverage that the installation of such a handler
> > will need widening anyway.
> > 
> > However, the installation of said handler presently also occurs in
> > cases where it's not really needed - when the line isn't shared. Thus,
> > if the handler registration would also be eliminated when it's not
> > really needed, we'd be back to needing a separate hypercall.
> > 
> > So I think first of all it needs deciding what is going to be done in
> > Linux, at least in pciback (as here we care about the Dom0 case only).
> Agree, so the current options are either to use hypercall (PHYSDEVOP_setup_gsi) or to install fake IRQ handler in pciback.
> So, we may need the inputs from the Maintainers on Linux side.
> Hi Stefano and Juergen, what about your opinions?

I would go with the PHYSDEVOP_setup_gsi solution

