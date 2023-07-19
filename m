Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29911758AC3
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 03:18:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565550.883778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLvpR-0008Lu-Ha; Wed, 19 Jul 2023 01:18:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565550.883778; Wed, 19 Jul 2023 01:18:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLvpR-0008KB-DX; Wed, 19 Jul 2023 01:18:09 +0000
Received: by outflank-mailman (input) for mailman id 565550;
 Wed, 19 Jul 2023 01:18:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E4h+=DF=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1qLvpQ-0008K5-Hc
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 01:18:08 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a98c82b-25d2-11ee-b23a-6b7b168915f2;
 Wed, 19 Jul 2023 03:18:05 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id C02473200924;
 Tue, 18 Jul 2023 21:17:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 18 Jul 2023 21:18:00 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Jul 2023 21:17:57 -0400 (EDT)
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
X-Inumbo-ID: 1a98c82b-25d2-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1689729479; x=1689815879; bh=w4PHme9520A6pO5tvVJ90ylKSAA+Z+2idGu
	XO5dyuNo=; b=Z5eyfU1wOyb4M8M1Domw1fxaUGOzFL4g5lIA9XKaG6HRXgJxp9b
	VV+zbdJGH5wM6lwWwe+jcAaROsqOlL9Xvk15PwlfxT9cVXhiGhp+6DT6ogxH6qVB
	KrYsPbc0b9+ohOoZohWhGqgR9TSz4/+nDHX9OpuZoFTZocNzaeoLhQvdPgN7BcDz
	Vq1QEtNk5ny+S1HlgL3s1fypvaeIZA6Eq6ZIeg6LJL46cX/Qz1FOdxcrvgToVjrd
	ZM59gty+Bnb+jL/uugp1ACkzXSPInUk+uLpKAnGn046/f7LU788xyomFJWfzirkO
	zGbogk5T62pxH/B8RTqxVG9cy4TWrNCoPkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1689729479; x=1689815879; bh=w4PHme9520A6p
	O5tvVJ90ylKSAA+Z+2idGuXO5dyuNo=; b=gLVjS36seVc4XCWgiz96Z1qFNBa2E
	K9DwQyr3a2379PeMKvSmF0xmMwNp5FyX/hwgC6sRsrel13lH/zCbZHBC4Ts5pyAA
	/bdxNkBF5pE6prOy7kSRAh0YxhyWj0bqQVnlbUbhhxzJ2zBMt0kFHIZ8NCsLQ5Fb
	4/WXLO3BUzPqYv7jIxSrl5Xam7qF0IjvveI0w9jJMo9mfO40cnNbYbeJZ5vT0U8n
	Ww+KYHHlEcOXiqqF290zIYpYLXKLyBNHayUQZcrgW3qs2f8A/CXSFVpBKdBn3jSm
	6hMeu7wYcB2O3GiQHPzyoyWRr88purPmxzQJFqAI929oRQS6yQ1+vsJ3g==
X-ME-Sender: <xms:xjm3ZKKpPHyQv8KXWOgH6wtjXvLhlZ5eAZ78sz5gP2th-HS2kKGcBA>
    <xme:xjm3ZCLiiYuqW-XBcp4uVzvP-zh1ipulIQFS9IGADgMQPbaGs0hgIGS0O77MZJChK
    gerGqPeBJxtDw>
X-ME-Received: <xmr:xjm3ZKssmDXqdcV4S_WHjgUVEdra9AXK0NMsQPdfpWSnfhKgm_nzihHCGfU0hhFMdSd-ddBhwyDaRm4BZOM0YCbvFyx2ysQuHIo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrgeehgdeggecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudel
    teefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:xzm3ZPYSdEZ3qh7pvJuij8XwlOwj04_tbzBG-z6s1jGPAqbZZOCnMw>
    <xmx:xzm3ZBbbgFNfGT_jtC3QN1Xr7YR7rlw8cQHk1_6QRGDrlQddyIGMdw>
    <xmx:xzm3ZLCo4d9JEiWx0Fcuf5ug4RDOYv2w3wAH7lZOThhyHmgsqJ654g>
    <xmx:xzm3ZFF09JqhxOpBfRhpamCU7TDQgWl29UbNcFyGtpVqeFBnMSjREw>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 19 Jul 2023 03:17:53 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Simon Gaiser <simon@invisiblethingslab.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH] x86/msr: Allow hardware domain to read package
 C-state residency counters
Message-ID: <ZLc5woleABLgwY/M@mail-itl>
References: <946e5494801866c93332cc5d9ec0fa03a4df00d7.1689686046.git.simon@invisiblethingslab.com>
 <d512a592-24e7-2eca-16ce-7451dc110f64@suse.com>
 <9b53ef8b-7911-ed45-2160-60e6d553fc69@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PNjmKUn0RkxWI/eX"
Content-Disposition: inline
In-Reply-To: <9b53ef8b-7911-ed45-2160-60e6d553fc69@invisiblethingslab.com>


--PNjmKUn0RkxWI/eX
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Jul 2023 03:17:53 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Simon Gaiser <simon@invisiblethingslab.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH] x86/msr: Allow hardware domain to read package
 C-state residency counters

On Wed, Jul 19, 2023 at 12:38:39AM +0200, Simon Gaiser wrote:
> Jan Beulich:
> > On 18.07.2023 15:17, Simon Gaiser wrote:
> >> --- a/xen/arch/x86/pv/emul-priv-op.c
> >> +++ b/xen/arch/x86/pv/emul-priv-op.c
> >> @@ -965,6 +965,20 @@ static int cf_check read_msr(
> >>          *val =3D 0;
> >>          return X86EMUL_OKAY;
> >> =20
> >> +    case MSR_PKG_C2_RESIDENCY:
> >> +    case MSR_PKG_C3_RESIDENCY:
> >> +    case MSR_PKG_C6_RESIDENCY:
> >> +    case MSR_PKG_C7_RESIDENCY:
> >> +    case MSR_PKG_C8_RESIDENCY:
> >> +    case MSR_PKG_C9_RESIDENCY:
> >> +    case MSR_PKG_C10_RESIDENCY:
> >> +        if ( boot_cpu_data.x86_vendor !=3D X86_VENDOR_INTEL )
> >> +            break;
> >> +        if ( is_hardware_domain(currd) )
> >> +            goto normal;
> >> +        *val =3D 0;
> >> +        return X86EMUL_OKAY;
> >=20
> > In addition to what Andrew said: Why would we suddenly allow these
> > reads to succeed for DomU-s?
>=20
> That patch wouldn't actually allow those reads, but fake a 0 response,
> or do I miss something. If you mean that behavior: I just mirrored what
> is done there in some of the other cases. If you prefer something else,
> for example treating it as unimplemented, I can change that.

I think Jan meant exactly this difference - faking 0, instead of
failing the read.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--PNjmKUn0RkxWI/eX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmS3OcIACgkQ24/THMrX
1ywN6Qf7BDOZnKBlOuFGyxjFHoAIEaWKDGxYXVWyGzCNHdxWwyT6HsMqbdmcyGtD
Ta3Be8UJ8UlkX29NPV/JYyzROtD1VAiNBsOo+VlAsuyaSn3eYZ7edDRvHJN68iZa
wxBF9FLi/holyWUTf730wVmeOdXtChC0Mmscqqk07U/r+185gmExJ7mf1wm0d7TR
2cIlB5Rum4ZsZ+7unRXtG6mLNX0Mvwo7i9ioq4JQI7yyFxduDgaZZklt3wvZECmO
vf24jb7fkgbXp3T/DcFmd39uSxdlkJ5BsybmXgyy1DCMNc8i2rgJnKBFkZC0q4Oi
dUupc1S8iLoL0i0jMvI6DMkzzUht9Q==
=L1Hz
-----END PGP SIGNATURE-----

--PNjmKUn0RkxWI/eX--

