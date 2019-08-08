Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D035085755
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 02:55:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvWf8-0000cF-HQ; Thu, 08 Aug 2019 00:52:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o++3=WE=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hvWf7-0000cA-81
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 00:52:13 +0000
X-Inumbo-ID: c147f0bc-b976-11e9-8980-bc764e045a96
Received: from new2-smtp.messagingengine.com (unknown [66.111.4.224])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c147f0bc-b976-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 00:52:11 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id E37F1D09;
 Wed,  7 Aug 2019 20:52:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Wed, 07 Aug 2019 20:52:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=yeplZJ
 iQlfciMQhK7EH1wcDMPzvYJLUT0m/YZyLtB88=; b=iVbKoqr43AaI3DvFRftpla
 JKPiBnYDFTKc0WUUpig+pXzclgnkofExz6mXLFngr6IWpxu0QWS4J0//NiVwuwYE
 Maa1iArZ7Dt8qF4zXmmPrsWfn5IWkhE4jrALVkN9pPXbInm7zsrzpK9TcGq/5bCA
 +eqJ5JQfC5LI2gJ5sZLEuzQEMdd4uFXfMdjQGSPA2eDsU+eL/HriLRqwOpO4a4Kr
 RePHCyqRRi/A4GjwniLB3zoT6vXUL2mlFXjSK4JE9+W7SNTxS23Ht0Saxb8+KldZ
 9XtikX0SCo130UZvd2HF7CHxrKlEetILhBzexFboUJyX/n6UU2oiHAsNmPsjP1eg
 ==
X-ME-Sender: <xms:OnJLXTnHrk-7JcJCDZMlHE4l__klRCMUi-GjU-SK4RsE9fmBxdGBMw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddruddugedgudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:OnJLXWjee0GgWR0gkyBJACKYHh9yvVXZL_hzz0hOVnWddBLXn3K45A>
 <xmx:OnJLXUdoSbZv8hxvBIw3E7HiU-vWlchfiEwaGG7mM82LJJT8NuFpoQ>
 <xmx:OnJLXeDrtWLa7t9kW3nBvCjncFmZs2n-djRtdxMTITSyOhCPeaO3Fg>
 <xmx:OnJLXZDZ6UZFIp4riyKyr84FNOZRNvl7exRAJhtt4IOsqc5vmE5cgw>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id D55F6380075;
 Wed,  7 Aug 2019 20:52:08 -0400 (EDT)
Date: Thu, 8 Aug 2019 02:52:05 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Message-ID: <20190808005205.GE3257@mail-itl>
References: <20190808003158.5256-1-marmarek@invisiblethingslab.com>
MIME-Version: 1.0
In-Reply-To: <20190808003158.5256-1-marmarek@invisiblethingslab.com>
Subject: Re: [Xen-devel] [PATCH] EFI: add efi=mapbs option and parse efi=
 early
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============8581377012947678090=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============8581377012947678090==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0QFb0wBpEddLcDHQ"
Content-Disposition: inline


--0QFb0wBpEddLcDHQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 08, 2019 at 02:31:57AM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> When booting Xen via xen.efi, there is /mapbs option to workaround
> certain platform issues (added in f36886bdf4 "EFI/early: add /mapbs to
> map EfiBootServices{Code,Data}"). Add support for efi=3Dmapbs on Xen
> cmdline for the same effect and parse it very early in the
> multiboot2+EFI boot path.
>=20
> Normally cmdline is parsed after relocating MB2 structure, which happens
> too late. To have efi=3D parsed early enough, save cmdline pointer in
> head.S and pass it as yet another argument to efi_multiboot2(). This
> way we avoid introducing yet another MB2 structure parser.
>=20
> To keep consistency, handle efi=3D parameter early in xen.efi too, both in
> xen.efi command line and cfg file.
>=20
> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>
> ---
>  docs/misc/xen-command-line.pandoc |  6 +++++-
>  xen/arch/x86/boot/head.S          | 21 ++++++++++++++++++---
>  xen/arch/x86/efi/efi-boot.h       | 10 ++++++++--
>  xen/arch/x86/x86_64/asm-offsets.c |  1 +
>  xen/common/efi/boot.c             | 23 ++++++++++++++++++++++-
>  5 files changed, 54 insertions(+), 7 deletions(-)
>=20
=2E..
> diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
> index 7a13a30bc0..df5e98e6bc 100644
> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -315,8 +315,10 @@ static void __init efi_arch_handle_cmdline(CHAR16 *i=
mage_name,
>          name.s =3D "xen";
>      place_string(&mbi.cmdline, name.s);
> =20
> -    if ( mbi.cmdline )
> +    if ( mbi.cmdline ) {
>          mbi.flags |=3D MBI_CMDLINE;
> +        efi_early_parse_cmdline(mbi.cmdline);

Compiler complains here, because mbi.cmdline is u32 (int vs pointer, and
also a different size). What is the proper way to make compiler happy
here? "(const char *)(uint64_t)" doesn't seems right.


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--0QFb0wBpEddLcDHQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl1LcjUACgkQ24/THMrX
1yxaEwf+Npp5+5ewp9h3lM+mZ4pwLZlw0ynOAm6+JTwdewhEK8L+Radp7CQvQbLu
i4QNzF4Exc0sfSGVW3lYekACMM5Ej+QpZxI1ADepY8BMK+vk15EcRHmRjY0To+Bi
b/HSmYGCORhFp7fL+KRcq57K5lstR67Tr1BTfgbvZnRcp7z/uig2+z9j2DaS0rG1
cyRtznPHOQNMlz6nqaCM2gJ2YG65sMYwi0IKb1aqUGk+8GM9bJWPthYLbf58TgkK
lGAOHYlFirmQOp6lB9Gp9WBiqJ8E7DQbS8sSE6ATD00H5QNvyKsRjKB/6KaZmNCT
IEutZlAdI6/RuFV5g20nfL7z6cZCVw==
=GIRQ
-----END PGP SIGNATURE-----

--0QFb0wBpEddLcDHQ--


--===============8581377012947678090==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8581377012947678090==--

