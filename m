Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64485703EE4
	for <lists+xen-devel@lfdr.de>; Mon, 15 May 2023 22:53:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534843.832240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyfBZ-0004I7-SR; Mon, 15 May 2023 20:52:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534843.832240; Mon, 15 May 2023 20:52:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyfBZ-0004Fm-Pn; Mon, 15 May 2023 20:52:49 +0000
Received: by outflank-mailman (input) for mailman id 534843;
 Mon, 15 May 2023 20:52:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l5iH=BE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pyfBY-0004Fe-J5
 for xen-devel@lists.xenproject.org; Mon, 15 May 2023 20:52:48 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 716a1ede-f362-11ed-8611-37d641c3527e;
 Mon, 15 May 2023 22:52:46 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 154D562581;
 Mon, 15 May 2023 20:52:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 847BCC433EF;
 Mon, 15 May 2023 20:52:42 +0000 (UTC)
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
X-Inumbo-ID: 716a1ede-f362-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684183964;
	bh=vFlYQqO3R9fOaZp2LVY9Z+RN0/K9dfAVdbzmSfTgbw4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nvcNWasF6UzLB0DOBemuVmZcHn90y1zST/K20ymRDNVcPV5Emznx3lE8kjUEa1XY+
	 7SBWvkNJVnq+lpegKAG/wfU29l25mLm385iO1Ty/pJGKXTOwy02QXtkl+OZnC6iCwT
	 DpVMxJinh7MnOOSlFSg3J2YBMpR9p3wInxQbPRB0ZqLkpJ3ZsVvjwnDNV5YQgmZb6d
	 wAukcTbFLNw0NN12BOxkdG9mutU3H+0GtraPDgj50KeaVHX8c4aO48+ZdPGGye91V4
	 KV8RfJ/6EJj/DvB2E8raHNCYe8gDs+VulVgfr4kKGWAzDd8RZTEZGbyHsLYJNab09g
	 INdgxJie+4+Tw==
Date: Mon, 15 May 2023 13:52:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Bernhard Beschow <shentey@gmail.com>, mst@redhat.com
cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
    Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
    David Woodhouse <dwmw@amazon.co.uk>, Eduardo Habkost <eduardo@habkost.net>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Chuck Zmudzinski <brchuckz@aol.com>, Aurelien Jarno <aurelien@aurel32.net>, 
    =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
    Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>, 
    =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
    Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 0/7] Resolve TYPE_PIIX3_XEN_DEVICE
In-Reply-To: <9EB9A984-61E5-4226-8352-B5DDC6E2C62E@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2305151350180.4125828@ubuntu-linux-20-04-desktop>
References: <20230403074124.3925-1-shentey@gmail.com> <20230421033757-mutt-send-email-mst@kernel.org> <9EB9A984-61E5-4226-8352-B5DDC6E2C62E@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 13 May 2023, Bernhard Beschow wrote:
> Am 21. April 2023 07:38:10 UTC schrieb "Michael S. Tsirkin" <mst@redhat.com>:
> >On Mon, Apr 03, 2023 at 09:41:17AM +0200, Bernhard Beschow wrote:
> >> There is currently a dedicated PIIX3 device model for use under Xen. By reusing
> >> existing PCI API during initialization this device model can be eliminated and
> >> the plain PIIX3 device model can be used instead.
> >> 
> >> Resolving TYPE_PIIX3_XEN_DEVICE results in less code while also making Xen
> >> agnostic towards the precise south bridge being used in the PC machine. The
> >> latter might become particularily interesting once PIIX4 becomes usable in the
> >> PC machine, avoiding the "Frankenstein" use of PIIX4_ACPI in PIIX3.
> >
> >xen stuff so I assume that tree?
> 
> Ping

I am OK either way. Michael, what do you prefer?

Normally I would suggest for you to pick up the patches. But as it
happens I'll have to likely send another pull request in a week or two
and I can add these patches to it.

Let me know your preference and I am happy to follow it.


> >
> >> Testing done:
> >> - `make check`
> >> - Run `xl create` with the following config:
> >>     name = "Manjaro"
> >>     type = 'hvm'
> >>     memory = 1536
> >>     apic = 1
> >>     usb = 1
> >>     disk = [ "file:manjaro-kde-21.2.6-220416-linux515.iso,hdc:cdrom,r" ]
> >>     device_model_override = "/usr/bin/qemu-system-x86_64"
> >>     vga = "stdvga"
> >>     sdl = 1
> >> - `qemu-system-x86_64 -M pc -m 2G -cpu host -accel kvm \
> >>     -cdrom manjaro-kde-21.2.6-220416-linux515.iso`
> >> 
> >> v4:
> >> - Add patch fixing latent memory leak in pci_bus_irqs() (Anthony)
> >> 
> >> v3:
> >> - Rebase onto master
> >> 
> >> v2:
> >> - xen_piix3_set_irq() is already generic. Just rename it. (Chuck)
> >> 
> >> Tested-by: Chuck Zmudzinski <brchuckz@aol.com>
> >> 
> >> Bernhard Beschow (7):
> >>   include/hw/xen/xen: Rename xen_piix3_set_irq() to xen_intx_set_irq()
> >>   hw/pci/pci.c: Don't leak PCIBus::irq_count[] in pci_bus_irqs()
> >>   hw/isa/piix3: Reuse piix3_realize() in piix3_xen_realize()
> >>   hw/isa/piix3: Wire up Xen PCI IRQ handling outside of PIIX3
> >>   hw/isa/piix3: Avoid Xen-specific variant of piix3_write_config()
> >>   hw/isa/piix3: Resolve redundant k->config_write assignments
> >>   hw/isa/piix3: Resolve redundant TYPE_PIIX3_XEN_DEVICE
> >> 
> >>  include/hw/southbridge/piix.h |  1 -
> >>  include/hw/xen/xen.h          |  2 +-
> >>  hw/i386/pc_piix.c             | 36 +++++++++++++++++++--
> >>  hw/i386/xen/xen-hvm.c         |  2 +-
> >>  hw/isa/piix3.c                | 60 +----------------------------------
> >>  hw/pci/pci.c                  |  2 ++
> >>  stubs/xen-hw-stub.c           |  2 +-
> >>  7 files changed, 39 insertions(+), 66 deletions(-)
> >> 
> >> -- 
> >> 2.40.0
> >> 
> >
> 

