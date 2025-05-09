Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84449AB1EBE
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 23:10:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.980372.1366818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDUyy-0006TW-Kh; Fri, 09 May 2025 21:10:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 980372.1366818; Fri, 09 May 2025 21:10:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDUyy-0006S4-Hw; Fri, 09 May 2025 21:10:12 +0000
Received: by outflank-mailman (input) for mailman id 980372;
 Fri, 09 May 2025 21:10:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/D4s=XZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uDUyx-0006Ry-3D
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 21:10:11 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc113438-2d19-11f0-9eb5-5ba50f476ded;
 Fri, 09 May 2025 23:10:08 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 538505C6FF6;
 Fri,  9 May 2025 21:07:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14B30C4CEE4;
 Fri,  9 May 2025 21:10:04 +0000 (UTC)
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
X-Inumbo-ID: fc113438-2d19-11f0-9eb5-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746825006;
	bh=idsBBhAVa5QMgXWnobflcd9UeqklW0cEqyi0997GeN8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hfYVMTfB/AietnqZOhR4vYe88hpfHZLVbcVUu8M62q5//2nhFL3kd5svFZilIBH+6
	 i3oY21+2mcfgFQhPtH+meRRcXlQ98FREghHlX4mR6ZIRkLgy+oGmsYC3Z3s0r01ZWg
	 9VDw5pVmR8njmpSo1pOVLq9hkHCBdnFSIX2n0lFYUltyi18aQMLtTB3G1DwZhTJKmj
	 l5V7duoWCMyMNti5rig9ey7XABjiXdUNfvhLebYK+oFTt6P7doxr+HK7KDVW/1VF3K
	 HSp41y0rNRm8BOydnP5XgAFhca5Xqvi2KUohzb1uR3A9pHinYxCpppwpIJbXHOy+4U
	 VHnYNSUraoAdA==
Date: Fri, 9 May 2025 14:10:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    Jan Beulich <jbeulich@suse.com>, 
    "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, jason.andryuk@amd.com, 
    agarciav@amd.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/x86: allow Dom0 PVH to call XENMEM_exchange
In-Reply-To: <aB29o70zT_jUjdQv@macbook.lan>
Message-ID: <alpine.DEB.2.22.394.2505091401330.3879245@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2504251314050.785180@ubuntu-linux-20-04-desktop> <19d9aec4-c21a-47a9-9c58-6bfcadbd22e0@suse.com> <alpine.DEB.2.22.394.2504281242240.785180@ubuntu-linux-20-04-desktop> <aBiVkw2SXJHxpieh@mail-itl> <aBjLoM_ttxqftzlp@macbook.lan>
 <alpine.DEB.2.22.394.2505051100050.3879245@ubuntu-linux-20-04-desktop> <aBnOQyXSz-j33Wux@macbook.lan> <alpine.DEB.2.22.394.2505061658330.3879245@ubuntu-linux-20-04-desktop> <aBx1gv6BXhZ0pSYt@macbook.lan> <alpine.DEB.2.22.394.2505081617080.3879245@ubuntu-linux-20-04-desktop>
 <aB29o70zT_jUjdQv@macbook.lan>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1557855939-1746824621=:3879245"
Content-ID: <alpine.DEB.2.22.394.2505091404150.3879245@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1557855939-1746824621=:3879245
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2505091404151.3879245@ubuntu-linux-20-04-desktop>

On Fri, 9 May 2025, Roger Pau Monné wrote:
> On Thu, May 08, 2025 at 04:25:28PM -0700, Stefano Stabellini wrote:
> > On Thu, 8 May 2025, Roger Pau Monné wrote:
> > > On Wed, May 07, 2025 at 04:02:11PM -0700, Stefano Stabellini wrote:
> > > > On Tue, 6 May 2025, Roger Pau Monné wrote:
> > > > > On Mon, May 05, 2025 at 11:11:10AM -0700, Stefano Stabellini wrote:
> > > > > > On Mon, 5 May 2025, Roger Pau Monné wrote:
> > > > > > > On Mon, May 05, 2025 at 12:40:18PM +0200, Marek Marczykowski-Górecki wrote:
> > > > > > > > On Mon, Apr 28, 2025 at 01:00:01PM -0700, Stefano Stabellini wrote:
> > > > > > > > > On Mon, 28 Apr 2025, Jan Beulich wrote:
> > > > > > > > > > On 25.04.2025 22:19, Stefano Stabellini wrote:
> > > > > > > > > > > From: Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>
> > > > > > > > > > > 
> > > > > > > > > > > Dom0 PVH might need XENMEM_exchange when passing contiguous memory
> > > > > > > > > > > addresses to firmware or co-processors not behind an IOMMU.
> > > > > > > > > > 
> > > > > > > > > > I definitely don't understand the firmware part: It's subject to the
> > > > > > > > > > same transparent P2M translations as the rest of the VM; it's just
> > > > > > > > > > another piece of software running there.
> > > > > > > > > > 
> > > > > > > > > > "Co-processors not behind an IOMMU" is also interesting; a more
> > > > > > > > > > concrete scenario might be nice, yet I realize you may be limited in
> > > > > > > > > > what you're allowed to say.
> > > > > > > > > 
> > > > > > > > > Sure. On AMD x86 platforms there is a co-processor called PSP running
> > > > > > > > > TEE firmware. The PSP is not behind an IOMMU. Dom0 needs occasionally to
> > > > > > > > > pass addresses to it.  See drivers/tee/amdtee/ and
> > > > > > > > > include/linux/psp-tee.h in Linux.
> > > > > > > > 
> > > > > > > > We had (have?) similar issue with amdgpu (for integrated graphics) - it
> > > > > > > > uses PSP for loading its firmware. With PV dom0 there is a workaround as
> > > > > > > > dom0 kinda knows MFN. I haven't tried PVH dom0 on such system yet, but I
> > > > > > > > expect troubles (BTW, hw1 aka zen2 gitlab runner has amdgpu, and it's
> > > > > > > > the one I used for debugging this issue).
> > > > > > > 
> > > > > > > That's ugly, and problematic when used in conjunction with AMD-SEV.
> > > > > > > 
> > > > > > > I wonder if Xen could emulate/mediate some parts of the PSP for dom0
> > > > > > > to use, while allowing Xen to be the sole owner of the device.  Having
> > > > > > > both Xen and dom0 use it (for different purposes) seems like asking
> > > > > > > for trouble.  But I also have no idea how complex the PSP interface
> > > > > > > is, neither whether it would be feasible to emulate the
> > > > > > > interfaces/registers needed for firmware loading.
> > > > > > 
> > > > > > Let me take a step back from the PSP for a moment. I am not opposed to a
> > > > > > PSP mediator in Xen, but I want to emphasize that the issue is more
> > > > > > general and extends well beyond the PSP.
> > > > > > 
> > > > > > In my years working in embedded systems, I have consistently seen cases
> > > > > > where Dom0 needs to communicate with something that does not go through
> > > > > > the IOMMU. This could be due to special firmware on a co-processor, a
> > > > > > hardware erratum that prevents proper IOMMU usage, or a high-bandwidth
> > > > > > device that technically supports the IOMMU but performs poorly unless
> > > > > > the IOMMU is disabled. All of these are real-world examples that I have
> > > > > > seen personally.
> > > > > 
> > > > > I wouldn't be surprised, classic PV dom0 avoided those issues because
> > > > > it was dealing directly with host addresses (mfns), but that's not the
> > > > > case with PVH dom0.
> > > > 
> > > > Yeah
> > > > 
> > > > 
> > > > > > In my opinion, we definitely need a solution like this patch for Dom0
> > > > > > PVH to function correctly in all scenarios.
> > > > > 
> > > > > I'm not opposed to having such interface available for PVH hardware
> > > > > domains.  I find it ugly, but I don't see much other way to deal with
> > > > > those kind of "devices".  Xen mediating accesses for each one of them
> > > > > is unlikely to be doable.
> > > > > 
> > > > > How do you hook this exchange interface into Linux to differentiate
> > > > > which drivers need to use mfns when interacting with the hardware?
> > > > 
> > > > In the specific case we have at hands the driver is in Linux userspace
> > > > and is specially-written for our use case. It is not generic, so we
> > > > don't have this problem. But your question is valid.
> > > 
> > > Oh, so you then have some kind of ioctl interface that does the memory
> > > exchange and bouncing inside of the kernel on behalf of the user-space
> > > side I would think?
> > 
> > I am not sure... Xenia might know more than me here.
> 
> One further question I have regarding this approach: have you
> considered just populating an empty p2m space with contiguous physical
> memory instead of exchanging an existing area?  That would increase
> dom0 memory usage, but would prevent super page shattering in the p2m.
> You could use a dom0_mem=X,max:X+Y command line option, where Y
> would be your extra room for swiotlb-xen bouncing usage.
> 
> XENMEM_increase_reservation documentation notes such hypercall already
> returns the base MFN of the allocated page (see comment in
> xen_memory_reservation struct declaration).
 
XENMEM_exchange is the way it has been implemented traditionally in
Linux swiotlb-xen (it has been years). But your idea is good.

Another, more drastic, idea would be to attempt to map Dom0 PVH memory
1:1 at domain creation time like we do on ARM. If not all of it, as much
as possible. That would resolve the problem very efficiently. We could
communicate to Dom0 PVH the range that is 1:1 in one of the initial data
structures, and that would be the end of it.


> > > > In Linux, the issue is hidden behind drivers/xen/swiotlb-xen.c and
> > > > xen_arch_need_swiotlb. There are a few options:
> > > > - force swiotlb bounce for everything on the problematic SoC
> > > > - edit xen_arch_need_swiotlb to return true for the problematic device
> > > > - introduce a kernel command line option to specify which device
> > > >   xen_arch_need_swiotlb should return true for
> > > 
> > > Isn't it a bit misleading to use the swiotlb for this purpose?  Won't
> > > this usage of the swiotlb (to bounce from gfns to mfns) create issues
> > > if there's any devices that have a DMA physical address limitation and
> > > also needs to use the swiotlb while being behind the IOMMU?
> > 
> > When I wrote swiotlb, I meant swiotlb-xen (drivers/xen/swiotlb-xen.c).
> > We have been using it exactly for this kind of address translations so
> > far. It can also deal with cases where genuine bouncing needs to happen.
> 
> Oh, I see.  I've assumed you meant the generic Linux swiotlb.
> 
> So you have repurposed swiotlb-xen to be used on PVH for this purpose.
> I think (currently?) swiotlb-xen is unconditionally disabled for
> HVM/PVH guests?

Yes, I have repurposed swiotlb-xen for something similar this years ago
on ARM. I was planning to do the same for PVH x86. Today, swiotlb-xen is
used for ARM Dom0, which as you know is HVM/PVH from Linux point of view.


> > > > - introduce an ACPI table with the relevant info
> > > 
> > > Hm, best option might be an ACPI table so that Xen can signal to the
> > > hardware domain whether communication with the device must be done
> > > using mfns, or if accesses are mediated and hence can be done using
> > > gfns?
> > 
> > Yeah
> > 
> > 
> > > It's a bit cumbersome however to have to resort to an ACPI table just
> > > for this.  Not sure whether we could expand one of the existing tables
> > > already under Xen control (STAO?) to contain this information.  It all
> > > looks a bit ad-hoc.
> > > 
> > > I think we need some kind of list of devices that are not behind the
> > > IOMMU, but I have no idea what URI to use to identify those.  I assume
> > > the PSP doesn't have a PCI SBDF (as it's not on the PCI bus?).  Maybe
> > > by ACPI path?
> > 
> > Yes, we have a similar issue with the STAO table in terms of which
> > identifiers to use. STAO uses: "A list of ACPI strings, where each
> > string is the full path name in the ACPI namespace of the device"
> > 
> > 
> > > Or maybe it's fine to always communicate with those non-translated
> > > devices using MFNs, and even if we later add some kind of PSP
> > > mediation (so that both Xen and dom0 can use it), accesses by dom0
> > > will still be assumed to be using MFNs, and thus need no translation.
> > 
> > I think it is easy to enable/disable GFN/MFN for a device like PSP. We
> > can communicate to Linux in many ways this change in behavior.
> 
> In fact my biggest concern with the PSP explicitly is not so much the
> usage of MFN/GFNs, I think it would be fine for the hardware domain to
> unconditionally use MFNs for interactions with the device.
> 
> I worry how are we going to reconcile both Xen and the hardware domain
> having to use the device, as I have no idea how complex the interface
> is, so no idea how much code we would need to add to Xen to mediate a
> external domain accesses.
>
> Anyway, that's a question for later really.

Agreed
--8323329-1557855939-1746824621=:3879245--

