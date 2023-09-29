Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3147B3B57
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 22:42:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610703.950197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmKIl-00047b-AJ; Fri, 29 Sep 2023 20:41:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610703.950197; Fri, 29 Sep 2023 20:41:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmKIl-00044o-7O; Fri, 29 Sep 2023 20:41:31 +0000
Received: by outflank-mailman (input) for mailman id 610703;
 Fri, 29 Sep 2023 20:41:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/xMB=FN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qmKIk-00044d-4s
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 20:41:30 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f989d3c-5f08-11ee-9b0d-b553b5be7939;
 Fri, 29 Sep 2023 22:41:27 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3A8D561F9E;
 Fri, 29 Sep 2023 20:41:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D4CBC433C7;
 Fri, 29 Sep 2023 20:41:24 +0000 (UTC)
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
X-Inumbo-ID: 8f989d3c-5f08-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696020085;
	bh=dzhZ1mSCmrLGt1p3geeq1DE/AqRgIGGPUC20hGh9mjg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dwkbbKvMaIeeORe7fj39Aek332vZibWSpdFIIiA0Cy5VERaedMeEF1hsc5mvHgj5p
	 soIvAw7Ad1YQ9IMGuky92O2sumtCisRcdHbMHhKvorIEWc19FIrNoeuWnRxYaGF6eD
	 T3qObMDz42/KjmTFmPT4aaRxF33wiIaAl12T52qW9i+k4UELozVwtrpfubyPbH3s9d
	 SxdEHzeCygKcQnRG5IjO4Hb7I2NcaSlYhwf8P5rw31y6P2y2JG/yYVaBV2hUjwsGD8
	 R7RY5Sqa1MmL9U93pSA0hBCZEpANIdcevVHCi/0sRen1Rz8H+0UR+4cLVQZr3qYLId
	 MCNoeWZAf2FLQ==
Date: Fri, 29 Sep 2023 13:41:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <jbeulich@suse.com>, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    xen-devel@lists.xenproject.org, roberto.bagnara@bugseng.com
Subject: Re: [XEN PATCH v2 00/10] address violations of MISRA C:2012 Directive
 4.10
In-Reply-To: <5d42e276-67ca-4f56-910f-d2c95a91de34@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2309291339310.2348112@ubuntu-linux-20-04-desktop>
References: <cover.1694510856.git.simone.ballarin@bugseng.com> <b62205a1-885b-ea4e-3ce2-7ad58cfc938d@suse.com> <f1759081-eb18-4597-82b6-d7d9ee1754ab@bugseng.com> <e0ff3307-99ee-7740-bc5f-52dd7f589057@suse.com> <c2b10554-673c-4452-a35c-0d2f314e8ad2@bugseng.com>
 <f0cd8400-5e37-6704-75ce-d965540bc2b7@suse.com> <alpine.DEB.2.22.394.2309281515570.1996340@ubuntu-linux-20-04-desktop> <5d42e276-67ca-4f56-910f-d2c95a91de34@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 29 Sep 2023, Simone Ballarin wrote:
> On 29/09/23 00:24, Stefano Stabellini wrote:
> > On Thu, 28 Sep 2023, Jan Beulich wrote:
> > > On 28.09.2023 15:17, Simone Ballarin wrote:
> > > > On 28/09/23 14:51, Jan Beulich wrote:
> > > > > On 28.09.2023 14:46, Simone Ballarin wrote:
> > > > > > On 13/09/23 10:02, Jan Beulich wrote:
> > > > > > > On 12.09.2023 11:36, Simone Ballarin wrote:
> > > > > > > > Add or move inclusion guards to address violations of
> > > > > > > > MISRA C:2012 Directive 4.10 ("Precautions shall be taken in
> > > > > > > > order
> > > > > > > > to prevent the contents of a header file being included more
> > > > > > > > than
> > > > > > > > once").
> > > > > > > > 
> > > > > > > > Inclusion guards must appear at the beginning of the headers
> > > > > > > > (comments are permitted anywhere) and the #if directive cannot
> > > > > > > > be used for other checks.
> > > > > > > > 
> > > > > > > > Simone Ballarin (10):
> > > > > > > >      misra: add deviation for headers that explicitly avoid
> > > > > > > > guards
> > > > > > > >      misra: modify deviations for empty and generated headers
> > > > > > > >      misra: add deviations for direct inclusion guards
> > > > > > > >      xen/arm: address violations of MISRA C:2012 Directive 4.10
> > > > > > > >      xen/x86: address violations of MISRA C:2012 Directive 4.10
> > > > > > > >      x86/EFI: address violations of MISRA C:2012 Directive 4.10
> > > > > > > >      xen/common: address violations of MISRA C:2012 Directive
> > > > > > > > 4.10
> > > > > > > >      xen/efi: address violations of MISRA C:2012 Directive 4.10
> > > > > > > >      xen: address violations of MISRA C:2012 Directive 4.10
> > > > > > > >      x86/asm: address violations of MISRA C:2012 Directive 4.10
> > > > > > > 
> > > > > > > Just to mention it here again for the entire series, seeing that
> > > > > > > despite
> > > > > > > my earlier comments to this effect a few R-b have arrived: If
> > > > > > > private
> > > > > > > headers need to gain guards (for, imo, no real reason), we first
> > > > > > > need to
> > > > > > > settle on a naming scheme for these guards, such that guards used
> > > > > > > in
> > > > > > > private headers aren't at risk of colliding with ones used headers
> > > > > > > living in one of the usual include directories. IOW imo fair parts
> > > > > > > of
> > > > > > > this series may need redoing.
> > > > > > > 
> > > > > > > Jan
> > > > > > > 
> > > > > > 
> > > > > > My proposal is:
> > > > > > - the relative path from "xen/arch" for files in this directory
> > > > > >      (i.e. X86_X86_X86_MMCONFIG_H for
> > > > > > "xen/arch/x86/x86_64/mmconfig.h";
> > > > > 
> > > > > X86_X86_64_MMCONFIG_H that is?
> > > > > 
> > > > > Yet then this scheme won't hold for xen/arch/include/asm/... ? It's
> > > > > also
> > > > > not clear whether you're deliberately omitting leading/trailing
> > > > > underscores
> > > > > here, which may be a way to distinguish private from global headers.
> > > > 
> > > > Each name that begins with a double or single underscore (__, _)
> > > > followed by an uppercase letter is reserved. Using a reserved identifier
> > > > is an undefined-b.
> > > > 
> > > > I would be better to avoid them.
> > > 
> > > I'm with you about avoiding them, except that we use such all over the
> > > place. Taking this together with ...
> > > 
> > > > > > - for the others, the entire path.
> > > > > 
> > > > > What exactly is "entire" here?
> > > > 
> > > > Let me try again.
> > > > 
> > > > If we are inside xen/arch the relative path starting from this
> > > > directory:
> > > >     | xen/arch/x86/include/asm/compat.h
> > > >     X86_INCLUDE_ASM_COMPAT_H
> > > > 
> > > > For xen/include, the current convention.
> > > > Maybe, in a future patch, we can consider removing the leading _.
> > > > 
> > > > For the others, the relative path after xen:
> > > >     | xen/common/efi/efi.h
> > > >     COMMON_EFI_EFI_H
> > > 
> > > ... this you're effectively suggesting to change all existing guards.
> > > That's an option, but likely not a preferred one. Personally I'd prefer
> > > if in particular the headers in xen/include/ and in xen/arch/*include/
> > > didn't needlessly include _INCLUDE_ in their guard names.
> > > 
> > > I'm really curious what others think.
> > 
> > If it is a MISRA requirement to avoid names that begin with single or
> > double underscore, then I think we should bite the bullet and change all
> > guard names, taking the opportunity to make them consistent.
> > 
> 
> Yes, it is.
> 
> Rule 21.2, found in Set3, addresses this Undef.-b.:
> A reserved identifier or reserved macro name shall not be declared.

OK. Adding Roberto in CC. I think we should discuss 21.2 during the next
MISRA C meeting. If 21.2 is accepted then we should go down the route of
a global rename here which would also benefit consistency across the
codebase.


> > If it is not a MISRA requirement, then I think we should go for the path
> > of least resistance and try to make the smallest amount of changes
> > overall, which seems to be:
> > 
> > - for xen/include/blah.h, __BLAH_H__
> > - for xen/arch/arm/asm/include/blah.h, __ASM_ARM_BLAH_H__
> > - for xen/arch/x86/asm/include/blah.h, it is far less consistent, maybe
> > __ASM_X86_BLAH_H__ ?


