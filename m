Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B13A97691
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 22:12:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963568.1354538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Jyo-0001N3-5z; Tue, 22 Apr 2025 20:12:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963568.1354538; Tue, 22 Apr 2025 20:12:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Jyo-0001Kz-2z; Tue, 22 Apr 2025 20:12:30 +0000
Received: by outflank-mailman (input) for mailman id 963568;
 Tue, 22 Apr 2025 20:12:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eQRL=XI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u7Jyn-0001Kt-9v
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 20:12:29 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b6b0b84-1fb6-11f0-9eb0-5ba50f476ded;
 Tue, 22 Apr 2025 22:12:27 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0E4C54AA06;
 Tue, 22 Apr 2025 20:12:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 004BBC4CEEB;
 Tue, 22 Apr 2025 20:12:22 +0000 (UTC)
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
X-Inumbo-ID: 1b6b0b84-1fb6-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745352744;
	bh=4SoGW/nXSxgQnXveS4f2pxuDYysOeczQeRS4VV5sQBo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kNcDgTdOhyeKig/Oda1VsuIVtixgfhT+vDdzaHDizeIrLEHMevOPWQ4HvTfvT00lz
	 BzTB0t3acHq3myg6QWF14HBJk7qH1rFiH8BQe1wLDLmiaMy44jb+2a07mBHnuGymWu
	 pI4ALeynWVgVXb5wzrvhIxr6Hn49gML5YSEkYVXiua/s0Jg1PVxElIzbPxWDhPrgf6
	 Aentc6+VP+wiHGipekLvn4M7DdQ7yruHSNnQiaq2JO6t1VUZZwvPbsxBpLAVXjxcQe
	 JFQ8zieAKRxRdeLLHQd6HWesWaFbarEtkzg1O9ShgwogRbbxkbCXecWP004QYtKjK+
	 rOyjrWHKA3afA==
Date: Tue, 22 Apr 2025 13:12:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <JBeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] xen: Use asm inline when available for alternatives
In-Reply-To: <60e776075c8861f825ef2589b9053792@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2504221311050.785180@ubuntu-linux-20-04-desktop>
References: <20250422113957.1289290-1-andrew.cooper3@citrix.com> <alpine.DEB.2.22.394.2504221244360.785180@ubuntu-linux-20-04-desktop> <0570b0ed-607c-49fa-b82e-29ffac60f873@citrix.com> <alpine.DEB.2.22.394.2504221256080.785180@ubuntu-linux-20-04-desktop>
 <f315f38e20432bc9f62ae2d4b04582a4@bugseng.com> <alpine.DEB.2.22.394.2504221302120.785180@ubuntu-linux-20-04-desktop> <60e776075c8861f825ef2589b9053792@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 22 Apr 2025, Nicola Vetrini wrote:
> On 2025-04-22 22:02, Stefano Stabellini wrote:
> > On Tue, 22 Apr 2025, Nicola Vetrini wrote:
> > > On 2025-04-22 21:58, Stefano Stabellini wrote:
> > > > On Tue, 22 Apr 2025, Andrew Cooper wrote:
> > > > > On 22/04/2025 8:46 pm, Stefano Stabellini wrote:
> > > > > > On Tue, 22 Apr 2025, Andrew Cooper wrote:
> > > > > >> Compilers estimate the size of an asm() block for inlining
> > > purposes.
> > > > > >>
> > > > > >> Constructs such as ALTERNATIVE appear large due to the metadata,
> > > > > depsite often
> > > > > >> only being a handful of instructions.  asm inline() overrides the
> > > > > estimation
> > > > > >> to identify the block as being small.
> > > > > >>
> > > > > >> This has a substantial impact on inlining decisions, expected to be
> > > for
> > > > > the
> > > > > >> better given that the compiler has a more accurate picture to work
> > > > > with.
> > > > > >>
> > > > > >> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > > > > > Hi Andrew,
> > > > > >
> > > > > > If we are going to use asm_inline, please add a note to
> > > > > > docs/misra/C-language-toolchain.rst where we keep record of all the
> > > > > > language extensions we use.
> > > > >
> > > > > It's just asm(), and that's already discussed.
> > > > >
> > > > > I'm not sure what else you think is warranted.
> > > >
> > > >
> > > > If it is just asm() then there is nothing to do. We only need to
> > > > document extensions to the language, nothing else. Many of them are
> > > > already documented under docs/misra/C-language-toolchain.rst (see for
> > > > instance asm and __asm__).
> > > >
> > > > I see the critical part of the patch for this question is:
> > > >
> > > > > +#if CONFIG_CC_HAS_ASM_INLINE
> > > > > +# define asm_inline asm __inline
> > > > > +#else
> > > > > +# define asm_inline asm
> > > > > +#endif
> > > >
> > > > it looks like __inline is an extension ?
> > > 
> > > I see. It was added to the tool configuration, but not there in the rst
> > > (__inline__ as well), hence why there are no CI failures.
> > 
> > I see __inline__|__inline in toolchain.ecl. Nicola, would you be up for
> > sending a small patch to docs/misra/C-language-toolchain.rst to add them?
> 
> Yes, no problem. I'll take the occasion to see whether there are other gaps.

Thanks!


> Perhaps there's a clever way to ensure these files do not go out of sync?

It would take a bit of work, but we could have the list of extensions in
json (like exclude-list.json or safe.json), then we could generate both
C-language-toolchain.rst and toolchain.ecl from the json file.

