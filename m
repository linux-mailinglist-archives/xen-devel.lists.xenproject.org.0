Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA4DA17504
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2025 00:28:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875082.1285401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ta1BC-0002L5-4m; Mon, 20 Jan 2025 23:27:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875082.1285401; Mon, 20 Jan 2025 23:27:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ta1BC-0002Jc-21; Mon, 20 Jan 2025 23:27:38 +0000
Received: by outflank-mailman (input) for mailman id 875082;
 Mon, 20 Jan 2025 23:27:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fP4x=UM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ta1BA-0002JW-T0
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2025 23:27:37 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e622de4-d786-11ef-a0e4-8be0dac302b0;
 Tue, 21 Jan 2025 00:27:34 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3B8775C5EBD;
 Mon, 20 Jan 2025 23:26:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BA24C4CEDD;
 Mon, 20 Jan 2025 23:27:28 +0000 (UTC)
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
X-Inumbo-ID: 1e622de4-d786-11ef-a0e4-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737415649;
	bh=P1h9BSSHq/93NNAvn/L/oIb9qmAQ+5NcfsZNGhd1GlQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=uimXVDDii97PBXD68ccH8wlznj80cyzQgdeywgtnE98fEMMQuhNSxCInAbdsekOCs
	 Zy14SsTNjXWSYW5/QiYhj6zx9NRyy+peq3tfQg00C95xw/qdkopQU+siNfrjbw393n
	 XGBLZiLTpi8oLT39NinVrEVrEu7SM9+K+HZsqwGNuVbkzCZI61a54+ReDRvJAwx8Tp
	 I+67BIE8uEYDBdfvfOacr3xnk1hUwZa2jjUvPv7W9Vh4J8Y2i6rlds/smcb4caCJS7
	 cwHsQBwZkQXD1UrlGQRgp545okN9ILSBTg6zfrHlL8KkCS9zN8FSj8fq4Z2vVKvxgA
	 pqzo0Fs5SJD8w==
Date: Mon, 20 Jan 2025 15:27:16 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    Alejandro Vallejo <alejandro.vallejo@cloud.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, 
    sergiy_kibrik@epam.com, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 1/4] x86: provide an inverted Kconfig control for
 shim-exclusive mode
In-Reply-To: <40c9d806-000d-43e7-a804-ad4e84209b2f@suse.com>
Message-ID: <alpine.DEB.2.22.394.2501201527090.11086@ubuntu-linux-20-04-desktop>
References: <da5f5bac-6d5d-092d-d872-f1120dcd2661@suse.com> <617842e1-8ef2-b095-0c52-c2e2e5f1c0a8@suse.com> <alpine.DEB.2.22.394.2501161503120.2684657@ubuntu-linux-20-04-desktop> <Z4oxZSUQ6VARiR0H@macbook.local> <D74CH4RDRRR9.ZR6RL8U6PQ56@cloud.com>
 <6285f86d-f2d2-4040-999d-01aed3e72a36@suse.com> <alpine.DEB.2.22.394.2501171430570.2684657@ubuntu-linux-20-04-desktop> <f8c1e2c2-ceb5-4200-a304-e2d824a171a8@citrix.com> <40c9d806-000d-43e7-a804-ad4e84209b2f@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1689403285-1737415649=:11086"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1689403285-1737415649=:11086
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 20 Jan 2025, Jan Beulich wrote:
> On 18.01.2025 00:41, Andrew Cooper wrote:
> > On 17/01/2025 10:43 pm, Stefano Stabellini wrote:
> >> On Fri, 17 Jan 2025, Jan Beulich wrote:
> >>> On 17.01.2025 13:24, Alejandro Vallejo wrote:
> >>>> On Fri Jan 17, 2025 at 10:31 AM GMT, Roger Pau Monné wrote:
> >>>>> On Thu, Jan 16, 2025 at 04:31:46PM -0800, Stefano Stabellini wrote:
> >>>>>> On Wed, 1 Mar 2023, Jan Beulich wrote:
> >>>>>>> While we want certain things turned off in shim-exclusive mode, doing
> >>>>>>> so via "depends on !PV_SHIM_EXCLUSIVE" badly affects allyesconfig: Since
> >>>>>>> that will turn on PV_SHIM_EXCLUSIVE, other options will be turned off as
> >>>>>>> a result. Yet allyesconfig wants to enable as much of the functionality
> >>>>>>> as possible.
> >>>>>>>
> >>>>>>> Retain PV_SHIM_EXCLUSIVE as a prompt-less option such that first of all
> >>>>>>> C code using it can remain as is. This isn't just for less code churn,
> >>>>>>> but also because I think that symbol is more logical to use in many
> >>>>>>> (all?) places.
> >>>>>>>
> >>>>>>> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>>>>>>
> >>>>>>> ---
> >>>>>>> The new Kconfig control's name is up for improvement suggestions, but I
> >>>>>>> think it's already better than the originally thought of
> >>>>>>> FULL_HYPERVISOR.
> >>>>>> I think the approach in general is OK, maybe we can improve the naming
> >>>>>> further. What about one of the following?
> >>>>>>
> >>>>>> NO_PV_SHIM_EXCLUSIVE
> >>>>>> PV_SHIM_NOT_EXCLUSIVE
> >>>>> IMO negated options are confusing, and if possible I think we should
> >>>>> avoid using them unless strictly necessary.
> >>>> The problem is that the option is negative in nature. It's asking for
> >>>> hypervisor without _something_. I do agree with Stefano that shim would be
> >>>> better in the name. Otherwise readers are forced to play divination tricks.
> >>>>
> >>>> How about something like:
> >>>>
> >>>>     SHIMLESS_HYPERVISOR
> >>>>
> >>>> That's arguably not negated, preserves "shim" in the name and has the correct
> >>>> polarity for allyesconfig to yield the right thing.
> >>> Except that a hypervisor with this option enabled isn't shim-less, but permits
> >>> working in shim as well as in non-shim mode.
> >> First, let's recognize that we have two opposing requirements. One
> >> requirement is to make it as easy as possible to configure for the user.
> >> Ideally without using negative CONFIG options, such as
> >> NO_PV_SHIM_EXCLUSIVE. From the user point of view, honestly,
> >> PV_SHIM_EXCLUSIVE is a pretty good name. Better than all of the others,
> >> I think.
> >>
> >> On the other hand, we have the requirement that we don't want
> >> allyesconfig to end up disabling a bunch of CONFIG options. Now this
> >> requirement can be satisfied easily by adding something like
> >> NO_PV_SHIM_EXCLUSIVE. However, it would go somewhat against the previous
> >> requirement.
> >>
> >> So we need a compromise, something that doesn't end up disabling other
> >> CONFIG options, to make allyesconfig happy, but also not too confusing
> >> for the user (which is a matter of personal opinion).
> >>
> >> In short, expect that people will have different opinions on this and
> >> will find different compromises better or worse. For one, I prefer to
> >> compromise on "no negative CONFIG options" and use
> >> PV_SHIM_NOT_EXCLUSIVE. Because it serves the allyesconfig goal, and
> >> while it is not as clear as PV_SHIM_EXCLUSIVE, is still better than a
> >> completely generic FULL_HYPERVISOR option, which means nothing to me.
> >>
> >> I cannot see a way to have a good and clear non-negated CONFIG option,
> >> and also satisfy the allyesconfig requirement. So I prefer to compromise
> >> on the "non-negated" part.
> > 
> > Debating the naming is missing the point.
> > 
> > 
> > The problem here is the wish to have PV_SHIM_EXCLUSIVE behave in a way
> > that Kconfig is not capable of expressing.  Specifically, what is broken
> > is having "lower level" options inhibit unrelated "higher level" options
> > when the graph gets rescanned[1].  That's why we're in the laughable
> > position of `make allyesconfig` turning off CONFIG_HVM.
> > 
> > Jan, you want "echo PV_SHIM_EXCLUSIVE=y >> .config && make" to mean
> > "reset me back to a PV Shim".
> 
> Isn't this an independent goal? Or is this a statement on what you see
> my change (kind of) doing, indicating you consider this wrong?

The way I understood it, it is the latter


> > Kconfig spells this "make $foo_defconfig" for an appropriately given foo.
> > 
> > 
> > There should be:
> > 
> > 1) an option called PV_SHIM_EXCLUSIVE which does *nothing* other than
> > making the boolean be a compile time constant.
> 
> I fear it remains unclear to me what exactly you mean here. It feels like
> you may be suggesting that all other uses of PV_SHIM_EXCLUSIVE should be
> dropped, without replacement. That seems wrong to me, though. In
> particular I'm of the opinion that besides using "make pvshim_defconfig"
> people ought to also have the option to properly configure a shim build
> from scratch (or from any random .config they hold in hands), requiring
> respective "depends on" and/or "select" / "imply" to be in place.

That should be done with "make pvshim_defconfig"


> Or else they may end up with a lot of dead code. (Just consider e.g.
> HVM=n: We also don't permit HVM-only stuff to be enabled in that case,
> as any of that would again be dead code then.)

It will always be possible to come up with poor configurations. I do not
believe it is necessarily our responsibility to go out of our way to
prevent them.


> > 2) a pvshim_defconfig target which expresses what a pvshim ought to look
> > like.
> 
> We have this file already. I consider it debatable though whether this file
> should really force PV_SHIM_EXCLUSIVE=y. People may read "pvshim" in the
> name as either "works just as shim" or "can also work as shim".

If I understood it right, I like Andrew's suggestion. He is suggesting
to do the following:

- turning PV_SHIM_EXCLUSIVE into something that does nothing
- adding "make pvshim_defconfig"

So that:

- people use "make pvshim_defconfig" to get what today is enabled by
  PV_SHIM_EXCLUSIVE
- but "make allyesconfig" doesn't end up disabling things
- the Kconfig menu makes sense because PV_SHIM_EXCLUSIVE goes away and
  it is not replaced by anything

If I got it right, I am in favor.
--8323329-1689403285-1737415649=:11086--

