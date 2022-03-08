Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3047F4D21EC
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 20:49:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287515.487626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRfpb-0004jX-TU; Tue, 08 Mar 2022 19:49:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287515.487626; Tue, 08 Mar 2022 19:49:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRfpb-0004hL-Pq; Tue, 08 Mar 2022 19:49:15 +0000
Received: by outflank-mailman (input) for mailman id 287515;
 Tue, 08 Mar 2022 19:49:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V7dW=TT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nRfpa-0004gp-Vg
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 19:49:14 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d450a296-9f18-11ec-8539-5f4723681683;
 Tue, 08 Mar 2022 20:49:13 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 76EE7B81D3F;
 Tue,  8 Mar 2022 19:49:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB1F8C340F5;
 Tue,  8 Mar 2022 19:49:10 +0000 (UTC)
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
X-Inumbo-ID: d450a296-9f18-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646768951;
	bh=MhfF0cS09iq6EtjeHIdgTWVEssMD6YdhH3cFEPK33FY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Ve5bDxeSsMIODH01x3gFsE+dTRgfO9AtXa1NNzosZKN+CQ6qHvlUhEuf4tN5UxqDq
	 kYMDNB7ComXmWlVoLuZbOUCYiZcnFPZuz+MByy1NHQAeoG8qIJM0QdqUrSaJRWGZkp
	 yQbzD1+eUIQBLpKXpdC+yFEJgMLRe2P7jZKJndIooMkWUR7bncnarhB49iJl+SLxU+
	 SwBlQI7T0weHrksUKkXance9yy2z4RC/+1mFstgMoVN+MxEoU5NOFabh4tvGd1eibd
	 zXrGdGK5ehcnCtNYkHW3+l1iS936n1Vq2uWRUVb9+Kv8QS44szG7xUnlVO/KXmxeE5
	 FQ0I7Hv+k/JHg==
Date: Tue, 8 Mar 2022 11:49:10 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Wei Chen <Wei.Chen@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Penny Zheng <Penny.Zheng@arm.com>, Henry Wang <Henry.Wang@arm.com>, 
    nd <nd@arm.com>
Subject: RE: Proposal for Porting Xen to Armv8-R64 - DraftA
In-Reply-To: <PAXPR08MB7420DDE732B24C541B254E699E099@PAXPR08MB7420.eurprd08.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2203081148410.3261@ubuntu-linux-20-04-desktop>
References: <PAXPR08MB7420A01809B84E04E196793F9E3D9@PAXPR08MB7420.eurprd08.prod.outlook.com> <04db7e8b-2f04-41d7-1deb-d8bda3625c04@xen.org> <PAXPR08MB7420BF1299A1577B98211C1A9E029@PAXPR08MB7420.eurprd08.prod.outlook.com> <1f0bba54-158b-d171-6f99-0c29e0547f8a@xen.org>
 <PAXPR08MB742067028155B11528C5CCA39E049@PAXPR08MB7420.eurprd08.prod.outlook.com> <PAXPR08MB7420827063D47932F428CEC89E089@PAXPR08MB7420.eurprd08.prod.outlook.com> <alpine.DEB.2.22.394.2203071348220.3261@ubuntu-linux-20-04-desktop>
 <PAXPR08MB7420DDE732B24C541B254E699E099@PAXPR08MB7420.eurprd08.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 8 Mar 2022, Wei Chen wrote:
> > On Mon, 7 Mar 2022, Wei Chen wrote:
> > > > > On 01/03/2022 07:51, Wei Chen wrote:
> > > > > >>> ### 1.2. Xen Challenges with PMSA Virtualization
> > > > > >>> Xen is PMSA unaware Type-1 Hypervisor, it will need
> > modifications to
> > > > > run
> > > > > >>> with an MPU and host multiple guest OSes.
> > > > > >>>
> > > > > >>> - No MMU at EL2:
> > > > > >>>       - No EL2 Stage 1 address translation
> > > > > >>>           - Xen provides fixed ARM64 virtual memory layout as
> > basis
> > > > of
> > > > > >> EL2
> > > > > >>>             stage 1 address translation, which is not applicable
> > on
> > > > > MPU
> > > > > >> system,
> > > > > >>>             where there is no virtual addressing. As a result,
> > any
> > > > > >> operation
> > > > > >>>             involving transition from PA to VA, like ioremap,
> > needs
> > > > > >> modification
> > > > > >>>             on MPU system.
> > > > > >>>       - Xen's run-time addresses are the same as the link time
> > > > > addresses.
> > > > > >>>           - Enable PIC (position-independent code) on a real-
> > time
> > > > > target
> > > > > >>>             processor probably very rare.
> > > > > >>
> > > > > >> Aside the assembly boot code and UEFI stub, Xen already runs at
> > the
> > > > > same
> > > > > >> address as it was linked.
> > > > > >>
> > > > > >
> > > > > > But the difference is that, base on MMU, we can use the same link
> > > > > address
> > > > > > for all platforms. But on MPU system, we can't do it in the same
> > way.
> > > > >
> > > > > I agree that we currently use the same link address for all the
> > > > > platforms. But this is also a problem when using MMU because EL2 has
> > a
> > > > > single TTBR.
> > > > >
> > > > > At the moment we are switching page-tables with the MMU which is not
> > > > > safe. Instead we need to turn out the MMU off, switch page-tables
> > and
> > > > > then turn on the MMU. This means we need to have an identity mapping
> > of
> > > > > Xen in the page-tables. Assuming Xen is not relocated, the identity
> > > > > mapping may clash with Xen (or the rest of the virtual address map).
> > > > >
> > > >
> > > > Is this the same reason we create a dummy reloc section for EFI loader?
> > > >
> > > > > My initial idea was to enable PIC and update the relocation at boot
> > > > > time. But this is a bit cumbersome to do. So now I am looking to
> > have a
> > > > > semi-dynamic virtual layout and find some place to relocate part of
> > Xen
> > > > > to use for CPU bring-up.
> > > > >
> > > > > Anyway, my point is we possibly could look at PIC if that could
> > allow
> > > > > generic Xen image.
> > > > >
> > > >
> > > > I understand your concern. IMO, PIC is possible to do this, but
> > obviously,
> > > > it's not a small amount of work. And I want to hear some suggestions
> > from
> > > > Stefano, because he also has some solutions in previous thread.
> > > >
> > >
> > > Can you have a look at the PIC discussion between Julien and me?
> > > I think we may need some inputs from your view.
> > 
> > If we have to have a build-time device tree anyway, we could
> > automatically generate the link address, together with other required
> > addresses. There would little benefit to do PIC if we have to have a
> > build-time device tree in any case.
> > 
> > On the other hand, if we could get rid of the build-time device tree
> > altogether, then yes doing PIC provides some benefits. It would allow us
> > to have single Xen binary working on multiple Cortex-R boards. However,
> > I don't think that would be important from a user perspective. People
> > will not install Ubuntu on a Cortex-R and apt-get xen.  The target is
> > embedded: users will know from the start the board they will target, so
> > it would not be a problem for them to build Xen for a specific board.
> > ImageBuilder (or something like it) will still be required to generate
> > boot scripts and boot info. In other words, although it would be
> > convenient to produce a generic binary, it is not a must-have feature
> > and I would consider it low-priority compared to others.
> 
> I tend to agree with your opinion. We can get some benefit from PIC,
> but the priority may be low. We have encountered a problem when we're
> trying to use EFI loader to boot xen.efi on v8R. Due to lack of relocation
> capability, the EFI loader could not launch xen.efi on V8R. But Xen EFI
> boot capability is a requirement of Arm EBBR [1]. In order to support Xen
> EFI boot on V8R, may be we still need a partially supported PIC. Only some
> boot code support PIC to make EFI relocation happy. This boot code will
> help Xen to check its loaded address and relocate Xen image to Xen's
> run-time address if need.
> 
> How about we place PIC support to TODO list for further discussion,
> I don't think we can include so many items in day1 : ) 
> 
> [1]https://arm-software.github.io/ebbr/index.html

Sounds good to me :-)

