Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1CE64A987
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 22:29:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459934.717721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4qMV-0005s9-PA; Mon, 12 Dec 2022 21:29:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459934.717721; Mon, 12 Dec 2022 21:29:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4qMV-0005pX-KY; Mon, 12 Dec 2022 21:29:23 +0000
Received: by outflank-mailman (input) for mailman id 459934;
 Mon, 12 Dec 2022 21:29:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5EvB=4K=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p4qMU-0005pR-0B
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 21:29:22 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 093078d3-7a64-11ed-91b6-6bf2151ebd3b;
 Mon, 12 Dec 2022 22:29:19 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 28A576122B;
 Mon, 12 Dec 2022 21:29:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABBD5C433EF;
 Mon, 12 Dec 2022 21:29:17 +0000 (UTC)
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
X-Inumbo-ID: 093078d3-7a64-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670880558;
	bh=HRYv+GiYQMoDJwXuYzNqYsfpjN/GqOh/byZZYwnP0xw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=APnhyPG7Zb3Ry85mmyD/Wkxaz5fZiszPqzum3KEESrWpQImERfUAOyTgKvfGLVCwq
	 FjL/pOsHYUOZYaPWBu+Fpwiwrrxw2HxuHUc9ooTvHAhoRqIS8m9MxNkg9GyyiAZd6J
	 GCMn0x/2/ab9msZlb89ACTiY9+WH+2amgiGfCRJ/ALEW6YX68HO7iIwFM7cbSipty1
	 X4DPRQRYGSRkn48k/TEIaHbGhIIGch+k0VzfXeoMmDWn/OMRTw1NImdw9fSAWZvu4T
	 7ib/v3dVRI5XiBFgXZfm0hO9SyIu90Si77F2u40vCU0NhCkfMD8QmLSFpKvnb+5RGv
	 bO0HzfKt/vPLQ==
Date: Mon, 12 Dec 2022 13:29:16 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Henry Wang <Henry.Wang@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 1/3] xen/arm: Add memory overlap check for
 bootinfo.reserved_mem
In-Reply-To: <AS8PR08MB799135DFF656809F03039BE9921F9@AS8PR08MB7991.eurprd08.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2212121327010.3075842@ubuntu-linux-20-04-desktop>
References: <20221205025753.2178965-1-Henry.Wang@arm.com> <20221205025753.2178965-2-Henry.Wang@arm.com> <alpine.DEB.2.22.394.2212061716170.4039@ubuntu-linux-20-04-desktop> <8e635354-fdf4-a37f-0dba-c4b29063e152@xen.org> <alpine.DEB.2.22.394.2212071424060.4039@ubuntu-linux-20-04-desktop>
 <556d4b3f-3983-a336-f299-ce6b2b4a6e72@xen.org> <alpine.DEB.2.22.394.2212071534260.2730675@ubuntu-linux-20-04-desktop> <AS8PR08MB799135DFF656809F03039BE9921F9@AS8PR08MB7991.eurprd08.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 10 Dec 2022, Henry Wang wrote:
> Hi both,
> 
> I was lurking around to see how the discussion would go. Thanks for the
> discussions/inputs in this thread :) 
> 
> > -----Original Message-----
> > From: Stefano Stabellini <sstabellini@kernel.org>
> > Subject: Re: [PATCH 1/3] xen/arm: Add memory overlap check for
> > bootinfo.reserved_mem
> > > > It cannot be a single static inline function because the bootinfo
> > > > arguments are of three different types, it just happens that all three
> > > > have a "start" and "size" struct member so it works great with a macro,
> > > > but doesn't for a function.
> > >
> > > It is not clear to me what are the three types you are referring to. Looking
> > > at the definition of bootinfo is:
> > >
> > > struct bootinfo {
> > >     struct meminfo mem;
> > >     /* The reserved regions are only used when booting using Device-Tree */
> > >     struct meminfo reserved_mem;
> > >     struct bootmodules modules;
> > >     struct bootcmdlines cmdlines;
> > > #ifdef CONFIG_ACPI
> > >     struct meminfo acpi;
> > > #endif
> > >     bool static_heap;
> > > };
> > >
> > > cmdlines is something uninteresting here. So we have two types:
> > >   - bootmodules for modules
> > >   - meminfo used by reserved_mem, mem and acpi
> 
> Exactly, we need to check the given input physical address range is
> not overlapping with any of the banks in bootmodules and meminfo used by
> reserved_mem & acpi.
> 
> > >
> > > Looking in details the code, now I understand why you suggested the
> > macro.
> > > This is far better than the checking what the array type (not very scalable).
> > 
> > Thank you :-)
> 
> +1, I also thought this would be quite painful to extend in the future (once we
> add a new member in bootinfo, for example what Penny did in [1], we need to
> extend the overlap check as well), but I didn't think of using macro so thank you
> Stefano :)
> 
> > 
> > 
> > > Personally, I think trying to share the code between the two types is a bit
> > > odd. The logic is the same today, but I envision to merge reserved_mem,
> > mem
> > > and acpi in a single array (it would look like the E820) as this would make
> > > easier to find the caching attributes per regions when mapping the RAM. So
> > > sharing the code would not be possible.
> > >
> > > That said, if you really want to share the code between the two types. Then
> > I
> > > would prefer one of the following option:
> > >    1) Provide a callback that is used to fetch the information from the array
> > >    2) Provide a common structure that could be used by the function.
> > >
> > > This would match other generic function like sort & co.
> > 
> > I think option 2) would be the best but I couldn't think of a simple way
> > to do it (without using a union and I thought a union would not make
> > things nicer in this case).
> > 
> > Rather than option 1), I think I would rather have 2 different functions
> > to check struct bootmodules and struct meminfo, or the macro.
> 
> I personally don't have specific taste here. I think the option
> is good one as long as we can (1) share most part of the code (2) make the
> code easy to extend in the future. So as long as you two reach
> a consensus here I will change to the agreed method in v2.

I think Julien and I already agree on having 2 separate functions to
check for struct bootmodules and struct meminfo. Julien, I take you
prefer the two separate functions to a MACRO, right?

