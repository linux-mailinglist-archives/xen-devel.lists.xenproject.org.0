Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEA67ED832
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 00:30:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633863.989001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3PJb-0000ap-LB; Wed, 15 Nov 2023 23:28:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633863.989001; Wed, 15 Nov 2023 23:28:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3PJb-0000YU-HP; Wed, 15 Nov 2023 23:28:59 +0000
Received: by outflank-mailman (input) for mailman id 633863;
 Wed, 15 Nov 2023 23:28:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9fV7=G4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r3PJa-0000YO-9j
 for xen-devel@lists.xenproject.org; Wed, 15 Nov 2023 23:28:58 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3c87d8f-840e-11ee-98db-6d05b1d4d9a1;
 Thu, 16 Nov 2023 00:28:11 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 4FE1EB81C77;
 Wed, 15 Nov 2023 23:28:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EFB3C433C9;
 Wed, 15 Nov 2023 23:28:08 +0000 (UTC)
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
X-Inumbo-ID: a3c87d8f-840e-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700090889;
	bh=M/jeR9yb+bQoz4KRTBdahbwgkTUt+qbYI2QO6XsFDOc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kpOfgfuTWQ0V0rDnqOjmxinwdY9Cp2ZHFsUZ+Z96rnfZG8JkTyuycKCiMevhRmJHb
	 D4Q0ZnfCnS873jEix2iYAMzio925SRJqF6GsdqtZqlfgNwZLFaEuphstcQG5enGMzY
	 FAIx19+Kb+bPAkjiw7oP6gn88NhPjmpUIOlKab3Po1LR9mDG04dcP4+CNg26WuEBtY
	 HiFhV3e4VWVfWpLJmY+gSmRQ4CLrP6V4Sv6TfSduZ6zBpTDx8Bps5tbt6IwMKM6YnS
	 v5FzpY3ncqiccjeFU8hpzL5esMycGzAZoN5J3dakQA3XP4bT+tKdRaJBpuubQakAyq
	 J0tZYUkV4r7Mw==
Date: Wed, 15 Nov 2023 15:28:06 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
cc: Julien Grall <julien@xen.org>, Sergiy Kibrik <Sergiy_Kibrik@epam.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, vikram.garhwal@amd.com, 
    stewart.hildebrand@amd.com
Subject: Re: [RFC PATCH 2/6] xen/public: arch-arm: reserve resources for
 virtio-pci
In-Reply-To: <a5ce647b-f372-41ee-b1d2-b6ff16c3d1a0@epam.com>
Message-ID: <alpine.DEB.2.22.394.2311151518500.160649@ubuntu-linux-20-04-desktop>
References: <20231115112611.3865905-1-Sergiy_Kibrik@epam.com> <20231115112611.3865905-3-Sergiy_Kibrik@epam.com> <f4523916-f8aa-4f3c-a148-2fc73b0c5fa4@xen.org> <a5ce647b-f372-41ee-b1d2-b6ff16c3d1a0@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

+ Stewart, Vikram

On Wed, 15 Nov 2023, Oleksandr Tyshchenko wrote:
> On 15.11.23 14:33, Julien Grall wrote:
> > Thanks for adding support for virtio-pci in Xen. I have some questions.
> > 
> > On 15/11/2023 11:26, Sergiy Kibrik wrote:
> >> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> >>
> >> In order to enable more use-cases such as having multiple
> >> device-models (Qemu) running in different backend domains which provide
> >> virtio-pci devices for the same guest, we allocate and expose one
> >> PCI host bridge for every virtio backend domain for that guest.
> > 
> > OOI, why do you need to expose one PCI host bridge for every stubdomain?
> > 
> > In fact looking at the next patch, it seems you are handling some of the 
> > hostbridge request in Xen. This is adds a bit more confusion.
> > 
> > I was expecting the virtual PCI device would be in the vPCI and each 
> > Device emulator would advertise which BDF they are covering.
> 
> 
> This patch series only covers use-cases where the device emulator 
> handles the *entire* PCI Host bridge and PCI (virtio-pci) devices behind 
> it (i.e. Qemu). Also this patch series doesn't touch vPCI/PCI 
> pass-through resources, handling, accounting, nothing. From the 
> hypervisor we only need a help to intercept the config space accesses 
> happen in a range [GUEST_VIRTIO_PCI_ECAM_BASE ... 
> GUEST_VIRTIO_PCI_ECAM_BASE + GUEST_VIRTIO_PCI_TOTAL_ECAM_SIZE] and 
> forward them to the linked device emulator (if any), that's all.
> 
> It is not possible (with current series) to run device emulators what
> emulate only separate PCI (virtio-pci) devices. For it to be possible, I 
> think, much more changes are required than current patch series does. 
> There at least should be special PCI Host bridge emulation in Xen (or 
> reuse vPCI) for the integration. Also Xen should be in charge of forming 
> resulting PCI interrupt based on each PCI device level signaling (if we 
> use legacy interrupts), some kind of x86's XEN_DMOP_set_pci_intx_level, 
> etc. Please note, I am not saying this is not possible in general, 
> likely it is possible, but initial patch series doesn't cover these 
> use-cases)
>
> We expose one PCI host bridge per virtio backend domain. This is a 
> separate PCI host bridge to combine all virtio-pci devices running in 
> the same backend domain (in the same device emulator currently).
> The examples:
> - if only one domain runs Qemu which servers virtio-blk, virtio-net, 
> virtio-console devices for DomU - only single PCI Host bridge will be 
> exposed for DomU
> - if we add another domain to run Qemu to serve additionally virtio-gpu, 
> virtio-input and virtio-snd for the *same* DomU - we expose second PCI 
> Host bridge for DomU
> 
> I am afraid, we cannot end up exposing only single PCI Host bridge with 
> current model (if we use device emulators running in different domains 
> that handles the *entire* PCI Host bridges), this won't work.
 

We were discussing the topic of vPCI and Virtio PCI just this morning
with Stewart and Vikram. We also intend to make them work well together
in the next couple of months (great timing!!)

However, our thinking is to go with the other approach Julien
suggested: a single PCI Root Complex emulated in Xen by vPCI. QEMU would
register individual PCI devices against it.

Vikram, Stewart, please comment. Our understanding is that it should be
possible to make QEMU virtio-pci work with vPCI with relatively minor
efforts and AMD volunteers to do the work in the next couple of months
on the vPCI side.


Although it should be possible to make both approaches work at the same
time, given that it would seem that EPAM and AMD have very similar
requirements, I suggest we work together and collaborate on a single
approach going forward that works best for everyone.


Let me start by saying that if we can get away with it, I think that a
single PCI Root Complex in Xen would be best because it requires less
complexity. Why emulate 2/3 PCI Root Complexes if we can emulate only
one?

Stewart, you are deep into vPCI, what's your thinking?

