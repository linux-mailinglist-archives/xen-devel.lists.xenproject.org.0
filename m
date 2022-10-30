Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8E5612CF5
	for <lists+xen-devel@lfdr.de>; Sun, 30 Oct 2022 22:15:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.432629.685302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opFdR-0000D5-7o; Sun, 30 Oct 2022 21:14:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 432629.685302; Sun, 30 Oct 2022 21:14:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opFdR-0000A2-3t; Sun, 30 Oct 2022 21:14:25 +0000
Received: by outflank-mailman (input) for mailman id 432629;
 Sun, 30 Oct 2022 21:14:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oc5E=27=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1opFdP-00009Y-D8
 for xen-devel@lists.xenproject.org; Sun, 30 Oct 2022 21:14:23 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2e97300-5897-11ed-91b5-6bf2151ebd3b;
 Sun, 30 Oct 2022 22:14:22 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9D324B80DA8;
 Sun, 30 Oct 2022 21:14:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91896C433D6;
 Sun, 30 Oct 2022 21:14:17 +0000 (UTC)
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
X-Inumbo-ID: d2e97300-5897-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667164460;
	bh=XciBK2+w7UmHSTsPArQZvPuCyUtZHsyvPyqXMoFOLBs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=h6brfdAx72B71SWDADb3fszm8xNVHiPG+kwdGhajt+RtgsSp5MYLJAmE3fLG/4GAC
	 2JjlDJs63n2LiKIY4JTvXFm7GY7muresHxpPcHrmDQPlIQQ+hFxPw0kRvK+Kfx/xJp
	 iFOCH46qCskBq2W2GMapJsa+6TB5vabriPr3bCN7VkH7k113RPOTwVUcl8ZXS6nZU7
	 qdci0zPInauvhgYJEGNpsIDxFEt8mEBA8ZfbHQXQd4PL/RHAasyQY/xk+TpYjikO/K
	 hwsrRVXHV2gk7KL/s/xDOp1lYHpPx0A2Jg0rUA2FlIB5eT/8rqKUX9XFZ/O5zCFhcd
	 o/iFp9J195zJw==
Date: Sun, 30 Oct 2022 22:14:15 +0100 (CET)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
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
In-Reply-To: <82c45bc1-6052-502b-3007-8a16fbd1d433@xen.org>
Message-ID: <alpine.DEB.2.22.394.2210302148150.3408@ubuntu-linux-20-04-desktop>
References: <DD70007C-300F-44D3-B314-A5F8C4582CD3@arm.com> <75b7665f-66aa-2e11-35a0-edf20a9c0139@xen.org> <99E954B0-50F5-4D7B-A7D2-50D1B7B3657C@arm.com> <60b9cc07-c0ec-756b-802b-5fc96f253dbf@xen.org> <EDDD0430-0BFF-4C95-B9CE-402487C2E5DE@arm.com>
 <fde8c845-8d35-83cd-d4fd-bb2c5fd1a7ed@xen.org> <227AD28E-DFB8-4EB3-9E0E-61C70A0D19EB@arm.com> <f777b164-54c6-6091-79ce-fac3dd603b8c@xen.org> <34B31FA6-72D8-4F03-AC94-3DC795D0FF55@arm.com> <222ed837-594d-6301-edec-6f9d26e1fadf@xen.org>
 <alpine.DEB.2.22.394.2210301523450.3408@ubuntu-linux-20-04-desktop> <82c45bc1-6052-502b-3007-8a16fbd1d433@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1834020026-1667163085=:3408"
Content-ID: <alpine.DEB.2.22.394.2210302151350.3408@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1834020026-1667163085=:3408
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2210302151351.3408@ubuntu-linux-20-04-desktop>

On Sun, 30 Oct 2022, Julien Grall wrote:
> Hi Stefano,
> 
> On 30/10/2022 14:23, Stefano Stabellini wrote:
> > On Fri, 28 Oct 2022, Julien Grall wrote:
> > > On 28/10/2022 14:13, Bertrand Marquis wrote:
> > > > > On 28 Oct 2022, at 14:06, Julien Grall <julien@xen.org> wrote:
> > > > > 
> > > > > Hi Rahul,
> > > > > 
> > > > > On 28/10/2022 13:54, Rahul Singh wrote:
> > > > > > > > > > > For ACPI, I would have expected the information to be
> > > > > > > > > > > found in
> > > > > > > > > > > the IOREQ.
> > > > > > > > > > > 
> > > > > > > > > > > So can you add more context why this is necessary for
> > > > > > > > > > > everyone?
> > > > > > > > > > We have information for IOMMU and Master-ID but we don’t
> > > > > > > > > > have
> > > > > > > > > > information for linking vMaster-ID to pMaster-ID.
> > > > > > > > > 
> > > > > > > > > I am confused. Below, you are making the virtual master ID
> > > > > > > > > optional. So shouldn't this be mandatory if you really need
> > > > > > > > > the
> > > > > > > > > mapping with the virtual ID?
> > > > > > > > vMasterID is optional if user knows pMasterID is unique on the
> > > > > > > > system. But if pMasterId is not unique then user needs to
> > > > > > > > provide
> > > > > > > > the vMasterID.
> > > > > > > 
> > > > > > > So the expectation is the user will be able to know that the
> > > > > > > pMasterID
> > > > > > > is uniq. This may be easy with a couple of SMMUs, but if you have
> > > > > > > 50+
> > > > > > > (as suggested above). This will become a pain on larger system.
> > > > > > > 
> > > > > > > IHMO, it would be much better if we can detect that in libxl (see
> > > > > > > below).
> > > > > > We can make the vMasterID compulsory to avoid complexity in libxl to
> > > > > > solve this
> > > > > 
> > > > > In general, complexity in libxl is not too much of problem.
> > 
> > I agree with this and also I agree with Julien's other statement:
> > 
> > "I am strongly in favor of libxl to modify it if it greatly improves the
> > user experience."
> > 
> > I am always in favor of reducing complexity for the user as they
> > typically can't deal with tricky details such as MasterIDs. In general,
> > I think we need more automation with our tooling.
> > 
> > However, it might not be as simple as adding support for automatically
> > generating IDs in libxl because we have 2 additional cases to support:
> > 1) dom0less
> > 2) statically built guests
> > 
> > For 1) we would need the same support also in Xen? Which means more
> > complexity in Xen.
> Xen will need to parse the device-tree to find the mapping. So I am not
> entirely convinced there will be more complexity needed other than requiring a
> bitmap to know which vMasterID has been allocated.
> 
> That said, you would still need one to validate the input provided by the
> user. So overall maybe there will be no added complexity?
> 
> > 
> > 2) are guests like Zephyr that consume a device tree at
> > build time instead of runtime. These guests are built specifically for a
> > given environment and it is not a problem to rebuild them for every Xen
> > release.
> > 
> > However I think it is going to be a problem if we have to run libxl to
> > get the device tree needed for the Zephyr build. That is because it
> > means that the Zephyr build system would have to learn how to compile
> > (or crosscompile) libxl in order to retrieve the data needed for its
> > input. Even for systems based on Yocto (Yocto already knows how to build
> > libxl) would cause issues because of internal dependencies this would
> > introduce.
> 
> That would not be very different to how this works today for Zephyr. They need
> libxl to generate the guest DT.
> 
> That said, I agree this is a bit of a pain...

Yeah..


> > So I think the automatic generation might be best done in another tool.
> It sounds like what you want is creating something similar to libacpi but for
> Device-Tree. That should work with some caveats.

Yes, something like that. We have a framework for reading, editing and
generating Device Tree: Lopper https://github.com/devicetree-org/lopper

It is mostly targeted at build time but it could also be invoked on
target at runtime.

 
> > I think we need something like a script that takes a partial device tree
> > as input and provides a more detailed partial device tree as output with
> > the generated IDs.
> 
> AFAICT, having the partial device-tree is not enough. You also need the real
> DT to figure out the pMaster-ID.
> 
> > 
> > If we did it that way, we could call the script from libxl, but also we
> > could call it separately from ImageBuilder for dom0less and Zephyr/Yocto
> > could also call it.
> > 
> > Basically we make it easier for everyone to use it. The only price to
> > pay is that it will be a bit less efficient for xl guests (one more
> > script to fork and exec) but I think is a good compromise.
> 
> We would need an hypercall to retrieve the host Device-Tree. But that would
> not be too difficult to add.

Good point


> > I think this is a great idea, I only suggest that we move the automatic
> > generation out of libxl (a separate stand-alone script), in another
> > place that can be more easily reused by multiple projects and different
> > use-cases.
> 
> If we use the concept of libacpi, we may not need a to have a stand-alone
> script. It could directly linked in libxl or any other tools.
 
I don't feel strongly whether it should be a library, a script or
something else. My only point is that it should be easy to use both at
build time (e.g. Yocto/Zephyr/ImageBuilder/Lopper) and runtime
(xl/libxl).

We have already a partial DTB generator as a Lopper "lop" (a Lopper
plugin). Probably using Lopper would be the easiest way to implement it,
and the "lop" could be under xen.git (it doesn't have to reside under
the lopper repository).

But if we wanted a library that would be OK too. The issue with libxl is
not much that it is a library but that it is complex to build and has
many dependencies (it can only be built from the top level ./configure
and make).

Ideally this would be something quick that can be easily invoked as the
first step of an external third-party build process.
--8323329-1834020026-1667163085=:3408--

