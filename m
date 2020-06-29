Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AF120CD67
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2020 10:58:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jppcB-0007lG-D8; Mon, 29 Jun 2020 08:58:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wPAo=AK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jppcA-0007lB-1G
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2020 08:58:10 +0000
X-Inumbo-ID: a6f57804-b9e6-11ea-853f-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a6f57804-b9e6-11ea-853f-12813bfff9fa;
 Mon, 29 Jun 2020 08:58:08 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 3DotGuMn/L7lm8Q1knDxCNoI48VWkEGWZcfryKJjpGWnUTCxIbLWKGK+WAnlmsiZCL7xXE6QwF
 xBAfYX1ZgRy1LrF/uvKYfQPtodcKw0PagJkmg2W/ZxDkAXpFnhW5HUeVJ4zGXq45Q5X5PsPWbP
 vTSyrGj9VQQ9DD4hTgtv54zUN+UYZ7J9TrF6XFdrZT1bPHe4Cmvilw5l2qIVxvj5h+Tdy6Hn1v
 8qoR+fCD0NAQoBaiRUKeS73t7bu4/hcp5zW2TMf2xpou5gwbWZwnW7c+tMbrwVitSsDb//tATA
 Y70=
X-SBRS: 2.7
X-MesageID: 21497432
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,294,1589256000"; d="scan'208";a="21497432"
Date: Mon, 29 Jun 2020 10:57:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <joshua_peter@web.de>
Subject: Re: Questions about PVH memory layout
Message-ID: <20200629085758.GE735@Air-de-Roger>
References: <trinity-b65f5be3-8ffe-4ce5-a1e9-88e512959fc5-1593327494913@3c-app-webde-bap42>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <trinity-b65f5be3-8ffe-4ce5-a1e9-88e512959fc5-1593327494913@3c-app-webde-bap42>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sun, Jun 28, 2020 at 08:58:14AM +0200, joshua_peter@web.de wrote:
> Hello everyone,
> 
> I hope this is the right forum for these kinds of questions (the website
> states no "technical support queries"; I'm not sure if this qualifies).
> If not, sorry for the disturbance; just simply direct me elsewhere then.
> 
> Anyway, I'm currently trying to get into how Xen works in detail, so
> for one I've been reading a lot of code, but also I dumped the P2M table
> of my PVH guest to get a feel for how things are layed out in memory. I
> mean there is the usual stuff, such as lots of RAM, and the APIC is
> mapped at 0xFEE00000 and the APCI tables at 0xFC000000 onwards. But two
> things stuck out to me, which for the life of me I couldn't figure out
> from just reading the code. The first one is, there are a few pages at
> the end of the 32bit address space (from 0xFEFF8000 to 0xFEFFF000),
> which according to the E820 is declared simply as "reserved".

Those are the HVM special pages, which are used for various Xen
specific things, like the shared memory ring for the PV console.
They are setup in tools/libxc/xc_dom_x86.c (see SPECIALPAGE_*).

> The other
> thing is, the first 512 pages at the beginning of the address space are
> mapped linearly, which usually leads to them being mapped as a single
> 2MB pages. But there is this one page at 0x00001000 that sticks out
> completely. By that I mean (to make things more concrete), in my PVH
> guest the page at 0x00000000 maps to 0x13C200000, 0x00002000 maps to
> 0x13C202000, 0x00003000 maps to 0x13C203000, etc. But 0x00001000 maps
> to 0xB8DBD000, which seems very odd to me (at least from simply looking
> at the addresses).

Are you booting some OS on the guest before dumping the memory map?
Keep in mind guest have the ability to modify the physmap, either by
mapping Xen shared areas (like the shared info page) or just by using
ballooning in order to poke holes into it (which can be populated
later). It's either that or some kind of bug/missoptimization in
meminit_hvm (also part of tools/libxc/xc_dom_x86.c).

Can you check if this 'weird' mapping at 0x1000 is also present if you
boot the guest with 'xl create -p foo.cfg'? (that will prevent the
guests from running, so that you can get the memory map before the
guest has modified it in any way).

> My initial guess was that this is some bootloader
> related stuff, but Google didn't show up any info related to that
> memory area, and most of the x86/PC boot stuff seems to happen below
> the 0x1000 mark.

If you are booting with pygrub there's no bootloader at all, so
whatever is happening is either done by the toolstack or the OS you are
loading.

Roger.

