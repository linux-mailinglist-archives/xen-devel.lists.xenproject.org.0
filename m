Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 816458712CC
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 03:03:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688565.1072860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhK98-0003f7-D2; Tue, 05 Mar 2024 02:03:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688565.1072860; Tue, 05 Mar 2024 02:03:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhK98-0003e5-9w; Tue, 05 Mar 2024 02:03:10 +0000
Received: by outflank-mailman (input) for mailman id 688565;
 Tue, 05 Mar 2024 02:03:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=49dx=KL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rhK96-0003dz-Or
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 02:03:08 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81310a80-da94-11ee-a1ee-f123f15fe8a2;
 Tue, 05 Mar 2024 03:03:06 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AB5FB61323;
 Tue,  5 Mar 2024 02:03:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 971E5C433A6;
 Tue,  5 Mar 2024 02:03:02 +0000 (UTC)
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
X-Inumbo-ID: 81310a80-da94-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709604184;
	bh=44hF53+GnnUl7hHcXX4PnfbEfEIeWhtu+CufIDQem50=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=e3LYIXUHMkn7mZb3TEOgFkDzuXIQKnPZMhj+a0YTLd2iPS7tu9DUD1SGyKZXKSV06
	 goizl/Rzs6++OdGobb2m5yiAtoe6s5hlAvcvPNUcBEQr2nW9s2d72DeajtF/N+RwiP
	 fzztViUjDtESRekDqq39DIJjUwMbH3HA3UVwuBMDTpZRG77OuE3gSwBH+RLB9itRhe
	 4YMOROusnRjqg/9Ap6M0DDkren8fC3NaMKpyZq9rY2lJaXZpVNqdkNTN6JnCpJFJfD
	 t1NCUqDkG4CqGmX72oMvYcLQp1Nbrqs22W18WxDDbpf55P6+8rl5n1e2U4YbUfHRGn
	 px2A+50oxbmLA==
Date: Mon, 4 Mar 2024 18:03:00 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, michal.orzel@amd.com, 
    xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, andrew.cooper3@citrix.com, roger.pau@citrix.com, 
    bertrand.marquis@arm.com, julien@xen.org, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [XEN PATCH 10/10] xen/keyhandler: address violations of MISRA
 C Rule 20.7
In-Reply-To: <d7411c57-32f3-41c6-8233-685ed5dfe976@suse.com>
Message-ID: <alpine.DEB.2.22.394.2403041756140.853156@ubuntu-linux-20-04-desktop>
References: <cover.1709219010.git.nicola.vetrini@bugseng.com> <2bc4a964f0f2f47488e72237678e944dbdbd7bb7.1709219010.git.nicola.vetrini@bugseng.com> <alpine.DEB.2.22.394.2402291457000.853156@ubuntu-linux-20-04-desktop> <1afd8805-7365-40ec-8e8e-468a83e20c40@suse.com>
 <alpine.DEB.2.22.394.2403011716180.853156@ubuntu-linux-20-04-desktop> <d7411c57-32f3-41c6-8233-685ed5dfe976@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 4 Mar 2024, Jan Beulich wrote:
> On 02.03.2024 02:37, Stefano Stabellini wrote:
> > On Fri, 1 Mar 2024, Jan Beulich wrote:
> >> On 29.02.2024 23:57, Stefano Stabellini wrote:
> >>> On Thu, 29 Feb 2024, Nicola Vetrini wrote:
> >>>> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
> >>>> of macro parameters shall be enclosed in parentheses". Therefore, some
> >>>> macro definitions should gain additional parentheses to ensure that all
> >>>> current and future users will be safe with respect to expansions that
> >>>> can possibly alter the semantics of the passed-in macro parameter.
> >>>>
> >>>> No functional change.
> >>>>
> >>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> >>>
> >>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> >>
> >> You did see the discussion on earlier patches, though? I don't think
> >> any of the parentheses here are needed or wanted.
> > 
> > We need to align on this. Currently if we go by what's written in
> > docs/misra/deviations.rst, then rhs should have parentheses.
> 
> Quoting the actual patch again:

[...]

> What rhs are you talking about in light of this change? The only rhs I
> can spot here is already parenthesized.

Yes you are right. I replied here as an overall comment about our
approach to 20.7, although this patch is not a good example. My reply
was meant in the context of https://marc.info/?l=xen-devel&m=170928051025701


> > Can we safely claim that rhs parentheses are never needed? If so, then
> > great, let's add it to deviations.rst and skip them here and other
> > places in this patch series (e.g. patch #8). When I say "never" I am
> > taking for granted that the caller is not doing something completely
> > unacceptably broken such as: 
> > 
> >      WRITE_SYSREG64(var +, TTBR0_EL1)
> 
> I'm afraid I can't associate this with the patch here either. Instead in
> the context here a (respective) construct as you mention above would simply
> fail to build.

Fair enough it will break the build. I was trying to clarify that when I
wrote "the rhs parentheses are never needed" I meant "never" within
reason. One can always find ways to break the system and I tried to make
an example of something that for sure would break rhs or lhs without
parentheses.

I meant to say, if we don't account for exceptionally broken cases, can
we safety say we don't need parentheses for rhs?


 
> > If we cannot generically claim that rhs parentheses are never needed,
> > then I don't think we should make any exceptions. We should add them here
> > and everywhere else. It should be easy to write a macro or review a
> > patch with a macro from someone else, and making special exception makes
> > it more difficult for everyone.

