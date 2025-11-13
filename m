Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDBFC5A4E6
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 23:24:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1162163.1489916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJfiv-0002l6-Oz; Thu, 13 Nov 2025 22:23:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1162163.1489916; Thu, 13 Nov 2025 22:23:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJfiv-0002im-ME; Thu, 13 Nov 2025 22:23:25 +0000
Received: by outflank-mailman (input) for mailman id 1162163;
 Thu, 13 Nov 2025 22:23:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LsvY=5V=bounce.vates.tech=bounce-md_30504962.69165a58.v1-732267622a2b4c3181de5d340c471104@srs-se1.protection.inumbo.net>)
 id 1vJfiu-0002ig-RM
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 22:23:25 +0000
Received: from mail128-17.atl41.mandrillapp.com
 (mail128-17.atl41.mandrillapp.com [198.2.128.17])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5cf516ca-c0df-11f0-9d18-b5c5bf9af7f9;
 Thu, 13 Nov 2025 23:23:22 +0100 (CET)
Received: from pmta08.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail128-17.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4d6vtJ3S1czCf9MR7
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 22:23:20 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 732267622a2b4c3181de5d340c471104; Thu, 13 Nov 2025 22:23:20 +0000
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
X-Inumbo-ID: 5cf516ca-c0df-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1763072600; x=1763342600;
	bh=5DXLgoRdyJwQuI86VBFNKjX8SjoqaEy8lyUGH6YcZq8=;
	h=From:Subject:Message-Id:To:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=kGqtB27+k0+4RbSttj4CS6UW3ocKacabRUkSUPzdpWPIwWGO3PDF4gLlEV3YSWSbg
	 uf2Pu2U0rTzesOFrAmjna7LqBb3AchrgFFwkTLdf3m6bvtT/rdrHzUmUZxro3Hmy73
	 1z+/+QSsNn2ra5R3Md6gImUafFg22kkOlosIVxgc3FOE7ZMQ8CRaiMT1WJGQnfWxxW
	 M+jcekNpWvK8/lG31n61aJqMhTkX6qDcaVif1WhHq3+wuycJbQoWfFAuAqW4k1FYaF
	 Q0zBSBHtbRZuH8NAeP0u/O5ZlhePhQYs2iQT7IFiC+5w31o1Etukbn3563pJHzmyEv
	 K3Q0t8W6idzSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1763072600; x=1763333100; i=teddy.astie@vates.tech;
	bh=5DXLgoRdyJwQuI86VBFNKjX8SjoqaEy8lyUGH6YcZq8=;
	h=From:Subject:Message-Id:To:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=npF/PsIqFf+/Iq1aVsnuFOXRUg/YXEgg3SKPP1bZtIe+IvayV39yFGtewgJ6XyXIo
	 3GvLokiz/JcOmOseSw8Wpz4g50Iv8mMRLcogDnHTvM0ZDpT4wTG5MRoclg4F4yuKvW
	 QjrMsSBRWDuhPrtb66DclhONwpuPKrdFUPavXQ+KUberX0AVufu8R2qX1+C1CuEksv
	 fcRRSfo3Kw00h9VEdSCyNJ8aq4JdxEXWOjWGBzC9gqZJc40setOCVE8L0GNczL850g
	 Pu938HONfXu2gPpsQava7HYFtFaMyL9XiQ2GJ/QcpgO+Eo+Lxg6srI21dmA9sHtOqL
	 Hzk+Lxg0Iqclg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20Xen=20DomU=20Bootloader=20Experiences?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1763072599810
Message-Id: <9b4a8a28-6b0b-41ac-b6de-88de8e6b4588@vates.tech>
To: "Elliott Mitchell" <ehem+xen@m5p.com>, xen-devel@lists.xenproject.org
References: <aRT4fiuF8soWI6tc@mattapan.m5p.com>
In-Reply-To: <aRT4fiuF8soWI6tc@mattapan.m5p.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.732267622a2b4c3181de5d340c471104?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251113:md
Date: Thu, 13 Nov 2025 22:23:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 12/11/2025 =C3=A0 22:16, Elliott Mitchell a =C3=A9crit=C2=A0:
> A few times there have been mentions of a need to choose between boot
> methods for DomUs.  There is a need to decide on ones to recommend and
> put effort into supportting.  I may not have tried that many nor done
> particularly great amounts of experimentation, but I do have some
> experience with multiple User Domain bootloaders.
> 
> PyGRUB
> Xen's bootloader.  PyGRUB is quite functional within its limits.  In
> particular it simulates the domain's environment in Domain 0.  This means
> the security exposure is problematic.  Another big concern is that it
> only does GRUB v1 syntax.  For a long while Debian had a package for
> generating those files on a modern system, but that package was dropped.
> 
> Yet PyGRUB does avoid needing to use external tools to retrieve the
> kernel.  If the kernel is updated inside the domain, this does get the
> new kernel.  Further being architecture-independent this works on x86,
> ARM*, RISC-V and PowerPC.
> 
> As it is the only GRUB-flavor loader available on ARM*, that is the only
> place where I've used PyGRUB.
> 

To be fair, I don't really like PyGRUB, it hasn't really worked well for 
me (perhaps I'm trying too modern distros ?). It's still what's being 
used for XAPI, which doesn't make things practical and even sometimes 
brittle.

I'm more tending to the other alternatives.

> 
> PvGRUB
> I'm sure nearly everyone knows about PvGRUB.  By being a proper port of
> GRUB to run directly on Xen, it overcomes PyGRUB's disadvantages.  The
> one disadvantage is needing to get patches into an external project for
> changes in Xen.
> 
> Two changes to Xen urgently need propogation to PvGRUB.  I'm unsure
> whether PvGRUB unmaps its mapping of vcpu_info data.  The second is

I don't think it maps vcpu_info, otherwise, most (all ?) Linux kernels 
will immediately break.

> needing to work on ARM*, RISC-V and PowerPC.  The latter is the one and
> only way in which PvGRUB is inferior to PyGRUB.
> 

Perhaps it could be a good idea; although I'm more tending to EDK2 
instead which works well with it and cover more cases (unless EDK2 stops 
working for some obscure reason). For a more long-term solution, I would 
prefer something different to GRUB but basing on "Boot Loader 
Specification", maybe Edera's Sprout [1] or rust-hypervisor-firmware [2] 
as a PVH firmware.

> As PvGRUB is only available for x86, that is the only place I've used
> PvGRUB.
> 

> 
> EDK2/Tianocore
> Quite well-known for being the basis of most x86 firmwares, plus being
> part of a typical Qemu setup.  Not nearly as well known for being a Xen
> DomU bootloader.
> 
> When it was working you would build their ArmVirtXen.dsc file and get
> XEN_EFI.fd as output.  You would then use XEN_EFI.fd for the domain's
> kernel.  If you looked at the console you saw something which looked and
> acted pretty similar to a UEFI firmware on x86 machines.  This was
> extremely functional for OSes which didn't particularly like GRUB.
> Notably I've read of it being able to load a Redmond OS and it was quite
> functional for booting an ARM64 port of FreeBSD.
> 
> Sometime after November 16th, 2022 or commit fff6d81270.  The built
> images stopped functioning.  This is actually rather concerning since it
> may also effects firmwares built for x86 HVM domains.  I don't presently
> know whether there are multiple bugs, or a single one effecting all Xen
> builds.
> 

Actually, you can use it for x86 like you do for ARM, with PVH (using 
the same binary as for HVM). But it broke at some point, and I'm mostly 
living with a older but working custom built version of it.

We definitely want to sort-out this, as it is going to be a blocker for 
providing better foundations for PVH guests on XAPI/XCP-ng.

> There is also an urgent need to get EDK2/Tianocore updated to match
> Xen/ARM's disallowing mapping the shared information page multiple times.
> As I did not wish to become deeply involved with EDK2/Tianocore I sent a
> patch to xen-devel close to 1.5 years ago.  Lack of action suggests there
> is an urgent need for a liason.
> 
> 
> 
> Recommendations:
> PyGRUB is functional within its limits.  Problems are GRUBv1 syntax and
> running within Domain 0.  Given this I feel the Xen Project should be
> heading towards deprecating PyGRUB.  Since PvGRUB works for x86 now, I
> would default to neither building nor installing PyGRUB on x86.  For
> other architectures PyGRUB is still useful.
> 

+1. At least making it deprecated, and at the same time improving the 
ergonomics of alternatives (i.e PVH+EDK2, legacy grub-pv and/or "PV-GRUB").

> The Xen Project should formally ask the GRUB Project to port PvGRUB to
> ARM, RISC-V and PowerPC.  The need for PvGRUB on ARM seems rather urgent.
> Without a proper bootloader VMs aren't too useful.
> 

EDK2 / U-Boot should be able to fill this niche at least for ARM; not 
sure about RISC-V though, but I guess it is going to be a similar story.

Unsure about PowerPC through.

> 
> The Xen Project needs people to work with EDK2/Tianocore.  The oldest
> report I've seen of the EDK2/Tianocore issue dates to mid-2023.  Now two
> years later the bug is still present.
> 

> The ability to configure XEN_EFI.fd as a domain kernel is a feature
> highly worthy of being ported to x86.  For OSes which don't particularly
> like GRUB, but do have PV drivers this is an ideal boot method.
> 

AFAICT it is already there :)

> 

[1] https://github.com/edera-dev/sprout
[2] https://github.com/cloud-hypervisor/rust-hypervisor-firmware


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



