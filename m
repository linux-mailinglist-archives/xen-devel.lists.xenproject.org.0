Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C16D77CECAD
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 02:17:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618831.963003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtGi8-000541-7z; Thu, 19 Oct 2023 00:16:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618831.963003; Thu, 19 Oct 2023 00:16:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtGi8-000522-4f; Thu, 19 Oct 2023 00:16:24 +0000
Received: by outflank-mailman (input) for mailman id 618831;
 Thu, 19 Oct 2023 00:16:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Zkf=GB=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1qtGi6-00051t-Jl
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 00:16:22 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9306cbb-6e14-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 02:16:19 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id A2DA15C025A;
 Wed, 18 Oct 2023 20:16:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 18 Oct 2023 20:16:17 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Oct 2023 20:16:16 -0400 (EDT)
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
X-Inumbo-ID: b9306cbb-6e14-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1697674577; x=1697760977; bh=hjRWnSITFwpAwNPFhQwJq2jfkX/z/yJdqAL
	l0NJWERo=; b=VQJjTa93X1tgOUCjnBXDE91TzxatENPoGTdvYTgoyc/TFEUNsfj
	+4n3j3wMb4Vv3QB1sYH/Wb+a2fpqXyCuN20d9wgOuiHCTshO/6rFreh1zHxldJyO
	A7VJg+7EXHynEoGynW42HbXmx03KeM+bPXcJbOrVZPji1sRiYiI03Iz3hd8qdBON
	RjiPgQLfkliMPtelI9adnbyHnH7N3whVHWey4LmJEhZh9068nePfqRrHYr6wJuOV
	ZGTTm1u6DtWVb9NwvlMOxVocgUGJQJbvGN9nhz4J/m/iUOLCy0Xz8npOPIII/BLn
	xNeCxwAqqkR0CIBNxNfYP82rQ1vtJdKAFsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1697674577; x=1697760977; bh=hjRWnSITFwpAw
	NPFhQwJq2jfkX/z/yJdqALl0NJWERo=; b=FfDCx3g8oL9VspmsAWImiD2NIeLRX
	ahKH2/FckLMLfvkMAGSFYZTOa2dS5qPz+kym3udzX0O2N8x37pBXs2JlaxJ2GG2n
	1fE0PSqIbNjv34v6Bujy4DTll9ay6YhY3+5clZFEfJFsagVx/jU/rBS5R88x3T/n
	8303/GWXKvPMHRB6VHCZkE78fwIBId0iT8Q4+hLBzqBbCervp6HCk6Si7qyzgCx8
	9SppLbX4bVfDscKYljk94qI0fJ9yCUAA9oSTqBagxaoBhcc8Xfk1l84/+X6/k5kS
	aVxi4Iqy3cquVJhmnD/AiDETnQnRh7h4mYPyCdqxiTaDHn3JMhjNI0r+Q==
X-ME-Sender: <xms:UXUwZVH-NT0L99fOvFOOheAjUstg3YdBnUnNLWDdVfrDlZbvr8187Q>
    <xme:UXUwZaUqHItF-XuJyPvmAWm97-hNmd78oSnPJQOn6eiZuKMu-eKr0VMtIwJ4kbz2y
    9A5MlMBV_GVyA>
X-ME-Received: <xmr:UXUwZXK-yub0sXkZFm4i-RK37ECTCl3XqWuG5Qip946Nfz5t3OX5r48g7fyqZhlIUdRa_QSjzwtOzy6js6pnvXmklK0Gs3A8jPs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrjeehgdefudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudel
    teefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:UXUwZbHuaB3SCJ_YUASNebEvWikmuYizXMs2kPyqTIIHKnsWkVNtkw>
    <xmx:UXUwZbVrkJGnXTPnDWMiu8VRQVY-6wIYu4I17KadDhW9izLA-2v4Rg>
    <xmx:UXUwZWMWBX0OEdN_ga5comeaA1xla1WwyFbaq-r8IBxENGQ0Saibsw>
    <xmx:UXUwZYhady_4onImohOpTGQS8RSErpGt6zwnL88yevhtyjnRrKSy6A>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 19 Oct 2023 02:16:12 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Henry Wang <Henry.Wang@arm.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 4/5] automation: improve checking for MSI/MSI-X in PCI
 passthrough tests
Message-ID: <ZTB1TV7LX+tUGAKd@mail-itl>
References: <cover.550599c54c91da4f8417fde358992e75bf8163c0.1696557834.git-series.marmarek@invisiblethingslab.com>
 <18b10f667f2df986691ed299f7640724618ec95a.1696557834.git-series.marmarek@invisiblethingslab.com>
 <33c1d5b2-8652-43b7-be7a-699db144e911@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vlNcnRzYbibicPzS"
Content-Disposition: inline
In-Reply-To: <33c1d5b2-8652-43b7-be7a-699db144e911@citrix.com>


--vlNcnRzYbibicPzS
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Oct 2023 02:16:12 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Henry Wang <Henry.Wang@arm.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 4/5] automation: improve checking for MSI/MSI-X in PCI
 passthrough tests

On Thu, Oct 19, 2023 at 12:30:22AM +0100, Andrew Cooper wrote:
> On 06/10/2023 3:05 am, Marek Marczykowski-G=C3=B3recki wrote:
> > diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qu=
bes-x86-64.sh
> > index 5464d10fc343..842e6fae7204 100755
> > --- a/automation/scripts/qubes-x86-64.sh
> > +++ b/automation/scripts/qubes-x86-64.sh
> > @@ -90,23 +90,18 @@ on_reboot =3D "destroy"
> > =20
> >      domU_check=3D"
> >  set -x -e
> > -ip link set eth0 up
> > -timeout 30s udhcpc -i eth0
> > +interface=3Deth0
> > +ip link set \"\$interface\" up
> > +timeout 30s udhcpc -i \"\$interface\"
> >  pingip=3D\$(ip -o -4 r show default|cut -f 3 -d ' ')
> >  ping -c 10 \"\$pingip\"
> >  echo domU started
> > -cat /proc/interrupts
> > +pcidevice=3D\$(basename \$(readlink /sys/class/net/\$interface/device))
> > +lspci -vs \$pcidevice
>=20
> Actually, I know I said I had no more comments, and maybe this is one
> for further cleanup rather than for now, but wouldn't we be much better
> using a heredoc?
>=20
> read -r -d '' domU_check <<"EOF"
>=20
> lorem ipsum, no \ escaping " or $
>=20
> EOF
>=20
> If nothing else it would make the innards of the more readable as a
> script fragment, and less likely go to wrong with variable expansion in
> the wrong context.

Some of those snippets have intentionally unescaped $ (as in - have it
expanded in place), and IMO having different method depending whether
you want to expand variables inside or not will be more error-prone.
Syntax highlighting in an editor makes it rather easy to spot unescaped
$ or such (and then decide whether it was intentional or not).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--vlNcnRzYbibicPzS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmUwdU0ACgkQ24/THMrX
1yx9ewf/d97RCvwHZA3RINdIAcmacvWevTXKqkZ03LnryocATOARIkVMN1IXdTyr
PzQUihelCeFew5IUQjizCDm0otP0yq6PU+kL6L6CBmrlBff/w/cwMbfbDhY10p03
E/5GXIu0z899SR9Hfzaz0jjNIybfOi7R2XzxrPHvX6N/p6GOfz9ZYfE69/Cyl3Vb
P2abrfp+giLCx/iJXMG/3BBl/gm2EC8NRmDy9awzYCSjA6D2paerwar40xj3s8Q8
+aVbCnxpqPwb0XuxBICC+mEW3187VyXsS5JewKplkG/Vf9tGPDD8siPylkBZH1Ge
aHpZ6eKNoMLiGRWiDp74+LAm5hY3Fg==
=SSC1
-----END PGP SIGNATURE-----

--vlNcnRzYbibicPzS--

