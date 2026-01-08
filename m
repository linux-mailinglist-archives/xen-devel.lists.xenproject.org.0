Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D01C0D0292C
	for <lists+xen-devel@lfdr.de>; Thu, 08 Jan 2026 13:20:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1197640.1515115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdozN-0005Xh-Oe; Thu, 08 Jan 2026 12:19:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1197640.1515115; Thu, 08 Jan 2026 12:19:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdozN-0005Vx-Lg; Thu, 08 Jan 2026 12:19:41 +0000
Received: by outflank-mailman (input) for mailman id 1197640;
 Thu, 08 Jan 2026 12:19:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FNBb=7N=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vdozM-0005Vr-BO
 for xen-devel@lists.xenproject.org; Thu, 08 Jan 2026 12:19:40 +0000
Received: from fout-a7-smtp.messagingengine.com
 (fout-a7-smtp.messagingengine.com [103.168.172.150])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c8197a3-ec8c-11f0-9ccf-f158ae23cfc8;
 Thu, 08 Jan 2026 13:19:37 +0100 (CET)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfout.phl.internal (Postfix) with ESMTP id 90758EC0176;
 Thu,  8 Jan 2026 07:19:36 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Thu, 08 Jan 2026 07:19:36 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Jan 2026 07:19:35 -0500 (EST)
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
X-Inumbo-ID: 4c8197a3-ec8c-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1767874776;
	 x=1767961176; bh=ZyBT7EGpn1HgIDscg0sa9ORaZILVZhvzoAc7cA+rbQE=; b=
	lcmfO8s+/mbpfLRg3FaY/C/FWr1r4juUEcpbfpn3PqghR0vt3DC+ZWxa0Z7Wqelr
	jgqJvm6NWAQvBxDTLvB49C6qtQzvg0FBgGu45bLFj4jCSGiBhpGiwNXyLWqtKQM1
	Y+mgxqApqIzKuTXeG3Z/p6/xXBEnpAth2A/znokPaaNMdpn8Zq9tDaXlrMzwzZjD
	GL5BO7zL+PyttMeF+pzTE4AwUxiLTpHdaYOW9ldEFY7HKfNGxZzWILf3TRzaVL3X
	EsY5ExR0LOWypAbgY+zPYsOgPtDyFSyyy+Q7FWBJCtLZYfe99UAb+tGhIyhZaWOV
	va6dtqO404ZeFRUH7VV0AA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1767874776; x=1767961176; bh=ZyBT7EGpn1HgIDscg0sa9ORaZILVZhvzoAc
	7cA+rbQE=; b=eZlugFkanKdJ1/F4ZcTmYxMBvEjQgpNoQ5VHeJfG+Fu0+4HVwN1
	bjrSDl8Vd0Z/zg5dDmG5GGXur7HyceZN+BqYLyy2SCtC66hcmG8J3aR5zHQhAhJ9
	+OobBdZ8rXzG7yvddeHxxF1sqIk2buPB2lwtbwComPBttW1rt1GDS4/rcEykAP9l
	QDEcLcpxineGdoi7fTRToQriDP9nLTlPDf6mVPg/5zGJDKJmQIYfGapDAMQ2R9H2
	pLAlGYJG4T8to86foBLGDxEIcnPB2h0x/Xo8Qmc6nAUBPPez5sqhy0qGnpqoMCd9
	DjiJgtOFQHFVRgvaE5QKVzex+CBGF6JmD0A==
X-ME-Sender: <xms:2KBfaZekKsGKUjr0PCOHcL2LKeQ9q8aa5PCtBKF9Luc0fi1_2GQoeQ>
    <xme:2KBfaeN-ap8dn5XvNzL-roLYZ0EuhUjy-_5L0zBJvWXEOZCI0KwVZtxOsV5Q-7Yfp
    WmxlRlJMkI8OY2CPyvaiyo7HDymuZ8-QvUXkuNh0lcFNJHsWzE>
X-ME-Received: <xmr:2KBfaXgGhs-La2wI2LNiyZ1XYyctAHFcqjIu_bRIyhwcwBqJVcoYt_FE6mmNZYH8znrD9cCsZtwFmJ42vNsQ2QZOh2LOvrjb9a8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutdehleefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleet
    feevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepgedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtgho
    mhdprhgtphhtthhopehjrghnughrhihukhesghhmrghilhdrtghomhdprhgtphhtthhope
    hmihhlkhihpgifrgihpgeftdeftdeftdesphhrohhtohhnrdhmvgdprhgtphhtthhopeig
    vghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrgh
X-ME-Proxy: <xmx:2KBfaR2foKUB4A532x9NntdUYbV_TGL19XW0_aq4WGODRTEnylL0Tw>
    <xmx:2KBfaRgDVVZmWCPwdPC5zA0pn_pWULDGraTaXfGWfOD2lDfzmB5Z8A>
    <xmx:2KBfaRcvsBtfj-Siw5K5IDqIqLnjqTZVp8WxDiGxhH8mu2Bk2BCzqg>
    <xmx:2KBfaUnKcfddcmuVczQI1eFltGXzvmgMrmJR68u8CjAtwd7B1XXu8g>
    <xmx:2KBfaSpT4Gb_oGhTviA0-zXg4moZkG4enc9S9QsYW36gN1k0YDexfbVN>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 8 Jan 2026 13:19:33 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Jason Andryuk <jandryuk@gmail.com>, Milky <milky_way_303030@proton.me>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Cpufreq drivers not working on T480S
Message-ID: <aV-g1UGaa6q9XMn9@mail-itl>
References: <dg8zeLW4X3RWRJt-1jas5pAqHft5GbxYxS5mNwc4ONE8tDEruL1-5a_e-vQu1RdOUWsMXxKe_Igcewy2zcbnOfkaGVG7y6hXLcLd78HI1po=@proton.me>
 <CAKf6xpsN_RnY2dHnXKj_-UySf1z0auye2qy=KHOEhcBbZ1un9A@mail.gmail.com>
 <NqFx_tXl0Zmx2ft7YVNGodkDcUFK7nA8KWUQMjOmD0y4T5W3-sTcGxCt7ViSRObUeJog3069xTY0ODZIG5hrX-Th2MvE95dSze13MGQ2tOY=@proton.me>
 <CAKf6xpvtF_cE7vMb9JfsVLkYH1XRXZG3nj+QO_72-zKJ3Cxh9w@mail.gmail.com>
 <DkXw78UBxXYCLNKCoThGPM1kde5JwARo3NhWtlBBrrFtLFVTnwNlwDlZYzuNlSdAs9XzE0aDPqgt9dri9YKJULULBXwJLEcEgbLOgzkVSVU=@proton.me>
 <CAKf6xptg+0KrsjrmLD1iZFuT411S+7Pz9-HSX8L-KwQFR8o3Nw@mail.gmail.com>
 <6f02aca2-eaca-48b8-a2f3-4afff42ad264@suse.com>
 <aV6xvhqjX1sOrXb1@mail-itl>
 <1822f42f-9fbe-4de5-bc0b-f6e776b28ed5@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SANc0ADrC06CE80K"
Content-Disposition: inline
In-Reply-To: <1822f42f-9fbe-4de5-bc0b-f6e776b28ed5@suse.com>


--SANc0ADrC06CE80K
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 8 Jan 2026 13:19:33 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Jason Andryuk <jandryuk@gmail.com>, Milky <milky_way_303030@proton.me>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Cpufreq drivers not working on T480S

On Thu, Jan 08, 2026 at 08:32:37AM +0100, Jan Beulich wrote:
> On 07.01.2026 20:19, Marek Marczykowski-G=C3=B3recki wrote:
> > On Tue, Jan 06, 2026 at 09:25:14AM +0100, Jan Beulich wrote:
> >> On 06.01.2026 02:03, Jason Andryuk wrote:
> >>> no-hwp failed to disable HWP.  But if there is no ACPI CPU data, it
> >>> wouldn't work either.
> >>
> >> There isn't any "no-hwp" option that we would recognize, is there? Iir=
c HWP
> >> isn't enabled by default, so simply not saying "cpufreq=3Dhwp" should =
disable
> >> the driver? (I already found the original report confusing in this reg=
ard,
> >> hence why I preferred to not reply so far. I wonder if there are local
> >> patches in use.)
> >=20
> > Qubes has a patch enabling HWP by default on supported platforms.
>=20
> In which case can you please tell the reporter how to properly disable us=
e of
> the driver? Iirc the to-be-expected "cpufreq=3Dxen" was already tried, wi=
th no
> effect.

Looking at the code, it should be cpufreq=3Dxen,no-hwp (so ",", not ":").

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--SANc0ADrC06CE80K
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmlfoNUACgkQ24/THMrX
1yxGNAf+O8S4HAC65hcGGKfUqrsah3uN8RNTxi/El0XR8ePgCC+W8c1oyPYdzUKS
Meob/upA3yY4XHY/EQmBFq8Z3jDnpbDqG9nsXp6EurodXIj/zuVvJL8JFzONl4Rf
ZF9xleZphfgJuk2oFsYOyfZyUnxd0P7qoCncplxb/KevOh9sFIidvGlM3qYKrs/V
5sL3SL4tC3odaGCdeVDbG/QFVc5fRnctofjybGNQR5TBaR9DbOTvSE6QYxnSUr2n
4A4MlNbDtExgIzLq0cjRqo2w9e2e75jXmmxT2F+eBnVDn98v5+tEytXtfLB9nLaO
oKMX3ZehlzdTB2HYkv9uf1NMQ9t7pA==
=9kVF
-----END PGP SIGNATURE-----

--SANc0ADrC06CE80K--

