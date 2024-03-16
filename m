Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CD987D8B7
	for <lists+xen-devel@lfdr.de>; Sat, 16 Mar 2024 05:02:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694139.1083062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlLEY-0004Zm-4u; Sat, 16 Mar 2024 04:01:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694139.1083062; Sat, 16 Mar 2024 04:01:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlLEY-0004YF-23; Sat, 16 Mar 2024 04:01:22 +0000
Received: by outflank-mailman (input) for mailman id 694139;
 Sat, 16 Mar 2024 04:01:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Lt+=KW=invisiblethingslab.com=simon@srs-se1.protection.inumbo.net>)
 id 1rlLEW-0004Y9-R4
 for xen-devel@lists.xenproject.org; Sat, 16 Mar 2024 04:01:20 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d561ee04-e349-11ee-afdd-a90da7624cb6;
 Sat, 16 Mar 2024 05:01:18 +0100 (CET)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 15D95320010B;
 Sat, 16 Mar 2024 00:01:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Sat, 16 Mar 2024 00:01:13 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 16 Mar 2024 00:01:11 -0400 (EDT)
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
X-Inumbo-ID: d561ee04-e349-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1710561672;
	 x=1710648072; bh=RDB0VzEGZIjYO7+eYsNfBjQXMjBAGaY8KxMVv2LWsp8=; b=
	ZCySQg06GLcTcy9RbUuNqPvNgNU/rBPwRLb9zgeDy6bU3Fa2HrUpJCPErtIC1Bdm
	pb/jarLjRbakRj5V0lUAWzPj2r2QXEpq669Xf+KDPAOv3/tcPRuZqJEwmZD5ilxb
	uFdJZgDKpr5tvaz0W5IkENU074ZVb+q+M7HX2ZSzqeMie8GEF4VZA68JLUI7KLif
	08o3nc1SPrPxVTq2rXh9srk0qUr1IblsfhDPg56YEk+7mCqxsUaEbRCpYnt2QfVu
	fcmQ0P9TB5n2bwqmYEu7e6PPYlO/WlG2ZLwFR2fXexwpIbrKS3GbR0hDQvhSNApM
	bw/rRrZRIum4hHUrtppvGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1710561672; x=1710648072; bh=RDB0VzEGZIjYO7+eYsNfBjQXMjBA
	GaY8KxMVv2LWsp8=; b=P2zNmKbNrMWMeSutXTfBhKv8khjXimSRw7CEUT8GEaCq
	y6+4WJGnJK25P2KErUZRV0d2z/7bDQDai+CG9xmOgb8JB2xhRRfAoux7fjETxzNR
	M+r0pzCSDotbpUhcBrzXHd2vhGBBMeA9H4uw9f8wfuoopj7rrAeHuqySxgxG48Tu
	+IQ5Us56DUVxe/O3WQVTMJs//VvYrrAP6rTH0XhaQ3pP58A2MDXouHlmK3HfinkR
	fYqYBuMQC/3EdalDeLXSHWvPMelyi3k8l3DNju8ihnIGkhpKmce9E12WW8oo019G
	L58+PB+k0+fFxt+MRYLdOn7S1FzIIbxAOFvrOZFF0Q==
X-ME-Sender: <xms:iBn1Zb3Zna7KltotjmN3Pj0cdN_DT-hJmWmUwvaS-cbm44Rv3buNGg>
    <xme:iBn1ZaGfBxNAO77e2-lgWc1SV-tT2V8CvQ7OgtGAI8fZciy6vznKIbR7rKoVDtM_E
    G00dEYNdDncNLA>
X-ME-Received: <xmr:iBn1Zb71dbHlnOAuMN1xM_g1iInGZJKXqotX4qNdCtG-FD7ygtGMCoIUxWSjHniWdmU1qEs9oq5uBvGhuZdsmvY6Lg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrkedtgdeiiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkffgguffvvehfhfgjtgesghdtreertddtjeenucfhrhhomhepufhimhhonhcu
    ifgrihhsvghruceoshhimhhonhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtoh
    hmqeenucggtffrrghtthgvrhhnpeeggeevtdefudehleefgeetvedtudeghfeifeegleff
    kedthefgiedvudefvddvudenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshhimhhonhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:iBn1ZQ3CDR5yULgCnafh9JLqP3gKFVWsf-ncV7ML2Gia5QrYRw0j4g>
    <xmx:iBn1ZeERc47lJT39xOhk2K0nrNZoFRWpPej--5GwvokooimV9CRC5Q>
    <xmx:iBn1ZR9fYSMJDtAixZeGFkhGhuz1xFQAEs_7iP5X736CjzhkRuHwkg>
    <xmx:iBn1ZbnrHJGYcOtuknYRX8mmW0ICF2ImGhgFgH0rq7ZiRwELExurYw>
    <xmx:iBn1ZQMihKXmWVb5KaZ7GxorhNR-wIoktVGubvRjBoGVfLaZFoXqGg>
Feedback-ID: idc5945a3:Fastmail
Message-ID: <940f93dc-37cb-499c-9e48-1898e12ce053@invisiblethingslab.com>
Date: Sat, 16 Mar 2024 05:00:59 +0100
MIME-Version: 1.0
Subject: Re: Status of S0ix with Xen
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
References: <ZfUQju8HBEkJNnKh@mail-itl>
Content-Language: en-US
From: Simon Gaiser <simon@invisiblethingslab.com>
In-Reply-To: <ZfUQju8HBEkJNnKh@mail-itl>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------yxpE2F20G0aRgWgcKvscgSK9"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------yxpE2F20G0aRgWgcKvscgSK9
Content-Type: multipart/mixed; boundary="------------mSao4Len6MXjiPCP9pgZk61S";
 protected-headers="v1"
From: Simon Gaiser <simon@invisiblethingslab.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <940f93dc-37cb-499c-9e48-1898e12ce053@invisiblethingslab.com>
Subject: Re: Status of S0ix with Xen
References: <ZfUQju8HBEkJNnKh@mail-itl>
In-Reply-To: <ZfUQju8HBEkJNnKh@mail-itl>
Autocrypt-Gossip: addr=marmarek@invisiblethingslab.com;
 keydata= xsBNBE5j9EwBCACbYHjxDrxFAY3n1x9KBFvjzkG1qFSTVBnH4vpD/5Na4sZq4uDDMUCjivrm
 MzbWYaivYj96BygdOiw7PWxYrhuW0b2WYOeGudZyApgFz42g458s78EciuhgfuWBlxr8dOEN
 /9ueVFHcvtZmDbHhMVPcQ0O7gwh0JmwkOsf7P7WAfYXsQlhO/EBRrNXR0Je+GEpYADhRktxX
 h1d3Iz+oKYuwHioLX8ovoAT4+peOuecWUSpUWebpDbTR5i7NRP3PIblB4KzWJa2kh/f3mx4v
 SRGnHn+BfX42xSe0X7Ktl4Xf+KNq9Wkcjk2CZP57hV2v4pO0ZUOXD7IhlZtnfNj67WjdABEB
 AAHNPU1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSA8bWFybWFyZWtAaW52aXNpYmxldGhp
 bmdzbGFiLmNvbT7CwHoEEwEIACQCGwMFCwkIBwMFFQoJCAsFFgIDAQACHgECF4AFAll+l7cC
 GQEACgkQ24/THMrX1yw6kAgAiKiUhzAPXZj5ndqiQDl8u8PUK34SupLzYNMJOCBw5Wh+CPHe
 XYlQUwfULWxmzjiWCzzWDx2X/ONsYdRGKDKMqG5srOSWe1IYXv00MEutGsK+m/hmC5mqi/97
 DVNZ1VtKj5WW79IsI0/7ueHsQYNNrXyOfZvKsRE8VIUJ0tNfLFDFlNpq9jONuF+GviMWxrA5
 FoVaGmjh63xC0fOQYqhP2v8dbYS4B6bO5NZKI2cTHb9Li2iY0e7wIoNgvqgtR3Iv2U2Ry0yL
 D3mNQhwyxcWChexlymjfqLEZwKqaIOo57HOpt7OA+bMg6MvkdUTjNWf2GE6fqCcALjcToJ3L
 NDc1KM7ATQROY/RMAQgAtRWgUZ5mOy+c/qzmiVnxqDkiOJjmnIh3Pn+OqCtjcrTyPI9eVc06
 uH30Jkco0soLiG/UgwVw4XwBlm95j9n6TSUms4mPBh1YiR1hBjsjYwn8zp/Ue9xWk1N6E14H
 aj55GxmS2H3YIlOXfQLr0X3RHsmKixTOKyisrYlJu71FmettDFV7CgMXy1Bc1LbAE08asvAS
 ShHFdRiRRtkuVHvY/Ebq9L54kOxtlI6ahrflMcT0YCMON5oe4GgQRh3p2uy+d/LS2bgRcQST
 IebErj8x0lM271f97GvxV/ypHo7XVIDI5FX1u31Agzx3HQr035GHt4HV4/GVCz+V4xt4BonB
 tQARAQABwsBfBBgBAgAJBQJOY/RMAhsMAAoJENuP0xzK19cs5MgH/jWLXil2Ud4TdtWnBxc+
 2/QZZk2JCssc1PgWNzvH5wH7U+8lGSlUK8ZMOqrrF8C5rX0+xEn7deSrsZChIOnUFo8rhCZK
 y/mBV+FhkMj24FZZ0n8w3eF4KF2t68Pt+AvMjxQHwxAMdf3QftgQhD0qYkt/28eedUQ+jwz6
 kipc4qUQmqTEViQRPa3WAnKgNDQUDUwNruzthfGvHUjllf7zbPI8gkbARM0KlTkLikc9u+Ni
 VMbJTiGPB7YHyw2MIPq1n+mhSPAyXE6CVBnYkonQ7P3SLZssxC3PIarV+DTU68umQB3pfrfF
 7hMcAY5csWrK9/x/Zz4RUfgN6Q3HLrSp9UQ=

--------------mSao4Len6MXjiPCP9pgZk61S
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

A very small correction to Marek's summary, only matters if you really
going to look at details:

Marek Marczykowski-G=C3=B3recki:
[...]
> 2. When toolstack issues "suspend" command (via xenstore
> control/shutdown), Linux uses "freeze" path, that doesn't put devices
> into low power state. Changing that to "suspend" path helps (the second=

> patch in [2]), and for our case seems to have no negative consequences.=


That's not quite true. See the hacky change to
xenbus_frontend_dev_resume in that patch. For a proper change this needs
to be clarified when which behavior is actually correct.

> But we do not use live migration nor save/restore - which is another us=
e
> of this feature, and we have not tested if this still works.
> [...]
> [1] https://github.com/QubesOS/qubes-issues/issues/6411#issuecomment-15=
38089344
> [2] https://github.com/QubesOS/qubes-linux-kernel/pull/910/files
> [3] https://github.com/QubesOS/qubes-vmm-xen-stubdom-linux/pull/63/file=
s

--------------mSao4Len6MXjiPCP9pgZk61S--

--------------yxpE2F20G0aRgWgcKvscgSK9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE3E8ezGzG3N1CTQ//kO9xfO/xly8FAmX1GX4ACgkQkO9xfO/x
ly//QBAArgXBZGCPwGN/mlzh7vyck9sUsxU3nhkNsl2GGR2Ymw4MTikfp4hcPT8R
iWtt5TlqaLJq9EFxCrjCWh2HqELSZy6weXl/VMdEeWqeOvYeVS3Wuv98LdwhzVCl
A3lOOGHhHwU9DBk2aXiRtmUrO+hErrtMXpaZpqc3d8X+3A+DEZkDJeGTTQ5vCACW
dIveuOn8zqt4t8Rkn+0QB+/eT5ORvXwxuhcVxTcn7TSdT8cRc/2lNXbg6yQhF59/
O7gTVGtLPcr9vdFC8R2e9S/cYOSUg/kw2w/PIipq9lEoSvgfo8u67O1xV+32mdCZ
OoWdelZyaRQsqpVXeINVC22wi0ANTUt4zee866LhX6voVhNInpb8LZOH5MPgOj7V
NStZ3VVzyhqwf8B7x1XSEQqq46jSOP52RlWdqrkWCvv4E7VRbwZzyEpCP+z6WNQf
kEKoa+pIs9ZCVVkfZSIUGCnM/peAjud5Jt+oTA+GHj8/vr530/1xxaCCxG0WhwKJ
EKZMxRotXu9gS0hOi+h7jxUR8Kaek6OFGW74W0xfw0JDlukKvCV6bVumPjXIuU3c
8Wrv4b20EwYEiZsdX83zf2zGezF/RMWbxMjLzi6Jl2pehDYur4o0cMiYbpqgGMJ+
1j8PMOEJDlO9yH168Wzu+lNP325r76bjkdz6GbEZ0NLHz4Hj3/s=
=NDi4
-----END PGP SIGNATURE-----

--------------yxpE2F20G0aRgWgcKvscgSK9--

