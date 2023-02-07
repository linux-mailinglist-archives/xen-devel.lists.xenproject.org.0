Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C88B468CD7F
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 04:35:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490825.759685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPElA-00036O-Bv; Tue, 07 Feb 2023 03:35:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490825.759685; Tue, 07 Feb 2023 03:35:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPElA-00034Q-82; Tue, 07 Feb 2023 03:35:08 +0000
Received: by outflank-mailman (input) for mailman id 490825;
 Tue, 07 Feb 2023 03:35:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UaN9=6D=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pPEl8-00034I-BP
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 03:35:06 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67e94709-a698-11ed-933c-83870f6b2ba8;
 Tue, 07 Feb 2023 04:35:04 +0100 (CET)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 652CA5C013A;
 Mon,  6 Feb 2023 22:35:02 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 06 Feb 2023 22:35:02 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Feb 2023 22:35:00 -0500 (EST)
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
X-Inumbo-ID: 67e94709-a698-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1675740902; x=
	1675827302; bh=YARagWVFzU6m/TyGyOyBiivedx2s/TAdmuAhqEgAIeE=; b=L
	IBFjdIkUOUicwAweFVQm6V7quANljBk/Ftwc1QgtnrIizT4fK1UeULF6/AXv8gGe
	kGce0I/eK8YUsozG9XBDiKW3mWQ9upE6/TltSZjRzTya8giVWIy0Ng7etstAifWl
	Iizkj/Gn+tnCh8Y0qzA6OLjOoZtaUW1Bne0NwWLRNl75DnmzW17pS8U+gWw+Icmf
	5Rnb97NHJbg4ryZoLBxiSwCvqisNEmg95SvChb69CiQovDz8J/6kBHYoRLJD4RM/
	hsZ9lRFFwE8kriEBJUmT8vaqMiSrtQzAoz/CRs5oeRofnqcdkNuOjXNU0UT4nb2A
	T7btvODBn4aIbdefY5b+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1675740902; x=1675827302; bh=YARagWVFzU6m/TyGyOyBiivedx2s
	/TAdmuAhqEgAIeE=; b=ligvz5dhd/XKuRx3waDQJfDQOwepPJwK9bcr7hAxNJ15
	XIv2Zex5+PfQXM/91rMKFYz2dQcz/qxGNI5uYqBUTINQPIljdBpYK0J+WFNmEez+
	Oht5hm9jQGAlEP0sY+FKeuDJwwlQa66T0Um63FLNIm9vrvKCxXkiXGqa8QcRQHMo
	6T29n9d6v6MOfdmyKLGzgFq4TVs4rW1F2qbB8Yb6Ad8rl3eQfQSYgsRyWh+4VI7N
	hE+ywqCyjbyV/wWZvjOx0eOorzARLCGjA0AGBX1vzRL148ThDhm6Ge6cwsrRsLB/
	bKTAiqckqSN35XFoVRRUitLH1Bn7usv7U6qoNa0DOw==
X-ME-Sender: <xms:5sbhY_-U2ICZq079rPuWu6DGnO5_AjTXc0qCvp_BzKb2Q-Ah9J5gAQ>
    <xme:5sbhY7umHjehkH2zAyRIAtYuhsQKxuY3lZDuAmnJO9u5ZMGK72L8WEmAfXxlNMwTQ
    0Dxp45sCFVHdMo>
X-ME-Received: <xmr:5sbhY9BXndcZ6RHeCzHPyPoWvBGjTDDXXKUFSKwye7PLPq2IEwA29aWTYq4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudegjedgheelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepvdejteegkefhteduhffgteffgeff
    gfduvdfghfffieefieekkedtheegteehffelnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:5sbhY7evhsNdaqwZ9FRJa7bZsGQnrZWAdtuW8LDUXfoVnja8wrJY_A>
    <xmx:5sbhY0P_Li2WROe19kCRop0gs1S-Ae2wIQIm3ucclYd7QdFxcEgQRQ>
    <xmx:5sbhY9l9A2NeX6tVVwIhKnHinSStDb4AHA1rNgFu9i7iI8XZ4ZYT4A>
    <xmx:5sbhY1HorzHnWLomgX0QoEQNKoNnpK6uMUTNyMkB6my1uKER0K_aPA>
Feedback-ID: iac594737:Fastmail
Date: Mon, 6 Feb 2023 22:34:55 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Doug Goldstein <cardoe@cardoe.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] Replace git:// and http:// with https://
Message-ID: <Y+HG4tSeoTAPTNuJ@itl-email>
References: <f10112b7fa66d0fda3c5fd523e6240cd72730b90.1675739352.git.demi@invisiblethingslab.com>
 <Y+HFCbLqpSgSadTR@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w8Nifwht2W675Aj3"
Content-Disposition: inline
In-Reply-To: <Y+HFCbLqpSgSadTR@mattapan.m5p.com>


--w8Nifwht2W675Aj3
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 6 Feb 2023 22:34:55 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Doug Goldstein <cardoe@cardoe.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] Replace git:// and http:// with https://

On Mon, Feb 06, 2023 at 07:27:05PM -0800, Elliott Mitchell wrote:
> On Mon, Feb 06, 2023 at 10:10:33PM -0500, Demi Marie Obenour wrote:
> > Obtaining code over an insecure transport is a terrible idea for
> > blatently obvious reasons.  Even for non-executable data, insecure
> > transports are considered deprecated.
>=20
> I completely agree with the premise, but I would suggest the better
> approach to removing use of git:// is to instead require signing of
> commits.

I fully support requiring commit signing, but I don=E2=80=99t consider comm=
it
signing to be a replacement for transport encryption.  I also strongly
recommend using SSH, not GPG, for commit signing: it is vastly easier to
use and the attack surface is much, much smaller.

> I'm also under the impression git can use TLS, though I'm
> unsure whether gits:// works (and what revision of git is required).

git uses TLS via HTTPS.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--w8Nifwht2W675Aj3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmPhxuIACgkQsoi1X/+c
IsHdTxAA3ymYrjj9pvU67Gqp6swv/MgRdqI0D3lMfc+HLORwqS84H2CRxBSZaZ84
poNfq7fHgcdukt0KS6UHEPFUweNleHu2EeGP66djaacZrZBYalmkni8ixYRgC/o4
tyCo/qv4PtQ50Acwkp09plwjmf3rq768BjpYhlx3TO40YnMCObJ19qNMtOrHRc6Z
qcDxh01g9ON6Cgd3Qmpy2Hcr0gR4v9Rc3jFdlqdrPoNT7gfyVS4KZJS/i+3t3m5K
/CC/ZkWmR/CNwNxKskDTLXwvDZn/DHiyapL0dNxEFA2J0FeDzRpP4O+pLM/cfKA5
o9EPbunxWr/6nPKsRvaFtB5chjHqvQ4XY+lJav83a5neF+nnfEY3IV6Xb8kr3+V9
JwEdG0cyDBrTrJ5PAbHE1lPHcZlmBDoXdyzzma2TZ7shfa+Azioa6S3TfZvdTKz+
bUYFiZUEuYoiOQI0IIjyJnnZzdvci/+AtLNb8u25f2pLcS8W1DfqgW2fGB65QTHx
aXH96dpMv0XoN6ZZkigReOAttYxhBDVUScAbaj1uTqyGjcpqicPGRSFKI/do9RH8
Vz4fTrQtQvht/wj1XezJzObrKCGw+6kc6iKRbJJ3aRkxn6PJ/2gmpESNAtfEYuuk
4OhVI/OBosHUwwwYQlP8xuREPJMuXDm6qLK31jFRAIXIeLtjckQ=
=PlQa
-----END PGP SIGNATURE-----

--w8Nifwht2W675Aj3--

