Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A910A84159F
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jan 2024 23:28:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673187.1047428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUa66-000647-Qz; Mon, 29 Jan 2024 22:27:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673187.1047428; Mon, 29 Jan 2024 22:27:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUa66-00061f-O2; Mon, 29 Jan 2024 22:27:22 +0000
Received: by outflank-mailman (input) for mailman id 673187;
 Mon, 29 Jan 2024 22:27:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CoM7=JH=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rUa65-00061Z-AP
 for xen-devel@lists.xenproject.org; Mon, 29 Jan 2024 22:27:21 +0000
Received: from fhigh5-smtp.messagingengine.com
 (fhigh5-smtp.messagingengine.com [103.168.172.156])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ed029c2-bef5-11ee-98f5-efadbce2ee36;
 Mon, 29 Jan 2024 23:27:17 +0100 (CET)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 4A82811400AB;
 Mon, 29 Jan 2024 17:27:16 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 29 Jan 2024 17:27:16 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Jan 2024 17:27:15 -0500 (EST)
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
X-Inumbo-ID: 8ed029c2-bef5-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1706567236;
	 x=1706653636; bh=w8UyFhHLZ2U+3iEngXOOMdob3zQdGvQ/3HGiaHRT0SI=; b=
	lJEML/GpOmm95viGqwfhiizyi7LT5tlXV4E0GKwyayoOaEeySqso2cphtBhRa00K
	XFbNP2Eq+l2ITejE9VX0ax1Agh3X3cVvxSwBo6jYmexZI5MbH3l1Gksc982+sdzD
	KEWhKotqD1I9G5Niq2Fb5JjSeCpDtZJ1tIQNazXlNIhzrVacLS7qm5WbI67xUAf6
	gY9fCuLqcZiExPv2mLf3d6cBwhQ1+O3zmRtEAzVdmiPG6BS4S7Gbq1hMTkPx45t/
	zFzTCBx7lt6wO64qOvI3MlxGr470rXK1lgfFlBBkxG/zPYaa83gYkBOCR7RsNjof
	1f0j6Sd4zYGPkQ95ojFsrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1706567236; x=1706653636; bh=w8UyFhHLZ2U+3iEngXOOMdob3zQd
	GvQ/3HGiaHRT0SI=; b=Z1U+eMCfrpcgD/DcsggAu2f7rgqLNFagP2FtyyaRBDLD
	xENaqR2p38G8q/WdNbdTXJu0SyJoPJovwoM8DL3UBbxpkgoztPJI5DN+M5JfRhao
	yLsjw/W+IE4GuPGINDruPfT9o/QVcPAscBdl3utjsQ4xY+7PerNV/G52pbSuQwbJ
	1t0dc5oEmZEFv9sPw78Pp7fXsdonQ4XKk5rt6yVAntYRk3PUn+2vj2CsLFPQ8NfG
	5nVleD6Av/D7CKT5OMIK+icox24Y3GdhIwKufMt2nq0jgBhIXbY3UkChDvCG3s5o
	5W2hnM7wstsXMHoj1mp1G1/gqVrY33e4bljTJrEHGA==
X-ME-Sender: <xms:Qya4ZZ132_SyREX1Z_81pc24CZ-DlayCQInw_SScheFWTB5Hf9CQnA>
    <xme:Qya4ZQEYmyHlYoiRteA6Xemxye9fwdOJm4ugVOnrCEufn9C5aaKFdTv_Kg-_SkGmg
    b-3OBvcDnMWtw>
X-ME-Received: <xmr:Qya4ZZ525px9Zk3O2ucTwPx3abLJlYk-8VImkWKAMEufnDw5wcYOAxFzRdZD-FBdtU_6tP41OG9QIOwllX8msezSEY6_mnyq3g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrfedtgedgudehtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    udelteefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:Qya4ZW3hPX__2G5YLPP2-aLiFm7Tly_kWiLXfCBu0MGFgj0K5CL_QQ>
    <xmx:Qya4ZcGtoFhaYR8kU4SNQwBfhUVPiGS5NtIM15iW-zyCQ2zKo94hRg>
    <xmx:Qya4ZX_9VyVTrryaqQ3SIOAW14fXjHfZyOjjcWOIVK-sqdgqX8Q2Mg>
    <xmx:RCa4ZWPNFDmfyKRFiLI18rN9UJ7w3LtzJGTqSie6VmmOQCMpa2x_kA>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 29 Jan 2024 23:27:12 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Linux 6.7-rc1+: WARNING at drivers/xen/evtchn.c:167
 evtchn_interrupt
Message-ID: <ZbgmQaFTg1Vci9by@mail-itl>
References: <ZWf0sWey05VnpH7X@mail-itl>
 <258abfda-5f71-4e75-a3a5-abdad85a85f3@suse.com>
 <ZWulvo8Frbm2WNEk@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="q888yusyRgNCvsrd"
Content-Disposition: inline
In-Reply-To: <ZWulvo8Frbm2WNEk@mail-itl>


--q888yusyRgNCvsrd
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jan 2024 23:27:12 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Linux 6.7-rc1+: WARNING at drivers/xen/evtchn.c:167
 evtchn_interrupt

On Sat, Dec 02, 2023 at 10:46:38PM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Fri, Dec 01, 2023 at 09:29:30AM +0100, Juergen Gross wrote:
> > Hi Marek,
> >=20
> > On 30.11.23 03:34, Marek Marczykowski-G=C3=B3recki wrote:
> > > Hi,
> > >=20
> > > While testing 6.7-rc3 on Qubes OS I found several warning like in the
> > > subject in dom0 log. I see them when running 6.7-rc1 too. I'm not sure
> > > what exactly triggers the issue, but my guess would be unbinding an
> > > event channel from userspace (closing vchan connection).
> > >=20
> > > Specific message:
> > >=20
> > > [   83.973377] ------------[ cut here ]------------
> > > [   83.975523] Interrupt for port 77, but apparently not enabled; per=
-user 00000000a0e9f1d1
> >=20
> > Just a guess, but I think this might happen when the vchan connection
> > is closed while there is still some traffic. This could result in events
> > triggering in parallel to unbinding the event channel.
> >=20
> > Could you please test the attached patch (only compile tested)?
>=20
> Unfortunately that doesn't help, I get exactly the same traceback.

Hi, this is still an issue on 6.7.2, any other ideas?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--q888yusyRgNCvsrd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmW4JkEACgkQ24/THMrX
1yyhEAgAmJpL94AHf2PMFAR6AikClfeJBOOymbCV/XEifsurvOuriUOb6y66PSLZ
+DnM1wEOCEHW3bReVfd121sc4bvf3QsG3agfVDxIJ//uqekh0xRJuXFmd7HEbAu/
x4JkAByGgWgL338UjdxeWtYWbQAx0LI+88BOqTTr/UbeuTrPOjHeY4GTE/m/Tkba
ID5BxQWgE7lRrGbgAvRiw4Sk7PpgT1rCF1HOsrbUYcVYsZJvMB1ozjDVWiqcVjUt
We1nV53/NdOJjhzlZrMbdFYHiyPsp0tS8Kz8Zq3JEhf44LBm0NU7ksNpux23/WXq
13JZXPqw3yCJcfMGJUDo9yFowEZBuA==
=hx9k
-----END PGP SIGNATURE-----

--q888yusyRgNCvsrd--

