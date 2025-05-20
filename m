Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A12ABE7D7
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 01:00:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991227.1375118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHVwd-0000Zi-V9; Tue, 20 May 2025 23:00:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991227.1375118; Tue, 20 May 2025 23:00:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHVwd-0000Y6-SW; Tue, 20 May 2025 23:00:23 +0000
Received: by outflank-mailman (input) for mailman id 991227;
 Tue, 20 May 2025 23:00:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t5uZ=YE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uHVwc-0000Y0-Ck
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 23:00:22 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 328b1fc9-35ce-11f0-b892-0df219b8e170;
 Wed, 21 May 2025 01:00:18 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E84FD43EAA;
 Tue, 20 May 2025 23:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97D70C4CEED;
 Tue, 20 May 2025 23:00:15 +0000 (UTC)
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
X-Inumbo-ID: 328b1fc9-35ce-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747782016;
	bh=yf4qWMc/IA2YMVmMvjSwkXQJW55ZJqmF11D4O+oxhIo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lMFklAyCb+VeDKNcvvtf6T5R5ixorp1nQmPbb2SnAnCaFQA7dcOADT891R+Ie61JS
	 k88+sZpb/xE0+hNMmP3zQZhh7kJqUFKqgnlbB4WcnU87Ydx3AB1Pd2xkF3wu0/xrnf
	 lzAZeazat0b287mjA83QHmxdIy11NvTCgY9tc/arQ/pcV6chzshmPRL2yxlGAkgJzm
	 3IlAqgY70wh3kc+NmVfA6HB0pI7mGUAivTe8ut3o2N/YVQ6Z/L6trwI2Vb7zHCmOY5
	 FrdSp7aDZRxmqmul/4z4TyddxyyZ3ZpbPP2plOso6vJXgDlnpCfXwixiPD7/uRwUtN
	 cbuXBx+FF9LBA==
Date: Tue, 20 May 2025 16:00:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmkhn@proton.me
cc: Jan Beulich <jbeulich@suse.com>, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, 
    roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/2] xen/domain: rewrite emulation_flags_ok()
In-Reply-To: <aC0EYzZgzCfOovVL@kraken>
Message-ID: <alpine.DEB.2.22.394.2505201554440.2019926@ubuntu-linux-20-04-desktop>
References: <20250516022855.1146121-1-dmukhin@ford.com> <20250516022855.1146121-3-dmukhin@ford.com> <e13d061a-16ee-4b8d-8d4a-db1bba609bdf@suse.com> <aC0EYzZgzCfOovVL@kraken>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 20 May 2025, dmkhn@proton.me wrote:
> On Tue, May 20, 2025 at 05:24:33PM +0200, Jan Beulich wrote:
> > On 16.05.2025 04:29, dmkhn@proton.me wrote:
> > > --- a/xen/arch/x86/include/asm/domain.h
> > > +++ b/xen/arch/x86/include/asm/domain.h
> > > @@ -494,6 +494,12 @@ struct arch_domain
> > >                                   X86_EMU_PIT | X86_EMU_USE_PIRQ |       \
> > >                                   X86_EMU_VPCI)
> > >
> > > +/* User-selectable features. */
> > > +#define X86_EMU_OPTIONAL        (X86_EMU_USE_PIRQ)
> > > +
> > > +#define X86_EMU_BASELINE        (X86_EMU_ALL & ~(X86_EMU_VPCI | \
> > > +                                                 X86_EMU_OPTIONAL))
> > 
> > That is, VPCI is neither baseline nor optional. Certainly at least strange.

I think Denis tried to keep the code more similar to the original. This
way it is easier to review the code change and it seems correct. But at
the same time it is easier to spot inconsistency that were present even
before the patch.


> IMO, X86_EMU_OPTIONAL should include both VPCI and PIRQ.

It looks that way to me too.

However, then we need to be careful as the check would differ from the
original, but maybe that's OK. We want vPCI to be potentially exposed to
DomUs as well.


> But that will be a behavior change: AFAIU, VPCI is injected implicitly for dom0
> case only, "default" xl toolstack currently excludes VPCI for HVM domains.
> 
> Do I understand it correctly that "BASELINE" in the symbol name is a concern?


