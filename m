Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3D87CEB0F
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 00:17:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618788.962892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtEqK-0001pK-FS; Wed, 18 Oct 2023 22:16:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618788.962892; Wed, 18 Oct 2023 22:16:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtEqK-0001mZ-Cx; Wed, 18 Oct 2023 22:16:44 +0000
Received: by outflank-mailman (input) for mailman id 618788;
 Wed, 18 Oct 2023 22:16:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1DIN=GA=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1qtEqI-0001mD-9z
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 22:16:42 +0000
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 015cc59d-6e04-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 00:16:39 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 0B2763200A7F;
 Wed, 18 Oct 2023 18:16:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 18 Oct 2023 18:16:36 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Oct 2023 18:16:34 -0400 (EDT)
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
X-Inumbo-ID: 015cc59d-6e04-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1697667395; x=1697753795; bh=gqt7w3BtC5yBlDumOlLKLClmvzl6B4YY55b
	AtjOMMCo=; b=S84qF8bjDzfBXCNi5IBi6wptrLkIu7Wy1GpJgA0THLC6MdEm1NU
	qRNCLXDJb/GIOQfnNK3/M5ndkrrci97YR1ZKY5ddAKWLn17Zyuq0I/8TOoowSSy7
	bcoFYUx6q9+Z2WSpcGC0LaJF/7HWPHs3Avej8api8mU9CevzSX1DMOgOCS8+Jn5/
	ArC14S6n1tPAKc4vkGI048nGkLgRl65Tu1Z5q48ltnopCG2uhlAUbBuWE65Tj6vW
	Q6VaOcraFHdLQNCOM8ckNKbU2RrV9Vazq8YQDVMSxEMefHMHggXUoC304LUgRQS9
	XcpkNvrbcq9ZulHcJ4T6JWg8uydralYUdqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1697667395; x=1697753795; bh=gqt7w3BtC5yBl
	DumOlLKLClmvzl6B4YY55bAtjOMMCo=; b=LduNQjsAmMLZvd3g+2/tmxl40Lw9C
	rmHfxtUOAc37Lk+jKY27moqqbNH4nybqxaTZ9Fc67ab2Mn/XjydnN7RDkQ7yqLlU
	Fg3hffXflbhzF+wSnaMfGX2fAXqfmSOlGLz15KSlNaaT6yapLBqe3n0ygjzu+Tzg
	q5Jerp7Cl33fK3sV0Gk2EmNE0m3+OYuIY7TxFROTaF1Enc0nv5glPf/tkYhxTXo7
	kSzvSgQ8QtKTwKBQOVanCLRSzEsoUkoFpTQzVT+ikRMoId5FRv/55+auP5TVn6F8
	UVKg8yf/tKf/TNIJTakSe48iIvS9tGLbGWoX2JWsdnmtGkXTc1IGx82XQ==
X-ME-Sender: <xms:Q1kwZTG3TAT9SiY1lzLpflhdzLmfeuwFgoLews5Zjb96_YcY_kvvbw>
    <xme:Q1kwZQUiYmjwqzzSwgzkrdrj8cXn4fHNoQfs3mU4DsjFVQRvnhYEQF-k-8BjZ9jjA
    8IA9D9Qa_quqw>
X-ME-Received: <xmr:Q1kwZVJSVUa9AKVJHihKOvpzK6T-Lg0DiQBZQ7J2ApONHatOib3fqY_E53JrgzEv5fU0ya6lejgzWJD2mBj4gPAYbBBI6f8r7fs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrjeehgddtkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeevueej
    teegleelteduueevhfetgfffjeevtddvgfeiveehteehleegueelvdejveenucffohhmrg
    hinhepghhithhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomh
X-ME-Proxy: <xmx:Q1kwZRElxd48Jye_IbQ8ZRscjy4TWOjTi-Lq8t0vQCtK7HgjD296aQ>
    <xmx:Q1kwZZXSLR_QkK1x2q9i2gufNKQrOO6jhSxIkTqnWEryPCUW8WDnhA>
    <xmx:Q1kwZcMj90nKVuRh4ScIR6XPIIM-tVqX9-pKNVHArrHxV1gbis8SbA>
    <xmx:Q1kwZWi9BjJfQm77agGD4Nq5ccR_F78WU1-dOmOMWQum4zy55AYYmw>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 19 Oct 2023 00:16:31 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Henry Wang <Henry.Wang@arm.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 2/5] automation: hide timeout countdown in log
Message-ID: <ZTBZQGS91FfSeClt@mail-itl>
References: <cover.550599c54c91da4f8417fde358992e75bf8163c0.1696557834.git-series.marmarek@invisiblethingslab.com>
 <126f25fd791aa1f3e32463e600c59967504e19b6.1696557834.git-series.marmarek@invisiblethingslab.com>
 <9bcd8476-2a3f-43a3-8576-1e31d0df4bd3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ry7Y1FzsF4tVHVJM"
Content-Disposition: inline
In-Reply-To: <9bcd8476-2a3f-43a3-8576-1e31d0df4bd3@citrix.com>


--ry7Y1FzsF4tVHVJM
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Oct 2023 00:16:31 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Henry Wang <Henry.Wang@arm.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 2/5] automation: hide timeout countdown in log

On Wed, Oct 18, 2023 at 06:45:03PM +0100, Andrew Cooper wrote:
> On 06/10/2023 3:05 am, Marek Marczykowski-G=C3=B3recki wrote:
> > grep+sleep message every 1s makes job log unnecessary hard to read.
> >
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
> > I know I can download serial log file, but that's 3 more clicks...
> > ---
> >  automation/scripts/qubes-x86-64.sh | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qu=
bes-x86-64.sh
> > index 1e84e40a4afc..5464d10fc343 100755
> > --- a/automation/scripts/qubes-x86-64.sh
> > +++ b/automation/scripts/qubes-x86-64.sh
> > @@ -222,10 +222,12 @@ if [ -n "$wait_and_wakeup" ]; then
> >      ssh $CONTROLLER wake
> >  fi
> > =20
> > +set +x
> >  until grep "^Welcome to Alpine Linux" smoke.serial || [ $timeout -le 0=
 ]; do
> >      sleep 1;
> >      : $((--timeout))
> >  done
> > +set -x
> > =20
> >  tail -n 100 smoke.serial
> > =20
>=20
> This wants repeating in dom0_check=3D when looking for "Welcome to Alpine"
> in guest-domU.log because the scrool is still visible in
>=20
> https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/5235487317
>=20
> Happy to fix on commit, as this is the only comment I have on the series.

Fine with me, thanks!

> Alternatively, would it be worth writing a "wait_until $msg $file"
> function to abstract this away?

Can refactor it later, maybe when adding more tests.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--ry7Y1FzsF4tVHVJM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmUwWUAACgkQ24/THMrX
1yxtFwf/fUxQGg2TSO0t3Rkj7VkhGb2lCoL2G9uLCUGKTIdkSGdIDL22hrlbabPl
tFag0fKUmypvq6H7mEyiWIB0jxf+lhS6qu5JEG0avNoGo6KCwSy5zn4MvCwLrn1p
uH9CCWJge7BHfeqRdiC7O43Zacm7K6auELHzKiokGO9Y1e6ACvYLoPqA7sqarm9w
u4dLju4/YiRhAuxnQKOMgMez+xkIdZwYenKqZpnQ+/S4kBj0iW6/+G8jTRXbbf1b
i/2/ktc4OYNdHAZTtI5rT0n6cbsO35enEWXFbz2yoemqZu7ShgTw/cC6l/3jbiwU
sxzk7i+ZI0INae8oojfCCb2WEwgVLw==
=bnaM
-----END PGP SIGNATURE-----

--ry7Y1FzsF4tVHVJM--

