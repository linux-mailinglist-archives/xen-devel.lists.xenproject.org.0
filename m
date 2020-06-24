Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90931207A6E
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2020 19:39:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jo9MM-0005Bd-VM; Wed, 24 Jun 2020 17:38:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z21m=AF=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jo9MM-0005BY-FD
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 17:38:54 +0000
X-Inumbo-ID: 929f6372-b641-11ea-bb8b-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 929f6372-b641-11ea-bb8b-bc764e2007e4;
 Wed, 24 Jun 2020 17:38:54 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 482A020738;
 Wed, 24 Jun 2020 17:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593020333;
 bh=WuhI4uKb4526KIgvM6MGTVfy4+zQ6hMQVJdu/Dc1vSs=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=L3osd+1hh+35SpgbB4I+oxd7To+GfbeBMdU7KSmdZ4An5bM4izXAHTtxJW8UnTfiS
 HD6fWVfgJSIFFj3GaI2go3Z93tFmc2jkbgU3BDd2grRHax92dG0tNqAEyoTqZ9j8Oy
 L/j4ZCYgLM/urX3RHtL7lsQWRWd3WvUkz2M9OI+E=
Date: Wed, 24 Jun 2020 10:38:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: Proposal: rename xen.git#master (to #trunk, perhaps)
In-Reply-To: <24307.31637.214096.240023@mariner.uk.xensource.com>
Message-ID: <alpine.DEB.2.21.2006241033210.8121@sstabellini-ThinkPad-T480s>
References: <24307.31637.214096.240023@mariner.uk.xensource.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, committers@xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, 24 Jun 2020, Ian Jackson wrote:
> I think it would be a good idea to rename this branch name.  This name
> has unfortunate associations[1], even if it can be argued[2] that the
> etymology is not as bad as in some uses of the word.
> 
> This is relativity straightforward on a technical level and will
> involve a minimum of inconvenience.  Since only osstest ever pushes to
> xen.git#master, we could easily make a new branch name and also keep
> #master for compatibility as long as we like.
> 
> The effects[1] would be:
> 
> Users who did "git clone https://xenbits.xen.org/git-http/xen.git""
> would find themselves on a branch called "trunk" which tracked
> "origin/trunk", by default.  (Some users with old versions of git
> using old protocols would still end up on "master".)
> 
> Everyone who currently tracks "master" would be able to switch to
> tracking "trunk" at their leisure.
> 
> Presumably at some future point (a year or two from now, say) we would
> abolish the name "master".
> 
> Comments ?  In particular, comments on:
> 
> 1. What the new branch name should be called.  Suggestions I have seen
> include "trunk" and "main".  I suggest "trunk" because this was used
> by SVN, CVS, RCS, CSSC (and therefore probably SCCS) for this same
> purpose.

Github seems to be about to make a similar change. I wonder if we should
wait just a couple of weeks to see what name they are going to choose.

https://www.theregister.com/2020/06/15/github_replaces_master_with_main/


Of course I don't particulalry care one way or the other, but it would
be good if we end up using the same name as everybody else. It is not
that we have to choose the name Github is going to choose, but their
user base is massive -- whatever they are going to pick is very likely
going to stick.



> 2. Do we want to set a time now when the old name will be removed ?
> I think 12 months would be good but I am open to arguments.
> 
> In any case in my capacity as osstest maintainer I plan to do
> something like this.  The starting point is rather different.  There
> will have to be an announcement about that, but I thought I would see
> what people thought about xen.git before pressing ahead there.
> 
> Thanks,
> Ian.
> 
> [1] It seems that for a significant number of people the word reminds
> them of human slavery.  This seems undesirable if we can easily avoid
> it, if we can.
> 
> [2] The precise etymology of "master" in this context is unclear.  It
> appears to have come from BitKeeper originally.  In any case the
> etymology is less important than the connotations.
> 

