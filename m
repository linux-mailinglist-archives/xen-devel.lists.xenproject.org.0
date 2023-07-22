Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BC675D896
	for <lists+xen-devel@lfdr.de>; Sat, 22 Jul 2023 03:19:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567783.887281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qN1Go-0005an-Fj; Sat, 22 Jul 2023 01:18:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567783.887281; Sat, 22 Jul 2023 01:18:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qN1Go-0005Yi-Cp; Sat, 22 Jul 2023 01:18:54 +0000
Received: by outflank-mailman (input) for mailman id 567783;
 Sat, 22 Jul 2023 01:18:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=thWI=DI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qN1Gn-0005Yc-F2
 for xen-devel@lists.xenproject.org; Sat, 22 Jul 2023 01:18:53 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b681ef1e-282d-11ee-8611-37d641c3527e;
 Sat, 22 Jul 2023 03:18:50 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2639461D2F;
 Sat, 22 Jul 2023 01:18:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 823D0C433C8;
 Sat, 22 Jul 2023 01:18:47 +0000 (UTC)
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
X-Inumbo-ID: b681ef1e-282d-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689988728;
	bh=c7voaczwL4C3/cUlCQHFzpdCEJVNGPqDpWzgz0X/TKg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rfi+tNHKOU7nF8C05hlAwNLyunhOYfu4aLFIHd6WUIUEaFQuwsOTFZ8k5JXnG1CXi
	 G3ex+iIrGD0+enAu6F3kTVScM25/xQNSnwwl2+no1NuI3mZX07MuftjpNexH/COSk/
	 eYsV6s2B+A0/vnLqv3xunc4jKx+xZLylhqrxXJILbcuPi0tw4Oj3nyPhm3EeLxlerI
	 hBuEJRB+CTAk/Lg+/SP98P6lIFxvQOEGSCR1HxUgYhzc26ZoEr0M8L3jnM2rj3NztP
	 k5ixNDyRDKO3SIheyBEZoAe3o1vaufBWXpm0IZU7Adul2Ve+OWio5yGkdq0PO/8snQ
	 X57z9ppezqbGg==
Date: Fri, 21 Jul 2023 18:18:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    andrew.cooper3@citrix.com, oleksii.kurochko@gmail.com
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org, 
    Doug Goldstein <cardoe@cardoe.com>, 
    "committers@xenproject.org" <committers@xenproject.org>
Subject: Re: [PATCH] automation: avoid duplicated builds of staging branch
In-Reply-To: <ZLsqSWXvwxBQK3NG@mail-itl>
Message-ID: <alpine.DEB.2.22.394.2307211811020.3118466@ubuntu-linux-20-04-desktop>
References: <20230717130925.28183-1-marmarek@invisiblethingslab.com> <cf7ac648-dbef-80bb-986b-3fe0daef855a@citrix.com> <ZLVLaPeyOwDYYUXL@mail-itl> <alpine.DEB.2.22.394.2307211627080.3118466@ubuntu-linux-20-04-desktop> <ZLsd3tdSvTLwIyt3@mail-itl>
 <alpine.DEB.2.22.394.2307211712430.3118466@ubuntu-linux-20-04-desktop> <ZLshtl8KKgyR1wlY@mail-itl> <alpine.DEB.2.22.394.2307211749270.3118466@ubuntu-linux-20-04-desktop> <ZLsqSWXvwxBQK3NG@mail-itl>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1674952825-1689988449=:3118466"
Content-ID: <alpine.DEB.2.22.394.2307211814130.3118466@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1674952825-1689988449=:3118466
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2307211814131.3118466@ubuntu-linux-20-04-desktop>

Hi Andrew, Oleksii,

Please see below.

It looks like you have configured your personal repositories to mirror
upstream Xen:

https://gitlab.com/xen-project/people/olkur/xen
https://gitlab.com/xen-project/people/andyhhp/xen

Make sure that the option "Trigger pipelines for mirror updates" is
unselected.

If you setup the mirror a long time ago, you might want to stop the
mirror and start it again.

I have just done the same for fusa/xen-integration: I had to go to
settings->repository, stop the existing mirror, and create a new one
making sure "Trigger pipelines for mirror updates" is off.

Cheers,

Stefano



On Sat, 22 Jul 2023, Marek Marczykowski-Górecki wrote:
> On Fri, Jul 21, 2023 at 05:49:49PM -0700, Stefano Stabellini wrote:
> > On Sat, 22 Jul 2023, Marek Marczykowski-Górecki wrote:
> > > On Fri, Jul 21, 2023 at 05:14:01PM -0700, Stefano Stabellini wrote:
> > > > On Sat, 22 Jul 2023, Marek Marczykowski-Górecki wrote:
> > > > > On Fri, Jul 21, 2023 at 04:42:11PM -0700, Stefano Stabellini wrote:
> > > > > > On Mon, 17 Jul 2023, Marek Marczykowski-Górecki wrote:
> > > > > > > On Mon, Jul 17, 2023 at 02:14:14PM +0100, Andrew Cooper wrote:
> > > > > > > > On 17/07/2023 2:09 pm, Marek Marczykowski-Górecki wrote:
> > > > > > > > > "staging" branch is mirrored (automatically or manually) to several
> > > > > > > > > repositories. Avoid building it several times to not waste runner
> > > > > > > > > resources.
> > > > > > 
> > > > > > Hi Marek,
> > > > > > 
> > > > > > Let me try to understand the use-case a bit better. You would like the
> > > > > > following "staging" branch to run a full pipeline:
> > > > > > https://gitlab.com/xen-project/xen
> > > > > > 
> > > > > > But if someone under xen-project/people is mirroring
> > > > > > https://gitlab.com/xen-project/xen, this patch is attempting to skip the
> > > > > > additional pipeline. For instance, if I am mirroring staging in my
> > > > > > personal repo:
> > > > > > 
> > > > > > https://gitlab.com/xen-project/people/sstabellini/xen
> > > > > > 
> > > > > > We are skipping the additional pipeline there.
> > > > > 
> > > > > Yes.
> > > > > 
> > > > > > Is that correct? If so, it would be easier to ask everyone to make sure
> > > > > > they have "Trigger pipelines for mirror updates" unselected:
> > > > > > 
> > > > > > https://docs.gitlab.com/ee/user/project/repository/mirror/pull.html#trigger-pipelines-for-mirror-updates
> > > > > 
> > > > > If that's set in gitlab as pull mirror (instead of push from somewhere
> > > > > else), then that indeed may be enough. But is it really in all those
> > > > > cases?
> > > > 
> > > > Yes, it is an option in the pull mirror, by default should be unselected
> > > > I believe.
> > > 
> > > Well, if that's the case, either it got manually enabled on those 4 (?)
> > > forks, or those are using something else for mirroring the staging
> > > branch (in which case, the setting would not help). I can't see this
> > > part of the settings in other's repositories, so I don't know.
> > 
> > Do you know the name of those 4 forks? I can help figure it out.
> 
> Looking at "activity" view on gitlab, I see those:
> https://gitlab.com/xen-project/fusa/xen-integration
> https://gitlab.com/xen-project/people/olkur/xen
> https://gitlab.com/xen-project/people/andyhhp/xen
> 
> There are few more that have staging branch almost up to date, but seems
> to be pushed manually (based on it being not fully up to date) and less
> often.
> 
> -- 
> Best Regards,
> Marek Marczykowski-Górecki
> Invisible Things Lab
> 
--8323329-1674952825-1689988449=:3118466--

