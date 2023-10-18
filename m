Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B57097CD16F
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 02:49:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618377.961944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsujU-0001Tz-4I; Wed, 18 Oct 2023 00:48:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618377.961944; Wed, 18 Oct 2023 00:48:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsujU-0001RM-16; Wed, 18 Oct 2023 00:48:20 +0000
Received: by outflank-mailman (input) for mailman id 618377;
 Wed, 18 Oct 2023 00:48:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UegX=GA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qsujS-0001RB-JK
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 00:48:18 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0549852f-6d50-11ee-98d4-6d05b1d4d9a1;
 Wed, 18 Oct 2023 02:48:16 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 08691CE2296;
 Wed, 18 Oct 2023 00:48:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8306AC433C7;
 Wed, 18 Oct 2023 00:48:07 +0000 (UTC)
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
X-Inumbo-ID: 0549852f-6d50-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697590089;
	bh=o8fpQYGn80s5Uqok39gE8/xP7F35J6fIpMzhZ1BRG+k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=iYgQOLRdantHZKfXnA8jTBCvuGyKmMK5PAar/0kek1KYyP5CHiexeXsSdsO3d5KUb
	 rhr5yQAAst9dDM6gupTX1SM21t53etMFlUgve9vXqw4J7JOIWnA/FAPHoGz6iret6c
	 5iYfzn+q6cIgQHVReonh2+3/d/vZDv2IqMXo6sEOxkMBiA27esspziIbg0S8/jj5YB
	 VSWtkeTLJemdKB9guhZAHnvopUFWIMrNqiSmYbxBP4ANJqoPvZcBBP2UE7F5sYI1mq
	 yMwpxs6l3fJ7LD4sszaf+sH86/56wHz8R60hn16iUraqKQd826iO2crgUE2CyccPa0
	 D/OIKldt9MZuw==
Date: Tue, 17 Oct 2023 17:48:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Simone Ballarin <simone.ballarin@bugseng.com>, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2 00/10] address violations of MISRA C:2012 Directive
 4.10
In-Reply-To: <725f5193-c8d3-1bc8-cd62-2a2b1b5ecc01@suse.com>
Message-ID: <alpine.DEB.2.22.394.2310171709310.965337@ubuntu-linux-20-04-desktop>
References: <cover.1694510856.git.simone.ballarin@bugseng.com> <b62205a1-885b-ea4e-3ce2-7ad58cfc938d@suse.com> <f1759081-eb18-4597-82b6-d7d9ee1754ab@bugseng.com> <e0ff3307-99ee-7740-bc5f-52dd7f589057@suse.com> <c2b10554-673c-4452-a35c-0d2f314e8ad2@bugseng.com>
 <f0cd8400-5e37-6704-75ce-d965540bc2b7@suse.com> <alpine.DEB.2.22.394.2309281515570.1996340@ubuntu-linux-20-04-desktop> <725f5193-c8d3-1bc8-cd62-2a2b1b5ecc01@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 16 Oct 2023, Jan Beulich wrote:
> On 29.09.2023 00:24, Stefano Stabellini wrote:
> > On Thu, 28 Sep 2023, Jan Beulich wrote:
> >> On 28.09.2023 15:17, Simone Ballarin wrote:
> >>> On 28/09/23 14:51, Jan Beulich wrote:
> >>>> On 28.09.2023 14:46, Simone Ballarin wrote:
> >>>>> On 13/09/23 10:02, Jan Beulich wrote:
> >>>>>> On 12.09.2023 11:36, Simone Ballarin wrote:
> >>>>>>> Add or move inclusion guards to address violations of
> >>>>>>> MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
> >>>>>>> to prevent the contents of a header file being included more than
> >>>>>>> once").
> >>>>>>>
> >>>>>>> Inclusion guards must appear at the beginning of the headers
> >>>>>>> (comments are permitted anywhere) and the #if directive cannot
> >>>>>>> be used for other checks.
> >>>>>>>
> >>>>>>> Simone Ballarin (10):
> >>>>>>>     misra: add deviation for headers that explicitly avoid guards
> >>>>>>>     misra: modify deviations for empty and generated headers
> >>>>>>>     misra: add deviations for direct inclusion guards
> >>>>>>>     xen/arm: address violations of MISRA C:2012 Directive 4.10
> >>>>>>>     xen/x86: address violations of MISRA C:2012 Directive 4.10
> >>>>>>>     x86/EFI: address violations of MISRA C:2012 Directive 4.10
> >>>>>>>     xen/common: address violations of MISRA C:2012 Directive 4.10
> >>>>>>>     xen/efi: address violations of MISRA C:2012 Directive 4.10
> >>>>>>>     xen: address violations of MISRA C:2012 Directive 4.10
> >>>>>>>     x86/asm: address violations of MISRA C:2012 Directive 4.10
> >>>>>>
> >>>>>> Just to mention it here again for the entire series, seeing that despite
> >>>>>> my earlier comments to this effect a few R-b have arrived: If private
> >>>>>> headers need to gain guards (for, imo, no real reason), we first need to
> >>>>>> settle on a naming scheme for these guards, such that guards used in
> >>>>>> private headers aren't at risk of colliding with ones used headers
> >>>>>> living in one of the usual include directories. IOW imo fair parts of
> >>>>>> this series may need redoing.
> >>>>>>
> >>>>>> Jan
> >>>>>>
> >>>>>
> >>>>> My proposal is:
> >>>>> - the relative path from "xen/arch" for files in this directory
> >>>>>     (i.e. X86_X86_X86_MMCONFIG_H for "xen/arch/x86/x86_64/mmconfig.h";
> >>>>
> >>>> X86_X86_64_MMCONFIG_H that is?
> >>>>
> >>>> Yet then this scheme won't hold for xen/arch/include/asm/... ? It's also
> >>>> not clear whether you're deliberately omitting leading/trailing underscores
> >>>> here, which may be a way to distinguish private from global headers.
> >>>
> >>> Each name that begins with a double or single underscore (__, _) 
> >>> followed by an uppercase letter is reserved. Using a reserved identifier 
> >>> is an undefined-b.
> >>>
> >>> I would be better to avoid them.
> >>
> >> I'm with you about avoiding them, except that we use such all over the
> >> place. Taking this together with ...
> >>
> >>>>> - for the others, the entire path.
> >>>>
> >>>> What exactly is "entire" here?
> >>>
> >>> Let me try again.
> >>>
> >>> If we are inside xen/arch the relative path starting from this directory:
> >>>    | xen/arch/x86/include/asm/compat.h
> >>>    X86_INCLUDE_ASM_COMPAT_H
> >>>
> >>> For xen/include, the current convention.
> >>> Maybe, in a future patch, we can consider removing the leading _.
> >>>
> >>> For the others, the relative path after xen:
> >>>    | xen/common/efi/efi.h
> >>>    COMMON_EFI_EFI_H
> >>
> >> ... this you're effectively suggesting to change all existing guards.
> >> That's an option, but likely not a preferred one. Personally I'd prefer
> >> if in particular the headers in xen/include/ and in xen/arch/*include/
> >> didn't needlessly include _INCLUDE_ in their guard names.
> >>
> >> I'm really curious what others think.
> > 
> > If it is a MISRA requirement to avoid names that begin with single or
> > double underscore, then I think we should bite the bullet and change all
> > guard names, taking the opportunity to make them consistent.
> 
> Note how below you still suggest names with two leading underscores. I'm
> afraid ...

Sorry for the confusion. My example was an example of "path of least
resistance" trying to extrapolate the existing patterns. I was not
trying also to comply with the other MISRA rule about leading
underscores.

By "path of least resistance" I meant the smallest amount of work to
address Directive 4.10. As opposed to the "bite the bullet" approach
where we are willing to change everything to be consistent and also
address Directive 4.10.

So in my example of "path of least resistance" I kept the leading
underscores to minimize changes to the existing codebase.

The result of the MISRA C discussion this morning was that in general we
are *not* going to remove leading underscores everywhere, although
in general we would also like to avoid them when it can be done without
harming readability.

Now what does it mean for this patch series? See below for a proposal.


> > If it is not a MISRA requirement, then I think we should go for the path
> > of least resistance and try to make the smallest amount of changes
> > overall, which seems to be:
> 
> ... "least resistance" won't gain us much, as hardly any guards don't
> start with an underscore.
> 
> > - for xen/include/blah.h, __BLAH_H__
> > - for xen/arch/arm/asm/include/blah.h, __ASM_ARM_BLAH_H__
> > - for xen/arch/x86/asm/include/blah.h, it is far less consistent, maybe __ASM_X86_BLAH_H__ ?
> 
> There are no headers in xen/include/. For (e.g.) xen/include/xen/ we
> may go with XEN_BLAH_H; whether ASM prefixes are needed I'm not sure;
> we could go with just ARM_BLAH_H and X86_BLAH_H?
> 
> The primary question though is (imo) how to deal with private headers,
> such that the risk of name collisions is as small as possible.

Looking at concrete examples under xen/include/xen:
xen/include/xen/mm.h __XEN_MM_H__
xen/include/xen/dm.h __XEN_DM_H__
xen/include/xen/hypfs.h __XEN_HYPFS_H__

So I think we should do for consistency:
xen/include/xen/blah.h __XEN_BLAH_H__

Even if we know the leading underscore are undesirable, in this case I
would prefer consistency.



On the other hand looking at ARM examples:
xen/arch/arm/include/asm/traps.h __ASM_ARM_TRAPS__
xen/arch/arm/include/asm/time.h __ARM_TIME_H__
xen/arch/arm/include/asm/sysregs.h __ASM_ARM_SYSREGS_H
xen/arch/arm/include/asm/io.h _ASM_IO_H

And also looking at x86 examples:
xen/arch/x86/include/asm/paging.h _XEN_PAGING_H
xen/arch/x86/include/asm/p2m.h _XEN_ASM_X86_P2M_H
xen/arch/x86/include/asm/io.h _ASM_IO_H

Thet are very inconsistent.


So for ARM and X86 headers I think we are free to pick anything we want,
including your suggested ARM_BLAH_H and X86_BLAH_H. Those are fine by
me.


For private headers such as:
xen/arch/arm/vuart.h __ARCH_ARM_VUART_H__
xen/arch/arm/decode.h __ARCH_ARM_DECODE_H_
xen/arch/x86/mm/p2m.h __ARCH_MM_P2M_H__
xen/arch/x86/hvm/viridian/private.h X86_HVM_VIRIDIAN_PRIVATE_H

More similar but still inconsistent. I would go with ARCH_ARM_BLAH_H and
ARCH_X86_BLAH_H for new headers.

What do you think?

