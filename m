Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E445F1878
	for <lists+xen-devel@lfdr.de>; Sat,  1 Oct 2022 03:40:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414471.658768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeRT3-0001fD-6g; Sat, 01 Oct 2022 01:39:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414471.658768; Sat, 01 Oct 2022 01:39:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeRT3-0001dT-1b; Sat, 01 Oct 2022 01:39:01 +0000
Received: by outflank-mailman (input) for mailman id 414471;
 Sat, 01 Oct 2022 01:38:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RiOR=2C=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1oeRT1-0001dN-9Y
 for xen-devel@lists.xenproject.org; Sat, 01 Oct 2022 01:38:59 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf71482c-4129-11ed-964a-05401a9f4f97;
 Sat, 01 Oct 2022 03:38:56 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 6AE6C5C00F0;
 Fri, 30 Sep 2022 21:38:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 30 Sep 2022 21:38:54 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Sep 2022 21:38:53 -0400 (EDT)
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
X-Inumbo-ID: cf71482c-4129-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1664588334; x=
	1664674734; bh=4Y1yVEfUHPk1tElemZjziRLNumjA2Ps5jgjeAEWF4UE=; b=Q
	zqH/a/TeYiFYyRaAaD5zCv6ae1HXvh7HG1UV6PaWizMqhVKnqI97PFx38i2ZCEyv
	geL3ylE9ORr1buGnpy15GRFjNY+ZeIJYVjTUj2Ak8Eo8CA6owzO3+Ke4GTiXX/fC
	md1XvCKDEcsNL3iNP48LU0IrLcXQYfZqp29K4Hj1+1/LsIQxj5LSJFiJB0DWV4X4
	yfGQidkKL/2UrZ7EliI3E8vVQxqFOcPYuGwgPr7GM3/GvpQ/N6aBjmM5tEOcK/P8
	y5YhR0LAV1MePV5SoOh9QY2KqrJEUuH+rvBXi6sne7GfO0DDrq5MbLrFZj7ie8J+
	JrkMHsqGAxNdbhjvr1iyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1664588334; x=1664674734; bh=4Y1yVEfUHPk1tElemZjziRLNumjA
	2Ps5jgjeAEWF4UE=; b=nXSuBGaC5K2a0uVtiNzniKoS9tfiTJuXy3UPZSbI2uWf
	3sPahyNajPXkS+HZMXq3FftaUnPxNYF8jitWSWOvd6nUL7MpZn36lqjYbK081MoA
	HxioIlmOFz05ECUrz/wIeQ1po3DZ8DsXp7AcOLJ5qHY+WENAHof01zejXFRznCw5
	qgTRCXzWtiqsmZTWzIWJ1evSBY7sWs/v4seWAdUlXNeGaNZisbTWD7JDQMFt+cRD
	x93qaadUysAd+j+6cwkKmt6kgz5PhaA6YPq21WTdZ84MwdfMjdzEErcWKGMP2ehO
	rvgRVBw9rAeD6bHcDBzX0ZMA6Mapjv5NHQZkjryS2g==
X-ME-Sender: <xms:LZo3Y-0KxuPrZpe2HQQEaqoQp1BgYLejrOGlRHJGP_4Rf1vkYViXyg>
    <xme:LZo3YxGxlcn_mt2lbtukromnsxtxSslFWB8J7A1UxnKFZleuk4S1lE1NtHjS6Gavm
    ntIzHhycR6ZDZk>
X-ME-Received: <xmr:LZo3Y24C3kJeAJXeIh4k22CLtAu49surux5t7XlyDedSaxB_AA39kY1Vs5y0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehfedghedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepvdejteegkefhteduhffgteffgeff
    gfduvdfghfffieefieekkedtheegteehffelnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:LZo3Y_1IAdXgv4YYDbOrjjKze3HiE_vbNIcJx50EOgXNsWvzuKbUfg>
    <xmx:LZo3YxEmn8S7b5mzTbMPZbEPO-BC_iwt2D5oPKiJc5HGUuH31ZTB6g>
    <xmx:LZo3Y48XiQqlR8rrn9nGSFBUkgrdIjFIxmlqdO8j37jk5ObuidaDMA>
    <xmx:Lpo3Y59ez1ow0lpmym_wBbXUZ1Vyxh4SAo9Z548i5ec9ryhGJidBSg>
Feedback-ID: iac594737:Fastmail
Date: Fri, 30 Sep 2022 20:30:33 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Kees Cook <keescook@chromium.org>,
	Anton Vorontsov <anton@enomsg.org>,
	Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v4 1/2] Avoid using EFI tables Xen may have clobbered
Message-ID: <YzeaKjmls1YI/3ox@itl-email>
References: <cover.1664298147.git.demi@invisiblethingslab.com>
 <f3b624e99adfdbbfc1976a60a73a6b5950e1840d.1664298147.git.demi@invisiblethingslab.com>
 <282a225d-8782-0321-6f0e-19dd4510dc42@suse.com>
 <CAMj1kXFQNqsW5RfHGac-eGbosJHBybu6+-Fap_bi_kVxWNpGeg@mail.gmail.com>
 <YzcjeiOW8+i2Zxsd@itl-email>
 <CAMj1kXHBBbCNV3CLesqZi7ttmmi8y4tZ1KO5vievy_CJrU2o3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f1U+J1ZNYcGqSCmT"
Content-Disposition: inline
In-Reply-To: <CAMj1kXHBBbCNV3CLesqZi7ttmmi8y4tZ1KO5vievy_CJrU2o3Q@mail.gmail.com>


--f1U+J1ZNYcGqSCmT
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Sep 2022 20:30:33 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Kees Cook <keescook@chromium.org>,
	Anton Vorontsov <anton@enomsg.org>,
	Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v4 1/2] Avoid using EFI tables Xen may have clobbered

On Fri, Sep 30, 2022 at 08:27:09PM +0200, Ard Biesheuvel wrote:
> On Fri, 30 Sept 2022 at 19:12, Demi Marie Obenour wrote:
> > On Fri, Sep 30, 2022 at 06:30:57PM +0200, Ard Biesheuvel wrote:
> > > I know very little about Xen, but based on the context you provided in
> > > this thread, I'd say that the best approach from the Xen side is to
> > > convert all EfiBootServicesData regions that have configuration tables
> > > pointing into them into EfiAcpiReclaimMemory.
> >
> > Should Xen convert the entire region, or should it try to reserve only
> > the memory it needs?  The latter would require it to parse the
> > configuration tables.  Is there a list of configuration tables that can
> > legitimately be in EfiBootServicesData regions?
> >
>=20
> Not really, no. So you would have to convert the entire region
> /unless/ Xen knows the GUID, and therefore knows how to derive the
> size of the table, allowing it to reserve memory more conservatively.
> However, I doubt whether this is worth it: splitting entries implies
> rewriting the memory map, which is a thing I'd rather avoid if I were
> in your shoes.

I actually wonder if Xen needs to reserve *all* of EfiBootServicesData.
The reason is that some (probably buggy) firmware may store ACPI tables
there, and Xen does not have an ACPI implementation.  From my
perspective, a much safer approach would be to pass all of
EfiBootServicesData memory directly to dom0, and have dom0 give Xen back
what it doesn=E2=80=99t wind up using.  That allows dom0=E2=80=99s memory r=
eservation
code to work properly, which it currently does not.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--f1U+J1ZNYcGqSCmT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmM3misACgkQsoi1X/+c
IsGokg/7BmeYWsuHyIip8QSpGg0PqxUx5LZTS8crGjyQ76Ielz5tCIMITIEk0ofl
gjlnPHVH+wY2M2M0i3GWCpgpzkEBCuWkIgujegbXEZ8YVg9K9Sow5dZBwCgP3DdR
guREHEgIs44F7K3GPle8IePmGH7ZHkele570faQkyPElgZaxxeqrUGVUz7QUN3pz
7tFOpvY1MVFYLXi9d0V7HbbcFUhXIGWAoi81o8hHiY+t29OTjlVfrPh9ruwXQxA/
DUYzlDA4aMvJxeSvmqvXbb9ZhN4RmKu/OxKsnph48qCs5QEwbAhWqj40cTtcQdBL
xcO/BsV2VrekeP5CIT2BlI0RxUZAWtG99YKztzy4n0VMgsS/lT0JSomzND4CgyDx
sv+freSMGzt6XX8/JvOl8E93TWVG/iorAIWZc1skzaMsX6mmdwhUyhhKNVunn3ZR
RIkluLvFCroAjGvvCBXLlmNtfT86N0DcOgD5n1lrt3J/sOLF2Dkq6Nmjj90VJYEV
KM1UZvJU/oKv8I2/2rxWbO/FiqwcGuU50gqQ92HfpJDrQtilUSCSWRje6/Cz4JZP
ySRaOshV8CICgQ5cQPZavMIVDAFoOh9b0eJ5w4emU/LrnJkY9RaAKA72rsZZTu4A
lhTBLEj/to92QAmoyX9x/d5tW+f6QQwRM1lW9o7PLBEODo693bo=
=MD/M
-----END PGP SIGNATURE-----

--f1U+J1ZNYcGqSCmT--

