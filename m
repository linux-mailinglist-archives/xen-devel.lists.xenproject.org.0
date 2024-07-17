Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C38379334B5
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2024 02:21:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759821.1169512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTsPX-0003a1-UA; Wed, 17 Jul 2024 00:20:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759821.1169512; Wed, 17 Jul 2024 00:20:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTsPX-0003Wr-RP; Wed, 17 Jul 2024 00:20:47 +0000
Received: by outflank-mailman (input) for mailman id 759821;
 Wed, 17 Jul 2024 00:20:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bXng=OR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sTsPW-0003Wl-Ti
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2024 00:20:46 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67f4e4f4-43d2-11ef-8776-851b0ebba9a2;
 Wed, 17 Jul 2024 02:20:44 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4B913613F9;
 Wed, 17 Jul 2024 00:20:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C9BDC116B1;
 Wed, 17 Jul 2024 00:20:41 +0000 (UTC)
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
X-Inumbo-ID: 67f4e4f4-43d2-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721175643;
	bh=AxXY69D1iOPsybrBxxmQkAjPk7DMljmZlLDuRhqdC7g=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VnVrvJIoWB1iWe+jnTVjnaXukUVb+Gdh/RoovetKj7WQ+Bwi0LWwgRP0fNGZw/7C9
	 TnXqwpDGxmF2HXmYpbgZL0UB+y04tQVhh8/bSK9EvmNYCDrsd0sbEJAcf0cvAZXuhh
	 kL0E+8eojGWEs5SC4TVw6v5DjQtz2Uycgw30H3G9343pt93aCMk0btPpev6uZJefmV
	 lvi+uQsy08Gu4uY2C0FqgOF6IZNXlRAc1Kn3fO5kQD4ZNUiFnvZdTKx0NEYCOevZpX
	 RKYnyiaO87i9/2HsorT7WfN8cTy6N4t08RIIRnKMx7M4IEal5JLdhZ2Kyzcxm4CxML
	 zdlsAk0Ym8zew==
Date: Tue, 16 Jul 2024 17:20:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>, 
    consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [RFC PATCH 17/17] CODING_STYLE: Add a section on header guards
 naming conventions
In-Reply-To: <4893a89d-9ef5-4d86-94b0-042e88588439@suse.com>
Message-ID: <alpine.DEB.2.22.394.2407161713010.3635@ubuntu-linux-20-04-desktop>
References: <cover.1719829101.git.alessandro.zucchelli@bugseng.com> <fdb3811e00b9d6708c18d349a5a5043bb1b49cec.1719829101.git.alessandro.zucchelli@bugseng.com> <375074a0-0db7-40ba-9c9f-590b0cbe2409@suse.com> <alpine.DEB.2.22.394.2407121528380.3635@ubuntu-linux-20-04-desktop>
 <f1369d5e-5c2e-4866-a593-9656b569c086@suse.com> <alpine.DEB.2.22.394.2407151736530.3635@ubuntu-linux-20-04-desktop> <4893a89d-9ef5-4d86-94b0-042e88588439@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 16 Jul 2024, Jan Beulich wrote:
> On 16.07.2024 02:43, Stefano Stabellini wrote:
> > On Mon, 15 Jul 2024, Jan Beulich wrote:
> >> On 13.07.2024 00:38, Stefano Stabellini wrote:
> >>> On Wed, 3 Jul 2024, Jan Beulich wrote:
> >>>> I further have to note that, as indicated during the earlier discussion,
> >>>> I still cannot see how occasional ambiguity is going to be dealt with.
> >>>> IOW from the rules above two different headers could still end up with
> >>>> the same guard identifier.
> >>>
> >>> Maybe something like this?
> >>>
> >>> "In the event of naming collisions, exceptions to the coding style may
> >>> be made at the discretion of the contributor and maintainers."
> >>
> >> Hmm, maybe I wasn't clear enough then. My take is that the scheme should
> >> simply not allow for possible collisions. Neither the contributor nor the
> >> reviewer may spot such a collision, and it may therefore take until the
> >> first full scan that one is actually noticed. Which I consider too late
> >> in the process, even if we already were at the point where commits were
> >> checked pre-push.
> > 
> > Looking at the proposal, copy/pasted here for convenience:
> > 
> > - private headers -> <dir>_<filename>_H
> > - asm-generic headers -> ASM_GENERIC_<filename>_H
> >     - #ifndef ASM_GENERIC_X86_PERCPU_H
> >       #define ASM_GENERIC_X86_PERCPU_H
> >       //...
> >       #endif /* ASM_GENERIC_X86_PERCPU_H */
> > - arch/<architecture>/include/asm/<subdir>/<filename>.h -> ASM_<architecture>_<subdir>_<filename>_H
> >     - #ifndef ASM_X86_DOMAIN_H
> >       #define ASM_X86_DOMAIN_H
> >       //...
> >       #endif /* ASM_X86_DOMAIN_H */
> > - xen/include/xen/<filename>.h -> XEN_<filename>_H
> > - xen/include/xen/<subdir>/<filename>.h -> XEN_<subdir>_<filename>_H
> > 
> > 
> > The only possibility for collision that I can see is from the first
> > point:
> > 
> > - private headers -> <dir>_<filename>_H
> 
> I don't think this is the only possibility of collisions. The <subdir>_<filename>
> parts can similarly cause problems if either of the two involved names contains
> e.g. a dash (which would need converting to an underscore) or an underscore. To
> avoid this, the name separators (slashes in the actual file names) there may need
> representing by double underscores.

I am OK with you two underscores as name separator (slashes in the
actual file names). Would you do it for all levels like this?

- arch/arm/arm64/lib/something.h -> ARM__ARM64__LIB__SOMETHING_H
- arch/arm/arm32/lib/something.h -> ARM__ARM32__LIB__SOMETHING_H
- arch/x86/lib/something.h -> X86__LIB__SOMETHING_H


I think it is better than the below:

- arch/arm/arm64/lib/something.h -> ARM_ARM64__LIB__SOMETHING_H
- arch/arm/arm32/lib/something.h -> ARM_ARM32__LIB__SOMETHING_H
- arch/x86/lib/something.h -> X86_LIB__SOMETHING_H


> > two directories like this could collide:
> > 
> > - arch/arm/arm64/lib/something.h -> LIB_SOMETHING_H
> > - arch/arm/arm32/lib/something.h -> LIB_SOMETHING_H
> > - arch/x86/lib/something.h -> LIB_SOMETHING_H
> > 
> > (Leaving aside that in this example it would not be an issue because the
> > three headers are not meant to be all included in the same file.)
> > 
> > Can we specify that <dir> should go all the way back to the arch/ or or
> > common or drivers directory?
> > 
> > - arch/arm/arm64/lib/something.h -> ARM_ARM64_LIB_SOMETHING_H
> > - arch/arm/arm32/lib/something.h -> ARM_ARM32_LIB_SOMETHING_H
> > - arch/x86/lib/something.h -> X86_LIB_SOMETHING_H
> 
> We can of course, so long as we're okay(ish) with the length and redundancy. As
> already indicated before, there are downsides to this. Yet a firm scheme with
> few rules has the benefit that it might even be possible to use a script to do
> all the guard adjustments.

I also like the firm scheme with few rules

