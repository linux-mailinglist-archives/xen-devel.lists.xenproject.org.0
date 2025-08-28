Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A56B3AE80
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 01:42:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1100129.1453689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urmF9-0001X2-Q2; Thu, 28 Aug 2025 23:41:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1100129.1453689; Thu, 28 Aug 2025 23:41:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urmF9-0001Uc-NE; Thu, 28 Aug 2025 23:41:23 +0000
Received: by outflank-mailman (input) for mailman id 1100129;
 Thu, 28 Aug 2025 23:41:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YsNu=3I=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1urmF8-0001UW-AT
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 23:41:22 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f11acfb-8468-11f0-8adc-4578a1afcccb;
 Fri, 29 Aug 2025 01:41:20 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9D4C26013D;
 Thu, 28 Aug 2025 23:41:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2DDAC4CEEB;
 Thu, 28 Aug 2025 23:41:16 +0000 (UTC)
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
X-Inumbo-ID: 7f11acfb-8468-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756424478;
	bh=ZzFkoIBsajEKn4LtJf6oMIx720rm9V2CYHjGdsL2htY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JA9uitAmYJ3fTiCYkRIt9j9bbOH+THqwFEj7W0YK0aUlc9MPEwor7nfQBoi1vuib4
	 VtQWEASFW7tnQYfhjl1q6nvHB/dmVXcdPKBbXr0KeU3Zia/b3rSTTo1VBv50YeF4kG
	 hmyfTntN5xY7Hvec03u3ZVxeIlkGNbjd4pj2kmwqfuOvkQ/F9OcNDy5Hkmeb8TTNPI
	 TQCI1oJOUNzwCGrqgPus1XkyexT1Gj45EDZ03ZvNcL5CFIYqwhzztOiKmKktKoqkry
	 v0z5Tx0XZbCoxADPgYkido3u72dnDLYOg593DqvLZ5wl8u0oVTBvaLKNjdbuCRZWvP
	 nZEH24VP68MAw==
Date: Thu, 28 Aug 2025 16:41:15 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, ray.huang@amd.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    xen-devel@lists.xenproject.org, Penny Zheng <Penny.Zheng@amd.com>
Subject: Re: [PATCH] xen/x86: move domctl.o out of PV_SHIM_EXCLUSIVE
In-Reply-To: <5f5ba1dd-1252-4740-8c64-e4fcd8a7ac32@suse.com>
Message-ID: <alpine.DEB.2.22.394.2508281632020.8757@ubuntu-linux-20-04-desktop>
References: <20250815102728.1340505-1-Penny.Zheng@amd.com> <fb6f559a-b2aa-4b25-a6d3-401ecc4b4bd5@suse.com> <d6046b53-9317-43d6-bfda-e30d42c09320@gmail.com> <2035b14e-3836-4e80-9dad-8a49ca90864a@suse.com> <alpine.DEB.2.22.394.2508181646220.923618@ubuntu-linux-20-04-desktop>
 <49416df6-83c8-4fa3-bf81-2d1e504ef31b@suse.com> <alpine.DEB.2.22.394.2508251934200.3391208@ubuntu-linux-20-04-desktop> <alpine.DEB.2.22.394.2508261728250.3391208@ubuntu-linux-20-04-desktop> <cc8724b6-bb31-4482-a459-156366b7b433@suse.com>
 <alpine.DEB.2.22.394.2508271442410.580734@ubuntu-linux-20-04-desktop> <5f5ba1dd-1252-4740-8c64-e4fcd8a7ac32@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 28 Aug 2025, Jan Beulich wrote:
> On 28.08.2025 02:52, Stefano Stabellini wrote:
> > On Wed, 27 Aug 2025, Jan Beulich wrote:
> >> On 27.08.2025 02:33, Stefano Stabellini wrote:
> >>> So I ran a test and the appended change, which is based on [1] and
> >>> renaming CONFIG_DOMCTL to CONFIG_SYSCTL, is sufficient to resolve the
> >>> build issue.
> >>>
> >>> For 4.21, I suggest we go with two patches:
> >>> 1) global rename of CONFIG_SYSCTL to CONFIG_MGMT_HYPERCALLS
> >>> 2) stub domctl_lock_acquire/release based on CONFIG_MGMT_HYPERCALLS
> >>>
> >>> Jan, are you OK with this?
> >>
> >> Naming if the option aside, no, I fear I dislike the stubbing. What's
> >> worse though, ...
> >>
> >>> --- a/xen/include/xen/domain.h
> >>> +++ b/xen/include/xen/domain.h
> >>> @@ -148,8 +148,17 @@ void arch_dump_domain_info(struct domain *d);
> >>>  
> >>>  int arch_vcpu_reset(struct vcpu *v);
> >>>  
> >>> +#ifdef CONFIG_SYSCTL
> >>>  bool domctl_lock_acquire(void);
> >>>  void domctl_lock_release(void);
> >>> +#else
> >>> +static inline bool domctl_lock_acquire(void)
> >>> +{
> >>> +    return false;
> >>
> >> ... this will break x86'es HVM_PARAM_IDENT_PT handling. That is, in
> >> principle I would agree that returning false here is appropriate. But
> >> for the specific case there it's wrong.
> > 
> > Uhm, that is a good point actually. And while in principle "false"
> > sounds appropriate, in practice there is no domctl.c to worry about
> > concurrency so "true" is what we want.
> 
> Except that, as said, conceptually "true" is the wrong value to use in
> such a stub.
> 
> >> As said on the call yesterday, until what you call MGMT_HYPERCALLS is
> >> completely done, the option needs to be prompt-less, always-on.
> > 
> > I do not think this is a good idea, because we would be unable to test
> > the configuration. Although we have been accepting code without tests,
> > that is not a good principle. At least with the current approach we can
> > run manual tests if automated tests are not available. If we make it
> > silent, we risk introducing broken code, or code soon-to-become broken.
> > 
> > In my view, we need to make gradual progress toward the goal. In this
> > case, we should move incrementally toward compiling out all the
> > "management" hypercalls. Also the alternative of waiting until all
> > patches are ready before committing them is not feasible. An incremental
> > approach reduces risk, preserves testability, and makes regressions
> > easier to identify.
> 
> If that's your view, then why did you not comment on the SYSCTL series,
> when I asked the prompt to appear last?

I am not trying to be obtuse, but I am not sure what you mean by this.
In any case, I do not recall reading a specific email on this topic. I
try my best to follow other review comments, but I may have overlooked
this one.


> > An extreme example is that I could write:
> > 
> > static inline bool domctl_lock_acquire(void)
> > {
> >     obviously broken
> > }
> > 
> > and no tests would catch it.
> 
> Tests would catch it at the point the prompt is added. Much like it was
> with the SYSCTL series (and why, with the prompt removed, the rest of
> the series can stay in).

In my opinion, this is a no-go. The code must function correctly, and
that is my top priority, certainly above conceptual issues, such as the
return value of domctl_lock_acquire. With your suggestion, there is no
guarantee the code works and there is no way to test it.


> >> Adding
> >> a prompt was necessary to be the last thing on the SYSCTL series, and
> >> it'll need to be last on the follow-on one masking out further
> >> hypercalls. IOW my take is that 34317c508294 and 568f806cba4c will
> >> need reverting (the latter being what caused the regression, and the
> >> former depending on the latter), to allow to cleanly continue that
> >> work after the rename. If we don't do the reverts now (and take either
> >> Penny's patch or what you propose), imo we'll need to do them later.
> >> Else we're risking to introduce new randconfig breakages while the
> >> further conversion work is ongoing.
> > 
> > My suggestion remains to go forward with 2 patches:
> > 0) keep both 568f806cba4c and 34317c508294
> > 1) rename CONFIG_SYSCTL to CONFIG_MGMT_HYPERCALLS
> > 2) this patch with return true from domctl_lock_acquire
> > 
> > I am open to reverting 568f806cba4c but I don't think it would improve
> > things. I definitely don't think we should revert 34317c508294. We need
> > 34317c508294 otherwise this patch doesn't fix the build.
> 
> If "this patch" is the one outlined here, then with the reverts we wouldn't
> need it at all. The reverts alone will fix the build issue, according to my
> understanding.

The reverts you are suggesting do not fix the issue; they only hide it.
The Kconfig option can no longer be disabled, which renders the entire
patch series ineffective. In fact, the #ifdef's could be completely
incorrect, and the code would still build, as in my example:

static inline bool domctl_lock_acquire(void)
{
    obviously broken
}

It looks like we'll need a third opinion to make forward progress.

