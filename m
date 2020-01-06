Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 024151313A1
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 15:32:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioTOM-0003HY-VG; Mon, 06 Jan 2020 14:30:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tjc+=23=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1ioTOL-00037B-Hx
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 14:30:01 +0000
X-Inumbo-ID: 001b915a-3091-11ea-a914-bc764e2007e4
Received: from wout2-smtp.messagingengine.com (unknown [64.147.123.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 001b915a-3091-11ea-a914-bc764e2007e4;
 Mon, 06 Jan 2020 14:29:52 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 20E0B751;
 Mon,  6 Jan 2020 09:29:51 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Mon, 06 Jan 2020 09:29:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=uSli1K
 V4yWw6qmhcEyNCmIwSMDMtTRUH1kVoe7015nQ=; b=SLUziQ40JwU+Az/BImFYXg
 e2yAcHJf/iiEsD3XQiAu5sjzkmtiN3lYY+SBe9zQr7x+rTnVC4A7h5cuyn2K/Ph4
 cHHsJXXAtYgCWQwmrKLYcalmScrnDbwVrfCv4Xoibsef/XtGl8qFwxA86Rp1km0I
 gB9Uq27nVr5/kcMa+b4m3YjXSZk+x9/ojVJPm/mwLI47V7lnbYLOhIJSEF3bOTor
 MbMbTD9j/lLeVlMZm+Kh68qHZSb4pP1RY2i09mPpmfx+JoHEK5mpMlcp9J802z6y
 4hcXqFGx8gc8FaFH2vcoW0GpDkldMEkePcLpO5WJ5dFf4ofXlV9Je2BnNgltuHhA
 ==
X-ME-Sender: <xms:XkQTXkreK3M3N1VuiCErJLla2srNti01KZVVUCnTrwWvlm0uyWMm-g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdehtddgieeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:XkQTXt4pGsAYvRWPO2FXM4KB0DSkIOzg9_mLzt9fqgEZ41fhVVYhRQ>
 <xmx:XkQTXirLM1L8aIiAZBu6MizLWeYOq5syzC-u0CSbh7MCrN7BmAbDww>
 <xmx:XkQTXni4rqkBFZfhvB_08umkzTt4109wXe5vjahlEsElrCVGggOeGw>
 <xmx:XkQTXvlFQ_2KXeYRRnDHLcSg8RBFr6eVLh7i3P8LAx-IGDyPedYPSQ>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id C791C80063;
 Mon,  6 Jan 2020 09:29:49 -0500 (EST)
Date: Mon, 6 Jan 2020 15:29:46 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200106142946.GJ1314@mail-itl>
References: <20200104010759.GA2507@mail-itl>
 <b40c6f0d-374e-b771-1463-74c40bf4a340@suse.com>
 <20200106140418.GH1314@mail-itl> <20200106141609.GI1314@mail-itl>
MIME-Version: 1.0
In-Reply-To: <20200106141609.GI1314@mail-itl>
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
Content-Type: multipart/mixed; boundary="===============2493291486676522052=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============2493291486676522052==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Fnm8lRGFTVS/3GuM"
Content-Disposition: inline


--Fnm8lRGFTVS/3GuM
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Broken PCI device passthrough, after XSA-302 fix?

On Mon, Jan 06, 2020 at 03:16:11PM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Mon, Jan 06, 2020 at 03:04:20PM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Mon, Jan 06, 2020 at 12:18:31PM +0100, Jan Beulich wrote:
> > > On 04.01.2020 02:07, Marek Marczykowski-G=C3=B3recki  wrote:
> > > > I have a multi-function PCI device, behind a PCI bridge, that norma=
lly
> > > > I assign to a single domain. But now it fails with:
> > > >=20
> > > > (XEN) [VT-D]d14: 0000:04:00.0 owned by d0!<G><0>assign 0000:05:00.0=
 to dom14 failed (-22)
> > >=20
> > > Is this on the 1st attempt, or after the device had already been
> > > assigned to some (same or other) guest? After quite a bit of
> > > staring at the code I can't seem to be able to spot a difference
> > > in behavior for the 1st attempt, but you not saying explicitly
> > > that it would only happen on subsequent ones makes me assume you
> > > run into the issue right away.
> >=20
> > Yes, it was the first try.
> >=20
> > > > This is Xen 4.8.5 + XSA patches. It started happening after some up=
date
> > > > during last few months, not really sure which one.
> > >=20
> > > Having a smaller window would of course help, as would ...
> >=20
> > The working version was just before XSAs of 2019-10-31  (which include
> > XSA-302).
> > But at this point, I'm not sure if no other configuration changes were
> > made (see below).
> >=20
> > > > I guess it is because quarantine feature, so initial ownership of
> > > > 0000:05:00.0 is different than the bridge it is connected to.
> > > > I'm not sure if relevant for this case, but I also set
> > > > pcidev->rdm_policy =3D LIBXL_RDM_RESERVE_POLICY_RELAXED.
> > > >=20
> > > > Booting with iommu=3Dno-quarantine helps. Note I do not use `xl
> > > > pci-assignable-add` command, only bind the device to the pciback dr=
iver
> > > > in dom0.
> > >=20
> > > ... knowing whether behavior differs when using this preparatory
> > > step.
> >=20
> > xl pci-assignable-add doesn't make a difference with XSA-306 applied.
> > But I've tried xl pci-assignable-remove with interesting result:
> > It succeeded for 0000:05:00.0 and 0000:05:00.2, but failed for
> > 0000:05:00.1 with this message:
> >=20
> > (XEN) [VT-D]d0: 0000:05:00.1 owned by d32753!<G><0>deassign 0000:05:00.1
> > from dom32753 failed (-22)
>=20
> And now, after this operation (failed -remove) I get the following error
> on domain start, even with LIBXL_RDM_RESERVE_POLICY_RELAXED properly
> set:
>=20
> (XEN) [VT-D]d13: 0000:05:00.1 owned by d32753!<G><0>assign 0000:05:00.1 t=
o dom13 failed (-22)
>=20
> I've tried doing -add and -remove in different order and every time it
> fails for 0000:05:00.1, but works for other functions.
> I don't see anything special about this function, compared to others.
>=20
> I'll reboot the system and try again...

After fresh reboot:

1. xl debug-keys Q says 0000:05:00.* are assigned to dom0.
2. xl pci-assignable-add 0000:05:00.* (in order: .0, .1, .2)
3. domain start (with LIBXL_RDM_RESERVE_POLICY_RELAXED set) fails:

(XEN) [VT-D]d5: 0000:04:00.0 owned by d0!<G><0>assign 0000:05:00.2 to dom5 =
failed (-22)

4. xl debug-keys Q says 0000:05:00.* are assigned to d32753
5. domain start (with LIBXL_RDM_RESERVE_POLICY_RELAXED set) fails:

(XEN) [VT-D]d7: 0000:05:00.2 owned by d32753!<G><0>assign 0000:05:00.2 to d=
om7 failed (-22)

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--Fnm8lRGFTVS/3GuM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl4TRFoACgkQ24/THMrX
1yyjxgf+Oh2ystNHmJdtZMzCzaE4xOvXGOJtxADPUjlHZkJMLqxbznx7sT7TSMKB
yOSXi2E7Kwn6TtSxbXDp19AuR3lgwScykwzykpF3/gw1tKM7bUlvET9BBRVw4r5z
h1ILYPazxJT1tuGlDbqEwh/h2fccLOlT0eMhhx8zXpWmhcBqNp4MQCwDpP/JPC2e
v5RrJfOKLR9sbeZZXvSYEgjeT5AbUt2yEsUsA0MeXmZjY8JVzFfDBJjbNWRrqulG
wnxbWDXT+MTrM1rmHh0IDI0fiZ871XxYjiIqgnoAXncW/L5HKE0LCB2ZoRcr9Vph
fW8lVso8y598VTR67hUpUlhVnzfe2w==
=yEev
-----END PGP SIGNATURE-----

--Fnm8lRGFTVS/3GuM--


--===============2493291486676522052==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2493291486676522052==--

