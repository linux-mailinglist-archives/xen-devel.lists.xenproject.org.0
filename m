Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20623ABFE4E
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 22:48:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992562.1376244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHqM1-0002eD-3D; Wed, 21 May 2025 20:47:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992562.1376244; Wed, 21 May 2025 20:47:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHqM0-0002bQ-Vt; Wed, 21 May 2025 20:47:56 +0000
Received: by outflank-mailman (input) for mailman id 992562;
 Wed, 21 May 2025 20:47:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MrLC=YF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uHqLz-0002bK-ME
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 20:47:55 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd307105-3684-11f0-b892-0df219b8e170;
 Wed, 21 May 2025 22:47:53 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8CEE34A6DB;
 Wed, 21 May 2025 20:47:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D573C4CEF3;
 Wed, 21 May 2025 20:47:50 +0000 (UTC)
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
X-Inumbo-ID: dd307105-3684-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747860471;
	bh=eWHmfzJdPRGEGVEM6jJzAcWUYXI2SvdTsfP1FCwsYiA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KTkpifVhI/5hx9b0OQSKkiWbMmfz+rXFkMJPA3n+gVHt1Jr/c0LOBXtlzXlN/GsK5
	 xwlgO1dCW7Ltvy6L/z5t28AvWA+9vYp2KmDYe3QmRgh6w4sRFOIS8Hy4INJy48cXY8
	 SHexAqOKTdqTrq8mhsSsttzHqpXD5deOCZpzfsZc1SUAxQmHnsDL6IVt1WluFyW95k
	 Up+oT34+aS5vjWelC9sayLBC2kCM1vaADUQkwxeHaMXAc5hQGMOOc3N1Zfm92lpFoU
	 2UaaquAbGYWimSzWAlVeavQjmloJj5tjBfGkzg9H6CHR/ADqa9/OKeuiTxm+XnubTs
	 Gama72S9w3IpA==
Date: Wed, 21 May 2025 13:47:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: "Edgar E. Iglesias" <edgar.iglesias@amd.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: xen/arm: Virtio-PCI for dom0less on ARM
In-Reply-To: <ad31707f-4558-4ebb-89ef-da9ef4083d7a@xen.org>
Message-ID: <alpine.DEB.2.22.394.2505211341050.147219@ubuntu-linux-20-04-desktop>
References: <aCw3ddB2CZUeEtyF@zapote> <ad31707f-4558-4ebb-89ef-da9ef4083d7a@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1406415365-1747860472=:147219"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1406415365-1747860472=:147219
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 21 May 2025, Julien Grall wrote:
> > For static dom0less flows, we can do the same as for xl flows but we have
> > the
> > additional problem of domU's PCI bus enumeration racing with QEMU.
> > On x86, when domU's access a memory range that has not yet got IOREQ's
> > connected to it, the accesses succeeds with reads returning 0xFFFFFFFF and
> > writes ignored. This makes it easy for guests to wait for IOREQ devices to
> > pop up since guests will find an empty bus and can initiate a rescan later
> > when QEMU attaches. On ARM, we trap on these accesses.
> > > If we on ARM add support for MMIO background regions with a default 
> read value,
> > i.e mmio handlers that have lower priority than IOREQs and that are
> > read-const + writes-ignored, we could support the same flow on ARM.
> > This may be generally useful for other devices as well (e.g virtio-mmio or
> > something else). We could also use this to defer PCI enumeration.
> 
> Regardless what I wrote above, if we are going down the route of returning
> 0xFFFFFFFF, I would just do it for every IOs rather than the one specify in
> the device-tree. This could still behind a per-domain option, but it would at
> least make simpler to setup the system (AFAIU, in your current proposal, we
> would need to specify the range in multiple places).
 
This seems like a good idea.


> > So the next versions of this series I was thinking to remove the PCI
> > specifics
> > and instead add FDT bindings to ARM dom0less enabling setup of user
> > configurable (by address-range and read-value) background mmio regions.
> > Xen would then support option #2 without any PCI specifics added.
> > 
> > Thoughts?
> > 
> > Cheers,
> > Edgar
> > 
> > # References to spec
> > 
> > PCI express base specification:
> > 7.5.1.1.1 Vendor ID Register (Offset 00h)
> > The Vendor ID register is HwInit and the value in this register identifies
> > the manufacturer of the Function. In keeping with
> > PCI-SIG procedures, valid vendor identifiers must be allocated by the
> > PCI-SIG to ensure uniqueness. Each vendor must
> > have at least one Vendor ID. It is recommended that software read the Vendor
> > ID register to determine if a Function is
> > present, where a value of FFFFh indicates that no Function is present.
> > 
> > PCI Firmware Specification:
> > 3.5 Device State at Firmware/Operating System Handoff
> > Page 34:
> > The operating system is required to configure PCI subsystems:
> >  During hotplug
> >  For devices that take too long to come out of reset
> >  PCI-to-PCI bridges that are at levels below what firmware is designed to
> > configure
> > 
> > Page 36:
> > Note: The operating system does not have to walk all buses during boot. The
> > kernel can
> > automatically configure devices on request; i.e., an event can cause a scan
> > of I/O on demand.
> 
> I am not sure why you quote this. To me it reads like this is up to the OS to
> decide when to access the PCI bus. As we don't control the OS, this doesn't
> seem a behavior Xen can rely on.
> 
> > 
> > FPGA's can be programmed at runtime and appear on the ECAM bus silently.
> > An PCI rescan needs to be triggered for the OS to discover the device:
> > Intel FPGAs:
> > https://www.intel.com/content/www/us/en/docs/programmable/683190/1-3-1/how-to-rescan-bus-and-re-enable-aer.html
> 
> To clarify, you are saying the ECAM bus may be completely empty (e.g.
> everything is reading as ~0) and some part of the ECAM will return a non ~0
> value when the FPGA run.

From what I found from my searches on the topic, the PCIe spec says when
a device is not present or not initialized, the system typically
receives a value of 0xFFFFFFFF on read. Once a device becomes active and
responds to configuration accesses, subsequent reads will return valid
data. The specifications do not require interrupts or hot-plug events
for device detection; polling the configuration space is a compliant
method.

Which actually points to your suggestion above to do this for every IOs.
--8323329-1406415365-1747860472=:147219--

