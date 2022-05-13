Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF58526B04
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 22:15:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328736.551845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npbh7-0004jV-4F; Fri, 13 May 2022 20:15:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328736.551845; Fri, 13 May 2022 20:15:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npbh7-0004h0-0p; Fri, 13 May 2022 20:15:25 +0000
Received: by outflank-mailman (input) for mailman id 328736;
 Fri, 13 May 2022 20:15:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xcQv=VV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1npbh5-0004Xg-EN
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 20:15:23 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69b878dc-d2f9-11ec-b8b8-f95467ff1ed0;
 Fri, 13 May 2022 22:15:22 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 42F9ECE331C;
 Fri, 13 May 2022 20:15:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39E86C34100;
 Fri, 13 May 2022 20:15:17 +0000 (UTC)
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
X-Inumbo-ID: 69b878dc-d2f9-11ec-b8b8-f95467ff1ed0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652472917;
	bh=f1j7cRvxmL94XaapZHsZZHRdtmgKggG/sdVKX2TsjPk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kxEvOdMBJgN+k4n22CoQ6kgX3ayKOaRu2D6OR/jylKOSB7JIaZTFVElPPM2CptOiE
	 97EgwPM2ZhdbJL+zOqgpuOAYCZh+BQzwMX6SaWkDtiMJkp43P302Xi5QGzQVmjpuB+
	 5r8DN81/Zjg7MkFHrgZSQEZS1i6Tz1crIMY9gU4EEsPJ44PRDjI1Vp0l4IEAEMC1cb
	 E6Fr3tN/gDxhM+JhszRkGK/6O6JX/etQq/jXWFc53b878UlBSGoNc93MzLqvxGB3nd
	 Xcs750rq8G4uCyBuzzP4i7MJk47Bcs5+x7ErMiLFcnwXCFVI3qoMCN3QdEdOvrpJD0
	 SqeZxOZZ7MBQQ==
Date: Fri, 13 May 2022 13:15:16 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Juergen Gross <jgross@suse.com>
cc: George Dunlap <George.Dunlap@citrix.com>, 
    Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: Process for cherry-picking patches from other projects
In-Reply-To: <2f2f10c1-e0cb-7274-1879-6f88c2517c47@suse.com>
Message-ID: <alpine.DEB.2.22.394.2205131314280.3842@ubuntu-linux-20-04-desktop>
References: <396325A0-7EE6-4EAC-9BB9-BA67D878E6AE@citrix.com> <2f2f10c1-e0cb-7274-1879-6f88c2517c47@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-862716976-1652472917=:3842"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-862716976-1652472917=:3842
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 13 May 2022, Juergen Gross wrote:
> On 13.05.22 16:33, George Dunlap wrote:
> > Starting a new thread to make it clear that we’re discussing a wider policy
> > here.
> > 
> > This question is aimed at Jan and Andy in particular, as I think they’ve
> > probably done the most of this; so I’m looking to them to find out what our
> > “standard practice” is.
> > 
> > There have recently been some patches that Bertrand has submitted which pull
> > in code from Linux ("[PATCH 1/3] xen/arm: Sync sysregs and cpuinfo with
> > Linux 5.18-rc3”), which has caused a discussion between him, Julien, and
> > Stefano about the proper way to do such patches.
> > 
> > The “Origin:” tag section of xen.git/docs/process/sending-patches.pandoc
> > suggests that there are some standards, but doesn’t spell them out.
> > 
> > The questions seem to be:
> > 
> > 1) When doing this kind of update, is it permissible to send a single patch
> > which “batches” several upstream commits together, or should each patch be
> > backported individually?
> > 
> > 2) If “batches” are permissible, when?  When would individual patches be
> > preferred?
> > 
> > 3) For “batch updates”, what tags are necessary?  Do we need to note the
> > changesets of all the commits, and if so, do we need multiple “Origin” tags?
> > Do we need to include anything from the original commits — commit messages?
> > Signed-off-by’s?
> > 
> > And a related question:
> > 
> > 4) When importing an entire file from an upstream like Linux, what tags do
> > we need?
> > 
> > My recollection is that we often to a “accumulated patch” to update, say,
> > the Kconfig tooling; so it seems like the answer to this is sometimes “yes”.
> > 
> > It seems to me that in a case where you’re importing a handful of patches —
> > say 5-10 — that importing them one-by-one might be preferred; but in this
> > case, since the submission was already made as a batch, I’d accept having it
> > as a batch.
> > 
> > I think if I were writing this patch, I’d make a separate “Origin” tag for
> > each commit.
> > 
> > I wouldn’t include the upstream commit messages or S-o-b’s; I would write my
> > own commit message summarizing why I’m importing the commits, then have the
> > ‘origin’ tags, then my own S-o-b to indicate that I am attesting that it
> > comes from an open-source project (and for whatever copyright can be
> > asserted on the commit message and the patch as a collection).
> > 
> > And for #4, I would do something similar: I would write my own commit
> > message describing what the file is for and why we’re importing it; have the
> > Origin tag point to the commit at the point I took the file; and my own
> > S-o-b.
> 
> IMO we should add another tag for that purpose, e.g.:
> 
> File-origin: <repository> <tag> <path> [# <local-path>]
> 
> Specifying the repository the file(s) are coming from, the tag (e.g. a
> tagged version, or the top git commit), and the path of the original
> file(s) in that repository (<path> could either be a common directory
> of multiple files, or a single file; multiple "File-origin:" tags should
> be possible). In case the file is being renamed locally, its new name
> can be added as <local-path>.

+1

> This variant should be used to add _new_ files to Xen. In case of
> updating a file which has seem lots of commits since its last update or
> introduction, it might be easier to just use the "File-origin:" tag,
> probably with a note below the "---" marker that listing more than <x>
> patches (x > 10?) or splitting into more than <x> patches would be
> just useless work (common sense should apply here, especially regarding
> the readability of the patch and the related review effort).

+1
--8323329-862716976-1652472917=:3842--

