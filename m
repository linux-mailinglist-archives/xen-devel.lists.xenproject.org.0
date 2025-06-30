Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 451A2AEEA2D
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jul 2025 00:27:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029304.1403061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWMyS-0002aZ-Bx; Mon, 30 Jun 2025 22:27:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029304.1403061; Mon, 30 Jun 2025 22:27:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWMyS-0002XS-8G; Mon, 30 Jun 2025 22:27:40 +0000
Received: by outflank-mailman (input) for mailman id 1029304;
 Mon, 30 Jun 2025 22:27:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=72g7=ZN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uWMyR-0002XM-2T
 for xen-devel@lists.xenproject.org; Mon, 30 Jun 2025 22:27:39 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c859592-5601-11f0-b894-0df219b8e170;
 Tue, 01 Jul 2025 00:27:37 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DA407A5364A;
 Mon, 30 Jun 2025 22:27:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62242C4CEE3;
 Mon, 30 Jun 2025 22:27:33 +0000 (UTC)
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
X-Inumbo-ID: 6c859592-5601-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751322455;
	bh=G6Sy/gWzRh6VbK8nybuPa7Y/dmT2xzfgSUhBHoN8pfM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ht7FTGbF5ysFBgipI9NlC60ltAYTn9x59n6oPLctwwYJrWXRlGEXpDZ/wyGnlCoHF
	 yairhHFj1Rw5y8lkvhGGWznTIr106ojvULpn9vypnG2WqXXqWE/Wk/cKMVoFbdw2W0
	 JWjwCz2f+pkvhlBU5bLiy/tfUDpXSbqwc+MuAEUxcf7kHovxVG7aHW6Qt27y3ECZTC
	 979ljT7BSphTTS/aG87HismlHCnPkz/YnjC7qWqRD5QWrxRmQICFzKytDHyZESFY0O
	 Cx9XwrG4c+xjRT2YOayxVN2yPQK7mNKUTbAThBnhr06/hnpKeVcP3n7ER3YfdnzUCH
	 2H66e77jLd1hQ==
Date: Mon, 30 Jun 2025 15:27:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Jan Beulich <jbeulich@suse.com>, dmkhn@proton.me, 
    andrew.cooper3@citrix.com, anthony.perard@vates.tech, michal.orzel@amd.com, 
    roger.pau@citrix.com, dmukhin@ford.com, xen-devel@lists.xenproject.org, 
    Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 2/2] xen/console: unify printout behavior for UART
 emulators
In-Reply-To: <alpine.DEB.2.22.394.2506301521540.862517@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2506301526310.862517@ubuntu-linux-20-04-desktop>
References: <20250606201102.2414022-1-dmukhin@ford.com> <20250606201102.2414022-3-dmukhin@ford.com> <bcb3d553-b8aa-42ab-a9c8-7abf6f5d02c3@suse.com> <aEjInVF3zaa+VVd2@kraken> <b27f7652-424f-479c-a4bc-ed2ecd46ccc8@suse.com>
 <alpine.DEB.2.22.394.2506111155400.542113@ubuntu-linux-20-04-desktop> <b9c263e0-3d8d-4966-8f54-611e58572118@suse.com> <alpine.DEB.2.22.394.2506171735440.1780597@ubuntu-linux-20-04-desktop> <2f726960-4bdc-4996-b204-722c0253e2ab@suse.com>
 <alpine.DEB.2.22.394.2506181742281.1780597@ubuntu-linux-20-04-desktop> <c444b8ff-13ab-4c54-8ba9-5cee72f0f155@xen.org> <alpine.DEB.2.22.394.2506271454160.862517@ubuntu-linux-20-04-desktop> <ad15a6b0-59bf-48ab-89d1-e763923f6f4a@suse.com>
 <alpine.DEB.2.22.394.2506301521540.862517@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 30 Jun 2025, Stefano Stabellini wrote:
> On Sun, 28 Jun 2025, Jan Beulich wrote:
> > On 27.06.2025 23:58, Stefano Stabellini wrote:
> > > On Fri, 27 Jun 2025, Julien Grall wrote:
> > >> Hi Stefano,
> > >>
> > >> On 19/06/2025 01:45, Stefano Stabellini wrote:
> > >>> On Wed, 18 Jun 2025, Jan Beulich wrote:
> > >>>> On 18.06.2025 02:39, Stefano Stabellini wrote:
> > >>>>> On Thu, 12 Jun 2025, Jan Beulich wrote:
> > >>>>>> On 11.06.2025 21:07, Stefano Stabellini wrote:
> > >>>>>>> On Wed, 11 Jun 2025, Jan Beulich wrote:
> > >>>>>>>> On 11.06.2025 02:07, dmkhn@proton.me wrote:
> > >>>>>>>>> On Tue, Jun 10, 2025 at 10:21:40AM +0200, Jan Beulich wrote:
> > >>>>>>>>>> On 06.06.2025 22:11, dmkhn@proton.me wrote:
> > >>>>>>>>>>> From: Denis Mukhin <dmukhin@ford.com>
> > >>>>> If I understood correctly I like your proposal. Let me rephrase it to
> > >>>>> make sure we are aligned. You are suggesting that:
> > >>>>>
> > >>>>> - domains without input focus will print with a (d<N>) prefix
> > >>>>> - the domain with input focus will print without a (d<N>) prefix
> > >>>>> - this applies to both DomUs and Dom0
> > >>>>
> > >>>> Except in the non-dom0less case, at least up and until there's at least
> > >>>> one other domain. I.e. I'd like to keep Dom0 boot output as it is today,
> > >>>> regardless of the presence of e.g. "conswitch=".
> > >>>
> > >>> In the non-dom0less case, since dom0 has focus, it would naturally be
> > >>> without (d<N>) prefix. Unless the user passes "conswitch=". Honestly, I
> > >>> wouldn't special-case conswitch= that way and would prefer keep things
> > >>> simple and consistent without corner cases. I don't think conswitch= is
> > >>> so widely used that it is worth the complexity to special-case it.
> > >>
> > >> I am a bit confused with the wording. Before I can provide another opinion, I
> > >> want to understand a bit more the concern.
> > >>
> > >> From my understanding the command line option "conswitch" is to allow the
> > >> admin to change with key is used to switch between Dom0 and Xen. By default
> > >> this is 'a'. So are you referring to the fact a trailing "x" (to not switch to
> > >> dom0 console) can be added?
> > > 
> > > Yes, conswitch can also be used to ask Xen to keep the input focus to
> > > itself, instead of giving it away to Dom0. I think this is the specific
> > > feature Jan was referring to when he said he is using conswitch and the
> > > proposal would change the way the output looks like for him, which is
> > > true.
> > > 
> > > Today, dom0 would still print without any prefix.
> > > 
> > > Tomorrow with this proposal, dom0 would print with a "(d0)" prefix
> > > because it doesn't have input focus.
> > > 
> > > The question is, with the new policy in place, whether this is worth the
> > > trouble of having a special case to remove the "(d0)" prefix in the
> > > conswitch=x case. I think it is not worth it, Jan thinks it is.
> > 
> > Just to clarify: Along with this mode being entered by conswitch=, I also
> > expect the behavior to remain unaltered when booting (non-dom0less)
> > without that option, and later flipping focus between Xen and Dom0 by
> > using triple Ctrl-a. I'm saying this just to make sure that an eventual
> > change to the patch wouldn't be keyed to the use of the command line
> > option.
> 
> Oh, I see now where the difference of opinion lies. This is the policy
> as written above:
> 
> - domains without input focus will print with a (d<N>) prefix
> - the domain with input focus will print without a (d<N>) prefix
> - this applies to both DomUs and Dom0
> 
> Which means that when you move around with Ctrl-AAA or conswitch, no
> matter if it is dom0less or not, Dom0 would end up printing the prefix
> (d0).
> 
> Jan, and now also Julien are saying that prefer to retain the old
> behavior. I defer to the will of the majority. So then the policy would
> be:
> 
> Dom0less:
> - domains without input focus will print with a (d<N>) prefix
> - the domain with input focus will print without a (d<N>) prefix
> - this applies to both DomUs and Dom0
> 
> Dom0:
> - same as today
> - the domain with input focus will print without a (d<N>) prefix

Sorry this last line was an editing error. I'll write it again for
clarity.

Dom0less:
- domains without input focus will print with a (d<N>) prefix
- the domain with input focus will print without a (d<N>) prefix
- this applies to both DomUs and Dom0

Dom0:
- same as today (with or without conswitch)

