Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E93644CA3
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 20:48:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455500.712982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2dv2-0003me-JO; Tue, 06 Dec 2022 19:47:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455500.712982; Tue, 06 Dec 2022 19:47:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2dv2-0003jY-Gb; Tue, 06 Dec 2022 19:47:56 +0000
Received: by outflank-mailman (input) for mailman id 455500;
 Tue, 06 Dec 2022 19:47:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Feu=4E=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p2dv1-0003jS-Iw
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 19:47:55 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de97188f-759e-11ed-8fd2-01056ac49cbb;
 Tue, 06 Dec 2022 20:47:53 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 6E2CF320091F;
 Tue,  6 Dec 2022 14:47:49 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 06 Dec 2022 14:47:50 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Dec 2022 14:47:47 -0500 (EST)
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
X-Inumbo-ID: de97188f-759e-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1670356068; x=
	1670442468; bh=7PxGH++ZXOjCgYUoyhqV4Jse7kIymLpDVATOiFKB5Pw=; b=v
	a4cGxqCf93Ox4NEStC30qK/YTL8MG2ho9yAQWhY0KN+vJXKFdnFcz6+9hOJpaDaG
	k9yyxR8ONmGKKi0Snki0s29DhIWYW1qtG3Kz4FR++ulcAzmtyiZ83njMEUnb/1pX
	mNUzKa8SPZQAL7o0E3IslkBzlQ4scMaeJjIaWWOCfmNAo7UMZz6iHn6K0P2Z9+7M
	US15vPvFzSZkP7kYOxIzGFPsor3ZkWSBwOCt1ccxENfkZZJmyxgzKDvmR2G0ls5E
	aFvn9H4agpXrueZE3Zxl9jobOBAFf5gZ3fHmDczSrMQxHRYRdonFhYfJkJMjRGV7
	LfYpVDou3PW90i6CLvIKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1670356068; x=1670442468; bh=7PxGH++ZXOjCgYUoyhqV4Jse7kIy
	mLpDVATOiFKB5Pw=; b=MSg432abCvOWSCFezPjXwBgUcJ5RPLoA4C+RrM/04k64
	1oeJ1h/GF9pOwCnfHqFWHGbsS7GT8l74SK514NSvBZETdozsNmZgt2pvnf+VjG3G
	bsQ0q+onay+hkDKiZD6P/VFDfuphBpN3sqbhkFvieKt4cFqerMHOwvJROer5d7iL
	6K9y0yZ2Cpt6koNpV/8128PT8szKXxJ2dM+Z4hS5aSHA+uKXMSgS3oiUFYLoSi9W
	8orRNZ5xxrPMp6WyzFS4cWATJXNARcuxIn+r0b4/OkA/ifDBX0RFgx513VDflNYH
	egCAuPr9/edV9ty+4nSzae4NW6fF49rOwrm2FIetjA==
X-ME-Sender: <xms:ZJyPY-jSRwqOijRoOxmLeFFHrsRfHelsbT7mxEDCrqMDpMoL9jyF6Q>
    <xme:ZJyPY_BY5826Y2P5t9nE8Mu1UqUNxGaCUtuJVvrGbRRkH3I0cIlGzh7k-wK-GugUA
    _KTMAvwJfXr2Tg>
X-ME-Received: <xmr:ZJyPY2HWCJpf6LG7w0-82_21LfSkXRD4PUwLUHV0ULpjC-HzgYT1uYIPOwJF>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeigdduvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepvdejteegkefhteduhffgteffgeff
    gfduvdfghfffieefieekkedtheegteehffelnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:ZJyPY3TZrYrSyr0usu1TJZSDnpiO-Ecb1TjGRqPoENvcOH9LS0VNjw>
    <xmx:ZJyPY7ySl4jiAeiXkDtLii95ZVkpSfwrRv9Fg7VXWoixDAnCJqJLsQ>
    <xmx:ZJyPY17-lCSuYbWn7JNjtUBoXwLFmpm2JQ5gHFQUagCcFKpZcjSmBg>
    <xmx:ZJyPYynCb2j2Bh1trBBdyMZqoh79Ar-KF2a47P68PHxSaNAYc4KCcg>
Feedback-ID: iac594737:Fastmail
Date: Tue, 6 Dec 2022 14:47:42 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <George.Dunlap@citrix.com>,
	"Tim (Xen.org)" <tim@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [RFC PATCH 8/8] Use Linux's PAT
Message-ID: <Y4+cYuLNfIbKGN+X@itl-email>
References: <cover.1670300446.git.demi@invisiblethingslab.com>
 <9f0bd911ba6c7fe1b7285f232154d42807145ced.1670300446.git.demi@invisiblethingslab.com>
 <4b2a87e1-89d1-b5fb-bd92-b891c8cea98a@citrix.com>
 <Y4+Die8lcZUwwGmK@itl-email>
 <Y4+F9iujzOmoOAVe@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kuuIfO5fhwcHDiCZ"
Content-Disposition: inline
In-Reply-To: <Y4+F9iujzOmoOAVe@mail-itl>


--kuuIfO5fhwcHDiCZ
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 6 Dec 2022 14:47:42 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <George.Dunlap@citrix.com>,
	"Tim (Xen.org)" <tim@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [RFC PATCH 8/8] Use Linux's PAT

On Tue, Dec 06, 2022 at 07:12:06PM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Tue, Dec 06, 2022 at 01:01:41PM -0500, Demi Marie Obenour wrote:
> > On Tue, Dec 06, 2022 at 11:38:03AM +0000, Andrew Cooper wrote:
> > > On 06/12/2022 04:33, Demi Marie Obenour wrote:
> > > > This is purely for testing, to see if it works around a bug in i915=
=2E  It
> > > > is not intended to be merged.
> > > >
> > > > NOT-signed-off-by: DO NOT MERGE
> > >=20
> > > Following up on Marek's report on IRC/Matrix, you're saying that this
> > > change does actually fix screen corruption issues on AlderLake, and
> > > something on TigerLake too?
> >=20
> > Correct
> >=20
> > > If that is actually the case, then one of two things is happening.=C2=
=A0 Either,
> > >=20
> > > 1) Drivers in Linux are bypassing the regular caching APIs, or
> >=20
> > This would not surprise me at all.
> >=20
> > > 2) The translation logic between Linux's idea of cacheability and Xen=
's
> > > PAT values is buggy.
> >=20
> > How could I check for this?
>=20
> See Andy's unit test idea on #xendevel:
>=20
>     as a pretty simple "unit" test in dom0, it might be a good idea to
>     have a module which watches the PTE in question, and cycles through
>     various of the memremap_*() APIs and checks the raw PTE that gets
>     written after Linux and Xen are done fighting with it

Which PTEs should I check?
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--kuuIfO5fhwcHDiCZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmOPnGIACgkQsoi1X/+c
IsEC0A/9HBar7mnTgzBekHJajmP+RACDwnQVhk/eOtvDuke8JiIt14w/eenr2Wz3
NserhjprZP5G6e3vZlY0C779HYE7azwpnQCjpO7a5/WhyvmsppYKyRhRXwg+raNt
egiLsVKHGGh++XGl69159t/YLwOFyHJZl8pRFhNtjyf1YNxRV45CxQIWP6ImTYMl
/v0UC8C3XqZhX4uDZ6EfkuuGSIYc/7kdsYlX9Nq8QxCNFt2RavEarD7pMySFyhi4
oVpa4yBanBT7wWIKGqzvhIL0cpGuqu9/6TOq5xhGkTHIC80s+uQEJ9f3TOmwymyc
ZDNybgLg4tp5tCrCA5lecAilRk/nR5K4giKhLygpayU3HqzFPz6wnZs2ZfZ8flb7
o0qF2LQxa0bj26rbN/y8Y8P2D3j7STNY9g8cXVIr16nrb/MdZ2vjPbzZae5CKzXd
awRELdSEl5LTEDVrXcZMFNz/jJ7elSLI6qEsnPtGIjkbHtiWZXn2m7wMsEHYQsR/
SrMNGjTwGpCsHPVk3rd0oCLtEllU2KvIxs7DLcd9XJO6gKhWPZI75ajQeUtEQ9FS
xzXme7HxnaMbnbIEqA7niqRye9cFpqAvxneatyVaSxSm5dqYZKh+LvtkZsr1kfsA
GeXmk0rAzqk71hCEcRln/qpXnNRh8E4Oft7QDdQMhNc5JQ2Ge30=
=i33P
-----END PGP SIGNATURE-----

--kuuIfO5fhwcHDiCZ--

