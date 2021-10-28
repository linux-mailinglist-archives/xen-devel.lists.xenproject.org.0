Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3847E43E357
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 16:19:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.218087.378386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg6FS-0007Z9-EA; Thu, 28 Oct 2021 14:19:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218087.378386; Thu, 28 Oct 2021 14:19:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg6FS-0007XA-A6; Thu, 28 Oct 2021 14:19:18 +0000
Received: by outflank-mailman (input) for mailman id 218087;
 Thu, 28 Oct 2021 14:19:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TkaK=PQ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mg6FR-0007X4-Es
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 14:19:17 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 07db4ff8-37fa-11ec-84a3-12813bfff9fa;
 Thu, 28 Oct 2021 14:19:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B054361139;
 Thu, 28 Oct 2021 14:19:14 +0000 (UTC)
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
X-Inumbo-ID: 07db4ff8-37fa-11ec-84a3-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635430755;
	bh=AAsvdLWrWc0Yclmu1IC+KTPmrmf7tikUCuuxsQqi/qg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UvX4swdRoNucoaD8MbU+wbr2QDss26QuhM1EfqhkXTN6ZyQ/AOqV/7kiMwiU27Orh
	 FSAXrEpW8ZSopwDZFGLmiIEtdiAyC4n5+NMLJ/7KGidARN3LRxuBaFXV2kobZ2HbAG
	 N0VUVRJhx6VQlSLuJxTaWrdctIRa4MFbEVnsP0u6gVEV9Ulk7/ZwXPaA72ggTnQVWw
	 iXs9Qx3+PUHlimCGrfLZH5iRjOFt6IKVZKnlrNF1eUif9C0dgPduH2hDWwNDpPe7F1
	 j4z5S1nGrwQnswdZnsYg1n0OjTj9at8hCbPzwHsbNImrQMjs2S9mO0kgGzecVsrSd1
	 6BzIpEUe4m7ZA==
Date: Thu, 28 Oct 2021 07:19:13 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Anthony PERARD <anthony.perard@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, cardoe@cardoe.com, 
    xen-devel@lists.xenproject.org, iwj@xenproject.org, wl@xen.org, 
    andrew.cooper3@citrix.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: Solving the gitlab-ci git fetch issue, was: [PATCH 3/3] automation:
 add a QEMU based x86_64 Dom0/DomU test
In-Reply-To: <YXpx5PJwZoJQ6YIy@perard>
Message-ID: <alpine.DEB.2.21.2110280715310.20134@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2110210831470.2311@sstabellini-ThinkPad-T480s> <20211021230839.10794-3-sstabellini@kernel.org> <YXK2lTWZHiTXIBtJ@perard> <alpine.DEB.2.21.2110221219520.2311@sstabellini-ThinkPad-T480s> <YXbXwjxHPNjSAKrG@perard>
 <alpine.DEB.2.21.2110251754210.4586@sstabellini-ThinkPad-T480s> <YXlbOjiphjN/XqMz@perard> <alpine.DEB.2.21.2110271437120.20134@sstabellini-ThinkPad-T480s> <YXpx5PJwZoJQ6YIy@perard>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 28 Oct 2021, Anthony PERARD wrote:
> On Wed, Oct 27, 2021 at 02:43:46PM -0700, Stefano Stabellini wrote:
> > On Wed, 27 Oct 2021, Anthony PERARD wrote:
> > > > But we do have a severe problem at the moment with external sources: our
> > > > "git clones" keep failing during the build on x86. That is definitely
> > > > something worth improving (see my other email thread on the subject) and
> > > > it is the main problem affecting gitlab-ci at the moment, I keep having
> > > > to restart jobs almost daily to get the overall pipeline to "pass".
> > > > 
> > > > If you have any ideas on how to stop fetching things using "git" from
> > > > external repositories in gitlab-ci that would be fantastic :-)
> > > > The only thing I could think of to "fix it" is moving all external repos
> > > > to gitlab repositories mirrors.
> > > 
> > > I don't think that would work, I've seen the initial clone/fetch of a
> > > job fail as well, so from gitlab. If we could have a cache of those
> > > external resources closer to the runners, that would be better.
> > 
> > You mean like a git repository mirror inside the Rackspace network (the
> > provider of the x86 runner), right? Then we would force the git client
> > to go to the Rackspace mirror instead of directly to the target using
> > "insteadOf".
> 
> That would seems the best to me. If we could install Ian's
> git-cache-proxy that is used in osstest, that would be good I think.
> Having a mirror instead might work too but that would mean figure out
> which repo we would need a mirror of.
> 
> I did try a different alternative a while back, I tried to use gitlab's
> caching capability:
>     automation: Cache sub-project git tree in build jobs
>     https://lore.kernel.org/xen-devel/20191219144217.305851-3-anthony.perard@citrix.com/
> It mostly works but I'm not sure how useful it is as it seems there is
> 10 computers that would maintain 10 different caches, and most of them
> for a short while.

Interesting!

With the current runners being short-lived, it makes sense only to have
git-cache-proxy on a different always-on host. But even after the
runners are changed to be always running, instead of spawned on demand,
it might be better to have git-cache-proxy on a separate host so that
all runners can use it.  It should be more efficient?

