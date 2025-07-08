Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBBFAFDBE1
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 01:32:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037492.1410115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZHni-0003fP-Hw; Tue, 08 Jul 2025 23:32:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037492.1410115; Tue, 08 Jul 2025 23:32:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZHni-0003cU-FG; Tue, 08 Jul 2025 23:32:38 +0000
Received: by outflank-mailman (input) for mailman id 1037492;
 Tue, 08 Jul 2025 23:32:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6HMe=ZV=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uZHng-0003cO-LY
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 23:32:36 +0000
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch
 [79.135.106.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d355ddab-5c53-11f0-b894-0df219b8e170;
 Wed, 09 Jul 2025 01:32:34 +0200 (CEST)
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
X-Inumbo-ID: d355ddab-5c53-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1752017552; x=1752276752;
	bh=OtNrqdATj6StUfvSOmCOJFEPnOiCTJoZsx1UMvLoDRc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=XMa1j4i4+20p/HgbgKP+HWvljQ+QJgdKJQbK+S0AzncIiqyrNuhCe3VqAl3FzbwcS
	 vbrraPXYa3u7LY9oyt+JvEVqE4b9+H9ISKuMk6933Wv4X4nkYR3jHtu58sgTGqyjJw
	 E3QyfJ0L5kgSQEk8eOoaqjyh1L9FVMb3weqeNEWAuTZGqWuM6HiRSnMX4aqgL81BmC
	 goNz9HMLFLF1Riw4Q4jRPmmYZxCnTwXaHYc5TcGryCb7ctOr34S/5nxw/dsAwYeDpv
	 vA7a7RO4tl+ScA3SPvkWCTnhdmXNySNeeElHlHWDKmGufwhcVFDcqZs5xKha7E3XUa
	 B5L7D6H2s0y8Q==
Date: Tue, 08 Jul 2025 23:32:28 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com, anthony.perard@vates.tech, michal.orzel@amd.com, roger.pau@citrix.com, dmukhin@ford.com, xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 2/2] xen/console: unify printout behavior for UART emulators
Message-ID: <aG2qiJ4+A3t+tOwO@kraken>
In-Reply-To: <ad15a6b0-59bf-48ab-89d1-e763923f6f4a@suse.com>
References: <20250606201102.2414022-1-dmukhin@ford.com> <alpine.DEB.2.22.394.2506111155400.542113@ubuntu-linux-20-04-desktop> <b9c263e0-3d8d-4966-8f54-611e58572118@suse.com> <alpine.DEB.2.22.394.2506171735440.1780597@ubuntu-linux-20-04-desktop> <2f726960-4bdc-4996-b204-722c0253e2ab@suse.com> <alpine.DEB.2.22.394.2506181742281.1780597@ubuntu-linux-20-04-desktop> <c444b8ff-13ab-4c54-8ba9-5cee72f0f155@xen.org> <alpine.DEB.2.22.394.2506271454160.862517@ubuntu-linux-20-04-desktop> <ad15a6b0-59bf-48ab-89d1-e763923f6f4a@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 0126a026bdbae507b15bcd2560af5b99e7fcc9fe
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 29, 2025 at 03:47:41PM +0200, Jan Beulich wrote:
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
> >>>>> If I understood correctly I like your proposal. Let me rephrase it =
to
> >>>>> make sure we are aligned. You are suggesting that:
> >>>>>
> >>>>> - domains without input focus will print with a (d<N>) prefix
> >>>>> - the domain with input focus will print without a (d<N>) prefix
> >>>>> - this applies to both DomUs and Dom0
> >>>>
> >>>> Except in the non-dom0less case, at least up and until there's at le=
ast
> >>>> one other domain. I.e. I'd like to keep Dom0 boot output as it is to=
day,
> >>>> regardless of the presence of e.g. "conswitch=3D".
> >>>
> >>> In the non-dom0less case, since dom0 has focus, it would naturally be
> >>> without (d<N>) prefix. Unless the user passes "conswitch=3D". Honestl=
y, I
> >>> wouldn't special-case conswitch=3D that way and would prefer keep thi=
ngs
> >>> simple and consistent without corner cases. I don't think conswitch=
=3D is
> >>> so widely used that it is worth the complexity to special-case it.
> >>
> >> I am a bit confused with the wording. Before I can provide another opi=
nion, I
> >> want to understand a bit more the concern.
> >>
> >> From my understanding the command line option "conswitch" is to allow =
the
> >> admin to change with key is used to switch between Dom0 and Xen. By de=
fault
> >> this is 'a'. So are you referring to the fact a trailing "x" (to not s=
witch to
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
> > The question is, with the new policy in place, whether this is worth th=
e
> > trouble of having a special case to remove the "(d0)" prefix in the
> > conswitch=3Dx case. I think it is not worth it, Jan thinks it is.
>=20
> Just to clarify: Along with this mode being entered by conswitch=3D, I al=
so
> expect the behavior to remain unaltered when booting (non-dom0less)
> without that option, and later flipping focus between Xen and Dom0 by
> using triple Ctrl-a. I'm saying this just to make sure that an eventual
> change to the patch wouldn't be keyed to the use of the command line
> option.

I will preserve the existing non-dom0less dom0 behavior for printouts.
Thanks for the patience and the feedback!

>=20
> Jan


