Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D7672655C
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 18:01:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544895.850998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6vb9-0005h1-4T; Wed, 07 Jun 2023 16:01:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544895.850998; Wed, 07 Jun 2023 16:01:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6vb9-0005eS-03; Wed, 07 Jun 2023 16:01:23 +0000
Received: by outflank-mailman (input) for mailman id 544895;
 Wed, 07 Jun 2023 16:01:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ooln=B3=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1q6vb7-0005eK-Pn
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 16:01:21 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88ddc2d4-054c-11ee-b232-6b7b168915f2;
 Wed, 07 Jun 2023 18:01:19 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 856305C0229;
 Wed,  7 Jun 2023 12:01:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 07 Jun 2023 12:01:16 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jun 2023 12:01:14 -0400 (EDT)
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
X-Inumbo-ID: 88ddc2d4-054c-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1686153676; x=1686240076; bh=2UoO8B7Qn0k2QzL7d+OGaqTzOAQvpjpsvVc
	EYJCpl1o=; b=P/sylwK0Oo2scXna9wnN25CgyGn7pCDm4HvPPp51OQzHyuY1XG+
	yLkTAfQZoYJXMxIzSsuzfnGWCr8F/fElncTbLW2wbEK4XTxSdgSbZnhqQWccdP30
	3Exd1VvNZr2iXIxUAp5RrlUX/YI6V0erTq6QVQbAMkwNlkg7l2Y/fNMQCcPxBiHA
	Z553O/RH7ofCxhjZGOaV/I2raxnI2QtDJN7SrjD+ssxFyXWRP3fDShCTeoviSgmj
	pIeUOHd8RtMXxKoLKMXixeVYS2kerT7qigsYgpWWVEP3yUTPX9/ljHFstEx6DGTq
	8X2qvxn1rbw9t+cJ+BXLws7pGe0aPCX8lPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1686153676; x=1686240076; bh=2UoO8B7Qn0k2Q
	zL7d+OGaqTzOAQvpjpsvVcEYJCpl1o=; b=M+SYPvvFAPpg2FqxW2Ocp8tcv/oST
	7Xl28iQJ0aAb48lYJanERjkGIkM9A0YzEhJIO9v6fW+Cgp2URoa0x8d0xbGavyR+
	2YaTycU097kwVROrl0P+4Xv5VfX+KjQzryn53sqeNJyLQhHTAV63B35FRDUFQhQm
	sHqRFCer8HEi330HHhdOU8cye4/t7+kaiL7/as4GQfEA9WaBiRuTE87VcKg8zJXa
	VVAATsp5Mv3wEhf7v6Q/CSHeiMjU+jIwz8y5m8jrKqui9RmaUOTJ+DWrjmFwXCPh
	rKWInA60g5hv7g3su31JEKu8s0bk4pjo+FaS9zoMqsKWumXQqUxfZoy5w==
X-ME-Sender: <xms:y6mAZCAeyyUM-kHVAV5VbsIL3UvLppNOgSgtDvot7PZbZti8x7nGgQ>
    <xme:y6mAZMivAmK4iXEjn_1v7xsO3R5wQFmZVSSajSxp7PHszg-YnQR5EAuE527uo8ut-
    snN7U60QXrVs30>
X-ME-Received: <xmr:y6mAZFng0pjAxC1PC4cwSPPys_GSz0SniqcXEeSemy_jhFkwisus2c8bsHI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgedtgedgleeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepudeileefueetvdelheeuteffjeeg
    jeegffekleevueelueekjeejudffteejkeetnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:y6mAZAzoSMxXncH7Nq51svE0z1phQ4XCjtYXeBKLNTstAmVX4nD0IQ>
    <xmx:y6mAZHRZ2Qqpvd9dub90FyXnzgcCpY563OmtmnlWNEDUC9jBABG-gw>
    <xmx:y6mAZLbqv3T3nBcai7EapadB9b8YwKp3jbdKYvxO1itoXOmm7EP1UQ>
    <xmx:zKmAZFOwH_rJJcWgCAIhncEnV1AJUp8dhPhd_ccJJpgDUTddQ3UfhQ>
Feedback-ID: iac594737:Fastmail
Date: Wed, 7 Jun 2023 12:01:11 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Christoph Hellwig <hch@infradead.org>
Cc: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] xen-blkback: Inform userspace that device has been
 opened
Message-ID: <ZICpyBl9/Beq46ad@itl-email>
References: <20230601214823.1701-1-demi@invisiblethingslab.com>
 <20230601214823.1701-3-demi@invisiblethingslab.com>
 <ZIA1yLiJyfcJ45vD@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WgIi5Tes309KNxkl"
Content-Disposition: inline
In-Reply-To: <ZIA1yLiJyfcJ45vD@infradead.org>


--WgIi5Tes309KNxkl
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 7 Jun 2023 12:01:11 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Christoph Hellwig <hch@infradead.org>
Cc: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] xen-blkback: Inform userspace that device has been
 opened

On Wed, Jun 07, 2023 at 12:46:16AM -0700, Christoph Hellwig wrote:
> > --- a/drivers/block/xen-blkback/xenbus.c
> > +++ b/drivers/block/xen-blkback/xenbus.c
> > @@ -3,6 +3,20 @@
> >      Copyright (C) 2005 Rusty Russell <rusty@rustcorp.com.au>
> >      Copyright (C) 2005 XenSource Ltd
> > =20
> > +In addition to the Xenstore nodes required by the Xen block device
> > +specification, this implementation of blkback uses a new Xenstore
> > +node: "opened".  blkback sets "opened" to "0" before the hotplug script
> > +is called.  Once the device node has been opened, blkback sets "opened"
> > +to "1".
>=20
> This is a really odd comment style, and a really strange place for it.
> To me it feels like this should just be a file in Documentation as it
> relates to how to use the driver, and doesn't really explain the code.

Will fix in v3.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--WgIi5Tes309KNxkl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmSAqckACgkQsoi1X/+c
IsGmCg/+PbmcJVAb/MiNuNHzPQ/Vq7YzVW9qFtwIrvQC5Eb7EjXPWQ4P5TRbBdZS
tH4aoGHWANtB8/M1Gh8GmtYHttitFzuO7oe22pIisvOAM4+28uvXojLN3v4SjrhE
/Dn7xkvivLfKKqmTUbyv5cPbhZVc96VeZ5mn0Gt57+oGMQU+DE4BAG8rRicYW2Ok
isEAlvI+V08xKVW0dOYu9Qis/Qm48kQhbCZHWTuXlIrKBgcTYu40LQMrYg9nd8YB
9uQ75fyAiuZMM55fu54spREudNDP1FkFX5uuXj2A1M8Yjl7G93RMaizvUrjPLeUO
fKbiWrk8Nlc0OKnS4WOAYtnvsTpH6LaJuZA7/IT5sYG7fXT0B0krVxvZsgInNxKJ
nsbr46g4Sv2LoJTifF8rrF+ujGBWceDkB5VIo6bhYqNbJ8xLGfaFEYrF7XcliWf0
RstpIOa7kKVA0GV/l8HezD+Iez1BoUatPsPq1cdzp7bTsN2rgG6VK+0jWmV01n/N
8wyHxfXU8Z3NpTNFPJXgjTu4zqcLsKpmpsbP5Ee7W3bKNrUZXIRL6spGRJcOxcsi
POrPJ72Zf8Sw+vULlK0+hKSf3BtckaTVmCU9e3qJE+4ukrzpoFVvf96mPVaXLMaT
OLY/3zj/5bNxCzSC+GWKTMTg2lL6Txbyfyht0YkfmUL3Rgh9i9Y=
=nc8R
-----END PGP SIGNATURE-----

--WgIi5Tes309KNxkl--

