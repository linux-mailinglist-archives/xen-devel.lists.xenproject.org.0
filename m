Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A57C637A4D6
	for <lists+xen-devel@lfdr.de>; Tue, 11 May 2021 12:45:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125738.236688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgPt7-0001an-9D; Tue, 11 May 2021 10:45:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125738.236688; Tue, 11 May 2021 10:45:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgPt7-0001XI-61; Tue, 11 May 2021 10:45:17 +0000
Received: by outflank-mailman (input) for mailman id 125738;
 Tue, 11 May 2021 10:45:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y01E=KG=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1lgPt5-0001XC-GC
 for xen-devel@lists.xenproject.org; Tue, 11 May 2021 10:45:15 +0000
Received: from out3-smtp.messagingengine.com (unknown [66.111.4.27])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 74307ffb-c76e-4cac-b82c-d996bdb560c9;
 Tue, 11 May 2021 10:45:15 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id CB1725C0125;
 Tue, 11 May 2021 06:45:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 11 May 2021 06:45:14 -0400
Received: from mail-itl (unknown [91.67.79.4])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 11 May 2021 06:45:13 -0400 (EDT)
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
X-Inumbo-ID: 74307ffb-c76e-4cac-b82c-d996bdb560c9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ckrL5E
	dwv505m1v7gPS9q3iDh+sypyFDIgzQz5gG5Nw=; b=qsibRaSX73r2WWdVUtdrzi
	VabW/wk+ieXgAJiwNUK9FCoBjTXT6Jjr6JGb6C5ncnDdyeXxeVZoqpZOSvx0XyrH
	TdyPqxSIOfJMF/U/wZExm07HY5Q5N3rnyrnSdwThR5Oga0TFIRnHT9nO3Dnvl8O3
	iHjEKAICJeMjG6FqdMTXSbErsU6e7u0x1ERSVPGt3cvS5SSOVZGbTY4vk1Ad5/dd
	LrB5X8+Tb0L7mxhLFY31Nrdc3uwQX/mYQ/d3IzyLKp4un0/RLy09CIBlhR5JG0Tu
	A0toTkleRatVyL4vyEr5g8E6txs9Xb7seCbuciTYEsExIANgUElLeQAezYfQndmA
	==
X-ME-Sender: <xms:OmCaYMzUxWdXOsZfGE_XSXgurvbAcaVDotyYtZalvIWXfSom06tnyA>
    <xme:OmCaYAT_cEhcyLD_w2OkcVqv1knuma4fOQiRXykmRrzh-3NGnV7433_VokX8Vc19j
    eVcAy57QVAg3g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehtddgfeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetveff
    iefghfekhffggeeffffhgeevieektedthfehveeiheeiiedtudegfeetffenucfkpheple
    durdeijedrjeelrdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtg
    homh
X-ME-Proxy: <xmx:OmCaYOWESuTcmUo4muF5cmd2CimZHmEHkDMlHlK4MnfleruhITBk1g>
    <xmx:OmCaYKi_H4Xm39WAK3lB9bQ72fxXjqg8SQrFQ0TTaUODwrM4oSYzog>
    <xmx:OmCaYOBO2c-6Wrd5KimPznLmjWHh_wNX-i1hO8ltDdkEAMQPaplSmQ>
    <xmx:OmCaYBNYKwZfZdLpIxgf6zkQsbkd_pPlXMkXoC3NEIK5cu37b4xsmA>
Date: Tue, 11 May 2021 12:45:10 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
Cc: Michael Brown <mbrown@fensystems.co.uk>, "paul@xen.org" <paul@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"wei.liu@kernel.org" <wei.liu@kernel.org>
Subject: Re: [PATCH] xen-netback: Check for hotplug-status existence before
 watching
Message-ID: <YJpgNvOmDL9SuRye@mail-itl>
References: <54659eec-e315-5dc5-1578-d91633a80077@xen.org>
 <20210413152512.903750-1-mbrown@fensystems.co.uk>
 <YJl8IC7EbXKpARWL@mail-itl>
 <404130e4-210d-2214-47a8-833c0463d997@fensystems.co.uk>
 <YJmBDpqQ12ZBGf58@mail-itl>
 <21f38a92-c8ae-12a7-f1d8-50810c5eb088@fensystems.co.uk>
 <YJmMvTkp2Y1hlLLm@mail-itl>
 <df9e9a32b0294aee814eeb58d2d71edd@EX13D32EUC003.ant.amazon.com>
 <YJpfORXIgEaWlQ7E@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bYEBe4gQw1iCtcBR"
Content-Disposition: inline
In-Reply-To: <YJpfORXIgEaWlQ7E@mail-itl>


--bYEBe4gQw1iCtcBR
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 May 2021 12:45:10 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
Cc: Michael Brown <mbrown@fensystems.co.uk>, "paul@xen.org" <paul@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"wei.liu@kernel.org" <wei.liu@kernel.org>
Subject: Re: [PATCH] xen-netback: Check for hotplug-status existence before
 watching

On Tue, May 11, 2021 at 12:40:54PM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Tue, May 11, 2021 at 07:06:55AM +0000, Durrant, Paul wrote:
> > > -----Original Message-----
> > > From: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.co=
m>
> > > Sent: 10 May 2021 20:43
> > > To: Michael Brown <mbrown@fensystems.co.uk>; paul@xen.org
> > > Cc: paul@xen.org; xen-devel@lists.xenproject.org; netdev@vger.kernel.=
org; wei.liu@kernel.org; Durrant,
> > > Paul <pdurrant@amazon.co.uk>
> > > Subject: RE: [EXTERNAL] [PATCH] xen-netback: Check for hotplug-status=
 existence before watching
> > >=20
> > > On Mon, May 10, 2021 at 08:06:55PM +0100, Michael Brown wrote:
> > > > If you have a suggested patch, I'm happy to test that it doesn't re=
introduce
> > > > the regression bug that was fixed by this commit.
> > >=20
> > > Actually, I've just tested with a simple reloading xen-netfront modul=
e. It
> > > seems in this case, the hotplug script is not re-executed. In fact, I
> > > think it should not be re-executed at all, since the vif interface
> > > remains in place (it just gets NO-CARRIER flag).
> > >=20
> > > This brings a question, why removing hotplug-status in the first plac=
e?
> > > The interface remains correctly configured by the hotplug script after
> > > all. From the commit message:
> > >=20
> > >     xen-netback: remove 'hotplug-status' once it has served its purpo=
se
> > >=20
> > >     Removing the 'hotplug-status' node in netback_remove() is wrong; =
the script
> > >     may not have completed. Only remove the node once the watch has f=
ired and
> > >     has been unregistered.
> > >=20
> > > I think the intention was to remove 'hotplug-status' node _later_ in
> > > case of quickly adding and removing the interface. Is that right, Pau=
l?
> >=20
> > The removal was done to allow unbind/bind to function correctly. IIRC b=
efore the original patch doing a bind would stall forever waiting for the h=
otplug status to change, which would never happen.
>=20
> Hmm, in that case maybe don't remove it at all in the backend, and let
> it be cleaned up by the toolstack, when it removes other backend-related
> nodes?

No, unbind/bind _does_ require hotplug script to be called again.

When exactly vif interface appears in the system (starts to be available
for the hotplug script)? Maybe remove 'hotplug-status' just before that
point?


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--bYEBe4gQw1iCtcBR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmCaYDYACgkQ24/THMrX
1yyAAQf/U2PU/dLfm2NOJ8xQosmw1dIAScvQCAoxIbAXx0JIi/Ets+qgCRvp1thE
/pnLR4gvm2mGYAE/nhxTsTvQfv1rLzvAJqVKfJ1BMISwygiYNyAgErmM0SrdjHvQ
IIfTWBeVy2QzyHG0XcNzoe2ZqSfuTrsaGyTMU6B+LHiq+QR9nnPz9wQiwkuiQZ7f
jLD3XWkUYyqnuC+hefLWByIQPnyzTv4yG2WWWCxDJn62La6nTfUXZINe3OlhLQQW
u0MMs5aPpLU2jLmexUEkoeDeUMXVYdQgYyD37gs7uRAv5B3LNcw3hM/VlDftuX5u
0FKx7A3kpwMxyB3lqPJ8arCG8Ftm8Q==
=iGK7
-----END PGP SIGNATURE-----

--bYEBe4gQw1iCtcBR--

