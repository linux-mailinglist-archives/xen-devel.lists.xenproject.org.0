Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA589C54935
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 22:14:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160491.1488612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJI9z-0002dQ-AO; Wed, 12 Nov 2025 21:13:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160491.1488612; Wed, 12 Nov 2025 21:13:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJI9z-0002bM-7r; Wed, 12 Nov 2025 21:13:47 +0000
Received: by outflank-mailman (input) for mailman id 1160491;
 Wed, 12 Nov 2025 21:13:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Wz/o=5U=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1vJI9x-0002bG-EY
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 21:13:45 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76c637d7-c00c-11f0-9d18-b5c5bf9af7f9;
 Wed, 12 Nov 2025 22:13:43 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:8ac4:0:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 5ACLDYAA025674
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
 for <xen-devel@lists.xenproject.org>; Wed, 12 Nov 2025 16:13:40 -0500 (EST)
 (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 5ACLDYTn025673
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 13:13:34 -0800 (PST)
 (envelope-from ehem)
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
X-Inumbo-ID: 76c637d7-c00c-11f0-9d18-b5c5bf9af7f9
Date: Wed, 12 Nov 2025 13:13:34 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Subject: Xen DomU Bootloader Experiences
Message-ID: <aRT4fiuF8soWI6tc@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on mattapan.m5p.com

A few times there have been mentions of a need to choose between boot
methods for DomUs.  There is a need to decide on ones to recommend and
put effort into supportting.  I may not have tried that many nor done
particularly great amounts of experimentation, but I do have some
experience with multiple User Domain bootloaders.

PyGRUB
Xen's bootloader.  PyGRUB is quite functional within its limits.  In
particular it simulates the domain's environment in Domain 0.  This means
the security exposure is problematic.  Another big concern is that it
only does GRUB v1 syntax.  For a long while Debian had a package for
generating those files on a modern system, but that package was dropped.

Yet PyGRUB does avoid needing to use external tools to retrieve the
kernel.  If the kernel is updated inside the domain, this does get the
new kernel.  Further being architecture-independent this works on x86,
ARM*, RISC-V and PowerPC.

As it is the only GRUB-flavor loader available on ARM*, that is the only
place where I've used PyGRUB.


PvGRUB
I'm sure nearly everyone knows about PvGRUB.  By being a proper port of
GRUB to run directly on Xen, it overcomes PyGRUB's disadvantages.  The
one disadvantage is needing to get patches into an external project for
changes in Xen.

Two changes to Xen urgently need propogation to PvGRUB.  I'm unsure
whether PvGRUB unmaps its mapping of vcpu_info data.  The second is
needing to work on ARM*, RISC-V and PowerPC.  The latter is the one and
only way in which PvGRUB is inferior to PyGRUB.

As PvGRUB is only available for x86, that is the only place I've used
PvGRUB.


EDK2/Tianocore
Quite well-known for being the basis of most x86 firmwares, plus being
part of a typical Qemu setup.  Not nearly as well known for being a Xen
DomU bootloader.

When it was working you would build their ArmVirtXen.dsc file and get
XEN_EFI.fd as output.  You would then use XEN_EFI.fd for the domain's
kernel.  If you looked at the console you saw something which looked and
acted pretty similar to a UEFI firmware on x86 machines.  This was
extremely functional for OSes which didn't particularly like GRUB.
Notably I've read of it being able to load a Redmond OS and it was quite
functional for booting an ARM64 port of FreeBSD.

Sometime after November 16th, 2022 or commit fff6d81270.  The built
images stopped functioning.  This is actually rather concerning since it
may also effects firmwares built for x86 HVM domains.  I don't presently
know whether there are multiple bugs, or a single one effecting all Xen
builds.

There is also an urgent need to get EDK2/Tianocore updated to match
Xen/ARM's disallowing mapping the shared information page multiple times.
As I did not wish to become deeply involved with EDK2/Tianocore I sent a
patch to xen-devel close to 1.5 years ago.  Lack of action suggests there
is an urgent need for a liason.



Recommendations:
PyGRUB is functional within its limits.  Problems are GRUBv1 syntax and
running within Domain 0.  Given this I feel the Xen Project should be
heading towards deprecating PyGRUB.  Since PvGRUB works for x86 now, I
would default to neither building nor installing PyGRUB on x86.  For
other architectures PyGRUB is still useful.

The Xen Project should formally ask the GRUB Project to port PvGRUB to
ARM, RISC-V and PowerPC.  The need for PvGRUB on ARM seems rather urgent.
Without a proper bootloader VMs aren't too useful.


The Xen Project needs people to work with EDK2/Tianocore.  The oldest
report I've seen of the EDK2/Tianocore issue dates to mid-2023.  Now two
years later the bug is still present.

The ability to configure XEN_EFI.fd as a domain kernel is a feature
highly worthy of being ported to x86.  For OSes which don't particularly
like GRUB, but do have PV drivers this is an ideal boot method.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



