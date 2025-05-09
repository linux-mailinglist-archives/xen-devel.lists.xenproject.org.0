Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62955AB1FF4
	for <lists+xen-devel@lfdr.de>; Sat, 10 May 2025 00:31:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.980464.1366925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDWFn-0004xV-CA; Fri, 09 May 2025 22:31:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 980464.1366925; Fri, 09 May 2025 22:31:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDWFn-0004uK-88; Fri, 09 May 2025 22:31:39 +0000
Received: by outflank-mailman (input) for mailman id 980464;
 Fri, 09 May 2025 22:31:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/D4s=XZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uDWFm-0004u7-1K
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 22:31:38 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d5e2015-2d25-11f0-9eb5-5ba50f476ded;
 Sat, 10 May 2025 00:31:36 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E5F895C5CAD;
 Fri,  9 May 2025 22:29:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F2D9C4CEE4;
 Fri,  9 May 2025 22:31:31 +0000 (UTC)
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
X-Inumbo-ID: 5d5e2015-2d25-11f0-9eb5-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746829893;
	bh=0Pt9nZxXcScPcGeqUrFnklHojl2K6y2m0eP0rZcRxdI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Xf0mNRyVrMvTDI5luU471JpIY/suiK7ZwCgnK4DZJePfc0gtfNHKWjb37tgB9/pVv
	 dKYW4Qn/PeJw/IeczT0UrendbvsERiMBiZo6lu3Fey0dQqs1nHc08KFX8vLePCb+Eb
	 /YkOyLMNwgFp+hLJ10BoMGD6poFq6JHyzIxQG+nurbP1JARCQcjWnQZxj6Z2KaIC3F
	 8zE6XZ35iy6vc+RTeqUV1JZzU3KwdwCvllj08K75jxnU1E/ZnzV5ymWMY7Fykzu07C
	 8eJs1yxVH05nXVSfDqna4oG2SwzTyLjcsmbkuMYzLCD3KLFqji5QPPFRMgDzFYZKFQ
	 ca7Hc79lUJFKg==
Date: Fri, 9 May 2025 15:31:29 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Teddy Astie <teddy.astie@vates.tech>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    Jan Beulich <jbeulich@suse.com>, 
    "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, jason.andryuk@amd.com, 
    agarciav@amd.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/x86: allow Dom0 PVH to call XENMEM_exchange
In-Reply-To: <f49f95ed-81f2-45f5-a5e6-26df1c32ee57@vates.tech>
Message-ID: <alpine.DEB.2.22.394.2505091522290.3879245@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2504251314050.785180@ubuntu-linux-20-04-desktop> <19d9aec4-c21a-47a9-9c58-6bfcadbd22e0@suse.com> <alpine.DEB.2.22.394.2504281242240.785180@ubuntu-linux-20-04-desktop> <aBiVkw2SXJHxpieh@mail-itl> <aBjLoM_ttxqftzlp@macbook.lan>
 <alpine.DEB.2.22.394.2505051100050.3879245@ubuntu-linux-20-04-desktop> <aBnOQyXSz-j33Wux@macbook.lan> <alpine.DEB.2.22.394.2505061658330.3879245@ubuntu-linux-20-04-desktop> <aBx1gv6BXhZ0pSYt@macbook.lan> <alpine.DEB.2.22.394.2505081617080.3879245@ubuntu-linux-20-04-desktop>
 <aB29o70zT_jUjdQv@macbook.lan> <alpine.DEB.2.22.394.2505091401330.3879245@ubuntu-linux-20-04-desktop> <f49f95ed-81f2-45f5-a5e6-26df1c32ee57@vates.tech>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1480880107-1746829403=:3879245"
Content-ID: <alpine.DEB.2.22.394.2505091527420.3879245@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1480880107-1746829403=:3879245
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2505091527421.3879245@ubuntu-linux-20-04-desktop>

On Fri, 9 May 2025, Teddy Astie wrote:
> Le 09/05/2025 à 23:13, Stefano Stabellini a écrit :
> > On Fri, 9 May 2025, Roger Pau Monné wrote:
> >> On Thu, May 08, 2025 at 04:25:28PM -0700, Stefano Stabellini wrote:
> >>> On Thu, 8 May 2025, Roger Pau Monné wrote:
> >>>> On Wed, May 07, 2025 at 04:02:11PM -0700, Stefano Stabellini wrote:
> >>>>> On Tue, 6 May 2025, Roger Pau Monné wrote:
> >>>>>> On Mon, May 05, 2025 at 11:11:10AM -0700, Stefano Stabellini wrote:
> >>>>>>> On Mon, 5 May 2025, Roger Pau Monné wrote:
> >>>>>>>> On Mon, May 05, 2025 at 12:40:18PM +0200, Marek Marczykowski-Górecki wrote:
> >>>>>>>>> On Mon, Apr 28, 2025 at 01:00:01PM -0700, Stefano Stabellini wrote:
> >>>>>>>>>> On Mon, 28 Apr 2025, Jan Beulich wrote:
> >>>>>>>>>>> On 25.04.2025 22:19, Stefano Stabellini wrote:
> >>>>>>>>>>>> From: Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>
> >>>>>>>>>>>>
> >>>>>>>>>>>> Dom0 PVH might need XENMEM_exchange when passing contiguous memory
> >>>>>>>>>>>> addresses to firmware or co-processors not behind an IOMMU.
> >>>>>>>>>>>
> >>>>>>>>>>> I definitely don't understand the firmware part: It's subject to the
> >>>>>>>>>>> same transparent P2M translations as the rest of the VM; it's just
> >>>>>>>>>>> another piece of software running there.
> >>>>>>>>>>>
> >>>>>>>>>>> "Co-processors not behind an IOMMU" is also interesting; a more
> >>>>>>>>>>> concrete scenario might be nice, yet I realize you may be limited in
> >>>>>>>>>>> what you're allowed to say.
> >>>>>>>>>>
> >>>>>>>>>> Sure. On AMD x86 platforms there is a co-processor called PSP running
> >>>>>>>>>> TEE firmware. The PSP is not behind an IOMMU. Dom0 needs occasionally to
> >>>>>>>>>> pass addresses to it.  See drivers/tee/amdtee/ and
> >>>>>>>>>> include/linux/psp-tee.h in Linux.
> >>>>>>>>>
> >>>>>>>>> We had (have?) similar issue with amdgpu (for integrated graphics) - it
> >>>>>>>>> uses PSP for loading its firmware. With PV dom0 there is a workaround as
> >>>>>>>>> dom0 kinda knows MFN. I haven't tried PVH dom0 on such system yet, but I
> >>>>>>>>> expect troubles (BTW, hw1 aka zen2 gitlab runner has amdgpu, and it's
> >>>>>>>>> the one I used for debugging this issue).
> >>>>>>>>
> >>>>>>>> That's ugly, and problematic when used in conjunction with AMD-SEV.
> >>>>>>>>
> >>>>>>>> I wonder if Xen could emulate/mediate some parts of the PSP for dom0
> >>>>>>>> to use, while allowing Xen to be the sole owner of the device.  Having
> >>>>>>>> both Xen and dom0 use it (for different purposes) seems like asking
> >>>>>>>> for trouble.  But I also have no idea how complex the PSP interface
> >>>>>>>> is, neither whether it would be feasible to emulate the
> >>>>>>>> interfaces/registers needed for firmware loading.
> >>>>>>>
> >>>>>>> Let me take a step back from the PSP for a moment. I am not opposed to a
> >>>>>>> PSP mediator in Xen, but I want to emphasize that the issue is more
> >>>>>>> general and extends well beyond the PSP.
> >>>>>>>
> >>>>>>> In my years working in embedded systems, I have consistently seen cases
> >>>>>>> where Dom0 needs to communicate with something that does not go through
> >>>>>>> the IOMMU. This could be due to special firmware on a co-processor, a
> >>>>>>> hardware erratum that prevents proper IOMMU usage, or a high-bandwidth
> >>>>>>> device that technically supports the IOMMU but performs poorly unless
> >>>>>>> the IOMMU is disabled. All of these are real-world examples that I have
> >>>>>>> seen personally.
> >>>>>>
> >>>>>> I wouldn't be surprised, classic PV dom0 avoided those issues because
> >>>>>> it was dealing directly with host addresses (mfns), but that's not the
> >>>>>> case with PVH dom0.
> >>>>>
> >>>>> Yeah
> >>>>>
> >>>>>
> >>>>>>> In my opinion, we definitely need a solution like this patch for Dom0
> >>>>>>> PVH to function correctly in all scenarios.
> >>>>>>
> >>>>>> I'm not opposed to having such interface available for PVH hardware
> >>>>>> domains.  I find it ugly, but I don't see much other way to deal with
> >>>>>> those kind of "devices".  Xen mediating accesses for each one of them
> >>>>>> is unlikely to be doable.
> >>>>>>
> >>>>>> How do you hook this exchange interface into Linux to differentiate
> >>>>>> which drivers need to use mfns when interacting with the hardware?
> >>>>>
> >>>>> In the specific case we have at hands the driver is in Linux userspace
> >>>>> and is specially-written for our use case. It is not generic, so we
> >>>>> don't have this problem. But your question is valid.
> >>>>
> >>>> Oh, so you then have some kind of ioctl interface that does the memory
> >>>> exchange and bouncing inside of the kernel on behalf of the user-space
> >>>> side I would think?
> >>>
> >>> I am not sure... Xenia might know more than me here.
> >>
> >> One further question I have regarding this approach: have you
> >> considered just populating an empty p2m space with contiguous physical
> >> memory instead of exchanging an existing area?  That would increase
> >> dom0 memory usage, but would prevent super page shattering in the p2m.
> >> You could use a dom0_mem=X,max:X+Y command line option, where Y
> >> would be your extra room for swiotlb-xen bouncing usage.
> >>
> >> XENMEM_increase_reservation documentation notes such hypercall already
> >> returns the base MFN of the allocated page (see comment in
> >> xen_memory_reservation struct declaration).
> >
> > XENMEM_exchange is the way it has been implemented traditionally in
> > Linux swiotlb-xen (it has been years). But your idea is good.
> >
> > Another, more drastic, idea would be to attempt to map Dom0 PVH memory
> > 1:1 at domain creation time like we do on ARM. If not all of it, as much
> > as possible. That would resolve the problem very efficiently. We could
> > communicate to Dom0 PVH the range that is 1:1 in one of the initial data
> > structures, and that would be the end of it.
> >
> 
> Could that be done by introducing a "fake" reserved region in advance
> (IVMD?) ? Such region are usually mapped to the domain 1:1 in addition
> to be coherent on the IOMMU side (so it doesn't break in case the PSP
> gets IOMMU-aware).

It doesn't have to be an "official" reserved-memory region (in the sense
of Documentation/devicetree/bindings/reserved-memory/) or exposed via
IVMD.

The memory that ends up mapped 1:1 in Dom0 PVH will be good memory which
could be used for all the regular stuff. If it is not a tiny amount, we
could let Linux (or other OS) do as they please with it.

It is only important for swiotlb-xen to know which one is the 1:1 range
so that it can manage bouncing (or not) over it.

If the 1:1 region is tiny, possibly due to memory allocation constraints
or other reasons, then yes, it makes sense to mark it as reserved
memory as you suggested, which we would do with a /reserved-memory node
if this was device tree system.
--8323329-1480880107-1746829403=:3879245--

