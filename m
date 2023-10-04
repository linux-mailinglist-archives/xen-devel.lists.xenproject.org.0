Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B937B8E94
	for <lists+xen-devel@lfdr.de>; Wed,  4 Oct 2023 23:15:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612755.952826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo9CM-0008IN-DW; Wed, 04 Oct 2023 21:14:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612755.952826; Wed, 04 Oct 2023 21:14:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo9CM-0008G4-Af; Wed, 04 Oct 2023 21:14:26 +0000
Received: by outflank-mailman (input) for mailman id 612755;
 Wed, 04 Oct 2023 21:14:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9PTE=FS=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qo9CL-0008Fy-LU
 for xen-devel@lists.xenproject.org; Wed, 04 Oct 2023 21:14:25 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fba114a7-62fa-11ee-9b0d-b553b5be7939;
 Wed, 04 Oct 2023 23:14:21 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 394LDk75001493
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 4 Oct 2023 17:13:52 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.17.1/8.15.2/Submit) id 394LDj3m001492;
 Wed, 4 Oct 2023 14:13:45 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: fba114a7-62fa-11ee-9b0d-b553b5be7939
Date: Wed, 4 Oct 2023 14:13:45 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Julien Grall <julien@xen.org>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        xen-devel@lists.xenproject.org,
        Stefano Stabellini <sstabellini@kernel.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: Issue with shared information page on Xen/ARM 4.17
Message-ID: <ZR3VidifMWdjDQcv@mattapan.m5p.com>
References: <ZRvQNKyYpLDVTs0i@MacBookPdeRoger>
 <ZRxpC7ukhiYvzz5m@mattapan.m5p.com>
 <ZR0erl_OSkNgIQjx@MacBookPdeRoger>
 <c0b67401-dfe5-475f-8640-b66ac32a80fb@xen.org>
 <ZR1gM19i6-vBaXh7@MacBookPdeRoger>
 <b00500ae-76b1-441c-8154-bcdd897734dc@xen.org>
 <ZR1rBP_49Y2V8VF6@MacBookPdeRoger>
 <fe94dcd2-4429-48df-8ebd-59563d43796a@xen.org>
 <ZR18dlMAbCwEOeH4@MacBookPdeRoger>
 <f8242725-7ee0-4fca-a608-d234f8f3b564@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f8242725-7ee0-4fca-a608-d234f8f3b564@xen.org>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-14) on mattapan.m5p.com

Heavily trimming earlier messages.  Also doing one response to cover
several items.  Hopefully I'm not missing something which needs a
response.


On Wed, Oct 04, 2023 at 03:39:16PM +0200, Roger Pau Monné wrote:
> On Wed, Oct 04, 2023 at 02:03:43PM +0100, Julien Grall wrote:
> > 
> > On 04/10/2023 13:53, Roger Pau Monné wrote:
> > > 
> > > When using UEFI there's RAM that will always be in-use by the
> > > firmware, as runtime services cannot be shut down, and hence the
> > > firmware must already have a way to remove/reserve such region(s) on
> > > the memory map.
> > 
> > Can either you or Elliott confirm if EDK2 reserve the region?
> 
> I will defer to Elliott to check for arm.  I would be quite surprised
> if it doesn't on x86, or else we would get a myriad of bug reports
> about guests randomly crashing when using edk2.

When I had originally looked I thought there was no problem as
`OvmfPkg/XenPlatformPei/Xen.c`:
CalibrateLapicTimer()
	MapSharedInfoPage(SharedInfo)
	...
	UnmapXenPage(SharedInfo)

Later using `find * -type f -print0 | xargs -0 grep -eXENMAPSPACE_shared_info`
`OvmfPkg/XenBusDxe/XenBusDxe.c`:
	XenGetSharedInfoPage()
  // using reserved page because the page is not released when Linux is
  // starting because of the add_to_physmap. QEMU might try to access the
  // page, and fail because it have no right to do so (segv).

Looks like this second case leaks the shared information page.
Originally I thought there was no problem as I'd only found the first
instance.  Appears this second instance is the problem.


> > Also, it is not really argument, but this is not the only broken part in
> > EDK2 for Xen Arm guests. The other one I know is EDS makes assumption how
> > some Device-Tree nodes and this will break on newer Xen.
> > 
> > So overall, it feels to me that EDK2 is not entirely ready to be used in
> > production for Xen on Arm guests.
> 
> I really have no insight on this.  What are the supported way of booting
> guests on Arm?  (SUPPORT.md doesn't seem to list any firmware for Arm
> guests AFAICT).

I don't know about whether their support status, but I'm aware of two
viable ways to boot domains on ARM.  First, PyGRUB does work.  This is a
rather poor way to boot, but I do admit it is functional for Linux.
Second, Tianocore/EDK2.  This is very functional, but seems the above
broke recently.

I hope PvGRUB for ARM becomes available soon, but right now it isn't
available.


On Wed, Oct 04, 2023 at 06:47:41PM +0100, Julien Grall wrote:
> 
> On 04/10/2023 15:53, Roger Pau Monné wrote:
> > On Wed, Oct 04, 2023 at 03:06:14PM +0100, Julien Grall wrote:
> >>
> >> This is not very different here. For Arm we decided to not follow a behavior
> >> that I consider incorrect and potentially more harmful than trying to
> >> support bootloader not removing the shared page.
> > 
> > I think this is not very friendly to users, specially if edk2 wasn't
> > checked.
> 
> This was forgotten because it is not yet common to use EDK2 on Xen on 
> Arm (the proof is it took one year to find the obvious bug). I agree 
> this is not user friendly, but it is impossible to check all the single 
> projects. I will usually only look at the one that I know are used on 
> Arm and/or someone remind me on the ML.

By traditional standards, 1 year is quite fast.  Figure 3-6 months for
distributions/vendors to pick up the latest, then another 3-6 months
while people are experimenting.

This may point to Xen/ARM not being heavily deployed.  Could also be most
uses are doing direct kernel boot, or using PyGRUB.

Since it is the only bootloader for non-Linux and only bootloader which
doesn't requite execution in domain 0, Tianocore/EDK2 seems worth
monitoring.


> > I understand the situation is different on Arm vs x86, so if
> > edk2 is not supported on arm I guess it doesn't matter much whether
> > it's broken.  It would be a much worse issue on x86 where edk2 is
> > supported.
> 
> AFAIK, we have CI for x86 on EDK2 but we don't on Arm.

What is the current status of this?  I'm unsure whether it was an extra
patch done by Debian, but "edk2-stable202211"/fff6d81270 doesn't work
with Xen/Qemu.

I've also never observed 'kernel = "OVMF.fd"' generating any activity
with a PVH domain on x86.  Good news is Xen/x86 now accepts "OVMF.fd" as
a valid kernel, so progress has been made.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



