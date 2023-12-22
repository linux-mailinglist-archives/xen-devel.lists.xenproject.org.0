Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E67981D07E
	for <lists+xen-devel@lfdr.de>; Sat, 23 Dec 2023 00:37:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659706.1029438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGp42-00025b-IB; Fri, 22 Dec 2023 23:36:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659706.1029438; Fri, 22 Dec 2023 23:36:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGp42-00023h-FY; Fri, 22 Dec 2023 23:36:22 +0000
Received: by outflank-mailman (input) for mailman id 659706;
 Fri, 22 Dec 2023 23:36:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bcFB=IB=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rGp40-00023b-4d
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 23:36:20 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3aeb929-a122-11ee-9b0f-b553b5be7939;
 Sat, 23 Dec 2023 00:36:16 +0100 (CET)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id CD89A32005C1;
 Fri, 22 Dec 2023 18:36:09 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 22 Dec 2023 18:36:10 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 22 Dec 2023 18:36:07 -0500 (EST)
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
X-Inumbo-ID: e3aeb929-a122-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1703288169;
	 x=1703374569; bh=/8JgLJcMh6IikJVcXbrYYcpv5BvJM7gz0+g6xYnnQbY=; b=
	W8K4ouB0YwkokRzMWlpRjxtV94G1ySsYDnNun7h+rUsMuh5a8Y/EkHnDTBN/dwcX
	iILKVjOigyRWgw20S/0xwygsHdP/wqokOM8oTXZZc6InmD9ThKkzB3u+oeg+LlXz
	6yCEJDogcOuZadvOzlpX+FaHt2T4GWJRap7CW5qVgrsbARZzBKR3HlpieVa6UzHL
	ED3inSio3J7164a5+nnpeuq3ethOARWfwU/ADvJvf+w9FcIvrT8r/elfnUlc0mnS
	H3r0wWbbYfQutSXgOSDUe/xhdqJtYQMi2kFE6VSmBVPejFTRldGqpmz7OfH5DpmB
	DX6QHphL5U9W5WbmlzQZTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1703288169; x=1703374569; bh=/8JgLJcMh6IikJVcXbrYYcpv5BvJ
	M7gz0+g6xYnnQbY=; b=KXEsc3P9FCT4SgBVHciV33e+2XSeYi3Ux72jG7J44BdX
	nw3dLp7RfDnaZ6ASL65of1WhVoYRXrl8iaf45oiAmaLHa8fM0WnoJKYckXMdaYJB
	52ZqxuYwZ4J/pJel9NuLYn0+rieg5el7EERdKjNeK5macu7QSP8a7Mu6FirN9rFr
	LrLyjRbQkgRavsBm2Cxxl5qZNyhNDZJf719B1Rbv48gZ73r+2A5f77b7i2l6mda1
	C45/Fy84PZh+mdTZ09OpfVsCebezllsiYKWxU4davlTF7UZUTRX72jRmlBMwP3d5
	PWCjmLgg7KC+ysXKgEYcbqkT1BPn4ivzoELzyHvVxw==
X-ME-Sender: <xms:aB2GZdKWL9LOnN7g4CFsrsqL7wd2aCtQCyCjMn-hZWXN8EOokXkJNA>
    <xme:aB2GZZL_Ua03GMIC24da7ESHyoetg9Wiv8IfB9O0kDtY269PDDUoEbpCizQIGZsYG
    TgbKcXWTngWFw>
X-ME-Received: <xmr:aB2GZVtVf6UP96TM38Gf1mN9dbyacJrhXAwLt0G6KyJoXOAa1lf9w_XeucsNiFpfVdTOi4fiIZVRteuEEB38ATSwI1PM6GCHZg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvddukedguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:aB2GZeaFrryd2l6rB4_zGM4SKRn2mZk6QxEc8ZRx7Pj5YiVUBtoHAQ>
    <xmx:aB2GZUZr50Iry0GfY2u8WJaAQTKzq0Pis5K-JNB-n6RVaWHbXGaZqg>
    <xmx:aB2GZSAtWICc7DAzMlZ0rMDvOCjwlWyY-p0C_jBPy0mN52BMPEeYYQ>
    <xmx:aR2GZTlbXhP41ihE95dEJbx1RzFqUHexjmyMiJVbz-jhBYyw871T8g>
Feedback-ID: i1568416f:Fastmail
Date: Sat, 23 Dec 2023 00:36:04 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Neowutran <xen@neowutran.ovh>, xen-devel@lists.xenproject.org,
	Anthony Perard <anthony.perard@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>
Subject: Re: hvmloader - allow_memory_relocate overlaps
Message-ID: <ZYYdZXaji+BHVRoh@mail-itl>
References: <7oe275z3eap7rhdwmrm4mvqnjnhrpag5cjwnfvwsf7rchhkyjv@pd3abzwdhg6v>
 <217649a9-8399-48d3-ba49-ae22cacf0d4b@suse.com>
 <lyqv62ezqqaybcfuhkvbhiltvnxyy32wzr36kclh7bzrupcvib@a5fpoe6atykl>
 <1c857c96-9f2d-4787-8804-799a63a00480@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JxDNjKAmmYK28yAO"
Content-Disposition: inline
In-Reply-To: <1c857c96-9f2d-4787-8804-799a63a00480@suse.com>


--JxDNjKAmmYK28yAO
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 23 Dec 2023 00:36:04 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Neowutran <xen@neowutran.ovh>, xen-devel@lists.xenproject.org,
	Anthony Perard <anthony.perard@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>
Subject: Re: hvmloader - allow_memory_relocate overlaps

On Fri, Dec 22, 2023 at 12:35:57PM +0100, Jan Beulich wrote:
> On 21.12.2023 19:08, Neowutran wrote:
> > On 2023-12-19 17:12, Jan Beulich wrote:
> >> On 16.12.2023 08:01, Neowutran wrote:
> >>> I am wondering if the variable "allow_memory_relocate" is still
> >>> relevant today and if its default value is still relevant.=20
> >>> Should it be defined to 0 by default instead of 1 (it seems to be a
> >>> workaround for qemu-traditional, so maybe an outdated default value ?=
 ) ?=20
> >>
> >> So are you saying you use qemu-trad?
> > No, I am using "qemu_xen" ( from =20
> > xenstore-read -> 'device-model =3D
> > "qemu_xen"'=20
> >=20
> >> Otherwise isn't libxl suppressing this behavior anyway?
> > If by "isn't libxl suppressing this behavior" you means if libxl is set=
ting
> > the value of "allow_memory_relocate", then the answer is no.=20
> >=20
> > Following this lead, I checked in what code path
> > "allow_memory_relocate" could be defined.=20
> >=20
> > It is only defined in one code path,=20
> >=20
> > In the file "tools/libs/light/libxl_dm.c",
> > in the function "void libxl__spawn_local_dm(libxl__egc *egc, libxl__dm_=
spawn_state *dmss)":=20
> >=20
> > '''
> >  // ...
> >     if (b_info->type =3D=3D LIBXL_DOMAIN_TYPE_HVM) {
> >  // ...
> >=20
> >         libxl__xs_printf(gc, XBT_NULL,
> >                          GCSPRINTF("%s/hvmloader/allow-memory-relocate"=
, path),
> >                          "%d",
> >                          b_info->device_model_version=3D=3DLIBXL_DEVICE=
_MODEL_VERSION_QEMU_XEN_TRADITIONAL &&
> >                          !libxl__vnuma_configured(b_info));
> > // ...
> > '''
> >=20
> > However, on QubesOS (my system), "local_dm" is never used, "stub_dm"
> > is always used.=20
> >=20
> > In the function "void lib=20
> > xl__spawn_stub_dm(libxl__egc *egc, libxl__stub_dm_spawn_state *sdss)",=
=20
> > the value of "allow_memory_relocate" is never defined.=20
> >=20
> > I tried to patch the code to define "allow_memory_relocate" in
> > "libxl__spawn_stub_dm":=20
> >=20
> > '''
> > --- a/tools/libs/light/libxl_dm.c
> > +++ b/tools/libs/light/libxl_dm.c
> > @@ -2431,6 +2431,10 @@ void libxl__spawn_stub_dm(libxl__egc *egc, libxl=
__stub_dm_spawn_state *sdss)
> >                                         libxl__xs_get_dompath(gc, guest=
_domid)),
> >                          "%s",
> >                          libxl_bios_type_to_string(guest_config->b_info=
=2Eu.hvm.bios));
> > +        libxl__xs_printf(gc, XBT_NULL,
> > +                         libxl__sprintf(gc, "%s/hvmloader/allow-memory=
-relocate", libxl__xs_get_dompath(gc, guest_domid)),
> > +                         "%d",
> > +                         0);
> >      }
> >      ret =3D xc_domain_set_target(ctx->xch, dm_domid, guest_domid);
> >      if (ret<0) {
> > '''
> >=20
> > And it is indeed another way to solve my issue.=20
> > However I do not understand the xen hypervisor enough to known i=20
> > f
> > "allow-memory-relocate" should have been defined in
> > "libxl__spawn_stub_dm" or if the real issue is somewhere else.=20
>=20
> I think it should be done the same no matter where qemu runs. Back at the
> time iirc only qemu-trad could run in a stubdom, which may explain the
> omission. Cc-ing the two guys who are likely in the best position to tell
> for sure.

This indeed looks like a missing piece of qemu-xen support in
stubdomain.
But also, As Jan pointed out, this would be better fixed at the qemu
side so memory relocation could be re-enabled.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--JxDNjKAmmYK28yAO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmWGHWUACgkQ24/THMrX
1ywjygf+PnU8TiF6SXw0ZluBa3Iq6Rq4xluYDr/O54K4Gfr8tby+HkzQsZ4R9uFN
sJ2Fye1qNZG5QMNfI0ESZKtbv3BXRS7UJ/sButoFbHa1Q4Rl11Gp8HBr46bGy7oN
mInwAljbTUosHCLDIPWEVvqYQTxVt4OOjzqQyApK11d5owYJcFJK8txFsFx/7otQ
3KxtE7M1LKAsXIh5i15UsauFuReF3UmfjpjzDllfN7wNrTFDsi2JfTSTYTOu9jlA
7Mq95s65S0ILTmuhs+sHhnsYmvfJiL3ceAr6ZPHhLx6Dffh2D9wqUEDz5OXH55LR
Ksw7S/l5FNdYIUBqGybQee4ZlrGlvg==
=qxXg
-----END PGP SIGNATURE-----

--JxDNjKAmmYK28yAO--

