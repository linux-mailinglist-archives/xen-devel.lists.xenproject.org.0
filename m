Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D260D75D86F
	for <lists+xen-devel@lfdr.de>; Sat, 22 Jul 2023 02:50:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567773.887262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qN0oo-0003K8-UA; Sat, 22 Jul 2023 00:49:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567773.887262; Sat, 22 Jul 2023 00:49:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qN0oo-0003IA-QW; Sat, 22 Jul 2023 00:49:58 +0000
Received: by outflank-mailman (input) for mailman id 567773;
 Sat, 22 Jul 2023 00:49:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=thWI=DI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qN0om-0003H4-UW
 for xen-devel@lists.xenproject.org; Sat, 22 Jul 2023 00:49:56 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abaa3e13-2829-11ee-8611-37d641c3527e;
 Sat, 22 Jul 2023 02:49:54 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F289B61DAE;
 Sat, 22 Jul 2023 00:49:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81ED7C433CA;
 Sat, 22 Jul 2023 00:49:51 +0000 (UTC)
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
X-Inumbo-ID: abaa3e13-2829-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689986992;
	bh=LgQMwlGOLQXVjU9U9x2drQ9jLSZCHIVH1Rk4rpRX6Ao=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Sm7GEKxGnB+FWitJeq/VBDkKdgQwIZvIwsNHbj0A9fytoYq8AzbyrNwEJIQkGMUdU
	 mF+wHW/IjWHBgRsHyUMiAAeP0JbovAxiXye1WxtREGgF6AK4D/a/BpZtHNteFuRkgI
	 1LKHD7MrXN0Ge5zjkHoYfzY/Wj3daXrwGPD/b3qEkJjh/OgTMpgqcsbL1b1p1oxbbT
	 fmkQAkd5l5ZEGlkdcd+J4gH864zzjGZIsF5xK4LJzZBsMB878CsnlCSqZWfUgtC6zV
	 oFIzwxFiet0uPSYFA6wLKDGLO8pWSpF+iQFia5TI5YBP4Tp25iiEh6dhtQOdVTPGbL
	 xmLnb/fV6UVLg==
Date: Fri, 21 Jul 2023 17:49:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org, 
    Doug Goldstein <cardoe@cardoe.com>, 
    "committers@xenproject.org" <committers@xenproject.org>
Subject: Re: [PATCH] automation: avoid duplicated builds of staging branch
In-Reply-To: <ZLshtl8KKgyR1wlY@mail-itl>
Message-ID: <alpine.DEB.2.22.394.2307211749270.3118466@ubuntu-linux-20-04-desktop>
References: <20230717130925.28183-1-marmarek@invisiblethingslab.com> <cf7ac648-dbef-80bb-986b-3fe0daef855a@citrix.com> <ZLVLaPeyOwDYYUXL@mail-itl> <alpine.DEB.2.22.394.2307211627080.3118466@ubuntu-linux-20-04-desktop> <ZLsd3tdSvTLwIyt3@mail-itl>
 <alpine.DEB.2.22.394.2307211712430.3118466@ubuntu-linux-20-04-desktop> <ZLshtl8KKgyR1wlY@mail-itl>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1845796540-1689986991=:3118466"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1845796540-1689986991=:3118466
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Sat, 22 Jul 2023, Marek Marczykowski-Górecki wrote:
> On Fri, Jul 21, 2023 at 05:14:01PM -0700, Stefano Stabellini wrote:
> > On Sat, 22 Jul 2023, Marek Marczykowski-Górecki wrote:
> > > On Fri, Jul 21, 2023 at 04:42:11PM -0700, Stefano Stabellini wrote:
> > > > On Mon, 17 Jul 2023, Marek Marczykowski-Górecki wrote:
> > > > > On Mon, Jul 17, 2023 at 02:14:14PM +0100, Andrew Cooper wrote:
> > > > > > On 17/07/2023 2:09 pm, Marek Marczykowski-Górecki wrote:
> > > > > > > "staging" branch is mirrored (automatically or manually) to several
> > > > > > > repositories. Avoid building it several times to not waste runner
> > > > > > > resources.
> > > > 
> > > > Hi Marek,
> > > > 
> > > > Let me try to understand the use-case a bit better. You would like the
> > > > following "staging" branch to run a full pipeline:
> > > > https://gitlab.com/xen-project/xen
> > > > 
> > > > But if someone under xen-project/people is mirroring
> > > > https://gitlab.com/xen-project/xen, this patch is attempting to skip the
> > > > additional pipeline. For instance, if I am mirroring staging in my
> > > > personal repo:
> > > > 
> > > > https://gitlab.com/xen-project/people/sstabellini/xen
> > > > 
> > > > We are skipping the additional pipeline there.
> > > 
> > > Yes.
> > > 
> > > > Is that correct? If so, it would be easier to ask everyone to make sure
> > > > they have "Trigger pipelines for mirror updates" unselected:
> > > > 
> > > > https://docs.gitlab.com/ee/user/project/repository/mirror/pull.html#trigger-pipelines-for-mirror-updates
> > > 
> > > If that's set in gitlab as pull mirror (instead of push from somewhere
> > > else), then that indeed may be enough. But is it really in all those
> > > cases?
> > 
> > Yes, it is an option in the pull mirror, by default should be unselected
> > I believe.
> 
> Well, if that's the case, either it got manually enabled on those 4 (?)
> forks, or those are using something else for mirroring the staging
> branch (in which case, the setting would not help). I can't see this
> part of the settings in other's repositories, so I don't know.

Do you know the name of those 4 forks? I can help figure it out.
--8323329-1845796540-1689986991=:3118466--

