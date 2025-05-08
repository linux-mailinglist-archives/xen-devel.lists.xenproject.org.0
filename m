Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D35BAB067A
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 01:28:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979653.1366164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDAfN-0005MJ-6X; Thu, 08 May 2025 23:28:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979653.1366164; Thu, 08 May 2025 23:28:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDAfN-0005JP-3a; Thu, 08 May 2025 23:28:37 +0000
Received: by outflank-mailman (input) for mailman id 979653;
 Thu, 08 May 2025 23:28:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QXoN=XY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uDAfL-0005JJ-Im
 for xen-devel@lists.xenproject.org; Thu, 08 May 2025 23:28:35 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 282a252c-2c64-11f0-9eb4-5ba50f476ded;
 Fri, 09 May 2025 01:28:34 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8CA10A4E2BD;
 Thu,  8 May 2025 23:28:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD24FC4CEE7;
 Thu,  8 May 2025 23:28:30 +0000 (UTC)
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
X-Inumbo-ID: 282a252c-2c64-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746746912;
	bh=Vg6cN5pfI6Y+lpc133cxHERBv6bpN7iNionBjfwpZfc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UB2RloDkwM8rimcP5E+U3iCYulg8iOg3KP/Vr5zn3WkdVIK9ahbrV+k8R/3keiTbA
	 gvgbPHFciybDH+IakF2CU0bxSfnF5EPBlzHTfWdlIWl5zlDQUTh3SUVaPbST7cmYbI
	 AQ1YSbJqB9bibnlHLsRGF7F5tP24sXWGfqLiazKXsDDqO8jTDlbU+nXX14W2EraMdN
	 WWNjzRR0ocxRqgJvLr79lYZDRX8Lm4Sz2pd7pBRL8Q5A1ybiDkqrgKbXoXOSzrhqJC
	 c2sVZefjYdBTQ7vfStt8U2Rg2sqQA/PDNe0pQxCyfbKQQb94OyZ5nCLZAINq72AJ3i
	 npE9Mb07KCEEw==
Date: Thu, 8 May 2025 16:28:29 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <jbeulich@suse.com>, 
    "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, jason.andryuk@amd.com, 
    agarciav@amd.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/x86: allow Dom0 PVH to call XENMEM_exchange
In-Reply-To: <aByHaI1ST9v58K6e@mail-itl>
Message-ID: <alpine.DEB.2.22.394.2505081626060.3879245@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2504251314050.785180@ubuntu-linux-20-04-desktop> <19d9aec4-c21a-47a9-9c58-6bfcadbd22e0@suse.com> <alpine.DEB.2.22.394.2504281242240.785180@ubuntu-linux-20-04-desktop> <aBiVkw2SXJHxpieh@mail-itl> <aBjLoM_ttxqftzlp@macbook.lan>
 <alpine.DEB.2.22.394.2505051100050.3879245@ubuntu-linux-20-04-desktop> <aBnOQyXSz-j33Wux@macbook.lan> <alpine.DEB.2.22.394.2505061658330.3879245@ubuntu-linux-20-04-desktop> <aBx1gv6BXhZ0pSYt@macbook.lan> <aByHaI1ST9v58K6e@mail-itl>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1739614822-1746746911=:3879245"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1739614822-1746746911=:3879245
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 8 May 2025, Marek Marczykowski-Górecki wrote:
> On Thu, May 08, 2025 at 11:12:34AM +0200, Roger Pau Monné wrote:
> > On Wed, May 07, 2025 at 04:02:11PM -0700, Stefano Stabellini wrote:
> > > On Tue, 6 May 2025, Roger Pau Monné wrote:
> > > > On Mon, May 05, 2025 at 11:11:10AM -0700, Stefano Stabellini wrote:
> > > > > On Mon, 5 May 2025, Roger Pau Monné wrote:
> > > > > > On Mon, May 05, 2025 at 12:40:18PM +0200, Marek Marczykowski-Górecki wrote:
> > > > > > > On Mon, Apr 28, 2025 at 01:00:01PM -0700, Stefano Stabellini wrote:
> > > > > > > > On Mon, 28 Apr 2025, Jan Beulich wrote:
> > > > > > > > > On 25.04.2025 22:19, Stefano Stabellini wrote:
> > > > > > > > > > From: Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>
> > > > > > > > > > 
> > > > > > > > > > Dom0 PVH might need XENMEM_exchange when passing contiguous memory
> > > > > > > > > > addresses to firmware or co-processors not behind an IOMMU.
> > > > > > > > > 
> > > > > > > > > I definitely don't understand the firmware part: It's subject to the
> > > > > > > > > same transparent P2M translations as the rest of the VM; it's just
> > > > > > > > > another piece of software running there.
> > > > > > > > > 
> > > > > > > > > "Co-processors not behind an IOMMU" is also interesting; a more
> > > > > > > > > concrete scenario might be nice, yet I realize you may be limited in
> > > > > > > > > what you're allowed to say.
> > > > > > > > 
> > > > > > > > Sure. On AMD x86 platforms there is a co-processor called PSP running
> > > > > > > > TEE firmware. The PSP is not behind an IOMMU. Dom0 needs occasionally to
> > > > > > > > pass addresses to it.  See drivers/tee/amdtee/ and
> > > > > > > > include/linux/psp-tee.h in Linux.
> > > > > > > 
> > > > > > > We had (have?) similar issue with amdgpu (for integrated graphics) - it
> > > > > > > uses PSP for loading its firmware. With PV dom0 there is a workaround as
> > > > > > > dom0 kinda knows MFN. I haven't tried PVH dom0 on such system yet, but I
> > > > > > > expect troubles (BTW, hw1 aka zen2 gitlab runner has amdgpu, and it's
> > > > > > > the one I used for debugging this issue).
> > > > > > 
> > > > > > That's ugly, and problematic when used in conjunction with AMD-SEV.
> > > > > > 
> > > > > > I wonder if Xen could emulate/mediate some parts of the PSP for dom0
> > > > > > to use, while allowing Xen to be the sole owner of the device.  Having
> > > > > > both Xen and dom0 use it (for different purposes) seems like asking
> > > > > > for trouble.  But I also have no idea how complex the PSP interface
> > > > > > is, neither whether it would be feasible to emulate the
> > > > > > interfaces/registers needed for firmware loading.
> > > > > 
> > > > > Let me take a step back from the PSP for a moment. I am not opposed to a
> > > > > PSP mediator in Xen, but I want to emphasize that the issue is more
> > > > > general and extends well beyond the PSP.
> > > > > 
> > > > > In my years working in embedded systems, I have consistently seen cases
> > > > > where Dom0 needs to communicate with something that does not go through
> > > > > the IOMMU. This could be due to special firmware on a co-processor, a
> > > > > hardware erratum that prevents proper IOMMU usage, or a high-bandwidth
> > > > > device that technically supports the IOMMU but performs poorly unless
> > > > > the IOMMU is disabled. All of these are real-world examples that I have
> > > > > seen personally.
> > > > 
> > > > I wouldn't be surprised, classic PV dom0 avoided those issues because
> > > > it was dealing directly with host addresses (mfns), but that's not the
> > > > case with PVH dom0.
> > > 
> > > Yeah
> > > 
> > > 
> > > > > In my opinion, we definitely need a solution like this patch for Dom0
> > > > > PVH to function correctly in all scenarios.
> > > > 
> > > > I'm not opposed to having such interface available for PVH hardware
> > > > domains.  I find it ugly, but I don't see much other way to deal with
> > > > those kind of "devices".  Xen mediating accesses for each one of them
> > > > is unlikely to be doable.
> > > > 
> > > > How do you hook this exchange interface into Linux to differentiate
> > > > which drivers need to use mfns when interacting with the hardware?
> > > 
> > > In the specific case we have at hands the driver is in Linux userspace
> > > and is specially-written for our use case. It is not generic, so we
> > > don't have this problem. But your question is valid.
> > 
> > Oh, so you then have some kind of ioctl interface that does the memory
> > exchange and bouncing inside of the kernel on behalf of the user-space
> > side I would think?
> > 
> > > In Linux, the issue is hidden behind drivers/xen/swiotlb-xen.c and
> > > xen_arch_need_swiotlb. There are a few options:
> > > - force swiotlb bounce for everything on the problematic SoC
> > > - edit xen_arch_need_swiotlb to return true for the problematic device
> > > - introduce a kernel command line option to specify which device
> > >   xen_arch_need_swiotlb should return true for
> > 
> > Isn't it a bit misleading to use the swiotlb for this purpose?  Won't
> > this usage of the swiotlb (to bounce from gfns to mfns) create issues
> > if there's any devices that have a DMA physical address limitation and
> > also needs to use the swiotlb while being behind the IOMMU?
> > 
> > > - introduce an ACPI table with the relevant info
> > 
> > Hm, best option might be an ACPI table so that Xen can signal to the
> > hardware domain whether communication with the device must be done
> > using mfns, or if accesses are mediated and hence can be done using
> > gfns?
> 
> How does it work on native when some devices are not behind IOMMU? Is it
> signaled via an ACPI table? It feels like it's a similar (although not
> the same) situation here.

The ACPI AMD IVRS table should have this information, but we cannot use
the IVRS table for the guest.

Sometimes this kind of information for platform devices (e.g. GPIO, i2c)
is not reported at all.
--8323329-1739614822-1746746911=:3879245--

