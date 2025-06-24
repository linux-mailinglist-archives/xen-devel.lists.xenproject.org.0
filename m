Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D9BAE63A8
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 13:35:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023586.1399577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU1vf-0008IO-CR; Tue, 24 Jun 2025 11:35:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023586.1399577; Tue, 24 Jun 2025 11:35:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU1vf-0008Fl-9P; Tue, 24 Jun 2025 11:35:07 +0000
Received: by outflank-mailman (input) for mailman id 1023586;
 Tue, 24 Jun 2025 11:35:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fpib=ZH=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uU1vd-0008Ff-UB
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 11:35:06 +0000
Received: from fout-a8-smtp.messagingengine.com
 (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44c4c1b6-50ef-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 13:35:03 +0200 (CEST)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfout.phl.internal (Postfix) with ESMTP id 7B3BA13803ED;
 Tue, 24 Jun 2025 07:35:02 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Tue, 24 Jun 2025 07:35:02 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Jun 2025 07:35:00 -0400 (EDT)
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
X-Inumbo-ID: 44c4c1b6-50ef-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1750764902;
	 x=1750851302; bh=Y41ICOQIbdV3I2df50YnhOp4bTYE53gQg1EGs7FbBjA=; b=
	WBZmLfbsWGIlP8RNz0hj1RUX7HB4lnsDRE25Rn3PuEjBEJOQV1jLj9Wb+A+piB5g
	XR+s/tbKoO2+HxtCi9uT028Q6MQkbITAnZ1ggOEh604tw24rnNj8Ez2xVEg3CEW3
	f1YOpTFCQ87scVOHDPPkcY2GMSep8j26Be/OekNv7LMuQi1gw8/DpCDBbtFEYpja
	VayfrQWgqizVCYEtQJ9TYghFrcFaeKHZIt3HsW897bPGZcxoYvJ1DHdN/DwgCzcT
	Z72cLeZmaocNWBA+W8J4x8EtcrJglfk07PVeZzBC6pK9YFUlXdCWoPhnsB2vKNzg
	BV9UMVSOU+Gx8JVlrY7HnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1750764902; x=1750851302; bh=Y41ICOQIbdV3I2df50YnhOp4bTYE53gQg1E
	Gs7FbBjA=; b=mpHfkaDq7SPlbva4lFtqIPss4wktKwHcnRuwWlWsXQnVNqwPvkf
	3DmvYOB53TtbJm7ndjuZFNrFoyJn/gFVWjk8uGigJhqc+bUj6AlavE1PxDLZZ4Ip
	O9y9XHYKGKXT9BmFvlrQlrWaNZCs/Yvh5pU71RpeKYX69zEKVNjWQsd2zzEQdytB
	DTLIBNFqV/9mvqY63eqV2Fw/B013v5CGHiLFgdKwn2mDd/lWzGHH/dMR9Z9OxiwC
	TaR/dy0wIDT53CyNoYxDTsgkUbTOP2OWnb0Ca8bVE1uGAKBr6a/QhZWqs0Pv3YKV
	i5naM1CkIgCSLsvUc+lZ966mU7tHg7tq9eg==
X-ME-Sender: <xms:ZY1aaDaHit2b8MF09gjRglSPDgdNGU698qcfFDzlyGcSxBZLVUjSIA>
    <xme:ZY1aaCYyNIsOO_UVZ39P5UhxQb_bsr5Kw0HV9AF5DvEM36bdxC3pC6zPVzAyIauEj
    4w2oblnlQeXKg>
X-ME-Received: <xmr:ZY1aaF_Wr1B27_kY8JeS4w2vL6kKd-1M2H7-Xa0Kq_47PfkWT5Rmheqe7dzDUe2-cRJGEQH8Ywmx7bAhu92tYfu0q8t59cZsWQo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduleejlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudelteef
    vefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeegpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopehfrhgvughirghnohdriihighhlihhosegt
    lhhouhgurdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnh
    hprhhojhgvtghtrdhorhhgpdhrtghpthhtohepughpshhmihhthhesrghpvghrthhushhs
    ohhluhhtihhonhhsrdgtohhmpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtg
    homh
X-ME-Proxy: <xmx:ZY1aaJoM75tmzk_Ea3LShYbxq7XNRk3ZYCWhjF1xRnqCr_Qo-D8e7g>
    <xmx:ZY1aaOp9VpCAEE9SfULIhtCh7dvubetT2o9oi4yTPiAh8TxHuLNvSw>
    <xmx:ZY1aaPR0kqqfo2nGse2GUqBtIreL1Bi6B2yBSvKg9doMMKTKypZo0Q>
    <xmx:ZY1aaGqV_BDbBkwRmACyLzgxgf5ei1vIZpK6YHWMPgZySZwl_5YTnA>
    <xmx:Zo1aaFNCOqkDiiH2tUZExQnYnCiT4juGrzr-HgR12WrRzYseV_WXq6zz>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 24 Jun 2025 13:34:59 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] xen/efi: Do not undefined not defined macro
Message-ID: <aFqNYxzF7U-E_yH1@mail-itl>
References: <20250624063611.236876-1-frediano.ziglio@cloud.com>
 <CACHz=ZiP=vLAK1caJymLvazX3KZLUwU9HtymvqWVHzq2xLaBGg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pZ8kuzZKgQs56Dm4"
Content-Disposition: inline
In-Reply-To: <CACHz=ZiP=vLAK1caJymLvazX3KZLUwU9HtymvqWVHzq2xLaBGg@mail.gmail.com>


--pZ8kuzZKgQs56Dm4
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Jun 2025 13:34:59 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] xen/efi: Do not undefined not defined macro

On Tue, Jun 24, 2025 at 09:33:41AM +0100, Frediano Ziglio wrote:
> On Tue, Jun 24, 2025 at 7:36=E2=80=AFAM Frediano Ziglio
> <frediano.ziglio@cloud.com> wrote:
> >
>=20
> Typo on title "Do not undefined not defined macro" -> "Do not undefine
> not defined macro"

With typo fixed:

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> > The "buffer" macro is not defined.
> > It was defined till commit 59e087bf6a9c8ad805294c32dfd7c77068d81eff
> > (cfr "xen/keyhandler: Drop keyhandler_scratch").
> >
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> > ---
> >  xen/common/efi/boot.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> > index ded7cc129d..1a9b4e7dae 100644
> > --- a/xen/common/efi/boot.c
> > +++ b/xen/common/efi/boot.c
> > @@ -513,7 +513,6 @@ static EFI_FILE_HANDLE __init get_parent_handle(con=
st EFI_LOADED_IMAGE *loaded_i
> >      else
> >          *leaf =3D buffer;
> >  #undef BUFFERSIZE
> > -#undef buffer
> >
> >      return dir_handle;
> >  }

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--pZ8kuzZKgQs56Dm4
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmhajWIACgkQ24/THMrX
1yzYQAf/f41rFmmw499w70hIqNYNXxh0khW+Pf404KX3BA1H3MOTjhluQmHEiGUO
miW8n9JXgI5HEAoo2a4u7LedY9bNJwS/429xnZsNUF4ShgoHRrismJtIuxYSkPhp
r6GXm+tBIb2wjmzC8EOOIqdKW3FGC2FXFDETykgXDU7i5KEON1dyhVwrk9DyN7gQ
aTo6rSwTiQkFFCPREqu4HtX8dp1bl17Moq63xfQw0iFBAWzm8VyeD8j1LS+8sLRs
/3igN/0wBuk2FH8hq+4gLT94bf/un044wcLh1wDJIpJ3ksun0o4wbsITRaMU0+AT
rTtEYzyBUymQ374BShX0jFrtTggE7g==
=LFxj
-----END PGP SIGNATURE-----

--pZ8kuzZKgQs56Dm4--

