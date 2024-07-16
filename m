Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C8B931E13
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2024 02:44:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759288.1168940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTWI8-0007za-BN; Tue, 16 Jul 2024 00:43:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759288.1168940; Tue, 16 Jul 2024 00:43:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTWI8-0007y6-8o; Tue, 16 Jul 2024 00:43:40 +0000
Received: by outflank-mailman (input) for mailman id 759288;
 Tue, 16 Jul 2024 00:43:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+WOl=OQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sTWI6-0007y0-QF
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2024 00:43:38 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e6542ac-430c-11ef-8776-851b0ebba9a2;
 Tue, 16 Jul 2024 02:43:36 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 40C3CCE112F;
 Tue, 16 Jul 2024 00:43:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94810C32782;
 Tue, 16 Jul 2024 00:43:31 +0000 (UTC)
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
X-Inumbo-ID: 6e6542ac-430c-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721090612;
	bh=EXNBP9SDsCQLv3BDf8Lkpa1fYTofGJoSkt+oTLKMGCc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=j2Dk3TW8K8fedx/1p4f0jZGh8/47bT+08SF+Pa7Tc4BalkcSXTL9La4JByx1ALRSf
	 eSQTWB18SKpWquDZAzpr8ngzcf7a8aLSFNhJRUG2RiCr5K4Cw95Rm3oN/plOvTzQBl
	 aYYPq4/fDRnwN4Y9GWwt/ocZsR8sHweX6QpeJpmnvCVcOuUKDWcTI2NEnYmLhJPaLu
	 IyAyhEaP/UwdYyjxr3ZB4ehktbC9sgk6KENPnPaANFwSB73LYC/PolqdxsqEGPyq0x
	 uQ4HTuysyUezSvb5hF3Ar4vpByaVquM61QaTJeMpeEH1tl6ashc3XPvtK3vvliYU7m
	 3KiQZH+/KtaJw==
Date: Mon, 15 Jul 2024 17:43:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>, 
    consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [RFC PATCH 17/17] CODING_STYLE: Add a section on header guards
 naming conventions
In-Reply-To: <f1369d5e-5c2e-4866-a593-9656b569c086@suse.com>
Message-ID: <alpine.DEB.2.22.394.2407151736530.3635@ubuntu-linux-20-04-desktop>
References: <cover.1719829101.git.alessandro.zucchelli@bugseng.com> <fdb3811e00b9d6708c18d349a5a5043bb1b49cec.1719829101.git.alessandro.zucchelli@bugseng.com> <375074a0-0db7-40ba-9c9f-590b0cbe2409@suse.com> <alpine.DEB.2.22.394.2407121528380.3635@ubuntu-linux-20-04-desktop>
 <f1369d5e-5c2e-4866-a593-9656b569c086@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 15 Jul 2024, Jan Beulich wrote:
> On 13.07.2024 00:38, Stefano Stabellini wrote:
> > On Wed, 3 Jul 2024, Jan Beulich wrote:
> >> I further have to note that, as indicated during the earlier discussion,
> >> I still cannot see how occasional ambiguity is going to be dealt with.
> >> IOW from the rules above two different headers could still end up with
> >> the same guard identifier.
> > 
> > Maybe something like this?
> > 
> > "In the event of naming collisions, exceptions to the coding style may
> > be made at the discretion of the contributor and maintainers."
> 
> Hmm, maybe I wasn't clear enough then. My take is that the scheme should
> simply not allow for possible collisions. Neither the contributor nor the
> reviewer may spot such a collision, and it may therefore take until the
> first full scan that one is actually noticed. Which I consider too late
> in the process, even if we already were at the point where commits were
> checked pre-push.

Looking at the proposal, copy/pasted here for convenience:

- private headers -> <dir>_<filename>_H
- asm-generic headers -> ASM_GENERIC_<filename>_H
    - #ifndef ASM_GENERIC_X86_PERCPU_H
      #define ASM_GENERIC_X86_PERCPU_H
      //...
      #endif /* ASM_GENERIC_X86_PERCPU_H */
- arch/<architecture>/include/asm/<subdir>/<filename>.h -> ASM_<architecture>_<subdir>_<filename>_H
    - #ifndef ASM_X86_DOMAIN_H
      #define ASM_X86_DOMAIN_H
      //...
      #endif /* ASM_X86_DOMAIN_H */
- xen/include/xen/<filename>.h -> XEN_<filename>_H
- xen/include/xen/<subdir>/<filename>.h -> XEN_<subdir>_<filename>_H


The only possibility for collision that I can see is from the first
point:

- private headers -> <dir>_<filename>_H


two directories like this could collide:

- arch/arm/arm64/lib/something.h -> LIB_SOMETHING_H
- arch/arm/arm32/lib/something.h -> LIB_SOMETHING_H
- arch/x86/lib/something.h -> LIB_SOMETHING_H

(Leaving aside that in this example it would not be an issue because the
three headers are not meant to be all included in the same file.)

Can we specify that <dir> should go all the way back to the arch/ or or
common or drivers directory?

- arch/arm/arm64/lib/something.h -> ARM_ARM64_LIB_SOMETHING_H
- arch/arm/arm32/lib/something.h -> ARM_ARM32_LIB_SOMETHING_H
- arch/x86/lib/something.h -> X86_LIB_SOMETHING_H


We can rely on the filesystem paths to make sure to avoid collisions.

