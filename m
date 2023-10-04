Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E1B7B9846
	for <lists+xen-devel@lfdr.de>; Thu,  5 Oct 2023 00:42:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612781.952867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoAZE-0008UE-Hx; Wed, 04 Oct 2023 22:42:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612781.952867; Wed, 04 Oct 2023 22:42:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoAZE-0008RA-Eb; Wed, 04 Oct 2023 22:42:08 +0000
Received: by outflank-mailman (input) for mailman id 612781;
 Wed, 04 Oct 2023 22:42:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XhzZ=FS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qoAZC-0008R4-Gv
 for xen-devel@lists.xenproject.org; Wed, 04 Oct 2023 22:42:06 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d5e069c-6307-11ee-98d3-6d05b1d4d9a1;
 Thu, 05 Oct 2023 00:42:05 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B1B11615F3;
 Wed,  4 Oct 2023 22:42:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35A5AC433C8;
 Wed,  4 Oct 2023 22:42:02 +0000 (UTC)
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
X-Inumbo-ID: 3d5e069c-6307-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696459323;
	bh=WPwsqjsCRb7T5sdzJUcPcrX3eoDkrhciygzO4S0B7XY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=I2gFvLkxtFhWQjWTN64e7kab5jdbdUDT8X39rT1KVESEhOCZXNEz2JGj/TkuuwnxE
	 sSTddgBAbygM7dqbJtbzBM31xwLsPJubc1ude10x7vwIMjxA/55KIMW61z4WQez3SV
	 DBKoa+Ine9/HHG89QiMg1v9K0apgUc354R6iDHvIYW8JdY9wNzJODtBjhjoD6fbZn/
	 BBLLPC3K/yDtfSzeCrkJE0YqAXTzvYbFvSvbi9BYruYj5AhMFIpe902V08CkdFNn1i
	 ibBx6hissZYe5/WH4Z5B/aoSvY4T51Z57saX3otWV14PaTY8Ne+353WR82qA5N+oVf
	 WhDf5cEGtxVRQ==
Date: Wed, 4 Oct 2023 15:42:00 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Elliott Mitchell <ehem+xen@m5p.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    xen-devel@lists.xenproject.org, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: Issue with shared information page on Xen/ARM 4.17
In-Reply-To: <ZR3pDL6a+mf7TbNB@mattapan.m5p.com>
Message-ID: <alpine.DEB.2.22.394.2310041540350.2348112@ubuntu-linux-20-04-desktop>
References: <ZR0erl_OSkNgIQjx@MacBookPdeRoger> <c0b67401-dfe5-475f-8640-b66ac32a80fb@xen.org> <ZR1gM19i6-vBaXh7@MacBookPdeRoger> <b00500ae-76b1-441c-8154-bcdd897734dc@xen.org> <ZR1rBP_49Y2V8VF6@MacBookPdeRoger> <fe94dcd2-4429-48df-8ebd-59563d43796a@xen.org>
 <ZR18dlMAbCwEOeH4@MacBookPdeRoger> <f8242725-7ee0-4fca-a608-d234f8f3b564@xen.org> <ZR3VidifMWdjDQcv@mattapan.m5p.com> <alpine.DEB.2.22.394.2310041520200.2348112@ubuntu-linux-20-04-desktop> <ZR3pDL6a+mf7TbNB@mattapan.m5p.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1195866088-1696459323=:2348112"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1195866088-1696459323=:2348112
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 4 Oct 2023, Elliott Mitchell wrote:
> On Wed, Oct 04, 2023 at 03:21:04PM -0700, Stefano Stabellini wrote:
> > On Wed, 4 Oct 2023, Elliott Mitchell wrote:
> > > On Wed, Oct 04, 2023 at 03:39:16PM +0200, Roger Pau Monné wrote:
> > > > On Wed, Oct 04, 2023 at 02:03:43PM +0100, Julien Grall wrote:
> > > > > 
> > > > > On 04/10/2023 13:53, Roger Pau Monné wrote:
> > > > > > 
> > > > > > When using UEFI there's RAM that will always be in-use by the
> > > > > > firmware, as runtime services cannot be shut down, and hence the
> > > > > > firmware must already have a way to remove/reserve such region(s) on
> > > > > > the memory map.
> > > > > 
> > > > > Can either you or Elliott confirm if EDK2 reserve the region?
> > > > 
> > > > I will defer to Elliott to check for arm.  I would be quite surprised
> > > > if it doesn't on x86, or else we would get a myriad of bug reports
> > > > about guests randomly crashing when using edk2.
> > > 
> > > When I had originally looked I thought there was no problem as
> > > `OvmfPkg/XenPlatformPei/Xen.c`:
> > > CalibrateLapicTimer()
> > > 	MapSharedInfoPage(SharedInfo)
> > > 	...
> > > 	UnmapXenPage(SharedInfo)
> > > 
> > > Later using `find * -type f -print0 | xargs -0 grep -eXENMAPSPACE_shared_info`
> > > `OvmfPkg/XenBusDxe/XenBusDxe.c`:
> > > 	XenGetSharedInfoPage()
> > >   // using reserved page because the page is not released when Linux is
> > >   // starting because of the add_to_physmap. QEMU might try to access the
> > >   // page, and fail because it have no right to do so (segv).
> > > 
> > > Looks like this second case leaks the shared information page.
> > > Originally I thought there was no problem as I'd only found the first
> > > instance.  Appears this second instance is the problem.
> > 
> > I understand this second case is *not* unmapping the SharedInfo page,
> > but is it reserving it somehow? For instance marking it as reserved in
> > the EFI memory map?
> 
> Notice the "//" comment which I carefully grabbed?
> 
>   // using reserved page because the page is not released when Linux is
>   // starting because of the add_to_physmap. QEMU might try to access the
>   // page, and fail because it have no right to do so (segv).
> 
> So the page shouldn't be touched by anyone, but it does end up wasted.
> Likely ExitBootServices() should clear the mapping.

Sorry to be pedantic but I am really not familiar with EDK2. Does
"reserved page" in this context mean a memory page from a reserved
region marked as reserved in the EFI memory map?
--8323329-1195866088-1696459323=:2348112--

