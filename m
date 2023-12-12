Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 412CC80E0EA
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 02:36:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652593.1018525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCrh5-0006hj-TY; Tue, 12 Dec 2023 01:36:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652593.1018525; Tue, 12 Dec 2023 01:36:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCrh5-0006ez-Qt; Tue, 12 Dec 2023 01:36:19 +0000
Received: by outflank-mailman (input) for mailman id 652593;
 Tue, 12 Dec 2023 01:36:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A1Zv=HX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rCrh4-0006et-9f
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 01:36:18 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d76d665f-988e-11ee-9b0f-b553b5be7939;
 Tue, 12 Dec 2023 02:36:16 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id AD218B810DB;
 Tue, 12 Dec 2023 01:36:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3391DC433C7;
 Tue, 12 Dec 2023 01:36:13 +0000 (UTC)
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
X-Inumbo-ID: d76d665f-988e-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702344974;
	bh=g5f4dd5iE2o/tCo1jnT9JBYO1kUST6lEvVo1NQGghb4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WadbKn+9HBp9oy6NuiO7kJPCaXnNgN2ZKJgpwlboSIFgT6OOF0fyKntpkD9H8+u0u
	 ijI1wxVx2TvIXkmlfi0UElkahfRUi3ZOQLIzA4wqIOrUkNfoqBFh52cnUujDPf47J4
	 MXY0/QtYFLDGK/ALhoC9QsL3Fs81DyTurDu+Ig6HaXQb6WPSifsPSrFN96rDKngdqd
	 Fd1qccafktI05QMivwB2qcuuh0v5qKH4kmvVQhyw3XNporhTaUhHAV2ePlZiud6bPT
	 ecpRJyT9KR5aYzWF5aioQc/5LkW28sbYxVxQKqXDh8ylBlWdp+2eu3+wpzbtNy2e3w
	 YqecsRtqhhNig==
Date: Mon, 11 Dec 2023 17:36:11 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org, 
    consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH 5/7] xen/arm: traps: add ASSERT_UNREACHABLE() where
 needed
In-Reply-To: <920a835236ff8cf922e515c5082770b7@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312111735500.1703076@ubuntu-linux-20-04-desktop>
References: <cover.1702283415.git.nicola.vetrini@bugseng.com> <394b69b769f2dc2461d2ddb0c7e037f4794eb244.1702283415.git.nicola.vetrini@bugseng.com> <08e3c8f0-772e-4c08-9afc-c623f19c85e3@xen.org> <c77560d6044700f10a8b149d539a95d1@bugseng.com>
 <3b3b62a3-0691-4ae7-9234-a8a85516c9eb@xen.org> <95690c3a-92c5-4e05-856b-088133b87650@xen.org> <920a835236ff8cf922e515c5082770b7@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 11 Dec 2023, Nicola Vetrini wrote:
> On 2023-12-11 17:05, Julien Grall wrote:
> > On 11/12/2023 15:59, Julien Grall wrote:
> > > Hi Nicola,
> > > 
> > > On 11/12/2023 14:54, Nicola Vetrini wrote:
> > > > On 2023-12-11 13:32, Julien Grall wrote:
> > > > > Hi,
> > > > > 
> > > > > On 11/12/2023 10:30, Nicola Vetrini wrote:
> > > > > > The branches of the switch after a call to 'do_unexpected_trap'
> > > > > > cannot return, but there is one path that may return, hence
> > > > > > only some clauses are marked with ASSERT_UNREACHABLE().
> > > > > I don't understand why this is necessary. The code should never be
> > > > > reachable because do_unexpected_trap() is a noreturn().
> > > > > 
> > > > > Cheers,
> > > > 
> > > > It was meant as a safeguard against mistakes.
> > > 
> > > I am confused about which mistakes you are trying to prevent. Are you
> > > saying you are not trusting the noreturn attribute?
> > > 
> > > And if so, are you intending to add ASSERT_UNREACHABLE() after every
> > > single call to noreturn functions?
> > 
> > Replying to myself. What's confusing the most is that in [1], you decided to
> > not add the ASSERT_UNREACHABLE(). Yet the problem is similar.
> > 
> > I'd also like to point out that by removing the "break", then if the
> > 'noreturn' function turns out to return, then in prod build you would
> > fallthrough to the next case. And who knows what's going to happen...
> > 
> > All of this really adds some confusion...
> > 
> 
> I should have checked before responding: do_trap_hyp_sync is not afaik
> noreturn. Specifically, do_trap_brk may return. If I worked under the wrong
> assumption, then certainly the ASSERT_UNREACHABLE-s should be dropped.

It looks like we could add noreturn to do_trap_brk. Julien what do you
think?

