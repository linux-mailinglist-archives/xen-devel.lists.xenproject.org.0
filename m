Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B6BABFE03
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 22:42:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992528.1376222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHqFV-0001Rw-4v; Wed, 21 May 2025 20:41:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992528.1376222; Wed, 21 May 2025 20:41:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHqFV-0001QI-1H; Wed, 21 May 2025 20:41:13 +0000
Received: by outflank-mailman (input) for mailman id 992528;
 Wed, 21 May 2025 20:41:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MrLC=YF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uHqFU-0001QC-2O
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 20:41:12 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8578b90-3683-11f0-a2fb-13f23c93f187;
 Wed, 21 May 2025 22:41:02 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6DFCB5C0FDC;
 Wed, 21 May 2025 20:38:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EF16C4CEE4;
 Wed, 21 May 2025 20:40:58 +0000 (UTC)
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
X-Inumbo-ID: e8578b90-3683-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747860060;
	bh=IAjsNY+HMoi6wyQBPniks3RY4zBZ99ASV0Kluaug67M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tgnYGrLJVpsZI/kS8l50O1drubpcetMOVAPAEo3xsKut9tndCw0/FEdLYdrNzgFwZ
	 A8qAJEy1g22E5WNUwTzwHpFFrOJRvhIbw66RqpVoAE6QENH4U3+29lUnisFv3nJ/+Z
	 9/cB2i8PW8qWW0mlyu4dU/DzxX28oT5k30IiwHdL5+WWnS6AYKRFxw1esR+fnc4ppT
	 TmPn/i0b8xQvXzgdK9HxY3JX9758IJ/6O5Miuk6VuBjAA1ln+sprEerDII9Hy+ZBFK
	 aa8nYyaYINJvgOkAbCHraKUtbqrvW4ME9LsA4uto8RPRjsE/Ul7GZhsYfzJRAIZMLT
	 kYlH9OPRuvDqw==
Date: Wed, 21 May 2025 13:40:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: "Edgar E. Iglesias" <edgar.iglesias@amd.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: xen/arm: Virtio-PCI for dom0less on ARM
In-Reply-To: <904E8858-E310-4D3E-A1AB-352D43C4EDC5@arm.com>
Message-ID: <alpine.DEB.2.22.394.2505211340480.147219@ubuntu-linux-20-04-desktop>
References: <aCw3ddB2CZUeEtyF@zapote> <904E8858-E310-4D3E-A1AB-352D43C4EDC5@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 21 May 2025, Bertrand Marquis wrote:
> Hi Edgar,
> 
> > On 20 May 2025, at 10:04, Edgar E. Iglesias <edgar.iglesias@amd.com> wrote:
> > 
> > Hi all,
> > 
> > Following up on the ARM virtio-pci series I posted a while back ago.
> > 
> > There have been some concerns around the delayed and silent apperance of
> > devices on the ECAM area. The spec is not super clear wether this is OK or
> > not but I'm providing some references to the PCI specs and to some real cases
> > where this is used for FPGAs.
> > 
> > There are two options how to implement virtio-pci that we've discussed:
> > 1. VPCI + IOREQ
> > 2. IOREQ only
> > 
> > There are pros and cons with both. For example with #1, has the benefit that
> > we would only have a single PCIe RC (in Xen) and we could emulate a hotplug
> > capable expansion port with a standard way to notify when PCI devices plug in.
> > Approach #2 has the benefit that there is (almost) no additional complexity
> > or code added to Xen, almost everything lives outside.
> > IMO, both options have merit and both could co-exist.
> > 
> > For dynamic xl flows, options #2 already works without modifications to Xen.
> > Users need to pass the correct command-line options to QEMU and a device-tree
> > fragment with the pci-generic-ecam-host device.
> > 
> > For static dom0less flows, we can do the same as for xl flows but we have the
> > additional problem of domU's PCI bus enumeration racing with QEMU.
> > On x86, when domU's access a memory range that has not yet got IOREQ's
> > connected to it, the accesses succeeds with reads returning 0xFFFFFFFF and
> > writes ignored. This makes it easy for guests to wait for IOREQ devices to
> > pop up since guests will find an empty bus and can initiate a rescan later
> > when QEMU attaches. On ARM, we trap on these accesses.
> > 
> > If we on ARM add support for MMIO background regions with a default read value,
> > i.e mmio handlers that have lower priority than IOREQs and that are
> > read-const + writes-ignored, we could support the same flow on ARM.
> > This may be generally useful for other devices as well (e.g virtio-mmio or
> > something else). We could also use this to defer PCI enumeration.
> > 
> > So the next versions of this series I was thinking to remove the PCI specifics
> > and instead add FDT bindings to ARM dom0less enabling setup of user
> > configurable (by address-range and read-value) background mmio regions.
> > Xen would then support option #2 without any PCI specifics added.
> > 
> > Thoughts?
> 
> We discussed that together last week and I think this is a good approach as it
> prevents having some "workaround" code for PCI not following the Virtio spec and
> could also fulfil some other use cases by giving a solution to emulate some IO
> registers for a guest with a fixed value.

+1

