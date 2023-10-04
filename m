Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CA37B982E
	for <lists+xen-devel@lfdr.de>; Thu,  5 Oct 2023 00:38:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612773.952858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoAUs-0006zw-Sp; Wed, 04 Oct 2023 22:37:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612773.952858; Wed, 04 Oct 2023 22:37:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoAUs-0006wc-OE; Wed, 04 Oct 2023 22:37:38 +0000
Received: by outflank-mailman (input) for mailman id 612773;
 Wed, 04 Oct 2023 22:37:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9PTE=FS=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qoAUr-0006wW-SW
 for xen-devel@lists.xenproject.org; Wed, 04 Oct 2023 22:37:37 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d37b5e3-6306-11ee-98d3-6d05b1d4d9a1;
 Thu, 05 Oct 2023 00:37:36 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 394Mb0AT001768
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 4 Oct 2023 18:37:06 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.17.1/8.15.2/Submit) id 394Mb03i001767;
 Wed, 4 Oct 2023 15:37:00 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 9d37b5e3-6306-11ee-98d3-6d05b1d4d9a1
Date: Wed, 4 Oct 2023 15:37:00 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        xen-devel@lists.xenproject.org,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: Issue with shared information page on Xen/ARM 4.17
Message-ID: <ZR3pDL6a+mf7TbNB@mattapan.m5p.com>
References: <ZR0erl_OSkNgIQjx@MacBookPdeRoger>
 <c0b67401-dfe5-475f-8640-b66ac32a80fb@xen.org>
 <ZR1gM19i6-vBaXh7@MacBookPdeRoger>
 <b00500ae-76b1-441c-8154-bcdd897734dc@xen.org>
 <ZR1rBP_49Y2V8VF6@MacBookPdeRoger>
 <fe94dcd2-4429-48df-8ebd-59563d43796a@xen.org>
 <ZR18dlMAbCwEOeH4@MacBookPdeRoger>
 <f8242725-7ee0-4fca-a608-d234f8f3b564@xen.org>
 <ZR3VidifMWdjDQcv@mattapan.m5p.com>
 <alpine.DEB.2.22.394.2310041520200.2348112@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2310041520200.2348112@ubuntu-linux-20-04-desktop>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-14) on mattapan.m5p.com

On Wed, Oct 04, 2023 at 03:21:04PM -0700, Stefano Stabellini wrote:
> On Wed, 4 Oct 2023, Elliott Mitchell wrote:
> > On Wed, Oct 04, 2023 at 03:39:16PM +0200, Roger Pau Monné wrote:
> > > On Wed, Oct 04, 2023 at 02:03:43PM +0100, Julien Grall wrote:
> > > > 
> > > > On 04/10/2023 13:53, Roger Pau Monné wrote:
> > > > > 
> > > > > When using UEFI there's RAM that will always be in-use by the
> > > > > firmware, as runtime services cannot be shut down, and hence the
> > > > > firmware must already have a way to remove/reserve such region(s) on
> > > > > the memory map.
> > > > 
> > > > Can either you or Elliott confirm if EDK2 reserve the region?
> > > 
> > > I will defer to Elliott to check for arm.  I would be quite surprised
> > > if it doesn't on x86, or else we would get a myriad of bug reports
> > > about guests randomly crashing when using edk2.
> > 
> > When I had originally looked I thought there was no problem as
> > `OvmfPkg/XenPlatformPei/Xen.c`:
> > CalibrateLapicTimer()
> > 	MapSharedInfoPage(SharedInfo)
> > 	...
> > 	UnmapXenPage(SharedInfo)
> > 
> > Later using `find * -type f -print0 | xargs -0 grep -eXENMAPSPACE_shared_info`
> > `OvmfPkg/XenBusDxe/XenBusDxe.c`:
> > 	XenGetSharedInfoPage()
> >   // using reserved page because the page is not released when Linux is
> >   // starting because of the add_to_physmap. QEMU might try to access the
> >   // page, and fail because it have no right to do so (segv).
> > 
> > Looks like this second case leaks the shared information page.
> > Originally I thought there was no problem as I'd only found the first
> > instance.  Appears this second instance is the problem.
> 
> I understand this second case is *not* unmapping the SharedInfo page,
> but is it reserving it somehow? For instance marking it as reserved in
> the EFI memory map?

Notice the "//" comment which I carefully grabbed?

  // using reserved page because the page is not released when Linux is
  // starting because of the add_to_physmap. QEMU might try to access the
  // page, and fail because it have no right to do so (segv).

So the page shouldn't be touched by anyone, but it does end up wasted.
Likely ExitBootServices() should clear the mapping.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



