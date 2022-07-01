Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E967C5638B0
	for <lists+xen-devel@lfdr.de>; Fri,  1 Jul 2022 19:47:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.359135.588526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o7Kjc-0003ue-M7; Fri, 01 Jul 2022 17:47:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 359135.588526; Fri, 01 Jul 2022 17:47:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o7Kjc-0003ss-IU; Fri, 01 Jul 2022 17:47:16 +0000
Received: by outflank-mailman (input) for mailman id 359135;
 Fri, 01 Jul 2022 17:47:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kD4F=XG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1o7Kjb-0003sm-Hv
 for xen-devel@lists.xenproject.org; Fri, 01 Jul 2022 17:47:15 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6f8e02f-f965-11ec-bf74-3be3494bec92;
 Fri, 01 Jul 2022 19:47:14 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F1C68B82CC2;
 Fri,  1 Jul 2022 17:47:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE668C3411E;
 Fri,  1 Jul 2022 17:47:10 +0000 (UTC)
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
X-Inumbo-ID: d6f8e02f-f965-11ec-bf74-3be3494bec92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656697631;
	bh=c4xuMH+x6ZYKJwDPdhc3j6mD3DO07ViUgQwMc69fZE0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=V46WjESQya0riVrpgZ+8PAEMQhoYjkRJXjxKVKuJKMqzVfcRdD9fOK4uHYi3MIOB8
	 /Gx5TFEA1wJ7GdyiUScrO4ZYoMwS6JI1CBfFukdFJmKRCO5QEpnua4HRjA3PNR40dZ
	 CtTEDVRTYl+IvOfr1SSrLcBoBE7xFi3ptKXRAcCKfMsllYdnO55u8osS2FtczcMPED
	 cF49M8NCs32uTVKcII/4GSaN2fTQowPcGKiFiq5hba0mZavLsDNlPxvFtg3OolrWdg
	 2pNSPtm47AD03GXatcIO1pNrl2VUjH8EpEvcbUThxibH7Of0fpfJj9us68eXvxnoH1
	 7ePgd8MUBmOfw==
Date: Fri, 1 Jul 2022 10:47:09 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Luca Fancellu <Luca.Fancellu@arm.com>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, 
    Elena Ufimtseva <elena.ufimtseva@oracle.com>, Tim Deegan <tim@xen.org>, 
    Daniel De Graaf <dgdegra@tycho.nsa.gov>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Juergen Gross <jgross@suse.com>, 
    Christian Lindig <christian.lindig@citrix.com>, 
    David Scott <dave@recoil.org>
Subject: Re: [XEN PATCH v3 25/25] tools: Remove -Werror everywhere else
In-Reply-To: <8D4E96D0-A591-440D-BD1B-E52D7F2283E5@arm.com>
Message-ID: <alpine.DEB.2.22.394.2207011045480.4389@ubuntu-linux-20-04-desktop>
References: <20220624160422.53457-1-anthony.perard@citrix.com> <20220624160422.53457-26-anthony.perard@citrix.com> <BF28045C-0848-4B5A-8DAB-57192C7B4A18@arm.com> <alpine.DEB.2.22.394.2206291019550.4389@ubuntu-linux-20-04-desktop> <6CA16D2D-8AD6-415A-A98D-00B27F91C4DA@arm.com>
 <alpine.DEB.2.22.394.2206301348380.4389@ubuntu-linux-20-04-desktop> <8D4E96D0-A591-440D-BD1B-E52D7F2283E5@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1354556042-1656697631=:4389"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1354556042-1656697631=:4389
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 1 Jul 2022, Bertrand Marquis wrote:
> > On 30 Jun 2022, at 22:03, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> > On Thu, 30 Jun 2022, Bertrand Marquis wrote:
> >>> On 29 Jun 2022, at 18:22, Stefano Stabellini <sstabellini@kernel.org> wrote:
> >>> 
> >>> On Wed, 29 Jun 2022, Luca Fancellu wrote:
> >>>> + CC: Stefano Stabellini
> >>>> 
> >>>>> On 24 Jun 2022, at 17:04, Anthony PERARD <anthony.perard@citrix.com> wrote:
> >>>>> 
> >>>>> Patch "tools: Add -Werror by default to all tools/" have added
> >>>>> "-Werror" to CFLAGS in tools/Rules.mk, remove it from every other
> >>>>> makefiles as it is now duplicated.
> >>>>> 
> >>>>> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> >>>> 
> >>>> Hi Anthony,
> >>>> 
> >>>> I will try to review the serie when I manage to have some time, in the mean time I can say the whole
> >>>> serie builds fine in my Yocto setup on arm64 and x86_64, I’ve tried also the tool stack to
> >>>> create/destroy/console guests and no problem so far.
> >>>> 
> >>>> The only problem I have is building for arm32 because, I think, this patch does a great job and it
> >>>> discovers a problem here:
> >>> 
> >>> That reminds me that we only have arm32 Xen hypervisor builds in
> >>> gitlab-ci, we don't have any arm32 Xen tools builds. I'll add it to my
> >>> TODO but if someone (not necessarily Luca) has some spare time it could
> >>> be a nice project. It could be done with Yocto by adding a Yocto build
> >>> container to automation/build/.
> >> 
> >> We have now a way to build and run xen for arm32 on qemu using Yocto.
> >> We are using this internally and also will test Xen with guests on arm32 using this soon.
> >> 
> >> I am upstreaming to meta-virtualisation all the fixes needed for that so it should be fairly straight forward do reproduce this in Yocto build in a container.
> >> 
> >> Please tell me what you need and I will try to provide you a set of scripts or instructions do reproduce that on gitlab.
> > 
> > That would be great!
> > 
> > We need two things:
> > 
> > - a Yocto build container
> > - a build script
> > 
> > 
> > The build container would be something like:
> > automation/build/debian/unstable-arm64v8.dockerfile. It is a Dockerfile
> > to create a container with Yocto and all required dependencies. It could
> > be based on Debian arm64. The build container is only built once and
> > pushed to the gitlab registry, but it is executed every time a gitlab
> > pipeline is started.
> > 
> > We probably want the meta layers to be pulled as part of the build
> > container build (git clone from the Dockerfile) because otherwise we
> > would end up git cloining them every time we run a gitlab-ci pipeline,
> > slowing everything down.
> > 
> > 
> > The build script is the script executed in the build container for every
> > pipeline.
> > 
> > Imagine you have a container "yocto-arm32", basically we want to do:
> > 
> > # docker run yocto-arm32 build.script
> > 
> > where build.script is the script that actually triggers the Xen build
> > and produces the binary output.
> > 
> > The current build script is automation/scripts/build; it is used for all
> > build containers (all of them, from Debian to Fedora and Alpine) but it
> > is probably not suitable to be used for Yocto.  It simply calls
> > ./configure; make; make install. It is more for normal distros.
> > 
> > I imagine that the build script for Yocto would call bitbake.
> > 
> > 
> > With the build container Dockerfile and the build script it becomes
> > very simple to add Yocto arm32 to gitlab-ci.
> > 
> > I realize that the actual build could be done on both arm64 or x86.
> > Currently the arm32 hypervisor-only cross-build is done on x86. See
> > automation/build/debian/unstable-arm32-gcc.dockerfile. Either way is OK.
> 
> I will work on that and I think we can take this discussion offline as there are some elements missing right now (like where is the xen tree to test).

No problem, I am happy to help offline as well. The Xen tree is given to
you automatically by gitlab-ci (because it is the repository with the
.gitlab* yaml files.) The build container starts execution with the Xen
repository to test ready inside.
--8323329-1354556042-1656697631=:4389--

