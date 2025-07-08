Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 178BBAFDBE2
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 01:34:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037499.1410125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZHp6-0004B6-Qn; Tue, 08 Jul 2025 23:34:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037499.1410125; Tue, 08 Jul 2025 23:34:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZHp6-00049Z-OF; Tue, 08 Jul 2025 23:34:04 +0000
Received: by outflank-mailman (input) for mailman id 1037499;
 Tue, 08 Jul 2025 23:34:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6HMe=ZV=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uZHp5-00049D-G8
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 23:34:03 +0000
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch
 [79.135.106.31]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06f5a6c1-5c54-11f0-b894-0df219b8e170;
 Wed, 09 Jul 2025 01:34:01 +0200 (CEST)
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
X-Inumbo-ID: 06f5a6c1-5c54-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1752017640; x=1752276840;
	bh=FJ5SeyvCJyQ2sBlZo1a5OUAy7Gj/hl7VRf3yV3n5yu8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=mKhEIZGwz2/7BwS8hqO6YDD/t690VhbdxFp+3BfEvxKCaUSSnfqXcl8SpbUKxIqqq
	 DXUKguw9PI1MRf7PyICcRiN9gJ4Doe17Hi+zjGYN/cg8ikKATtbxHEpPPJJZzVJ7NV
	 pMv7/dTdGYDCoaCEpKJviFOxHtwleNPNkwwx9nh337Y2hRw/Znf13SBiwicn8Ryf20
	 W4JcvBbWRH/pPw+NJG1GxQSQ77isnSkUen4h2aixjSI4GqwFMJLvv7g5OxmQgFmQE5
	 kEXBQorUeQju6L8/IoUAhvmnxbOhVtKTF08jMsWfVFPHrhZMKFpVFvjd6oU3CWhFOE
	 O4KXiuthYr1jg==
Date: Tue, 08 Jul 2025 23:33:57 +0000
To: Stefano Stabellini <sstabellini@kernel.org>
From: dmkhn@proton.me
Cc: Jan Beulich <jbeulich@suse.com>, andrew.cooper3@citrix.com, anthony.perard@vates.tech, michal.orzel@amd.com, roger.pau@citrix.com, dmukhin@ford.com, xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 2/2] xen/console: unify printout behavior for UART emulators
Message-ID: <aG2q4VfQ1k2p9BjK@kraken>
In-Reply-To: <alpine.DEB.2.22.394.2506301526310.862517@ubuntu-linux-20-04-desktop>
References: <20250606201102.2414022-1-dmukhin@ford.com> <alpine.DEB.2.22.394.2506171735440.1780597@ubuntu-linux-20-04-desktop> <2f726960-4bdc-4996-b204-722c0253e2ab@suse.com> <alpine.DEB.2.22.394.2506181742281.1780597@ubuntu-linux-20-04-desktop> <c444b8ff-13ab-4c54-8ba9-5cee72f0f155@xen.org> <alpine.DEB.2.22.394.2506271454160.862517@ubuntu-linux-20-04-desktop> <ad15a6b0-59bf-48ab-89d1-e763923f6f4a@suse.com> <alpine.DEB.2.22.394.2506301521540.862517@ubuntu-linux-20-04-desktop> <alpine.DEB.2.22.394.2506301526310.862517@ubuntu-linux-20-04-desktop>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 84a145efaede92482447e3a3376711e1b9030fe9
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 03:27:32PM -0700, Stefano Stabellini wrote:
> On Mon, 30 Jun 2025, Stefano Stabellini wrote:
> > On Sun, 28 Jun 2025, Jan Beulich wrote:
> > > On 27.06.2025 23:58, Stefano Stabellini wrote:
> > > > On Fri, 27 Jun 2025, Julien Grall wrote:
> > > >> Hi Stefano,
> > > >>
> > > >> On 19/06/2025 01:45, Stefano Stabellini wrote:
> > > >>> On Wed, 18 Jun 2025, Jan Beulich wrote:
> > > >>>> On 18.06.2025 02:39, Stefano Stabellini wrote:
> > > >>>>> On Thu, 12 Jun 2025, Jan Beulich wrote:
> > > >>>>>> On 11.06.2025 21:07, Stefano Stabellini wrote:
> > > >>>>>>> On Wed, 11 Jun 2025, Jan Beulich wrote:
> > > >>>>>>>> On 11.06.2025 02:07, dmkhn@proton.me wrote:
> > > >>>>>>>>> On Tue, Jun 10, 2025 at 10:21:40AM +0200, Jan Beulich wrote=
:
> > > >>>>>>>>>> On 06.06.2025 22:11, dmkhn@proton.me wrote:
> > > >>>>>>>>>>> From: Denis Mukhin <dmukhin@ford.com>
> > > >>>>> If I understood correctly I like your proposal. Let me rephrase=
 it to
> > > >>>>> make sure we are aligned. You are suggesting that:
> > > >>>>>
> > > >>>>> - domains without input focus will print with a (d<N>) prefix
> > > >>>>> - the domain with input focus will print without a (d<N>) prefi=
x
> > > >>>>> - this applies to both DomUs and Dom0
> > > >>>>
> > > >>>> Except in the non-dom0less case, at least up and until there's a=
t least
> > > >>>> one other domain. I.e. I'd like to keep Dom0 boot output as it i=
s today,
> > > >>>> regardless of the presence of e.g. "conswitch=3D".
> > > >>>
> > > >>> In the non-dom0less case, since dom0 has focus, it would naturall=
y be
> > > >>> without (d<N>) prefix. Unless the user passes "conswitch=3D". Hon=
estly, I
> > > >>> wouldn't special-case conswitch=3D that way and would prefer keep=
 things
> > > >>> simple and consistent without corner cases. I don't think conswit=
ch=3D is
> > > >>> so widely used that it is worth the complexity to special-case it=
.
> > > >>
> > > >> I am a bit confused with the wording. Before I can provide another=
 opinion, I
> > > >> want to understand a bit more the concern.
> > > >>
> > > >> From my understanding the command line option "conswitch" is to al=
low the
> > > >> admin to change with key is used to switch between Dom0 and Xen. B=
y default
> > > >> this is 'a'. So are you referring to the fact a trailing "x" (to n=
ot switch to
> > > >> dom0 console) can be added?
> > > >
> > > > Yes, conswitch can also be used to ask Xen to keep the input focus =
to
> > > > itself, instead of giving it away to Dom0. I think this is the spec=
ific
> > > > feature Jan was referring to when he said he is using conswitch and=
 the
> > > > proposal would change the way the output looks like for him, which =
is
> > > > true.
> > > >
> > > > Today, dom0 would still print without any prefix.
> > > >
> > > > Tomorrow with this proposal, dom0 would print with a "(d0)" prefix
> > > > because it doesn't have input focus.
> > > >
> > > > The question is, with the new policy in place, whether this is wort=
h the
> > > > trouble of having a special case to remove the "(d0)" prefix in the
> > > > conswitch=3Dx case. I think it is not worth it, Jan thinks it is.
> > >
> > > Just to clarify: Along with this mode being entered by conswitch=3D, =
I also
> > > expect the behavior to remain unaltered when booting (non-dom0less)
> > > without that option, and later flipping focus between Xen and Dom0 by
> > > using triple Ctrl-a. I'm saying this just to make sure that an eventu=
al
> > > change to the patch wouldn't be keyed to the use of the command line
> > > option.
> >
> > Oh, I see now where the difference of opinion lies. This is the policy
> > as written above:
> >
> > - domains without input focus will print with a (d<N>) prefix
> > - the domain with input focus will print without a (d<N>) prefix
> > - this applies to both DomUs and Dom0
> >
> > Which means that when you move around with Ctrl-AAA or conswitch, no
> > matter if it is dom0less or not, Dom0 would end up printing the prefix
> > (d0).
> >
> > Jan, and now also Julien are saying that prefer to retain the old
> > behavior. I defer to the will of the majority. So then the policy would
> > be:
> >
> > Dom0less:
> > - domains without input focus will print with a (d<N>) prefix
> > - the domain with input focus will print without a (d<N>) prefix
> > - this applies to both DomUs and Dom0
> >
> > Dom0:
> > - same as today
> > - the domain with input focus will print without a (d<N>) prefix
>=20
> Sorry this last line was an editing error. I'll write it again for
> clarity.
>=20
> Dom0less:
> - domains without input focus will print with a (d<N>) prefix
> - the domain with input focus will print without a (d<N>) prefix
> - this applies to both DomUs and Dom0
>=20
> Dom0:
> - same as today (with or without conswitch)

Thanks!

>=20


