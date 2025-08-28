Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D96B3903D
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 02:53:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097248.1451669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urQsF-00068d-5G; Thu, 28 Aug 2025 00:52:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097248.1451669; Thu, 28 Aug 2025 00:52:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urQsF-00066i-2e; Thu, 28 Aug 2025 00:52:19 +0000
Received: by outflank-mailman (input) for mailman id 1097248;
 Thu, 28 Aug 2025 00:52:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YsNu=3I=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1urQsD-00066c-G6
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 00:52:17 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d5f6dc3-83a9-11f0-aeb2-fb57b961d000;
 Thu, 28 Aug 2025 02:52:15 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 470DE601D3;
 Thu, 28 Aug 2025 00:52:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94406C4CEEB;
 Thu, 28 Aug 2025 00:52:12 +0000 (UTC)
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
X-Inumbo-ID: 3d5f6dc3-83a9-11f0-aeb2-fb57b961d000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756342334;
	bh=OLfCwBee0WLdBrm71XuYIxR4JKqCPyL8S3FZVa2iVnc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=C4xB2BOFKx4Q3pjnJXNh0GzPT6fIWRlxpwdj1diL537c8AZpvdJeB2kT0Q/F/NMPI
	 QVM4QC1jI0YoyVSEHvqBZnJpokV5BELyLmzSVTAuRMA1LyHfhcNRGqg7Lrk0hhfxE4
	 mAOIKYsN/8OoT0xqwUy8WH4fXmv2S77dmeHtvy4E9THZwMB9Wgkbd0x6lnxt/vTaX0
	 piuzna8RVqpf4vm5E7NeP7p8PpFS1D4I3dP4LZ94VS/Djjf0nNkgmlQHWpG6MCUa+d
	 cH/cmRh2mRgQFkmiQcR5bCp6trlJ4roOvA+S4yZPXbS+mWp4x3hYozDpJc5V2CYGfZ
	 W7XDuUvri4ifg==
Date: Wed, 27 Aug 2025 17:52:09 -0700 (PDT)
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
In-Reply-To: <cc8724b6-bb31-4482-a459-156366b7b433@suse.com>
Message-ID: <alpine.DEB.2.22.394.2508271442410.580734@ubuntu-linux-20-04-desktop>
References: <20250815102728.1340505-1-Penny.Zheng@amd.com> <fb6f559a-b2aa-4b25-a6d3-401ecc4b4bd5@suse.com> <d6046b53-9317-43d6-bfda-e30d42c09320@gmail.com> <2035b14e-3836-4e80-9dad-8a49ca90864a@suse.com> <alpine.DEB.2.22.394.2508181646220.923618@ubuntu-linux-20-04-desktop>
 <49416df6-83c8-4fa3-bf81-2d1e504ef31b@suse.com> <alpine.DEB.2.22.394.2508251934200.3391208@ubuntu-linux-20-04-desktop> <alpine.DEB.2.22.394.2508261728250.3391208@ubuntu-linux-20-04-desktop> <cc8724b6-bb31-4482-a459-156366b7b433@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 27 Aug 2025, Jan Beulich wrote:
> On 27.08.2025 02:33, Stefano Stabellini wrote:
> > So I ran a test and the appended change, which is based on [1] and
> > renaming CONFIG_DOMCTL to CONFIG_SYSCTL, is sufficient to resolve the
> > build issue.
> > 
> > For 4.21, I suggest we go with two patches:
> > 1) global rename of CONFIG_SYSCTL to CONFIG_MGMT_HYPERCALLS
> > 2) stub domctl_lock_acquire/release based on CONFIG_MGMT_HYPERCALLS
> > 
> > Jan, are you OK with this?
> 
> Naming if the option aside, no, I fear I dislike the stubbing. What's
> worse though, ...
> 
> > --- a/xen/include/xen/domain.h
> > +++ b/xen/include/xen/domain.h
> > @@ -148,8 +148,17 @@ void arch_dump_domain_info(struct domain *d);
> >  
> >  int arch_vcpu_reset(struct vcpu *v);
> >  
> > +#ifdef CONFIG_SYSCTL
> >  bool domctl_lock_acquire(void);
> >  void domctl_lock_release(void);
> > +#else
> > +static inline bool domctl_lock_acquire(void)
> > +{
> > +    return false;
> 
> ... this will break x86'es HVM_PARAM_IDENT_PT handling. That is, in
> principle I would agree that returning false here is appropriate. But
> for the specific case there it's wrong.

Uhm, that is a good point actually. And while in principle "false"
sounds appropriate, in practice there is no domctl.c to worry about
concurrency so "true" is what we want.


> As said on the call yesterday, until what you call MGMT_HYPERCALLS is
> completely done, the option needs to be prompt-less, always-on.

I do not think this is a good idea, because we would be unable to test
the configuration. Although we have been accepting code without tests,
that is not a good principle. At least with the current approach we can
run manual tests if automated tests are not available. If we make it
silent, we risk introducing broken code, or code soon-to-become broken.

In my view, we need to make gradual progress toward the goal. In this
case, we should move incrementally toward compiling out all the
"management" hypercalls. Also the alternative of waiting until all
patches are ready before committing them is not feasible. An incremental
approach reduces risk, preserves testability, and makes regressions
easier to identify.

An extreme example is that I could write:

static inline bool domctl_lock_acquire(void)
{
    obviously broken
}

and no tests would catch it.

So in short, I think we need to keep the prompt.


> Adding
> a prompt was necessary to be the last thing on the SYSCTL series, and
> it'll need to be last on the follow-on one masking out further
> hypercalls. IOW my take is that 34317c508294 and 568f806cba4c will
> need reverting (the latter being what caused the regression, and the
> former depending on the latter), to allow to cleanly continue that
> work after the rename. If we don't do the reverts now (and take either
> Penny's patch or what you propose), imo we'll need to do them later.
> Else we're risking to introduce new randconfig breakages while the
> further conversion work is ongoing.

My suggestion remains to go forward with 2 patches:
0) keep both 568f806cba4c and 34317c508294
1) rename CONFIG_SYSCTL to CONFIG_MGMT_HYPERCALLS
2) this patch with return true from domctl_lock_acquire

I am open to reverting 568f806cba4c but I don't think it would improve
things. I definitely don't think we should revert 34317c508294. We need
34317c508294 otherwise this patch doesn't fix the build.

This is why I think we need the prompt: otherwise we would not discover
even very basic important build breakages.

