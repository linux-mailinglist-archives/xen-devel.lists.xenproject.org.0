Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3535629790
	for <lists+xen-devel@lfdr.de>; Tue, 15 Nov 2022 12:37:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443865.698628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouuFc-0000mM-Nb; Tue, 15 Nov 2022 11:37:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443865.698628; Tue, 15 Nov 2022 11:37:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouuFc-0000jR-Jz; Tue, 15 Nov 2022 11:37:12 +0000
Received: by outflank-mailman (input) for mailman id 443865;
 Tue, 15 Nov 2022 11:37:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Vqu=3P=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ouuFa-0000jG-4i
 for xen-devel@lists.xenproject.org; Tue, 15 Nov 2022 11:37:10 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d43e27c7-64d9-11ed-8fd2-01056ac49cbb;
 Tue, 15 Nov 2022 12:37:07 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id A61C85C0106;
 Tue, 15 Nov 2022 06:37:04 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 15 Nov 2022 06:37:04 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Nov 2022 06:37:03 -0500 (EST)
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
X-Inumbo-ID: d43e27c7-64d9-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1668512224; x=
	1668598624; bh=m1CLwNradEnDNB0ey88xxCnVPjobaJfDNrP5VudgiWI=; b=R
	nKn83SCH55P5hOoYOx/WiwwKEyzmOJLPv8OelQ++PE5RPpnJqhgPK+brhtcY0mM3
	KwFYZz0qt43re+MYc+cvLFYkp2kiE25C3r/Bt0voZYZ+rirvXIJIpCzQVY/GnZkb
	LPttQN7oYkmcwXbJhm+jJvMJRAaveB3h4IC4av3DvJwY6n02QinrJcQ8Wg7w4iiG
	tEYN+ruYFi+q4h9kvy4bkfkWp6EM1RHYO3gqdjTBKPJjMt+CPed8Jyqj/u1uJAhU
	YjqrZppEc+LUSlws9w7KbXc6Jo4gnzX+z2ND5zI64M4nZz4RD0MuU+ZDarQ201Yq
	4joFZ+SxFnLcebxk+C7nQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1668512224; x=1668598624; bh=m1CLwNradEnDNB0ey88xxCnVPjob
	aJfDNrP5VudgiWI=; b=hD6+UtU9Qyw1FErV3XZJGsF+xnhmyuWeX7OrUBe4djYM
	jRJwLLFNBcrH8xqX7c5Hpb+HSmstlRpMA0CBmsjbZinANljrStLpIheTjX/jBMgx
	RuPBX+15e1lsQUsb+hEIP3l3HVi1Qapgq6vZ0O4QE8M2kxEhSjxq/cjkj7nlFgdH
	n4LBHWxF9eaMxEg1Z9TeRqmbEKblPnWahtGUPQZnUpb2c0oQO+UaofCgHStSBi68
	+Su7+0AlBpUmFXM9KbvouFmEV5V/a+ksQMHIsERIwc0CjgVSp8LCDxNIEC8uzd6k
	ixNZAre2QUaQnBj0jhtscaks8MmCQRnbZdve/HccCw==
X-ME-Sender: <xms:4HlzYwO-QS1oygoYH-sH-iy5uXK9h0H92IuxBDD7NXvD1Vy-DwECWg>
    <xme:4HlzY2-1bmKLV16tOpJQGvldh7Id4Reg6JMbdqM0zGaAUd8f7RCeOAZdXsE6HnONl
    TkY96oVgYKA6w>
X-ME-Received: <xmr:4HlzY3RS2dt4cNk5_pZZqWIgMcGgBYlPKmF730wJQIgCh9qqUfD5U2xP4Ch2wt7Z9mKM3SPIZHDm6htC-Q_yKP98XkJh-dlvfw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeeggdeftdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudel
    teefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:4HlzY4u_b7s4hlhGKSrFtcFkfqWVBaxzKKuEpIc2Zs91G0Yg3IBa8g>
    <xmx:4HlzY4c0E48HBAbR56V4WVllI3aIbc-XIlTCBwsTJSV0mrxCjzwLYA>
    <xmx:4HlzY81DuSsOMckGWP27A_HUBW2z-2XxFIeMjcYjVmvR8D2uUP1nEw>
    <xmx:4HlzY5qrZ4wpuRTqD75JjRNLM7j-mislX2_yBPBr9yKoj6d1ro6IVQ>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 15 Nov 2022 12:37:00 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/2] x86/msi: passthrough all MSI-X vector ctrl writes to
 device model
Message-ID: <Y3N53MIP8D0k/JXq@mail-itl>
References: <20221114192100.1539267-1-marmarek@invisiblethingslab.com>
 <b6d5b122-2821-35dd-418d-c9ae42184d22@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="P8r2+hJNBNAaLMGh"
Content-Disposition: inline
In-Reply-To: <b6d5b122-2821-35dd-418d-c9ae42184d22@suse.com>


--P8r2+hJNBNAaLMGh
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Nov 2022 12:37:00 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/2] x86/msi: passthrough all MSI-X vector ctrl writes to
 device model

On Tue, Nov 15, 2022 at 10:36:32AM +0100, Jan Beulich wrote:
> On 14.11.2022 20:20, Marek Marczykowski-G=C3=B3recki wrote:
> > QEMU needs to know whether clearing maskbit of a vector is really
> > clearing, or was already cleared before. Currently Xen sends only
> > clearing that bit to the device model, but not setting it, so QEMU
> > cannot detect it.
>=20
> Except for qword writes as it looks. Furthermore even clearing
> requests aren't sent if address/data are unchanged. If you agree,
> please add this here in some form for having a complete picture.

Ok.

> > Because of that, QEMU is working this around by
> > checking via /dev/mem, but that isn't the proper approach.
> >=20
> > Give all necessary information to QEMU by passing all ctrl writes,
> > including masking a vector.
>=20
> Can we perhaps still avoid sending dword writes which don't change
> the mask bit?

Is it worth it? I don't think such writes are common (which I confirm
observing debug log - every single write to maskbit Linux did was
changing the value). The old value isn't readily available here.

> > --- a/xen/arch/x86/hvm/vmsi.c
> > +++ b/xen/arch/x86/hvm/vmsi.c
> > @@ -271,7 +271,8 @@ out:
> >  }
> > =20
> >  static int msixtbl_write(struct vcpu *v, unsigned long address,
> > -                         unsigned int len, unsigned long val)
> > +                         unsigned int len, unsigned long val,
> > +                         bool completion)
> >  {
>=20
> I'd like to propose an alternative approach without an extra parameter:
> Have msix_write_completion() pass 0 for "len" and move the initial
> check
>=20
>     if ( (len !=3D 4 && len !=3D 8) || (address & (len - 1)) )
>         return r;
>=20
> into _msixtbl_write(). Then ...
>=20
> > @@ -343,7 +344,7 @@ static int msixtbl_write(struct vcpu *v, unsigned l=
ong address,
> > =20
> >  unlock:
> >      spin_unlock_irqrestore(&desc->lock, flags);
> > -    if ( len =3D=3D 4 )
> > +    if ( len =3D=3D 4 && completion )
> >          r =3D X86EMUL_OKAY;
>=20
> ... this could simply be "if ( !len )", seeing that even with your
> approach it could simply be "if ( completion )".

I find such usage of magic len=3D0 confusing. It would change the meaning
of "len" from "write length" to "write length, unless it's 0 - then
write length is 4 and it's called from msix_write_completion.
Is there any real value from avoiding extra parameter?


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--P8r2+hJNBNAaLMGh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmNzedwACgkQ24/THMrX
1yygowf/XfqaqFOcXukozTtTshxvT8EPlrhvdDQ6GFohyf3a92clSd2QjgFhsImE
86Oo1pA/HCRQ1jno+y9XpHiLeJK6B9uB3CojkszXNrHvEREZA54dJwibbnKLc5aB
WRoY6DD0QcRp+LJxWkYLg/jAU51okHmZn6tFM7vXXFyjiqvxa0GN+fOYuTSnwDxp
EgDi0IYoLjbqU/JSLhap9iJD+5vkpWvknoqgnrkXhotqEdeXl8M0pGjMQI5TqzTy
l6GSsnsVnfjLltMXif5Ptr9SilSpcX/Dk6sbrTuyJERmJYLAmZsbjNI0LOS0KoaC
gZbBDR8EANJNqOiSWSb5OrReOhCygQ==
=tZc0
-----END PGP SIGNATURE-----

--P8r2+hJNBNAaLMGh--

