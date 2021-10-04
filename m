Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB22942197C
	for <lists+xen-devel@lfdr.de>; Mon,  4 Oct 2021 23:54:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.201734.356350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXVts-00031s-IQ; Mon, 04 Oct 2021 21:53:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 201734.356350; Mon, 04 Oct 2021 21:53:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXVts-000300-EF; Mon, 04 Oct 2021 21:53:32 +0000
Received: by outflank-mailman (input) for mailman id 201734;
 Mon, 04 Oct 2021 21:53:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ik8X=OY=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mXVtq-0002z9-R4
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 21:53:30 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 82107399-255d-11ec-bebd-12813bfff9fa;
 Mon, 04 Oct 2021 21:53:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 895D361526;
 Mon,  4 Oct 2021 21:53:27 +0000 (UTC)
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
X-Inumbo-ID: 82107399-255d-11ec-bebd-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633384408;
	bh=3ZCBAhE3tZV9HfZi1lWSNSACyQ0DzDfymMxDbNez3DU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kiwAFS4dJQZZ5v45mB7nJMZ1qMj1sXsdrVk6Mr5o4eDGRCJ5idYAIGgnoGEbU3omy
	 gwIEhWJ8DoVMYaaxGLOSAk9RPEBVSszDXtzvqxaIbhDGqU0E0LelQ7iN9uZWDyXpVE
	 8OQk60X6xkFjezYthmkR4MdiuI0dFdmrBdFJ7K7JLbnwEo4KgemYlBhomNf25RDQYG
	 muMqJrEBfxl4IzRB1OUqmAROKDWieHhAxbLNynoDVTcLrGV0MSlRfyUq+ZD0JTJvRd
	 G4lOE4Q3OxXyuynIKouICxzj2zJ4If/+iaNkM7E45lfUB42aeWP7nYiAh8qV9kJiUA
	 qQUa+Y8ZwOwng==
Date: Mon, 4 Oct 2021 14:53:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    Christopher Clark <christopher.w.clark@gmail.com>, 
    =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    Artem Mygaiev <Artem_Mygaiev@epam.com>, Sergio Lopez <slp@redhat.com>, 
    Wei Liu <wl@xen.org>, Stefan Hajnoczi <stefanha@gmail.com>, 
    Rust-VMM Mailing List <rust-vmm@lists.opendev.org>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Arnd Bergmann <arnd.bergmann@linaro.org>, 
    David Woodhouse <dwmw2@infradead.org>, 
    Stratos Mailing List <stratos-dev@op-lists.linaro.org>, 
    Rich Persaud <persaur@gmail.com>, 
    Daniel Smith <dpsmith@apertussolutions.com>, Paul Durrant <paul@xen.org>, 
    openxt <openxt@googlegroups.com>, Julien Grall <julien@xen.org>, 
    jgross@suse.com
Subject: Re: [Stratos-dev] Xen Rust VirtIO demos work breakdown for Project
 Stratos
In-Reply-To: <CAPD2p-m=hYbG1YjPZ9yZ7Qzs6KjCT2jSHpaDUPB0sFJoZfY4uw@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2110041436070.3209@sstabellini-ThinkPad-T480s>
References: <87pmsylywy.fsf@linaro.org> <YU5mW396S04IsCBr@mail-itl> <874ka68h96.fsf@linaro.org> <CACMJ4GbgnQVQbH1N3Duxmx10n-Qv+zzncqarNyuhmKhE-wqdqA@mail.gmail.com> <alpine.DEB.2.21.2109272323160.5022@sstabellini-ThinkPad-T480s>
 <CAPD2p-=MdGB_a+oEsFrPQpLo7GeKkMwYyAWcQt3z0qrGr3vR7w@mail.gmail.com> <alpine.DEB.2.21.2110011649220.3209@sstabellini-ThinkPad-T480s> <CAPD2p-m=hYbG1YjPZ9yZ7Qzs6KjCT2jSHpaDUPB0sFJoZfY4uw@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-2024082214-1633383612=:3209"
Content-ID: <alpine.DEB.2.21.2110041440170.3209@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2024082214-1633383612=:3209
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2110041440171.3209@sstabellini-ThinkPad-T480s>

On Sat, 2 Oct 2021, Oleksandr Tyshchenko wrote:
> On Sat, Oct 2, 2021 at 2:58 AM Stefano Stabellini <sstabellini@kernel.org> wrote:
> 
> Hi Stefano, all
> 
> [Sorry for the possible format issues]
> [I have CCed Julien]
> 
> 
>       On Tue, 28 Sep 2021, Oleksandr Tyshchenko wrote:
>       > On Tue, Sep 28, 2021 at 9:26 AM Stefano Stabellini <sstabellini@kernel.org> wrote:
>       >
>       > Hi Stefano, all
>       >
>       > [Sorry for the possible format issues]
>       >
>       >
>       >       On Mon, 27 Sep 2021, Christopher Clark wrote:
>       >       > On Mon, Sep 27, 2021 at 3:06 AM Alex Bennée via Stratos-dev <stratos-dev@op-lists.linaro.org> wrote:
>       >       >
>       >       >       Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com> writes:
>       >       >
>       >       >       > [[PGP Signed Part:Undecided]]
>       >       >       > On Fri, Sep 24, 2021 at 05:02:46PM +0100, Alex Bennée wrote:
>       >       >       >> Hi,
>       >       >       >
>       >       >       > Hi,
>       >       >       >
>       >       >       >> 2.1 Stable ABI for foreignmemory mapping to non-dom0 ([STR-57])
>       >       >       >> ───────────────────────────────────────────────────────────────
>       >       >       >>
>       >       >       >>   Currently the foreign memory mapping support only works for dom0 due
>       >       >       >>   to reference counting issues. If we are to support backends running in
>       >       >       >>   their own domains this will need to get fixed.
>       >       >       >>
>       >       >       >>   Estimate: 8w
>       >       >       >>
>       >       >       >>
>       >       >       >> [STR-57] <https://linaro.atlassian.net/browse/STR-57>
>       >       >       >
>       >       >       > I'm pretty sure it was discussed before, but I can't find relevant
>       >       >       > (part of) thread right now: does your model assumes the backend (running
>       >       >       > outside of dom0) will gain ability to map (or access in other way)
>       >       >       > _arbitrary_ memory page of a frontend domain? Or worse: any domain?
>       >       >
>       >       >       The aim is for some DomU's to host backends for other DomU's instead of
>       >       >       all backends being in Dom0. Those backend DomU's would have to be
>       >       >       considered trusted because as you say the default memory model of VirtIO
>       >       >       is to have full access to the frontend domains memory map.
>       >       >
>       >       >
>       >       > I share Marek's concern. I believe that there are Xen-based systems that will want to run guests using VirtIO devices
>       without
>       >       extending
>       >       > this level of trust to the backend domains.
>       >
>       >       >From a safety perspective, it would be challenging to deploy a system
>       >       with privileged backends. From a safety perspective, it would be a lot
>       >       easier if the backend were unprivileged.
>       >
>       >       This is one of those times where safety and security requirements are
>       >       actually aligned.
>       >
>       >
>       > Well, the foreign memory mapping has one advantage in the context of Virtio use-case
>       > which is that Virtio infrastructure in Guest doesn't require any modifications to run on top Xen.
>       > The only issue with foreign memory here is that Guest memory actually mapped without its agreement
>       > which doesn't perfectly fit into the security model. (although there is one more issue with XSA-300,
>       > but I think it will go away sooner or later, at least there are some attempts to eliminate it).
>       > While the ability to map any part of Guest memory is not an issue for the backend running in Dom0
>       > (which we usually trust), this will certainly violate Xen security model if we want to run it in other
>       > domain, so I completely agree with the existing concern.
> 
>       Yep, that's what I was referring to.
> 
> 
>       > It was discussed before [1], but I couldn't find any decisions regarding that. As I understand,
>       > the one of the possible ideas is to have some entity in Xen (PV IOMMU/virtio-iommu/whatever)
>       > that works in protection mode, so it denies all foreign mapping requests from the backend running in DomU
>       > by default and only allows requests with mapping which were *implicitly* granted by the Guest before.
>       > For example, Xen could be informed which MMIOs hold the queue PFN and notify registers
>       > (as it traps the accesses to these registers anyway) and could theoretically parse the frontend request
>       > and retrieve descriptors to make a decision which GFNs are actually *allowed*.
>       >
>       > I can't say for sure (sorry not familiar enough with the topic), but implementing the virtio-iommu device
>       > in Xen we could probably avoid Guest modifications at all. Of course, for this to work
>       > the Virtio infrastructure in Guest should use DMA API as mentioned in [1].
>       >
>       > Would the “restricted foreign mapping” solution retain the Xen security model and be accepted
>       > by the Xen community? I wonder, has someone already looked in this direction, are there any
>       > pitfalls here or is this even feasible?
>       >
>       > [1] https://lore.kernel.org/xen-devel/464e91ec-2b53-2338-43c7-a018087fc7f6@arm.com/
> 
>       The discussion that went further is actually one based on the idea that
>       there is a pre-shared memory area and the frontend always passes
>       addresses from it. For ease of implementation, the pre-shared area is
>       the virtqueue itself so this approach has been called "fat virtqueue".
>       But it requires guest modifications and it probably results in
>       additional memory copies.
> 
>  
> I got it. Although we would need to map that pre-shared area anyway (I presume it could be done at once during initialization), I think it
> much better than
> map arbitrary pages at runtime.

Yeah that's the idea


> If there is a way for Xen to know the pre-shared area location in advance it will be able to allow mapping
> this region only and deny other attempts.
 
No, but there are patches (not yet upstream) to introduce a way to
pre-share memory regions between VMs using xl:
https://github.com/Xilinx/xen/commits/xilinx/release-2021.1?after=4bd2da58b5b008f77429007a307b658db9c0f636+104&branch=xilinx%2Frelease-2021.1

So I think it would probably be the other way around: xen/libxl
advertises on device tree (or ACPI) the presence of the pre-shared
regions to both domains. Then frontend and backend would start using it.

 
>       I am not sure if the approach you mentioned could be implemented
>       completely without frontend changes. It looks like Xen would have to
>       learn how to inspect virtqueues in order to verify implicit grants
>       without frontend changes.
> 
>  
> I looked through the virtio-iommu specification and corresponding Linux driver but I am sure I don't see all the challenges and pitfalls.
> Having a limited knowledge of IOMMU infrastructure in Linux, below is just my guess, which might be wrong.
> 
> 1. I think, if we want to avoid frontend changes the backend in Xen would need to fully conform to the specification, I am afraid that
> besides just inspecting virtqueues, the backend needs to properly and completely emulate the virtio device, handle shadow page tables, etc.
> Otherwise we might break the guest. I expect a huge amount of work to implement this properly.

Yeah, I think we would want to stay away from shadow pagetables unless
we are really forced to go there.


> 2. Also, if I got the things correctly, it looks like when enabling virtio-iommu, all addresses passed in requests to the virtio devices
> behind the virtio-iommu will be in guest virtual address space (IOVA). So we would need to find a way for userspace (if the backend is
> IOREQ server) to translate them to guest physical addresses (IPA) via these shadow page tables in the backend in front of mapping them via
> foreign memory map calls. So I expect Xen, toolstack and Linux privcmd driver changes and additional complexity taking into account how the
> data structures could be accessed (data structures being continuously in IOVA, could be discontinuous in IPA, indirect table descriptors,
> etc). 
> I am wondering, would it be possible to have identity IOMMU mapping (IOVA == GPA) at the guest side but without bypassing an IOMMU, as we
> need the virtio-iommu frontend to send map/unmap requests, can we control this behaviour somehow?
> I think this would simplify things.

None of the above looks easy. I think you are right that we would need
IOVA == GPA to make the implementation feasible and with decent
performance. But if we need a spec change, then I think Juergen's
proposal of introducing a new transport that uses grant table references
instead of GPAs is worth considering.


> 3. Also, we would probably want to have a single virtio-iommu device instance per guest, so all virtio devices which belong to this guest
> will share the IOMMU mapping for the optimization purposes. For this to work all virtio devices inside a guest should be attached to the
> same IOMMU domain. Probably, we could control that, but I am not 100% sure.  
--8323329-2024082214-1633383612=:3209--

