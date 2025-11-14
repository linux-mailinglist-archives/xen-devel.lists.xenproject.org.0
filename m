Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DFEC5AF66
	for <lists+xen-devel@lfdr.de>; Fri, 14 Nov 2025 02:56:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1162221.1489948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJj1r-0006Rc-7K; Fri, 14 Nov 2025 01:55:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1162221.1489948; Fri, 14 Nov 2025 01:55:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJj1r-0006OV-2w; Fri, 14 Nov 2025 01:55:11 +0000
Received: by outflank-mailman (input) for mailman id 1162221;
 Fri, 14 Nov 2025 01:55:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xgzl=5W=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1vJj1q-0006OP-9L
 for xen-devel@lists.xenproject.org; Fri, 14 Nov 2025 01:55:10 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1d02e6a-c0fc-11f0-980a-7dc792cee155;
 Fri, 14 Nov 2025 02:55:07 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 5AE1sx0H031531
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Thu, 13 Nov 2025 20:55:04 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 5AE1swnN031530;
 Thu, 13 Nov 2025 17:54:58 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: f1d02e6a-c0fc-11f0-980a-7dc792cee155
Date: Thu, 13 Nov 2025 17:54:58 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Teddy Astie <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org
Subject: Re: Xen DomU Bootloader Experiences
Message-ID: <aRaL8gAI7t_PCmxU@mattapan.m5p.com>
References: <aRT4fiuF8soWI6tc@mattapan.m5p.com>
 <9b4a8a28-6b0b-41ac-b6de-88de8e6b4588@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9b4a8a28-6b0b-41ac-b6de-88de8e6b4588@vates.tech>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on mattapan.m5p.com

On Thu, Nov 13, 2025 at 10:23:20PM +0000, Teddy Astie wrote:
> Le 12/11/2025 à 22:16, Elliott Mitchell a écrit :
> > A few times there have been mentions of a need to choose between boot
> > methods for DomUs.  There is a need to decide on ones to recommend and
> > put effort into supportting.  I may not have tried that many nor done
> > particularly great amounts of experimentation, but I do have some
> > experience with multiple User Domain bootloaders.
> > 
> > PyGRUB
> > Xen's bootloader.  PyGRUB is quite functional within its limits.  In
> > particular it simulates the domain's environment in Domain 0.  This means
> > the security exposure is problematic.  Another big concern is that it
> > only does GRUB v1 syntax.  For a long while Debian had a package for
> > generating those files on a modern system, but that package was dropped.
> > 
> > Yet PyGRUB does avoid needing to use external tools to retrieve the
> > kernel.  If the kernel is updated inside the domain, this does get the
> > new kernel.  Further being architecture-independent this works on x86,
> > ARM*, RISC-V and PowerPC.
> > 
> > As it is the only GRUB-flavor loader available on ARM*, that is the only
> > place where I've used PyGRUB.
> > 
> 
> To be fair, I don't really like PyGRUB, it hasn't really worked well for 
> me (perhaps I'm trying too modern distros ?). It's still what's being 
> used for XAPI, which doesn't make things practical and even sometimes 
> brittle.
> 
> I'm more tending to the other alternatives.
> 
> > 
> > PvGRUB
> > I'm sure nearly everyone knows about PvGRUB.  By being a proper port of
> > GRUB to run directly on Xen, it overcomes PyGRUB's disadvantages.  The
> > one disadvantage is needing to get patches into an external project for
> > changes in Xen.
> > 
> > Two changes to Xen urgently need propogation to PvGRUB.  I'm unsure
> > whether PvGRUB unmaps its mapping of vcpu_info data.  The second is
> 
> I don't think it maps vcpu_info, otherwise, most (all ?) Linux kernels 
> will immediately break.

I thought multiply mapping the vcpu_info was deprecated, but still
allowed on x86.  Only on ARM{,64} was it actually disabled.  As such it
might still have a private mapping, but it is possible it never had one
or was cleaned up at some point.

I keep mentioning this as Tianocore/EDK2 does a private mapping, but
fails to remove it when bootloading finishes.  Since support for multiply
mapped vcpu_info was removed, Tianocore/EDK2 got broken by Xen.  This is
still unfixed.

> > needing to work on ARM*, RISC-V and PowerPC.  The latter is the one and
> > only way in which PvGRUB is inferior to PyGRUB.
> 
> Perhaps it could be a good idea; although I'm more tending to EDK2 
> instead which works well with it and cover more cases (unless EDK2 stops 
> working for some obscure reason). For a more long-term solution, I would 
> prefer something different to GRUB but basing on "Boot Loader 
> Specification", maybe Edera's Sprout [1] or rust-hypervisor-firmware [2] 
> as a PVH firmware.

I concur with Tianocore/EDK2 covering more cases.  I do suspect keeping
it functional may be more difficult so I'm slightly wary of it.  Whereas
PvGRUB is lower overhead and faster for *Linux*.


> > EDK2/Tianocore
> > Quite well-known for being the basis of most x86 firmwares, plus being
> > part of a typical Qemu setup.  Not nearly as well known for being a Xen
> > DomU bootloader.
> > 
> > When it was working you would build their ArmVirtXen.dsc file and get
> > XEN_EFI.fd as output.  You would then use XEN_EFI.fd for the domain's
> > kernel.  If you looked at the console you saw something which looked and
> > acted pretty similar to a UEFI firmware on x86 machines.  This was
> > extremely functional for OSes which didn't particularly like GRUB.
> > Notably I've read of it being able to load a Redmond OS and it was quite
> > functional for booting an ARM64 port of FreeBSD.
> > 
> > Sometime after November 16th, 2022 or commit fff6d81270.  The built
> > images stopped functioning.  This is actually rather concerning since it
> > may also effects firmwares built for x86 HVM domains.  I don't presently
> > know whether there are multiple bugs, or a single one effecting all Xen
> > builds.
> 
> Actually, you can use it for x86 like you do for ARM, with PVH (using 
> the same binary as for HVM). But it broke at some point, and I'm mostly 
> living with a older but working custom built version of it.
> 
> We definitely want to sort-out this, as it is going to be a blocker for 
> providing better foundations for PVH guests on XAPI/XCP-ng.

Well, Tianocore/EDK2's Xen support was broken sometime mid-late 2022.
The only working firmware images I have are 5 years old and fail to load
as PVH.  Being used as DomU kernel may have worked on x86 at some point,
but I've never seen it.

Meanwhile Tianocore/EDK2 ARM was broken on *Xen*'s side.  Usually that
would mean the Xen developers are supposed to get updates into
Tianocore/EDK2.


> > Recommendations:
> > PyGRUB is functional within its limits.  Problems are GRUBv1 syntax and
> > running within Domain 0.  Given this I feel the Xen Project should be
> > heading towards deprecating PyGRUB.  Since PvGRUB works for x86 now, I
> > would default to neither building nor installing PyGRUB on x86.  For
> > other architectures PyGRUB is still useful.
> 
> +1. At least making it deprecated, and at the same time improving the 
> ergonomics of alternatives (i.e PVH+EDK2, legacy grub-pv and/or "PV-GRUB").

Trying to used legacy GRUB syntax is hopeless.  Most distribution scripts
will have been updated to be GRUBv2 syntax-only.  As such PV GRUB is
pretty clearly the way to go.


> > The ability to configure XEN_EFI.fd as a domain kernel is a feature
> > highly worthy of being ported to x86.  For OSes which don't particularly
> > like GRUB, but do have PV drivers this is an ideal boot method.
> > 
> 
> AFAICT it is already there :)

I've never seen it working.  It may have worked at one time, but it has
remained broken for rather a long time.

Perhaps time to add CI on Xen's side?


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



