Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7B27B286A
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 00:25:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610050.949278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlzQl-0007O6-CI; Thu, 28 Sep 2023 22:24:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610050.949278; Thu, 28 Sep 2023 22:24:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlzQl-0007L5-90; Thu, 28 Sep 2023 22:24:23 +0000
Received: by outflank-mailman (input) for mailman id 610050;
 Thu, 28 Sep 2023 22:24:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NjmF=FM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qlzQk-0007Kz-Cz
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 22:24:22 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c45f8f31-5e4d-11ee-878b-cb3800f73035;
 Fri, 29 Sep 2023 00:24:21 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2505861DA7;
 Thu, 28 Sep 2023 22:24:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D40EC433C8;
 Thu, 28 Sep 2023 22:24:16 +0000 (UTC)
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
X-Inumbo-ID: c45f8f31-5e4d-11ee-878b-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695939858;
	bh=H76zN8S7OvC1y7q1g6XWTHf1rNyWR18UVQ0hRqwlfNg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jyi7k4desFqjUDXcp3jNflMX33Lfc3oOUq2sbS9tR4HzIVHbkMoTnWhNPqbFBRyeC
	 42s2sssnMRi3MnX/a59ozywGBI0+07N3KhPdb6Oz5ByWteygWqbOjWiq+wUZAa0YJE
	 qoD0M2Q7xmTZVc06YXBePs989iCjq3IYb0QB+XaRRJvq1hV5k+5db4Yz0F7YzE3zTp
	 jJ8GWwe2VlR4NVbCIrjikHfLRTYoGqUAvVacazWXhciwaeLgS6TBdItLVnZ8iP+iwO
	 ThVPQDnr8wTBfXqHn/4Sj30Q/NmeArIgmC3+x/CGcZJgi364rCjFaieS5bZGX3Znai
	 NX0X1WzcYpelg==
Date: Thu, 28 Sep 2023 15:24:15 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Simone Ballarin <simone.ballarin@bugseng.com>, consulting@bugseng.com, 
    sstabellini@kernel.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2 00/10] address violations of MISRA C:2012 Directive
 4.10
In-Reply-To: <f0cd8400-5e37-6704-75ce-d965540bc2b7@suse.com>
Message-ID: <alpine.DEB.2.22.394.2309281515570.1996340@ubuntu-linux-20-04-desktop>
References: <cover.1694510856.git.simone.ballarin@bugseng.com> <b62205a1-885b-ea4e-3ce2-7ad58cfc938d@suse.com> <f1759081-eb18-4597-82b6-d7d9ee1754ab@bugseng.com> <e0ff3307-99ee-7740-bc5f-52dd7f589057@suse.com> <c2b10554-673c-4452-a35c-0d2f314e8ad2@bugseng.com>
 <f0cd8400-5e37-6704-75ce-d965540bc2b7@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 28 Sep 2023, Jan Beulich wrote:
> On 28.09.2023 15:17, Simone Ballarin wrote:
> > On 28/09/23 14:51, Jan Beulich wrote:
> >> On 28.09.2023 14:46, Simone Ballarin wrote:
> >>> On 13/09/23 10:02, Jan Beulich wrote:
> >>>> On 12.09.2023 11:36, Simone Ballarin wrote:
> >>>>> Add or move inclusion guards to address violations of
> >>>>> MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
> >>>>> to prevent the contents of a header file being included more than
> >>>>> once").
> >>>>>
> >>>>> Inclusion guards must appear at the beginning of the headers
> >>>>> (comments are permitted anywhere) and the #if directive cannot
> >>>>> be used for other checks.
> >>>>>
> >>>>> Simone Ballarin (10):
> >>>>>     misra: add deviation for headers that explicitly avoid guards
> >>>>>     misra: modify deviations for empty and generated headers
> >>>>>     misra: add deviations for direct inclusion guards
> >>>>>     xen/arm: address violations of MISRA C:2012 Directive 4.10
> >>>>>     xen/x86: address violations of MISRA C:2012 Directive 4.10
> >>>>>     x86/EFI: address violations of MISRA C:2012 Directive 4.10
> >>>>>     xen/common: address violations of MISRA C:2012 Directive 4.10
> >>>>>     xen/efi: address violations of MISRA C:2012 Directive 4.10
> >>>>>     xen: address violations of MISRA C:2012 Directive 4.10
> >>>>>     x86/asm: address violations of MISRA C:2012 Directive 4.10
> >>>>
> >>>> Just to mention it here again for the entire series, seeing that despite
> >>>> my earlier comments to this effect a few R-b have arrived: If private
> >>>> headers need to gain guards (for, imo, no real reason), we first need to
> >>>> settle on a naming scheme for these guards, such that guards used in
> >>>> private headers aren't at risk of colliding with ones used headers
> >>>> living in one of the usual include directories. IOW imo fair parts of
> >>>> this series may need redoing.
> >>>>
> >>>> Jan
> >>>>
> >>>
> >>> My proposal is:
> >>> - the relative path from "xen/arch" for files in this directory
> >>>     (i.e. X86_X86_X86_MMCONFIG_H for "xen/arch/x86/x86_64/mmconfig.h";
> >>
> >> X86_X86_64_MMCONFIG_H that is?
> >>
> >> Yet then this scheme won't hold for xen/arch/include/asm/... ? It's also
> >> not clear whether you're deliberately omitting leading/trailing underscores
> >> here, which may be a way to distinguish private from global headers.
> > 
> > Each name that begins with a double or single underscore (__, _) 
> > followed by an uppercase letter is reserved. Using a reserved identifier 
> > is an undefined-b.
> > 
> > I would be better to avoid them.
> 
> I'm with you about avoiding them, except that we use such all over the
> place. Taking this together with ...
> 
> >>> - for the others, the entire path.
> >>
> >> What exactly is "entire" here?
> > 
> > Let me try again.
> > 
> > If we are inside xen/arch the relative path starting from this directory:
> >    | xen/arch/x86/include/asm/compat.h
> >    X86_INCLUDE_ASM_COMPAT_H
> > 
> > For xen/include, the current convention.
> > Maybe, in a future patch, we can consider removing the leading _.
> > 
> > For the others, the relative path after xen:
> >    | xen/common/efi/efi.h
> >    COMMON_EFI_EFI_H
> 
> ... this you're effectively suggesting to change all existing guards.
> That's an option, but likely not a preferred one. Personally I'd prefer
> if in particular the headers in xen/include/ and in xen/arch/*include/
> didn't needlessly include _INCLUDE_ in their guard names.
> 
> I'm really curious what others think.

If it is a MISRA requirement to avoid names that begin with single or
double underscore, then I think we should bite the bullet and change all
guard names, taking the opportunity to make them consistent.

If it is not a MISRA requirement, then I think we should go for the path
of least resistance and try to make the smallest amount of changes
overall, which seems to be:

- for xen/include/blah.h, __BLAH_H__
- for xen/arch/arm/asm/include/blah.h, __ASM_ARM_BLAH_H__
- for xen/arch/x86/asm/include/blah.h, it is far less consistent, maybe __ASM_X86_BLAH_H__ ?

