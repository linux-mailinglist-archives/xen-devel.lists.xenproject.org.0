Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3DA8358CB
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jan 2024 00:48:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669634.1041964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRhWo-0005cR-Sk; Sun, 21 Jan 2024 23:47:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669634.1041964; Sun, 21 Jan 2024 23:47:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRhWo-0005av-PQ; Sun, 21 Jan 2024 23:47:02 +0000
Received: by outflank-mailman (input) for mailman id 669634;
 Sun, 21 Jan 2024 23:47:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LZiN=I7=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1rRhWn-0005ap-97
 for xen-devel@lists.xenproject.org; Sun, 21 Jan 2024 23:47:01 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5acc27a2-b8b7-11ee-9b0f-b553b5be7939;
 Mon, 22 Jan 2024 00:46:57 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 122835C0080;
 Sun, 21 Jan 2024 18:46:53 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sun, 21 Jan 2024 18:46:53 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 21 Jan 2024 18:46:52 -0500 (EST)
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
X-Inumbo-ID: 5acc27a2-b8b7-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1705880813;
	 x=1705967213; bh=HaZQTPI+xO6ABE8/4flVpKxnRDJ8SQMCUWJkaqYL73A=; b=
	R5KPUsw6R5VcuAWM6U4h+QH4dU41NzYzUI0c3e3gaEbUm458jaGsjIj1M4AEkLLu
	kNg02ZA5ZNhjI5p7NoIlLUHy9iGlJE04YNXeINfyKfROAemR9vRlKJ1kBNYv0IZ9
	6or+q4chAzNxU0fvGyycDiz3XQdIHSFc1DoeustnTIDMVbaJqNW8cTAUkYpLVIL3
	VxaQmKlAzt3CMXIHWNnNhRevILqQBg3w0Dhsa31zqRFh/sanxAz49GeAGaDggcj9
	S2IX9zQ9b22eE+iCJmhJ2mG8svc3OqSzvcCRNqRq01euHRouX1e4Si2O8PF5n2wV
	t4z+bCUUvOfGAMgPs7CX6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1705880813; x=1705967213; bh=HaZQTPI+xO6ABE8/4flVpKxnRDJ8
	SQMCUWJkaqYL73A=; b=ZIlK5jjIvfwI/ProXRtvPcJDeZg+A7FQYLJ5BEXnWCNm
	U027IfZ/+J19xp0r6IuVzO2sIA7uUFfqQAIGbd2MuKFqHsO+P1ujBvDhXEV3m2aQ
	JnBVrQVx6kDoTcnA0TIJgz9wwSYOoRCbJzsYt6j4V6Sj7Ds6E/cKWyUXjxLMdoEA
	JzZ6sHlXejwm0eI8ncmUsAk5qAKzXcCQRlCEI2Fd9eRxjE2ga7iSKG8AQgLpcHas
	Id4N1HwbwdheVJxH7Z3DBJ2rAyXEZdpRtDshf3imWSWTQ/EQecWzZN4lBk77UTak
	25QZPuGdvo59KNQDTnEKsliXAquo8i3xGu49j7tmjQ==
X-ME-Sender: <xms:7KytZfTpBlxDs-9wdh5LJoqhdc7vS_N-pUH545ayQwbzgp0LcGDW3Q>
    <xme:7KytZQzxCPITyVmMKv7RM08Bps9W0pFHF8vR7E6OMXdj3D_N_j1c5JBinQoGxiNOM
    sBNUf6FnSt3w1w>
X-ME-Received: <xmr:7KytZU3Cz6zQq_K3ti6laVaxFWlXX03xMtkHUJITN9PI9u2w-eq4RAg28x3RqUpK8vB2NO7lot6ZXTXw9u4DVKG5r54RJdKicj2jtj_Mqu6DHRci>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdekhedgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepjeetffekvddvgfejueffleegleei
    ueeuvdehffettedvgeeugeegjeduheevueeinecuffhomhgrihhnpeihohhuthhusggvrd
    gtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    uggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:7KytZfBU5mbKXvrgg6Co2OnWvwI2wbs6Gqe9LyjVXE2T8oAViExcqA>
    <xmx:7KytZYiO5WnwLqSyNQ6WJszA8nqCeT2b7lizE4bcxOJVoxwpSBoHxA>
    <xmx:7KytZTp8Eis199EeRh3QBauvsJmbzQvR9FQA4KwYM2bbyk6uNRqUZA>
    <xmx:7aytZbvkkAh6wKSOoh98f7abou-jx60VnnBy7ZWPhmCItsseL0X0vg>
Feedback-ID: iac594737:Fastmail
Date: Sun, 21 Jan 2024 18:46:36 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: George Dunlap <george.dunlap@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: Sketch of an idea for handling the "mixed workload" problem
Message-ID: <Za2s69ZTbTVGlcJi@itl-email>
References: <CA+zSX=Z904nF0yD1grRZc1miEOhdTHqAd4j-S1j8GY+1bo9COw@mail.gmail.com>
 <ZRivEkG8Ox213H2A@itl-email>
 <CA+zSX=Zy0C_XMmMUxxk5TF88L0cXwFHihQdYDxaY+tMuTm3GQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4WUr8S6XVR2NVM4P"
Content-Disposition: inline
In-Reply-To: <CA+zSX=Zy0C_XMmMUxxk5TF88L0cXwFHihQdYDxaY+tMuTm3GQQ@mail.gmail.com>


--4WUr8S6XVR2NVM4P
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sun, 21 Jan 2024 18:46:36 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: George Dunlap <george.dunlap@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: Sketch of an idea for handling the "mixed workload" problem

On Mon, Oct 02, 2023 at 12:20:31PM +0100, George Dunlap wrote:
> On Sun, Oct 1, 2023 at 12:28=E2=80=AFAM Demi Marie Obenour
> <demi@invisiblethingslab.com> wrote:
> >
> > On Fri, Sep 29, 2023 at 05:42:16PM +0100, George Dunlap wrote:
> > > The basic credit2 algorithm goes something like this:
> > >
> > > 1. All vcpus start with the same number of credits; about 10ms worth
> > > if everyone has the same weight
> >
> > > 2. vcpus burn credits as they consume cpu, based on the relative
> > > weights: higher weights burn slower, lower weights burn faster
> > >
> > > 3. At any given point in time, the runnable vcpu with the highest
> > > credit is allowed to run
> > >
> > > 4. When the "next runnable vcpu" on a runqueue is negative, credit is
> > > reset: everyone gets another 10ms, and can carry over at most 2ms of
> > > credit over the reset.
> >
> > One relevant aspect of Qubes OS is that it is very very heavily
> > oversubscribed: having more VMs running than physical CPUs is (at least
> > in my usage) not uncommon, and each of those VMs will typically have at
> > least two vCPUs.  With a credit of 10ms and 36 vCPUs, I could easily see
> > a vCPU not being allowed to execute for 200ms or more.  For audio or
> > video, workloads, this is a disaster.
> >
> > 10ms is a LOT for desktop workloads or for anyone who cares about
> > latency.  At 60Hz it is 3/5 of a frame, and with a 120Hz monitor and a
> > heavily contended system frame drops are guaranteed.
>=20
> You'd probably benefit from understanding better how the various
> algorithms actually work.  I'm sorry I don't have any really good
> "virtualization scheduling for dummies" resources; the best I have is
> a few talks I gave on the subject; e.g.:
>=20
> https://www.youtube.com/watch?v=3DC3jjvkr6fgQ
>=20
> For one, when I say "oversubscribed", I don't mean "vcpus / pcpus"; I
> mean "requested vcpu execution time / vcpus".  If you have 18 vcpus on
> a single pcpu, and all of them *on an empty system* would have run at
> 5%, you're totally fine.  If you have 18 vcpus on a single pcpu, and
> all of them on an empty system would have averaged 100%, there's only
> so much the scheduler can do to avoid problems.

If each vCPU would have spent 4% time doing realtime tasks, it should be
possible to give all of the realtime tasks all the time they need, while
the remaining 100 - 4 * 18 =3D 28% of time is available to non-realtime
tasks.  That=E2=80=99s not awesome, but it might be enough to prevent audio=
 from
glitching.

> Secondly, while on credit1 a vcpu is allowed to run for 10ms without
> stopping (and then must wait for 18x that time to get the same credit
> back, if there are 18 other vcpus running on that same pcpu), this is
> not the case for credit2.  The exact calculation can be found in
> xen/common/sched/credit2.c:sched2_runtime(), but generally here's the
> general algorithm from the comment:
>=20
> /* General algorithm:
>  * 1) Run until snext's credit will be 0.
>  * 2) But if someone is waiting, run until snext's credit is equal
>  *    to his.
>  * 3) But, if we are capped, never run more than our budget.
>  * 4) And never run longer than MAX_TIMER or shorter than MIN_TIMER or
>  *    the ratelimit time.
>  */
>=20
> Default MIN_TIMER is 500us, and is configurable via sysctl; default
> MAX_TIMER is... hmm, I'm pretty sure this started out as 2ms, but now
> it seems to be 10ms.  Looks like this was changed in da92ec5bd1 ("xen:
> credit2: "relax" CSCHED2_MAX_TIMER") in 2016.  (MAX_TIMER isn't
> configurable, but arguably it should be; and making it configurable
> should just be a matter of duplicating the logic around MIN_TIMER.)

Maybe MAX_TIMER should be lowered to e.g. 1ms?

> That's not yet the last word though: If a VM that was a sleep wakes
> up, and it has credit than the running vcpu, then it will generally
> preempt that cpu.
>=20
> All that to say, that it should be very rare for a cpu to run for a
> full 10ms under credit2.

That=E2=80=99s good.

> > > Other ways we could consider putting a vcpu into a boosted state (some
> > > discussed on Matrix or emails linked from Matrix):
> > > * Xen is about to preempt, but finds that the vcpu interrupts are
> > > blocked (this sort of overlaps with the "when we deliver an interrupt"
> > > one)
> >
> > This is also a good heuristic for "vCPU owns a spinlock", which is
> > definitely a bad time to preempt.
>=20
> Not all spinlocks disable IRQs, but certainly some do.
>=20
> > > Getting the defaults right might take some thinking.  If you set the
> > > default "boost credit ratio" to 25% and the "default boost interval"
> > > to 500ms, then you'd basically have five "boosts" per scheduling
> > > window.  The window depends on how active other vcpus are, but if it's
> > > longer than 20ms your system is too overloaded.
> >
> > An interval of 500ms seems rather long to me.  Did you mean 500=CE=BCs?
>=20
> Yes, I did mean 500us, sorry.
>=20
> I'll respond to the other suggestions later.
>=20
> > > Demi, what kinds of interrupt counts are you getting for your VM?
> >
> > I didn't measure it, but I can check the next time I am on a video call
> > or doing audio recoring.
>=20
> Running xentrace would be really interesting too; those are another
> good way to nerd-snipe me. :-)
>=20
>  -George

That would certainly be a good idea!
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--4WUr8S6XVR2NVM4P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmWtrOoACgkQsoi1X/+c
IsHHuRAAv0RHvjQFAIzlT5dePOrUK4ulrwP8czznRhknqxaYFz59q7P9T2JaotbQ
kJo0cKuorKWJ9tbgmt7WRshMh7SZqeEZb+C7PLHXt6+DXvJU+TAEWqczMJRPKcvC
cyehdtAGyWU4t2MTjT3WIYxI2wrYt0y0dwPvwFFqY7vb8RAes2esJJq88P+ZKK5z
IINaF5LSc2l1zEWuZBHjLi6nVQwQAChtvNCUMLaYWhkJno9AJUyDbER8hNILKcwP
bRhlM/oJtXXIaywuHN71Qbnot/bv75eNwlTQsMajWyTzib3yCGJKmbvzpa8sAy0D
l5GT5xe2AzOLle36V+EGV6J4GDiTc8l4f0AwhpE7ZDiTSIVIspoPbhrQiByBeEBX
D/g2vQP2yImBHYWL3TDgA/ufZuVg2Cli8MrMrxR5Rq+7LFUc7dIuTUiex7Aqc/8T
ZBwPPHbXNfkM/JQ6e2+BCAx4YTGaLp3QrqQtwtgA/HTuiZtyA/8fJRF6sNiDfhzF
rkjihXvfXL7Oc2hkPMIPQwHnbPVVx+Ed+PEoQdHsONYb6nIexT7SQNAaHz+mYWBV
RiPPZ3mEZMLIbNjFbDpvCsdy3wvUB7EE24aTzWdCRnZrO41FwqzhgfuQRBk4Q40c
B6YyExqJCvO+eW8VRLm8euxa9DjigCoKS3eu2dqlRjt2EQb9zsM=
=lymM
-----END PGP SIGNATURE-----

--4WUr8S6XVR2NVM4P--

