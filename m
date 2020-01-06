Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F20131357
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 15:08:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioSzi-0000mF-8F; Mon, 06 Jan 2020 14:04:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tjc+=23=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1ioSzg-0000mA-TT
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 14:04:33 +0000
X-Inumbo-ID: 71320300-308d-11ea-88e7-bc764e2007e4
Received: from wout2-smtp.messagingengine.com (unknown [64.147.123.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 71320300-308d-11ea-88e7-bc764e2007e4;
 Mon, 06 Jan 2020 14:04:24 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id F1ADC74E;
 Mon,  6 Jan 2020 09:04:22 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Mon, 06 Jan 2020 09:04:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=snV/PI
 Er4cnpaqIEpiZU2KzSbWgTDlfLuyvlbX4dIjQ=; b=eNJ5nW6kRktYepwYYtmrHU
 Xbq8iZJgNJs1EGZd86WItwmpNSVyWIU+wIWmOu3cn6vXwx+IK9+ml2Of9+i9mYUL
 2RIQGgwoCfYhFiQVCuUvr0f0CP8YCStUQ8swKASXRCcoTTVuXuJRtLQNAqJeE4Wc
 VEZMCzr1WL8E50+w0Pau3MXHWEQ21CJXXFMuG0JCtr5BRMYvnjyZabYpEJcneM9j
 uoNsXAS79XGUl82PElYWG4sfaUg3m/HWxyKHpKMukqEPvoZ+R7zw91D6+fo+/Lbl
 9anyMGYK+C9XHTdgYE2mHxEjGtgYAL4EYJGA7fwtwM210LNQlMmMyd9fvS84Dt0w
 ==
X-ME-Sender: <xms:Zj4TXrAhE1CBH-CBc9V5MU7VDHhj9jzijLLXaohr_dD7o62bX4ELdw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdehtddgieduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:Zj4TXlxtzpcgOqqHpdOFv7YFwD5_75Waco5s7xM_sIEYnaOIPsvGQQ>
 <xmx:Zj4TXhkloHM4P-mHEz1NCVBEx3Qg_dfVXJTsyLG55FiZo3Hz1XuM3Q>
 <xmx:Zj4TXiFLjwwKEeTf6Wee307Ya_pAsUjuOPJZcR6wW974wwSlDdFYvA>
 <xmx:Zj4TXq6sV0iXBH4UZnFSgFhjI74FXw_Vx8Mg1pDouuVtYG7KixHlDQ>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id BE5AF80059;
 Mon,  6 Jan 2020 09:04:21 -0500 (EST)
Date: Mon, 6 Jan 2020 15:04:18 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200106140418.GH1314@mail-itl>
References: <20200104010759.GA2507@mail-itl>
 <b40c6f0d-374e-b771-1463-74c40bf4a340@suse.com>
MIME-Version: 1.0
In-Reply-To: <b40c6f0d-374e-b771-1463-74c40bf4a340@suse.com>
Subject: Re: [Xen-devel] Broken PCI device passthrough, after XSA-302 fix?
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============7619410958256783281=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============7619410958256783281==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CGDBiGfvSTbxKZlW"
Content-Disposition: inline


--CGDBiGfvSTbxKZlW
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Broken PCI device passthrough, after XSA-302 fix?

On Mon, Jan 06, 2020 at 12:18:31PM +0100, Jan Beulich wrote:
> On 04.01.2020 02:07, Marek Marczykowski-G=C3=B3recki  wrote:
> > I have a multi-function PCI device, behind a PCI bridge, that normally
> > I assign to a single domain. But now it fails with:
> >=20
> > (XEN) [VT-D]d14: 0000:04:00.0 owned by d0!<G><0>assign 0000:05:00.0 to =
dom14 failed (-22)
>=20
> Is this on the 1st attempt, or after the device had already been
> assigned to some (same or other) guest? After quite a bit of
> staring at the code I can't seem to be able to spot a difference
> in behavior for the 1st attempt, but you not saying explicitly
> that it would only happen on subsequent ones makes me assume you
> run into the issue right away.

Yes, it was the first try.

> > This is Xen 4.8.5 + XSA patches. It started happening after some update
> > during last few months, not really sure which one.
>=20
> Having a smaller window would of course help, as would ...

The working version was just before XSAs of 2019-10-31  (which include
XSA-302).
But at this point, I'm not sure if no other configuration changes were
made (see below).

> > I guess it is because quarantine feature, so initial ownership of
> > 0000:05:00.0 is different than the bridge it is connected to.
> > I'm not sure if relevant for this case, but I also set
> > pcidev->rdm_policy =3D LIBXL_RDM_RESERVE_POLICY_RELAXED.
> >=20
> > Booting with iommu=3Dno-quarantine helps. Note I do not use `xl
> > pci-assignable-add` command, only bind the device to the pciback driver
> > in dom0.
>=20
> ... knowing whether behavior differs when using this preparatory
> step.

xl pci-assignable-add doesn't make a difference with XSA-306 applied.
But I've tried xl pci-assignable-remove with interesting result:
It succeeded for 0000:05:00.0 and 0000:05:00.2, but failed for
0000:05:00.1 with this message:

(XEN) [VT-D]d0: 0000:05:00.1 owned by d32753!<G><0>deassign 0000:05:00.1
=66rom dom32753 failed (-22)

Anyway, I think my previous testing was inaccurate:
Looks like the issue is caused by me failing to set rdm_policy, contrary
to the above message. I get the above error only without
LIBXL_RDM_RESERVE_POLICY_RELAXED set. When I set it properly, domain
starts even without iommu=3Dno-quarantine. I still have some issues with
the device within the domain, but not sure if relevant to this or
something else.

Does it make sense now?
Is the patch from your other message still relevant?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--CGDBiGfvSTbxKZlW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl4TPmIACgkQ24/THMrX
1yyCqgf/SbsRmDqrE7IdVlXvU3xudxiWn1oigXa1EYb9GaIczz5yq84Nd/iU53wK
jxE0hTcpw0AhNFZivge0U0GeZ6IY18teQRYsunlbby4ZStDh6eRFkh1MIyhSLQTI
jboBF18Jkp3zBG1PGFNcEnnpENVfMRfw56LreBUKvOU7txziWt6Q+79QJI66f+Vi
Pls1vg4CUYKN03ytKyQw3oAen6E1UCZ7zy6EEBdsqVS4JHqfSD9j3UHOGfDJH+iY
DQZf8D4/j0baexP2n1VaafLSd0wo1YoyuFhMSmiBst+Gsq7FR7YNduZm+YjNzfma
7BTjkgJHBrwnup9ivVdDptCRNcC2+g==
=1rVE
-----END PGP SIGNATURE-----

--CGDBiGfvSTbxKZlW--


--===============7619410958256783281==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7619410958256783281==--

