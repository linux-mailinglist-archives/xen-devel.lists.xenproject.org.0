Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C48747931E2
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 00:19:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595879.929515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdeNa-0004A7-SQ; Tue, 05 Sep 2023 22:18:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595879.929515; Tue, 05 Sep 2023 22:18:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdeNa-000480-PT; Tue, 05 Sep 2023 22:18:38 +0000
Received: by outflank-mailman (input) for mailman id 595879;
 Tue, 05 Sep 2023 22:18:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IDwH=EV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qdeNZ-00047u-TU
 for xen-devel@lists.xenproject.org; Tue, 05 Sep 2023 22:18:37 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28557890-4c3a-11ee-8783-cb3800f73035;
 Wed, 06 Sep 2023 00:18:36 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 16932B816ED;
 Tue,  5 Sep 2023 22:18:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FBD3C433C9;
 Tue,  5 Sep 2023 22:18:33 +0000 (UTC)
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
X-Inumbo-ID: 28557890-4c3a-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693952314;
	bh=Y/ZSekEWj0KebHYSVgMajjUmYk9YUYMLQ3uAO0HUT8s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZWfz39J8RiUCNDYJ8z5VWVBKeUlRRW+C4rpI7wxxPwzuNsKHZELNbJn7R3LL053+W
	 bwMe+IUYqKO71ERCVSzvQoUJSmC2iHO1k0QbcoVdR5ZGpytgA9vW8BSFc+NPd6FGEG
	 dRYnXDDFaDg/dc5hf9aHZMIiuf8JT7LVvOjvhxOmy9DbHaCyNXEuigIVndkAto76D0
	 r2RmHRqfRKT/zd8pNYlCMiVvW1eShEE9HbTHnGEEnlDq4hIwC2qIJ71Ug3ATWvZrFb
	 wtvQ3Lv8Kk7wJhqCYwvhvYHDJ8JLi93Yh9cDZF66bdW9A30DA+5Ov2S0AU/+A9Eh0z
	 DJDc7pSIKptBg==
Date: Tue, 5 Sep 2023 15:18:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: Jan Beulich <jbeulich@suse.com>, consulting@bugseng.com, 
    sstabellini@kernel.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 09/13] xen/common: address violations of MISRA C:2012
 Directive 4.10
In-Reply-To: <814c3aa1-dbce-97d2-f526-93e185d61438@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2309051514200.6458@ubuntu-linux-20-04-desktop>
References: <cover.1693228255.git.simone.ballarin@bugseng.com> <fe1768342df0cd9315af87c83cc6d8d09f61b983.1693228255.git.simone.ballarin@bugseng.com> <00d67696-7895-f4cd-de0d-0c24f937deb9@suse.com> <be7ba4ea-b5e9-cc00-a8d1-0fec82248b8f@bugseng.com>
 <00866371-7adb-9cfa-267d-ee78cf14e68c@suse.com> <7d5244fe-d89c-8878-b16a-a3345426de1e@bugseng.com> <6ea28c90-68aa-4a14-e352-2bcb6e42a76a@suse.com> <814c3aa1-dbce-97d2-f526-93e185d61438@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 31 Aug 2023, Simone Ballarin wrote:
> On 31/08/23 15:05, Jan Beulich wrote:
> > On 31.08.2023 14:54, Simone Ballarin wrote:
> > > On 31/08/23 13:10, Jan Beulich wrote:
> > > > On 31.08.2023 12:08, Simone Ballarin wrote:
> > > > > The danger of multi-inclusion also exists for .c files, why do you
> > > > > want
> > > > > to avoid guards for them?
> > > > 
> > > > Counter question: Why only add guards to some of them? (My personal
> > > > answer is "Because it's extra clutter.")
> > > 
> > > It's not "some of them", it's exactly the ones used in an #include
> > > directive, so I'm not getting your objection.
> > 
> > My point is that by adding guards only for files we presently use in some
> > #include directive, we set us up for introducing new violations as soon
> > as another .c file becomes the subject of an #include.The more that it
> > is unusual to add guards in .c files, i.e. it is to be expected that
> > people wouldn't think about this extra Misra requirement.
> > 
> > Jan
> 
> I can agree to partially adopt the directive: I will add a deviation for C
> files in rules.txt.

Sorry for the late reply as I was OOO. Please hold on before adding a
deviation for C files.

In general, I think including .c files is not common behavior, and
should be restricted to special cases. We could say that exactly because
they are special, they follow different rules so we can skip the guards.
Or we could say that they are still at risk of double-inclusion, hence
we should be consistent and protect them too. I think we should discuss
the topic during the next MISRA C meeting.

