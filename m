Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A52624E2C
	for <lists+xen-devel@lfdr.de>; Fri, 11 Nov 2022 00:01:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442251.696315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otGY4-0005Gj-1t; Thu, 10 Nov 2022 23:01:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442251.696315; Thu, 10 Nov 2022 23:01:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otGY3-0005F6-V8; Thu, 10 Nov 2022 23:01:27 +0000
Received: by outflank-mailman (input) for mailman id 442251;
 Thu, 10 Nov 2022 23:01:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+5rg=3K=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1otGY2-0005Eq-0J
 for xen-devel@lists.xenproject.org; Thu, 10 Nov 2022 23:01:26 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 999100ed-614b-11ed-8fd2-01056ac49cbb;
 Fri, 11 Nov 2022 00:01:24 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DC374B823D3;
 Thu, 10 Nov 2022 23:01:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 193C1C433D6;
 Thu, 10 Nov 2022 23:01:21 +0000 (UTC)
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
X-Inumbo-ID: 999100ed-614b-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668121282;
	bh=/9R3N4720f/BX838d0wuD/vGzbwI3ZUDkCT1+ryl9lY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sKCszCjUIxQnvAZAUyn2460uVo2fXLAU14fSns8Bb/dYJ23vNV6V4KhYeZjKcUN0I
	 f9D2BAD1ZZuLWcD1V5oW9NAP+/2Jikrl44KeBFsk6GWNOUWdD+cByj0Wq2KkET9CEe
	 VNtMcdbBiHOsHiG07EtaSP4WS3EcZvc+rrHAclPat5URU5wpGuahEzmavnRw6IFcwR
	 77+uBW0310ThqRwtEYkr5/wwrjrcmxi/qGLpStzQ8CSJe9gMECHj94eJUHD2/F8nw7
	 /ittQBn3h/GKPImDlyJLs4I/Q4O0gm8VnsvJ3UqY3xTCrZF4jMf5psW1/U5TulIR6m
	 aGCL4TQghP1IQ==
Date: Thu, 10 Nov 2022 15:01:19 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Rahul Singh <Rahul.Singh@arm.com>, 
    Xen developer discussion <xen-devel@lists.xenproject.org>, 
    Michal Orzel <Michal.Orzel@arm.com>, 
    Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, 
    Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: Re: Proposal for virtual IOMMU binding b/w vIOMMU and passthrough
 devices
In-Reply-To: <9F323893-B1C9-4D31-9A40-213345421860@arm.com>
Message-ID: <alpine.DEB.2.22.394.2211101500200.50442@ubuntu-linux-20-04-desktop>
References: <DD70007C-300F-44D3-B314-A5F8C4582CD3@arm.com> <75b7665f-66aa-2e11-35a0-edf20a9c0139@xen.org> <99E954B0-50F5-4D7B-A7D2-50D1B7B3657C@arm.com> <60b9cc07-c0ec-756b-802b-5fc96f253dbf@xen.org> <EDDD0430-0BFF-4C95-B9CE-402487C2E5DE@arm.com>
 <fde8c845-8d35-83cd-d4fd-bb2c5fd1a7ed@xen.org> <227AD28E-DFB8-4EB3-9E0E-61C70A0D19EB@arm.com> <f777b164-54c6-6091-79ce-fac3dd603b8c@xen.org> <34B31FA6-72D8-4F03-AC94-3DC795D0FF55@arm.com> <222ed837-594d-6301-edec-6f9d26e1fadf@xen.org>
 <alpine.DEB.2.22.394.2210301523450.3408@ubuntu-linux-20-04-desktop> <82c45bc1-6052-502b-3007-8a16fbd1d433@xen.org> <alpine.DEB.2.22.394.2210302148150.3408@ubuntu-linux-20-04-desktop> <9F323893-B1C9-4D31-9A40-213345421860@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-163733150-1668121282=:50442"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-163733150-1668121282=:50442
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 31 Oct 2022, Bertrand Marquis wrote:
> Hi All,
> 
> > On 30 Oct 2022, at 21:14, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> > On Sun, 30 Oct 2022, Julien Grall wrote:
> >> Hi Stefano,
> >> 
> >> On 30/10/2022 14:23, Stefano Stabellini wrote:
> >>> On Fri, 28 Oct 2022, Julien Grall wrote:
> >>>> On 28/10/2022 14:13, Bertrand Marquis wrote:
> >>>>>> On 28 Oct 2022, at 14:06, Julien Grall <julien@xen.org> wrote:
> >>>>>> 
> >>>>>> Hi Rahul,
> >>>>>> 
> >>>>>> On 28/10/2022 13:54, Rahul Singh wrote:
> >>>>>>>>>>>> For ACPI, I would have expected the information to be
> >>>>>>>>>>>> found in
> >>>>>>>>>>>> the IOREQ.
> >>>>>>>>>>>> 
> >>>>>>>>>>>> So can you add more context why this is necessary for
> >>>>>>>>>>>> everyone?
> >>>>>>>>>>> We have information for IOMMU and Master-ID but we don’t
> >>>>>>>>>>> have
> >>>>>>>>>>> information for linking vMaster-ID to pMaster-ID.
> >>>>>>>>>> 
> >>>>>>>>>> I am confused. Below, you are making the virtual master ID
> >>>>>>>>>> optional. So shouldn't this be mandatory if you really need
> >>>>>>>>>> the
> >>>>>>>>>> mapping with the virtual ID?
> >>>>>>>>> vMasterID is optional if user knows pMasterID is unique on the
> >>>>>>>>> system. But if pMasterId is not unique then user needs to
> >>>>>>>>> provide
> >>>>>>>>> the vMasterID.
> >>>>>>>> 
> >>>>>>>> So the expectation is the user will be able to know that the
> >>>>>>>> pMasterID
> >>>>>>>> is uniq. This may be easy with a couple of SMMUs, but if you have
> >>>>>>>> 50+
> >>>>>>>> (as suggested above). This will become a pain on larger system.
> >>>>>>>> 
> >>>>>>>> IHMO, it would be much better if we can detect that in libxl (see
> >>>>>>>> below).
> >>>>>>> We can make the vMasterID compulsory to avoid complexity in libxl to
> >>>>>>> solve this
> >>>>>> 
> >>>>>> In general, complexity in libxl is not too much of problem.
> >>> 
> >>> I agree with this and also I agree with Julien's other statement:
> >>> 
> >>> "I am strongly in favor of libxl to modify it if it greatly improves the
> >>> user experience."
> >>> 
> >>> I am always in favor of reducing complexity for the user as they
> >>> typically can't deal with tricky details such as MasterIDs. In general,
> >>> I think we need more automation with our tooling.
> >>> 
> >>> However, it might not be as simple as adding support for automatically
> >>> generating IDs in libxl because we have 2 additional cases to support:
> >>> 1) dom0less
> >>> 2) statically built guests
> >>> 
> >>> For 1) we would need the same support also in Xen? Which means more
> >>> complexity in Xen.
> >> Xen will need to parse the device-tree to find the mapping. So I am not
> >> entirely convinced there will be more complexity needed other than requiring a
> >> bitmap to know which vMasterID has been allocated.
> >> 
> >> That said, you would still need one to validate the input provided by the
> >> user. So overall maybe there will be no added complexity?
> >> 
> >>> 
> >>> 2) are guests like Zephyr that consume a device tree at
> >>> build time instead of runtime. These guests are built specifically for a
> >>> given environment and it is not a problem to rebuild them for every Xen
> >>> release.
> >>> 
> >>> However I think it is going to be a problem if we have to run libxl to
> >>> get the device tree needed for the Zephyr build. That is because it
> >>> means that the Zephyr build system would have to learn how to compile
> >>> (or crosscompile) libxl in order to retrieve the data needed for its
> >>> input. Even for systems based on Yocto (Yocto already knows how to build
> >>> libxl) would cause issues because of internal dependencies this would
> >>> introduce.
> >> 
> >> That would not be very different to how this works today for Zephyr. They need
> >> libxl to generate the guest DT.
> >> 
> >> That said, I agree this is a bit of a pain...
> > 
> > Yeah..
> > 
> > 
> >>> So I think the automatic generation might be best done in another tool.
> >> It sounds like what you want is creating something similar to libacpi but for
> >> Device-Tree. That should work with some caveats.
> > 
> > Yes, something like that. We have a framework for reading, editing and
> > generating Device Tree: Lopper https://github.com/devicetree-org/lopper
> > 
> > It is mostly targeted at build time but it could also be invoked on
> > target at runtime.
> > 
> > 
> >>> I think we need something like a script that takes a partial device tree
> >>> as input and provides a more detailed partial device tree as output with
> >>> the generated IDs.
> >> 
> >> AFAICT, having the partial device-tree is not enough. You also need the real
> >> DT to figure out the pMaster-ID.
> >> 
> >>> 
> >>> If we did it that way, we could call the script from libxl, but also we
> >>> could call it separately from ImageBuilder for dom0less and Zephyr/Yocto
> >>> could also call it.
> >>> 
> >>> Basically we make it easier for everyone to use it. The only price to
> >>> pay is that it will be a bit less efficient for xl guests (one more
> >>> script to fork and exec) but I think is a good compromise.
> >> 
> >> We would need an hypercall to retrieve the host Device-Tree. But that would
> >> not be too difficult to add.
> > 
> > Good point
> > 
> > 
> >>> I think this is a great idea, I only suggest that we move the automatic
> >>> generation out of libxl (a separate stand-alone script), in another
> >>> place that can be more easily reused by multiple projects and different
> >>> use-cases.
> >> 
> >> If we use the concept of libacpi, we may not need a to have a stand-alone
> >> script. It could directly linked in libxl or any other tools.
> > 
> > I don't feel strongly whether it should be a library, a script or
> > something else. My only point is that it should be easy to use both at
> > build time (e.g. Yocto/Zephyr/ImageBuilder/Lopper) and runtime
> > (xl/libxl).
> > 
> > We have already a partial DTB generator as a Lopper "lop" (a Lopper
> > plugin). Probably using Lopper would be the easiest way to implement it,
> > and the "lop" could be under xen.git (it doesn't have to reside under
> > the lopper repository).
> > 
> > But if we wanted a library that would be OK too. The issue with libxl is
> > not much that it is a library but that it is complex to build and has
> > many dependencies (it can only be built from the top level ./configure
> > and make).
> > 
> > Ideally this would be something quick that can be easily invoked as the
> > first step of an external third-party build process.
> 
> I think that we are making this problem a lot to complex and I am not sure
> that all this complexity is required.
> 
> For now, we could make the assumption that a master ID is uniq and never
> reused on a system. Linux is currently making this assumption to simplify
> the code. We also found no hardware with the same master ID reused.
> 
> It would mean that the user would just need to keep the stream-id property
> in the device tree, replace the link to the SMMU with a fake phandle. The
> tools could then add the vIOMMU node and fix all phandle in the device tree
> to properly point to it. In practice the user can simply copy the whole device
> node with the stream-id properties and just replace the phandle by 0x0.
> 
> This will make the first implementation a lot simpler and prevent adding
> hyper calls or to much magic in the tools for now.
> This will also give us more time to check if we need more complex use
> cases and how they could be configured.
> 
> What do you think ?

I think it is a good idea. It will allow us to have something that works
and learn the details of the implementation. I think we'll be able to
come up with a better idea on how to solve it afterwards.
--8323329-163733150-1668121282=:50442--

