Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0467565E3
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 16:09:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564602.882136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLOu9-00012V-Te; Mon, 17 Jul 2023 14:08:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564602.882136; Mon, 17 Jul 2023 14:08:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLOu9-00010O-Pj; Mon, 17 Jul 2023 14:08:49 +0000
Received: by outflank-mailman (input) for mailman id 564602;
 Mon, 17 Jul 2023 14:08:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lGkF=DD=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1qLOu8-00010G-5N
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 14:08:48 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71341c7c-24ab-11ee-8611-37d641c3527e;
 Mon, 17 Jul 2023 16:08:45 +0200 (CEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id E90335C0060;
 Mon, 17 Jul 2023 10:08:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 17 Jul 2023 10:08:44 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Jul 2023 10:08:43 -0400 (EDT)
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
X-Inumbo-ID: 71341c7c-24ab-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1689602924; x=1689689324; bh=m9oqMhqnoeMdWiCbbw4c3C/aQeXDruEUsX7
	6H3GQr8U=; b=DKPSg1epPNTDOtLhKj8M62S0evSvCvmm0Ck3fWrv+lHEWZ1/tXF
	B4H0fNXgmPdAwNH6AbsmZvDl/3DdSqingcpG5teoeVOmnFXDdXAdZHpLZ7G9RYwJ
	fgl56WLy4g5QrWyWMSe9D+PhcTQVP//fhLAbQ3S7acQh4GiN0hq2RC7S1IFVf3KV
	M8JbqvNla/02wCnsp1K6xNph+GOBhpyN26qc8Qk3L+6MHYfbhZPjUMGniDFp8cXW
	Amm49A/XcAhrJ0PGjMwNaP48IY+DEpgUZzRqvBYtBV4DslmMSSD1w+dViSKPTaj2
	6g9xsE/yisp0G7/+u1DZEvkXkIx9P3a3PZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1689602924; x=1689689324; bh=m9oqMhqnoeMdW
	iCbbw4c3C/aQeXDruEUsX76H3GQr8U=; b=tuXtyELr2RhW/jqTEbHw0zo0gEkqL
	uhlAVrfLEus0K6/HeDEFPgzLxqkA+S2NO77XXiHGXxdL/5GcU7TVECEtv7IZA+4N
	zUpwxNZegZqwBOXcMo10fMOKZfxwap+hj/iulgRzj+04JpSnO1ogg/OoaoAZ3dI9
	tMGWvGbDIPiTG0zXLcnsFm1i6ztArBGalgrKEaqAA4oLxKyAoo2BPc9NcxNldLik
	9++rIn1OyzMCWCjVw+sApEYYN4B1+PUrkH1ASFMTPDF/5bjaa5n3T5v/vtPCoC9n
	uURxd6M/IDevcg1wguEsh1OVajRQroiinMVKUQAQpe5lh5MU7CxAjNwFQ==
X-ME-Sender: <xms:bEu1ZAFRECPrVbVWDkJgN2SfPFrfLK37uRIJagocVsR34vpMq_ggHA>
    <xme:bEu1ZJV_m2m4L1ZxZIcF0sC7McbaMtO_iN4wfRXPnJeGE_XmNX_Xr9kzN9g-zBo8N
    1Q9ge6d7B13zA>
X-ME-Received: <xmr:bEu1ZKKIkXYdeyY6isgSRbHqTHs9CWb7Fd4oXE5kExUwQ1J8JCGbqNyvOoLhe4RgklvEEA0M3-M7oT7M_AeDCoJvgNfYRqkU-CY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrgedvgdejvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtdorredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedttedv
    hfekudetvdelffeguedtkeethfethfffhfefteeghfeigeelvddttdektdenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:bEu1ZCEl9PKvG51ieUO8dYc39EhV8BRirZjsDWOcuIID7KVCidrD4w>
    <xmx:bEu1ZGU5_9-7xFgvgopTjnwCHHtUTk6wXYjzEcMLB4TH4rxTp4z2yw>
    <xmx:bEu1ZFPKPq2WQgAS8mHYIYgMz44QqLEOVUR130gBF6BeoZFsKTA7oQ>
    <xmx:bEu1ZDgu8CdBpcLnO-CYIPTmCs62uh41zi3KQxhvXhR_Yicc3EoExg>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 17 Jul 2023 16:08:38 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"committers@xenproject.org" <committers@xenproject.org>
Subject: Re: [PATCH] automation: avoid duplicated builds of staging branch
Message-ID: <ZLVLaPeyOwDYYUXL@mail-itl>
References: <20230717130925.28183-1-marmarek@invisiblethingslab.com>
 <cf7ac648-dbef-80bb-986b-3fe0daef855a@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qAyLTvoh5LXBy8b6"
Content-Disposition: inline
In-Reply-To: <cf7ac648-dbef-80bb-986b-3fe0daef855a@citrix.com>


--qAyLTvoh5LXBy8b6
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Jul 2023 16:08:38 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"committers@xenproject.org" <committers@xenproject.org>
Subject: Re: [PATCH] automation: avoid duplicated builds of staging branch

On Mon, Jul 17, 2023 at 02:14:14PM +0100, Andrew Cooper wrote:
> On 17/07/2023 2:09 pm, Marek Marczykowski-G=C3=B3recki wrote:
> > "staging" branch is mirrored (automatically or manually) to several
> > repositories. Avoid building it several times to not waste runner
> > resources.
> >
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
> >  .gitlab-ci.yml | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> > index c8bd7519d5fb..c3b05e32636b 100644
> > --- a/.gitlab-ci.yml
> > +++ b/.gitlab-ci.yml
> > @@ -2,6 +2,12 @@ stages:
> >    - build
> >    - test
> > =20
> > +workflow:
> > +  rules:
> > +    - if: '$CI_COMMIT_REF_NAME =3D=3D "staging" && $CI_PROJECT_NAMESPA=
CE !=3D "xen-project"'
> > +      when: never
> > +    - when: always
>=20
> If we're doing this for staging, we should include staging-* and
> stable-*.=C2=A0 They're all the same from this point of view.
>=20
> However, this does need double checking with the committers who use
> gitlab regularly (CC'd).=C2=A0 This doesn't happen to interfere with my
> commit workflow (I use a separate branch called for-staging), but I
> can't talk for others.

I'd like to avoid broad patterns like staging-* or stable-* here, I'm
pretty sure people do use branches like staging-X.Y-something. While it
would be possible to exclude them by listing exact names, I'm not sure
if it's worth it, given the push frequency to them (few times a month)
and those being mirrored to less repositories (only FuSa fork?).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--qAyLTvoh5LXBy8b6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmS1S2gACgkQ24/THMrX
1yyqXQgAh9RrCvMyGaiVyNa8GPpOg1JFXADhtiCzfrtWLNGP3pBWtGDgLX2um6t2
R7D0VPpA/OI7KAW5MNi8gbxQts8MS7c4BZruHAKyiqJtgJCPcmb+k2/1asj/Hiaw
d8KsaAuyz82tKzYhCqnlMA7vqEFlMCW+gpTIklIApUdeve++GEk1Vdh3vy7387Jk
BZXseAjxrN/66AYX1ci0BCD/n+QMxG5SI07lVY98FB778cKltJjet6vEGCWKGB4Y
2eyw93wrzdpt7eiOyOWlRpC2qyre2wkMub41Z7bxW5KAEy5Eq8dZIkh0nMPT48GT
ZwYv5WQ+YWMimUTX02wHheIgFDhn4g==
=1J3g
-----END PGP SIGNATURE-----

--qAyLTvoh5LXBy8b6--

