Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF80B4923D5
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 11:34:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258433.445040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9loQ-0006jD-HR; Tue, 18 Jan 2022 10:34:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258433.445040; Tue, 18 Jan 2022 10:34:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9loQ-0006hN-EE; Tue, 18 Jan 2022 10:34:02 +0000
Received: by outflank-mailman (input) for mailman id 258433;
 Tue, 18 Jan 2022 10:34:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4BW1=SC=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1n9loO-0006hF-Ma
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 10:34:00 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24a47ce6-784a-11ec-a115-11989b9578b4;
 Tue, 18 Jan 2022 11:33:59 +0100 (CET)
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
X-Inumbo-ID: 24a47ce6-784a-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642502039;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GSRT+ChDKqUOQlXWWTUMyxQ2zCQkmUxGyD6pgljReUM=;
  b=KBz8OTp75szZZLUVAqrGQdQbkxFurcQ69Hsv3T4ZLB6E8B8yUuyujY7J
   PcjtIrgjekKJJoqRrQF8wNcaD1teOxJRpT6YGafsHbOgRSfsKPpgCYILO
   Ln86ONHRs01CZ8KBqOeYa8nbfuCdUP3mZOACqPubxiOGfCSOpOgdWcW6r
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: ravQVB5qqZzQnM2bqsDL55nxSRm9POqT47PKZxPhGcBolCR7LcBM8yOWCeDd0clF1+QaDXr30U
 tMhLz03WPnBGjuKhsYXtQwYkWU7cLFOc0IlfF9trx3kIVNKSDBxudQYBR2NGnAPgmzDBW+ZrTX
 pHEWEreoP8LGYF+VaY1VdWUIyBIiO7EQZkzh9GF9LTcUqUTHc8iZuU2usPeApT3X+2FB2rGpQb
 pFpp5lA0TyJ1TuKNR2Ej8dPXCY4VmAR0ke7vqmlz8LPBqy4O0kGx36Qhk0zM63HjLsQwHssAST
 n6jXZLSgbVWog4I1QGjq6I4t
X-SBRS: 5.2
X-MesageID: 62124524
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23: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
IronPort-HdrOrdr: A9a23:e9VMhaAy5eaPIJflHems55DYdb4zR+YMi2TC1yhKJyC9Vvbo8/
 xG/c5rsCMc5wx9ZJhNo7y90ey7MBThHP1OkOss1NWZPDUO0VHAROoJ0WKh+UyCJ8SXzJ866U
 4KSclD4bPLYmRHsQ==
X-IronPort-AV: E=Sophos;i="5.88,297,1635220800"; 
   d="scan'208";a="62124524"
Date: Tue, 18 Jan 2022 10:33:51 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Alexandru Isaila <aisaila@bitdefender.com>, Wei Liu <wl@xen.org>, "Jun
 Nakajima" <jun.nakajima@intel.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?=
	<roger.pau@citrix.com>, Alistair Francis <alistair.francis@wdc.com>, "Daniel
 De Graaf" <dgdegra@tycho.nsa.gov>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Kevin Tian <kevin.tian@intel.com>, Connor Davis
	<connojdavis@gmail.com>, Doug Goldstein <cardoe@cardoe.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, "Bob
 Eshleman" <bobbyeshleman@gmail.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, "Paul
 Durrant" <paul@xen.org>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Petre Pircalabu
	<ppircalabu@bitdefender.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, George Dunlap <george.dunlap@citrix.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v8 00/47] xen: Build system improvements, now with
 out-of-tree build!
Message-ID: <YeaXj5FkcHltEPKo@perard>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <f8cde73b-0e5f-1b3d-c51a-9fef6092dabf@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f8cde73b-0e5f-1b3d-c51a-9fef6092dabf@suse.com>

On Tue, Dec 21, 2021 at 04:26:48PM +0100, Jan Beulich wrote:
> On 25.11.2021 14:39, Anthony PERARD wrote:
> >     Also this v8 present a work-in-progress of the ability to do out-of-tree
> >     build without setting VPATH. This is presented as an alternative to force
> >     use of out-of-tree build. As the last patch show, it allows to build the
> >     xen-shim without the linkfarm and we don't need to make any other changes
> >     to any thing that build xen (osstest, distribution packages, xen.git, ...,
> >     and developers finger macros). The patches are only there as WIP / RFC as
> >     they were some concern about the usefulness and extra changes needed.
> >     We can decide whether those changes are good or if this is too much and we
> >     should force out-of-tree build for the hypervisor.
> 
> I'm afraid I'm of two minds here. I don't think we want to force people to
> do out-of-tree builds, but I also dislike the idea of mixing in-tree and
> out-of-tree builds. Yet reading the above I understand that the shim build
> would conflict with an in-tree build because certain files would be picked
> (the shim build being an out-of-tree one) from the (dirtied) source tree,
> rather than the shim's build tree. Perhaps the extra path prefixes that I
> commented upon in an individual patch are then indeed the least bad route
> to take.

To me, the problem is with a few build artefact and configuration: the
".config" file that osstest write and edit, and the final location of
the "xen*" artefacts. Having something or someone wanting to edit
".config" breaks out-of-tree build. Otherwise, we could have forced
out-of-tree build like libvirt or qemu are doing.

> There's one compromise which comes to mind, but which may also not be
> liked: We could simply fail out-of-tree builds when the source tree is
> dirty. Then people wanting the shim built would need to use out-of-tree

This isn't a compromise, it is already implemented in "build: adding
out-of-tree support to the xen build". I revert this in patch "RFC,
no-VPATH: remove check for clean source tree for out-of-tree".

> builds also for the "main" hypervisor, but people suppressing the shim
> build anyway (or doing it separately, e.g. using a non-default .config)
> could continue to do in-tree builds. The one puzzle piece I'm lacking so
> far (perhaps simply because of having overlooked where it is) is how, for
> a full-build-of-everything, one would control where the xen/ part of the
> build would go _outside_ of the source (sub-)tree.

I guess that's not really an issue. It would be easy to run `make -C
xen-build -f ../xen/Makefile` (or `make -C xen O=../xen-build`, or even
`make -C xen O=build` would be fine too). With maybe a make variable to
let someone specify a different output tree.

For a full-build-of-everything, we can easily do out-of-tree build. The
full-install-of-everything can pick the build artefact from the new
place. The issue is when someone want that and edit ".config" of the
hypervisor, as adding the file will stop out-of-tree build, so pv shim
will not be able to use out-of-tree build.


But maybe going with mixing in-tree and out-of-tree build is going to be
too complicated. The hard part is for the build system to differentiate
between source file and generated source file, so that might break from
time to time. So maybe avoiding mixing and thus breaking build of some
users might be better and more reliable in the long term.

Cheers,

-- 
Anthony PERARD

