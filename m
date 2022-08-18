Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 595E15985A7
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 16:24:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389612.626658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOgRf-0007HD-FR; Thu, 18 Aug 2022 14:24:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389612.626658; Thu, 18 Aug 2022 14:24:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOgRf-0007Ep-Cf; Thu, 18 Aug 2022 14:24:27 +0000
Received: by outflank-mailman (input) for mailman id 389612;
 Thu, 18 Aug 2022 14:24:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zfC2=YW=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1oOgRd-0007Ej-Vu
 for xen-devel@lists.xenproject.org; Thu, 18 Aug 2022 14:24:25 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74faefcc-1f01-11ed-bd2e-47488cf2e6aa;
 Thu, 18 Aug 2022 16:24:24 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 509CD5C0106;
 Thu, 18 Aug 2022 10:24:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 18 Aug 2022 10:24:23 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Aug 2022 10:24:22 -0400 (EDT)
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
X-Inumbo-ID: 74faefcc-1f01-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1660832663; x=
	1660919063; bh=7ueH7NUObNfB3dhP/mqJuxuTnkQaAwKFZQyXwvFi7Ww=; b=B
	Z1Fin4Cs2G7JJtQierYdDE0CceNV7/9pMfelowm0TcsWwGBJBFT54+kyZ0Ot75bB
	2tGsIYW/Y2umsilfsSwXYrhYnR+J3txOHXm61EIzJIJyX7NV97DoOhOidNFknsAB
	cH3o/A+R2HQ6ltDVjv2/1g7X25bAf4IbKFZVs5zLoygAEQqsXcpImapSvqMC2Ap2
	gQEVssXLpqnl0ujy7tpeOsF7SVI75N/s4HO8VObaua5Tx2+jy7gd5MOgBXKWC+Fd
	YlvH9+rVGVQMxLOVTHAHo676GubcHXndX7I8aCl5yYPQg5lEJ8+EEykG5t4ij+BK
	qx6Wks7Ib9nDS0nN3Ny8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1660832663; x=1660919063; bh=7ueH7NUObNfB3dhP/mqJuxuTnkQa
	AwKFZQyXwvFi7Ww=; b=YNL6VPbghN8qmnS+7LsXjNx1xU6e1EZcpEpc+pi4z0BG
	bvZUx0f0E8KKkZMOXI1vRAXmqb8tROsq8Od6/QMh0BPWf/OfA+UFGVNwKq/6cVWo
	Z45lYSaOBM4cwP5j9a6vrsy5Yy6eGn5F/b5dkfWJpOnTDTqhTnsJLrViWkn4EjzO
	61nTANuOy2YggZtSPp5qdzFcYbt6d7TVsQ6s66gXnTB9p4PRcU70nMcbwvs//svH
	h2r0iMxNBAykO3Np/Zwi7P6DPdh3yeBcvHXWwUyDPLw21OQ4Y1XD3Qbuw3pfWc7u
	AgvoYc5cDzRbUfZLrk37R+tCGPeje1bUmGwMIKRAAg==
X-ME-Sender: <xms:l0v-Ymn-Fy1L0Jr9bhuLlZC7nY_QvHa0xZpKAVbuCCRkoEe2-5h4nQ>
    <xme:l0v-Yt3Ei6BfN54akGTI95zVpcHg4uQ_lsDfPd2TrLm8a7vMJn1eF36SSC4vOySbg
    2QWl078Vpd7F-M>
X-ME-Received: <xmr:l0v-Ykq4fQfGzN_xYYGvrnUsxcIJDEPbT8BPqIzoaajyPzX_nloOepQiGmPq>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehledgheduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepvdejteegkefhteduhffgteffgeff
    gfduvdfghfffieefieekkedtheegteehffelnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:l0v-YqlfNXkz_SATEmFjpOlj9UL5zE4y4sxVNTqe6m286McqkKt9Aw>
    <xmx:l0v-Yk1Vu4lAUZ7lvvi9jxC__2miHyYCDe1dey5hoFN1MrWSmudIXA>
    <xmx:l0v-YhscSd31TnWkiFn5oYUTep3yBn9lNx-b8qDrww-sQgihaC5j_Q>
    <xmx:l0v-YiDfDP9R9KDsLJ39FzGPgOSS2dRUeSqIG9ruGdjaKUJokjELSw>
Feedback-ID: iac594737:Fastmail
Date: Thu, 18 Aug 2022 10:24:01 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] Use direct I/O for loop devices
Message-ID: <Yv5LlJQWkHTq07QH@itl-email>
References: <20220817204634.1886-1-demi@invisiblethingslab.com>
 <499daffa-b1c6-3868-c164-65335963922c@suse.com>
 <Yv5HC/MA2LUHNYKO@itl-email>
 <b7e4433c-a1e2-03d0-20bd-e17ace99f640@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m1R7U2xm5hsa22/E"
Content-Disposition: inline
In-Reply-To: <b7e4433c-a1e2-03d0-20bd-e17ace99f640@suse.com>


--m1R7U2xm5hsa22/E
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Aug 2022 10:24:01 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] Use direct I/O for loop devices

On Thu, Aug 18, 2022 at 04:12:10PM +0200, Jan Beulich wrote:
> On 18.08.2022 16:04, Demi Marie Obenour wrote:
> > On Thu, Aug 18, 2022 at 09:02:11AM +0200, Jan Beulich wrote:
> >> On 17.08.2022 22:46, Demi Marie Obenour wrote:
> >>> --- a/tools/hotplug/Linux/block
> >>> +++ b/tools/hotplug/Linux/block
> >>> @@ -330,7 +330,7 @@ mount it read-write in a guest domain."
> >>>          else
> >>>            roflag=3D''
> >>>          fi
> >>> -        do_or_die losetup $roflag "$loopdev" "$file"
> >>> +        do_or_die losetup --direct-io=3Don $roflag "$loopdev" "$file"
> >>
> >> I guess you want to first check (maybe in tools/configure) that losetup
> >> actually supports that option. The old-ish one I'm looking at doesn't,
> >> according to its --help output at least.
> >=20
> > What version are you referring to?
>=20
> The tool itself doesn't recognize --version. It originates from
> util-linux 2.19.1 from all I can tell.

I see.  Qubes OS doesn=E2=80=99t need to support such old versions.  Are you
referring to=20

> > In Qubes OS the current plan is to use a block =E2=80=9Cscript=E2=80=9D=
 written in C, to
> > improve performance and (when combined with kernel patches) eliminate
> > race conditions.  This code could be made a wrapper for the C version.
>=20
> Is this relevant here in some way I don't recognize, or did you say this
> only to provide some further background info?

If the C code becomes part of the toolstack it would avoid needing to
call into losetup.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--m1R7U2xm5hsa22/E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmL+S5QACgkQsoi1X/+c
IsESWQ/9HP38OLGHK24PUlxDPb3xI4k5IkCcCRNjO9zhERgHWFZPDxEVN40AAj1V
JdcABEkEw+Y3JZ14oOU2/RDEpYVJfJV3bchamiYq+vnOu72NZaQz04FrOo/we1vH
a6jXHe9H8ncZmd6RmQnK+ViFh6s9JsBRZ8h1nNrNjKcoNphhnwtIMYIUMRrRicIb
qFjXEVULEAyR4e5peF1mxwbQ/sFMB1gArot03S5DGwfUw9o4mS9kIGrL0eX3n5MH
uGr7lJzl8hPwnTUtl6x+eYCXEVanQ3AeKsTykYsB8uOwp1ED1F9DAl+LQK/MqNXq
AH6O1vcw0QI2xLuLVT+H4mxkE0AeIjcQwwpkxJCvXtsI7w/C+lQjQyFSz9WTTYT2
+5c/JGF3U4naa/TRkXAx7vOFW/9O19VrhkHs3HrrbnPsPl36wG9quwUNA8bA2pXG
9F6kkALzU03Lw8HIR3cnPQGRnJXurJ6utjvToSPE7mMrIB4s1iEnTXd2PtAZc+eI
JrXsdIDHMJtXqLZmKU9a+N3ixdKr2Pf4wIqR4Lz2Owa+tWJJeAdU15MI4zZujOto
L+9t5W1YYIxFV2MwRq7epg9T3WDRVnsPF3Oa2F+9yw539bj41cfixqUawbycvHOt
wXzbGGl4htiXAFadv4WnH8n21fMQP5oSKyFi+1mZ6u0kMepSeoA=
=UMum
-----END PGP SIGNATURE-----

--m1R7U2xm5hsa22/E--

