Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 324496A4A23
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 19:46:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502862.774885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWiVu-0005OX-Ap; Mon, 27 Feb 2023 18:46:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502862.774885; Mon, 27 Feb 2023 18:46:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWiVu-0005MI-7m; Mon, 27 Feb 2023 18:46:18 +0000
Received: by outflank-mailman (input) for mailman id 502862;
 Mon, 27 Feb 2023 18:46:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/yXf=6X=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pWiVt-0005MB-2P
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 18:46:17 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 017b9e58-b6cf-11ed-a82a-c9ca1d2f71af;
 Mon, 27 Feb 2023 19:46:14 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 06D3C320029B;
 Mon, 27 Feb 2023 13:46:09 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 27 Feb 2023 13:46:10 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Feb 2023 13:46:08 -0500 (EST)
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
X-Inumbo-ID: 017b9e58-b6cf-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1677523569; x=
	1677609969; bh=I9yZfPovLr2nND0lDAG9JxWqeWCllW3loIVg9zVOhS0=; b=H
	HsM3E58QWWfvsUvnUVkiaOixBIoKc3RiVMZFpQdD81KRCeELt1teCpOqfR0SYZyO
	XG46uO6WIpYpmLzAUKUkjRfTlY8HP50Rv5+BEpX/dLvCjE3CO+9tcf7x/pkAOD29
	flP8BEawETU+Ie/NgH687G2mKdjr/j8yIHTzlt4I/si80/wazqMt8rPQv8yuZyax
	EEtUwdx3Ok+R+1gLSMII+rtPUgW7VjBs9hmnPymEuv3FumCHxkFDTcBynFHmiLPc
	GnvUrlDwR2bTmcnJeazxxynpGguOby74n3RGLDfO/SiXhCHyKWLrhE22Yz8WO724
	m0D7xoWA4Gk8VEmkwqVhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1677523569; x=1677609969; bh=I9yZfPovLr2nND0lDAG9JxWqeWCl
	lW3loIVg9zVOhS0=; b=HqYIRR/G+/A5W7GaGPyj7mXA/e2ICftZHF9GnY6nmBI4
	FmUoBJIGBAL9RpTSGswtSf7rkEFssFeLuWHsXs7fgU4mudTz+opzQSS8BjKhTWHe
	GROlQK+PTJEvEmPbueAvphRFvlEbKSg9lRsEeXe2PM+1Jg90i/0RwAT4kjmHakVg
	p7wSVGovA3dH6//l09X6QD7b6XyY/R1abk6pFnWJuQpEPzZvnqljKFrv5UDyjPjh
	e/P7YSGsshB9ArvDg6gDQEwWkDRhqxsZoZ9vGGpD3LfJ7so0/8zgpCKgRhOS0Jfq
	qo3h2lE/OaiKCxBGcQgui86ZY1eZVt7C5rWv6IHJvw==
X-ME-Sender: <xms:cfr8Y7SsSw6N04OI7t2PfXVveT9QBUd04TuF2bnCQf5nr3E1Y-9h6A>
    <xme:cfr8Y8xcSKlyu-IQpp5d9IyDc_vr05hz4t8OQJHJiMga7LWyosqsJffneQ-dpFned
    x1_VpmMct-CQgY>
X-ME-Received: <xmr:cfr8Yw0jn4Jy6c8K-tuYeh3cLlaZrextkTcDS6uds583O1AhaUKeMZC1xYg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeltddgudduvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejgeegvdeluedttedtffeiueeg
    ueeiuefhvedvteetvedtgfeuhfefjeegleelheenucffohhmrghinhepgigvnhdrohhrgh
    dpgigvnhhprhhojhgvtghtrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgrsg
    drtghomh
X-ME-Proxy: <xmx:cfr8Y7AGH3Lk-0kvALnLZUFF1Iswzz7BZdtVlDU7Q0ZASOfIyU27pg>
    <xmx:cfr8Y0i9u32Ku8lxTh78b0p20A1CBTxZtM0quwR5pSMJigGxItnPnQ>
    <xmx:cfr8Y_rjRKTX1P3K8cPvjwXt9HxezHFhrahZRhG-iWrrdLVjDvGqRw>
    <xmx:cfr8Y_WmjaXMitI8Z5R6Muc-clc2V-bSO6A7yM8sJ17f0cI7pFVm8g>
Feedback-ID: iac594737:Fastmail
Date: Mon, 27 Feb 2023 13:46:05 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 2/5] Change remaining xenbits.xen.org links to HTTPS
Message-ID: <Y/z6blqd1+e22B3a@itl-email>
References: <cover.1677356813.git.demi@invisiblethingslab.com>
 <e36a472b3e58ee81e8d61e7306f0ee2068eff62a.1677356813.git.demi@invisiblethingslab.com>
 <db7d6e42-2fd5-b7f0-ec84-ca7ffcf5d105@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PJiz44JW7X/YJje1"
Content-Disposition: inline
In-Reply-To: <db7d6e42-2fd5-b7f0-ec84-ca7ffcf5d105@suse.com>


--PJiz44JW7X/YJje1
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Feb 2023 13:46:05 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 2/5] Change remaining xenbits.xen.org links to HTTPS

On Mon, Feb 27, 2023 at 09:35:51AM +0100, Jan Beulich wrote:
> On 25.02.2023 21:37, Demi Marie Obenour wrote:
> > --- a/Config.mk
> > +++ b/Config.mk
> > @@ -191,7 +191,7 @@ APPEND_CFLAGS +=3D $(foreach i, $(APPEND_INCLUDES),=
 -I$(i))
> >  EMBEDDED_EXTRA_CFLAGS :=3D -fno-pie -fno-stack-protector -fno-stack-pr=
otector-all
> >  EMBEDDED_EXTRA_CFLAGS +=3D -fno-exceptions -fno-asynchronous-unwind-ta=
bles
> > =20
> > -XEN_EXTFILES_URL ?=3D http://xenbits.xen.org/xen-extfiles
> > +XEN_EXTFILES_URL ?=3D https://xenbits.xen.org/xen-extfiles
> >  # All the files at that location were downloaded from elsewhere on
> >  # the internet.  The original download URL is preserved as a comment
> >  # near the place in the Xen Makefiles where the file is used.
> > diff --git a/tools/misc/mkrpm b/tools/misc/mkrpm
> > index 68819b2d739cea5491b53f9b944ee2bd20d92c2b..548db4b5da2691547438df5=
d7d58e5b4c3bd90d0 100644
> > --- a/tools/misc/mkrpm
> > +++ b/tools/misc/mkrpm
> > @@ -34,7 +34,7 @@ Version: $version
> >  Release: $release
> >  License: GPL
> >  Group:   System/Hypervisor
> > -URL: http://xenbits.xenproject.org/xen.git
> > +URL: https://xenbits.xen.org/git-http/xen.git
>=20
> Please can you not lose "project" from the URL? That's the more modern
> form, after all. In fact, since you're touching the other URL above
> anyway, I wonder if it wouldn't be a good idea to insert "project"
> there as well. With at least the former adjustment (which I suppose
> can be done while committing, as long as you agree)
> Acked-by: Jan Beulich <jbeulich@suse.com>

I=E2=80=99m fine with either or both of those adjustments.  I was not aware=
 that
https://xenbits.xen.org is an alias for https://xenbits.xenproject.org.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--PJiz44JW7X/YJje1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmP8+m8ACgkQsoi1X/+c
IsGzAw//UYkI/gzsVxRKpK2U6g/sZZOKtRO6oZUCQsr/6+f04xnJzKw3/lAgtI0X
YAzFbKq7UXCpflzwYB9Bwpbwd4MKFG3/wO8Pz1rLa1TiowNL/NPVBCiIv2AbS3Nf
pmRA2WkVzIJ5bL6QR3MyMp6veaQJHjG0CYu883Xii137I/asWY1I/rVBNHsQn/Fr
cLgZiOL6hxsmYr1qJaglyqSNHzRgA95AZg7pzHES146BAj6MuzUDCv0gmnmEsiUe
+iCmrRQlBTv7qEz4ksw2T4q6TCg0rdFy1BAPrkd59ZfHkrn5A19hIX/unawij3yr
U/0GxTNGe4khuiKn0PY+9IDJbM5o53YSu+3m7Es2FeMofRQxowChUoqB6RATHsLO
rd9nzusn0jGQuHTNk44E0qguOvCTdzOWa921jO/zvWwBe0UPbFeAWcdgl1dDrVQG
afsZ8Q4pct1Quilb96L6C7EVJNOGve4DntOQFtWvJ/MrKnGQbjdOw5q4QwEirnOd
ZKif5td74usFjKOiZU8wHFSqgdv1G1CjRcGFV9aQH2L47UkCXsbtJeLEHg+et26X
WecF744+CoYw6Hc32grQ6l4ITLYucH7ItryK82cKR3LF/u02PhMnHUF0iGNZDrV2
NEc+JZnzNn3SX9ODwWmtePxdVWkzMivj4jZW5IOeu/m6rXJnFaU=
=PUzj
-----END PGP SIGNATURE-----

--PJiz44JW7X/YJje1--

