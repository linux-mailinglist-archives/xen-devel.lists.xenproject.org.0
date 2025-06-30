Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF351AEEA1E
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jul 2025 00:23:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029294.1403049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWMtL-0001wN-NW; Mon, 30 Jun 2025 22:22:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029294.1403049; Mon, 30 Jun 2025 22:22:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWMtL-0001uc-IJ; Mon, 30 Jun 2025 22:22:23 +0000
Received: by outflank-mailman (input) for mailman id 1029294;
 Mon, 30 Jun 2025 22:22:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=72g7=ZN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uWMtK-0001uW-GO
 for xen-devel@lists.xenproject.org; Mon, 30 Jun 2025 22:22:22 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b046e220-5600-11f0-a313-13f23c93f187;
 Tue, 01 Jul 2025 00:22:21 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1B794A5364E;
 Mon, 30 Jun 2025 22:22:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A289C4CEE3;
 Mon, 30 Jun 2025 22:22:18 +0000 (UTC)
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
X-Inumbo-ID: b046e220-5600-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751322139;
	bh=GUOpKpNRKZTtL43Cnzg1ANJM6L6bh0FcsiA8KMgfogY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lBykvmj+LaVzDLISv3NX6pyqT5GeTI6MWzg3W4F4FTZ1rxXliSKVYpbFm1b4vIt+G
	 92vwKz6lMWOPLlNx7TecjJlQGlQuzeEcFdjBAMj0do7fTrLVlyDYA6ZZol3zoGPDza
	 1QRpN+yF54VSVMbtnPpL/srq0KPszgD1Lc0rH0kA4sQ2D3EuRQ4F+Q/ygrFeKWLWoG
	 fTwvR0VfocE97xIP+bnBoGdlkAkRx6FCRDoEcpChQ/3a15dHtVEzOejSiwdZe5V9Q0
	 ZIerKyuRp2wGtspRPXBojclo+V8IM/kDsrRMfx5Qu/w8RHwXJSsNdQu1uqFE5Yg8Ad
	 Soh6uudE9Vjjw==
Date: Mon, 30 Jun 2025 15:22:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, dmkhn@proton.me, 
    andrew.cooper3@citrix.com, anthony.perard@vates.tech, michal.orzel@amd.com, 
    roger.pau@citrix.com, dmukhin@ford.com, xen-devel@lists.xenproject.org, 
    Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 2/2] xen/console: unify printout behavior for UART
 emulators
In-Reply-To: <ad15a6b0-59bf-48ab-89d1-e763923f6f4a@suse.com>
Message-ID: <alpine.DEB.2.22.394.2506301521540.862517@ubuntu-linux-20-04-desktop>
References: <20250606201102.2414022-1-dmukhin@ford.com> <20250606201102.2414022-3-dmukhin@ford.com> <bcb3d553-b8aa-42ab-a9c8-7abf6f5d02c3@suse.com> <aEjInVF3zaa+VVd2@kraken> <b27f7652-424f-479c-a4bc-ed2ecd46ccc8@suse.com>
 <alpine.DEB.2.22.394.2506111155400.542113@ubuntu-linux-20-04-desktop> <b9c263e0-3d8d-4966-8f54-611e58572118@suse.com> <alpine.DEB.2.22.394.2506171735440.1780597@ubuntu-linux-20-04-desktop> <2f726960-4bdc-4996-b204-722c0253e2ab@suse.com>
 <alpine.DEB.2.22.394.2506181742281.1780597@ubuntu-linux-20-04-desktop> <c444b8ff-13ab-4c54-8ba9-5cee72f0f155@xen.org> <alpine.DEB.2.22.394.2506271454160.862517@ubuntu-linux-20-04-desktop> <ad15a6b0-59bf-48ab-89d1-e763923f6f4a@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 28 Jun 2025, Jan Beulich wrote:
> On 27.06.2025 23:58, Stefano Stabellini wrote:
> > On Fri, 27 Jun 2025, Julien Grall wrote:
> >> Hi Stefano,
> >>
> >> On 19/06/2025 01:45, Stefano Stabellini wrote:
> >>> On Wed, 18 Jun 2025, Jan Beulich wrote:
> >>>> On 18.06.2025 02:39, Stefano Stabellini wrote:
> >>>>> On Thu, 12 Jun 2025, Jan Beulich wrote:
> >>>>>> On 11.06.2025 21:07, Stefano Stabellini wrote:
> >>>>>>> On Wed, 11 Jun 2025, Jan Beulich wrote:
> >>>>>>>> On 11.06.2025 02:07, dmkhn@proton.me wrote:
> >>>>>>>>> On Tue, Jun 10, 2025 at 10:21:40AM +0200, Jan Beulich wrote:
> >>>>>>>>>> On 06.06.2025 22:11, dmkhn@proton.me wrote:
> >>>>>>>>>>> From: Denis Mukhin <dmukhin@ford.com>
> >>>>> If I understood correctly I like your proposal. Let me rephrase it to
> >>>>> make sure we are aligned. You are suggesting that:
> >>>>>
> >>>>> - domains without input focus will print with a (d<N>) prefix
> >>>>> - the domain with input focus will print without a (d<N>) prefix
> >>>>> - this applies to both DomUs and Dom0
> >>>>
> >>>> Except in the non-dom0less case, at least up and until there's at least
> >>>> one other domain. I.e. I'd like to keep Dom0 boot output as it is today,
> >>>> regardless of the presence of e.g. "conswitch=".
> >>>
> >>> In the non-dom0less case, since dom0 has focus, it would naturally be
> >>> without (d<N>) prefix. Unless the user passes "conswitch=". Honestly, I
> >>> wouldn't special-case conswitch= that way and would prefer keep things
> >>> simple and consistent without corner cases. I don't think conswitch= is
> >>> so widely used that it is worth the complexity to special-case it.
> >>
> >> I am a bit confused with the wording. Before I can provide another opinion, I
> >> want to understand a bit more the concern.
> >>
> >> From my understanding the command line option "conswitch" is to allow the
> >> admin to change with key is used to switch between Dom0 and Xen. By default
> >> this is 'a'. So are you referring to the fact a trailing "x" (to not switch to
> >> dom0 console) can be added?
> > 
> > Yes, conswitch can also be used to ask Xen to keep the input focus to
> > itself, instead of giving it away to Dom0. I think this is the specific
> > feature Jan was referring to when he said he is using conswitch and the
> > proposal would change the way the output looks like for him, which is
> > true.
> > 
> > Today, dom0 would still print without any prefix.
> > 
> > Tomorrow with this proposal, dom0 would print with a "(d0)" prefix
> > because it doesn't have input focus.
> > 
> > The question is, with the new policy in place, whether this is worth the
> > trouble of having a special case to remove the "(d0)" prefix in the
> > conswitch=x case. I think it is not worth it, Jan thinks it is.
> 
> Just to clarify: Along with this mode being entered by conswitch=, I also
> expect the behavior to remain unaltered when booting (non-dom0less)
> without that option, and later flipping focus between Xen and Dom0 by
> using triple Ctrl-a. I'm saying this just to make sure that an eventual
> change to the patch wouldn't be keyed to the use of the command line
> option.

Oh, I see now where the difference of opinion lies. This is the policy
as written above:

- domains without input focus will print with a (d<N>) prefix
- the domain with input focus will print without a (d<N>) prefix
- this applies to both DomUs and Dom0

Which means that when you move around with Ctrl-AAA or conswitch, no
matter if it is dom0less or not, Dom0 would end up printing the prefix
(d0).

Jan, and now also Julien are saying that prefer to retain the old
behavior. I defer to the will of the majority. So then the policy would
be:

Dom0less:
- domains without input focus will print with a (d<N>) prefix
- the domain with input focus will print without a (d<N>) prefix
- this applies to both DomUs and Dom0

Dom0:
- same as today
- the domain with input focus will print without a (d<N>) prefix

