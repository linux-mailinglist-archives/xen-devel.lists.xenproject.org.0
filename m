Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4873B43543B
	for <lists+xen-devel@lfdr.de>; Wed, 20 Oct 2021 21:58:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214075.372501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdHhw-0005O2-TW; Wed, 20 Oct 2021 19:57:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214075.372501; Wed, 20 Oct 2021 19:57:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdHhw-0005Kq-PU; Wed, 20 Oct 2021 19:57:04 +0000
Received: by outflank-mailman (input) for mailman id 214075;
 Wed, 20 Oct 2021 19:57:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=waF5=PI=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mdHhv-0005Kk-Ie
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 19:57:03 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e4343062-31df-11ec-8357-12813bfff9fa;
 Wed, 20 Oct 2021 19:57:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0FC876128E;
 Wed, 20 Oct 2021 19:57:01 +0000 (UTC)
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
X-Inumbo-ID: e4343062-31df-11ec-8357-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634759821;
	bh=omdLrRF7iYsEpO+9M0zp8SgWzAseQGfKrnR8CF960DQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=H5IgrrCbC1RxcC6SlcPmPjIkSQe7Qf857wXqoUlOVliyewbNvrLoZgCI5BUZlXBCl
	 iNF6j3UU43bAI6Q0W00xhHlIaV/uuMa8rsuE5l28W+4rISLPm5l+IL8HhKpawCXpYp
	 aE7HN5PHgTqs+jLn337e25UEPhbfjAAZc1yCljssKBJMlChSmtMuDCDHmP4Hd+lM3t
	 WSjYI+ZhurZP5HJ4jSR2zEUgNAXQsoGfpGVFAvSduBYokocHLjpmD2HkNtCGrExRJC
	 NNSZRotZQBpUBwHiP/OHyG18n9SFtOCUUeJZqZe3RuNIPF9XW5mXTKSR6lmc/7iw5I
	 l2axrcS1OFueg==
Date: Wed, 20 Oct 2021 12:56:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Ian Jackson <iwj@xenproject.org>
cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Jan Beulich <jbeulich@suse.com>, 
    "Oleksandr_Andrushchenko@epam.com" <Oleksandr_Andrushchenko@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 1/1] xen/pci: Install vpci handlers on x86 and fix
 exit path
In-Reply-To: <24943.62617.9207.158774@mariner.uk.xensource.com>
Message-ID: <alpine.DEB.2.21.2110201005460.2311@sstabellini-ThinkPad-T480s>
References: <cover.1634659471.git.bertrand.marquis@arm.com> <d788dcce9e344a39f6761633f0e96774ab42c2aa.1634659471.git.bertrand.marquis@arm.com> <9f77b70f-93b8-2b54-3aa1-5de677d858cc@suse.com> <0FC6BD8A-1805-4C10-A95C-EA199D870F06@arm.com>
 <24943.62617.9207.158774@mariner.uk.xensource.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 20 Oct 2021, Ian Jackson wrote:
> Bertrand Marquis writes ("Re: [PATCH v2 1/1] xen/pci: Install vpci handlers on x86 and fix exit path"):
> > > On 20 Oct 2021, at 08:16, Jan Beulich <jbeulich@suse.com> wrote:
> > > I'm inclined to suggest s/exit/error/ in the title though (and maybe
> > > also s/path/paths/), which would be easy enough to do while committing.
> > 
> > @Ian: Please tell me if this is ok to be fixed during commit.
> 
> It's academic now, since you need a respin anyway, but I would in any
> case have preferred a new version.  I find that a much better
> workflow.  Expecting to make changes on commit pushes work onto
> committers from submitters, which is less scaleable.
> 
> And it also ends up with committer making changes without any further
> human review of any kind.  The committer must do so during an activity
> which is otherwise often shallow and administrative.  This is not the
> best way to get good results.
> 
> I believe I have made these points before, but perhaps not so clearly
> and explicitly.  They are IMO very general.  (FTAOD I'm not saying
> that making changes on commit is never appropriate, but it ought to be
> exceptional.)

Everything you wrote makes sense and your position is perfectly valid.
At the same time let me write a different perspective on the issue. All
the committers have slightly different workflows so it is natural that
things that are better for one person might not be best for another.

When I commit a patch series often I don't simply take the patches (with
all the necessary acks) and commit them. I typically do a number of
other things:
1) check that the series has all the requested changes compared to the
   previous version
2) check that nothing else was changed unexpectedly
3) run a local build test in a variety of configurations
4) run a full gitlab-ci set of tests with the patches applied

All of the above take time. So if only a small change is required, it is
much faster for me to make the change myself on commit rather than
having to go through steps 1-4 one more time again. Of course this is
only good for small changes with no impact, e.g. code style or in-code
comments, I wouldn't want to do this for anything meaningful.

