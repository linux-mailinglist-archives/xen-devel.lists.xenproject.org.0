Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C06EEA9766B
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 22:03:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963527.1354508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7JpW-0005En-RE; Tue, 22 Apr 2025 20:02:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963527.1354508; Tue, 22 Apr 2025 20:02:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7JpW-0005CH-NV; Tue, 22 Apr 2025 20:02:54 +0000
Received: by outflank-mailman (input) for mailman id 963527;
 Tue, 22 Apr 2025 20:02:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eQRL=XI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u7JpV-0005A4-GD
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 20:02:53 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c58ae1e4-1fb4-11f0-9eb0-5ba50f476ded;
 Tue, 22 Apr 2025 22:02:52 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7606BA49D0D;
 Tue, 22 Apr 2025 19:57:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 004B7C4CEE9;
 Tue, 22 Apr 2025 20:02:49 +0000 (UTC)
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
X-Inumbo-ID: c58ae1e4-1fb4-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745352171;
	bh=cu24jOGkNDFbCvPg8/QFPz9ipzAtDZKuFe9GQz98ZdQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Yds8uBl+iTezUoy/p7ITxkgOfleBTXBHI03Fviw9tIVi/qtb1v6bpM+NnSqOPU+FM
	 ftZAZa/Sxr2k6KVPzlAWf3Uxdz0jwcJxctn/EkCN+xDBiulPvyarwHuK6k9Ob/iuSr
	 R3g6yZH+Fyhnrq9s4fR2H2Imo6YcDz1fJue0my31/9uA3VC6kEPmK6/NyVAvEM8EnX
	 aiyJgTNBrcPvoj/AJZqaXg+4qLz5aaq272M3STB/uHZLKxQ7E99mJjfazlGHrjPkIu
	 nWi2GCCvN5JjbUKk6bXoxDhYMAjfCMWtgXnechuinS2IktsjsOVRrBrZmS6RDg9Ct5
	 +/u+9CcWEuHOg==
Date: Tue, 22 Apr 2025 13:02:49 -0700 (PDT)
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
In-Reply-To: <f315f38e20432bc9f62ae2d4b04582a4@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2504221302120.785180@ubuntu-linux-20-04-desktop>
References: <20250422113957.1289290-1-andrew.cooper3@citrix.com> <alpine.DEB.2.22.394.2504221244360.785180@ubuntu-linux-20-04-desktop> <0570b0ed-607c-49fa-b82e-29ffac60f873@citrix.com> <alpine.DEB.2.22.394.2504221256080.785180@ubuntu-linux-20-04-desktop>
 <f315f38e20432bc9f62ae2d4b04582a4@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 22 Apr 2025, Nicola Vetrini wrote:
> On 2025-04-22 21:58, Stefano Stabellini wrote:
> > On Tue, 22 Apr 2025, Andrew Cooper wrote:
> > > On 22/04/2025 8:46 pm, Stefano Stabellini wrote:
> > > > On Tue, 22 Apr 2025, Andrew Cooper wrote:
> > > >> Compilers estimate the size of an asm() block for inlining purposes.
> > > >>
> > > >> Constructs such as ALTERNATIVE appear large due to the metadata,
> > > depsite often
> > > >> only being a handful of instructions.  asm inline() overrides the
> > > estimation
> > > >> to identify the block as being small.
> > > >>
> > > >> This has a substantial impact on inlining decisions, expected to be for
> > > the
> > > >> better given that the compiler has a more accurate picture to work
> > > with.
> > > >>
> > > >> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > > > Hi Andrew,
> > > >
> > > > If we are going to use asm_inline, please add a note to
> > > > docs/misra/C-language-toolchain.rst where we keep record of all the
> > > > language extensions we use.
> > > 
> > > It's just asm(), and that's already discussed.
> > > 
> > > I'm not sure what else you think is warranted.
> > 
> > 
> > If it is just asm() then there is nothing to do. We only need to
> > document extensions to the language, nothing else. Many of them are
> > already documented under docs/misra/C-language-toolchain.rst (see for
> > instance asm and __asm__).
> > 
> > I see the critical part of the patch for this question is:
> > 
> > > +#if CONFIG_CC_HAS_ASM_INLINE
> > > +# define asm_inline asm __inline
> > > +#else
> > > +# define asm_inline asm
> > > +#endif
> > 
> > it looks like __inline is an extension ?
> 
> I see. It was added to the tool configuration, but not there in the rst
> (__inline__ as well), hence why there are no CI failures.

I see __inline__|__inline in toolchain.ecl. Nicola, would you be up for
sending a small patch to docs/misra/C-language-toolchain.rst to add them?

