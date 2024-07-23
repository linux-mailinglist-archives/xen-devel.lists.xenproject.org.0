Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DD3939EC3
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 12:32:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762987.1173232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWCnm-0005Cd-T2; Tue, 23 Jul 2024 10:31:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762987.1173232; Tue, 23 Jul 2024 10:31:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWCnm-0005AG-QU; Tue, 23 Jul 2024 10:31:26 +0000
Received: by outflank-mailman (input) for mailman id 762987;
 Tue, 23 Jul 2024 10:31:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xgPy=OX=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sWCnl-0005A4-PO
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 10:31:25 +0000
Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com
 [103.168.172.150]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3ed034a-48de-11ef-8776-851b0ebba9a2;
 Tue, 23 Jul 2024 12:31:23 +0200 (CEST)
Received: from compute8.internal (compute8.nyi.internal [10.202.2.227])
 by mailfout.nyi.internal (Postfix) with ESMTP id 8CD8F1380682;
 Tue, 23 Jul 2024 06:31:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute8.internal (MEProxy); Tue, 23 Jul 2024 06:31:20 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 23 Jul 2024 06:31:17 -0400 (EDT)
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
X-Inumbo-ID: b3ed034a-48de-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1721730680;
	 x=1721817080; bh=F6dceGM1PsJvT3r/NvLgNCBbnfj32fBLf4rPr4Xvvls=; b=
	BF9+WumJs7YJHF2Od2YbFw6Q+CalWgGYS81quuGdxcqjnoNsZESACPobJkNHWO61
	jQByok5BnO0DLXcE+nKKETC42sL2SBPKSEf4QdP3Gi3JHg/GH+gbTuf7YOIyIGCK
	s+dpKNO0RMlySZlcnWdP8UaWDoioD11C8GdRKjd73lBoYXG7l5yvNhzaMLD2nz4m
	uvhotX/PJzt4uDmZBEGuo/BBLaK3ip+5rmmDwV1uXoiJekIaxtTaqygU1YrUSQiM
	PY7K+fPX+UPFL1Et2OD7k6kOvYSocCs31gnbNZ/5KyZM5ac+485+T2MqXBV/HzKO
	i65NCiBV4DqUcqIjBuAIFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1721730680; x=1721817080; bh=F6dceGM1PsJvT3r/NvLgNCBbnfj3
	2fBLf4rPr4Xvvls=; b=X20WAonSoIOyF7ACJLzFg2mCGWS+hITaP5gLD/Rf+Y0B
	Lmu5Wsxtjz6Dtx/jr1RWDOScfSaroRialDGqTdJQ6pVtkP0ACDpQFXJ15GMcr/AI
	Z6uLfoHUymTz2tfI1T4TZG/MiJuLpn9cw+nnIw5gH6K4zhHRWe9eyrV4cWZtbXAy
	v/pkX0woU+owbRdMlbKeMeoNNqhgdn0KFw3wwmk3b07c75TY2kwbV6JJBSr5q99O
	Rx4a0B2/12RNzpFZkF6+2rpOfW5ojFAsU6UAo2nEt7LoeefBqJj/NiSyEAh3Nbsd
	Cku/ZzvDAK8c4N/GRzkGDIhK4xtBnyMLuSryUs42Gw==
X-ME-Sender: <xms:eIafZuInv_VJ1tTIhPr_Yk6YPGsUKmQduih_1ryqspvJHs8d-oSdRg>
    <xme:eIafZmIjh2gopq7jkvXXWQ2PkcoxaHMkeFi1hRZNvOph4_blOlc2BM4LlyIuZ_nf3
    SFxyl88bcWcYQ>
X-ME-Received: <xmr:eIafZut0DH30kfbxv02qyHUT6RzZgJp_7nQqlD7hodVyZgos8RPoo3I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrheelgddvlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeelgfeg
    ieehueefudeuvdejudeiiefgteekleefleejudehieeujeeujeeftedtteenucffohhmrg
    hinhepgigtphdqnhhgrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomhdpnhgspghrtghpthhtoheptd
X-ME-Proxy: <xmx:eIafZjZW4EbHiLyHbWF6ltcP8boaxu8B60V2AoUjg9AdEX0L8oSvLA>
    <xmx:eIafZlb9BEVjQ4elAJPHfe2yAs9gFTOURM7d20QKVuvdb6OH4WRkuA>
    <xmx:eIafZvC96X4dZOiWTYe3g8Wpvs0d3OnCSBsk-4GWYo31EX4qdNp9qA>
    <xmx:eIafZrYQCbacLCs0BNnC1iaIUDFDe9pBEzsA_7y-aBsib1yf3yiuow>
    <xmx:eIafZqNJrmFRIN257GLiX-yTQqny8-rDTsKbqdpZGxUzO0WB--w0vpH0>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 23 Jul 2024 12:31:15 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Gene Bright <gene@cyberlight.us>, Jan Beulich <JBeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: Re: [PATCH 2/2] x86/efi: Unlock NX if necessary
Message-ID: <Zp-Gc6oCppUymzqm@mail-itl>
References: <20240722101838.3946983-1-andrew.cooper3@citrix.com>
 <20240722101838.3946983-3-andrew.cooper3@citrix.com>
 <Zp-FHHYmCj_Tu7DQ@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VjUgvXfScnEwL0nk"
Content-Disposition: inline
In-Reply-To: <Zp-FHHYmCj_Tu7DQ@mail-itl>


--VjUgvXfScnEwL0nk
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jul 2024 12:31:15 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Gene Bright <gene@cyberlight.us>, Jan Beulich <JBeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: Re: [PATCH 2/2] x86/efi: Unlock NX if necessary

On Tue, Jul 23, 2024 at 12:25:32PM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Mon, Jul 22, 2024 at 11:18:38AM +0100, Andrew Cooper wrote:
> > EFI systems can run with NX disabled, as has been discovered on a Broad=
well
> > Supermicro X10SRM-TF system.
> >=20
> > Prior to commit fc3090a47b21 ("x86/boot: Clear XD_DISABLE from the earl=
y boot
> > path"), the logic to unlock NX was common to all boot paths, but that c=
ommit
> > moved it out of the native-EFI booth path.
> >=20
> > Have the EFI path attempt to unlock NX, rather than just blindly refusi=
ng to
> > boot when CONFIG_REQUIRE_NX is active.
> >=20
> > Fixes: fc3090a47b21 ("x86/boot: Clear XD_DISABLE from the early boot pa=
th")
> > Link: https://xcp-ng.org/forum/post/80520
> > Reported-by: Gene Bright <gene@cyberlight.us>
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>=20
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Ugh, wrong copy paste:
Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

I should finish my coffee first...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--VjUgvXfScnEwL0nk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmafhnMACgkQ24/THMrX
1yyiNgf+PhGaKe+BN4NF229jPDkAj3zL29PdiCOnDRAwGg13osNqsC46x7HIWbmA
yapM4cUlXlVdWx6tCcyBqw0brm58X8Hqtn2evsJneJkFdbS7EMdt+pvxI6YMdw/x
X/V4ds6kWfHHBaLqKk77+i41dejeI4zrLt4CqhYCto33sqrA6u4WjGebTKKVnKQQ
YM3SEIrZSlTflUMRM/vzwF49K2MPskvUIP4AZyUU/+dA5mPFfJXJrRIeV5VvQEFY
jjGvD0TxAiZC3b4RBQrO4bl5/ZvIAriX8vzrAXgFfv+4JtV2E9xhGAH7BMKmpeL5
8LCO18/GdDHPoa6a+SqavNGNdYLcPQ==
=hf/8
-----END PGP SIGNATURE-----

--VjUgvXfScnEwL0nk--

