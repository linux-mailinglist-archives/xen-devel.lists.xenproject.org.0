Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 543807D4138
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 22:47:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621603.968220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qv1pP-0008Kf-Tj; Mon, 23 Oct 2023 20:47:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621603.968220; Mon, 23 Oct 2023 20:47:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qv1pP-0008Hi-R1; Mon, 23 Oct 2023 20:47:11 +0000
Received: by outflank-mailman (input) for mailman id 621603;
 Mon, 23 Oct 2023 20:47:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D6cm=GF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qv1pP-0008HZ-7T
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 20:47:11 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53dda1a9-71e5-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 22:47:08 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B7AA4CE2920;
 Mon, 23 Oct 2023 20:47:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30FDBC433C7;
 Mon, 23 Oct 2023 20:47:03 +0000 (UTC)
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
X-Inumbo-ID: 53dda1a9-71e5-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698094025;
	bh=cRIfhJcsDJAViDFOgj91MJrJNHMFi7Er78QeG3Gfqs4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tfw1j1AFhuCrB5R5GJm19DTge8iE+GLW06zpexVbur+2PelWTbuWvkVPhUPML0T9I
	 7Fukvv+gAt0wHIw5n0GR/t760/6BS5bmrfF1ei84Nosbav9/WY9jvykAoDac6A5X4d
	 8uV5TtmPcZZP9YFimcwsMsz+7MjQAXePTtRgAYlgJJ+Xr83mJLqL+5mYSW8DHuokMQ
	 uIQUCZsvb1uMGmF/syRcppGbqpYxDNfqlhU2T9Com/7i0rJNYhDhrDJmBC0uYD4LrP
	 kNN7Vue0bTzzKerEM0BIQ+ID8t6OURSrMk7tgKiNKzW/2NCaIDk67G6KSytV6j5JnG
	 +8Ic1XVpjOwVw==
Date: Mon, 23 Oct 2023 13:47:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <stefano.stabellini@amd.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
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
In-Reply-To: <36e6dd08-918c-9791-0dab-ca75d4b98d7e@suse.com>
Message-ID: <alpine.DEB.2.22.394.2310231346370.3516@ubuntu-linux-20-04-desktop>
References: <cover.1694510856.git.simone.ballarin@bugseng.com> <b62205a1-885b-ea4e-3ce2-7ad58cfc938d@suse.com> <f1759081-eb18-4597-82b6-d7d9ee1754ab@bugseng.com> <e0ff3307-99ee-7740-bc5f-52dd7f589057@suse.com> <c2b10554-673c-4452-a35c-0d2f314e8ad2@bugseng.com>
 <f0cd8400-5e37-6704-75ce-d965540bc2b7@suse.com> <alpine.DEB.2.22.394.2309281515570.1996340@ubuntu-linux-20-04-desktop> <725f5193-c8d3-1bc8-cd62-2a2b1b5ecc01@suse.com> <alpine.DEB.2.22.394.2310171709310.965337@ubuntu-linux-20-04-desktop>
 <ead797ed-84cc-fb70-5259-7e11211d049e@suse.com> <alpine.DEB.2.22.394.2310181739270.965337@ubuntu-linux-20-04-desktop> <e642bc2a-cefa-4ee4-6394-3c10102e8164@suse.com> <alpine.DEB.2.22.394.2310190915590.1945130@ubuntu-linux-20-04-desktop>
 <6374f0f4-d58f-83ca-6eb3-d5a9fcbac525@suse.com> <alpine.DEB.2.22.394.2310201622160.2356865@ubuntu-linux-20-04-desktop> <36e6dd08-918c-9791-0dab-ca75d4b98d7e@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 23 Oct 2023, Jan Beulich wrote:
> On 21.10.2023 01:26, Stefano Stabellini wrote:
> > On Fri, 20 Oct 2023, Jan Beulich wrote:
> >> On 19.10.2023 18:19, Stefano Stabellini wrote:
> >>> On Thu, 19 Oct 2023, Jan Beulich wrote:
> >>>> On 19.10.2023 02:44, Stefano Stabellini wrote:
> >>>>> On Wed, 18 Oct 2023, Jan Beulich wrote:
> >>>>>> On 18.10.2023 02:48, Stefano Stabellini wrote:
> >>>>>>> On Mon, 16 Oct 2023, Jan Beulich wrote:
> >>>>>>>> On 29.09.2023 00:24, Stefano Stabellini wrote:
> >>>>>>>>> If it is not a MISRA requirement, then I think we should go for the path
> >>>>>>>>> of least resistance and try to make the smallest amount of changes
> >>>>>>>>> overall, which seems to be:
> >>>>>>>>
> >>>>>>>> ... "least resistance" won't gain us much, as hardly any guards don't
> >>>>>>>> start with an underscore.
> >>>>>>>>
> >>>>>>>>> - for xen/include/blah.h, __BLAH_H__
> >>>>>>>>> - for xen/arch/arm/asm/include/blah.h, __ASM_ARM_BLAH_H__
> >>>>>>>>> - for xen/arch/x86/asm/include/blah.h, it is far less consistent, maybe __ASM_X86_BLAH_H__ ?
> >>>>>>>>
> >>>>>>>> There are no headers in xen/include/. For (e.g.) xen/include/xen/ we
> >>>>>>>> may go with XEN_BLAH_H; whether ASM prefixes are needed I'm not sure;
> >>>>>>>> we could go with just ARM_BLAH_H and X86_BLAH_H?
> >>>>>>>>
> >>>>>>>> The primary question though is (imo) how to deal with private headers,
> >>>>>>>> such that the risk of name collisions is as small as possible.
> >>>>>>>
> >>>>>>> Looking at concrete examples under xen/include/xen:
> >>>>>>> xen/include/xen/mm.h __XEN_MM_H__
> >>>>>>> xen/include/xen/dm.h __XEN_DM_H__
> >>>>>>> xen/include/xen/hypfs.h __XEN_HYPFS_H__
> >>>>>>>
> >>>>>>> So I think we should do for consistency:
> >>>>>>> xen/include/xen/blah.h __XEN_BLAH_H__
> >>>>>>>
> >>>>>>> Even if we know the leading underscore are undesirable, in this case I
> >>>>>>> would prefer consistency.
> >>>>>>
> >>>>>> I'm kind of okay with that. FTAOD - here and below you mean to make this
> >>>>>> one explicit first exception from the "no new leading underscores" goal,
> >>>>>> for newly added headers?
> >>>>>
> >>>>> Yes. The reason is for consistency with the existing header files.
> >>>>>
> >>>>>
> >>>>>>> On the other hand looking at ARM examples:
> >>>>>>> xen/arch/arm/include/asm/traps.h __ASM_ARM_TRAPS__
> >>>>>>> xen/arch/arm/include/asm/time.h __ARM_TIME_H__
> >>>>>>> xen/arch/arm/include/asm/sysregs.h __ASM_ARM_SYSREGS_H
> >>>>>>> xen/arch/arm/include/asm/io.h _ASM_IO_H
> >>>>>>>
> >>>>>>> And also looking at x86 examples:
> >>>>>>> xen/arch/x86/include/asm/paging.h _XEN_PAGING_H
> >>>>>>> xen/arch/x86/include/asm/p2m.h _XEN_ASM_X86_P2M_H
> >>>>>>> xen/arch/x86/include/asm/io.h _ASM_IO_H
> >>>>>>>
> >>>>>>> Thet are very inconsistent.
> >>>>>>>
> >>>>>>>
> >>>>>>> So for ARM and X86 headers I think we are free to pick anything we want,
> >>>>>>> including your suggested ARM_BLAH_H and X86_BLAH_H. Those are fine by
> >>>>>>> me.
> >>>>>>
> >>>>>> To be honest, I'd prefer a global underlying pattern, i.e. if common
> >>>>>> headers are "fine" to use leading underscores for guards, arch header
> >>>>>> should, too.
> >>>>>
> >>>>> I am OK with that too. We could go with:
> >>>>> __ASM_ARM_BLAH_H__
> >>>>> __ASM_X86_BLAH_H__
> >>>>>
> >>>>> I used "ASM" to make it easier to differentiate with the private headers
> >>>>> below. Also the version without "ASM" would work but it would only
> >>>>> differ with the private headers in terms of leading underscores. I
> >>>>> thought that also having "ASM" would help readability and help avoid
> >>>>> confusion.
> >>>>>
> >>>>>
> >>>>>>> For private headers such as:
> >>>>>>> xen/arch/arm/vuart.h __ARCH_ARM_VUART_H__
> >>>>>>> xen/arch/arm/decode.h __ARCH_ARM_DECODE_H_
> >>>>>>> xen/arch/x86/mm/p2m.h __ARCH_MM_P2M_H__
> >>>>>>> xen/arch/x86/hvm/viridian/private.h X86_HVM_VIRIDIAN_PRIVATE_H
> >>>>>>>
> >>>>>>> More similar but still inconsistent. I would go with ARCH_ARM_BLAH_H and
> >>>>>>> ARCH_X86_BLAH_H for new headers.
> >>>>>>
> >>>>>> I'm afraid I don't like this, as deeper paths would lead to unwieldy
> >>>>>> guard names. If we continue to use double-underscore prefixed names
> >>>>>> in common and arch headers, why don't we demand no leading underscores
> >>>>>> and no path-derived prefixes in private headers? That'll avoid any
> >>>>>> collisions between the two groups.
> >>>>>
> >>>>> OK, so for private headers:
> >>>>>
> >>>>> ARM_BLAH_H
> >>>>> X86_BLAH_H
> >>>>>
> >>>>> What that work for you?
> >>>>
> >>>> What are the ARM_ and X86_ prefixes supposed to indicate here? Or to ask
> >>>> differently, how would you see e.g. common/decompress.h's guard named?
> >>>
> >>> I meant that:
> >>>
> >>> xen/arch/arm/blah.h would use ARM_BLAH_H
> >>> xen/arch/x86/blah.h would use X86_BLAH_H
> >>>
> >>> You have a good question on something like xen/common/decompress.h and
> >>> xen/common/event_channel.h.  What do you think about:
> >>>
> >>> COMMON_BLAH_H, so specifically COMMON_DECOMPRESS_H
> >>>
> >>> otherwise:
> >>>
> >>> XEN_BLAH_H, so specifically XEN_DECOMPRESS_H
> >>>
> >>> I prefer COMMON_BLAH_H but I think both versions are OK.
> >>
> >> IOW you disagree with my earlier "... and no path-derived prefixes",
> >> and you prefer e.g. DRIVERS_PASSTHROUGH_VTD_DMAR_H as a consequence?
> >> FTAOD my earlier suggestion was simply based on the observation that
> >> the deeper the location of a header in the tree, the more unwieldy
> >> its guard name would end up being if path prefixes were to be used.
> > 
> > I don't have a strong opinion on "path-derived prefixes". I prefer
> > consistency and easy-to-figure-out guidelines over shortness.
> > 
> > The advantage of a path-derived prefix is that it is trivial to figure
> > out at first glance. If we can come up with another system that is also
> > easy then fine. Do you have a suggestion? If so, sorry I missed it.
> 
> Well, I kind of implicitly suggested "no path derived prefixes for private
> headers", albeit realizing that there's a chance then of guards colliding.
> I can't think of a good scheme which would fit all goals (no collisions,
> uniformity, and not unduly long).

Here I think we would benefit from a third opinion. Julien? Anyone?

