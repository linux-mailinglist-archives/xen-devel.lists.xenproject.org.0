Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9119379CE
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2024 17:22:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761117.1171108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUpQc-0000Qk-9i; Fri, 19 Jul 2024 15:21:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761117.1171108; Fri, 19 Jul 2024 15:21:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUpQc-0000Oy-6U; Fri, 19 Jul 2024 15:21:50 +0000
Received: by outflank-mailman (input) for mailman id 761117;
 Fri, 19 Jul 2024 15:21:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=arYX=OT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sUpQa-0000Os-0X
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2024 15:21:48 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b949d21-45e2-11ef-bbfd-fd08da9f4363;
 Fri, 19 Jul 2024 17:21:46 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id F2598CE1C70;
 Fri, 19 Jul 2024 15:21:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F6FBC32782;
 Fri, 19 Jul 2024 15:21:39 +0000 (UTC)
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
X-Inumbo-ID: 9b949d21-45e2-11ef-bbfd-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721402500;
	bh=NCu19WDWBYTF+e4zH4ldrfB7wVw6Y/eLcl4RCKCkUqc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VyLv0vL44gOjRBAUj27t6cWlS9lAD36cafE5vwXbfW2KGsfb+Z19YmXOakGazjGGc
	 M4RKSpgHtFGfwWQLww4c9yoZvkP2HPntuQu9MX5KPFwF1BKFtn2IuAphJEvR93UmXx
	 N7dz+RWT0b4//2ALbQgdq4/nauhYplvtU0kOvK4KFFcMhhrwhuj37IFvoo/rkPgLZG
	 80X/xDkCDib8Cb41KzGIxtJ3i/J9XNKALc5lYrfaegzpUyXjbl7zCgDKZ7jbx88RgM
	 vEmnAMt3RpM3k4gdVQun1ZVAqhaV9XctwavnSdlmGeFmJT4BnmUVKmJmkmHvOcUBW/
	 +cI/kO0Yy+WTg==
Date: Fri, 19 Jul 2024 08:21:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>, 
    consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [RFC PATCH 17/17] CODING_STYLE: Add a section on header guards
 naming conventions
In-Reply-To: <b1bad3be-4520-48e6-952c-3f1828a0bafa@suse.com>
Message-ID: <alpine.DEB.2.22.394.2407190820510.4857@ubuntu-linux-20-04-desktop>
References: <cover.1719829101.git.alessandro.zucchelli@bugseng.com> <fdb3811e00b9d6708c18d349a5a5043bb1b49cec.1719829101.git.alessandro.zucchelli@bugseng.com> <375074a0-0db7-40ba-9c9f-590b0cbe2409@suse.com> <alpine.DEB.2.22.394.2407121528380.3635@ubuntu-linux-20-04-desktop>
 <f1369d5e-5c2e-4866-a593-9656b569c086@suse.com> <alpine.DEB.2.22.394.2407151736530.3635@ubuntu-linux-20-04-desktop> <4893a89d-9ef5-4d86-94b0-042e88588439@suse.com> <alpine.DEB.2.22.394.2407161713010.3635@ubuntu-linux-20-04-desktop>
 <013c6cc2-eddf-4beb-b115-01aaaa71faa6@suse.com> <alpine.DEB.2.22.394.2407171601540.3635@ubuntu-linux-20-04-desktop> <8fd8d6e4-ef29-4ea9-9437-a743c25fe7b9@suse.com> <alpine.DEB.2.22.394.2407181457110.4857@ubuntu-linux-20-04-desktop>
 <b1bad3be-4520-48e6-952c-3f1828a0bafa@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 19 Jul 2024, Jan Beulich wrote:
> On 19.07.2024 00:01, Stefano Stabellini wrote:
> > On Thu, 18 Jul 2024, Jan Beulich wrote:
> >> On 18.07.2024 01:02, Stefano Stabellini wrote:
> >>> On Wed, 17 Jul 2024, Jan Beulich wrote:
> >>>> On 17.07.2024 02:20, Stefano Stabellini wrote:
> >>>>> On Tue, 16 Jul 2024, Jan Beulich wrote:
> >>>>>> On 16.07.2024 02:43, Stefano Stabellini wrote:
> >>>>>>> On Mon, 15 Jul 2024, Jan Beulich wrote:
> >>>>>>>> On 13.07.2024 00:38, Stefano Stabellini wrote:
> >>>>>>>>> On Wed, 3 Jul 2024, Jan Beulich wrote:
> >>>>>>>>>> I further have to note that, as indicated during the earlier discussion,
> >>>>>>>>>> I still cannot see how occasional ambiguity is going to be dealt with.
> >>>>>>>>>> IOW from the rules above two different headers could still end up with
> >>>>>>>>>> the same guard identifier.
> >>>>>>>>>
> >>>>>>>>> Maybe something like this?
> >>>>>>>>>
> >>>>>>>>> "In the event of naming collisions, exceptions to the coding style may
> >>>>>>>>> be made at the discretion of the contributor and maintainers."
> >>>>>>>>
> >>>>>>>> Hmm, maybe I wasn't clear enough then. My take is that the scheme should
> >>>>>>>> simply not allow for possible collisions. Neither the contributor nor the
> >>>>>>>> reviewer may spot such a collision, and it may therefore take until the
> >>>>>>>> first full scan that one is actually noticed. Which I consider too late
> >>>>>>>> in the process, even if we already were at the point where commits were
> >>>>>>>> checked pre-push.
> >>>>>>>
> >>>>>>> Looking at the proposal, copy/pasted here for convenience:
> >>>>>>>
> >>>>>>> - private headers -> <dir>_<filename>_H
> >>>>>>> - asm-generic headers -> ASM_GENERIC_<filename>_H
> >>>>>>>     - #ifndef ASM_GENERIC_X86_PERCPU_H
> >>>>>>>       #define ASM_GENERIC_X86_PERCPU_H
> >>>>>>>       //...
> >>>>>>>       #endif /* ASM_GENERIC_X86_PERCPU_H */
> >>>>>>> - arch/<architecture>/include/asm/<subdir>/<filename>.h -> ASM_<architecture>_<subdir>_<filename>_H
> >>>>>>>     - #ifndef ASM_X86_DOMAIN_H
> >>>>>>>       #define ASM_X86_DOMAIN_H
> >>>>>>>       //...
> >>>>>>>       #endif /* ASM_X86_DOMAIN_H */
> >>>>>>> - xen/include/xen/<filename>.h -> XEN_<filename>_H
> >>>>>>> - xen/include/xen/<subdir>/<filename>.h -> XEN_<subdir>_<filename>_H
> >>>>>>>
> >>>>>>>
> >>>>>>> The only possibility for collision that I can see is from the first
> >>>>>>> point:
> >>>>>>>
> >>>>>>> - private headers -> <dir>_<filename>_H
> >>>>>>
> >>>>>> I don't think this is the only possibility of collisions. The <subdir>_<filename>
> >>>>>> parts can similarly cause problems if either of the two involved names contains
> >>>>>> e.g. a dash (which would need converting to an underscore) or an underscore. To
> >>>>>> avoid this, the name separators (slashes in the actual file names) there may need
> >>>>>> representing by double underscores.
> >>>>>
> >>>>> I am OK with you two underscores as name separator (slashes in the
> >>>>> actual file names). Would you do it for all levels like this?
> >>>>>
> >>>>> - arch/arm/arm64/lib/something.h -> ARM__ARM64__LIB__SOMETHING_H
> >>>>> - arch/arm/arm32/lib/something.h -> ARM__ARM32__LIB__SOMETHING_H
> >>>>> - arch/x86/lib/something.h -> X86__LIB__SOMETHING_H
> >>>>>
> >>>>>
> >>>>> I think it is better than the below:
> >>>>>
> >>>>> - arch/arm/arm64/lib/something.h -> ARM_ARM64__LIB__SOMETHING_H
> >>>>> - arch/arm/arm32/lib/something.h -> ARM_ARM32__LIB__SOMETHING_H
> >>>>> - arch/x86/lib/something.h -> X86_LIB__SOMETHING_H
> >>>>
> >>>> Hmm, maybe it's indeed better to do it entirely uniformly then.
> >>>
> >>>
> >>> Do we have agreement on the naming convention then? 
> >>>
> >>>
> >>> - private headers -> <dir>__<filename>__H
> >>>     - arch/arm/arm64/lib/something.h -> ARM__ARM64__LIB__SOMETHING_H
> >>>     - arch/arm/arm32/lib/something.h -> ARM__ARM32__LIB__SOMETHING_H
> >>>     - arch/x86/lib/something.h -> X86__LIB__SOMETHING_H
> >>>
> >>> - asm-generic headers -> ASM_GENERIC_<filename>_H
> >>>     - include/asm-generic/percpu.h -> ASM_GENERIC_X86_PERCPU_H
> >>>
> >>> - arch/<architecture>/include/asm/<subdir>/<filename>.h -> ASM_<architecture>_<subdir>_<filename>_H
> >>>     - arch/x86/include/asm/domain.h -> ASM_X86_DOMAIN_H
> >>>
> >>> - include/xen -> XEN_<filename>_H
> >>>     - include/xen/percpu.h -> XEN_PERCPU_H
> >>>
> >>>
> >>> Or do you prefer the double underscore __  in all cases?
> >>
> >> It's not so much prefer, but a requirement if we want to be future proof.
> >> Even for ASM_GENERIC_* that'll be needed, as your outline above simply
> >> doesn't mention the (future) case of there being subdir-s there (see how
> >> Linux already has some). Imo the question doesn't even arise for XEN_*,
> >> as xen/ has subdir-s already.
> > 
> > OK. So it becomes:
> > 
> > - private headers -> <dir>__<filename>_H
> >     - arch/arm/arm64/lib/something.h -> ARM__ARM64__LIB__SOMETHING_H
> >     - arch/arm/arm32/lib/something.h -> ARM__ARM32__LIB__SOMETHING_H
> >     - arch/x86/lib/something.h -> X86__LIB__SOMETHING_H
> > 
> > - asm-generic headers -> ASM_GENERIC__<filename>_H
> >     - include/asm-generic/percpu.h -> ASM_GENERIC__X86__PERCPU_H
> 
> Nit: There's still a stray _X86_ in here.
 
yes, good point.

Alessandro, let us know if we are good to go ahead or if we are missing
anything.


> > - arch/<architecture>/include/asm/<subdir>/<filename>.h -> ASM__<architecture>__<subdir>__<filename>_H
> >     - arch/x86/include/asm/domain.h -> ASM__X86__DOMAIN_H
> > 
> > - include/xen -> XEN__<filename>_H
> >     - include/xen/percpu.h -> XEN__PERCPU_H
> > 
> > If we have found agreement then Alessandro could send an update
> 

