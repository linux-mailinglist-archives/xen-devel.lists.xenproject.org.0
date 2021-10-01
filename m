Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D64441F865
	for <lists+xen-devel@lfdr.de>; Sat,  2 Oct 2021 01:58:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200858.355414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWSQ1-0007Ot-W9; Fri, 01 Oct 2021 23:58:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200858.355414; Fri, 01 Oct 2021 23:58:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWSQ1-0007MX-TG; Fri, 01 Oct 2021 23:58:21 +0000
Received: by outflank-mailman (input) for mailman id 200858;
 Fri, 01 Oct 2021 23:58:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cSXX=OV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mWSQ0-0007MR-An
 for xen-devel@lists.xenproject.org; Fri, 01 Oct 2021 23:58:20 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c96d8ed4-e3bd-4f4c-aee7-67e29258680b;
 Fri, 01 Oct 2021 23:58:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 78ECB61AA4;
 Fri,  1 Oct 2021 23:58:17 +0000 (UTC)
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
X-Inumbo-ID: c96d8ed4-e3bd-4f4c-aee7-67e29258680b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633132698;
	bh=jb0Rhb8NhJdRBN9XKZIK1XqwcZ8oGhony91KCCa0n6w=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Dv25pNuQAMYUQ4NF2DoJdG95DbJsE1hGAbSHNIVi40JSIN0F7vzv4n14h/QfEJ6Jz
	 Tr4+vkBjaoxl/TYLf2D0pEs3ha2hC0DXxFPOX7tb/fTuzcxXJ/uklS3AfzJFr76wEt
	 DepVXEh2wSOyHNEstqO/dpBQPEDnOWKL4KZd9AXV6usQa2rRTeZPDeZbTf6nRGqWrk
	 6t/Nm4r2ujjXBXRdPBiWS4wJvuUU/EEtqDWTEfOhU+Wc/hihvvlFkwJFggeWSKcb8I
	 Blxxiyk/nbda5wr5FF1WizYyy9i68QPyveo7BIhq6SdlG5gd4QyeCff7bi1SSnJy+o
	 Syq/Jf4Ba0X+w==
Date: Fri, 1 Oct 2021 16:58:16 -0700 (PDT)
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
    openxt <openxt@googlegroups.com>
Subject: Re: [Stratos-dev] Xen Rust VirtIO demos work breakdown for Project
 Stratos
In-Reply-To: <CAPD2p-=MdGB_a+oEsFrPQpLo7GeKkMwYyAWcQt3z0qrGr3vR7w@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2110011649220.3209@sstabellini-ThinkPad-T480s>
References: <87pmsylywy.fsf@linaro.org> <YU5mW396S04IsCBr@mail-itl> <874ka68h96.fsf@linaro.org> <CACMJ4GbgnQVQbH1N3Duxmx10n-Qv+zzncqarNyuhmKhE-wqdqA@mail.gmail.com> <alpine.DEB.2.21.2109272323160.5022@sstabellini-ThinkPad-T480s>
 <CAPD2p-=MdGB_a+oEsFrPQpLo7GeKkMwYyAWcQt3z0qrGr3vR7w@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1419400918-1633132698=:3209"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1419400918-1633132698=:3209
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 28 Sep 2021, Oleksandr Tyshchenko wrote:
> On Tue, Sep 28, 2021 at 9:26 AM Stefano Stabellini <sstabellini@kernel.org> wrote:
> 
> Hi Stefano, all
> 
> [Sorry for the possible format issues]
> 
> 
>       On Mon, 27 Sep 2021, Christopher Clark wrote:
>       > On Mon, Sep 27, 2021 at 3:06 AM Alex Bennée via Stratos-dev <stratos-dev@op-lists.linaro.org> wrote:
>       >
>       >       Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com> writes:
>       >
>       >       > [[PGP Signed Part:Undecided]]
>       >       > On Fri, Sep 24, 2021 at 05:02:46PM +0100, Alex Bennée wrote:
>       >       >> Hi,
>       >       >
>       >       > Hi,
>       >       >
>       >       >> 2.1 Stable ABI for foreignmemory mapping to non-dom0 ([STR-57])
>       >       >> ───────────────────────────────────────────────────────────────
>       >       >>
>       >       >>   Currently the foreign memory mapping support only works for dom0 due
>       >       >>   to reference counting issues. If we are to support backends running in
>       >       >>   their own domains this will need to get fixed.
>       >       >>
>       >       >>   Estimate: 8w
>       >       >>
>       >       >>
>       >       >> [STR-57] <https://linaro.atlassian.net/browse/STR-57>
>       >       >
>       >       > I'm pretty sure it was discussed before, but I can't find relevant
>       >       > (part of) thread right now: does your model assumes the backend (running
>       >       > outside of dom0) will gain ability to map (or access in other way)
>       >       > _arbitrary_ memory page of a frontend domain? Or worse: any domain?
>       >
>       >       The aim is for some DomU's to host backends for other DomU's instead of
>       >       all backends being in Dom0. Those backend DomU's would have to be
>       >       considered trusted because as you say the default memory model of VirtIO
>       >       is to have full access to the frontend domains memory map.
>       >
>       >
>       > I share Marek's concern. I believe that there are Xen-based systems that will want to run guests using VirtIO devices without
>       extending
>       > this level of trust to the backend domains.
> 
>       >From a safety perspective, it would be challenging to deploy a system
>       with privileged backends. From a safety perspective, it would be a lot
>       easier if the backend were unprivileged.
> 
>       This is one of those times where safety and security requirements are
>       actually aligned.
> 
> 
> Well, the foreign memory mapping has one advantage in the context of Virtio use-case
> which is that Virtio infrastructure in Guest doesn't require any modifications to run on top Xen.
> The only issue with foreign memory here is that Guest memory actually mapped without its agreement
> which doesn't perfectly fit into the security model. (although there is one more issue with XSA-300,
> but I think it will go away sooner or later, at least there are some attempts to eliminate it).
> While the ability to map any part of Guest memory is not an issue for the backend running in Dom0
> (which we usually trust), this will certainly violate Xen security model if we want to run it in other
> domain, so I completely agree with the existing concern.

Yep, that's what I was referring to.


> It was discussed before [1], but I couldn't find any decisions regarding that. As I understand,
> the one of the possible ideas is to have some entity in Xen (PV IOMMU/virtio-iommu/whatever)
> that works in protection mode, so it denies all foreign mapping requests from the backend running in DomU
> by default and only allows requests with mapping which were *implicitly* granted by the Guest before.
> For example, Xen could be informed which MMIOs hold the queue PFN and notify registers
> (as it traps the accesses to these registers anyway) and could theoretically parse the frontend request
> and retrieve descriptors to make a decision which GFNs are actually *allowed*.
> 
> I can't say for sure (sorry not familiar enough with the topic), but implementing the virtio-iommu device
> in Xen we could probably avoid Guest modifications at all. Of course, for this to work
> the Virtio infrastructure in Guest should use DMA API as mentioned in [1].
> 
> Would the “restricted foreign mapping” solution retain the Xen security model and be accepted
> by the Xen community? I wonder, has someone already looked in this direction, are there any
> pitfalls here or is this even feasible?
> 
> [1] https://lore.kernel.org/xen-devel/464e91ec-2b53-2338-43c7-a018087fc7f6@arm.com/

The discussion that went further is actually one based on the idea that
there is a pre-shared memory area and the frontend always passes
addresses from it. For ease of implementation, the pre-shared area is
the virtqueue itself so this approach has been called "fat virtqueue".
But it requires guest modifications and it probably results in
additional memory copies.

I am not sure if the approach you mentioned could be implemented
completely without frontend changes. It looks like Xen would have to
learn how to inspect virtqueues in order to verify implicit grants
without frontend changes. With or without guest modifications, I am not
aware of anyone doing research and development on this approach.
--8323329-1419400918-1633132698=:3209--

