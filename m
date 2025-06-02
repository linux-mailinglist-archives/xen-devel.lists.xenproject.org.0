Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1EFACBC21
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 22:04:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003796.1383407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMBNX-0006ov-1H; Mon, 02 Jun 2025 20:03:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003796.1383407; Mon, 02 Jun 2025 20:03:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMBNW-0006n5-UG; Mon, 02 Jun 2025 20:03:26 +0000
Received: by outflank-mailman (input) for mailman id 1003796;
 Mon, 02 Jun 2025 20:03:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pxQh=YR=antarean.org=joost@srs-se1.protection.inumbo.net>)
 id 1uMBNV-0006mz-Ba
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 20:03:25 +0000
Received: from gw3.antarean.org (gw3.antarean.org [84.247.13.64])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id a3c037bd-3fec-11f0-a300-13f23c93f187;
 Mon, 02 Jun 2025 22:03:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by gw3.antarean.org (Postfix) with ESMTP id 4bB4Y24pZZzNsTk;
 Mon, 02 Jun 2025 22:03:50 +0200 (CEST)
Received: from gw3.antarean.org ([127.0.0.1])
 by localhost (gw3.antarean.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8OESF7r7NInZ; Mon,  2 Jun 2025 22:03:50 +0200 (CEST)
Received: from mailstore1.adm.antarean.org (localhost [127.0.0.1])
 by gw3.antarean.org (Postfix) with ESMTP id 4bB4Y244pTzNl38;
 Mon, 02 Jun 2025 22:03:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mailstore1.adm.antarean.org (Postfix) with ESMTP id 4bB4XW4Pvqz1G;
 Mon, 02 Jun 2025 20:03:23 +0000 (UTC)
Received: from mailstore1.adm.antarean.org ([127.0.0.1])
 by localhost (mailstore1.adm.antarean.org [127.0.0.1]) (amavis, port 10024)
 with ESMTP id KKwbrsgDTe5q; Mon,  2 Jun 2025 20:03:22 +0000 (UTC)
Received: from persephone.localnet (persephone.adm.antarean.org [10.55.16.48])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mailstore1.adm.antarean.org (Postfix) with ESMTPS id 4bB4XV5rLtz17;
 Mon, 02 Jun 2025 20:03:22 +0000 (UTC)
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
X-Inumbo-ID: a3c037bd-3fec-11f0-a300-13f23c93f187
X-Virus-Scanned: amavis at antarean.org
X-Virus-Scanned: amavis at antarean.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=antarean.org;
	s=default; t=1748894602;
	bh=lO4povlG+nifRCUarMVCoMNsX8KccwxbuFAlasir/z4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OZnYIQFTWZqNRLdo4elycwh1KXyVshkU1sCrwJssRPEDCqXJXrDQChGg59A5Gpvvw
	 fm/IJYjjncs5CgN7krmRb+//wmhP+CQHWOR5NEK22zc13BLm8IM151rJfZWFP1bz5T
	 aSi2BeD8FJnc3oV+i2AOMj1c8RUhrMAgbFxENb7g=
From: "J. Roeleveld" <joost@antarean.org>
To: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Cc: "J. Roeleveld" <joost@antarean.org>
Subject: Re: Kernel panic when passing through 2 identical PCI devices
Date: Mon, 02 Jun 2025 22:03:22 +0200
Message-ID: <7829526.EvYhyI6sBW@persephone>
In-Reply-To: <13792630.uLZWGnKmhe@persephone>
References:
 <2226691.irdbgypaU6@persephone>
 <fa1814f9-5ebc-40ff-a6c8-616060079857@suse.com>
 <13792630.uLZWGnKmhe@persephone>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

(top-posting as this has extra info and not sure where to put it otherwise)

Jan, (and others),

As the HBA devices seem to work correctly, I've been looking further into 
differences.
One thing that could be a problem is how the PCI-devices are connected.

The HBAs are each in a seperate PCIe slot.
The NVMe drives are in a single slot with bifurcation (4x4x4x4) enabled.
There are a total of 4 drives. 2 are for the host, the other 2 for this guest 
domain.
Specifically, I use one of these:
https://www.asus.com/motherboards-components/motherboards/accessories/hyper-m-2-x16-card-v2/

Am currently trying to figure out which function/procedures in the kernel code 
are being used and which would make sense to add additional output with.
Will standard "printf" commands work? Or should I use something else to get 
the output printed to the same output as the rest the kernel outputs?

I could definitely use some assistance with this part. Ideally, I would like to 
put extra output at all possible causes at once.

Many thanks,

Joost


On Monday, 2 June 2025 16:37:36 CEST J. Roeleveld wrote:
> On Monday, 2 June 2025 16:31:11 CEST Jan Beulich wrote:
> > On 02.06.2025 16:19, J. Roeleveld wrote:
> > > On Monday, 2 June 2025 15:43:37 CEST you wrote:
> > >> On 02.06.2025 14:28, J. Roeleveld wrote:
> > >>> I have a domain to which I pass through 4 PCI devices:
> > >>> 2 NVMe drives
> > >>> 83:00.0   Samsung 980 NVMe
> > >>> 84:00.0   Samsung 980 NVMe
> > >>> 
> > >>> 2 HBA Controllers
> > >>> 86:00.0   LSI SAS3008
> > >>> 87:00.0   LSI SAS3008
> > >>> 
> > >>> This works fine with Xen version 4.18.4_pre1.
> > >>> However, when trying to update to 4.19, this fails.
> > >> 
> > >> To make it explicit: The domain in question is a PV one.
> > > 
> > > Yes. I tried to convert it to PVH in the past, but PCI-passthrough
> > > wasn't
> > > working at all. And nothing I found since shows that it should be
> > > working
> > > now.>
> > > 
> > >>> Checking the output during boot, I think I found something. But my
> > >>> knowledge is insufficient to figure out what is causing what I am
> > >>> seeing
> > >>> and how to fix this.
> > >>> 
> > >>> From the below (where I only focus on the 2 NVMe drives), it is
> > >>> similar
> > >>> to
> > >>> the succesfull boot up until it tries to "claiming resource
> > >>> 0000:84:00.0/0". At which point sysfs fails because the entry for "84"
> > >>> is
> > >>> already present.
> > >> 
> > >> What would be interesting is to know why / how this 2nd registration
> > >> happens.
> > > 
> > > Only guess I can make: They are both the same brand/model/size. Only
> > > serial number differs
> > 
> > I don't think this matters here at all. The guest isn't at the point yet
> > where it would even be able to retrieve these. From the log you provided
> > it's the PCI subsystem where the issue is triggered.
> 
> This goes beyond my knowledge. Which means I'd rather provide too much
> information then too little :)
> 
> > >> It's the same (guest) kernel version afaics, so something must
> > >> behave differently on the host. Are you sure the sole (host side)
> > >> difference is the hypervisor version? I.e. the Dom0 kernel version is
> > >> the
> > >> same in the failing and successful cases? I ask because there's very
> > >> little
> > >> Xen itself does that would play into pass-through device discovery /
> > >> resource setup by a (PV) guest (which doesn't mean Xen can't screw
> > >> things
> > >> up). The more relevant component is the xen-pciback driver in Dom0.
> > > 
> > > I can confirm it's dependent on the Xen version.
> > > Kernel version  = 6.12.21
> > > I get a succesful boot with Xen version 4.18.4_pre1.
> > > When I use Xen version 4.19.1, the boot fails due to this issue.
> > > 
> > > The kernel and initramfs does not differ between the boot.
> > 
> > And that's the Dom0 kernel, just to clarify? There are two kernels
> > involved
> > here, after all.
> 
> Yes. Dom0 and the guest have their own kernel images.
> However, both run the same version. (I compile kernels from source)
> 
> > >> Sadly the log provided does, to me at least, not have enough data to
> > >> draw
> > >> conclusions. Some instrumenting of the guest kernel may be necessary
> > >> ...
> > > 
> > > The host boots using UEFI:
> > > 
> > > === (xen.cfg in the EFI partition) ===
> > > [global]
> > > default=xen
> > > 
> > > [xen]
> > > options=dom0_mem=24576M,max:24576M dom0_max_vcpus=4 dom0_vcpus_pin
> > > gnttab_max_frames=512 sched=credit console=vga extra_guest_irqs=768,1024
> > > 
> > > kernel=gentoo-6.12.21.efi dozfs root=ZFS=zhost/host/root by=id
> > > elevator=noop logo.nologo triggers=zfs quiet refresh softlevel=prexen
> > > nomodeset
> > > nfs.callback_tcpport=32764 lockd.nlm_udpport=32768
> > > lockd.nlm_tcpport=32768
> > > xen-pciback.hide=(83:00.0)(84:00.0)(86:00.0)(87:00.0) xen-
> > > pciback.passthrough=1
> > > 
> > > ramdisk=initramfs-6.12.21-gentoo-host.img
> > > ===
> > > 
> > > Please let me know what other information you need and if there is
> > > anything I can try/test to get more information.
> > > Does the mailing list allow gzipped text files as attachment? Or how
> > > would
> > > you prefer the kernel-config of the host and guest?
> > 
> > I don't think these are relevant (for the moment).
> 
> Ok.
> 
> > > If there are tests to do, please give me several to try as I need to
> > > schedule downtime for reboots.
> > 
> > That would be some kernel hacking, as indicated before: Instrument the
> > (guest) kernel enough to figure out where the 1st and 2nd sysfs
> > registrations come from. This may then give us a clue what's being driven
> > the wrong way (by Xen, or maybe by the toolstack).
> 
> If you could point me to a guide on how to do this?
> I know enough about C/C++ to write my own tools. But the kernel and Xen is
> too complex for me to follow and I would not even know where to begin.
> 
> --
> Joost





