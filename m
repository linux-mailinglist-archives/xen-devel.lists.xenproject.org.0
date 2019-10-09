Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF0BD0EAD
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 14:26:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIAxz-0004nt-T8; Wed, 09 Oct 2019 12:21:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RT5Q=YC=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iIAxx-0004no-Sf
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 12:21:17 +0000
X-Inumbo-ID: 4b08dd50-ea8f-11e9-80e3-bc764e2007e4
Received: from out3-smtp.messagingengine.com (unknown [66.111.4.27])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4b08dd50-ea8f-11e9-80e3-bc764e2007e4;
 Wed, 09 Oct 2019 12:21:17 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 077BC220DB;
 Wed,  9 Oct 2019 08:21:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Wed, 09 Oct 2019 08:21:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=sU3Syw
 lczozLdaaw0Ok8gAqFprNWvRhpnV2qvEzmfYU=; b=nBoyHA6nwEwiTfUaeb4dKw
 4Z1BOxuyo8kUZCDRq9VoRFb8QbYvH547lflT0fTVSVSdkYnUmHmRehPKRJFfo9Le
 IIGeQt8/gJsY0a3ZRkqvpcoVtMwlUpULZZNw02mo2ce865hliJdzoFYJ9nU5zxuI
 Pmpt4Rv4x78dDiBppEwva1bvJw5AlFKikRbZVVepaA2nuUslYF0E0bMPUoigRgVO
 d1DQygRanuMQEJzJVYOLNf0shYWyTs4uynbGA1As7t9Fkm4F9ZH57Npx+ZkofFDN
 OzJ3s88DXoYDtnSN0vMZHwbxfqVC4M9CpYRrOXMstQE0x+H6txe7uzxk3QE0mk2A
 ==
X-ME-Sender: <xms:vNCdXXjDKW6hLGAO9wkefGek-iSQMn1SVEOH7QOSF_SM_k_sylFuAw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedriedugddviecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
 ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
 hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecukfhppedukeekrddugeejrdduudef
 rddvfeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhish
 hisghlvghthhhinhhgshhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:vNCdXYT_KlEEsQun5NsZFSJ5m4ZN5bgeRPS5O3ixENqlztS_MxBWzg>
 <xmx:vNCdXSFQOvgCqe52TcPn4Zn4AIIyrM6WhygvWJZgEKhF24kvVw4SnA>
 <xmx:vNCdXYnNPKDvlSSqgG-F31XqOcPI-kc-PjAMrOa94iJMSqQ3OxxMag>
 <xmx:vdCdXbEsto6BqgNX_hfvkDTa_bOHfl_ss2Eqx3kFKn2cfQx8Zk6S2Q>
Received: from mail-itl (188.147.113.233.nat.umts.dynamic.t-mobile.pl
 [188.147.113.233])
 by mail.messagingengine.com (Postfix) with ESMTPA id 30F2980061;
 Wed,  9 Oct 2019 08:21:13 -0400 (EDT)
Date: Wed, 9 Oct 2019 14:21:09 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191009122109.GR8065@mail-itl>
References: <20191008135252.GK8065@mail-itl>
 <3251752c-117b-7a71-88ef-18e49aa63329@suse.com>
 <20191008162922.GL8065@mail-itl>
 <815f3cbc-22c3-5a02-429b-0cdf12d84917@suse.com>
 <20191009103153.GO8065@mail-itl>
 <13c61616-25eb-019d-75fd-7ac72f8bf133@suse.com>
 <20191009110051.GP8065@mail-itl>
 <3a75989f-d655-3bb7-4a71-5421c6f8a625@suse.com>
 <20191009115254.GQ8065@mail-itl>
 <26a97d5f-5100-19ea-a945-f2954a3d9d09@suse.com>
MIME-Version: 1.0
In-Reply-To: <26a97d5f-5100-19ea-a945-f2954a3d9d09@suse.com>
Subject: Re: [Xen-devel] Xen 4.12 panic on Thinkpad W540 with UEFI mutiboot2,
 efi=no-rs workarounds it
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============1857282136154162607=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============1857282136154162607==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wql0Keo7sdg2dbSl"
Content-Disposition: inline


--wql0Keo7sdg2dbSl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] Xen 4.12 panic on Thinkpad W540 with UEFI mutiboot2,
 efi=no-rs workarounds it

On Wed, Oct 09, 2019 at 02:07:05PM +0200, Jan Beulich wrote:
> On 09.10.2019 13:52, Marek Marczykowski-G=C3=B3recki  wrote:
> > On Wed, Oct 09, 2019 at 01:48:38PM +0200, Jan Beulich wrote:
> >> On 09.10.2019 13:00, Marek Marczykowski-G=C3=B3recki  wrote:
> >>> On Wed, Oct 09, 2019 at 12:50:09PM +0200, Jan Beulich wrote:
> >>>> On 09.10.2019 12:31, Marek Marczykowski-G=C3=B3recki  wrote:
> >>>>> BTW How runtime services work after kexec? I don't see EFI handles
> >>>>> handed over kexec, are they somehow re-discovered?
> >>>>
> >>>> What EFI handles are you talking about? For runtime services
> >>>> what a consumer needs is a table pointer, which is a field
> >>>> in the system table, which in turn is an argument passed to
> >>>> the EFI application's entry point.
> >>>
> >>> Yes, I'm talking about those pointers (system table specifically).
> >>>
> >>>> I didn't think there are
> >>>> provisions in the spec for either of these pointers being NULL.
> >>>
> >>> But I don't see kexec using EFI application entry point. Am I missing
> >>> something?
> >>
> >> Can we stop thinking about a Linux -> Xen transition on this
> >> thread please?=20
> >=20
> > I'm talking about Xen->Xen transition here. How system table pointer is
> > passed from old Xen to new Xen instance? And how the new Xen instance
> > deals with boot services being not available anymore?
>=20
> It doesn't. I should better have said "* -> Xen transitions" in
> my earlier reply. I simply can't see how this can all work with
> EFI underneath without some extra conveying of data from the old
> to the new instance.

Does it mean the whole discussion about SetVirtualAddressMap() being
incompatible with kexec is moot, because runtime services (including
SetVirtualAddressMap()) are not used by Xen after kexec anyway? If I
understand correctly, you just said the Xen after kexec don't have
runtime services pointer.
If not, can you explain what exactly is the case when second call to
SetVirtualAddressMap() could happen (being the reason for #ifdef-ing it
out in efi/boot.c)?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--wql0Keo7sdg2dbSl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl2d0LUACgkQ24/THMrX
1yyr8Af/ZplX7tSfZNufStbEVJymxy7DBQGvAMo6Q7LQPxNkYMBelotMoKNS4Jqf
AyTlowWjImVr/IjcgKIh9EEmSBb0bfbvHM1RZpSfonOiEH2Zo+CVW5YGTieVdSQA
GvCr0H95rFDHQFFzz3IXOJljBZhIehOx0VwqKK06eVNMUIwACQvyOQgPX3UPlUH9
yEPg8UNuBxjS2xrhb6Vsy3M+Jjdcy1UxaifwUucdNlL/0iqJxQ08wBs7u/upDUm2
VZAGmoAQ/l6Mx8EO5w/k/bBGUA9dB4Wyp53sEd1hYMgy/Zr3VaZhBz48s4Wo9oL+
WGFz8uK+68Kpqz2Ha3bcxX0Gv5CxTw==
=iYfw
-----END PGP SIGNATURE-----

--wql0Keo7sdg2dbSl--


--===============1857282136154162607==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1857282136154162607==--

