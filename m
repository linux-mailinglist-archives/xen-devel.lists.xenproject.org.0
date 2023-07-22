Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B634B75D87F
	for <lists+xen-devel@lfdr.de>; Sat, 22 Jul 2023 03:01:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567776.887273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qN0zf-0008EU-Uk; Sat, 22 Jul 2023 01:01:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567776.887273; Sat, 22 Jul 2023 01:01:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qN0zf-000895-R3; Sat, 22 Jul 2023 01:01:11 +0000
Received: by outflank-mailman (input) for mailman id 567776;
 Sat, 22 Jul 2023 01:01:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DWMX=DI=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1qN0ze-0007gq-UK
 for xen-devel@lists.xenproject.org; Sat, 22 Jul 2023 01:01:10 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3aa9d8be-282b-11ee-8611-37d641c3527e;
 Sat, 22 Jul 2023 03:01:03 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 513C63200915;
 Fri, 21 Jul 2023 21:01:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 21 Jul 2023 21:01:01 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 21 Jul 2023 21:00:59 -0400 (EDT)
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
X-Inumbo-ID: 3aa9d8be-282b-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1689987660; x=1690074060; bh=GcLBQU1lGaT0lerdE79/hPxAYG7jbojAFSe
	n6gNqjg0=; b=q1U2mvHgCL+epm57CYH6jcjVDhUPPy787jLBFNCSapzaR16dfNT
	pGj+tilVn0+yy5RgTLO2vNoAwFfgBz0BCxy7ZxD+heb0yScZgzFiedwhxrm0LELU
	WAQb9XCOuceQFtE8mSDzVjjzf0FgzVJ7+MfUXrCxVcGn1otVhBqGvgQj28rxE1Kr
	dWq58TeMQKZKqJ6Xl6Der8j1l/vxDDr0frs9PWNpYKvcHpw01LemJx6kC7Z8E/Ng
	6p5FdrBdXK1bngkxQbENuk2HGBPtZC/PoAjfqX/PHilkmuWnbKp0qcZUPUprgmGY
	Lw7IqCK61Rshtm4nWsECYl/BbvF5bJqnqHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1689987660; x=1690074060; bh=GcLBQU1lGaT0l
	erdE79/hPxAYG7jbojAFSen6gNqjg0=; b=u6VHVIOjEcCxQWu1Dq/zjRmo7ktYy
	eSwGJUmVyHt+qfIppe8l6pGZVXL9VjuAXC4a9QzAAEg9tS8/lpAOmdyUREuEpmN7
	wGBGYt5f4lshEzimP5d+u+8HlCcAS2UW4v1rSrETPRArBFbe5WQ1VT2vGWoA5PX/
	TcPD5WdbFgTZLean9p87rHkTSatwhT2nteG2s5BjK4lb6tRxiI0c1bhl6B8Kr48B
	ACvNi9c94TJNO9/3hRKBDPCOP0AhPHcY7+2UPx0a+s9xnDWqAOH4/3uoSAxMX2GI
	mbP9j4VkRRjvwLAxke9ut37qpOYYphIbjScXEE9KVgp5YxYdEMa0JxBGQ==
X-ME-Sender: <xms:TCq7ZH1ZPDXIy0e-ucpTIm00smkj5FzigWhlucBKAFCVAUMb-vRe7Q>
    <xme:TCq7ZGGEShAdkXbq5IfSFta3uKAc-rPNYol_8xMijaJ0TmSxRot4vAHXVbA5hScqE
    ZhuiSi4yiF9hg>
X-ME-Received: <xmr:TCq7ZH7bdQFT8pmalzfmu5SquCrGjv5GUbvkkYW4H6o7zRvcr7kjbbyoLwUVApW5LOkJRSnkQiE1axUar5CSY4giGFuQX51vmBQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrheefgdegtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeevueej
    teegleelteduueevhfetgfffjeevtddvgfeiveehteehleegueelvdejveenucffohhmrg
    hinhepghhithhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomh
X-ME-Proxy: <xmx:TCq7ZM0UbWNS3M65v9f_hQ3hSYi0zGEokVloGRqyJLBIzSckFa86Gg>
    <xmx:TCq7ZKHNYYXWCgKD_zjZOU9r1sOvY39Mj8MShcYCtKdyeVR5UEnxGw>
    <xmx:TCq7ZN_PtVg-dM5FYg59TYvTmTTTTR2QSJOfIdAWF0ACC0SpM3Ehag>
    <xmx:TCq7ZPSNYmQmk9ug7UAWxnK9DruuJTEg7N6lsK5_oPDb681WfYLNRA>
Feedback-ID: i1568416f:Fastmail
Date: Sat, 22 Jul 2023 03:00:57 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
	"committers@xenproject.org" <committers@xenproject.org>
Subject: Re: [PATCH] automation: avoid duplicated builds of staging branch
Message-ID: <ZLsqSWXvwxBQK3NG@mail-itl>
References: <20230717130925.28183-1-marmarek@invisiblethingslab.com>
 <cf7ac648-dbef-80bb-986b-3fe0daef855a@citrix.com>
 <ZLVLaPeyOwDYYUXL@mail-itl>
 <alpine.DEB.2.22.394.2307211627080.3118466@ubuntu-linux-20-04-desktop>
 <ZLsd3tdSvTLwIyt3@mail-itl>
 <alpine.DEB.2.22.394.2307211712430.3118466@ubuntu-linux-20-04-desktop>
 <ZLshtl8KKgyR1wlY@mail-itl>
 <alpine.DEB.2.22.394.2307211749270.3118466@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="h7eMUhM/gt6xWL96"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2307211749270.3118466@ubuntu-linux-20-04-desktop>


--h7eMUhM/gt6xWL96
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 22 Jul 2023 03:00:57 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
	"committers@xenproject.org" <committers@xenproject.org>
Subject: Re: [PATCH] automation: avoid duplicated builds of staging branch

On Fri, Jul 21, 2023 at 05:49:49PM -0700, Stefano Stabellini wrote:
> On Sat, 22 Jul 2023, Marek Marczykowski-G=C3=B3recki wrote:
> > On Fri, Jul 21, 2023 at 05:14:01PM -0700, Stefano Stabellini wrote:
> > > On Sat, 22 Jul 2023, Marek Marczykowski-G=C3=B3recki wrote:
> > > > On Fri, Jul 21, 2023 at 04:42:11PM -0700, Stefano Stabellini wrote:
> > > > > On Mon, 17 Jul 2023, Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > On Mon, Jul 17, 2023 at 02:14:14PM +0100, Andrew Cooper wrote:
> > > > > > > On 17/07/2023 2:09 pm, Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > > > "staging" branch is mirrored (automatically or manually) to=
 several
> > > > > > > > repositories. Avoid building it several times to not waste =
runner
> > > > > > > > resources.
> > > > >=20
> > > > > Hi Marek,
> > > > >=20
> > > > > Let me try to understand the use-case a bit better. You would lik=
e the
> > > > > following "staging" branch to run a full pipeline:
> > > > > https://gitlab.com/xen-project/xen
> > > > >=20
> > > > > But if someone under xen-project/people is mirroring
> > > > > https://gitlab.com/xen-project/xen, this patch is attempting to s=
kip the
> > > > > additional pipeline. For instance, if I am mirroring staging in my
> > > > > personal repo:
> > > > >=20
> > > > > https://gitlab.com/xen-project/people/sstabellini/xen
> > > > >=20
> > > > > We are skipping the additional pipeline there.
> > > >=20
> > > > Yes.
> > > >=20
> > > > > Is that correct? If so, it would be easier to ask everyone to mak=
e sure
> > > > > they have "Trigger pipelines for mirror updates" unselected:
> > > > >=20
> > > > > https://docs.gitlab.com/ee/user/project/repository/mirror/pull.ht=
ml#trigger-pipelines-for-mirror-updates
> > > >=20
> > > > If that's set in gitlab as pull mirror (instead of push from somewh=
ere
> > > > else), then that indeed may be enough. But is it really in all those
> > > > cases?
> > >=20
> > > Yes, it is an option in the pull mirror, by default should be unselec=
ted
> > > I believe.
> >=20
> > Well, if that's the case, either it got manually enabled on those 4 (?)
> > forks, or those are using something else for mirroring the staging
> > branch (in which case, the setting would not help). I can't see this
> > part of the settings in other's repositories, so I don't know.
>=20
> Do you know the name of those 4 forks? I can help figure it out.

Looking at "activity" view on gitlab, I see those:
https://gitlab.com/xen-project/fusa/xen-integration
https://gitlab.com/xen-project/people/olkur/xen
https://gitlab.com/xen-project/people/andyhhp/xen

There are few more that have staging branch almost up to date, but seems
to be pushed manually (based on it being not fully up to date) and less
often.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--h7eMUhM/gt6xWL96
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmS7KkgACgkQ24/THMrX
1yxhegf8CpIRuscVvz8eu4Peya5tueT3wk+FsEjUf2JrIercZpeFZNW9se2/y9KP
tKQtXv0sii6of1H0pI+YjzPrpo2XFFxAddDhn6xwdP56fVL/EpXjVLJLsRnOkOuQ
VNjQNSifYVosokYFHH+ZtnKUDS0Z4aoheeH6E6CwahBawIBFPDp8BCsmM1vScpXc
1X+CqOCngfDgkAgCYEWMU2rhEKxFFVqmBGdvuYcm1QyKcp2n0yXF2UV10tSzmBcM
kdFq7DjeXY43NWNe1h175Y06fiti1dXPWAPIcZN0lz5I55KJusInBjyW0ivHxOkV
bJxIfhTvMQzuhSTD2a/HGkYjFWtN0g==
=ph9t
-----END PGP SIGNATURE-----

--h7eMUhM/gt6xWL96--

