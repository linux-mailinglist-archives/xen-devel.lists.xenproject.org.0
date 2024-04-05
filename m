Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F3289A400
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 20:18:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701355.1095735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rso7X-0005Tw-G8; Fri, 05 Apr 2024 18:16:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701355.1095735; Fri, 05 Apr 2024 18:16:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rso7X-0005RS-DJ; Fri, 05 Apr 2024 18:16:59 +0000
Received: by outflank-mailman (input) for mailman id 701355;
 Fri, 05 Apr 2024 18:16:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GKl/=LK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rso7V-0005RM-Hq
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 18:16:57 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af022eb9-f378-11ee-afe6-a90da7624cb6;
 Fri, 05 Apr 2024 20:16:56 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 90FC460FC7;
 Fri,  5 Apr 2024 18:16:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C3AEC433C7;
 Fri,  5 Apr 2024 18:16:52 +0000 (UTC)
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
X-Inumbo-ID: af022eb9-f378-11ee-afe6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712341014;
	bh=ZOPgm3N5Pv3svyD22kGnHjkNuwOyqqpUMk/fuGP3fH8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ClKRqI5wxywN4bIs1P/Lx5BmfTUrutiSXknk593+UVaOuZgmYoA24U/aHOqLVerEj
	 kxBSyeiBXDqH8fCYhBV4sJxFHxcwQbjL2w2t2EuMJ42Mra58Um9OpDIFZVKxetQyUP
	 K+9POHffMdua9CAF6I+a5ffKYTwHvnBrL4gj7YxAn0ND5DsjMVhEzy6iIBS6AY4uiG
	 mjB99wjSm1nBxeZ8lTD8DQiee/eZNSwlVf2tAAqRFReC2NpUw453mEWUn1Hz2SNWld
	 OZcJMiNfjVyWjztYQGCcwk4APd7C9oF3pZ2K75wk7f9Vn3zUJne1tGJud5XZZdmn+n
	 3OyVRLTrNL2eA==
Date: Fri, 5 Apr 2024 11:16:51 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Simone Ballarin <simone.ballarin@bugseng.com>
Subject: Re: [XEN PATCH v3 2/2] MISRA C Rule 20.7 states: "The features of
 `<stdarg.h>' shall not be used"
In-Reply-To: <dbcfdf24-1d6c-4a2e-a8d5-e3d19a700e08@suse.com>
Message-ID: <alpine.DEB.2.22.394.2404051116390.2245130@ubuntu-linux-20-04-desktop>
References: <cover.1711621080.git.simone.ballarin@bugseng.com> <97008d1b28eb922b3c0041830b09e827396aa0ec.1711621080.git.simone.ballarin@bugseng.com> <alpine.DEB.2.22.394.2404041725580.2245130@ubuntu-linux-20-04-desktop>
 <dbcfdf24-1d6c-4a2e-a8d5-e3d19a700e08@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 5 Apr 2024, Jan Beulich wrote:
> On 05.04.2024 02:27, Stefano Stabellini wrote:
> > On Thu, 28 Mar 2024, Simone Ballarin wrote:
> >> The Xen community wants to avoid using variadic functions except for
> >> specific circumstances where it feels appropriate by strict code review.
> >>
> >> Functions hypercall_create_continuation and hypercall_xlat_continuation
> >> are internal helper functions made to break long running hypercalls into
> >> multiple calls. They take a variable number of arguments depending on the
> >> original hypercall they are trying to continue.
> >>
> >> Add SAF deviations for the aforementioned functions.
> >>
> >> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> > 
> > 
> > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> > 
> > I fixed the title on commit
> 
> Did you forget to push then? I don't see this change in the tree, yet.

Yep, thanks!

