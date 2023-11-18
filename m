Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E709B7EFD38
	for <lists+xen-devel@lfdr.de>; Sat, 18 Nov 2023 03:40:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635491.991426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4BFv-0000G0-Nz; Sat, 18 Nov 2023 02:40:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635491.991426; Sat, 18 Nov 2023 02:40:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4BFv-0000EJ-LN; Sat, 18 Nov 2023 02:40:23 +0000
Received: by outflank-mailman (input) for mailman id 635491;
 Sat, 18 Nov 2023 02:40:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W+gg=G7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r4BFu-0000ED-CH
 for xen-devel@lists.xenproject.org; Sat, 18 Nov 2023 02:40:22 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0a6abcb-85bb-11ee-98dc-6d05b1d4d9a1;
 Sat, 18 Nov 2023 03:40:21 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0F1D861DF4;
 Sat, 18 Nov 2023 02:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2D93C433C7;
 Sat, 18 Nov 2023 02:40:15 +0000 (UTC)
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
X-Inumbo-ID: d0a6abcb-85bb-11ee-98dc-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700275217;
	bh=HoocNUGpO15Q5ncZRkpP5DTUwpO5G0onA0P/J2Vx7vI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=byTurhODWZC8lL/Qr1HokKngDJV1R5wwCiTXLDjRfNv9WhF95PRKywdj29d1eyGOy
	 o73+TP3dYqbHvGJbKks7KWF9KiRojJQBmszWvRNGEmoWAlfa+hxd19BabUIyCXf0H2
	 bWtHONGtcLnJ7+bH2TjLRO/a8uQJFI8aCOZoXKIpwPpUz2Len6F7wpKW+Dg/ox1d69
	 uTmB5rcOfXV0degpeqVFh2qYMqu/p2ytmDz25clim2rnZvQfv9quKIq2ylkPckN1SJ
	 Ztymdq0iwM2kx+nA05Gjy3Cx1IAFCqKbkz1krz75EJPZjgbpR6sNyIUyly6yx1AoYI
	 GmZS8ab+fL9Bg==
Date: Fri, 17 Nov 2023 18:40:13 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, consulting@bugseng.com, 
    Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
    Shawn Anastasio <sanastasio@raptorengineering.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Henry Wang <henry.wang@arm.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v3] xen/mm: address violations of MISRA C:2012 Rules
 8.2 and 8.3
In-Reply-To: <a665cac0-93f3-4fbb-a1bc-104bc36fbf61@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2311171840030.773207@ubuntu-linux-20-04-desktop>
References: <eedcfeb8d1c81527b7e18fcc0eca252577f00035.1696344012.git.federico.serafini@bugseng.com> <d7cd7a02-b960-384e-4af2-f70b425e5ad1@suse.com> <alpine.DEB.2.22.394.2310181543030.965337@ubuntu-linux-20-04-desktop> <30e35f13-d2d0-eaf3-9660-c508655b84ce@suse.com>
 <alpine.DEB.2.22.394.2310190921020.1945130@ubuntu-linux-20-04-desktop> <965cdb62-1b96-c8a1-733b-ad006bb2edc6@suse.com> <a665cac0-93f3-4fbb-a1bc-104bc36fbf61@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 17 Nov 2023, Federico Serafini wrote:
> On 20/10/23 08:35, Jan Beulich wrote:
> > On 19.10.2023 18:26, Stefano Stabellini wrote:
> > > On Thu, 19 Oct 2023, Jan Beulich wrote:
> > > > On 19.10.2023 00:43, Stefano Stabellini wrote:
> > > > > On Mon, 16 Oct 2023, Jan Beulich wrote:
> > > > > > On 03.10.2023 17:24, Federico Serafini wrote:
> > > > > > > --- a/xen/arch/x86/mm.c
> > > > > > > +++ b/xen/arch/x86/mm.c
> > > > > > > @@ -5901,17 +5901,17 @@ int destroy_xen_mappings(unsigned long s,
> > > > > > > unsigned long e)
> > > > > > >    * a problem.
> > > > > > >    */
> > > > > > >   void init_or_livepatch modify_xen_mappings_lite(
> > > > > > > -    unsigned long s, unsigned long e, unsigned int _nf)
> > > > > > > +    unsigned long s, unsigned long e, unsigned int nf)
> > > > > > >   {
> > > > > > > -    unsigned long v = s, fm, nf;
> > > > > > > +    unsigned long v = s, fm, flags;
> > > > > > 
> > > > > > While it looks correct, I consider this an unacceptably dangerous
> > > > > > change: What if by the time this is to be committed some new use of
> > > > > > the local "nf" appears, without resulting in fuzz while applying the
> > > > > > patch? Imo this needs doing in two steps: First nf -> flags, then
> > > > > > _nf -> nf.
> > > > > 
> > > > > Wouldn't it be sufficient for the committer to pay special attention
> > > > > when committing this patch? We are in code freeze anyway, the rate of
> > > > > changes affecting staging is low.
> > > > 
> > > > Any kind of risk excludes a patch from being a 4.18 candidate, imo.
> > > 
> > > I agree on that. I think it is best to commit it for 4.19 when the tree
> > > opens.
> > > 
> > > 
> > > > That was the case in early RCs already, and is even more so now. Paying
> > > > special attention is generally a possibility, yet may I remind you that
> > > > committing in general is intended to be a purely mechanical operation?
> > > 
> > > Sure, and I am not asking for a general process change. I am only
> > > suggesting that this specific concern on this patch is best solved in
> > > the simplest way: by a committer making sure the patch is correct on
> > > commit. It is meant to save time for everyone.
> > > 
> > > Jan, if you are OK with it, we could just trust you to commit it the
> > > right away as the earliest opportunity.
> > 
> > If you can get Andrew or Roger to ack this patch in its present shape,
> > I won't stand in the way. I'm not going to ack the change without the
> > indicated split.
> 
> I'll propose a new patch series where changes are splitted as indicated.
> I also noticed a discrepancy between Arm and x86 in the name of the
> last parameter of xenmem_add_to_physmap_one().
> Do you have any suggestions about how to solve it?
> If we reach an agreement, then I can put the changes related to the mm module
> in a single patch.

I think it should be "gfn"

