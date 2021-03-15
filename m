Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C8233C9DD
	for <lists+xen-devel@lfdr.de>; Tue, 16 Mar 2021 00:27:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98138.186048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLwbW-0007Cs-51; Mon, 15 Mar 2021 23:26:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98138.186048; Mon, 15 Mar 2021 23:26:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLwbW-0007CT-1f; Mon, 15 Mar 2021 23:26:30 +0000
Received: by outflank-mailman (input) for mailman id 98138;
 Mon, 15 Mar 2021 23:26:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hFYz=IN=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1lLwbT-0007CO-Mj
 for xen-devel@lists.xenproject.org; Mon, 15 Mar 2021 23:26:27 +0000
Received: from wout2-smtp.messagingengine.com (unknown [64.147.123.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8e9b8687-bbd8-4677-8e1b-98ef93d556c0;
 Mon, 15 Mar 2021 23:26:26 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 0C977C58;
 Mon, 15 Mar 2021 19:26:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 15 Mar 2021 19:26:25 -0400
Received: from mail-itl (ip5b434f04.dynamic.kabel-deutschland.de [91.67.79.4])
 by mail.messagingengine.com (Postfix) with ESMTPA id 165391080054;
 Mon, 15 Mar 2021 19:26:23 -0400 (EDT)
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
X-Inumbo-ID: 8e9b8687-bbd8-4677-8e1b-98ef93d556c0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=RUP+Qy
	0XCC6YGjs6J6SHjKXK1rHiGlhcFbVleO5Jl0A=; b=ITigs272jgCHaLf+/xpx7E
	7B5ujs2GP8rlHcCTspH6C83KyaWTkk3JRXxCVT8tOTuCw6VihzAoTPmxDquuXzJa
	31ojOmo0flAEAo1Xoa62N8+XnVtiIPElF/Dx7gy/PnMwr6/Ey0UzJXOizK2gURzg
	tFDLnTIeJRYoAOnp9JbVNqD+8vM6R91QGvn9FjSZ3rqLM26NdU1tergiYGf9gsYJ
	QSV8uK1K/soatjYIpTpg3EZoHMXyT0PyQ+G2GrtDw+4ggL3Tzyh6NLP5QXJPX52C
	Yq10kbx7pucKYlwpzbtUj4tpSuQbEK31DnIfKtYtgxnrIw+9kl5bYvfaG+dt3hrQ
	==
X-ME-Sender: <xms:IO1PYPt6SZvMY4IWWxUCOOeogj5P7RiF-l2iNmI0EUptuBisov0WUQ>
    <xme:IO1PYAf7IHSQY3t5QR0nKULtvm-x2ORTI5-kMRtf7RXy2JZ1pfEAaylqzytv3gFll
    NiNROdFkkj_jw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefuddgtdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeehvedv
    ueevheekhefhvefggffgvedugeetuefgleeivdehgfeuieeugfetteeiffenucffohhmrg
    hinhepkhgvrhhnvghlrdhorhhgnecukfhppeeluddrieejrdejledrgeenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:IO1PYCyEZ4eyrJlP7WmNN3IdhWe7mCGRV2ILNAyLyA5Jn3RcZRu1Mw>
    <xmx:IO1PYOM6Ru2fAXkxRZ-Ar6oA2PaYFODkw4D-S5XVUmhyh6yQ4pHpXw>
    <xmx:IO1PYP_IVn-94Dy0-xIveZgGT3MqUNYcaijrYcS0NAz6ghic1ytGow>
    <xmx:IO1PYCIqct_HtxBXIB4Z9vRK2mPhsR3isYIDz7GrUlhC6ZSLMmL3gQ>
Date: Tue, 16 Mar 2021 00:26:19 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: 4.15.0-rc3 can't create domain when dom0 uses newer kernel
Message-ID: <YE/tHMt0BAtPVVi/@mail-itl>
References: <CABfawh=fNCxQs+QBsYw5StA+vNwqzyQUHyiib3_rujDS1W8S9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ry965KNaZSipdULv"
Content-Disposition: inline
In-Reply-To: <CABfawh=fNCxQs+QBsYw5StA+vNwqzyQUHyiib3_rujDS1W8S9A@mail.gmail.com>


--ry965KNaZSipdULv
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Mar 2021 00:26:19 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: 4.15.0-rc3 can't create domain when dom0 uses newer kernel

On Mon, Mar 15, 2021 at 04:18:42PM -0400, Tamas K Lengyel wrote:
> Hi all,
> I've ran into a pretty strange issue. I have a freshly installed 4.15.0-r=
c3
> system and everything works fine with the stock Ubuntu 20.04
> vmlinuz-5.4.0-66-generic as the dom0 kernel - except vmtrace, which needs=
 a
> newer kernel, that's expected. Now if I boot dom0 with
> vmlinuz-5.8.0-44-generic or vmlinuz-5.10.0-1016-oem I can't start any
> domains because of some strange disk error:
>=20
> root@t2:/shared/cfg# xl create ubuntu-20.04.cfg
> Parsing config from ubuntu-20.04.cfg
> libxl: error: libxl_device.c:1109:device_backend_callback: Domain 1:unable
> to add device with path /local/domain/0/backend/vbd/1/51712
> libxl: error: libxl_create.c:1613:domcreate_launch_dm: Domain 1:unable to
> add disk devices
> libxl: error: libxl_device.c:1109:device_backend_callback: Domain 1:unable
> to remove device with path /local/domain/0/backend/vbd/1/51712
> libxl: error: libxl_domain.c:1529:devices_destroy_cb: Domain
> 1:libxl__devices_destroy failed
> libxl: error: libxl_domain.c:1182:libxl__destroy_domid: Domain
> 1:Non-existant domain
> libxl: error: libxl_domain.c:1136:domain_destroy_callback: Domain 1:Unable
> to destroy guest
> libxl: error: libxl_domain.c:1063:domain_destroy_cb: Domain 1:Destruction
> of domain failed
>=20
> This is the disk config:
>=20
> disk =3D ['phy:/dev/t2vg/ubuntu-20.04,xvda,w']
>=20
> It's a standard LVM volume that is active, lvscan shows:
>=20
>   ACTIVE            '/dev/t2vg/ubuntu-20.04' [40.00 GiB] inherit
>=20
> I checked all the logs and I don't see anything relevant anywhere. If I
> reboot the system with the older kernel everything works as expected as f=
ar
> as creating the same domain with the same config.
>=20
> Anyone has any idea what might be going on here?

Make sure your kernel has this patch:
https://lore.kernel.org/xen-devel/4c9af052a6e0f6485d1de43f2c38b1461996db99.=
camel@infradead.org/
I'm not sure about the 5.8.x, but for 5.10 it is in >=3D 5.10.13.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--ry965KNaZSipdULv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmBP7RwACgkQ24/THMrX
1ywqtQf9FH0/EcdxkzqBPJ+WOfh47qwhBXEoOH9jOVQpJiNVtaeCgUTCnFYELs1P
0U3ZbFCZxG3MU27OCCy3K+WoZaT6PFY608NzUJLdhE2WOvWH2UU73CoHsIxg9w4F
eDhvlvS2KZo1wUrGdSWkepm2fwIgH4MLByWdBd1cvfXQ1968EV2EXjsFvV4LFv09
TYFFbCJb6KK3CXP9WuNSzz5i14MlNVpCDPuIkITlJhkWrq0e5/ZAlVPF8TDb2vWf
G/oiOy4IHGzGB8nDhJW0lV5U/pUeA7KscpgDdhf0pOmOY0jEIxpn8R8Rzg+hl27N
66zWOmeweug5Qnovef5AEnvY0mWZFQ==
=DuYy
-----END PGP SIGNATURE-----

--ry965KNaZSipdULv--

